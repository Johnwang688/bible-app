"""Security review probes for the Firebase account endpoints (R6b-security).

Tests named ``test_finding_*`` assert the secure behaviour and are expected to FAIL on the reviewed code;
``test_evidence_*`` pass and show a library behaviour a finding relies on;
``test_sound_*`` pass and document checks that held. The Admin SDK is faked at the library level as in
tests/test_account_firebase.py, except where a test says it uses the real SDK.
"""

from __future__ import annotations

import base64
import json
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


@pytest.fixture(autouse=True)
def reset(monkeypatch):
    monkeypatch.setattr(fa, "_app", None)
    for name in ("FIREBASE_AUTH_EMULATOR_HOST", "FIRESTORE_EMULATOR_HOST", "APP_ENV"):
        monkeypatch.delenv(name, raising=False)
    yield


@pytest.fixture()
def fakes(monkeypatch):
    log: list = []
    state: dict = {"claims": None, "db": None}

    def verify_id_token(token, app=None, check_revoked=False, clock_skew_seconds=0):
        log.append(("verify", token))
        if token != "good-token":
            raise fb_auth.InvalidIdTokenError("bad")
        return state["claims"] or {"uid": "alice", "email": "a@example.com", "auth_time": int(time.time())}

    class Db:
        def collection(self, name):
            return _Path(name)

        def recursive_delete(self, ref):
            log.append(("recursive_delete", ref.path))

    sentinel = object()
    monkeypatch.setattr(firebase_admin, "get_app", lambda *a, **k: sentinel)
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: sentinel)
    monkeypatch.setattr(fb_auth, "verify_id_token", verify_id_token)
    monkeypatch.setattr(fb_auth, "revoke_refresh_tokens", lambda uid, app=None: log.append(("revoke", uid)))
    monkeypatch.setattr(fb_auth, "delete_user", lambda uid, app=None: log.append(("delete_user", uid)))
    monkeypatch.setattr(fb_auth, "update_user", lambda uid, app=None, **kw: log.append(("disable", uid)))
    monkeypatch.setattr(fb_firestore, "client", lambda app=None: state["db"] or Db())
    return log, state


class _Path:
    """Mimics google.cloud.firestore path building: '/' in a document id splits it into segments."""

    def __init__(self, path: str):
        self.path = path

    def document(self, doc_id: str) -> "_Path":
        return _Path(f"{self.path}/{doc_id}")

    def set(self, data, *args, **kwargs):
        pass  # the deletion marker (F1); not one of the destructive steps these tests watch


@pytest.fixture()
def client():
    return TestClient(app_main.app)


def _destructive(log):
    return [e for e in log if e[0] in ("revoke", "recursive_delete", "delete_user")]


# ---- FINDING: the emulator guard fails open -------------------------------------------------------


def test_finding_emulator_guard_fails_open_when_app_env_is_unset(monkeypatch, fakes, client):
    """APP_ENV defaults to "development", so a deployment that forgets APP_ENV but has
    FIREBASE_AUTH_EMULATOR_HOST set (copied .env, debug config) verifies unsigned tokens: anyone can mint
    a token for any uid and DELETE that user's data. The guard should require an explicit opt-in."""
    log, _ = fakes
    monkeypatch.setattr(fa, "get_settings", lambda: Settings(_env_file=None))
    assert Settings(_env_file=None).app_env == "development"  # the default the guard trusts
    monkeypatch.setenv("FIREBASE_AUTH_EMULATOR_HOST", "127.0.0.1:9180")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert res.status_code == 503, res.text
    assert _destructive(log) == []


def test_finding_auth_emulator_with_real_firestore_is_not_refused(monkeypatch, fakes, client):
    """In development with the Auth emulator on but FIRESTORE_EMULATOR_HOST unset, an emulator (unsigned)
    token drives recursive_delete against the real project's Firestore through ADC. The guard should also
    require the Firestore emulator (or a demo- project) whenever the Auth emulator is in use."""
    log, _ = fakes
    monkeypatch.setattr(app_main.settings, "app_env", "development")
    monkeypatch.setattr(app_main.settings, "firebase_project_id", "bible-app-492520")
    monkeypatch.setenv("FIREBASE_AUTH_EMULATOR_HOST", "127.0.0.1:9180")
    res = client.delete("/api/v1/account", headers=AUTH)
    assert ("recursive_delete", "users/alice") not in log
    assert res.status_code == 503, res.text


# ---- FINDING: the uid is used as a Firestore path without validation ------------------------------


