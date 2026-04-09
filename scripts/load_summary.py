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

    people: list[str] = entry.get("key_people", [])
    if people:
        lines.append("")
        lines.append("Key People: " + " · ".join(people))

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
