"""R6b-secfix2: the shared Firebase emulator check (S2-1) and disabling the auth user before the deletion
marker (U1). The Admin SDK is faked at the library level as in tests/test_account_firebase_security2.py."""

from __future__ import annotations

import logging
import time

import firebase_admin
import pytest
from fastapi.testclient import TestClient
from firebase_admin import auth as fb_auth
from firebase_admin import firestore as fb_firestore

import app.core.firebase_auth as fa
import app.main as app_main
from app.core.config import Settings

AUTH = {"Authorization": "Bearer good-token"}
AUTH_HOST = "127.0.0.1:9180"
FS_HOST = "127.0.0.1:8180"
EMULATOR_VARS = ("FIREBASE_AUTH_EMULATOR_HOST", "FIRESTORE_EMULATOR_HOST", "ALLOW_FIREBASE_EMULATORS", "APP_ENV")


@pytest.fixture(autouse=True)
def reset(monkeypatch):
    monkeypatch.setattr(fa, "_app", None)
    for name in EMULATOR_VARS:
        monkeypatch.delenv(name, raising=False)
    yield


class _Path:
    def __init__(self, path: str, log: list):
        self.path = path
        self._log = log

    def document(self, doc_id: str) -> "_Path":
        return _Path(f"{self.path}/{doc_id}", self._log)

    def set(self, data, *args, **kwargs):
        self._log.append(("set", self.path))


@pytest.fixture()
def fakes(monkeypatch):
    log: list = []
    state: dict = {"update_error": None, "update_kwargs": None, "on_verify": None}

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        log.append(("verify", token))
        if state["on_verify"]:
            state["on_verify"]()
        if token != "good-token":
            raise fb_auth.InvalidIdTokenError("bad")
        return {"uid": "alice", "email": "a@example.com", "auth_time": int(time.time())}

    def update_user(uid, app=None, **kwargs):
        if state["update_error"] is not None:
            raise state["update_error"]
        state["update_kwargs"] = kwargs
        log.append(("disable", uid))

    class Db:
        def collection(self, name):
            return _Path(name, log)

        def recursive_delete(self, ref):
            log.append(("recursive_delete", ref.path))

    sentinel = object()
    monkeypatch.setattr(firebase_admin, "get_app", lambda *a, **k: sentinel)
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: sentinel)
    monkeypatch.setattr(fb_auth, "verify_id_token", verify_id_token)
    monkeypatch.setattr(fb_auth, "revoke_refresh_tokens", lambda uid, app=None: log.append(("revoke", uid)))
    monkeypatch.setattr(fb_auth, "update_user", update_user)
    monkeypatch.setattr(fb_auth, "delete_user", lambda uid, app=None: log.append(("delete_user", uid)))
    monkeypatch.setattr(fb_firestore, "client", lambda app=None: Db())
    return log, state


@pytest.fixture()
def client():
    return TestClient(app_main.app)


def _settings(monkeypatch, env: str, project: str) -> None:
    monkeypatch.setattr(fa, "get_settings", lambda: Settings(_env_file=None, APP_ENV=env, FIREBASE_PROJECT_ID=project))


def _full_emulator_setup(monkeypatch) -> None:
    _settings(monkeypatch, "development", "demo-r6b")
    monkeypatch.setenv("ALLOW_FIREBASE_EMULATORS", "1")
    monkeypatch.setenv("FIREBASE_AUTH_EMULATOR_HOST", AUTH_HOST)
    monkeypatch.setenv("FIRESTORE_EMULATOR_HOST", FS_HOST)


def _destructive(log):
    return [e for e in log if e[0] in ("revoke", "disable", "set", "recursive_delete", "delete_user")]


# ---- U1: disable before the marker ---------------------------------------------------------------------


def test_the_auth_user_is_disabled_after_revoking_and_before_the_marker(fakes, client):
    log, state = fakes
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 204
    assert _destructive(log) == [
        ("revoke", "alice"),
        ("disable", "alice"),
        ("set", "deletedUsers/alice"),
        ("recursive_delete", "users/alice"),
        ("delete_user", "alice"),
    ]
    assert state["update_kwargs"]["disabled"] is True


