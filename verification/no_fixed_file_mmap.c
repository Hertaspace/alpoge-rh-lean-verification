// LD_PRELOAD shim for the build server's map-count limit.
//
// Lean maps each imported .olean/.ir file with a file-backed mmap at a fixed address
// (MAP_FIXED_NOREPLACE). Each such mapping costs one kernel map entry, and the build server
// limits a process to vm.max_map_count = 65530 entries, which cannot be raised inside its
// container. Modules near the top of this project import about 200,000 files and hit the limit.
//
// After the first NOMMAP_THRESHOLD (default 40000) such mappings in a process, this shim makes
// further ones fail with EEXIST. Lean then takes its built-in fallback, which it also takes on
// any address collision: it reads the file into an ordinary heap buffer and relocates the
// pointers. Heap memory is anonymous, and the kernel merges it into few map entries.
//
// Below the threshold nothing changes, and all other mmap calls pass through unmodified.
// The compiled output is unaffected: .olean files built with and without the shim are
// byte-identical (see VERIFICATION.md).
//
// Build: gcc -O2 -shared -fPIC -o no_fixed_file_mmap.so no_fixed_file_mmap.c -ldl
#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/types.h>

#ifndef MAP_FIXED_NOREPLACE
#define MAP_FIXED_NOREPLACE 0x100000
#endif

typedef void *(*mmap_fn)(void *, size_t, int, int, int, off_t);

static long threshold = -1;
static long count = 0;

static int refuse(int flags, int fd) {
    if (fd < 0 || !(flags & MAP_FIXED_NOREPLACE)) return 0;
    if (threshold < 0) {
        const char *s = getenv("NOMMAP_THRESHOLD");
        threshold = s ? atol(s) : 40000;
    }
    return __atomic_add_fetch(&count, 1, __ATOMIC_RELAXED) > threshold;
}

static void *forward(const char *sym, void *addr, size_t len, int prot, int flags, int fd, off_t off) {
    mmap_fn real = (mmap_fn)dlsym(RTLD_NEXT, sym);
    return real(addr, len, prot, flags, fd, off);
}

void *mmap(void *addr, size_t len, int prot, int flags, int fd, off_t off) {
    if (refuse(flags, fd)) {
        errno = EEXIST;
        return MAP_FAILED;
    }
    return forward("mmap", addr, len, prot, flags, fd, off);
}

void *mmap64(void *addr, size_t len, int prot, int flags, int fd, off_t off) {
    if (refuse(flags, fd)) {
        errno = EEXIST;
        return MAP_FAILED;
    }
    return forward("mmap64", addr, len, prot, flags, fd, off);
}
