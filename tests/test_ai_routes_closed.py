"""The paid AI routes need a confirmed account, and rate limits can't be dodged with a header."""
import pytest
from fastapi.testclient import TestClient
from starlette.requests import Request

from app.main import app
from app.memory.transcribe import require_memory_user
from app.services.ai_service import get_request_identity

PAID_ROUTES = [
    ("/api/v1/ai/chat", {"message": "hello"}),
    ("/api/v1/ai/entity-content", {"prompt": "write anything"}),
    ("/api/v1/ai/guided-chapter", {"book": "John", "chapter": 3, "verse_start": 1, "verse_end": 2, "action": "section_summary"}),
]


@pytest.mark.parametrize("path,body", PAID_ROUTES)
def test_paid_routes_refuse_a_caller_with_no_sign_in(path, body):
    response = TestClient(app).post(path, json=body)
    assert response.status_code == 401


@pytest.mark.parametrize("path,body", PAID_ROUTES)
def test_paid_routes_stay_off_for_a_confirmed_reader_until_switched_on(path, body, monkeypatch):
    monkeypatch.delenv("AI_ROUTES_ENABLED", raising=False)
    monkeypatch.setitem(app.dependency_overrides, require_memory_user, lambda: "user-1")
    assert TestClient(app).post(path, json=body).status_code in (422, 503)
    valid = {"/api/v1/ai/entity-content": {"prompt": "x"}}.get(path)
    if valid:
        assert TestClient(app).post(path, json=valid).status_code == 503


def identity(forwarded_for):
    lines = forwarded_for if isinstance(forwarded_for, list) else [forwarded_for] if forwarded_for else []
    headers = [(b"x-forwarded-for", line.encode()) for line in lines]
    return get_request_identity(Request({"type": "http", "headers": headers, "client": ("10.0.0.1", 1)}))


def test_identity_is_the_address_cloud_run_saw():
    assert identity("1.2.3.4, 203.0.113.9") == "203.0.113.9"
    assert identity("9.9.9.9, 8.8.8.8, 203.0.113.9") == "203.0.113.9"
    assert identity("203.0.113.9") == "203.0.113.9"
    assert identity(None) == "10.0.0.1"
    assert identity(["6.6.6.6", "203.0.113.9"]) == "203.0.113.9"
    assert identity("1.2.3.4,") == "10.0.0.1"
