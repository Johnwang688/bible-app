"""``POST /api/v1/feedback``: store a message from the app's "Send feedback" sheet (design/proposed/feedback.html).

Anyone may send, signed in or not. The request is read with a byte cap, validated and capped field by field, rate
limited, and written as one ``feedback/{autoId}`` document through firebase-admin with a server timestamp. The
collection stays closed to clients by the default-deny Firestore rule; only the Admin SDK (this endpoint, the
console, ``scripts/read_feedback.py``) touches it.

Identity: a ``Authorization: Bearer <Firebase ID token>`` header is optional. When it verifies, the uid comes from
the token (never from the body). When it is missing or does not verify (expired, revoked, App Check refused in
enforce mode, Firebase unavailable), the message is still stored, without a uid: a tester's feedback should never be
lost to a token problem, and nothing the request claims is trusted.

Stored: the fields below, the user-agent (first 512 characters) and the time. Not stored: the IP address (used only
by the rate limit, in memory) and any email address.

Rate limit: ``RATE_LIMIT`` messages per ``RATE_WINDOW_SECONDS`` per client IP and, separately, per verified uid, in
memory. Cloud Run may run several instances and scales to zero, so the count is per instance and resets on a cold
start: a brake on loops and floods, not an exact quota.
"""

from __future__ import annotations

import json
import logging
import re
import threading
import time
from collections import deque
from typing import Any, Callable, Literal, Protocol

from fastapi import APIRouter, Depends, HTTPException, Request, status
from fastapi.concurrency import run_in_threadpool
from fastapi.security import HTTPAuthorizationCredentials
from pydantic import BaseModel, ConfigDict, Field, ValidationError, field_validator

from app.core.app_check import APP_CHECK_HEADER
from app.core.config import get_settings
from app.core.firebase_auth import FirebaseUnavailable, emulator_refused, get_firebase_app, get_firebase_user

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/api/v1/feedback", tags=["feedback"])

MAX_MESSAGE_CHARS = 2000
# The whole JSON body: a 2,000-character message of 4-byte characters, JSON escapes and the small fields fit well
# inside this; anything bigger is refused before it is parsed.
MAX_BODY_BYTES = 16 * 1024
MAX_USER_AGENT_CHARS = 512
RATE_LIMIT = 5
RATE_WINDOW_SECONDS = 600

COLLECTION = "feedback"
PLATFORMS = ("web", "ios", "android", "other")

# C0 controls except tab, line feed and carriage return, plus DEL: never useful in a message, and NUL breaks tools.
_CONTROL_RE = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f\x7f]")
# A short label: letters, digits and a few separators (app version "0.1.0", language "zh-Hans", preset
# "strawberry-milk", screen "me" or "reader/john-3").
_LABEL_RE = re.compile(r"[A-Za-z0-9._/-]{1,64}")


def _label(value: Any, max_len: int) -> str | None:
    if value is None:
        return None
    if not isinstance(value, str):
        raise ValueError("must be a string")
    value = value.strip()
    if value == "":
        return None
    if len(value) > max_len or not _LABEL_RE.fullmatch(value):
        raise ValueError(f"must be at most {max_len} letters, digits or . _ / -")
    return value


class FeedbackIn(BaseModel):
    # Unknown fields are ignored, so an older backend still takes a newer client's message.
    model_config = ConfigDict(extra="ignore")

    message: str
    category: Literal["bug", "idea", "other"] | None = None
    app_version: str | None = Field(default=None, alias="appVersion")
    platform: str | None = None
    language: str | None = None
    preset: str | None = None
    screen: str | None = None

    @field_validator("message", mode="before")
    @classmethod
    def _message(cls, value: Any) -> str:
        if not isinstance(value, str):
            raise ValueError("must be a string")
        value = _CONTROL_RE.sub("", value).strip()
        if not value:
            raise ValueError("must not be empty")
        # Python counts code points; the client counts UTF-16 units (never fewer), so whatever the client allows fits.
        if len(value) > MAX_MESSAGE_CHARS:
            raise ValueError(f"must be at most {MAX_MESSAGE_CHARS} characters")
        return value

    @field_validator("app_version", mode="before")
    @classmethod
    def _app_version(cls, value: Any) -> str | None:
        return _label(value, 32)

    @field_validator("platform", mode="before")
    @classmethod
    def _platform(cls, value: Any) -> str | None:
        if value is None:
            return None
        if not isinstance(value, str):
            raise ValueError("must be a string")
        value = value.strip().lower()
        if value == "":
            return None
        return value if value in PLATFORMS else "other"

    @field_validator("language", mode="before")
    @classmethod
    def _language(cls, value: Any) -> str | None:
        return _label(value, 16)

    @field_validator("preset", mode="before")
    @classmethod
    def _preset(cls, value: Any) -> str | None:
        return _label(value, 40)

    @field_validator("screen", mode="before")
    @classmethod
    def _screen(cls, value: Any) -> str | None:
        return _label(value, 64)


