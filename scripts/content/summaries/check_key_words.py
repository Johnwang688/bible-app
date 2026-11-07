"""Key word checks for the full summary run. Same input, same result.

Usage: python check_key_words.py <inputs dir> <output dir>

K0: every candidate is decided in `key_words`, and nothing else is.
K1: a central word with keep rule `always` appears in the title, summary or key points.
K2: a word on a central key word's avoid list doesn't stand in for it.
K3: a `floor` word is marked central.
"""
import json
import re
import sys
from pathlib import Path


def pattern(forms):
    return re.compile(r"(?<!\w)(?:" + "|".join(re.escape(f) for f in sorted(forms, key=len, reverse=True)) + r")(?!\w)", re.I)


def text_of(doc):
    return "\n".join([doc.get("title", ""), doc.get("summary", "")] + [p.get("text", "") for p in doc.get("key_points", [])])


def main():
    inputs, outputs = Path(sys.argv[1]), Path(sys.argv[2])
    errors = count = 0

    def err(name, message):
        nonlocal errors
        print("ERROR", name, message)
        errors += 1

    for p in sorted(inputs.glob("*.json")):
        o = outputs / p.name
        if not o.exists():
            err(p.stem, "no output file")
            continue
        count += 1
        doc = json.load(open(o, encoding="utf8"))
        text = text_of(doc)
        cands = {w["slug"]: w for w in json.load(open(p, encoding="utf8"))["key_word_candidates"]}
        decided = {d.get("slug"): d.get("central") for d in doc.get("key_words", []) if isinstance(d, dict)}
        if set(decided) != set(cands):
            err(p.stem, f"K0 key_words differ from candidates: {sorted(set(decided) ^ set(cands))}")
        for slug, w in cands.items():
            central = decided.get(slug) is True
            has = pattern(w["forms"]).search(text)
            if w["floor"] and not central:
                err(p.stem, f"K3 floor word not central: {w['word']}")
            if central and w["keep_rule"] == "always" and not has:
                err(p.stem, f"K1 must-keep word missing: {w['word']}")
            if central and not has:
                for a in w["avoid"]:
                    if pattern([a]).search(text):
                        err(p.stem, f"K2 '{a}' stands in for {w['word']}")
    print(f"{count} chapters, {errors} key word errors")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
