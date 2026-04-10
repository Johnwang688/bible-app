#!/usr/bin/env python3
"""Merge part*.txt from read_file output (line numbers + '... omitted ...') into raw text."""
from __future__ import annotations

import re
import sys
from pathlib import Path

LINE_RE = re.compile(r"^\s*\d+\|(.*)$")
SKIP_RE = re.compile(r"^\s*\.\.\. \d+ lines not shown \.\.\.\s*$")


def strip_chunk(text: str) -> str:
    out: list[str] = []
    for line in text.splitlines():
        if SKIP_RE.match(line):
            continue
        m = LINE_RE.match(line)
        out.append(m.group(1) if m else line)
    return "\n".join(out) + ("\n" if text.endswith("\n") and out else "")


def main() -> int:
    if len(sys.argv) < 3:
        print("Usage: assemble_line_numbered_chunks.py <out.json> <part0.txt> [part1.txt ...]", file=sys.stderr)
        return 1
    out_path = Path(sys.argv[1])
    parts = [Path(p) for p in sys.argv[2:]]

    def part_num(p: Path) -> int:
        m = re.match(r"^part_(\d+)\.txt$", p.name, re.IGNORECASE)
        return int(m.group(1)) if m else 10**9

    merged: list[str] = []
    for p in sorted(parts, key=part_num):
        merged.append(strip_chunk(p.read_text(encoding="utf-8")))
    out_path.write_text("".join(merged), encoding="utf-8")
    print(f"Wrote {out_path} ({out_path.stat().st_size} bytes) from {len(parts)} parts.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
