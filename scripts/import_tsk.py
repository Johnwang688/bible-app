"""Import the pinned SWORD TSK 1.4 without extracting or executing upstream files.

Standard library only; supports ``python -I scripts/import_tsk.py``. All validation
and serialization finish before any output is written. Source repetitions and order
are intentional. Chapter/book headers are not verse commentary.
"""

from __future__ import annotations

import argparse
from collections import Counter
import gzip
import hashlib
import html
import io
import json
from pathlib import Path
import re
import struct
import sys
import zipfile
import zlib

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_VERSES = ROOT / "content/source/verses/ASV.jsonl"
ZIP_SHA256 = "6784c7099465995a8e66f02ead82b0bca66603c1bdeaf8332949774b7bfd4293"
OUT_FILE = "cross_references.jsonl.gz"
UPSTREAM = {
    "name": "TSK.zip",
    "url": "https://crosswire.org/ftpmirror/pub/sword/packages/rawzip/TSK.zip",
    "sha256": ZIP_SHA256,
    "version": "1.4 (2001-12-15)",
    "license": "Public Domain",
    "license_basis": "Compiled about 1880 (Canne, Browne, Blayney, Scott and others); CrossWire distributes module version 1.4 as DistributionLicense=Public Domain",
    "retrieved": "2026-11-04",
}
ABBREVIATIONS = (
    "Ge Ex Le Nu De Jos Jud Ru 1Sa 2Sa 1Ki 2Ki 1Ch 2Ch Ezr Ne Es Job Ps Pr Ec So "
    "Isa Jer La Eze Da Ho Joe Am Ob Jon Mic Na Hab Zep Hag Zec Mal Mt Mr Lu Joh Ac Ro "
    "1Co 2Co Ga Eph Php Col 1Th 2Th 1Ti 2Ti Tit Phm Heb Jas 1Pe 2Pe 1Jo 2Jo 3Jo Jude Re"
).split()
BOOKS = {name: n for n, name in enumerate(ABBREVIATIONS, 1)}
BOOK_PATTERN = "(?:" + "|".join(sorted(BOOKS, key=len, reverse=True)) + ")"
REF_TAG = re.compile(r"<scripRef\b([^>]*)>(.*?)</scripRef\s*>", re.I | re.S)
PASSAGE = re.compile(r'\bpassage\s*=\s*[\"\']([^\"\']+)[\"\']', re.I)
BREAK = re.compile(r"<br\s*/?\s*>", re.I)
ATOM = re.compile(
    rf"(?:(?P<book>{BOOK_PATTERN})\s+)?"
    r"(?P<start>\d+(?:\s*:\s*,?\s*\d*)*)(?:\s*,?\s*-\s*"
    rf"(?:(?P<end_book>{BOOK_PATTERN})\s+)?(?P<end>\d+(?:\s*:\s*\d+)*))?"
    r"(?P<extra>(?:\s*-\s*\d+)*)"
)
# These annotate the PRECEDING reference, not an additional verse. Evidence in
# this pinned module: Gen 1:28 'Ps 69:34; *marg:', Gen 22:21 'Ps 60:1; *title',
# Matt 1:3 'Ge 38:27,29,30; 46:12; * Judah, Pharez, Zarah:'. Num 7:10 has
# '*title Joh 10:22': the annotation ends before a further real reference.
STAR = re.compile(
    r"\*\s*(?:Judah,\s*Pharez,\s*Zarah:|compared with:|title,\s*marg:|"
    r"margins|margin|marg|titles|title|Heb|Gr|etc|Sept)(?![A-Za-z])[:,]?"
)
# Only an unambiguous repeated field is corrected. The other triple-colon
# strings (Gen 16:13 '28:17:19', Song 5:6 'Isa 58:2:4,7-9') are ambiguous
# between comma and range punctuation and are logged rather than guessed.
ERRATA = {
    ((19, 37, 10), "52:5:5-7"): "52:5-7",  # duplicated verse 5
    ((1, 49, 8), "Phm 2:10"): "Php 2:10",  # bowing to Judah: Phil 2:10-11
    ((3, 20, 7), "Phm 2:12"): "Php 2:12",  # sanctification: Phil 2:12-13
    ((24, 25, 22), "Eze 26:1-28:1-19"): "Eze 26:1-28:19",  # Tyre oracle ends at 28:19
}