# ---- Rate limit ----


class SlidingWindowLimiter:
    """At most ``limit`` events per ``window`` seconds per key; thread-safe, in memory."""

    def __init__(self, limit: int, window: float, clock: Callable[[], float] = time.monotonic) -> None:
        self.limit = limit
        self.window = window
        self._clock = clock
        self._events: dict[str, deque[float]] = {}
        self._lock = threading.Lock()

    def _prune(self, key: str, now: float) -> deque[float]:
        bucket = self._events.setdefault(key, deque())
        while bucket and bucket[0] <= now - self.window:
            bucket.popleft()
        return bucket

    def retry_after(self, key: str) -> int | None:
        """Seconds until ``key`` may send again, or None if it may send now."""
        with self._lock:
            now = self._clock()
            bucket = self._prune(key, now)
            if len(bucket) < self.limit:
                return None
            return max(1, int(bucket[0] + self.window - now + 0.999))

    def consume(self, key: str) -> float:
        """Record an event for ``key``; returns its handle for ``refund``."""
        with self._lock:
            now = self._clock()
            self._prune(key, now).append(now)
            return now

    def refund(self, key: str, handle: float) -> None:
        with self._lock:
            bucket = self._events.get(key)
            if bucket is not None:
                try:
                    bucket.remove(handle)
                except ValueError:
                    pass
                if not bucket:
                    del self._events[key]

    def sweep(self) -> None:
        """Drop keys with no events left in the window (bounds memory under many distinct IPs)."""
        with self._lock:
            now = self._clock()
            for key in list(self._events):
                if not self._prune(key, now):
                    del self._events[key]


class FeedbackLimits:
    """The two limiters (per IP and per uid), checked together so a refused request spends nothing."""

    SWEEP_EVERY = 256

    def __init__(self, clock: Callable[[], float] = time.monotonic) -> None:
        self.by_ip = SlidingWindowLimiter(RATE_LIMIT, RATE_WINDOW_SECONDS, clock)
        self.by_uid = SlidingWindowLimiter(RATE_LIMIT, RATE_WINDOW_SECONDS, clock)
        self._calls = 0
        self._lock = threading.Lock()

    def try_consume(self, ip: str, uid: str | None) -> tuple[Callable[[], None] | None, int | None]:
        """(refund, None) when allowed (the events are recorded), or (None, retry_after) when refused."""
        with self._lock:
            self._calls += 1
            if self._calls % self.SWEEP_EVERY == 0:
                self.by_ip.sweep()
                self.by_uid.sweep()
            waits = [w for w in (self.by_ip.retry_after(ip), self.by_uid.retry_after(uid) if uid else None) if w]
            if waits:
                return None, max(waits)
            ip_handle = self.by_ip.consume(ip)
            uid_handle = self.by_uid.consume(uid) if uid else None

        def refund() -> None:
            self.by_ip.refund(ip, ip_handle)
            if uid and uid_handle is not None:
                self.by_uid.refund(uid, uid_handle)

        return refund, None


_LIMITS = FeedbackLimits()


def get_feedback_limits() -> FeedbackLimits:
    return _LIMITS


def client_ip(request: Request) -> str:
    """The client's address for the rate limit.

    On Cloud Run, Google's front end appends the address it saw to ``X-Forwarded-For``, after anything the client
    sent, so the last entry is the one a client cannot forge. Without the header (local runs) it is the socket peer.
    """
    forwarded = request.headers.get("x-forwarded-for")
    if forwarded:
        last = forwarded.split(",")[-1].strip()
        if last:
            return last[:64]
    if request.client and request.client.host:
        return request.client.host
    return "unknown"


# ---- Storage ----


class FeedbackStore(Protocol):
    def add(self, doc: dict[str, Any]) -> str: ...


class StoreUnavailable(Exception):
    """The feedback could not be written."""


