"""The paid AI routes need a confirmed account, and rate limits can't be dodged with a header."""
import pytest
from fastapi.testclient import TestClient
from starlette.requests import Request

from app.main import app
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


def identity(forwarded_for):
    headers = [(b"x-forwarded-for", forwarded_for.encode())] if forwarded_for else []
    return get_request_identity(Request({"type": "http", "headers": headers, "client": ("10.0.0.1", 1)}))


def test_identity_is_the_address_cloud_run_saw():
    assert identity("1.2.3.4, 203.0.113.9") == "203.0.113.9"
    assert identity("9.9.9.9, 8.8.8.8, 203.0.113.9") == "203.0.113.9"
    assert identity("203.0.113.9") == "203.0.113.9"
    assert identity(None) == "10.0.0.1"