class ImportFailed(Exception):
    """A failed validation; no output has been written."""


def json_line(value):
    return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def read_module(archive, testament):
    """Read bounded little-endian zCom indexes directly from an open ZipFile."""
    prefix = f"modules/comments/zcom/tsk/{testament}"
    bzs, bzv, bzz = (archive.read(prefix + suffix) for suffix in (".bzs", ".bzv", ".bzz"))
    if len(bzs) % 12 or len(bzv) % 10:
        raise ImportFailed(f"{testament}: truncated index")
    blocks = []
    for offset, size, expected in struct.iter_unpack("<III", bzs):
        if offset + size > len(bzz) or expected > 32_000_000:
            raise ImportFailed(f"{testament}: block outside file or oversized")
        decoder = zlib.decompressobj()
        block = decoder.decompress(bzz[offset:offset + size], expected + 1)
        # SWORD's pinned writer includes 1,024 trailing padding bytes in each
        # recorded compressed size. They are outside the zlib stream.
        if (len(block) != expected or not decoder.eof
                or decoder.unused_data not in (b"", b"\0" * 1024)):
            raise ImportFailed(f"{testament}: uncompressed block size/stream mismatch")
        blocks.append(block)
    entries = []
    for block, offset, size in struct.iter_unpack("<IIH", bzv):
        if not size:
            entries.append("")
            continue
        if block >= len(blocks) or offset + size > len(blocks[block]):
            raise ImportFailed(f"{testament}: entry outside block")
        # The module contains replacement characters in notes, never references.
        entries.append(blocks[block][offset:offset + size].decode("utf-8", errors="replace"))
    return entries


def load_verses(path):
    """ASV supplies the KJV layout; all translations supply target maxima."""
    layout, seen = {}, set()
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.strip():
            continue
        row = json.loads(line)
        key = row["book_number"], row["chapter"], row["verse"]
        if key in seen or min(key) < 1 or key[0] > 66:
            raise ImportFailed("ASV: duplicate or invalid verse")
        seen.add(key)
        layout[key[:2]] = max(layout.get(key[:2], 0), key[2])
    if len(seen) != 31102 or len(layout) != 1189 or sum(layout.values()) != len(seen):
        raise ImportFailed("ASV: expected 31,102 contiguous verses in 1,189 chapters")
    for book in range(1, 67):
        chapters = sorted(c for b, c in layout if b == book)
        if not chapters or chapters != list(range(1, chapters[-1] + 1)):
            raise ImportFailed(f"ASV: missing chapter in book {book}")
    maxima = dict(layout)
    for translation in sorted(path.parent.glob("*.jsonl")):
        for line in translation.read_text(encoding="utf-8").splitlines():
            if line.strip():
                row = json.loads(line)
                key = row["book_number"], row["chapter"]
                maxima[key] = max(maxima.get(key, 0), row["verse"])
    return layout, maxima


def verse_entries(entries, testament, layout):
    expected = 24115 if testament == "ot" else 8246
    if len(entries) != expected:
        raise ImportFailed(f"{testament}: expected {expected} entries, got {len(entries)}")
    index, aligned, excluded = 2, 0, 0
    books = range(1, 40) if testament == "ot" else range(40, 67)
    result = []
    excluded += sum(len(REF_TAG.findall(e)) for e in entries[:2])
    for book in books:
        excluded += len(REF_TAG.findall(entries[index]))
        index += 1  # book header
        for chapter in sorted(c for b, c in layout if b == book):
            if index >= len(entries):
                raise ImportFailed("ASV layout overruns module index")
            excluded += len(REF_TAG.findall(entries[index]))
            index += 1  # chapter header
            first = entries[index]
            anchors = [PASSAGE.search(attrs) for attrs, _ in REF_TAG.findall(first)]
            for anchor in filter(None, anchors):
                # Seven Joshua outline anchors use 'Josh', unlike the lists.
                match = re.fullmatch(r"([1-3]?[A-Za-z]+) (\d+):\d+", anchor[1])
                if not match or (BOOKS.get({"Josh": "Jos"}.get(match[1], match[1])), int(match[2])) != (book, chapter):
                    raise ImportFailed(f"chapter alignment: {book}:{chapter} has {anchor[1]!r}")
            aligned += int(any(anchors))
            for verse in range(1, layout[book, chapter] + 1):
                if index >= len(entries):
                    raise ImportFailed("ASV layout overruns module index")
                result.append(((book, chapter, verse), entries[index]))
                index += 1
    if index != len(entries):
        raise ImportFailed(f"{testament}: ASV layout uses {index} of {len(entries)} entries")
    return result, aligned, excluded


