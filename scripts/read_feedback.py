"""Print the newest in-app feedback messages (the ``feedback`` Firestore collection).

Reads with the Firebase Admin SDK and Application Default Credentials, the same way the backend writes them, so
run ``gcloud auth application-default login`` once first. The project is ``FIREBASE_PROJECT_ID`` from the repo's
``.env`` (default ``bible-app-492520``), or ``--project``. Read-only: nothing is changed or deleted.

Usage:
    python scripts/read_feedback.py
    python scripts/read_feedback.py --limit 50
    python scripts/read_feedback.py --category bug
    python scripts/read_feedback.py --json > feedback.json
"""

from __future__ import annotations

import argparse
import json
import sys
from datetime import datetime
from pathlib import Path
from typing import Any, Iterable

_ROOT = Path(__file__).resolve().parent.parent
if str(_ROOT) not in sys.path:
    sys.path.insert(0, str(_ROOT))

COLLECTION = "feedback"
CATEGORIES = ("bug", "idea", "other")


def _when(value: Any) -> str:
    if isinstance(value, datetime):
        return value.astimezone().strftime("%Y-%m-%d %H:%M")
    return "(no time)"


def format_doc(doc_id: str, data: dict[str, Any]) -> str:
    """One message as a few readable lines."""
    who = f"account {data['uid']}" if data.get("uid") else "not signed in"
    details = ", ".join(
        str(v)
        for v in (
            data.get("appVersion") and f"v{data['appVersion']}",
            data.get("platform"),
            data.get("language"),
            data.get("preset"),
            data.get("screen") and f"screen {data['screen']}",
        )
        if v
    )
    head = f"{_when(data.get('createdAt'))}  [{data.get('category') or '-'}]  {who}"
    lines = [head]
    if details:
        lines.append(f"  {details}")
    if data.get("userAgent"):
        lines.append(f"  {data['userAgent']}")
    lines.append(f"  id {doc_id}")
    lines.append("")
    lines.extend(f"  {line}" for line in str(data.get("message", "")).splitlines() or [""])
    return "\n".join(lines)


def to_json(doc_id: str, data: dict[str, Any]) -> dict[str, Any]:
    out = {"id": doc_id, **data}
    if isinstance(out.get("createdAt"), datetime):
        out["createdAt"] = out["createdAt"].isoformat()
    return out


def fetch(db: Any, limit: int, category: str | None) -> Iterable[tuple[str, dict[str, Any]]]:
    from google.cloud.firestore_v1 import Query

    query = db.collection(COLLECTION)
    if category:
        # Filtered client-side: an equality filter plus the createdAt order would need a composite index.
        query = query.order_by("createdAt", direction=Query.DESCENDING).limit(max(limit * 5, 200))
        docs = ((d.id, d.to_dict() or {}) for d in query.stream())
        picked = [(i, d) for i, d in docs if d.get("category") == category]
        return picked[:limit]
    query = query.order_by("createdAt", direction=Query.DESCENDING).limit(limit)
    return [(d.id, d.to_dict() or {}) for d in query.stream()]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Print the newest in-app feedback messages.")
    parser.add_argument("--limit", type=int, default=20, help="how many messages (default 20, newest first)")
    parser.add_argument("--category", choices=CATEGORIES, help="only this topic")
    parser.add_argument("--project", help="Firebase project id (default: FIREBASE_PROJECT_ID / bible-app-492520)")
    parser.add_argument("--json", action="store_true", help="print JSON instead of text")
    args = parser.parse_args(argv)
    if args.limit < 1:
        parser.error("--limit must be at least 1")
    try:  # Chinese messages on a Windows console
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")  # type: ignore[attr-defined]
    except (AttributeError, ValueError):
        pass

    import firebase_admin
    from firebase_admin import credentials, firestore

    from app.core.config import get_settings

    project = args.project or get_settings().firebase_project_id
    try:
        app = firebase_admin.initialize_app(credentials.ApplicationDefault(), {"projectId": project}, name="read-feedback")
        db = firestore.client(app)
        rows = list(fetch(db, args.limit, args.category))
    except Exception as exc:  # credentials missing, no permission, network
        print(f"Couldn't read feedback from {project}: {type(exc).__name__}: {exc}", file=sys.stderr)
        print("Try: gcloud auth application-default login", file=sys.stderr)
        return 1

    if args.json:
        print(json.dumps([to_json(i, d) for i, d in rows], ensure_ascii=False, indent=2, default=str))
        return 0
    if not rows:
        print(f"No feedback in {project}.")
        return 0
    print(f"{len(rows)} newest feedback message(s) in {project}:\n")
    print(("\n\n" + "-" * 60 + "\n\n").join(format_doc(i, d) for i, d in rows))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
