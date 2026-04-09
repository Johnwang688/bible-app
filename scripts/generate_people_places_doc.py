"""
Regenerate docs/people-and-places.md from the same source as the bank pages:
`list_summary_entities('person' | 'place')` in summary_entity_service.

Requires SUPABASE_URL + credentials in .env (same as the running app).

Usage (from repo root):
    python scripts/generate_people_places_doc.py

If docs/people-and-places.md contains the line `<!-- END AUTO-GENERATED LISTS -->`,
everything after that line (the agent-prompts appendix) is kept when regenerating.
"""

from __future__ import annotations

import os
import sys
from pathlib import Path

from dotenv import load_dotenv

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))
load_dotenv(ROOT / ".env")

# Everything in docs/people-and-places.md after this marker is preserved (agent prompts appendix).
_END_MARKER = "<!-- END AUTO-GENERATED LISTS -->\n"


def _read_preserved_footer(doc_path: Path) -> str:
    if not doc_path.is_file():
        return ""
    text = doc_path.read_text(encoding="utf-8")
    if _END_MARKER not in text:
        return ""
    parts = text.split(_END_MARKER, 1)
    return parts[1] if len(parts) == 2 else ""


def main() -> None:
    if not os.environ.get("SUPABASE_URL"):
        print("ERROR: SUPABASE_URL not set. Load .env or set env vars.", file=sys.stderr)
        sys.exit(1)

    from app.services.summary_entity_service import list_summary_entities

    people = list_summary_entities("person")
    places = list_summary_entities("place")

    lines = [
        "# People and places",
        "",
        "This list matches what the **All People** and **All Places** bank pages load from the API "
        "(`GET /api/v1/summary-entities/list/{kind}` → `list_summary_entities` in "
        "`app/services/summary_entity_service.py`).",
        "",
        "- **People:** `summary_entities` rows with `kind = person`, after the same "
        "`_is_valid_person_label` filter used on the bank page.",
        "- **Places:** same for `kind = place` (or the place fallback index when place indexing is disabled).",
        "",
        f"Total: **{len(people)}** people, **{len(places)}** places.",
        "",
        "Regenerate this file after changing summary data or entity rules:",
        "",
        "```bash",
        "python scripts/generate_people_places_doc.py",
        "```",
        "",
        "## People",
        "",
    ]
    for row in people:
        label = str(row.get("label") or "").strip()
        if label:
            lines.append(f"- {label}")

    lines.extend(["", "## Places", ""])
    for row in places:
        label = str(row.get("label") or "").strip()
        if label:
            lines.append(f"- {label}")

    out = ROOT / "docs" / "people-and-places.md"
    body = "\n".join(lines)
    footer = _read_preserved_footer(out)
    if footer:
        out.write_text(body + "\n\n" + _END_MARKER + footer.lstrip("\n"), encoding="utf-8")
    else:
        out.write_text(body + "\n", encoding="utf-8")
    print(f"Wrote {out} ({len(people)} people, {len(places)} places).")


if __name__ == "__main__":
    main()
