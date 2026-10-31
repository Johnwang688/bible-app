"""
Import the Berean Standard Bible text, its word alignment and the STEPBible lexicons
into content/source/, ready for scripts/build_content.py.

Reads four pinned upstream files (see UPSTREAM), verifies their sha256 hashes before
reading anything, and writes:

    verses/BSB.jsonl     one line per non-empty BSB verse, same format as verses/WEB.jsonl
    bsb_words.jsonl.gz   one JSON object per aligned word (gzip, mtime 0)
    lexicon.jsonl        one line per Strong's number (TBESH + TBESG), ordered by strongs

It then updates the BSB row of translations.jsonl and the entries in MANIFEST.json.
The output is deterministic: the same upstream files give byte-identical output.
Nothing is written unless every check passes.

Usage:
    python scripts/import_bsb.py --upstream build/upstream --out content/source

Standard library only.
"""

from __future__ import annotations

import argparse
import csv
import gzip
import hashlib
import html
import io
import json
import re
import sys
import unicodedata
from decimal import Decimal
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

DEFAULT_UPSTREAM = ROOT / "build" / "upstream"
DEFAULT_OUT = ROOT / "content" / "source"

# The pinned upstream files: local name -> where it comes from, its licence and its sha256.
UPSTREAM = {
    "bsb.txt": {
        "url": "https://bereanbible.com/",
        "license": "Public Domain",
        "sha256": "2ac3af1de52d4e68261cba91d85c320b7eadc6560e830d99e591767b8ff5ca96",
    },
    "bsb_tables.tsv": {
        "url": "https://bereanbible.com/",
        "license": "Public Domain",
        "sha256": "aa2a9a0f004d015738cd1839c7c56c3be2549e0d4f4537090c2017268c223c60",
    },
    "tbesh.txt": {
        "url": "https://github.com/STEPBible/STEPBible-Data (Lexicons/)",
        "license": 'CC BY 4.0, credit "STEP Bible", www.STEPBible.org',
        "sha256": "464dccadd95fd8620dd05fa0d7a4caba58ec3c4d5db3ebf38e43d046ca25b591",
    },
    "tbesg.txt": {
        "url": "https://github.com/STEPBible/STEPBible-Data (Lexicons/)",
        "license": 'CC BY 4.0, credit "STEP Bible", www.STEPBible.org',
        "sha256": "312f723d7b8ef263bbdfb0451c9b8057125804dfff390b6f8544cff2a84b57f4",
    },
}

BSB_TRANSLATION = "BSB"
FIRST_VERSE_ID = 124406  # ASV's last verse id (124405) + 1
BSB_PREAMBLE_LINES = 3

BSB_LICENSE = "Public Domain"
BSB_DESCRIPTION = (
    "Berean Standard Bible (2023), dedicated to the public domain. "
    "Text and word alignment from BereanBible.com."
)

# bsb.txt calls the book "Psalm"; books.jsonl calls it "Psalms".
BOOK_ALIASES = {"Psalm": "Psalms"}

LEXICON_FILES = {"tbesh.txt": ("H", "hebrew"), "tbesg.txt": ("G", "greek")}

OUT_VERSES = "verses/BSB.jsonl"
OUT_WORDS = "bsb_words.jsonl.gz"
OUT_LEXICON = "lexicon.jsonl"

WORD_LANGUAGES = {"hebrew", "aramaic", "greek"}

# bsb_tables.tsv column indexes
C_HEB_SORT, C_GRK_SORT, C_BSB_SORT = 0, 1, 2
C_LANGUAGE, C_ORIGINAL, C_TRANSLIT, C_PARSING_CODE, C_PARSING = 4, 5, 7, 8, 9
C_STR_HEB, C_STR_GRK, C_VERSE_ID, C_ENGLISH, C_FOOTNOTE = 10, 11, 12, 18, 21
TABLES_COLUMNS = 23


class ImportFailed(Exception):
    """Any failure while importing; nothing is written."""


# ── helpers ──────────────────────────────────────────────────────────────────

def _json_line(record: dict) -> str:
    """One JSONL line in the repo's source format (sorted keys, compact, real UTF-8)."""
    return json.dumps(record, sort_keys=True, ensure_ascii=False, separators=(",", ":"))


def _nfc(text: str) -> str:
    """Unicode NFC. Upstream Hebrew and Greek are not normalised (for example the order of
    vowel points and dagesh, or Greek oxia versus tonos), which breaks exact matching."""
    return unicodedata.normalize("NFC", text)


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


_BR_RE = re.compile(r"<\s*br\s*/?\s*>", re.IGNORECASE)
_TAG_RE = re.compile(r"</?\s*[A-Za-z][^>]*>")
_SPACES_RE = re.compile(r"[ \t\xa0]+")
_LEFTOVER_TAG_RE = re.compile(r"<\s*/?\s*[A-Za-z]")


