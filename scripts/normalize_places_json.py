"""Strip === SLUG === blocks and merge root place objects into a valid JSON array."""
import json
import re
from json import JSONDecoder
from pathlib import Path

path = Path(__file__).resolve().parent.parent / "places" / "places.json"
raw = path.read_text(encoding="utf-8")

raw = re.sub(r"^\s*=== SLUG: [^\n]+ ===\s*\n(?:(?!\s*\{)[^\n]+\n+)?", "", raw)
raw = re.sub(r"\n\s*=== SLUG: [^\n]+ ===\s*\n(?:(?!\s*\{)[^\n]+\n+)?", "\n", raw)

raw = raw.strip()
if raw.startswith("["):
    raw = raw[1:]
if raw.rstrip().endswith("]"):
    raw = raw.rstrip()[:-1]

decoder = JSONDecoder()
starts = [m.start() for m in re.finditer(r'\{\s*\n\s*"kind"\s*:\s*"place"', raw)]
if not starts:
    raise SystemExit("No place objects found")

places = []
for start in starts:
    obj, _end = decoder.raw_decode(raw, start)
    places.append(obj)

path.write_text(json.dumps(places, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
print("OK:", len(places), "place objects")
