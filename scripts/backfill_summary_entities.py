"""
One-time (or repeat-safe) rebuild of summary_entities + commentary_entity_mentions
from Chapter Summaries rows in Supabase.

Requires SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY in the environment.

Usage (from repo root):
    python scripts/backfill_summary_entities.py
"""

from __future__ import annotations

import logging
import os
import sys
import traceback
from pathlib import Path

from dotenv import load_dotenv

load_dotenv()

ROOT = Path(__file__).resolve().parent.parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

SUPABASE_URL = os.environ.get("SUPABASE_URL", "")
SUPABASE_KEY = os.environ.get("SUPABASE_SERVICE_ROLE_KEY", "")


def _configure_logging() -> None:
    """Show a few INFO lines from the rebuild without enabling global debug spam."""
    h = logging.StreamHandler(sys.stderr)
    h.setFormatter(logging.Formatter("[summary-entities] %(message)s"))
    log = logging.getLogger("app.services.summary_entity_service")
    log.handlers.clear()
    log.addHandler(h)
    log.setLevel(logging.INFO)
    log.propagate = False


def main() -> None:
    if not SUPABASE_URL or not SUPABASE_KEY:
        print("ERROR: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY must be set.")
        sys.exit(1)

    from app.services.summary_entity_service import rebuild_all_summary_mentions

    _configure_logging()
    print("Rebuilding summary entity mentions...", flush=True)
    try:
        stats = rebuild_all_summary_mentions()
    except Exception:
        print("FAILED — see stderr for log lines and traceback below.", flush=True)
        traceback.print_exc()
        sys.exit(1)

    print(
        f"Done. commentary ids={stats.commentary_ids_requested}, "
        f"rows loaded={stats.commentary_rows_loaded}, "
        f"distinct labels={stats.distinct_entity_labels}, "
        f"new entities={stats.new_entities_inserted}, "
        f"mentions written={stats.mention_rows_written}.",
        flush=True,
    )
    if stats.commentary_rows_loaded < stats.commentary_ids_requested:
        print(
            "Note: loaded fewer commentary rows than ids (wrong source or stale ids).",
            file=sys.stderr,
            flush=True,
        )


if __name__ == "__main__":
    main()
