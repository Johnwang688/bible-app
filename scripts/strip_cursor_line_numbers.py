#!/usr/bin/env python3
"""Strip `  12|...` prefixes from read_file tool output; write rest to stdout."""
from __future__ import annotations

import re
import sys

LINE_RE = re.compile(r"^\s*\d+\|(.*)$")


def main() -> None:
    for line in sys.stdin:
        m = LINE_RE.match(line.rstrip("\n"))
        if m:
            sys.stdout.write(m.group(1) + "\n")
        else:
            sys.stdout.write(line)


if __name__ == "__main__":
    main()
