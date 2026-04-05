"""
Fetch Bible verses from Supabase using the anon key (same as the public app).

Loads SUPABASE_URL and SUPABASE_ANON_KEY from .env (repo root).

Usage:
    python scripts/read_verses_anon.py
    python scripts/read_verses_anon.py --translation WEB --book 43 --chapter 3 --limit 20
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from pathlib import Path

from dotenv import load_dotenv
from supabase import create_client

# Repo root (parent of scripts/)
_ROOT = Path(__file__).resolve().parent.parent
load_dotenv(_ROOT / ".env")

COLS = "id,translation,book_number,chapter,verse,text"


def main() -> None:
    parser = argparse.ArgumentParser(description="Read verses via Supabase anon key.")
    parser.add_argument(
        "--translation",
        default=os.environ.get("DEFAULT_TRANSLATION", "WEB"),
        help="Translation id (e.g. WEB, KJV)",
    )
    parser.add_argument("--book", type=int, default=43, help="book_number (43 = John)")
    parser.add_argument("--chapter", type=int, default=3, help="Chapter number")
    parser.add_argument(
        "--limit",
        type=int,
        default=50,
        help="Max rows (Supabase default cap may apply; use --offset to page)",
    )
    parser.add_argument("--offset", type=int, default=0, help="Skip first N rows")
    args = parser.parse_args()

    url = os.environ.get("SUPABASE_URL", "").strip()
    key = os.environ.get("SUPABASE_ANON_KEY", "").strip()
    if not url or not key:
        print(
            "ERROR: SUPABASE_URL and SUPABASE_ANON_KEY must be set in .env",
            file=sys.stderr,
        )
        sys.exit(1)

    client = create_client(url, key)
    q = (
        client.table("verses")
        .select(COLS)
        .eq("translation", args.translation)
        .eq("book_number", args.book)
        .eq("chapter", args.chapter)
        .order("verse")
        .range(args.offset, args.offset + max(args.limit, 1) - 1)
    )
    result = q.execute()
    rows = result.data or []
    print(json.dumps(rows, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