def test_finding_uid_with_a_slash_deletes_below_another_users_document(fakes, client):
    """Firebase uids are any 1..128-char string (Admin SDK / import / custom tokens can set '/').
    db.collection('users').document(uid) splits on '/', so uid 'victim/devices/devA' deletes
    users/victim/devices/devA. Not reachable with email/password sign-up today; defence in depth."""
    log, state = fakes
    state["claims"] = {"uid": "victim/devices/devA", "auth_time": int(time.time())}
    res = client.delete("/api/v1/account", headers=AUTH)
    assert ("recursive_delete", "users/victim/devices/devA") not in log
    assert res.status_code in (400, 401), res.text


def test_evidence_uid_with_a_slash_is_split_by_the_real_firestore_client():
    """Shows the split is real google.cloud.firestore behaviour, not an artefact of the fake above."""
    from google.cloud import firestore as gcf

    db = gcf.Client(project="demo-r6b", credentials=AnonymousCredentials())
    ref = db.collection("users").document("victim/devices/devA")
    assert ref.path == "users/victim/devices/devA"
    assert ref.parent.parent.id == "victim"  # i.e. a document inside another user's tree
    # The secure behaviour: the endpoint refuses such a uid before building the path (see the test above).


# ---- sound ---------------------------------------------------------------------------------------


class _AnonCred(firebase_admin.credentials.Base):
    def get_credential(self):
        return AnonymousCredentials()


def _b64(obj) -> str:
    return base64.urlsafe_b64encode(json.dumps(obj).encode()).rstrip(b"=").decode()


@pytest.fixture()
def real_app(monkeypatch):
    """A real Admin app pinned to the project (no network is reached by the checks below)."""
    app = firebase_admin.initialize_app(_AnonCred(), options={"projectId": "bible-app-492520"}, name="sec-review")
    monkeypatch.setattr(fa, "get_firebase_app", lambda: app)
    yield app
    firebase_admin.delete_app(app)


@pytest.mark.parametrize(
    "header,payload",
    [
        # unsigned (alg none) token for the right project
        ({"alg": "none", "typ": "JWT"}, {"aud": "bible-app-492520", "iss": "https://securetoken.google.com/bible-app-492520", "sub": "victim"}),
        # HS256 token
        ({"alg": "HS256", "kid": "x"}, {"aud": "bible-app-492520", "iss": "https://securetoken.google.com/bible-app-492520", "sub": "victim"}),
        # RS256 from another Firebase project
        ({"alg": "RS256", "kid": "x"}, {"aud": "other-project", "iss": "https://securetoken.google.com/other-project", "sub": "victim"}),
        # right audience, wrong issuer
        ({"alg": "RS256", "kid": "x"}, {"aud": "bible-app-492520", "iss": "https://evil.example/bible-app-492520", "sub": "victim"}),
        # empty subject
        ({"alg": "RS256", "kid": "x"}, {"aud": "bible-app-492520", "iss": "https://securetoken.google.com/bible-app-492520", "sub": ""}),
    ],
)
def test_sound_real_sdk_rejects_forged_tokens_without_the_emulator(real_app, client, header, payload):
    now = int(time.time())
    token = f"{_b64(header)}.{_b64({**payload, 'iat': now, 'exp': now + 3600, 'auth_time': now})}.sig"
    res = client.delete("/api/v1/account", headers={"Authorization": f"Bearer {token}"})
    assert res.status_code == 401
    assert res.json() == {"detail": "Invalid token"}


@pytest.mark.parametrize("value", ["Bearer", "Bearer  ", "bearer good-token extra", "Token good-token", "Bearer\tgood-token"])
def test_sound_header_edge_cases_never_reach_destructive_calls(fakes, client, value):
    log, _ = fakes
    res = client.delete("/api/v1/account", headers={"Authorization": value})
    assert res.status_code in (401, 403)
    assert _destructive(log) == []


def test_sound_bool_auth_time_is_not_a_recent_login(fakes, client):
    log, state = fakes
    state["claims"] = {"uid": "alice", "auth_time": True}
    assert client.delete("/api/v1/account", headers=AUTH).status_code == 403
    assert _destructive(log) == []


def test_sound_cors_refuses_an_unlisted_origin(fakes, client):
    res = client.options(
        "/api/v1/account",
        headers={"Origin": "https://evil.example", "Access-Control-Request-Method": "DELETE", "Access-Control-Request-Headers": "authorization"},
    )
    assert res.headers.get("access-control-allow-origin") != "https://evil.example"