class FirestoreFeedbackStore:
    """Writes ``feedback/{autoId}`` with the Admin SDK (Application Default Credentials)."""

    def add(self, doc: dict[str, Any]) -> str:
        if emulator_refused(data_access=True):
            raise StoreUnavailable("emulator variables set without the full emulator setup")
        try:
            from firebase_admin import firestore

            app = get_firebase_app()
            db = firestore.client(app)
            ref = db.collection(COLLECTION).document()
            ref.set({**doc, "createdAt": firestore.SERVER_TIMESTAMP})
            return ref.id
        except FirebaseUnavailable as exc:
            raise StoreUnavailable("firebase unavailable") from exc
        except Exception as exc:
            logger.warning("Feedback write failed: %s", type(exc).__name__)
            raise StoreUnavailable(type(exc).__name__) from exc


def get_feedback_store() -> FeedbackStore:
    return FirestoreFeedbackStore()


# ---- Request ----


def _rate_limited(retry_after: int) -> HTTPException:
    return HTTPException(
        status_code=status.HTTP_429_TOO_MANY_REQUESTS,
        detail="Too much feedback in a short time. Try again in a few minutes.",
        headers={"Retry-After": str(retry_after)},
    )


def _too_large() -> HTTPException:
    return HTTPException(status_code=413, detail="Feedback is too large.")


async def _read_capped_body(request: Request) -> bytes:
    declared = request.headers.get("content-length")
    if declared is not None:
        try:
            if int(declared) > MAX_BODY_BYTES:
                raise _too_large()
        except ValueError:
            raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Bad Content-Length.") from None
    chunks: list[bytes] = []
    size = 0
    async for chunk in request.stream():
        size += len(chunk)
        if size > MAX_BODY_BYTES:
            raise _too_large()
        chunks.append(chunk)
    return b"".join(chunks)


def _optional_uid(request: Request) -> str | None:
    """The verified uid when a valid Bearer ID token is sent; otherwise None (never an error)."""
    header = request.headers.get("authorization")
    if not header:
        return None
    scheme, _, token = header.partition(" ")
    if scheme.lower() != "bearer" or not token.strip():
        return None
    credentials = HTTPAuthorizationCredentials(scheme="Bearer", credentials=token.strip())
    try:
        user = get_firebase_user(credentials, request.headers.get(APP_CHECK_HEADER))
    except HTTPException as exc:
        logger.info("Feedback token not accepted (%s); storing without an account", exc.status_code)
        return None
    except Exception as exc:  # defensive: a token problem must never lose the message
        logger.warning("Feedback token check failed: %s", type(exc).__name__)
        return None
    return user.uid


@router.post("", status_code=status.HTTP_201_CREATED)
async def send_feedback(
    request: Request,
    store: FeedbackStore = Depends(get_feedback_store),
    limits: FeedbackLimits = Depends(get_feedback_limits),
) -> dict[str, bool]:
    content_type = (request.headers.get("content-type") or "").split(";", 1)[0].strip().lower()
    if content_type != "application/json":
        raise HTTPException(status_code=status.HTTP_415_UNSUPPORTED_MEDIA_TYPE, detail="Send JSON.")
    raw = await _read_capped_body(request)
    try:
        data = json.loads(raw)
    except (ValueError, UnicodeDecodeError):
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Body is not JSON.") from None
    if not isinstance(data, dict):
        raise HTTPException(status_code=422, detail="Body must be a JSON object.")
    try:
        payload = FeedbackIn.model_validate(data)
    except ValidationError as exc:
        fields = sorted({".".join(str(p) for p in err["loc"]) for err in exc.errors()})
        raise HTTPException(
            status_code=422, detail={"invalid": fields}
        ) from None

    ip = client_ip(request)
    # A flooding IP is refused before any token verification (a network call) is spent on it.
    ip_wait = limits.by_ip.retry_after(ip)
    if ip_wait is not None:
        raise _rate_limited(ip_wait)
    # Token verification and the Firestore write are blocking calls: off the event loop.
    uid = await run_in_threadpool(_optional_uid, request)
    refund, retry_after = limits.try_consume(ip, uid)
    if refund is None:
        raise _rate_limited(retry_after or 1)

    user_agent = (request.headers.get("user-agent") or "")[:MAX_USER_AGENT_CHARS] or None
    doc = {
        "message": payload.message,
        "category": payload.category,
        "appVersion": payload.app_version,
        "platform": payload.platform,
        "language": payload.language,
        "preset": payload.preset,
        "screen": payload.screen,
        "uid": uid,
        "signedIn": uid is not None,
        "userAgent": user_agent,
        "appEnv": get_settings().app_env,
    }
    try:
        await run_in_threadpool(store.add, doc)
    except StoreUnavailable:
        refund()  # a failed write is not counted, so the retry the client offers can go through
        raise HTTPException(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE, detail="Couldn't save feedback. Try again."
        ) from None
    return {"ok": True}
