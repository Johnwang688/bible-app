"""The plan's automated checks on pilot summaries (docs/plans/commentary.md, CM-4).

Usage: python check_summaries.py <repo root> <pilot dir> [--themes <themes json>]

Hard failures make the exit code 1. Warnings are for a human to read. Writes <pilot>/checks-report.json.
"""
from __future__ import annotations

import argparse
import collections
import json
import re
import sys
from pathlib import Path

ARCHAIC = (
    "unto saith thee thou thy thine ye hath doth dost art' shalt wilt wherefore whosoever whomsoever verily begat begot "
    "hither thither whither thence hence yea nay lo behold spake sware wast wert methinks forsooth peradventure "
    "henceforth heretofore therein thereof thereto whereof whereby wherein"
).split()
ETH_OK = {"topheth", "seth", "japheth", "nazareth", "elizabeth", "teeth", "beneath", "kenneth", "tubal-cain", "shibboleth", "ashtoreth", "lilith", "macbeth", "gath-hepher"}
ETH_RE = re.compile(r"\b[a-z]{3,}eth\b")
TEMPLATE_PHRASES = ["it pictures his care", "through the line that", "this chapter tells", "in this chapter", "this psalm is about"]
# Plan: title at most 8 words, 3-5 sentences, 3-5 key points. Word bounds are ours.
TITLE_MAX = 8
SENT_MIN, SENT_MAX = 3, 5
KP_MIN, KP_MAX = 3, 5
SUMMARY_WORDS = (40, 140)
KP_WORDS = (4, 30)
RUN_LIMIT = 12
FK_WARN = 9.5
ABBREV = re.compile(r"\b(?:v|vv|e\.g|i\.e|cf|St|Mt|Mr|Mrs|Dr|ch)\.$")


def words(text: str) -> list[str]:
    text = text.lower().replace("’", "'").replace("‘", "'")
    return re.findall(r"[a-z0-9]+(?:'[a-z0-9]+)?", text)


def sentences(text: str) -> list[str]:
    parts = re.split(r"(?<=[.!?])[\"”’)]*\s+(?=[\"“‘(]?[A-Z0-9])", text.strip())
    out: list[str] = []
    for p in parts:
        if out and ABBREV.search(out[-1]):
            out[-1] += " " + p
        else:
            out.append(p)
    return [s for s in out if s.strip()]


def syllables(word: str) -> int:
    word = re.sub(r"[^a-z]", "", word.lower())
    if not word:
        return 0
    n = len(re.findall(r"[aeiouy]+", word))
    if word.endswith("e") and not word.endswith("le") and n > 1:
        n -= 1
    return max(n, 1)


def fk_grade(text: str) -> float:
    w = words(text)
    s = max(len(sentences(text)), 1)
    return 0.39 * len(w) / s + 11.8 * sum(syllables(x) for x in w) / max(len(w), 1) - 15.59


def load_shingles(source: Path, limit: int) -> dict[str, set]:
    """Every run of limit+1 words in each English translation, within a chapter, as a set of hashes."""
    translations = {}
    for name in ("BSB", "WEB", "ASV"):
        chapters: dict[tuple, list] = collections.defaultdict(list)
        with open(source / "verses" / f"{name}.jsonl", encoding="utf-8") as f:
            for line in f:
                v = json.loads(line)
                chapters[(v["book_number"], v["chapter"])].append((v["verse"], v["text"]))
        grams = set()
        for rows in chapters.values():
            tokens = [t for _, text in sorted(rows) for t in words(text)]
            for i in range(len(tokens) - limit):
                grams.add(hash(tuple(tokens[i : i + limit + 1])))
        translations[name] = grams
    return translations


def longest_run(text_words: list[str], chapter_tokens: list[str]) -> int:
    """Longest shared word run with the chapter (dynamic programming)."""
    best = 0
    prev = [0] * (len(chapter_tokens) + 1)
    for a in text_words:
        cur = [0] * (len(chapter_tokens) + 1)
        for j, b in enumerate(chapter_tokens, 1):
            if a == b:
                cur[j] = prev[j - 1] + 1
                best = max(best, cur[j])
        prev = cur
    return best