def reference_lists(entry):
    """Yield tagged lists and ONLY whole reference-only br-delimited lines, in order."""
    candidates = []
    previous_end = None
    for match in REF_TAG.finditer(entry):
        if not PASSAGE.search(match[1]):
            raw = html.unescape(match[2])
            # SWORD wraps long lists into adjacent scripRef tags. Only a new
            # keyword/prose resets context, not a br between these fragments.
            if previous_end is not None and not BREAK.sub("", entry[previous_end:match.start()]).strip():
                start, kind, before = candidates[-1]
                candidates[-1] = (start, kind, before + ";" + raw)
            else:
                candidates.append((match.start(), "tagged", raw))
            previous_end = match.end()
        else:
            previous_end = None
    # Replace tags with spaces, preserving offsets and preventing partial prose
    # next to a tag from becoming an independent reference line.
    masked = REF_TAG.sub(lambda m: " " * len(m[0]), entry)
    start = 0
    for br in list(BREAK.finditer(masked)) + [None]:
        end = br.start() if br else len(masked)
        line = html.unescape(masked[start:end]).strip()
        if line and re.fullmatch(r"[A-Za-z\d\s,:;*\-]+", line) and re.search(r"\d+:\d+", line):
            # Whole-line lexical validation: prose with a verse mention fails.
            clean = STAR.sub("", line)
            remainder = ATOM.sub("", clean)
            if not remainder.strip(" \t\r\n,;"):
                candidates.append((start, "untagged", line))
        if br:
            start = br.end()
    return [(kind, raw) for _, kind, raw in sorted(candidates)]


def independent_count(raw):
    """A separate lexical counter, without parser, book table, or tokenizer calls.

    Count each numeric address/range once (not each verse in a range). Book
    numerals are consumed with their names. Star annotations have no numerals;
    the real Joh 10:22 following '*title' is still counted.
    """
    return len(re.findall(
        r"(?<![A-Za-z0-9])(?:[1-3]?[A-Za-z]+\s+)?\d+(?:\s*:\s*,?\s*\d*)*"
        r"(?:\s*,?\s*-\s*(?:[1-3]?[A-Za-z]+\s+)?\d+(?:\s*:\s*\d+)*)*", raw
    ))


def _targets(book, chapter, start, end_book, end_chapter, end, maxima):
    if (book, chapter, start) > (end_book, end_chapter, end):
        raise ValueError("reversed range")
    if not 1 <= start <= maxima.get((book, chapter), 0) or not 1 <= end <= maxima.get((end_book, end_chapter), 0):
        raise ValueError("target verse does not exist")
    result = []
    for b in range(book, end_book + 1):
        chapters = sorted(c for bb, c in maxima if bb == b)
        if not chapters:
            raise ValueError("target book does not exist")
        first = chapter if b == book else 1
        last = end_chapter if b == end_book else chapters[-1]
        for c in range(first, last + 1):
            if (b, c) not in maxima:
                raise ValueError("target chapter does not exist")
            lo = start if (b, c) == (book, chapter) else 1
            hi = end if (b, c) == (end_book, end_chapter) else maxima[b, c]
            result.append((b, c, lo, hi if hi != lo else None))
    return result


