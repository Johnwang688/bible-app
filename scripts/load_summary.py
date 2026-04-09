"""
Load chapter-level Summary commentary from local JSON files into Supabase.

The commentary/ directory contains per-book JSON files. Each entry covers
one chapter and includes a title, summary text, themes, key people, key
points, and supporting verses.

Usage:
    python scripts/load_summary.py

Requires SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env
"""

from __future__ import annotations

import json
import os
import re
import sys
import time
from pathlib import Path

from dotenv import load_dotenv
from supabase import create_client


load_dotenv()

SUPABASE_URL = os.environ.get("SUPABASE_URL", "")
SUPABASE_KEY = os.environ.get("SUPABASE_SERVICE_ROLE_KEY", "")

SOURCE_ID = "summary"
COMMENTARY_DIR = Path(__file__).parent.parent / "commentary"
BATCH_SIZE = 100


ENTITY_SKIP_LABELS = {
    "light",
    "darkness",
    "earth",
    "heavens",
    "heaven",
    "waters",
    "water",
    "land",
    "the land",
    "firmament",
    "void",
    "sky",
    "deep",
    "the deep",
    "fire",
    "night",
    "day",
    "breath",
    "clay",
    "chaos",
    "sea",
    "clouds",
    "cloud",
    "storm",
    "rain",
    "wind",
    "dust",
    "shadow",
    "glory",
    "spirit",
    "the spirit",
}
PLACE_ABSTRACT_LABELS = {
    "wilderness",
    "the wilderness",
    "mountain",
    "mountains",
    "the mountain",
    "valley",
    "the valley",
    "river",
    "the river",
    "desert",
    "the desert",
    "field",
    "fields",
    "the field",
    "city",
    "the city",
    "town",
    "the town",
    "forest",
    "the forest",
    "cave",
    "the cave",
    "hill",
    "the hill",
    "hills",
    "plain",
    "the plain",
    "shore",
    "coast",
    "border",
    "gate",
    "the gate",
    "road",
    "the road",
    "way",
    "the way",
    "path",
    "the path",
    "camp",
    "the camp",
    "palace",
    "the palace",
    "house",
    "the house",
    "land of canaan",
    "the land of canaan",
}
KNOWN_BIBLICAL_PLACES = {
    "Jerusalem",
    "Bethlehem",
    "Nazareth",
    "Capernaum",
    "Jericho",
    "Samaria",
    "Judea",
    "Galilee",
    "Israel",
    "Judah",
    "Egypt",
    "Babylon",
    "Assyria",
    "Nineveh",
    "Damascus",
    "Eden",
    "Garden of Eden",
    "Promised Land",
    "Canaan",
    "Zion",
    "Mount Zion",
    "Sinai",
    "Mount Sinai",
    "Moriah",
    "Mount Moriah",
    "Jordan",
    "Jordan River",
    "Red Sea",
    "Dead Sea",
    "Sea of Galilee",
    "Bethany",
    "Gethsemane",
    "Golgotha",
    "Patmos",
    "Ephesus",
    "Corinth",
    "Philippi",
    "Thessalonica",
    "Rome",
    "Antioch",
}
PLACE_PREFIX_RE = re.compile(
    r"\b((?:Mount|Mt\.|Sea|River|Valley|Wilderness|Desert|Garden)\s+of\s+[A-Z][A-Za-z'`\-]*(?:\s+[A-Z][A-Za-z'`\-]*){0,2})\b"
)
PROMISED_LAND_RE = re.compile(r"\bpromised land\b", flags=re.IGNORECASE)
LAND_OF_RE = re.compile(r"\bland of ([A-Z][A-Za-z'`\-]*(?:\s+[A-Z][A-Za-z'`\-]*){0,2})\b")


def _dedupe_keep_order(values: list[str]) -> list[str]:
    out: list[str] = []
    seen: set[str] = set()
    for raw in values:
        clean = " ".join((raw or "").strip().split())
        if not clean:
            continue
        folded = clean.casefold()
        if folded in seen:
            continue
        seen.add(folded)
        out.append(clean)
    return out


def _is_skip_label(label: str) -> bool:
    return label.casefold() in ENTITY_SKIP_LABELS


def _is_skip_place_label(label: str) -> bool:
    lower = label.casefold()
    return lower in ENTITY_SKIP_LABELS or lower in PLACE_ABSTRACT_LABELS


def _is_specific_place(label: str) -> bool:
    clean = " ".join((label or "").strip().split())
    if not clean:
        return False
    if _is_skip_place_label(clean):
        return False
    lower = clean.casefold()
    if lower.startswith("the ") and " of " not in lower:
        return False
    return True


def _canonical_place(label: str) -> str:
    clean = " ".join((label or "").strip().split())
    if not clean:
        return ""
    lower = clean.casefold()
    if lower == "promised land":
        return "Promised Land"
    if lower.startswith("land of "):
        return f"Land of {clean[8:].strip()}"
    if lower.startswith("mount "):
        return "Mount " + clean[6:].strip()
    if lower.startswith("mt. "):
        return "Mount " + clean[4:].strip()
    if lower.startswith("sea of "):
        return "Sea of " + clean[7:].strip()
    if lower.startswith("river "):
        return "River " + clean[6:].strip()
    return " ".join(part.capitalize() if part.lower() not in {"of", "the", "and"} else part.lower() for part in clean.split())