def check_refs_in_text(text: str, book: str, chapter: int, last: int, errors: list[str], where: str) -> None:
    for m in re.finditer(r"\b(?:verses?|vv?\.)\s*(\d+)(?:\s*(?:-|–|to|and)\s*(\d+))?", text, flags=re.I):
        for g in m.groups():
            if g and not 1 <= int(g) <= last:
                errors.append(f"{where}: reference '{m.group(0)}' is outside 1-{last}")
    for m in re.finditer(r"\b(\d+):(\d+)\b", text):
        if int(m.group(1)) != chapter or not 1 <= int(m.group(2)) <= last:
            errors.append(f"{where}: reference '{m.group(0)}' is outside the chapter")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("repo", type=Path)
    ap.add_argument("pilot", type=Path)
    ap.add_argument("--themes", type=Path)
    ap.add_argument("--inputs", default="inputs", help="input folder inside the pilot dir")
    ap.add_argument("--report", default="checks-report.json")
    a = ap.parse_args()
    shingles = load_shingles(a.repo / "content" / "source", RUN_LIMIT)

    report: dict[str, dict] = {}
    openings = collections.Counter()
    fails = 0
    names = sorted(p.stem for p in (a.pilot / a.inputs).glob("*.json"))
    for name in names:
        src = json.loads((a.pilot / a.inputs / f"{name}.json").read_text(encoding="utf-8"))
        errors: list[str] = []
        warnings: list[str] = []
        out_path = a.pilot / "output" / f"{name}.json"
        if not out_path.exists():
            report[name] = {"errors": ["no output file"], "warnings": []}
            fails += 1
            continue
        try:
            o = json.loads(out_path.read_text(encoding="utf-8"))
        except ValueError as exc:
            report[name] = {"errors": [f"bad JSON: {exc}"], "warnings": []}
            fails += 1
            continue
        verse_nums = {v["verse"] for v in src["verses"]}
        last = max(verse_nums)
        chapter_text = " ".join(v["text"] for v in src["verses"])
        chapter_tokens = words(chapter_text)

        for field, kind in (("title", str), ("summary", str), ("key_points", list), ("generated_by", str), ("spec_version", str)):
            if not isinstance(o.get(field), kind):
                errors.append(f"field {field} missing or wrong type")
        if o.get("book") != src["book"] or o.get("chapter") != src["chapter"]:
            errors.append("book or chapter does not match the input")
        if errors:
            report[name] = {"errors": errors, "warnings": warnings}
            fails += 1
            continue

        title, summary, kps = o["title"].strip(), o["summary"].strip(), o["key_points"]
        tw = title.split()
        if not tw or len(tw) > TITLE_MAX:
            errors.append(f"title has {len(tw)} words")
        sents = sentences(summary)
        short = len(verse_nums) <= 6
        if not (2 if short else SENT_MIN) <= len(sents) <= SENT_MAX:
            errors.append(f"summary has {len(sents)} sentences")
        sw = words(summary)
        if not (25 if short else SUMMARY_WORDS[0]) <= len(sw) <= SUMMARY_WORDS[1]:
            errors.append(f"summary has {len(sw)} words")
        if not (2 if short else KP_MIN) <= len(kps) <= KP_MAX:
            errors.append(f"{len(kps)} key points")
        kp_text = []
        for i, kp in enumerate(kps, 1):
            text = (kp.get("text") or "").strip()
            kp_text.append(text)
            kw = words(text)
            if not KP_WORDS[0] <= len(kw) <= KP_WORDS[1]:
                errors.append(f"key point {i} has {len(kw)} words")
            vs, ve = kp.get("verse_start"), kp.get("verse_end")
            if not isinstance(vs, int) or vs not in verse_nums:
                errors.append(f"key point {i}: verse_start {vs!r} is not in the chapter")
            if ve is not None and (not isinstance(ve, int) or ve not in verse_nums or ve < vs):
                errors.append(f"key point {i}: verse_end {ve!r} is not valid")

        everything = " ".join([title, summary, *kp_text])
        low = everything.lower().replace("’", "'")
        lw = words(everything)
        for w in ARCHAIC:
            # Hyphenated names such as Lo-ammi aren't the archaic word.
            if w in lw and re.search(rf"(?<![\w-]){re.escape(w)}(?![\w-])", low):
                errors.append(f"archaic word: {w}")
        for m in ETH_RE.findall(low):
            if m not in ETH_OK and not m.endswith("ieth") and m not in {"sixth"}:
                errors.append(f"archaic -eth word: {m}")
        for phrase in TEMPLATE_PHRASES:
            if phrase in low:
                warnings.append(f"template phrase: {phrase}")

        for part_name, part in (("title", title), ("summary", summary), *[(f"key point {i}", t) for i, t in enumerate(kp_text, 1)]):
            pw = words(part)
            for i in range(len(pw) - RUN_LIMIT):
                h = hash(tuple(pw[i : i + RUN_LIMIT + 1]))
                hits = [t for t, grams in shingles.items() if h in grams]
                if hits:
                    errors.append(f"{part_name}: verbatim run over {RUN_LIMIT} words from {hits}: {' '.join(pw[i:i+RUN_LIMIT+1])}")
                    break
            check_refs_in_text(part, src["book"], src["chapter"], last, errors, part_name)

        grade = round(fk_grade(summary), 1)
        if grade > FK_WARN:
            warnings.append(f"reading grade {grade}")
        run = max(longest_run(words(p), chapter_tokens) for p in [summary, *kp_text])
        openings[" ".join(sw[:3])] += 1
        report[name] = {
            "errors": errors, "warnings": warnings, "words": len(sw), "sentences": len(sents), "grade": grade,
            "longest_run_vs_bsb": run, "title": title,
        }
        fails += bool(errors)

    for op, n in openings.items():
        if n > 3:
            for name, r in report.items():
                r.setdefault("warnings", [])
            print(f"warning: {n} summaries open with '{op}'")
    summary = {
        "chapters": len(names), "failed": fails,
        "errors": sum(len(r["errors"]) for r in report.values()),
        "warnings": sum(len(r["warnings"]) for r in report.values()),
        "repeated_openings": {k: v for k, v in openings.items() if v > 3},
        "mean_words": round(sum(r.get("words", 0) for r in report.values()) / max(len(report), 1), 1),
        "mean_grade": round(sum(r.get("grade", 0) for r in report.values()) / max(len(report), 1), 1),
        "max_run_vs_bsb": max((r.get("longest_run_vs_bsb", 0) for r in report.values()), default=0),
    }
    (a.pilot / a.report).write_text(json.dumps({"summary": summary, "chapters": report}, ensure_ascii=False, indent=1) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps(summary, ensure_ascii=False))
    for name, r in report.items():
        for e in r["errors"]:
            print(f"ERROR {name}: {e}")
        for w in r["warnings"]:
            print(f"warn  {name}: {w}")
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
