#!/usr/bin/env bash
# When Cursor can't save a huge JSON tab: Select All → Copy, then run this script.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/docs/people-and-places/people-places.json"
if ! command -v pbpaste >/dev/null 2>&1; then
  echo "This script needs macOS pbpaste." >&2
  exit 1
fi
pbpaste > "$OUT"
BYTES=$(wc -c < "$OUT" | tr -d ' ')
echo "Wrote $BYTES bytes to $OUT"
if [[ "$BYTES" -lt 100 ]]; then
  echo "Clipboard looks empty or tiny — copy the full file in the editor first (Cmd+A, Cmd+C)." >&2
  exit 1
fi
python3 "$ROOT/scripts/format_people_places_json.py" "$OUT"
echo "Done."