def html_to_text(raw: str) -> str:
    """Turn the HTML fragments in definitions and footnotes into plain text.

    <br> variants become newlines, every other tag is dropped (its inner text stays),
    entities are decoded, Abbott-Smith's '__' indent markers are removed, runs of
    spaces collapse and each line is trimmed.
    """
    text = _BR_RE.sub("\n", raw)
    text = _TAG_RE.sub("", text)
    text = html.unescape(text)
    text = text.replace("__", "")
    lines = [_SPACES_RE.sub(" ", line).strip() for line in text.split("\n")]
    result = _nfc("\n".join(lines).strip())
    if _LEFTOVER_TAG_RE.search(result):
        raise ImportFailed(f"markup left after cleaning: {raw[:80]!r}")
    return result


def _decode(path: Path) -> str:
    # utf-8-sig drops the byte-order mark some upstream files start with.
    return path.read_bytes().decode("utf-8-sig")


# ── upstream verification ────────────────────────────────────────────────────

def verify_upstream(upstream_dir: Path) -> None:
    """Check every upstream file's sha256 before anything is read."""
    for name, info in UPSTREAM.items():
        path = upstream_dir / name
        if not path.is_file():
            raise ImportFailed(f"{name}: missing from {upstream_dir}")
        actual = _sha256_bytes(path.read_bytes())
        if actual != info["sha256"]:
            raise ImportFailed(f"{name}: sha256 mismatch (expected {info['sha256']}, file {actual})")


# ── books ────────────────────────────────────────────────────────────────────

def load_book_numbers(source_dir: Path) -> dict[str, int]:
    numbers = {}
    with open(source_dir / "books.jsonl", encoding="utf-8") as f:
        for line in f:
            if line.strip():
                record = json.loads(line)
                numbers[record["name_en"]] = record["book_number"]
    return numbers


def parse_reference(ref: str, books: dict[str, int]) -> tuple[int, int, int]:
    """'Genesis 1:1' -> (1, 1, 1). Unknown book names are an error."""
    match = re.fullmatch(r"(.+) (\d+):(\d+)", ref.strip())
    if not match:
        raise ImportFailed(f"bad verse reference {ref!r}")
    name = BOOK_ALIASES.get(match.group(1), match.group(1))
    if name not in books:
        raise ImportFailed(f"unknown book name {match.group(1)!r} in {ref!r}")
    return books[name], int(match.group(2)), int(match.group(3))


# ── BSB verses ───────────────────────────────────────────────────────────────

def parse_bsb_text(text: str, books: dict[str, int]) -> list[dict]:
    """Rows of verses/BSB.jsonl, in canonical order, without the empty verses."""
    lines = text.split("\n")[BSB_PREAMBLE_LINES:]
    verses = {}
    for line in lines:
        line = line.rstrip("\r")
        if not line.strip():
            continue
        ref, tab, body = line.partition("\t")
        if not tab:
            raise ImportFailed(f"bsb.txt: line without a tab: {line[:60]!r}")
        key = parse_reference(ref, books)
        if key in verses:
            raise ImportFailed(f"bsb.txt: duplicate verse {ref}")
        verses[key] = _nfc(body.rstrip())

    rows = []
    for key in sorted(verses):
        if not verses[key]:
            continue  # BSB leaves a few verses empty (e.g. Matthew 17:21)
        book, chapter, verse = key
        rows.append({
            "book_number": book,
            "chapter": chapter,
            "id": FIRST_VERSE_ID + len(rows),
            "text": verses[key],
            "translation": BSB_TRANSLATION,
            "verse": verse,
        })
    return rows


# ── word alignment ───────────────────────────────────────────────────────────

def _strongs(language: str, row: list[str], line_no: int) -> str | None:
    raw = row[C_STR_GRK if language == "greek" else C_STR_HEB].strip()
    if not raw:
        return None
    if not raw.isdigit():
        raise ImportFailed(f"bsb_tables.tsv line {line_no}: bad Strong's number {raw!r}")
    return f"{'G' if language == 'greek' else 'H'}{int(raw):04d}"


def _english(raw: str) -> tuple[str | None, str]:
    value = _nfc(raw.strip())
    if value in ("-", ""):
        return None, "untranslated"
    if value == ". . .":
        return None, "continues"
    if value == "vvv":
        return None, "elsewhere"
    return value, "text"


