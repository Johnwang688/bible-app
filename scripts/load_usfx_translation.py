"""
Load a Bible translation XML file into Supabase.

Examples:
    python scripts/load_usfx_translation.py --dry-run --source-path tmp-chi-cuv.usfx.xml
    python scripts/load_usfx_translation.py --translation CUV --source-url https://raw.githubusercontent.com/seven1m/open-bibles/master/chi-cuv.usfx.xml
    python scripts/load_usfx_translation.py --translation ASV --source-url https://raw.githubusercontent.com/seven1m/open-bibles/master/eng-asv.zefania.xml
    python scripts/load_usfx_translation.py --translation CUV --name "CUV Traditional (1919)" --metadata-only
"""

from __future__ import annotations

import argparse
import os
import re
import sys
import urllib.request
import xml.etree.ElementTree as ET
from pathlib import Path

from dotenv import load_dotenv
from supabase import create_client


ROOT = Path(__file__).resolve().parent.parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from app.core.book_catalog import BOOK_BY_NUMBER, BOOK_BY_OSIS


load_dotenv(ROOT / ".env")

DEFAULT_SOURCE_URL = "https://raw.githubusercontent.com/seven1m/open-bibles/master/chi-cuv.usfx.xml"
DEFAULT_TRANSLATION_NAME = "Chinese Union Version (1919)"
DEFAULT_TRANSLATION_DESCRIPTION = "Loaded from the public-domain open-bibles source."


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Load a Bible XML translation into Supabase.")
    parser.add_argument("--translation", default="CUV", help="Translation id, e.g. CUV or WEB.")
    parser.add_argument("--name", default=DEFAULT_TRANSLATION_NAME, help="Human-friendly translation name.")
    parser.add_argument("--language", default="zh", help="Translation language code.")
    parser.add_argument("--license", default="Public Domain", help="License label.")
    parser.add_argument("--description", default=DEFAULT_TRANSLATION_DESCRIPTION, help="Translation description.")
    parser.add_argument("--source-url", default=DEFAULT_SOURCE_URL, help="HTTP(S) URL for the XML source.")
    parser.add_argument("--source-path", help="Optional local XML file path. Overrides --source-url.")
    parser.add_argument("--batch-size", type=int, default=500, help="Rows per upsert batch.")
    parser.add_argument("--dry-run", action="store_true", help="Parse and summarize without uploading.")
    parser.add_argument("--metadata-only", action="store_true", help="Upsert the translation row without uploading verses.")
    return parser.parse_args()


def configure_stdio() -> None:
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    if hasattr(sys.stderr, "reconfigure"):
        sys.stderr.reconfigure(encoding="utf-8")


def normalize_text(text: str) -> str:
    return re.sub(r"\s+", " ", text).strip()


def local_name(tag: str) -> str:
    return tag.rsplit("}", 1)[-1].upper()


def load_source_bytes(source_path: str | None, source_url: str) -> bytes:
    if source_path:
        return Path(source_path).read_bytes()
    with urllib.request.urlopen(source_url) as response:
        return response.read()


def parse_usfx_rows(xml_bytes: bytes, translation: str) -> tuple[list[dict], list[str]]:
    root = ET.fromstring(xml_bytes)
    rows: list[dict] = []
    summaries: list[str] = []

    for book_elem in root.findall("book"):
        osis = (book_elem.attrib.get("id") or "").strip().upper()
        book_meta = BOOK_BY_OSIS.get(osis)
        if not book_meta:
            raise ValueError(f"Unknown USFX book id: {osis}")

        heading = normalize_text(book_elem.findtext("h") or "")
        chapter: int | None = None
        book_verse_count = 0

        for child in list(book_elem):
            if child.tag == "c":
                chapter = int(child.attrib["id"])
                continue
            if child.tag != "v":
                continue
            if chapter is None:
                raise ValueError(f"Verse encountered before chapter in {osis}")

            verse = int(child.attrib["id"])
            text = normalize_text(child.tail or "")
            if not text:
                raise ValueError(f"Empty verse text encountered at {osis} {chapter}:{verse}")

            rows.append(
                {
                    "translation": translation,
                    "book_number": book_meta["number"],
                    "chapter": chapter,
                    "verse": verse,
                    "text": text,
                }
            )
            book_verse_count += 1

        heading_note = f" ({heading})" if heading else ""
        summaries.append(f'{osis}{heading_note}: {book_verse_count} verses')

    return rows, summaries


