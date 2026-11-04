"""Import the two pinned CCEL ThML classics; standard library only, including under -I.

All hashes, text conservation, references, coverage, legacy comparisons and manifest
checks finish in memory before any output is written. No DTD or network is loaded.
Usage: python -I scripts/import_classics.py --upstream DIR --out content/source
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import gzip
import hashlib
import html.entities
import io
import json
from pathlib import Path
import re
import subprocess
import sys
import unicodedata
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parent.parent
OSIS = dict(zip(
    "Gen Exod Lev Num Deut Josh Judg Ruth 1Sam 2Sam 1Kgs 2Kgs 1Chr 2Chr Ezra Neh "
    "Esth Job Ps Prov Eccl Song Isa Jer Lam Ezek Dan Hos Joel Amos Obad Jonah Mic Nah "
    "Hab Zeph Hag Zech Mal Matt Mark Luke John Acts Rom 1Cor 2Cor Gal Eph Phil Col "
    "1Thess 2Thess 1Tim 2Tim Titus Phlm Heb Jas 1Pet 2Pet 1John 2John 3John Jude Rev".split(),
    range(1, 67),
))
CCEL_POLICY = (' CCEL\'s site policy (https://ccel.org/about/copyright.html, read 2026-11-04) '
               'says its books "may be used for personal, educational, or non-profit purposes" '
               'and asks that people contact CCEL for permission to republish CCEL works or use them commercially.')
UPSTREAM = {
    "ccel-mhcc/mhcc.xml": {
        "name": "Matthew Henry's Concise Commentary",
        "url": "https://www.ccel.org/ccel/h/henry/mhcc.xml",
        "sha256": "4a5509ba5064b54572397ae1a796561ff6ce4a1e18f366af0141a09c5d06fcd6",
        "version": "CCEL ThML 1.0 (2001-06-20)",
        "license": "Public Domain",
        "license_basis": "Henry died 1714; CCEL's file states DC.Rights Public Domain; CrossWire distributes the same CCEL text as DistributionLicense=Public Domain." + CCEL_POLICY,
        "retrieved": "2026-11-04",
    },
    "ccel-jfb/jfb.xml": {
        "name": "Jamieson-Fausset-Brown Commentary",
        "url": "https://www.ccel.org/ccel/j/jamieson/jfb.xml",
        "sha256": "ce16900c4795d9bd3dc7f7aaec3fccd395c166d4d9593a14b9aae06869aab9af",
        "version": "CCEL ThML 1.0 (2002-11-29); Ernie Stefanik electronic edition (1999-10-17)",
        "license": "Public Domain",
        "license_basis": 'Published 1871; CCEL\'s file states DC.Rights Public Domain; the electronic editor\'s note says the edition "is in the public domain and may be freely used and distributed"; CrossWire distributes the same CCEL text as DistributionLicense=Public Domain.' + CCEL_POLICY,
        "retrieved": "2026-11-04",
    },
}

# Reference corrections are deliberately local to pinned element IDs, never heuristics.
ERRATA = {
    ("matthew_henry", "xiii"): ("missing Chapter 1 wrapper", "|2Kgs|1|0|0|0"),  # 2 Kings 1 is directly inside its book div1, before Chapter 2.
    ("matthew_henry", "xv"): ("missing Chapter 1 wrapper", "|2Chr|1|0|0|0"),  # 2 Chronicles 1 likewise has no div2; its prefix is outline + chapter body.
    ("matthew_henry", "xxxv.iii-p6.1"): ("|John|3|1|3|8", "|John|3|1|3|21"),  # The same paragraph continues through 9-21 (new birth, serpent, love, belief, light); CCEL lost the subdivision.
    ("matthew_henry", "lvii.i-p12.1"): ("|Judg|1|1|1|4", "|Jude|1|1|1|4"),  # Jude, not Judges: its five markers use Judg.
    ("matthew_henry", "lvii.i-p13.1"): ("|Judg|1|5|1|7", "|Jude|1|5|1|7"),  # Jude 5-7.
    ("matthew_henry", "lvii.i-p14.4"): ("|Judg|1|8|1|16", "|Jude|1|8|1|16"),  # Jude 8-16.
    ("matthew_henry", "lvii.i-p15.3"): ("|Judg|1|17|1|23", "|Jude|1|17|1|23"),  # Jude 17-23.
    ("matthew_henry", "lvii.i-p16.1"): ("|Judg|1|24|1|25", "|Jude|1|24|1|25"),  # Jude 24-25.
    ("jfb", "xi.xxiv.i"): ("Introduction", "|2John|1|0|0|0", "xi.xxiv.i-p5.7"),  # 2 John's verse notes are inside Introduction; omit the prose before its first verse marker.
    ("jfb", "xi.xxv.i"): ("Introduction", "|3John|1|0|0|0", "xi.xxv.i-p0.1"),  # 3 John's entire div is verse commentary, with no introductory prose.
    ("jfb", "xi.xxvi.i"): ("Introduction", "|Jude|1|0|0|0", "xi.xxvi.i-p9"),  # Jude's verse-1 marker precedes the introduction; body begins with the Jude 1-25 section heading.
}


class ImportFailed(Exception):
    """A validation failure: no output has been written."""


def compact(value) -> str:
    return json.dumps(value, sort_keys=True, ensure_ascii=False, separators=(",", ":"))


def pretty(value) -> bytes:
    return (json.dumps(value, sort_keys=True, ensure_ascii=False, indent=2) + "\n").encode("utf-8")


def clean(text: str) -> str:
    return unicodedata.normalize("NFC", re.sub(r"\s+", " ", text).strip())


def letters(text: str) -> str:
    """Whitespace-independent NFC text for the conservation check (no words discarded)."""
    return re.sub(r"\s", "", unicodedata.normalize("NFC", text))


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def gzip_bytes(data: bytes) -> bytes:
    buffer = io.BytesIO()
    with gzip.GzipFile(filename="", mode="wb", fileobj=buffer, compresslevel=9, mtime=0) as gz:
        gz.write(data)
    return buffer.getvalue()


def parse_xml(data: bytes) -> ET.Element:
    # ElementTree does not fetch external DTDs. Explicitly decode HTML named entities
    # should an edition need them; unknown names fail rather than silently losing text.
    text = data.decode("utf-8-sig")
    if re.search(r"<!ENTITY\b|<!DOCTYPE[^>]*\[", text, re.I):
        raise ImportFailed("unexpected internal DTD/entity declaration")

    def entity(match):
        name = match[1]
        if name in {"amp", "lt", "gt", "quot", "apos"}:
            return match[0]
        value = html.entities.html5.get(name + ";")
        if value is None:
            raise ImportFailed(f"undefined XML entity &{name};")
        return "".join(f"&#{ord(c)};" for c in value)

    return ET.fromstring(re.sub(r"&([A-Za-z][A-Za-z0-9]+);", entity, text))


def parse_ref(parsed: str) -> tuple[int, int, int, int, int]:
    match = re.fullmatch(r"\|([^|]+)\|(\d+)\|(\d+)\|(\d+)\|(\d+)", parsed)
    if match is None or match[1] not in OSIS:
        raise ImportFailed(f"unrecognised parsed reference: {parsed!r}")
    return OSIS[match[1]], *(int(match[i]) for i in range(2, 6))


def bold_marker(element: ET.Element):
    if element.tag != "p" or clean(element.text or "") or not len(element):
        return None
    first = element[0]
    if first.tag == "b" and not clean(first.text or "") and len(first) and first[0].tag == "scripRef":
        return first[0]
    return None


def text_atoms(element):
    """Every XML text/tail slot inside element, exactly once (excluding its own tail)."""
    yield (id(element), "text"), element.text or ""
    for child in element:
        yield from text_atoms(child)
        yield (id(child), "tail"), child.tail or ""


class ChapterStream:
    """Walk nested divs in document order, retaining an auditable owner for every text slot."""

    def __init__(self, source, book, chapter, limits, report):
        self.source, self.book, self.chapter = source, book, chapter
        self.limits, self.report = limits, report
        self.owners = {}
        self.pending = []
        self.lead = []
        self.entries = []
        self.current = None
        self.kept = []
        self.drop_chars = 0
        self.drop_characters = Counter()
        self.drops = Counter()

    def atom(self, key, text, owner="entry"):
        if key in self.owners:
            raise ImportFailed("text conservation: XML text slot assigned twice")
        self.owners[key] = owner
        if owner == "entry":
            self.pending.append(text)
            self.kept.append(text)
        else:
            self.drop_chars += len(letters(text))
            self.drop_characters[owner] += len(letters(text))

    def drop(self, element, category):
        atoms = list(text_atoms(element))
        if any(clean(t) for _, t in atoms):
            self.drops[category] += 1
        for key, text in atoms:
            self.atom(key, text, category)

    def flush(self):
        text = clean("".join(self.pending))
        self.pending = []
        if text:
            (self.lead if self.current is None else self.current["paragraphs"]).append(text)

    def marker(self, element):
        self.flush()
        parsed = element.get("parsed", "")
        correction = ERRATA.get((self.source, element.get("id")))
        if correction:
            before, after = correction
            if parsed != before:
                raise ImportFailed(f"erratum no longer matches {element.get('id')}")
            self.report["errata_applied"].append({"source": self.source, "id": element.get("id"), "before": before, "after": after})
            parsed = after
        book, chapter, start, end_chapter, end = parse_ref(parsed)
        if start == 0:
            return
        if (book, chapter) != (self.book, self.chapter):
            raise ImportFailed(f"{self.source} {element.get('id')}: marker {parsed} outside containing chapter {self.book}:{self.chapter}")
        last = self.limits[(book, chapter)]
        if end_chapter not in (0, chapter):
            self.report["cross_chapter_ranges"].append({"source": self.source, "id": element.get("id"), "parsed": parsed, "verse_end": last})
            end = last
        end = end or start
        if not 1 <= start <= end <= last:
            raise ImportFailed(f"{self.source} {element.get('id')}: invalid range {parsed}, last verse {last}")
        self.current = {"source": self.source, "book_number": book, "chapter": chapter,
                        "verse_start": start, "verse_end": end if end != start else None,
                        "_element_id": element.get("id"),
                        "_entry_form": "bold_reference" if element.tag == "scripRef" else "commentary_div",
                        "_leading_reference": clean("".join(element.itertext())) if element.tag == "scripRef" else "",
                        "paragraphs": []}
        if not self.entries:
            self.current["paragraphs"].extend(self.lead)
            self.lead = []
        self.entries.append(self.current)

    def walk(self, element, drops, inline=False):
        if element in drops:
            self.flush()
            self.drop(element, drops[element])
            return
        if element.tag == "scripCom":
            self.marker(element)
            # Normally empty. Account for every slot even in a hand-authored snippet.
            self.atom((id(element), "text"), element.text or "")
            if len(element):
                raise ImportFailed("scripCom must be an empty marker")
            return
        marker = bold_marker(element) if self.source == "matthew_henry" else None
        if marker is not None:
            self.marker(marker)
        block = not inline and element.tag in {"p", "div", "tr", "l", "verse", "blockquote", "table"}
        if block:
            self.flush()
        self.atom((id(element), "text"), element.text or "")
        for child in element:
            self.walk(child, drops, inline or element.tag == "tr")
            self.atom((id(child), "tail"), child.tail or "")
            # Table cells are separated even if their XML has no intervening whitespace.
            if element.tag == "tr" or child.tag == "br":
                self.pending.append(" ")
        if block:
            self.flush()

    def finish(self, element, drops):
        self.walk(element, drops)
        self.flush()
        if not self.entries and self.lead:
            self.entries.append({"source": self.source, "book_number": self.book, "chapter": self.chapter,
                                 "verse_start": 1, "verse_end": self.limits[(self.book, self.chapter)],
                                 "_element_id": element.get("id"), "_entry_form": "unmarked_chapter_body",
                                 "_leading_reference": "",
                                 "paragraphs": self.lead})
        if self.lead and self.current is not None:
            raise ImportFailed("unassigned chapter lead")
        expected = dict(text_atoms(element))
        if set(expected) != set(self.owners):
            raise ImportFailed("text conservation: XML text slots missing")
        rows = []
        conserved = []
        for entry in self.entries:
            paragraphs = entry.pop("paragraphs")
            element_id, entry_form = entry.pop("_element_id"), entry.pop("_entry_form")
            leading_reference = entry.pop("_leading_reference")
            if not paragraphs:
                # CCEL creates empty Commentary divs for verses with no note. These
                # markers own no text and produce no row; report the uncovered verses.
                self.report.setdefault("markers_without_text", {}).setdefault(self.source, []).append(
                    [self.book, self.chapter, entry["verse_start"], entry["verse_end"]])
                continue
            entry["content"] = (" " if self.source == "matthew_henry" else "\n").join(paragraphs)
            stripped = []
            if self.source == "matthew_henry" and entry_form != "commentary_div":
                if leading_reference:
                    if not entry["content"].startswith(leading_reference):
                        raise ImportFailed("leading Matthew Henry reference does not match its XML label")
                    entry["content"] = entry["content"][len(leading_reference):]
                    stripped.append(("leading_reference", leading_reference))
                dash = re.match(r"[\s\-–—]*", entry["content"])[0]
                entry["content"] = entry["content"][len(dash):]
                stripped.append(("leading_dash", dash))
                for category, text in stripped:
                    count = len(letters(text))
                    if count:
                        self.drops[category] += 1
                        self.drop_chars += count
                        self.drop_characters[category] += count
            if not entry["content"]:
                raise ImportFailed("Matthew Henry prefix stripping left empty content")
            conserved.append("".join(text for _, text in stripped) + entry["content"])
            if self.source == "matthew_henry":
                self.report.setdefault("mh_entry_provenance", []).append({
                    "reference": [entry[k] for k in ("book_number", "chapter", "verse_start", "verse_end")],
                    "element_id": element_id, "entry_form": entry_form})
            rows.append(entry)
        # Compare text itself, not just its length. Separators/whitespace are the only
        # changes allowed; every non-whitespace character must occur once, in order.
        incoming = "".join(letters(t) for t in self.kept)
        outgoing = "".join(letters(row["content"]) for row in rows)
        if incoming != "".join(letters(text) for text in conserved):
            raise ImportFailed(f"text conservation failed in {self.source} {self.book}:{self.chapter}")
        chars_in = sum(len(letters(t)) for t in expected.values())
        if chars_in != len(outgoing) + self.drop_chars:
            raise ImportFailed("text conservation: input/output/drop character imbalance")
        return rows, {"characters_in": chars_in, "characters_out": len(outgoing),
                      "characters_dropped": self.drop_chars, "drop_categories": dict(self.drops),
                      "drop_characters": dict(self.drop_characters)}


def chapter_drops(chapter, source):
    drops = {}
    if source == "matthew_henry":
        for e in chapter.iter():
            if e.tag in {"h1", "h2", "h3"}:
                drops[e] = "heading"
            elif e.tag == "table" and "Chapter Outline" in "".join(e.itertext()):
                drops[e] = "chapter_outline_table"
        # The alternate format has an outline paragraph followed by bold-reference
        # entries, or by a single unmarked whole-chapter body. Do not drop body-only
        # chapters or prose leads before ordinary Commentary divs.
        direct = [e for e in chapter if e.tag == "p" and clean("".join(e.itertext()))]
        has_divs = any(e.get("class") == "Commentary" for e in chapter.iter("div"))
        if chapter.find("table") is None and direct and (len(direct) >= 2 or has_divs) and bold_marker(direct[0]) is None:
            drops[direct[0]] = "chapter_outline_paragraph"
    else:
        for e in chapter.iter():
            text = clean("".join(e.itertext()))
            if e.tag in {"p", "div", "h1", "h2", "h3"} and re.fullmatch(r"(?:CHAPTERS?|PSALM)\s+(?:\(ELEGY\)\s+)?\d+(?:\s*[-–]\s*\d+)?[.]?", text, re.I):
                drops[e] = "bare_chapter_heading"
        correction = ERRATA.get((source, chapter.get("id")))
        if correction and correction[0] == "Introduction":
            boundary = correction[2]
            if not any(e.get("id") == boundary for e in chapter.iter()):
                raise ImportFailed(f"introduction boundary missing: {boundary}")
            reached = False

            def introductory_blocks(element):
                nonlocal reached
                if element.get("id") == boundary:
                    reached = True
                if reached:
                    return
                contains_boundary = any(e.get("id") == boundary for e in element.iter())
                if not contains_boundary and not any(e.tag == "scripCom" for e in element.iter()):
                    drops[element] = "book_introduction_block"
                    return
                for child in element:
                    introductory_blocks(child)

            introductory_blocks(chapter)
    return drops


def parse_classic(root, source, limits, report):
    book_tag, chapter_tag = ("div1", "div2") if source == "matthew_henry" else ("div2", "div3")
    rows = []
    audit = defaultdict(Counter)
    drops_total = Counter()
    drop_characters = Counter()
    for book_element in root.iter(book_tag):
        chapters = [c for c in book_element.findall(chapter_tag) if re.match(r"Chapter \d", c.get("title", ""))
                    or (source, c.get("id")) in ERRATA]
        if not chapters:
            continue
        # Identify the book by its OSIS reference, not by translated book titles.
        first = next((m for c in chapters for m in c.iter("scripCom") if m.get("parsed")), None)
        if first is None:
            raise ImportFailed(f"{source}: book has no OSIS markers")
        book = parse_ref(first.get("parsed"))[0]
        if source == "matthew_henry" and first.get("id") == "lvii.i-p12.1":
            book = parse_ref(ERRATA[(source, first.get("id"))][1])[0]
        prefix_erratum = ERRATA.get((source, book_element.get("id")))
        if prefix_erratum and prefix_erratum[0] == "missing Chapter 1 wrapper":
            chapter = ET.Element(chapter_tag, {"title": "Chapter 1"})
            for child in book_element:
                if child.tag == chapter_tag:
                    break
                chapter.append(child)
            chapters.insert(0, chapter)
            report["errata_applied"].append({"source": source, "id": book_element.get("id"),
                                            "before": prefix_erratum[0], "after": prefix_erratum[1]})
        for chapter in chapters:
            correction = ERRATA.get((source, chapter.get("id")))
            if correction and correction[0] == "Introduction":
                if chapter.get("title") != "Introduction":
                    raise ImportFailed(f"erratum no longer matches {chapter.get('id')}")
                number = parse_ref(correction[1])[1]
                report["errata_applied"].append({"source": source, "id": chapter.get("id"),
                    "before": correction[0], "after": correction[1], "body_starts_at": correction[2]})
            else:
                number = int(re.search(r"\d+", chapter.get("title"))[0])
            if (book, number) not in limits:
                raise ImportFailed(f"{source}: unknown chapter {book}:{number}")
            stream = ChapterStream(source, book, number, limits, report)
            entries, counts = stream.finish(chapter, chapter_drops(chapter, source))
            rows.extend(entries)
            for key in ("characters_in", "characters_out", "characters_dropped"):
                audit[book][key] += counts[key]
            drops_total.update(counts["drop_categories"])
            drop_characters.update(counts["drop_characters"])
    report["drop_categories"][source] = dict(sorted(drops_total.items()))
    report.setdefault("drop_characters", {})[source] = dict(sorted(drop_characters.items()))
    report["text_conservation"][source] = {str(b): dict(counts) for b, counts in sorted(audit.items())}
    return rows


def load_limits(out):
    limits = {}
    for path in sorted((out / "verses").glob("*.jsonl")):
        for line in path.read_text(encoding="utf-8").splitlines():
            if line.strip():
                row = json.loads(line)
                key = row["book_number"], row["chapter"]
                limits[key] = max(limits.get(key, 0), row["verse"])
    books = [json.loads(l) for l in (out / "books.jsonl").read_text(encoding="utf-8").splitlines() if l.strip()]
    expected = {(b["book_number"], c) for b in books for c in range(1, b["total_chapters"] + 1)}
    if len(books) != 66 or len(expected) != 1189 or set(limits) != expected:
        raise ImportFailed("verse files/books do not describe all 1,189 canonical chapters")
    return limits


def uncovered_verses(rows, limits):
    covered = {(r["book_number"], r["chapter"], v) for r in rows
               for v in range(r["verse_start"], (r["verse_end"] or r["verse_start"]) + 1)}
    return [[b, c, v] for (b, c), last in sorted(limits.items())
            for v in range(1, last + 1) if (b, c, v) not in covered]


VERSE_LABEL = re.compile(r"^(\d+)((?:\s*[,\-–]\s*\d+)*)[.:]\s")


def apply_jfb_labels(rows, limits, report):
    """Derive note ranges from verse labels, keeping ambiguous labels on their marker."""
    before = uncovered_verses(rows, limits)
    audit = {"uncovered_before": before, "uncovered_before_count": len(before),
             "kept_on_marker": [], "shortened_ranges": [], "merged_duplicate_starts": []}
    chapters = defaultdict(list)
    for row in rows:
        chapters[(row["book_number"], row["chapter"])].append(row)
    result, gained = [], 0
    for (book, chapter), entries in sorted(chapters.items()):
        # The extra Matthew 5-8 overview and Matthew 5's first note both start at
        # 5:1. Retain that lead before the note, as a single entry, without losing text.
        unique = {}
        for row in entries:
            start = row["verse_start"]
            if start in unique:
                previous = unique[start]
                previous["content"] += "\n" + row["content"]
                end = max(previous["verse_end"] or start, row["verse_end"] or start)
                previous["verse_end"] = end if end != start else None
                audit["merged_duplicate_starts"].append({"reference": [book, chapter, start],
                    "reason": "Chapter lead and note shared a first verse; text joined in document order"})
            else:
                unique[start] = dict(row)
        original_starts = set(unique)
        assigned = set()
        adjusted = []
        for marker, row in sorted(unique.items()):
            match = next((m for p in row["content"].split("\n") if (m := VERSE_LABEL.match(p))), None)
            was_range = row["verse_end"] is not None
            if match:
                numbers = [int(n) for n in re.findall(r"\d+", match[0])]
                a, b = numbers[0], numbers[-1]
                reason = None
                if not 1 <= a <= b or a > limits[(book, chapter)]:
                    reason = "label outside chapter bounds"
                elif not (a <= marker <= b or (b == marker - 1 and a not in original_starts)):
                    reason = "label does not contain or immediately precede marker"
                elif a in original_starts - {marker} or a in assigned:
                    reason = "label first verse already has an entry"
                if reason:
                    audit["kept_on_marker"].append({"book_number": book, "chapter": chapter,
                        "marker": marker, "label": match[0].strip(), "reason": reason})
                else:
                    row["verse_start"], row["verse_end"] = a, b if b != a else None
            assigned.add(row["verse_start"])
            adjusted.append((row, was_range))
        adjusted.sort(key=lambda item: item[0]["verse_start"])
        for index, (row, was_range) in enumerate(adjusted):
            start, end = row["verse_start"], row["verse_end"] or row["verse_start"]
            if end > limits[(book, chapter)]:
                audit["shortened_ranges"].append({"reference": [book, chapter, start],
                    "before": end, "after": limits[(book, chapter)], "reason": "chapter end"})
                end = limits[(book, chapter)]
            if index + 1 < len(adjusted):
                next_start = adjusted[index + 1][0]["verse_start"]
                if end >= next_start:
                    audit["shortened_ranges"].append({"reference": [book, chapter, start],
                        "before": end, "after": next_start - 1, "next_entry_start": next_start})
                    end = next_start - 1
            if not 1 <= start <= end <= limits[(book, chapter)]:
                raise ImportFailed(f"JFB label range invalid: {book}:{chapter}:{start}-{end}")
            row["verse_end"] = end if end != start else None
            gained += int(not was_range and end > start)
            result.append(row)
        if len(assigned) != len(adjusted):
            raise ImportFailed(f"JFB first verses collide in {book}:{chapter}")
    after = uncovered_verses(result, limits)
    audit.update(uncovered_after=after, uncovered_after_count=len(after), rows_gained_range=gained,
                 rows_with_ranges=sum(r["verse_end"] is not None for r in result))
    report["jfb_verse_labels"] = audit
    return result


def coverage(rows, source, limits, report):
    rows = [r for r in rows if r["source"] == source]
    counts = Counter(r["book_number"] for r in rows)
    chapters = {(r["book_number"], r["chapter"]) for r in rows}
    missing = sorted(set(limits) - chapters)
    if set(counts) != set(range(1, 67)):
        raise ImportFailed(f"{source}: books with no entries: {sorted(set(range(1, 67)) - set(counts))}")
    if source in {"matthew_henry", "summary"} and missing:
        raise ImportFailed(f"{source}: missing chapters: {missing}")
    for r in rows:
        key = r["book_number"], r["chapter"]
        if not r["content"] or key not in limits or not 1 <= r["verse_start"] <= (r["verse_end"] or r["verse_start"]) <= limits[key]:
            raise ImportFailed(f"invalid output row: {r}")
    report["verses_with_no_entry"][source] = uncovered_verses(rows, limits)
    report["sources"][source] = {
        "rows": len(rows), "chapters_covered": len(chapters), "chapters_missing": [list(k) for k in missing],
        "per_book": {str(b): {"rows": counts[b], "chapters_covered": sorted(c for bn, c in chapters if bn == b),
                              "chapters_missing": [c for bn, c in missing if bn == b],
                              **report["text_conservation"].get(source, {}).get(str(b), {})} for b in range(1, 67)},
    }
    return {"every_chapter": not missing, "rows_per_book": {str(b): counts[b] for b in range(1, 67)},
            "chapters_per_book": {str(b): sum(bn == b for bn, _ in chapters) for b in range(1, 67)}}


def legacy_comparison(rows, report):
    try:
        data = subprocess.check_output(["git", "show", "e1e8d9c:content/source/commentaries.jsonl"], cwd=ROOT)
    except subprocess.CalledProcessError as exc:
        raise ImportFailed("cannot read legacy Matthew Henry rows from origin/main") from exc
    old = [json.loads(l) for l in data.decode("utf-8").splitlines() if l.strip()]
    old = [r for r in old if r["source"] == "matthew_henry"]
    fields = ("book_number", "chapter", "verse_start", "verse_end", "content")
    found = {tuple(r[k] for k in fields) for r in rows}
    unmatched = []
    for r in old:
        if tuple(r[k] for k in fields) not in found:
            same_text = [n for n in rows if n["content"] == r["content"]]
            if not same_text:
                raise ImportFailed(f"old Matthew Henry row {r['id']}: content not reproduced")
            if r["book_number"] == 7 and any(n["book_number"] == 65 for n in same_text):
                reason = "CCEL's Jude markers say Judg; explicit ERRATA restores the text to Jude 1 instead of Judges 1"
            elif (r["book_number"], r["chapter"], r["verse_start"], r["verse_end"]) == (43, 3, 1, 8):
                reason = "CCEL combines the John 3:1-21 prose under a 1-8 marker; explicit ERRATA extends its range through 21, including verse 16"
            else:
                raise ImportFailed(f"old Matthew Henry row {r['id']}: unexpected reference difference")
            unmatched.append({"id": r["id"], "old_reference": [r[k] for k in fields[:-1]],
                              "new_references": [[n[k] for k in fields[:-1]] for n in same_text],
                              "reason": reason + "; content byte-identical"})
    report["old_matthew_henry_rows_not_reproduced"] = unmatched
    report["old_matthew_henry_rows_checked"] = len(old)
    old_signatures = {tuple(r[k] for k in fields) for r in old}
    provenance = {tuple(p["reference"]): p for p in report.pop("mh_entry_provenance", [])}
    reasons = {
        "bold_reference": "Old importer only recognised Commentary divs; this entry starts with a bold scripRef paragraph",
        "unmarked_chapter_body": "Old importer only recognised Commentary divs; this chapter has unmarked body prose",
        "commentary_div": "Existing text is retained with an explicit reference correction (see ERRATA)",
    }
    report["recovered_matthew_henry_entries"] = []
    for row in rows:
        if tuple(row[k] for k in fields) not in old_signatures:
            detail = provenance[tuple(row[k] for k in fields[:-1])]
            report["recovered_matthew_henry_entries"].append({
                "id": row["id"], **detail, "reason": reasons[detail["entry_form"]]})
    old_chapters = {(r["book_number"], r["chapter"]) for r in old}
    report["recovered_matthew_henry_chapters"] = [list(k) for k in sorted(
        {(r["book_number"], r["chapter"]) for r in rows} - old_chapters)]


def update_manifest(current, outputs, declarations):
    """Merge only this importer's entries, preserving other importers in either order."""
    manifest = json.loads(current)
    if pretty(manifest) != current:
        raise ImportFailed("MANIFEST.json: not in the canonical format")
    manifest["files"].pop("cross_references.jsonl", None)
    for name, (raw, count, table) in outputs.items():
        manifest["files"][name] = {"rows": count, "sha256": sha(raw), "table": table}
    for table in {entry["table"] for entry in manifest["files"].values()}:
        manifest["tables"][table] = sum(e["rows"] for e in manifest["files"].values() if e["table"] == table)
    manifest.setdefault("upstream", {}).update({Path(name).name: info for name, info in UPSTREAM.items()})
    manifest.setdefault("coverage", {}).update(declarations)
    return pretty(manifest)