def parse_list(raw, origin, maxima):
    """Return targets plus a fully auditable accounting of every source item."""
    targets, drops, splits, stars, corrections = [], [], [], [], []
    clean = STAR.sub(lambda m: stars.append(m[0]) or "", raw)
    book, chapter = origin[:2]
    parsed = 0
    for part in clean.split(";"):
        position = 0
        while position < len(part):
            separator = re.match(r"[\s,]+", part[position:])
            if separator:
                position += separator.end()
                continue
            match = ATOM.match(part, position)
            if not match:
                # An unknown shape consumes the rest of this semicolon item.
                tail = part[position:].strip()
                parsed += 1
                drops.append({"raw": tail, "list": raw, "from": list(origin), "reason": "unreadable reference"})
                break
            token = match[0]
            position = match.end()
            parsed += 1
            replacement = ERRATA.get((origin, token))
            if replacement:
                corrections.append({"from": list(origin), "raw": token, "corrected": replacement})
                match = ATOM.fullmatch(replacement)
            if match["book"]:
                book = BOOKS[match["book"]]
            try:
                if match["extra"]:
                    raise ValueError("ambiguous chained range")
                start_parts = [int(x) for x in re.sub(r"[\s,]", "", match["start"]).split(":")]
                if len(start_parts) >= 2:
                    chapter = start_parts[0]  # still known if the verse punctuation is corrupt
                if len(start_parts) == 2:
                    chapter, start = start_parts
                elif len(start_parts) == 1:
                    start = start_parts[0]
                else:
                    raise ValueError("ambiguous triple-colon address")
                eb, ec, end = book, chapter, start
                if match["end_book"]:
                    eb = BOOKS[match["end_book"]]
                if match["end"]:
                    end_parts = [int(x) for x in match["end"].split(":")]
                    if len(end_parts) == 2:
                        ec, end = end_parts
                    elif len(end_parts) == 1 and not match["end_book"]:
                        end = end_parts[0]
                    else:
                        raise ValueError("unreadable range endpoint")
                rows = _targets(book, chapter, start, eb, ec, end, maxima)
                targets.extend(rows)
                if len(rows) > 1:
                    splits.append({"from": list(origin), "raw": token, "extra_rows": len(rows) - 1, "rows": len(rows)})
                book, chapter = eb, ec
            except ValueError as exc:
                drops.append({"raw": token, "list": raw, "from": list(origin), "reason": str(exc)})
    return {"targets": targets, "items": parsed, "drops": drops, "splits": splits,
            "stars": stars, "corrections": corrections}


def build_rows(entries, maxima):
    rows, drops, splits, stars, corrections, none = [], [], [], [], [], []
    counts, parser, independent, dropped, extras = (Counter() for _ in range(5))
    tagged_lists = 0
    per_book = Counter()
    for origin, entry in entries:
        before = len(rows)
        for attrs, raw in REF_TAG.findall(entry):
            if not PASSAGE.search(attrs):
                tagged_lists += 1
                # Count original strings, before grouping adjacent fragments.
                independent["tagged"] += independent_count(html.unescape(raw))
        for kind, raw in reference_lists(entry):
            if kind == "untagged":
                independent[kind] += independent_count(raw)
            parsed = parse_list(raw, origin, maxima)
            parser[kind] += parsed["items"]
            dropped[kind] += len(parsed["drops"])
            extras[kind] += sum(s["extra_rows"] for s in parsed["splits"])
            drops.extend(dict(d, kind=kind) for d in parsed["drops"])
            splits.extend(dict(s, kind=kind) for s in parsed["splits"])
            stars.extend({"from": list(origin), "raw": s, "list": raw} for s in parsed["stars"])
            corrections.extend(parsed["corrections"])
            for b, c, lo, hi in parsed["targets"]:
                rows.append({"id": len(rows) + 1, "from_book_number": origin[0],
                             "from_chapter": origin[1], "from_verse": origin[2],
                             "to_book_number": b, "to_chapter": c, "to_verse_start": lo,
                             "to_verse_end": hi, "votes": None, "source": "treasury_scripture"})
                counts[kind] += 1
                per_book[str(origin[0])] += 1
        if len(rows) == before:
            none.append(list(origin))
    for kind in ("tagged", "untagged"):
        if parser[kind] != independent[kind] or counts[kind] != independent[kind] - dropped[kind] + extras[kind]:
            raise ImportFailed(f"{kind}: independent count mismatch: parser={parser[kind]}, independent={independent[kind]}, rows={counts[kind]}, drops={dropped[kind]}, extra split rows={extras[kind]}")
    if sum(dropped.values()) > sum(independent.values()) * 0.002:
        raise ImportFailed(f"drops exceed 0.2%: {sum(dropped.values())}/{sum(independent.values())}")
    report = {"total_rows": len(rows), "rows_tagged": counts["tagged"], "rows_untagged": counts["untagged"],
              "parser_items": dict(parser), "independent_items": dict(independent),
              "tagged_lists": tagged_lists, "drops": drops, "drop_count": len(drops),
              "cross_chapter_splits": splits, "extra_split_rows": dict(extras),
              "star_items": stars, "star_count": len(stars), "errata_applied": corrections,
              "rows_per_book": {str(b): per_book[str(b)] for b in range(1, 67)},
              "verses_with_references": len(entries) - len(none), "verses_with_none": none}
    return rows, report


