"""Write reviewed person cards into the repo's content.

Usage: python scripts/content/apply_cards.py <cards dir> <mention-map.json>

Each card replaces its person's overview and timeline and adds `card`, in people/people.json and in
the `profile` of content/source/summary_entities.jsonl. The generic entries John retired go, and
their chapter tags move to the specific people in the mention map. `jeconiah` merges into
`jehoiachin`. A link keeps its slug even if that person has no entry yet, so it comes alive when
they're released; the app must show such a link as plain text. People with no card keep their old
entry.
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "content" / "source"
RETIRED = {"herod", "james", "alexander", "darius", "hanani", "jeconiah"}
MERGED = {"jeconiah": "jehoiachin"}
CREATED_AT = "2026-11-06T00:00:00+00:00"


def compact(row: dict) -> str:
    return json.dumps(row, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def read_jsonl(path: Path) -> list[dict]:
    lines = path.read_text(encoding="utf-8").splitlines()
    rows = [json.loads(line) for line in lines]
    for line, row in zip(lines, rows):
        if compact(row) != line:
            raise SystemExit(f"{path.name}: a row doesn't round-trip, so writing the file would change it")
    return rows


def write_jsonl(path: Path, rows: list[dict]) -> None:
    path.write_text("".join(compact(r) + "\n" for r in rows), encoding="utf-8", newline="\n")


def set_manifest(names_rows: dict[str, int]) -> None:
    path = SOURCE / "MANIFEST.json"
    text = path.read_text(encoding="utf-8")
    manifest = json.loads(text)
    for name, rows in names_rows.items():
        entry = manifest["files"][name]
        new = hashlib.sha256((SOURCE / name).read_bytes()).hexdigest()
        block = re.compile(rf'("{re.escape(name)}": \{{\s*"rows": ){entry["rows"]}(,\s*"sha256": "){entry["sha256"]}"')
        text, count = block.subn(rf'\g<1>{rows}\g<2>{new}"', text)
        if count != 1:
            raise SystemExit(f"manifest entry not found: {name}")
        table = entry["table"]
        text, count = re.subn(rf'("{table}": ){manifest["tables"][table]}\b', rf"\g<1>{rows}", text)
        if count != 1:
            raise SystemExit(f"manifest table not found: {table}")
    path.write_text(text, encoding="utf-8", newline="\n")


def chapter_index() -> dict[str, int]:
    books = {b["book_number"]: b["name_en"] for b in read_books()}
    index = {}
    for line in (SOURCE / "commentaries.jsonl").read_text(encoding="utf-8").splitlines():
        r = json.loads(line)
        if r["source"] == "summary":
            index[f"{books[r['book_number']]} {r['chapter']}"] = r["id"]
    return index


def read_books() -> list[dict]:
    return [json.loads(line) for line in (SOURCE / "books.jsonl").read_text(encoding="utf-8").splitlines()]


def main() -> None:
    cards_dir, map_path = Path(sys.argv[1]), Path(sys.argv[2])
    cards = {p.stem: json.loads(p.read_text(encoding="utf-8"))["entry"] for p in cards_dir.glob("*.json")}
    mention_map = json.loads(map_path.read_text(encoding="utf-8"))

    people_path = ROOT / "people" / "people.json"
    people = [e for e in json.loads(people_path.read_text(encoding="utf-8")) if e["slug"] not in RETIRED]
    by_slug = {e["slug"]: e for e in people}
    by_slug.update(cards)
    merged = [by_slug[k] for k in sorted(by_slug)]
    people_path.write_text(json.dumps(merged, ensure_ascii=False, indent=2) + "\n", encoding="utf-8", newline="\n")

    entities = read_jsonl(SOURCE / "summary_entities.jsonl")
    mentions = read_jsonl(SOURCE / "commentary_entity_mentions.jsonl")
    person = {e["slug"]: e for e in entities if e["kind"] == "person"}
    next_id = max(e["id"] for e in entities) + 1
    for slug, card in cards.items():
        row = person.get(slug)
        if row is None:
            row = {"created_at": CREATED_AT, "id": next_id, "kind": "person", "label": card["label"], "profile": None, "slug": slug}
            next_id += 1
            entities.append(row)
            person[slug] = row
        row["label"] = card["label"]
        row["profile"] = {"overview": card["overview"], "timeline": card["timeline"], "card": card["card"]}

    chapters = chapter_index()
    retired_ids = {person[s]["id"]: s for s in RETIRED}
    orders: dict[int, int] = {}
    for m in mentions:
        orders[m["commentary_id"]] = max(orders.get(m["commentary_id"], 0), m.get("sort_order") or 0)
    kept = [m for m in mentions if m["entity_id"] not in retired_ids]
    have = {(m["commentary_id"], m["entity_id"]) for m in kept}

    def add(commentary_id: int, slug: str) -> None:
        pair = (commentary_id, person[slug]["id"])
        if pair not in have:
            orders[commentary_id] = orders.get(commentary_id, 0) + 1
            kept.append({"commentary_id": commentary_id, "entity_id": pair[1], "sort_order": orders[commentary_id]})
            have.add(pair)

    for m in mentions:
        if retired_ids.get(m["entity_id"]) in MERGED:
            add(m["commentary_id"], MERGED[retired_ids[m["entity_id"]]])
    for slugs_by_chapter in mention_map["retired"].values():
        for chapter, slugs in slugs_by_chapter.items():
            for slug in slugs:
                if slug in person:
                    add(chapters[chapter], slug)
    for slug, names in mention_map["new_cards"].items():
        for chapter in names:
            add(chapters[chapter], slug)
    entities = [e for e in entities if e["id"] not in retired_ids]
    write_jsonl(SOURCE / "summary_entities.jsonl", sorted(entities, key=lambda e: e["id"]))
    write_jsonl(SOURCE / "commentary_entity_mentions.jsonl", kept)
    set_manifest({"summary_entities.jsonl": len(entities), "commentary_entity_mentions.jsonl": len(kept)})
    print(len(cards), "cards;", len(entities), "entities;", len(kept), "mentions")


if __name__ == "__main__":
    main()
