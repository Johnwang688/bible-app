#!/usr/bin/env python3
"""Smoke-test a deployed bible-api: replay the golden requests and check CORS and errors.

Usage (from the repo root):
  python deploy/smoke.py --url https://bible-api-....run.app
  python deploy/smoke.py --url ... --allowed-origin http://localhost:8081

It replays every request in tests/golden/requests.py against the URL and compares status and
JSON body with tests/golden/fixtures (the same check tests/test_golden.py runs in-process), then
checks /health, a CORS preflight from an allowed and a disallowed origin, and the cold-start time
of the first request. Exits non-zero on any failure. Read-only: it only sends GET/POST/OPTIONS.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

import httpx

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from tests.golden.requests import REQUESTS  # noqa: E402

FIXTURES = ROOT / "tests" / "golden" / "fixtures"


def first_difference(expected: object, actual: object, path: str = "body") -> str | None:
    # Same comparison as tests/test_golden.py, kept here so this script does not import the app.
    if type(expected) is not type(actual):
        return f"{path}: expected {expected!r:.80}, got {actual!r:.80}"
    if isinstance(expected, dict):
        for key in sorted(set(expected) | set(actual)):
            if key not in actual:
                return f"{path}.{key}: missing in response"
            if key not in expected:
                return f"{path}.{key}: unexpected in response"
            found = first_difference(expected[key], actual[key], f"{path}.{key}")
            if found:
                return found
        return None
    if isinstance(expected, list):
        if len(expected) != len(actual):
            return f"{path}: expected {len(expected)} items, got {len(actual)}"
        for index, (exp_item, act_item) in enumerate(zip(expected, actual)):
            found = first_difference(exp_item, act_item, f"{path}[{index}]")
            if found:
                return found
        return None
    if expected != actual:
        return f"{path}: expected {expected!r:.80}, got {actual!r:.80}"
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--url", required=True, help="Service base URL, no trailing slash")
    parser.add_argument("--allowed-origin", default="http://localhost:8081")
    parser.add_argument("--disallowed-origin", default="https://evil.example")
    args = parser.parse_args()
    base = args.url.rstrip("/")
    failures: list[str] = []

    with httpx.Client(base_url=base, timeout=60) as client:
        started = time.perf_counter()
        health = client.get("/health")
        first_ms = (time.perf_counter() - started) * 1000
        print(f"/health -> {health.status_code} in {first_ms:.0f} ms (first request; a cold start if the service was idle)")
        if health.status_code != 200 or health.json().get("status") != "ok":
            failures.append(f"/health: {health.status_code} {health.text[:200]}")
        elif health.json().get("environment") != "production":
            failures.append(f"/health: environment is {health.json().get('environment')!r}, expected 'production'")

        for entry in REQUESTS:
            fixture = json.loads((FIXTURES / f"{entry['name']}.json").read_text(encoding="utf-8"))
            response = client.request(entry["method"], entry["path"], params=entry.get("params"), json=entry.get("json"))
            try:
                body = response.json()
            except json.JSONDecodeError:
                body = response.text
            if response.status_code != fixture["status"]:
                failures.append(f"{entry['name']}: status {response.status_code}, expected {fixture['status']}")
                continue
            difference = first_difference(fixture["body"], body)
            if difference:
                failures.append(f"{entry['name']}: {difference}")
        print(f"golden: {len(REQUESTS)} requests replayed")

        def preflight(origin: str) -> httpx.Response:
            return client.options(
                "/api/v1/books",
                headers={"Origin": origin, "Access-Control-Request-Method": "GET"},
            )

        allowed = preflight(args.allowed_origin)
        if allowed.status_code != 200 or allowed.headers.get("access-control-allow-origin") != args.allowed_origin:
            failures.append(f"CORS preflight from {args.allowed_origin}: {allowed.status_code}, "
                            f"allow-origin={allowed.headers.get('access-control-allow-origin')!r}")
        denied = preflight(args.disallowed_origin)
        if denied.headers.get("access-control-allow-origin"):
            failures.append(f"CORS preflight from {args.disallowed_origin} was allowed "
                            f"({denied.headers.get('access-control-allow-origin')!r})")
        simple = client.get("/api/v1/books", headers={"Origin": args.disallowed_origin})
        if simple.headers.get("access-control-allow-origin"):
            failures.append("GET from a disallowed origin carried an allow-origin header")
        print("cors: allowed and disallowed origins checked")

    if failures:
        print(f"\nFAILED ({len(failures)}):")
        for failure in failures:
            print(f"  - {failure}")
        return 1
    print("\nAll smoke checks passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
