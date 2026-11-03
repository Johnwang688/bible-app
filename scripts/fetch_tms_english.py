#!/usr/bin/env python3
"""Fetch the English text of the 60 Navigators TMS verses and write it as Memory's data file.

    python scripts/fetch_tms_english.py            # ESV if ESV_API_KEY is set, else BSB
    python scripts/fetch_tms_english.py --bsb      # force BSB (our own backend)

The text is never typed by hand: it comes from the ESV API (api.esv.org, Crossway) when
``ESV_API_KEY`` is in the environment or the repo-root ``.env``, else from the BSB through our
own backend (``BIBLE_API_BASE``, default the live Cloud Run URL). Run it once, review the diff
and commit ``client/src/memory/library/tmsEnglish.ts``. Run it again after the key arrives to
swap BSB for ESV.

Two edits are made to the fetched text, both punctuation, never words: whitespace is collapsed
to single spaces, and a quotation mark left open or closed at the edge of a passage by a quote
that begins or ends outside it is dropped (Matthew 18:20 ends with the ” of a quote that opens
verses earlier). Only double marks: a ’ is also an apostrophe, so single marks cannot be
counted. The chunks are cut here too, at clause punctuation, so they always
join back (with single spaces) to the exact text; ``tmsEnglish.test.ts`` checks that.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import urllib.parse
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TMS = ROOT / "client" / "src" / "memory" / "library" / "tms.ts"
OUT = ROOT / "client" / "src" / "memory" / "library" / "tmsEnglish.ts"

DEFAULT_API = "https://bible-api-593497511935.us-central1.run.app"
ESV_URL = "https://api.esv.org/v3/passage/text/"
ESV_PARAMS = {
    "include-passage-references": "false",
    "include-verse-numbers": "false",
    "include-first-verse-numbers": "false",
    "include-footnotes": "false",
    "include-footnote-body": "false",
    "include-headings": "false",
    "include-short-copyright": "false",
    "include-copyright": "false",
    "include-selahs": "false",
    "indent-paragraphs": "0",
    "indent-poetry": "false",
    "indent-declares": "0",
    "indent-psalm-doxology": "0",
    "line-length": "0",
}

# Chunk sizes, in words: a chunk is one complete thought, short enough to say in one breath.
MIN_WORDS = 4
MAX_WORDS = 14


def read_env_key(name: str) -> str | None:
    """``name`` from the environment, else from the repo-root ``.env`` (this checkout's, then the main one's)."""
    if os.environ.get(name):
        return os.environ[name]
    candidates = [ROOT / ".env"]
    try:
        common = subprocess.run(
            ["git", "rev-parse", "--path-format=absolute", "--git-common-dir"],
            cwd=ROOT, capture_output=True, text=True, check=True,
        ).stdout.strip()
        candidates.append(Path(common).parent / ".env")
    except (OSError, subprocess.CalledProcessError):
        pass
    for env in candidates:
        if not env.is_file():
            continue
        for line in env.read_text(encoding="utf-8").splitlines():
            key, sep, value = line.partition("=")
            if sep and key.strip() == name and value.strip():
                return value.strip().strip('"').strip("'")
    return None


def tms_references() -> list[tuple[str, str]]:
    """(id, referenceEn) for every TMS verse, in file order."""
    source = TMS.read_text(encoding="utf-8")
    pairs = re.findall(r'id: "([^"]+)",.*?referenceEn: "([^"]+)"', source, flags=re.S)
    if len(pairs) != 60:
        sys.exit(f"expected 60 TMS verses in {TMS}, found {len(pairs)}")
    return pairs


def parse_reference(ref: str) -> tuple[str, int, list[int]]:
    """``Psalm 119:9,11`` -> ("Psalm", 119, [9, 11]); ``Philippians 4:6-7`` -> (..., [6, 7])."""
    m = re.fullmatch(r"(.+?) (\d+):([\d,\-]+)", ref)
    if not m:
        sys.exit(f"cannot parse reference {ref!r}")
    verses: list[int] = []
    for part in m.group(3).split(","):
        lo, _, hi = part.partition("-")
        verses.extend(range(int(lo), int(hi or lo) + 1))
    return m.group(1), int(m.group(2)), verses


def get_json(url: str, headers: dict[str, str] | None = None) -> dict:
    request = urllib.request.Request(url, headers={"User-Agent": "bible-app-tms-fetch", **(headers or {})})
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.loads(response.read().decode("utf-8"))


def fetch_esv(ref: str, key: str) -> str:
    query = urllib.parse.urlencode({"q": ref, **ESV_PARAMS})
    data = get_json(f"{ESV_URL}?{query}", {"Authorization": f"Token {key}"})
    passages = data.get("passages") or []
    if not passages:
        sys.exit(f"ESV returned no passage for {ref}")
    return " ".join(passages)


def fetch_bsb(ref: str, api: str, cache: dict[tuple[str, int], dict[int, str]]) -> str:
    book, chapter, verses = parse_reference(ref)
    if (book, chapter) not in cache:
        url = f"{api}/api/v1/chapters/{urllib.parse.quote(book)}/{chapter}?translation=BSB"
        cache[(book, chapter)] = {v["verse"]: v["text"] for v in get_json(url)["verses"]}
    texts = cache[(book, chapter)]
    missing = [v for v in verses if v not in texts]
    if missing:
        sys.exit(f"BSB has no {book} {chapter}:{missing}")
    return " ".join(texts[v] for v in verses)


def clean(text: str) -> str:
    """Collapse whitespace; drop an unbalanced double quotation mark at either edge (punctuation, never words)."""
    text = re.sub(r"\s+", " ", text).strip()
    text = re.sub(r"\s*\(ESV\)$", "", text)
    if text.endswith("”") and text.count("”") > text.count("“"):
        text = text[:-1].rstrip()
    if text.startswith("“") and text.count("“") > text.count("”"):
        text = text[1:].lstrip()
    return text


STRONG = re.compile(r"[.;:?!][”’)]*$")
WEAK = re.compile(r"[,—][”’)]*$")


def words(piece: list[str]) -> int:
    return len(piece)


def split_at(tokens: list[str], pattern: re.Pattern[str]) -> list[list[str]]:
    pieces: list[list[str]] = [[]]
    for i, token in enumerate(tokens):
        pieces[-1].append(token)
        if pattern.search(token) and i < len(tokens) - 1:
            pieces.append([])
    return [p for p in pieces if p]


def merge_short(pieces: list[list[str]]) -> list[list[str]]:
    """Fold any piece under MIN_WORDS into a neighbour (the previous one, unless that would be too long)."""
    out: list[list[str]] = []
    for piece in pieces:
        if out and (words(piece) < MIN_WORDS or words(out[-1]) < MIN_WORDS):
            if words(out[-1]) + words(piece) <= MAX_WORDS + MIN_WORDS:
                out[-1] = out[-1] + piece
                continue
        out.append(piece)
    return out


def halve(tokens: list[str]) -> list[list[str]]:
    """Split one long run at the weak break nearest its middle, else at the middle word."""
    breaks = [i + 1 for i, t in enumerate(tokens[:-1]) if WEAK.search(t)]
    mid = len(tokens) / 2
    cut = min(breaks, key=lambda b: abs(b - mid)) if breaks else round(mid)
    return [tokens[:cut], tokens[cut:]]


def chunk(text: str) -> list[str]:
    """Clause-punctuation chunks: sentences, then commas inside long sentences, short pieces merged in."""
    tokens = text.split(" ")
    pieces: list[list[str]] = []
    for sentence in split_at(tokens, STRONG):
        if words(sentence) <= MAX_WORDS:
            pieces.append(sentence)
            continue
        for clause in merge_short(split_at(sentence, WEAK)):
            stack = [clause]
            while stack:
                part = stack.pop(0)
                if words(part) > MAX_WORDS + MIN_WORDS:
                    stack[:0] = halve(part)
                else:
                    pieces.append(part)
    pieces = merge_short(pieces)
    if len(pieces) == 1 and words(pieces[0]) >= 2 * MIN_WORDS:
        pieces = halve(pieces[0])
    chunks = [" ".join(p) for p in pieces]
    assert " ".join(chunks) == text, text
    return chunks


def ts_string(value: str) -> str:
    return json.dumps(value, ensure_ascii=False)


def render(translation: str, rows: list[tuple[str, str, str, list[str]]]) -> str:
    lines = [
        "// GENERATED by scripts/fetch_tms_english.py. Do not edit by hand: rerun the script.",
        "// The English text of the 60 Navigators TMS verses, fetched (never typed), with its phrase chunks.",
        "// `chunks.join(' ')` is exactly `text`. ESV text is used under Crossway's quotation guideline (fewer",
        "// than 500 verses, with the notice); BSB is public domain and is the fallback until ESV_API_KEY is set.",
        "",
        f"export const TMS_ENGLISH_TRANSLATION: 'ESV' | 'BSB' = '{translation}';",
        "",
        "export const TMS_ENGLISH: Readonly<Record<string, { text: string; chunks: readonly string[] }>> = {",
    ]
    for verse_id, ref, text, chunks in rows:
        lines.append(f"  // {ref}")
        lines.append(f"  {ts_string(verse_id)}: {{")
        lines.append(f"    text: {ts_string(text)},")
        lines.append(f"    chunks: [{', '.join(ts_string(c) for c in chunks)}],")
        lines.append("  },")
    lines.append("};")
    return "\n".join(lines) + "\n"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--bsb", action="store_true", help="use the BSB even if ESV_API_KEY is set")
    args = parser.parse_args()

    key = None if args.bsb else read_env_key("ESV_API_KEY")
    translation = "ESV" if key else "BSB"
    api = (read_env_key("BIBLE_API_BASE") or DEFAULT_API).rstrip("/")
    cache: dict[tuple[str, int], dict[int, str]] = {}
    rows = []
    for verse_id, ref in tms_references():
        raw = fetch_esv(ref, key) if key else fetch_bsb(ref, api, cache)
        text = clean(raw)
        rows.append((verse_id, ref, text, chunk(text)))
    OUT.write_text(render(translation, rows), encoding="utf-8", newline="\n")
    print(f"wrote {OUT.relative_to(ROOT)}: {len(rows)} verses, {translation}")


if __name__ == "__main__":
    main()