def parse_word_table(text: str, books: dict[str, int]) -> list[dict]:
    """One record per aligned word, ordered by (book, chapter, verse, english_order)."""
    reader = csv.reader(io.StringIO(text, newline=""), delimiter="\t", quoting=csv.QUOTE_NONE)
    header = next(reader)
    if len(header) != TABLES_COLUMNS:
        raise ImportFailed(f"bsb_tables.tsv: expected {TABLES_COLUMNS} columns, got {len(header)}")

    by_verse: dict[tuple[int, int, int], list[tuple]] = {}
    current = None
    for line_no, row in enumerate(reader, start=2):
        if len(row) != TABLES_COLUMNS:
            raise ImportFailed(f"bsb_tables.tsv line {line_no}: expected {TABLES_COLUMNS} columns, got {len(row)}")
        if row[C_VERSE_ID].strip():
            current = parse_reference(row[C_VERSE_ID], books)
        language = row[C_LANGUAGE].strip().lower()
        original = _nfc(row[C_ORIGINAL].strip())
        if language not in WORD_LANGUAGES or not original:
            continue  # blank rows, the 'z' row and the English-only row (Nehemiah 7:68)
        if current is None:
            raise ImportFailed(f"bsb_tables.tsv line {line_no}: word before any verse id")
        try:
            bsb_sort = int(row[C_BSB_SORT])
            original_sort = Decimal(row[C_GRK_SORT if language == "greek" else C_HEB_SORT])
        except ArithmeticError as exc:
            raise ImportFailed(f"bsb_tables.tsv line {line_no}: bad sort value ({exc})") from exc
        except ValueError as exc:
            raise ImportFailed(f"bsb_tables.tsv line {line_no}: bad sort value ({exc})") from exc
        english, kind = _english(row[C_ENGLISH])
        footnote = html_to_text(row[C_FOOTNOTE]) or None
        record = {
            "id": bsb_sort,
            "language": language,
            "original": original,
            "translit": _nfc(row[C_TRANSLIT].strip()) or None,
            "parsing_code": _nfc(row[C_PARSING_CODE].strip()) or None,
            "parsing": _nfc(row[C_PARSING].strip()) or None,
            "strongs": _strongs(language, row, line_no),
            "english": english,
            "english_kind": kind,
            "footnote": footnote,
        }
        by_verse.setdefault(current, []).append((bsb_sort, original_sort, record))

    words = []
    seen_ids = set()
    for key in sorted(by_verse):
        entries = sorted(by_verse[key], key=lambda e: e[0])  # BSB Sort = English order
        original_rank = {
            id(entry): rank
            for rank, entry in enumerate(sorted(entries, key=lambda e: (e[1], e[0])), start=1)
        }
        book, chapter, verse = key
        for english_order, entry in enumerate(entries, start=1):
            record = entry[2]
            if record["id"] in seen_ids:
                raise ImportFailed(f"bsb_tables.tsv: duplicate BSB Sort value {record['id']}")
            seen_ids.add(record["id"])
            words.append({
                "book_number": book,
                "chapter": chapter,
                "verse": verse,
                "english_order": english_order,
                "original_order": original_rank[id(entry)],
                **record,
            })
    return words


# ── lexicons ─────────────────────────────────────────────────────────────────

_LEXICON_ROW_RE = re.compile(r"^[HG]\d{4}")


def parse_lexicon(text: str, prefix: str, language: str, name: str) -> list[dict]:
    """Entries keyed by plain Strong's number; the first row in file order wins."""
    entries: dict[str, dict] = {}
    for line_no, line in enumerate(text.split("\n"), start=1):
        line = line.rstrip("\r")
        if not _LEXICON_ROW_RE.match(line):
            continue
        cols = line.split("\t")
        if len(cols) < 8:
            raise ImportFailed(f"{name} line {line_no}: expected at least 8 columns, got {len(cols)}")
        strongs = cols[0][:5]
        if not strongs.startswith(prefix):
            raise ImportFailed(f"{name} line {line_no}: {cols[0]!r} does not belong in this lexicon")
        if strongs in entries:
            continue
        entries[strongs] = {
            "strongs": strongs,
            "language": language,
            "lemma": _nfc(cols[3].strip()) or None,
            "translit": _nfc(cols[4].strip()) or None,
            "morph": _nfc(cols[5].strip()) or None,
            "gloss": _nfc(cols[6].strip()) or None,
            "definition": html_to_text(cols[7]) or None,
        }
    return list(entries.values())


# ── source file updates ──────────────────────────────────────────────────────

def update_translations(current: bytes) -> bytes:
    """Change only the BSB row's license and description; keep every other byte."""
    out = []
    found = False
    for line in current.decode("utf-8").splitlines(keepends=True):
        body = line.rstrip("\n")
        if body.strip():
            record = json.loads(body)
            if record.get("id") == BSB_TRANSLATION:
                if _json_line(record) != body:
                    raise ImportFailed("translations.jsonl: BSB row is not in the canonical format")
                record["license"] = BSB_LICENSE
                record["description"] = BSB_DESCRIPTION
                line = _json_line(record) + line[len(body):]
                found = True
        out.append(line)
    if not found:
        raise ImportFailed("translations.jsonl: no BSB row")
    return "".join(out).encode("utf-8")


