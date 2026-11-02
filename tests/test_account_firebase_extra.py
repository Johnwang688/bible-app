"""Extra tests for the Firebase auth boundary (R-6b, implementer-owned)."""

from __future__ import annotations

import threading
import time

import firebase_admin
import pytest
from fastapi.testclient import TestClient
from firebase_admin import auth as fb_auth
from firebase_admin import firestore as fb_firestore
from google.auth.exceptions import DefaultCredentialsError

import app.core.firebase_auth as fa
import app.main as app_main

AUTH = {"Authorization": "Bearer good-token"}


@pytest.fixture(autouse=True)
def reset_app(monkeypatch):
    monkeypatch.setattr(fa, "_app", None)
    monkeypatch.delenv("FIREBASE_AUTH_EMULATOR_HOST", raising=False)
    yield


@pytest.fixture()
def fakes(monkeypatch):
    log: list = []
    state = {"revoke_error": None, "delete_error": None, "claims": None}

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        log.append(("verify", token))
        if token != "good-token":
            raise fb_auth.InvalidIdTokenError("bad")
        return state["claims"] or {"uid": "alice", "email": "a@example.com", "auth_time": int(time.time())}

    def revoke(uid, app=None):
        if state["revoke_error"]:
            raise state["revoke_error"]
        log.append(("revoke", uid))

    def delete_user(uid, app=None):
        if state["delete_error"]:
            raise state["delete_error"]
        log.append(("delete_user", uid))

    class Db:
        def collection(self, name):
            return self

        def document(self, doc_id):
            return _Ref(doc_id)

        def recursive_delete(self, ref):
            log.append(("recursive_delete", str(ref)))

    class _Ref(str):
        def set(self, data, *args, **kwargs):
            log.append(("set", str(self)))

    sentinel = object()
    monkeypatch.setattr(firebase_admin, "get_app", lambda *a, **k: sentinel)
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: sentinel)
    monkeypatch.setattr(fb_auth, "verify_id_token", verify_id_token)
    monkeypatch.setattr(fb_auth, "revoke_refresh_tokens", revoke)
    monkeypatch.setattr(fb_auth, "delete_user", delete_user)
    monkeypatch.setattr(fb_auth, "update_user", lambda uid, app=None, **kw: log.append(("disable", uid)))
    monkeypatch.setattr(fb_firestore, "client", lambda app=None: Db())
    return log, state


@pytest.fixture()
def client():
    return TestClient(app_main.app)


def test_app_is_not_initialised_at_import():
    assert fa._app is None


def test_init_uses_adc_and_project_id(monkeypatch, fakes):
    calls = []

    def get_app(*a, **k):
        raise ValueError("no default app")

    def initialize_app(cred, options=None, *a, **k):
        calls.append((cred, options))
        return object()

    monkeypatch.setattr(firebase_admin, "get_app", get_app)
    monkeypatch.setattr(firebase_admin, "initialize_app", initialize_app)
    fa.get_firebase_app()
    fa.get_firebase_app()
    assert len(calls) == 1
    cred, options = calls[0]
    assert isinstance(cred, firebase_admin.credentials.ApplicationDefault)
    assert options == {"projectId": app_main.settings.firebase_project_id}


def test_concurrent_first_requests_initialise_once(monkeypatch, fakes):
    calls = []
    barrier = threading.Barrier(8)

    def get_app(*a, **k):
        raise ValueError

    def initialize_app(*a, **k):
        calls.append(1)
        time.sleep(0.05)
        return object()

    monkeypatch.setattr(firebase_admin, "get_app", get_app)
    monkeypatch.setattr(firebase_admin, "initialize_app", initialize_app)
    results = []

    def worker():
        barrier.wait()
        results.append(fa.get_firebase_app())

    threads = [threading.Thread(target=worker) for _ in range(8)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()
    assert len(calls) == 1
    assert len({id(r) for r in results}) == 1


def test_missing_adc_is_503_and_retried_later(monkeypatch, fakes, client):
    def get_app(*a, **k):
        raise ValueError

    def initialize_app(*a, **k):
        raise DefaultCredentialsError("no adc")

    monkeypatch.setattr(firebase_admin, "get_app", get_app)
    monkeypatch.setattr(firebase_admin, "initialize_app", initialize_app)
    res = client.get("/api/v1/account", headers=AUTH)
    assert res.status_code == 503
    assert res.json() == {"detail": "Sign-in is unavailable"}
    assert fa._app is None  # a failure is not cached
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: object())
    assert client.get("/api/v1/account", headers=AUTH).status_code == 200


def test_401_body_is_generic(fakes, client):
    res = client.get("/api/v1/account", headers={"Authorization": "Bearer nope"})
    assert res.status_code == 401
    assert res.json() == {"detail": "Invalid token"}
    assert res.headers["www-authenticate"] == "Bearer"


def test_token_of_deleted_user_is_401(monkeypatch, fakes, client):
    def verify(*a, **k):
        raise fb_auth.UserNotFoundError("gone")

    monkeypatch.setattr(fb_auth, "verify_id_token", verify)
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 401


def test_unexpected_verify_error_is_503_not_500(monkeypatch, fakes, client):
    def verify(*a, **k):
        raise RuntimeError("network")

    monkeypatch.setattr(fb_auth, "verify_id_token", verify)
    res = client.get("/api/v1/account", headers=AUTH)
    assert res.status_code == 503
    assert "network" not in res.text


def test_emulator_refused_in_production_logs_error(monkeypatch, fakes, client, caplog):
    log, _ = fakes
    monkeypatch.setenv("FIREBASE_AUTH_EMULATOR_HOST", "127.0.0.1:9099")
    monkeypatch.setattr(app_main.settings, "app_env", "production")
    with caplog.at_level("ERROR"):
        res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 503
    assert log == []
    assert any("FIREBASE_AUTH_EMULATOR_HOST" in r.getMessage() for r in caplog.records)


def test_revoke_failure_keeps_everything(fakes, client):
    log, state = fakes
    state["revoke_error"] = RuntimeError("boom")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 503
    assert res.json() == {"detail": "Couldn't delete the account. Try again."}
    assert [e for e in log if e[0] != "verify"] == []


def test_delete_user_failure_is_503(fakes, client):
    log, state = fakes
    state["delete_error"] = RuntimeError("boom")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 503
    assert ("recursive_delete", "alice") in log


def test_auth_time_in_the_future_is_allowed_and_old_is_refused(fakes, client):
    _, state = fakes
    state["claims"] = {"uid": "alice", "auth_time": int(time.time()) - 301}
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 403
    state["claims"] = {"uid": "alice", "auth_time": int(time.time()) - 290}
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 204


def test_tokens_are_never_logged(fakes, client, caplog):
    with caplog.at_level("DEBUG"):
        client.get("/api/v1/account", headers={"Authorization": "Bearer secret-token-xyz"})
    assert all("secret-token-xyz" not in r.getMessage() for r in caplog.records)
