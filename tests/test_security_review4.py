"""Security review round 4 (R-6b follow-up): App Check on the backend's user endpoints. Reviewer-owned.

A test named ``test_s4_*`` encodes a finding and fails on the code as reviewed; ``test_sound_*`` records something
checked and found correct (it passes).
"""

from __future__ import annotations

import logging
import time

import jwt
import pytest
from firebase_admin import app_check as fb_app_check

from test_app_check import AUTH, GOOD_AC, _deleted, _mode, client, fb  # noqa: F401 (fixtures)

FORGED = "eyJhbGciOiJSUzI1NiIsImtpZCI6ImZvcmdlZCJ9.eyJzdWIiOiJ4In0.c2ln"


# ---- S4-6 (low): monitor mode holds every request for as long as App Check verification takes --------------------


def test_s4_6_monitor_mode_does_not_hold_the_request_while_app_check_cannot_be_verified(fb, client, monkeypatch):  # noqa: F811
    """Monitor mode is meant to change nothing for users, but the check runs inline on the request path.

    ``app_check.verify_token`` fetches the App Check JWKS with PyJWT's ``PyJWKClient`` (firebase_admin sets no timeout,
    so PyJWT's default of 30 s applies) and refetches it for every token whose ``kid`` matches no key. While that
    endpoint is slow or unreachable, every request carrying a token waits for it; the client gives up after 15 s
    (accountApi.ts ACCOUNT_REQUEST_TIMEOUT_MS) and reports a delete that the server then performs as "no connection".
    Any signed-in user can also force a JWKS refetch per request with a made-up ``kid``.
    Expected: monitor mode answers without waiting for the verification (it only logs). Actual: it waits.
    """
    _mode(monkeypatch, "monitor")

    def slow_verify(token, app=None):
        time.sleep(1.5)  # stands in for a JWKS fetch that hangs, then fails
        raise jwt.PyJWKClientConnectionError("Fail to fetch data from the url, err: timed out")

    monkeypatch.setattr(fb_app_check, "verify_token", slow_verify)
    started = time.monotonic()
    res = client.get("/api/v1/account", headers={**AUTH, "X-Firebase-AppCheck": FORGED})
    elapsed = time.monotonic() - started
    assert res.status_code == 200, res.text
    assert elapsed < 0.75, f"monitor mode held the request {elapsed:.2f}s for App Check verification"


# ---- Sound ------------------------------------------------------------------------------------------------------


def test_sound_a_token_inside_an_exception_message_is_never_logged(fb, client, monkeypatch, caplog):  # noqa: F811
    _mode(monkeypatch, "monitor")
    caplog.set_level(logging.DEBUG)

    def leaky_verify(token, app=None):
        raise ValueError(f"Verifying App Check token failed: {token}")

    monkeypatch.setattr(fb_app_check, "verify_token", leaky_verify)
    res = client.get("/api/v1/account", headers={**AUTH, "X-Firebase-AppCheck": FORGED})
    assert res.status_code == 200
    assert all(FORGED not in r.getMessage() and "good-token" not in r.getMessage() for r in caplog.records)


@pytest.mark.parametrize(
    "headers",
    [
        [("X-Firebase-AppCheck", "good-app-check"), ("X-Firebase-AppCheck", FORGED)],
        [("X-Firebase-AppCheck", FORGED), ("X-Firebase-AppCheck", "good-app-check")],
    ],
)
def test_sound_two_app_check_headers_never_500_or_skip_the_check_in_enforce(fb, client, monkeypatch, headers):  # noqa: F811
    _mode(monkeypatch, "enforce")
    res = client.request("DELETE", "/api/v1/account", headers=[("Authorization", AUTH["Authorization"]), *headers])
    # Starlette reads the first header; either answer is acceptable, but a forged first header must refuse.
    assert res.status_code in (204, 401)
    if headers[0][1] == FORGED:
        assert res.status_code == 401
        assert not _deleted(fb)


@pytest.mark.parametrize("ac", ["good-app-check", "  good-app-check  "])
def test_sound_enforce_accepts_a_padded_valid_token_and_refuses_with_the_id_token_401(fb, client, monkeypatch, ac):  # noqa: F811
    _mode(monkeypatch, "enforce")
    ok = client.get("/api/v1/account", headers={**AUTH, "X-Firebase-AppCheck": ac})
    assert ok.status_code == 200
    bad_ac = client.get("/api/v1/account", headers={**AUTH, "X-Firebase-AppCheck": FORGED})
    bad_id = client.get("/api/v1/account", headers={"Authorization": "Bearer nope", **GOOD_AC})
    # No hint about which check failed.
    assert bad_ac.status_code == bad_id.status_code == 401
    assert bad_ac.json() == bad_id.json()
    assert bad_ac.headers.get("www-authenticate") == bad_id.headers.get("www-authenticate")


@pytest.mark.parametrize("raw", ["enforced", "on", "true", "monitor,enforce", "еnforce"])  # Cyrillic e
def test_sound_near_miss_mode_values_fail_closed(fb, client, monkeypatch, raw):  # noqa: F811
    _mode(monkeypatch, raw)
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 401
    assert not _deleted(fb)
