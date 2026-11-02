"""Implementer tests (R6b-fu-sec4-native) for the bounds on App Check verification (security review 4, S4-6), beyond
test_security_review4.py: enforce mode answers 503 when verification takes too long, the in-flight cap, monitor mode
logging a slow outcome once it ends, and the key client's fetch timeout and fetch throttle.
"""

from __future__ import annotations

import logging
import threading
import time

import firebase_admin
import jwt
import pytest
from cryptography.hazmat.primitives.asymmetric import rsa
from firebase_admin import app_check as fb_app_check
from firebase_admin import credentials
from google.auth.credentials import AnonymousCredentials

import app.core.app_check as app_check_mod
from test_app_check import AUTH, GOOD_AC, _deleted, _mode, client, fb  # noqa: F401 (fixtures)


def _slow_verify(seconds, exc=None):
    def verify_token(token, app=None):
        time.sleep(seconds)
        if exc is not None:
            raise exc
        return {"sub": "app", "app_id": "app"}

    return verify_token


def test_enforce_mode_answers_503_when_verification_outlasts_its_wait(fb, client, monkeypatch):  # noqa: F811
    _mode(monkeypatch, "enforce")
    monkeypatch.setattr(app_check_mod, "ENFORCE_WAIT_SECONDS", 0.2)
    monkeypatch.setattr(fb_app_check, "verify_token", _slow_verify(0.8))
    started = time.monotonic()
    res = client.delete("/api/v1/account", headers={**AUTH, **GOOD_AC})
    assert res.status_code == 503
    assert time.monotonic() - started < 0.7
    assert not _deleted(fb)


def test_monitor_mode_logs_a_slow_outcome_when_it_ends(fb, client, monkeypatch, caplog):  # noqa: F811
    _mode(monkeypatch, "monitor")
    caplog.set_level(logging.WARNING, logger="app.core.app_check")
    done = threading.Event()

    def verify_token(token, app=None):
        try:
            time.sleep(0.5)
            raise ValueError(f"bad {token}")
        finally:
            done.set()

    monkeypatch.setattr(fb_app_check, "verify_token", verify_token)
    res = client.get("/api/v1/account", headers={**AUTH, "X-Firebase-AppCheck": "slow-forged"})
    assert res.status_code == 200
    assert done.wait(3)
    deadline = time.monotonic() + 3
    while time.monotonic() < deadline and not any("ValueError" in r.getMessage() for r in caplog.records):
        time.sleep(0.02)
    messages = [r.getMessage() for r in caplog.records]
    assert "App Check token invalid: ValueError" in messages
    assert all("slow-forged" not in m for m in messages)


@pytest.mark.parametrize(("mode", "status"), [("monitor", 200), ("enforce", 503)])
def test_past_the_in_flight_cap_monitor_skips_and_enforce_refuses(fb, client, monkeypatch, mode, status):  # noqa: F811
    _mode(monkeypatch, mode)
    full = threading.BoundedSemaphore(1)
    full.acquire()
    monkeypatch.setattr(app_check_mod, "_slots", full)
    res = client.delete("/api/v1/account", headers={**AUTH, **GOOD_AC})
    assert res.status_code == (204 if status == 200 else 503)
    assert fb.app_check_calls == []  # never started a verification


def test_a_monitor_request_with_a_hung_verification_does_not_leak_its_slot(fb, client, monkeypatch):  # noqa: F811
    _mode(monkeypatch, "monitor")
    slots = threading.BoundedSemaphore(1)
    monkeypatch.setattr(app_check_mod, "_slots", slots)
    monkeypatch.setattr(fb_app_check, "verify_token", _slow_verify(0.4))
    assert client.get("/api/v1/account", headers={**AUTH, **GOOD_AC}).status_code == 200
    assert slots.acquire(timeout=3)  # released once the slow verification ended
    slots.release()


# ---- The key client --------------------------------------------------------------------------------------------


class _Cred(credentials.Base):
    def get_credential(self):
        return AnonymousCredentials()


@pytest.fixture()
def key_client(monkeypatch):
    """firebase_admin's real App Check key client for a throwaway app, with the network fetch replaced."""
    app = firebase_admin.initialize_app(_Cred(), options={"projectId": "demo-bounds"}, name="app-check-bounds")
    key = rsa.generate_private_key(public_exponent=65537, key_size=2048)
    jwk = jwt.algorithms.RSAAlgorithm.to_jwk(key.public_key(), as_dict=True)
    jwk.update({"kid": "known", "use": "sig", "alg": "RS256"})
    fetches = {"n": 0, "fail": False}

    def fetch_data(self):
        fetches["n"] += 1
        if fetches["fail"]:
            raise jwt.PyJWKClientConnectionError("down")
        data = {"keys": [jwk]}
        if self.jwk_set_cache is not None:
            self.jwk_set_cache.put(data)
        return data

    monkeypatch.setattr(jwt.PyJWKClient, "fetch_data", fetch_data)
    try:
        app_check_mod._guard_key_client(app)
        jc = fb_app_check._get_app_check_service(app)._jwks_client
        jc.cooldown_duration = 0  # PyJWT's own cooldown off: test the guard alone
        yield jc, fetches
    finally:
        firebase_admin.delete_app(app)


def test_the_key_fetch_gets_a_short_timeout(key_client):
    jc, _ = key_client
    assert jc.timeout == app_check_mod.KEY_FETCH_TIMEOUT_SECONDS


def test_unknown_key_ids_do_not_refetch_the_key_set_each_time(key_client):
    jc, fetches = key_client
    assert jc.get_signing_key("known").key_id == "known"
    assert fetches["n"] == 1
    for _ in range(5):
        with pytest.raises(jwt.PyJWKClientError) as err:
            jc.get_signing_key("forged")
        assert not isinstance(err.value, jwt.PyJWKClientConnectionError)  # invalid (401), not unavailable (503)
    assert fetches["n"] == 1


def test_after_a_failed_fetch_the_next_ones_back_off(key_client):
    jc, fetches = key_client
    fetches["fail"] = True
    for _ in range(4):
        with pytest.raises(jwt.PyJWKClientConnectionError):
            jc.get_signing_key("known")
    assert fetches["n"] == 1


def test_guarding_is_idempotent_and_a_test_double_app_is_skipped(key_client):
    jc, _ = key_client
    wrapped = jc.fetch_data
    app_check_mod._guard_key_client(firebase_admin.get_app("app-check-bounds"))
    assert jc.fetch_data is wrapped
    app_check_mod._guard_key_client(object())  # never raises