@pytest.mark.parametrize("error", [RuntimeError("quota"), fb_auth.UserDisabledError("x"), ValueError("bad")])
def test_a_disable_failure_deletes_nothing(fakes, client, error):
    log, state = fakes
    state["update_error"] = error
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 503
    assert "quota" not in res.text
    assert [e for e in log if e[0] in ("set", "recursive_delete", "delete_user")] == []


def test_a_user_already_gone_at_the_disable_still_completes_the_delete(fakes, client):
    log, state = fakes
    state["update_error"] = fb_auth.UserNotFoundError("gone")
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 204
    assert ("set", "deletedUsers/alice") in log
    assert ("recursive_delete", "users/alice") in log


# ---- S2-1: either emulator variable needs the full emulator setup ----------------------------------------


@pytest.mark.parametrize(
    "env_vars",
    [
        {"FIRESTORE_EMULATOR_HOST": FS_HOST},
        {"FIREBASE_AUTH_EMULATOR_HOST": AUTH_HOST},
        {"FIRESTORE_EMULATOR_HOST": FS_HOST, "FIREBASE_AUTH_EMULATOR_HOST": AUTH_HOST},
        {"FIRESTORE_EMULATOR_HOST": FS_HOST, "FIREBASE_AUTH_EMULATOR_HOST": AUTH_HOST, "ALLOW_FIREBASE_EMULATORS": "1"},
    ],
)
def test_production_refuses_any_emulator_variable_before_verifying(monkeypatch, fakes, client, caplog, env_vars):
    log, _ = fakes
    _settings(monkeypatch, "production", "demo-r6b")
    monkeypatch.setattr(app_main.settings, "app_env", "production")
    for name, value in env_vars.items():
        monkeypatch.setenv(name, value)
    with caplog.at_level(logging.ERROR, logger="app.core.firebase_auth"):
        for method in ("get", "delete"):
            assert getattr(client, method)("/api/v1/account", headers=AUTH).status_code == 503
    assert log == []
    assert any(r.levelno == logging.ERROR and "EMULATOR_HOST" in r.getMessage() for r in caplog.records)


@pytest.mark.parametrize("missing", ["ALLOW_FIREBASE_EMULATORS", "FIREBASE_AUTH_EMULATOR_HOST", "FIRESTORE_EMULATOR_HOST", "demo"])
def test_the_delete_needs_every_part_of_the_emulator_setup(monkeypatch, fakes, client, missing):
    log, _ = fakes
    _full_emulator_setup(monkeypatch)
    if missing == "demo":
        _settings(monkeypatch, "development", "bible-app-492520")
    else:
        monkeypatch.delenv(missing)
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 503
    assert log == []


def test_the_full_emulator_setup_is_honoured(monkeypatch, fakes, client):
    log, _ = fakes
    _full_emulator_setup(monkeypatch)
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 204
    assert ("delete_user", "alice") in log


def test_no_emulator_variable_is_not_refused(monkeypatch):
    _settings(monkeypatch, "production", "bible-app-492520")
    assert fa.emulator_refused(data_access=True) is False
    assert fa.emulator_refused(data_access=False) is False


def test_whoami_in_development_needs_only_development(monkeypatch, fakes, client):
    _settings(monkeypatch, "development", "bible-app-492520")
    monkeypatch.setenv("FIRESTORE_EMULATOR_HOST", FS_HOST)
    assert client.get("/api/v1/account", headers=AUTH).status_code == 200
    # ...but the delete, which writes, is refused.
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 503


def test_the_delete_checks_again_right_before_the_admin_calls(monkeypatch, fakes, client):
    """A variable that appears after verification (the check is read at request time) still stops the delete
    before any Admin SDK call."""
    log, state = fakes
    _settings(monkeypatch, "production", "bible-app-492520")
    state["on_verify"] = lambda: monkeypatch.setenv("FIRESTORE_EMULATOR_HOST", FS_HOST)
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 503
    assert _destructive(log) == []
