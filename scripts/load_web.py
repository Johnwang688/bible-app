"""
Load the World English Bible (WEB) into Supabase.

Data source: TehShrike/world-english-bible (public domain JSON)
  https://github.com/TehShrike/world-english-bible

Usage:
    python scripts/load_web.py

Requires SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env
"""

import os
import sys
import time
import urllib.request

import json

from dotenv import load_dotenv
from supabase import create_client

load_dotenv()

SUPABASE_URL = os.environ["SUPABASE_URL"]
SUPABASE_KEY = os.environ["SUPABASE_SERVICE_ROLE_KEY"]

BASE_URL = "https://raw.githubusercontent.com/TehShrike/world-english-bible/master/json"

# Ordered list of book filenames matching book_number 1-66
BOOKS = [
    "genesis", "exodus", "leviticus", "numbers", "deuteronomy",
    "joshua", "judges", "ruth", "1samuel", "2samuel",
    "1kings", "2kings", "1chronicles", "2chronicles", "ezra",
    "nehemiah", "esther", "job", "psalms", "proverbs",
    "ecclesiastes", "songofsolomon", "isaiah", "jeremiah", "lamentations",
    "ezekiel", "daniel", "hosea", "joel", "amos",
    "obadiah", "jonah", "micah", "nahum", "habakkuk",
    "zephaniah", "haggai", "zechariah", "malachi",
    "matthew", "mark", "luke", "john", "acts",
    "romans", "1corinthians", "2corinthians", "galatians", "ephesians",
    "philippians", "colossians", "1thessalonians", "2thessalonians",
    "1timothy", "2timothy", "titus", "philemon", "hebrews",
    "james", "1peter", "2peter", "1john", "2john", "3john",
    "jude", "revelation",
]

TRANSLATION = "WEB"
BATCH_SIZE = 500


def fetch_book(book_name: str) -> list[dict]:
    url = f"{BASE_URL}/{book_name}.json"
    with urllib.request.urlopen(url, timeout=30) as resp:
        data = json.loads(resp.read().decode("utf-8"))
    return data


def parse_book(data: list[dict], book_number: int) -> list[dict]:
    """
    Each entry may have chapterNumber, verseNumber, sectionNumber, value.
    Multiple sections can share the same (chapter, verse) — concatenate them.
    """
    verse_map: dict[tuple, list[str]] = {}
    for entry in data:
        ch = entry.get("chapterNumber")
        v = entry.get("verseNumber")
        text = entry.get("value", "")
        if ch is None or v is None or not text:
            continue
        key = (ch, v)
        verse_map.setdefault(key, []).append(text.strip())

    rows = []
    for (ch, v), parts in sorted(verse_map.items()):
        rows.append({
            "translation": TRANSLATION,
            "book_number": book_number,
            "chapter": ch,
            "verse": v,
            "text": " ".join(parts),
        })
    return rows


def load_all() -> None:
    if not SUPABASE_URL or not SUPABASE_KEY:
        print("ERROR: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be set in .env")
        sys.exit(1)

    client = create_client(SUPABASE_URL, SUPABASE_KEY)

    all_rows: list[dict] = []
    for book_number, book_name in enumerate(BOOKS, start=1):
        print(f"  [{book_number:2d}/66] Fetching {book_name} ...", end=" ", flush=True)
        try:
            data = fetch_book(book_name)
            rows = parse_book(data, book_number)
            all_rows.extend(rows)
            print(f"{len(rows)} verses")
        except Exception as exc:
            print(f"ERROR: {exc}")

    total = len(all_rows)
    print(f"\nTotal verses fetched: {total:,}")
    print(f"Inserting in batches of {BATCH_SIZE} ...", flush=True)

    inserted = 0
    errors = 0
    t0 = time.time()

    for start in range(0, total, BATCH_SIZE):
        batch = all_rows[start : start + BATCH_SIZE]
        try:
            client.table("verses").upsert(
                batch,
                on_conflict="translation,book_number,chapter,verse",
            ).execute()
            inserted += len(batch)
        except Exception as exc:
            errors += len(batch)
            print(f"  ERROR on batch {start}: {exc}", flush=True)

        if inserted % 5000 < BATCH_SIZE or start + BATCH_SIZE >= total:
            pct = (inserted + errors) / total * 100
            print(f"  {inserted + errors:,}/{total:,} ({pct:.0f}%)  [{time.time()-t0:.1f}s]", flush=True)

    elapsed = time.time() - t0
    print(f"\nDone. {inserted:,} inserted, {errors} errors. ({elapsed:.1f}s)")


if __name__ == "__main__":
    load_all()
