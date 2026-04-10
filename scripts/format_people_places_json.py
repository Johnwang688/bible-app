#!/usr/bin/env python3
"""
Strip Gemini headers/footers and === SLUG === markers, parse each JSON object,
and write one pretty-printed JSON array (or a single value if only one object).

Usage:
  format_people_places_json.py <file.json> [more.json ...]   # in-place
  format_people_places_json.py -o out.json < raw.txt         # stdin → file
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

SLUG_SPLIT = re.compile(r"\r?\n=== SLUG:[^\r\n]+\s*===\s*\r?\n")


def parse_objects(raw: str) -> list:
    decoder = json.JSONDecoder()
    out: list = []

    # Split on slug section markers; each piece may contain one {...} entity.
    segments = SLUG_SPLIT.split(raw)
    for seg in segments:
        seg = seg.strip()
        if not seg:
            continue
        i = seg.find("{")
        if i < 0:
            continue
        try:
            obj, end = decoder.raw_decode(seg, i)
        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid JSON in segment starting at char {i}: {e}") from e
        out.append(obj)
        tail = seg[end:].strip()
        if tail:
            # Allow trailing prose (e.g. "Gemini is AI...") after last }
            pass

    if out:
        return out

    # No slug markers: single JSON value (strip leading prose)
    i = -1
    for j, c in enumerate(raw):
        if c in "{[":
            i = j
            break
    if i < 0:
        raise ValueError("No JSON object/array found.")
    val, _ = decoder.raw_decode(raw, i)
    return [val]


def dedupe_by_slug(objects: list) -> tuple[list, int]:
    """Keep first occurrence of each entity slug (later Gemini repeats are dropped)."""
    seen: set[str] = set()
    out: list = []
    dropped = 0
    for obj in objects:
        if not isinstance(obj, dict):
            out.append(obj)
            continue
        slug = obj.get("slug")
        key = slug if isinstance(slug, str) and slug else f"__noid_{len(out)}"
        if key in seen:
            dropped += 1
            continue
        seen.add(key)
        out.append(obj)
    return out, dropped


def write_formatted(out_path: Path, raw: str, *, dedupe: bool) -> int:
    try:
        objects = parse_objects(raw)
    except (ValueError, json.JSONDecodeError) as e:
        print(f"{out_path}: {e}", file=sys.stderr)
        return 1
    if dedupe and len(objects) > 1:
        objects, ndrop = dedupe_by_slug(objects)
        if ndrop:
            print(f"{out_path}: dropped {ndrop} duplicate slug block(s).", file=sys.stderr)
    data = objects[0] if len(objects) == 1 else objects
    tmp = out_path.with_suffix(out_path.suffix + ".tmp")
    tmp.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    tmp.replace(out_path)
    n = len(objects)
    print(f"{out_path}: wrote {'1 value' if n == 1 else f'array of {n} objects'} (formatted).")
    return 0


def main() -> int:
    args = sys.argv[1:]
    dedupe = True
    if args and args[0] == "--no-dedupe":
        dedupe = False
        args = args[1:]

    if len(args) >= 2 and args[0] == "-o":
        out_path = Path(args[1])
        raw = sys.stdin.read()
        if not raw.strip():
            print("stdin was empty; nothing to format.", file=sys.stderr)
            return 1
        return write_formatted(out_path, raw, dedupe=dedupe)

    paths = [Path(p) for p in args]
    if not paths:
        print(
            "Usage: format_people_places_json.py [--no-dedupe] <file.json> [...] | -o out.json < raw.txt",
            file=sys.stderr,
        )
        return 1
    for path in paths:
        raw = path.read_text(encoding="utf-8")
        if write_formatted(path, raw, dedupe=dedupe) != 0:
            return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
