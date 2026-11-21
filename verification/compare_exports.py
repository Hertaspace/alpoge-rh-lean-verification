#!/usr/bin/env python3
"""Compare two lean4export (format 3.1.0) files up to renumbering.

Exports number names, levels and expressions in order of first use, so two exports of the
same declarations made with different root lists differ byte for byte. This script resolves
every reference, hashes each expression structurally, and compares the declarations by name.

Usage: compare_exports.py A.ndjson B.ndjson
Exit status 0 if every declaration present in both files is identical. Declarations present
in only one file are listed but do not by themselves cause failure.
"""
import hashlib
import json
import sys

NAME_KEYS = {"name", "all", "levelParams", "typeName", "induct", "ctor", "ctors", "pre", "param"}
EXPR_KEYS = {"type", "value", "body", "fn", "arg", "struct", "rhs"}


def h(*parts):
    m = hashlib.sha256()
    for p in parts:
        m.update(p.encode() if isinstance(p, str) else p)
        m.update(b"\x00")
    return m.hexdigest()


def load(path):
    names = {0: ""}
    levels = {0: "0"}
    exprs = {}
    decls = {}
    types = {}

    def nm(i):
        return names[i]

    def lv(i):
        return levels[i]

    def canon(obj, key=None):
        """Replace references inside a declaration record by resolved values."""
        if isinstance(obj, dict):
            if key == "ctors":  # top-level list of constructor records
                pass
            return {k: canon(v, k) for k, v in sorted(obj.items())}
        if isinstance(obj, list):
            return [canon(v, key) for v in obj]
        if isinstance(obj, bool) or not isinstance(obj, int):
            return obj
        if key in NAME_KEYS:
            return "N:" + nm(obj)
        if key in EXPR_KEYS:
            return "E:" + exprs[obj]
        return obj

    with open(path) as f:
        for line in f:
            d = json.loads(line)
            if "in" in d:
                i = d["in"]
                if "str" in d:
                    s = d["str"]
                    p = names[s["pre"]]
                    names[i] = (p + "." if p else "") + s["str"]
                else:
                    s = d["num"]
                    p = names[s["pre"]]
                    names[i] = (p + "." if p else "") + str(s["i"])
            elif "il" in d:
                i = d["il"]
                if "succ" in d:
                    levels[i] = "s(" + lv(d["succ"]) + ")"
                elif "max" in d:
                    a, b = d["max"]
                    levels[i] = "max(" + lv(a) + "," + lv(b) + ")"
                elif "imax" in d:
                    a, b = d["imax"]
                    levels[i] = "imax(" + lv(a) + "," + lv(b) + ")"
                elif "param" in d:
                    levels[i] = "p(" + nm(d["param"]) + ")"
                else:
                    raise ValueError(line)
            elif "ie" in d:
                i = d["ie"]
                if "app" in d:
                    e = h("app", exprs[d["app"]["fn"]], exprs[d["app"]["arg"]])
                elif "lam" in d or "forallE" in d:
                    k = "lam" if "lam" in d else "forallE"
                    b = d[k]
                    e = h(k, nm(b["name"]), b["binderInfo"], exprs[b["type"]], exprs[b["body"]])
                elif "letE" in d:
                    b = d["letE"]
                    e = h("letE", nm(b["name"]), str(b["nondep"]), exprs[b["type"]],
                          exprs[b["value"]], exprs[b["body"]])
                elif "const" in d:
                    c = d["const"]
                    e = h("const", nm(c["name"]), *[lv(u) for u in c["us"]])
                elif "proj" in d:
                    p = d["proj"]
                    e = h("proj", nm(p["typeName"]), str(p["idx"]), exprs[p["struct"]])
                elif "sort" in d:
                    e = h("sort", lv(d["sort"]))
                elif "bvar" in d:
                    e = h("bvar", str(d["bvar"]))
                elif "natVal" in d:
                    e = h("natVal", str(d["natVal"]))
                elif "strVal" in d:
                    e = h("strVal", d["strVal"])
                else:
                    raise ValueError(line[:200])
                exprs[i] = e
            elif "meta" in d:
                continue
            else:
                (kind, body), = d.items()
                c = json.dumps(canon(body), sort_keys=True, ensure_ascii=False)
                if kind == "inductive":
                    keyname = nm(body["types"][0]["name"])
                else:
                    keyname = nm(body["name"])
                decls[(kind, keyname)] = h(kind, c)
                if "type" in body:
                    types[(kind, keyname)] = exprs[body["type"]]
    return decls, types


def main():
    a_path, b_path = sys.argv[1], sys.argv[2]
    a, ta = load(a_path)
    b, tb = load(b_path)
    common = a.keys() & b.keys()
    only_a = sorted(a.keys() - b.keys())
    only_b = sorted(b.keys() - a.keys())
    differ = sorted(k for k in common if a[k] != b[k])
    print(f"declarations: {a_path}: {len(a)}, {b_path}: {len(b)}, common: {len(common)}")
    print(f"identical: {len(common) - len(differ)}, different: {len(differ)}")
    for k in differ[:50]:
        same_type = ta.get(k) is not None and ta.get(k) == tb.get(k)
        print("DIFFERENT", *k, "(same type, different value)" if same_type else "(different type)")
    print(f"only in first: {len(only_a)}")
    for k in only_a[:50]:
        print("ONLY_FIRST", *k)
    print(f"only in second: {len(only_b)}")
    for k in only_b[:50]:
        print("ONLY_SECOND", *k)
    sys.exit(1 if differ else 0)


if __name__ == "__main__":
    main()
