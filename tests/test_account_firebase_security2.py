"""Security review round 2 probes for the Firebase account endpoints (R6b-security-r2).

Tests named ``test_finding_*`` assert the secure behaviour and are expected to FAIL on the reviewed code;
``test_evidence_*`` pass and show a library behaviour a finding relies on. The Admin SDK is faked at the
library level as in tests/test_account_firebase_security.py, except where a test says it uses the real SDK.
"""

from __future__ import annotations

import time

import firebase_admin
import pytest
from fastapi.testclient import TestClient
from firebase_admin import auth as fb_auth
from firebase_admin import firestore as fb_firestore
from google.auth.credentials import AnonymousCredentials

import app.core.firebase_auth as fa
import app.main as app_main
from app.core.config import Settings

AUTH = {"Authorization": "Bearer good-token"}
REAL_PROJECT = "bible-app-492520"


@pytest.fixture(autouse=True)
def reset(monkeypatch):
    monkeypatch.setattr(fa, "_app", None)
    for name in (
        "FIREBASE_AUTH_EMULATOR_HOST",
        "FIRESTORE_EMULATOR_HOST",
        "ALLOW_FIREBASE_EMULATORS",
        "APP_ENV",
    ):
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

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        log.append(("verify", token))
        if token != "good-token":
            raise fb_auth.InvalidIdTokenError("bad")
        # A real, signed token: the Auth emulator is not in use.
        return {"uid": "alice", "email": "a@example.com", "auth_time": int(time.time())}

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
    monkeypatch.setattr(fb_auth, "delete_user", lambda uid, app=None: log.append(("delete_user", uid)))
    monkeypatch.setattr(fb_firestore, "client", lambda app=None: Db())
    return log


@pytest.fixture()
def client():
    return TestClient(app_main.app)


def _destructive(log):
    return [e for e in log if e[0] in ("revoke", "set", "recursive_delete", "delete_user")]


# ---- FINDING S2-1: the F4 guard covers only the Auth emulator variable ----------------------------


def test_finding_firestore_emulator_host_alone_in_production_is_not_refused(monkeypatch, fakes, client):
    """F4 refuses FIREBASE_AUTH_EMULATOR_HOST without the full emulator setup, but FIRESTORE_EMULATOR_HOST
    on its own is never checked. In production (real, signed tokens) a stray FIRESTORE_EMULATOR_HOST (a
    copied .env, a debug config) silently sends the deletion marker and the wipe to the emulator host,
    while revoke_refresh_tokens and delete_user hit the real project: the endpoint returns 204, the auth
    user is gone, the real users/{uid} data is kept, and with no real marker another device's still-valid
    token (up to 1 h) can keep writing there. A data endpoint should refuse (503) whenever any Firebase
    emulator variable is set without the full emulator setup."""
    log = fakes
    monkeypatch.setattr(
        fa, "get_settings", lambda: Settings(_env_file=None, APP_ENV="production", FIREBASE_PROJECT_ID=REAL_PROJECT)
    )
    monkeypatch.setattr(app_main.settings, "app_env", "production")
    monkeypatch.setenv("FIRESTORE_EMULATOR_HOST", "127.0.0.1:8180")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 503, res.text
    assert _destructive(log) == []


def test_finding_firestore_emulator_host_with_a_real_project_in_development_is_not_refused(
    monkeypatch, fakes, client
):
    """The same in development without ALLOW_FIREBASE_EMULATORS and with the real project id: real tokens,
    real revoke and delete_user, emulator Firestore. The full emulator setup F4 asks for is not met, yet
    the delete runs."""
    log = fakes
    monkeypatch.setattr(
        fa,
        "get_settings",
        lambda: Settings(_env_file=None, APP_ENV="development", FIREBASE_PROJECT_ID=REAL_PROJECT),
    )
    monkeypatch.setenv("FIRESTORE_EMULATOR_HOST", "127.0.0.1:8180")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 503, res.text
    assert ("delete_user", "alice") not in log


def test_evidence_the_real_admin_firestore_client_follows_firestore_emulator_host(monkeypatch):
    """The Admin SDK's Firestore client (google-cloud-firestore) targets FIRESTORE_EMULATOR_HOST even for the
    real project id and real credentials: the variable alone redirects the marker and the wipe."""

    class Creds(firebase_admin.credentials.Base):
        def get_credential(self):
            return AnonymousCredentials()

    monkeypatch.setenv("FIRESTORE_EMULATOR_HOST", "127.0.0.1:1")
    app = firebase_admin.initialize_app(Creds(), options={"projectId": REAL_PROJECT}, name="sec2-evidence")
    try:
        db = fb_firestore.client(app)
        assert db.project == REAL_PROJECT
        assert db._emulator_host == "127.0.0.1:1"
    finally:
        firebase_admin.delete_app(app)
