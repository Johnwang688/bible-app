"""Write reviewed chapter summaries into the repo's content.

Usage: python scripts/content/apply_summaries.py <output dir> [<output dir> ...]

Each output dir holds one JSON file per chapter, as the writers in docs/content-workflow.md leave them.
Later dirs win. Every chapter must be present exactly once, so a partial set fails.

Updates commentary/*.json, the `summary` rows of content/source/commentaries.jsonl, its manifest hash,
and the summary rows in the golden commentary fixtures. Row ids stay, and so do the Themes, Key People
and Key Places lines, so commentary_entity_mentions.jsonl keeps pointing at the same rows until the
tag pass replaces them.
"""
from __future__ import annotations

import hashlib
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "content" / "source"
FIXTURES = ROOT / "tests" / "golden" / "fixtures"
TAG_LINES = ("Themes: ", "Key People: ", "Key Places: ")
SPEC_VERSIONS = {"summary-0.2", "summary-1.0"}


def compact(row: dict) -> str:
    return json.dumps(row, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def load_outputs(dirs: list[Path]) -> dict[tuple[int, int], dict]:
    found: dict[tuple[int, int], dict] = {}
    for d in dirs:
        for path in sorted(d.glob("*.json")):
            doc = json.loads(path.read_text(encoding="utf-8"))
            found[(doc["book_number"], doc["chapter"])] = doc
    return found


def verse_ref(book: str, chapter: int, point: dict) -> str:
    start, end = point["verse_start"], point.get("verse_end")
    return f"{book} {chapter}:{start}" + (f"-{end}" if end and end != start else "")


def tag_lines(old_content: str) -> list[str]:
    return [line for line in old_content.splitlines() if line.startswith(TAG_LINES)]


def format_content(doc: dict, tags: list[str]) -> str:
    parts = [f"TITLE::{doc['title'].strip()}", doc["summary"].strip(), *tags]
    parts.append("Key Points:\n" + "\n".join(f"• {p['text'].strip()}" for p in doc["key_points"]))
    verses = " · ".join(verse_ref(doc["book"], doc["chapter"], p) for p in doc["key_points"])
    parts.append(f"Supporting Verses: {verses}")
    return "\n\n".join(parts)


def update_source(docs: dict[tuple[int, int], dict]) -> dict[int, str]:
    path = SOURCE / "commentaries.jsonl"
    lines = path.read_text(encoding="utf-8").splitlines()
    out, content_by_id, seen = [], {}, set()
    for line in lines:
        row = json.loads(line)
        if compact(row) != line:
            raise SystemExit(f"row {row.get('id')} doesn't round-trip, so writing the file would change it")
        if row["source"] == "summary":
            key = (row["book_number"], row["chapter"])
            row["content"] = format_content(docs[key], tag_lines(row["content"]))
            content_by_id[row["id"]] = row["content"]
            seen.add(key)
        out.append(compact(row))
    if seen != set(docs):
        raise SystemExit(f"chapters don't match the summary rows: {sorted(seen ^ set(docs))[:5]}")
    path.write_text("\n".join(out) + "\n", encoding="utf-8", newline="\n")
    return content_by_id


def update_manifest() -> None:
    path = SOURCE / "MANIFEST.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    entry = next(v for k, v in manifest.items() if isinstance(v, dict) and "commentaries.jsonl" in v)["commentaries.jsonl"]
    old = entry["sha256"]
    new = hashlib.sha256((SOURCE / "commentaries.jsonl").read_bytes()).hexdigest()
    path.write_text(path.read_text(encoding="utf-8").replace(old, new), encoding="utf-8", newline="\n")


def update_authoring(docs: dict[tuple[int, int], dict]) -> None:
    for path in sorted((ROOT / "commentary").glob("*.json")):
        entries = json.loads(path.read_text(encoding="utf-8"))
        for entry in entries:
            doc = docs[(entry["book_number"], entry["chapter"])]
            entry.update(
                translation="BSB",
                title=doc["title"].strip(),
                summary_text=doc["summary"].strip(),
                key_points=[p["text"].strip() for p in doc["key_points"]],
                supporting_verses=[verse_ref(doc["book"], doc["chapter"], p) for p in doc["key_points"]],
                evidence_phrases=[],
                generated_by=doc["generated_by"],
                spec_version=doc["spec_version"],
            )
        path.write_text(json.dumps(entries, ensure_ascii=False, indent=2) + "\n", encoding="utf-8", newline="\n")


def update_fixtures(content_by_id: dict[int, str]) -> int:
    changed = 0

    def walk(node) -> None:
        nonlocal changed
        if isinstance(node, dict):
            if node.get("source") == "summary" and node.get("id") in content_by_id:
                node["content"] = content_by_id[node["id"]]
                changed += 1
            for value in node.values():
                walk(value)
        elif isinstance(node, list):
            for value in node:
                walk(value)

    for name in ("commentary_genesis1", "commentary_john3", "commentary_john3_16", "commentary_john3_summary", "commentary_obadiah1"):
        path = FIXTURES / f"{name}.json"
        data = json.loads(path.read_text(encoding="utf-8"))
        walk(data)
        path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8", newline="\n")
    return changed


def main() -> None:
    docs = load_outputs([Path(a) for a in sys.argv[1:]])
    if len(docs) != 1189:
        raise SystemExit(f"expected 1189 chapters, found {len(docs)}")
    bad = sorted(k for k, d in docs.items() if d.get("spec_version") not in SPEC_VERSIONS and "pilot 2" not in d.get("generated_by", ""))
    if bad:
        raise SystemExit(f"chapters without a passed spec: {bad[:5]}")
    for doc in docs.values():
        doc.setdefault("spec_version", "summary-0.2")
    content_by_id = update_source(docs)
    update_manifest()
    update_authoring(docs)
    print(len(content_by_id), "summaries written;", update_fixtures(content_by_id), "fixture rows updated")


if __name__ == "__main__":
    main()