def gzip_rows(rows):
    buffer = io.BytesIO()
    with gzip.GzipFile(filename="", mode="wb", fileobj=buffer, compresslevel=9, mtime=0) as stream:
        for row in rows:
            stream.write((json_line(row) + "\n").encode("utf-8"))
    return buffer.getvalue()


def manifest_bytes(current, data, count):
    manifest = json.loads(current)
    canonical = lambda value: (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n").encode("utf-8")
    if canonical(manifest) != current:
        raise ImportFailed("MANIFEST.json: not in the canonical format")
    manifest["files"][OUT_FILE] = {"rows": count, "sha256": hashlib.sha256(data).hexdigest(), "table": "cross_references"}
    manifest["tables"]["cross_references"] = sum(e["rows"] for e in manifest["files"].values() if e["table"] == "cross_references")
    upstream = manifest.setdefault("upstream", {})
    if isinstance(upstream, list):
        upstream[:] = [e for e in upstream if e.get("name") != "TSK.zip"] + [dict(UPSTREAM)]
    elif isinstance(upstream, dict):
        upstream["TSK.zip"] = dict(UPSTREAM)
    else:
        raise ImportFailed("MANIFEST.json: upstream must be a dictionary or list")
    return canonical(manifest)


def run(upstream, out, verses=DEFAULT_VERSES, report_path=None):
    data = (upstream / "sword-tsk/TSK.zip").read_bytes()
    actual = hashlib.sha256(data).hexdigest()
    if actual != ZIP_SHA256:
        raise ImportFailed(f"TSK.zip: sha256 mismatch (expected {ZIP_SHA256}, file {actual})")
    layout, maxima = load_verses(verses)
    entries, alignment, excluded = [], 0, 0
    with zipfile.ZipFile(io.BytesIO(data)) as archive:
        for testament in ("ot", "nt"):
            mapped, checked, headers = verse_entries(read_module(archive, testament), testament, layout)
            entries.extend(mapped)
            alignment += checked
            excluded += headers
    rows, report = build_rows(entries, maxima)
    report.update(chapters_alignment_checked=alignment, excluded_header_tags=excluded)
    compressed = gzip_rows(rows)
    report.update(file_sha256=hashlib.sha256(compressed).hexdigest(), file_size=len(compressed))
    manifest = out / "MANIFEST.json"
    updated = manifest_bytes(manifest.read_bytes(), compressed, len(rows)) if manifest.exists() else None
    report_data = (json.dumps(report, indent=2, sort_keys=True, ensure_ascii=False) + "\n").encode("utf-8")
    # No output directory creation, report, or manifest changes until ALL checks pass.
    if report_path and report_path.resolve() in {(out / OUT_FILE).resolve(), manifest.resolve()}:
        raise ImportFailed("report path overlaps content output")
    out.mkdir(parents=True, exist_ok=True)
    (out / OUT_FILE).write_bytes(compressed)
    if updated is not None:
        manifest.write_bytes(updated)
    if report_path:
        report_path.parent.mkdir(parents=True, exist_ok=True)
        report_path.write_bytes(report_data)
    return report


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--upstream", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--verses", type=Path, default=DEFAULT_VERSES)
    parser.add_argument("--report", type=Path)
    args = parser.parse_args(argv)
    try:
        report = run(args.upstream, args.out, args.verses, args.report)
    except (ImportFailed, OSError, ValueError, KeyError, IndexError, struct.error, zipfile.BadZipFile, zlib.error) as exc:
        print(f"import failed: {exc}", file=sys.stderr)
        return 1
    print(f"cross_references: {report['total_rows']} rows (tagged {report['rows_tagged']}, untagged {report['rows_untagged']})")
    print(f"counters: parser {report['parser_items']}; independent {report['independent_items']}")
    print(f"drops: {report['drop_count']}; star annotations: {report['star_count']}")
    print(f"{OUT_FILE}: {report['file_size']} bytes; sha256 {report['file_sha256']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
