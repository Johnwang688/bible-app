"""
Upsert curated overview + timeline from people/people.json and places/places.json
into summary_entities.profile (JSONB: { "overview", "timeline" }).

Requires SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY. Run after summary_entities rows
exist (e.g. after load_summary + rebuild mentions), or upsert will create rows keyed
by (kind, slug).

Usage (from repo root):
    python scripts/upsert_entity_profiles.py
    python scripts/upsert_entity_profiles.py --dry-run
"""

from __future__ import annotations

import argparse
import json
import os
import sys
from pathlib import Path

from dotenv import load_dotenv

load_dotenv()

ROOT = Path(__file__).resolve().parent.parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

PEOPLE = ROOT / "people" / "people.json"
PLACES = ROOT / "places" / "places.json"


def _load_array(path: Path) -> list[dict]:
    if not path.is_file():
        print(f"WARNING: missing file {path}", file=sys.stderr)
        return []
    with path.open(encoding="utf-8") as f:
        data = json.load(f)
    if not isinstance(data, list):
        raise ValueError(f"{path} must be a JSON array")
    return data


def main() -> None:
    parser = argparse.ArgumentParser(description="Upsert entity profiles into Supabase.")
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Validate JSON and slugify; do not write to Supabase.",
    )
    args = parser.parse_args()

    if not args.dry_run:
        if not os.environ.get("SUPABASE_URL") or not os.environ.get("SUPABASE_SERVICE_ROLE_KEY"):
            print("ERROR: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be set (unless --dry-run).")
            sys.exit(1)

    from app.core.slugify import slugify_label
    from app.core.supabase_client import get_supabase_admin

    rows: list[dict] = []
    warn_slugs = 0

    for path, expect_kind in ((PEOPLE, "person"), (PLACES, "place")):
        for obj in _load_array(path):
            if not isinstance(obj, dict):
                continue
            kind = str(obj.get("kind") or "")
            slug = str(obj.get("slug") or "").strip()
            label = str(obj.get("label") or "").strip()
            overview = obj.get("overview")
            timeline = obj.get("timeline")
            if kind != expect_kind:
                print(f"WARNING: {path.name} entry kind={kind!r} expected {expect_kind!r} slug={slug!r}", file=sys.stderr)
                continue
            if not slug or not label:
                print(f"WARNING: skip entry missing slug/label in {path}", file=sys.stderr)
                continue
            if slugify_label(label) != slug:
                warn_slugs += 1
                print(
                    f"WARNING: slug {slug!r} != slugify_label({label!r}) -> {slugify_label(label)!r}",
                    file=sys.stderr,
                )
            prof: dict = {}
            if isinstance(overview, str) and overview.strip():
                prof["overview"] = overview
            if isinstance(timeline, dict):
                prof["timeline"] = timeline
            if not prof:
                print(f"WARNING: no overview/timeline for {kind}/{slug}", file=sys.stderr)
                continue
            rows.append(
                {
                    "kind": kind,
                    "slug": slug,
                    "label": label,
                    "profile": prof,
                }
            )

    print(f"Prepared {len(rows)} profile row(s); slug warnings={warn_slugs}.", flush=True)

    if args.dry_run:
        return

    admin = get_supabase_admin()
    batch = 200
    for i in range(0, len(rows), batch):
        chunk = rows[i : i + batch]
        admin.table("summary_entities").upsert(chunk, on_conflict="kind,slug").execute()

    print("Done.", flush=True)


if __name__ == "__main__":
    main()
