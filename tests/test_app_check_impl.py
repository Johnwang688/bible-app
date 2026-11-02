"""Implementer tests (R6b-fu-native) for App Check on the backend, beyond the acceptance tests in test_app_check.py:
a verification that cannot run (infrastructure) is 503 in enforce mode and a logged "invalid" in monitor mode, an
unknown mode is logged once, a blank header is "missing", and App Check is never consulted for a bad ID token.
"""

from __future__ import annotations

import logging

import jwt
import pytest
from firebase_admin import app_check as fb_app_check
from firebase_admin import exceptions as fb_exceptions

import app.core.app_check as app_check_mod
from test_app_check import AUTH, GOOD_AC, _deleted, _mode, client, fb  # noqa: F401 (fixtures)


def _broken_verify(exc):
    def verify_token(token, app=None):
        raise exc

    return verify_token


@pytest.mark.parametrize(
    "exc",
    [
        jwt.PyJWKClientConnectionError("jwks fetch failed"),
        fb_exceptions.UnavailableError("down"),
        RuntimeError("certificates"),
    ],
)
def test_infrastructure_failure_is_503_in_enforce_mode(fb, client, monkeypatch, exc):  # noqa: F811
    _mode(monkeypatch, "enforce")
    monkeypatch.setattr(fb_app_check, "verify_token", _broken_verify(exc))
    assert client.get("/api/v1/account", headers={**AUTH, **GOOD_AC}).status_code == 503
    assert client.delete("/api/v1/account", headers={**AUTH, **GOOD_AC}).status_code == 503
    assert not _deleted(fb)


def test_infrastructure_failure_is_logged_invalid_in_monitor_mode(fb, client, monkeypatch, caplog):  # noqa: F811
    _mode(monkeypatch, "monitor")
    monkeypatch.setattr(fb_app_check, "verify_token", _broken_verify(jwt.PyJWKClientConnectionError("x")))
    caplog.set_level(logging.WARNING)
    assert client.get("/api/v1/account", headers={**AUTH, **GOOD_AC}).status_code == 200
    messages = [r.getMessage() for r in caplog.records]
    assert any("App Check token invalid" in m and "PyJWKClientConnectionError" in m for m in messages)
    assert all("good-app-check" not in m for m in messages)


def test_an_unknown_key_id_is_invalid_not_unavailable(fb, client, monkeypatch):  # noqa: F811
    _mode(monkeypatch, "enforce")
    monkeypatch.setattr(fb_app_check, "verify_token", _broken_verify(jwt.PyJWKClientError("no matching key")))
    res = client.get("/api/v1/account", headers={**AUTH, **GOOD_AC})
    assert res.status_code == 401
    assert res.headers.get("www-authenticate") == "Bearer"
    assert res.json()["detail"] == "Invalid token"


def test_a_blank_header_is_missing_and_never_verified(fb, client, monkeypatch, caplog):  # noqa: F811
    _mode(monkeypatch, "monitor")
    caplog.set_level(logging.WARNING)
    assert client.get("/api/v1/account", headers={**AUTH, "X-Firebase-AppCheck": "   "}).status_code == 200
    assert fb.app_check_calls == []
    assert any(r.getMessage() == "App Check token missing" for r in caplog.records)


@pytest.mark.parametrize("mode", ["monitor", "enforce"])
def test_app_check_is_not_consulted_for_a_bad_id_token(fb, client, monkeypatch, mode):  # noqa: F811
    _mode(monkeypatch, mode)
    res = client.get("/api/v1/account", headers={"Authorization": "Bearer wrong", **GOOD_AC})
    assert res.status_code == 401
    assert fb.app_check_calls == []


def test_an_unknown_mode_is_logged_once(fb, client, monkeypatch, caplog):  # noqa: F811
    app_check_mod._warned_modes.clear()
    _mode(monkeypatch, "Enforced-Typo")
    caplog.set_level(logging.ERROR, logger="app.core.app_check")
    for _ in range(3):
        assert client.get("/api/v1/account", headers=AUTH).status_code == 401
    unknown = [r for r in caplog.records if "Unknown APP_CHECK_MODE" in r.getMessage()]
    assert len(unknown) == 1


@pytest.mark.parametrize("raw", [" Monitor ", "MONITOR", ""])
def test_mode_is_trimmed_and_case_insensitive_and_blank_is_monitor(fb, client, monkeypatch, raw):  # noqa: F811
    _mode(monkeypatch, raw)
    assert client.get("/api/v1/account", headers=AUTH).status_code == 200
