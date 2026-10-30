"""
Golden-response tests (W0.2): replay tests/golden/requests.py against app.main:app
and compare status + JSON body with the recorded fixtures.

Fixtures come from scripts/record_golden.py. These tests need live content data,
so they only run when RUN_GOLDEN=1.
"""

from __future__ import annotations

import json
import os
from pathlib import Path

import pytest
from fastapi.testclient import TestClient

import app.main as app_main
from app.services import ai_service
from tests.golden.requests import REQUESTS


pytestmark = pytest.mark.skipif(
    os.environ.get("RUN_GOLDEN") != "1",
    reason="golden tests need live content data; set RUN_GOLDEN=1 to run",
)

FIXTURES_DIR = Path(__file__).parent / "golden" / "fixtures"


def first_difference(expected: object, actual: object, path: str = "body") -> str | None:
    if type(expected) is not type(actual):
        return f"{path}: expected {expected!r}, got {actual!r}"
    if isinstance(expected, dict):
        for key in sorted(set(expected) | set(actual)):
            child = f"{path}.{key}"
            if key not in actual:
                return f"{child}: missing in response (expected {expected[key]!r})"
            if key not in expected:
                return f"{child}: unexpected in response (got {actual[key]!r})"
            found = first_difference(expected[key], actual[key], child)
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
        return f"{path}: expected {expected!r}, got {actual!r}"
    return None


@pytest.mark.parametrize("entry", REQUESTS, ids=[entry["name"] for entry in REQUESTS])
def test_golden_response(entry: dict) -> None:
    name = entry["name"]
    fixture_path = FIXTURES_DIR / f"{name}.json"
    assert fixture_path.exists(), (
        f"{name}: fixture missing at {fixture_path}; run `python scripts/record_golden.py`"
    )
    fixture = json.loads(fixture_path.read_text(encoding="utf-8"))

    ai_service.reset_rate_limit_state()
    # Unhandled exceptions become the app's real 500 response instead of raising here.
    response = TestClient(app_main.app, raise_server_exceptions=False).request(
        entry["method"],
        entry["path"],
        params=entry.get("params"),
        json=entry.get("json"),
    )
    try:
        body = response.json()
    except json.JSONDecodeError:
        # Server 500s are plain text; the recorder stores them as the text itself.
        body = response.text

    assert response.status_code == fixture["status"], (
        f"{name}: status expected {fixture['status']}, got {response.status_code}"
    )
    difference = first_difference(fixture["body"], body)
    assert difference is None, f"{name}: body differs at {difference}"
