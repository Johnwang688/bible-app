#!/usr/bin/env bash
# Poll until people-places.json is saved (large), then format in place.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$ROOT/docs/people-and-places/people-places.json"
MAX_TRIES="${1:-45}"
INTERVAL="${2:-2}"
MIN_BYTES="${3:-50000}"

for i in $(seq 1 "$MAX_TRIES"); do
  if [[ -f "$TARGET" ]]; then
    s=$(wc -c < "$TARGET" | tr -d ' ')
    echo "[$i/$MAX_TRIES] $TARGET size=$s bytes"
    if [[ "$s" -ge "$MIN_BYTES" ]]; then
      python3 "$ROOT/scripts/format_people_places_json.py" "$TARGET"
      exit 0
    fi
  fi
  sleep "$INTERVAL"
done
echo "Timed out: file never reached ${MIN_BYTES} bytes. Save $TARGET in Cursor (Cmd+S), then run:" >&2
echo "  python3 scripts/format_people_places_json.py docs/people-and-places/people-places.json" >&2
exit 1
