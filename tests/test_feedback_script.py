"""scripts/read_feedback.py: newest first, the category filter, text and JSON output (Firestore faked)."""

from __future__ import annotations

import importlib.util
import json
from datetime import datetime, timezone
from pathlib import Path

import firebase_admin
import pytest
from firebase_admin import credentials, firestore

_SCRIPT = Path(__file__).resolve().parent.parent / "scripts" / "read_feedback.py"
_spec = importlib.util.spec_from_file_location("read_feedback", _SCRIPT)
rf = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(rf)


def _t(minute: int) -> datetime:
    return datetime(2026, 11, 3, 10, minute, tzinfo=timezone.utc)


DOCS = [
    ("a", {"message": "old bug", "category": "bug", "createdAt": _t(1), "uid": None}),
    ("b", {"message": "an idea\nsecond line", "category": "idea", "createdAt": _t(2), "uid": "alice", "appVersion": "0.1.0", "platform": "web", "language": "zh-Hans", "preset": "silver", "userAgent": "UA"}),
    ("c", {"message": "new bug 神", "category": "bug", "createdAt": _t(3), "uid": None}),
]


class FakeSnap:
    def __init__(self, doc_id, data):
        self.id, self._data = doc_id, data

    def to_dict(self):
        return dict(self._data)


class FakeQuery:
    def __init__(self, state, docs):
        self.state, self.docs = state, docs

    def order_by(self, field, direction=None):
        self.state["order"] = (field, direction)
        return FakeQuery(self.state, sorted(self.docs, key=lambda d: d[1][field], reverse=direction == "DESCENDING"))

    def limit(self, n):
        self.state["limit"] = n
        return FakeQuery(self.state, self.docs[:n])

    def stream(self):
        return [FakeSnap(i, d) for i, d in self.docs]


class FakeDb:
    def __init__(self, state):
        self.state = state

    def collection(self, name):
        self.state["collection"] = name
        return FakeQuery(self.state, list(DOCS))


@pytest.fixture()
def fake(monkeypatch):
    state: dict = {}
    monkeypatch.setattr(firebase_admin, "initialize_app", lambda *a, **k: state.setdefault("init", (a, k)) and object())
    monkeypatch.setattr(credentials, "ApplicationDefault", lambda: "adc")
    monkeypatch.setattr(firestore, "client", lambda app=None: FakeDb(state))
    return state


def test_prints_the_newest_first(fake, capsys) -> None:
    assert rf.main(["--limit", "2"]) == 0
    out = capsys.readouterr().out
    assert fake["collection"] == "feedback"
    assert fake["order"][0] == "createdAt" and fake["limit"] == 2
    assert out.index("new bug") < out.index("an idea")
    assert "old bug" not in out
    assert "account alice" in out and "not signed in" in out
    assert "v0.1.0, web, zh-Hans, silver" in out
    assert "  second line" in out


def test_the_category_filter(fake, capsys) -> None:
    assert rf.main(["--category", "bug"]) == 0
    out = capsys.readouterr().out
    assert "new bug" in out and "old bug" in out and "an idea" not in out


def test_json_output(fake, capsys) -> None:
    assert rf.main(["--json", "--limit", "1"]) == 0
    rows = json.loads(capsys.readouterr().out)
    assert rows == [{"id": "c", "message": "new bug 神", "category": "bug", "createdAt": _t(3).isoformat(), "uid": None}]


def test_uses_the_configured_project(fake, capsys) -> None:
    assert rf.main(["--project", "demo-x"]) == 0
    args, kwargs = fake["init"]
    assert args[1] == {"projectId": "demo-x"}


def test_a_read_failure_is_a_clear_error(monkeypatch, capsys) -> None:
    def boom(*a, **k):
        raise RuntimeError("no credentials")

    monkeypatch.setattr(credentials, "ApplicationDefault", lambda: "adc")
    monkeypatch.setattr(firebase_admin, "initialize_app", boom)
    assert rf.main([]) == 1
    err = capsys.readouterr().err
    assert "Couldn't read feedback" in err and "application-default login" in err


def test_a_bad_limit_is_refused() -> None:
    with pytest.raises(SystemExit):
        rf.main(["--limit", "0"])