def infer_key_places(entry: dict) -> list[str]:
    existing = [str(p) for p in (entry.get("key_places") or [])]
    existing_clean = _dedupe_keep_order([_canonical_place(p) for p in existing if _is_specific_place(p)])
    if existing_clean:
        return existing_clean

    texts: list[str] = []
    for key in ("title", "summary_text"):
        value = entry.get(key)
        if isinstance(value, str) and value.strip():
            texts.append(value)
    for point in entry.get("key_points", []) or []:
        if isinstance(point, str) and point.strip():
            texts.append(point)
    blob = "\n".join(texts)

    candidates: list[str] = []
    for place in KNOWN_BIBLICAL_PLACES:
        if re.search(rf"\b{re.escape(place)}\b", blob):
            candidates.append(place)
    for m in PLACE_PREFIX_RE.finditer(blob):
        candidates.append(m.group(1))
    if PROMISED_LAND_RE.search(blob):
        candidates.append("Promised Land")
    for m in LAND_OF_RE.finditer(blob):
        candidates.append(f"Land of {m.group(1)}")

    cleaned = _dedupe_keep_order([_canonical_place(c) for c in candidates if _is_specific_place(c)])
    return cleaned[:8]


def format_content(entry: dict) -> str:
    """Format a chapter summary entry as structured plain text."""
    lines: list[str] = []

    title = entry.get("title", "").strip()
    if title:
        lines.append(f"TITLE::{title}")
        lines.append("")

    summary = entry.get("summary_text", "").strip()
    if summary:
        lines.append(summary)

    themes: list[str] = entry.get("themes", [])
    if themes:
        lines.append("")
        lines.append("Themes: " + " · ".join(themes))

    people: list[str] = _dedupe_keep_order(
        [p for p in entry.get("key_people", []) if not _is_skip_label(" ".join((p or "").strip().split()))]
    )
    if people:
        lines.append("")
        lines.append("Key People: " + " · ".join(people))

    places: list[str] = _dedupe_keep_order(
        [p for p in infer_key_places(entry) if not _is_skip_place_label(" ".join((p or "").strip().split()))]
    )
    if places:
        lines.append("")
        lines.append("Key Places: " + " · ".join(places))

    points: list[str] = entry.get("key_points", [])
    if points:
        lines.append("")
        lines.append("Key Points:")
        for point in points:
            lines.append(f"\u2022 {point}")

    verses: list[str] = entry.get("supporting_verses", [])
    if verses:
        lines.append("")
        lines.append("Supporting Verses: " + " · ".join(verses))

    return "\n".join(lines)


def load_json_files() -> list[dict]:
    """Load all JSON files from the commentary directory and format rows."""
    rows: list[dict] = []
    json_files = sorted(COMMENTARY_DIR.glob("*.json"))

    if not json_files:
        print(f"WARNING: No JSON files found in {COMMENTARY_DIR}", flush=True)
        return rows

    for json_file in json_files:
        print(f"  Reading {json_file.name}...", flush=True)
        with open(json_file, encoding="utf-8") as f:
            entries: list[dict] = json.load(f)

        for entry in entries:
            content = format_content(entry)
            if not content.strip():
                continue
            rows.append(
                {
                    "source": SOURCE_ID,
                    "book_number": entry["book_number"],
                    "chapter": entry["chapter"],
                    "verse_start": 1,
                    "verse_end": None,
                    "content": content,
                }
            )

    rows.sort(key=lambda r: (r["book_number"], r["chapter"]))
    return rows


def upsert_source_metadata(client) -> None:
    client.table("commentary_sources").upsert(
        {
            "id": SOURCE_ID,
            "name": "Summary",
            "license": "Public Domain",
            "description": (
                "Chapter-level summaries with themes, key people, "
                "key points, and supporting verses."
            ),
        }
    ).execute()


def replace_commentary_rows(client, rows: list[dict]) -> None:
    print("  Deleting existing summary rows...", flush=True)
    client.table("commentaries").delete().eq("source", SOURCE_ID).execute()

    total = len(rows)
    inserted = 0
    t0 = time.time()

    for start in range(0, total, BATCH_SIZE):
        batch = rows[start : start + BATCH_SIZE]
        client.table("commentaries").insert(batch).execute()
        inserted += len(batch)
        pct = inserted / total * 100 if total else 100
        print(
            f"  {inserted}/{total} ({pct:.0f}%) [{time.time() - t0:.1f}s]",
            flush=True,
        )


def main() -> None:
    if not SUPABASE_URL or not SUPABASE_KEY:
        print("ERROR: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be set in .env")
        sys.exit(1)

    print("Loading summary commentary JSON files...", flush=True)
    rows = load_json_files()
    if not rows:
        print("ERROR: No commentary rows found. Check the commentary/ directory.")
        sys.exit(1)
    print(f"Loaded {len(rows)} chapter summaries.", flush=True)

    client = create_client(SUPABASE_URL, SUPABASE_KEY)

    print("Upserting source metadata...", flush=True)
    upsert_source_metadata(client)

    print("Replacing summary commentary rows in Supabase...", flush=True)
    replace_commentary_rows(client, rows)

    try:
        root = Path(__file__).resolve().parent.parent
        sys.path.insert(0, str(root))
        from app.services.summary_entity_service import rebuild_all_summary_mentions

        print("Rebuilding summary entity mentions...", flush=True)
        stats = rebuild_all_summary_mentions()
        print(
            f"Indexed {stats.commentary_ids_requested} summary rows "
            f"({stats.mention_rows_written} mentions, {stats.new_entities_inserted} new entities).",
            flush=True,
        )
    except Exception as exc:
        print(f"WARNING: Could not rebuild entity mentions ({exc}). Run scripts/backfill_summary_entities.py later.", flush=True)

    print("Done.", flush=True)


if __name__ == "__main__":
    main()