def run(upstream: Path, out: Path, report_path: Path | None = None):
    data = {}
    for name, info in UPSTREAM.items():
        raw = (upstream / name).read_bytes()
        if sha(raw) != info["sha256"]:
            raise ImportFailed(f"{name}: sha256 mismatch (expected {info['sha256']}, file {sha(raw)})")
        data[name] = raw
    # Both hashes have passed before either XML document is parsed.
    limits = load_limits(out)
    report = {"sources": {}, "text_conservation": {}, "drop_categories": {}, "errata_applied": [],
              "cross_chapter_ranges": [], "verses_with_no_entry": {},
              "character_count_basis": "NFC non-whitespace characters; input = output + named drops; text/tail ownership is checked exactly once"}
    mh = parse_classic(parse_xml(data["ccel-mhcc/mhcc.xml"]), "matthew_henry", limits, report)
    jfb = parse_classic(parse_xml(data["ccel-jfb/jfb.xml"]), "jfb", limits, report)
    jfb = apply_jfb_labels(jfb, limits, report)
    for rows, first_id in ((mh, 1), (jfb, 20001)):
        rows.sort(key=lambda r: (r["book_number"], r["chapter"], r["verse_start"]))  # stable: document order breaks ties
        for i, row in enumerate(rows, first_id):
            row["id"] = i
    if len(mh) >= 10925:
        raise ImportFailed("Matthew Henry ids would collide with summaries")
    legacy_comparison(mh, report)
    existing = (out / "commentaries.jsonl").read_bytes().splitlines(keepends=True)
    summaries = [line for line in existing if json.loads(line)["source"] == "summary"]
    summary_rows = [json.loads(line) for line in summaries]
    if len(summaries) != 1189 or {r["id"] for r in summary_rows} != set(range(10925, 12114)):
        raise ImportFailed("expected the original 1,189 summary rows and ids")
    if len({r["id"] for r in mh + jfb + summary_rows}) != len(mh + jfb + summary_rows):
        raise ImportFailed("commentary ids collide")
    declarations = {source: coverage(rows, source, limits, report) for source, rows in
                    (("matthew_henry", mh), ("jfb", jfb), ("summary", summary_rows))}
    sources_data = (out / "commentary_sources.jsonl").read_bytes()
    sources_lines = sources_data.splitlines(keepends=True)
    sources_lines = [l for l in sources_lines if json.loads(l)["id"] != "jfb"]
    jfb_source = {"id": "jfb", "name": "Jamieson-Fausset-Brown Commentary", "license": "Public Domain",
                  "description": "Jamieson-Fausset-Brown's 1871 Commentary Critical and Explanatory on the Whole Bible, from the CCEL electronic edition.",
                  "created_at": "2026-11-04T00:00:00+00:00"}
    sources_bytes = b"".join(sources_lines) + (compact(jfb_source) + "\n").encode("utf-8")
    outputs = {
        "commentaries.jsonl": (("".join(compact(r) + "\n" for r in mh)).encode("utf-8") + b"".join(summaries), len(mh) + len(summaries), "commentaries"),
        "commentaries/jfb.jsonl.gz": (gzip_bytes(("".join(compact(r) + "\n" for r in jfb)).encode("utf-8")), len(jfb), "commentaries"),
        "commentary_sources.jsonl": (sources_bytes, len(sources_lines) + 1, "commentary_sources"),
    }
    # A later TSK run owns the populated file. Only bootstrap the placeholder when
    # absent; rerunning classics must preserve TSK's bytes and manifest entry.
    if not (out / "cross_references.jsonl.gz").exists():
        outputs["cross_references.jsonl.gz"] = (gzip_bytes(b""), 0, "cross_references")
    manifest_out = update_manifest((out / "MANIFEST.json").read_bytes(), outputs, declarations)
    report_bytes = pretty(report)
    # Every check passed. Only now create directories or write any output/report.
    for name, (raw, _, _) in outputs.items():
        path = out / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(raw)
    (out / "cross_references.jsonl").unlink(missing_ok=True)
    (out / "MANIFEST.json").write_bytes(manifest_out)
    if report_path is not None:
        report_path.write_bytes(report_bytes)
    return report


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--upstream", required=True, type=Path)
    parser.add_argument("--out", type=Path, default=ROOT / "content/source")
    parser.add_argument("--report", type=Path)
    args = parser.parse_args(argv)
    try:
        report = run(args.upstream, args.out, args.report)
    except (ImportFailed, OSError, ET.ParseError, ValueError) as exc:
        print(f"import failed: {exc}", file=sys.stderr)
        return 1
    for source, info in report["sources"].items():
        print(f"{source}: {info['rows']} rows, {info['chapters_covered']} chapters, missing {info['chapters_missing']}")
    print(f"old Matthew Henry rows not reproduced: {len(report['old_matthew_henry_rows_not_reproduced'])}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