def extract_zefania_text(node: ET.Element) -> str:
    parts: list[str] = []
    if node.text:
        parts.append(node.text)
    for child in list(node):
        if local_name(child.tag) not in {"NOTE", "XREF"}:
            parts.append(extract_zefania_text(child))
        if child.tail:
            parts.append(child.tail)
    return normalize_text("".join(parts))


def parse_zefania_rows(xml_bytes: bytes, translation: str) -> tuple[list[dict], list[str]]:
    root = ET.fromstring(xml_bytes)
    rows: list[dict] = []
    summaries: list[str] = []

    for book_elem in root.findall(".//BIBLEBOOK"):
        book_number_raw = (book_elem.attrib.get("bnumber") or "").strip()
        book_number = int(book_number_raw) if book_number_raw else None
        book_meta = BOOK_BY_NUMBER.get(book_number) if book_number is not None else None
        if not book_meta:
            book_name = (book_elem.attrib.get("bname") or "").strip()
            raise ValueError(f"Unknown Zefania book mapping: #{book_number_raw or '?'} {book_name}")

        book_verse_count = 0
        for chapter_elem in book_elem.findall("./CHAPTER"):
            chapter = int(chapter_elem.attrib["cnumber"])
            for verse_elem in chapter_elem.findall("./VERS"):
                verse = int(verse_elem.attrib["vnumber"])
                text = extract_zefania_text(verse_elem)
                if not text:
                    raise ValueError(
                        f"Empty verse text encountered at {book_meta['osis']} {chapter}:{verse}"
                    )
                rows.append(
                    {
                        "translation": translation,
                        "book_number": book_meta["number"],
                        "chapter": chapter,
                        "verse": verse,
                        "text": text,
                    }
                )
                book_verse_count += 1

        summaries.append(f"{book_meta['osis']}: {book_verse_count} verses")

    return rows, summaries


def parse_rows(xml_bytes: bytes, translation: str) -> tuple[list[dict], list[str]]:
    root = ET.fromstring(xml_bytes)
    root_name = local_name(root.tag)
    if root_name == "USFX":
        return parse_usfx_rows(xml_bytes, translation)
    if root_name == "XMLBIBLE":
        return parse_zefania_rows(xml_bytes, translation)
    raise ValueError(f"Unsupported XML root element: {root.tag}")


def batch_rows(rows: list[dict], batch_size: int):
    for start in range(0, len(rows), batch_size):
        yield rows[start : start + batch_size]


def create_supabase_admin_client():
    supabase_url = os.environ.get("SUPABASE_URL", "").strip()
    service_role_key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY", "").strip()
    if not supabase_url or not service_role_key:
        raise RuntimeError("SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be configured in .env")
    return create_client(supabase_url, service_role_key)


def upsert_translation_metadata(client, args: argparse.Namespace) -> None:
    client.table("translations").upsert(
        {
            "id": args.translation,
            "name": args.name,
            "language": args.language,
            "license": args.license,
            "description": args.description,
        },
        on_conflict="id",
    ).execute()


def upload_rows(client, rows: list[dict], batch_size: int) -> None:
    total = len(rows)
    for index, batch in enumerate(batch_rows(rows, batch_size), start=1):
        client.table("verses").upsert(
            batch,
            on_conflict="translation,book_number,chapter,verse",
        ).execute()
        uploaded = min(index * batch_size, total)
        print(f"Uploaded {uploaded}/{total} verses")


def fetch_translation_count(client, translation: str) -> int:
    result = (
        client.table("verses")
        .select("id", count="exact")
        .eq("translation", translation)
        .limit(1)
        .execute()
    )
    return int(result.count or 0)


def main() -> int:
    configure_stdio()
    args = parse_args()
    xml_bytes = load_source_bytes(args.source_path, args.source_url)
    rows, summaries = parse_rows(xml_bytes, args.translation)

    print(f"Parsed {len(rows)} verses for {args.translation}.")
    for line in summaries[:5]:
        print(f"  {line}")
    if len(summaries) > 5:
        print(f"  ... {len(summaries) - 5} more books")

    if args.dry_run:
        return 0

    client = create_supabase_admin_client()
    upsert_translation_metadata(client, args)
    if not args.metadata_only:
        upload_rows(client, rows, max(1, args.batch_size))
    remote_count = fetch_translation_count(client, args.translation)
    print(f"Supabase now reports {remote_count} verses for {args.translation}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