def _count_lines(data: bytes) -> int:
    return sum(1 for line in data.decode("utf-8").split("\n") if line.strip())


def update_manifest(current: bytes, new_files: dict[str, tuple[bytes, int, str]]) -> bytes:
    """Add or refresh manifest entries. new_files: name -> (bytes, rows, table)."""
    manifest = json.loads(current.decode("utf-8"))
    dump = lambda m: json.dumps(m, indent=2, sort_keys=True, ensure_ascii=False) + "\n"  # noqa: E731
    if dump(manifest).encode("utf-8") != current:
        raise ImportFailed("MANIFEST.json: not in the canonical format")

    files = manifest["files"]
    for name, (data, rows, table) in new_files.items():
        files[name] = {"rows": rows, "sha256": _sha256_bytes(data), "table": table}

    tables = manifest["tables"]
    for table in {entry["table"] for entry in files.values()}:
        tables[table] = sum(entry["rows"] for entry in files.values() if entry["table"] == table)
    return dump(manifest).encode("utf-8")


# ── main ─────────────────────────────────────────────────────────────────────

def _gzip_bytes(text: str) -> bytes:
    """Reproducible gzip: no file name, mtime 0."""
    buffer = io.BytesIO()
    with gzip.GzipFile(filename="", mode="wb", fileobj=buffer, compresslevel=9, mtime=0) as gz:
        gz.write(text.encode("utf-8"))
    return buffer.getvalue()


def run(upstream_dir: Path, out_dir: Path) -> dict[str, int]:
    verify_upstream(upstream_dir)  # before anything is read
    books = load_book_numbers(out_dir)

    verses = parse_bsb_text(_decode(upstream_dir / "bsb.txt"), books)
    words = parse_word_table(_decode(upstream_dir / "bsb_tables.tsv"), books)

    lexicon: dict[str, dict] = {}
    for name, (prefix, language) in LEXICON_FILES.items():
        for entry in parse_lexicon(_decode(upstream_dir / name), prefix, language, name):
            lexicon[entry["strongs"]] = entry

    # Cross-checks: every aligned word sits in a BSB verse and has a lexicon entry.
    verse_keys = {(v["book_number"], v["chapter"], v["verse"]) for v in verses}
    for w in words:
        if (w["book_number"], w["chapter"], w["verse"]) not in verse_keys:
            raise ImportFailed(
                f"word {w['id']} is in {w['book_number']}:{w['chapter']}:{w['verse']}, which has no BSB text"
            )
    missing = sorted({w["strongs"] for w in words if w["strongs"] and w["strongs"] not in lexicon})
    if missing:
        raise ImportFailed(f"{len(missing)} Strong's numbers have no lexicon entry: {missing[:10]}")

    verses_data = "".join(_json_line(v) + "\n" for v in verses).encode("utf-8")
    words_data = _gzip_bytes("".join(_json_line(w) + "\n" for w in words))
    lexicon_data = "".join(_json_line(lexicon[k]) + "\n" for k in sorted(lexicon)).encode("utf-8")

    translations_data = update_translations((out_dir / "translations.jsonl").read_bytes())
    manifest_data = update_manifest(
        (out_dir / "MANIFEST.json").read_bytes(),
        {
            OUT_VERSES: (verses_data, len(verses), "verses"),
            OUT_WORDS: (words_data, len(words), "bsb_words"),
            OUT_LEXICON: (lexicon_data, len(lexicon), "lexicon"),
            "translations.jsonl": (translations_data, _count_lines(translations_data), "translations"),
        },
    )

    # Everything checked: write.
    (out_dir / "verses").mkdir(parents=True, exist_ok=True)
    for name, data in (
        (OUT_VERSES, verses_data),
        (OUT_WORDS, words_data),
        (OUT_LEXICON, lexicon_data),
        ("translations.jsonl", translations_data),
        ("MANIFEST.json", manifest_data),
    ):
        (out_dir / name).write_bytes(data)
    return {"verses": len(verses), "bsb_words": len(words), "lexicon": len(lexicon)}


def _parse_args(argv: list[str] | None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Import BSB text, word alignment and STEPBible lexicons.")
    parser.add_argument("--upstream", type=Path, default=DEFAULT_UPSTREAM, help="directory with the four upstream files")
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT, help="content source directory")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)
    try:
        counts = run(args.upstream, args.out)
    except ImportFailed as exc:
        print(f"import failed: {exc}", file=sys.stderr)
        return 1
    for name, count in counts.items():
        print(f"{name}: {count} rows")
    return 0


if __name__ == "__main__":
    sys.exit(main())
