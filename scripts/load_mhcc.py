"""
Load Matthew Henry's Concise Commentary into Supabase.

Data source: Christian Classics Ethereal Library (public domain ThML XML)
  https://ccel.org/ccel/h/henry/mhcc.xml

Usage:
    python scripts/load_mhcc.py

Requires SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in .env
"""

from __future__ import annotations

import os
import re
import sys
import time
import urllib.request
import xml.etree.ElementTree as ET

from dotenv import load_dotenv
from supabase import create_client


load_dotenv()

SUPABASE_URL = os.environ["SUPABASE_URL"]
SUPABASE_KEY = os.environ["SUPABASE_SERVICE_ROLE_KEY"]

SOURCE_ID = "matthew_henry"
SOURCE_URL = "https://ccel.org/ccel/h/henry/mhcc.xml"
BATCH_SIZE = 250

OSIS_TO_BOOK_NUMBER = {
    "Gen": 1, "Exod": 2, "Lev": 3, "Num": 4, "Deut": 5, "Josh": 6, "Judg": 7,
    "Ruth": 8, "1Sam": 9, "2Sam": 10, "1Kgs": 11, "2Kgs": 12, "1Chr": 13,
    "2Chr": 14, "Ezra": 15, "Neh": 16, "Esth": 17, "Job": 18, "Ps": 19,
    "Prov": 20, "Eccl": 21, "Song": 22, "Isa": 23, "Jer": 24, "Lam": 25,
    "Ezek": 26, "Dan": 27, "Hos": 28, "Joel": 29, "Amos": 30, "Obad": 31,
    "Jonah": 32, "Mic": 33, "Nah": 34, "Hab": 35, "Zeph": 36, "Hag": 37,
    "Zech": 38, "Mal": 39, "Matt": 40, "Mark": 41, "Luke": 42, "John": 43,
    "Acts": 44, "Rom": 45, "1Cor": 46, "2Cor": 47, "Gal": 48, "Eph": 49,
    "Phil": 50, "Col": 51, "1Thess": 52, "2Thess": 53, "1Tim": 54, "2Tim": 55,
    "Titus": 56, "Phlm": 57, "Heb": 58, "Jas": 59, "1Pet": 60, "2Pet": 61,
    "1John": 62, "2John": 63, "3John": 64, "Jude": 65, "Rev": 66,
}

OSIS_REF_RE = re.compile(
    r"^Bible:(?P<book1>[A-Za-z0-9]+)\.(?P<chapter1>\d+)\.(?P<verse1>\d+)"
    r"(?:-(?:(?P<book2>[A-Za-z0-9]+)\.)?(?P<chapter2>\d+)\.(?P<verse2>\d+))?$"
)


def fetch_xml() -> str:
    with urllib.request.urlopen(SOURCE_URL, timeout=60) as response:
        return response.read().decode("utf-8", errors="replace")


def parse_osis_ref(osis_ref: str) -> tuple[int, int, int, int | None]:
    match = OSIS_REF_RE.match(osis_ref.strip())
    if not match:
        raise ValueError(f"Unsupported osisRef: {osis_ref}")

    book_code = match.group("book1")
    chapter = int(match.group("chapter1"))
    verse_start = int(match.group("verse1"))
    verse_end = None

    if book_code not in OSIS_TO_BOOK_NUMBER:
        raise ValueError(f"Unknown OSIS book code: {book_code}")

    if match.group("verse2"):
        end_book = match.group("book2") or book_code
        end_chapter = int(match.group("chapter2"))
        end_verse = int(match.group("verse2"))

        if end_book != book_code or end_chapter != chapter:
          raise ValueError(f"Cross-chapter commentary range not supported: {osis_ref}")

        verse_end = end_verse

    return OSIS_TO_BOOK_NUMBER[book_code], chapter, verse_start, verse_end


def clean_text(text: str) -> str:
    text = text.replace("\xa0", " ")
    text = re.sub(r"\s+", " ", text)
    return text.strip()


def extract_commentary_rows(xml_text: str) -> list[dict]:
    root = ET.fromstring(xml_text)
    rows: list[dict] = []

    for node in root.iter("div"):
        if node.attrib.get("class") != "Commentary":
            continue

        osis_ref = node.attrib.get("id", "")
        if not osis_ref.startswith("Bible:"):
            continue

        paragraphs = []
        for child in node:
            if child.tag == "h3":
                continue

            text = clean_text("".join(child.itertext()))
            if text:
                paragraphs.append(text)

        content = "\n\n".join(paragraphs)
        if not content:
            continue

        book_number, chapter, verse_start, verse_end = parse_osis_ref(osis_ref)
        rows.append(
            {
                "source": SOURCE_ID,
                "book_number": book_number,
                "chapter": chapter,
                "verse_start": verse_start,
                "verse_end": verse_end,
                "content": content,
            }
        )

    rows.sort(key=lambda row: (row["book_number"], row["chapter"], row["verse_start"], row["verse_end"] or row["verse_start"]))
    return rows


def upsert_source_metadata(client) -> None:
    client.table("commentary_sources").upsert(
        {
            "id": SOURCE_ID,
            "name": "Matthew Henry's Concise Commentary",
            "license": "Public Domain",
            "description": "Imported from the CCEL ThML edition of Matthew Henry's Concise Commentary on the Whole Bible.",
        }
    ).execute()


def replace_commentary_rows(client, rows: list[dict]) -> None:
    client.table("commentaries").delete().eq("source", SOURCE_ID).execute()

    total = len(rows)
    inserted = 0
    t0 = time.time()

    for start in range(0, total, BATCH_SIZE):
        batch = rows[start : start + BATCH_SIZE]
        client.table("commentaries").insert(batch).execute()
        inserted += len(batch)

        if inserted % 2000 < BATCH_SIZE or inserted == total:
            pct = inserted / total * 100 if total else 100
            print(f"  {inserted:,}/{total:,} ({pct:.0f}%) [{time.time() - t0:.1f}s]", flush=True)


def main() -> None:
    if not SUPABASE_URL or not SUPABASE_KEY:
        print("ERROR: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be set in .env")
        sys.exit(1)

    print("Fetching Matthew Henry XML...", flush=True)
    xml_text = fetch_xml()

    print("Parsing commentary entries...", flush=True)
    rows = extract_commentary_rows(xml_text)
    if not rows:
        print("ERROR: No commentary rows were parsed.")
        sys.exit(1)

    print(f"Parsed {len(rows):,} commentary entries.", flush=True)

    client = create_client(SUPABASE_URL, SUPABASE_KEY)
    upsert_source_metadata(client)

    print("Replacing existing Matthew Henry commentary rows...", flush=True)
    replace_commentary_rows(client, rows)

    print("Done.", flush=True)


if __name__ == "__main__":
    main()
