"""
Record golden API responses for the request set in tests/golden/requests.py.

Each request is replayed in-process against app.main:app (no server needed).
Every request runs twice; if the two runs disagree on status or JSON body the
request is unstable and nothing is written.

Usage:
    python scripts/record_golden.py                  # record all requests
    python scripts/record_golden.py --only NAME ...  # record a subset

Requires the live Supabase settings in .env (read-only use).
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from fastapi.testclient import TestClient  # noqa: E402

from app.main import app  # noqa: E402
from app.services import ai_service  # noqa: E402
from tests.golden.requests import REQUESTS  # noqa: E402


FIXTURES_DIR = ROOT / "tests" / "golden" / "fixtures"


def run_once(client: TestClient, entry: dict) -> tuple[int, object]:
    ai_service.reset_rate_limit_state()
    response = client.request(
        entry["method"],
        entry["path"],
        params=entry.get("params"),
        json=entry.get("json"),
    )
    try:
        body = response.json()
    except json.JSONDecodeError:
        # Server 500s are plain text; record them as the text itself.
        body = response.text
    return response.status_code, body


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--only", action="append", metavar="NAME", help="record only this request (repeatable)")
    args = parser.parse_args(argv)

    known = {entry["name"] for entry in REQUESTS}
    if args.only:
        unknown = [name for name in args.only if name not in known]
        if unknown:
            print(f"unknown request name(s): {', '.join(unknown)}")
            return 2
        selected = [entry for entry in REQUESTS if entry["name"] in set(args.only)]
    else:
        selected = list(REQUESTS)

    # Unhandled exceptions become the app's real 500 response instead of raising here.
    client = TestClient(app, raise_server_exceptions=False)
    first = {entry["name"]: run_once(client, entry) for entry in selected}
    second = {entry["name"]: run_once(client, entry) for entry in selected}

    unstable = [entry["name"] for entry in selected if first[entry["name"]] != second[entry["name"]]]
    if unstable:
        print("unstable requests (differ between two runs):")
        for name in unstable:
            print(f"  {name}")
        return 1

    FIXTURES_DIR.mkdir(parents=True, exist_ok=True)
    for entry in selected:
        status, body = first[entry["name"]]
        fixture = {"request": entry, "status": status, "body": body}
        path = FIXTURES_DIR / f"{entry['name']}.json"
        with open(path, "w", encoding="utf-8", newline="\n") as handle:
            handle.write(json.dumps(fixture, indent=2, sort_keys=True, ensure_ascii=False) + "\n")

    removed = 0
    for path in FIXTURES_DIR.glob("*.json"):
        if path.stem not in known:
            path.unlink()
            removed += 1
    if removed:
        print(f"removed {removed} stale fixture(s)")

    print(f"{len(selected)} fixtures written")
    return 0


if __name__ == "__main__":
    sys.exit(main())
