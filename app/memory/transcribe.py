"""Voice transcription proxy for the Memory section.

Ported from Little Lamb's /api/transcribe. Sign-in, the paid upstream (OpenRouter Whisper) and the
quota store are all FastAPI dependencies so they can be replaced (and tested) independently.
"""

from __future__ import annotations

import logging
import math
import os
import re
import threading
import time
from collections import deque
from typing import Callable, Protocol

import httpx
from fastapi import APIRouter, Depends, HTTPException, Query, Request, status

from app.core.firebase_auth import FirebaseUser, get_firebase_user

logger = logging.getLogger(__name__)

# 256 KB covers any plausible verse recitation (Opus at 64 kbps for ~15 s is ~120 KB).
MAX_AUDIO_BYTES = 256 * 1024
# Per-user budgets: 100/day is 10x the projected normal load; 10/min stops tight loops.
RATE_PER_MIN = 10
RATE_PER_DAY = 100

# `english` is for the English Memory verses; anything unknown (or absent) is Mandarin.
ASR_CODE = {"mandarin": "zh", "cantonese": "yue", "english": "en"}
DEFAULT_MODEL = "openai/whisper-large-v3-turbo"
OPENROUTER_URL = "https://openrouter.ai/api/v1/audio/transcriptions"

# The 403 detail for a signed-in caller whose email is not confirmed (the client matches it exactly).
EMAIL_NOT_VERIFIED_DETAIL = "email_not_verified"

_MINUTE = 60.0
_DAY = 86_400.0


class TranscribeUpstreamError(Exception):
    """The transcription service failed or answered with something unusable."""


class Transcriber(Protocol):
    async def transcribe(self, audio: bytes, content_type: str, asr_language: str) -> str: ...


def _extension(content_type: str) -> str:
    subtype = content_type.split(";", 1)[0].strip().lower().partition("/")[2]
    subtype = re.sub(r"[^a-z0-9]", "", subtype)
    return subtype or "webm"


class OpenRouterTranscriber:
    def __init__(self, api_key: str, model: str, transport: httpx.AsyncBaseTransport | None = None) -> None:
        self._api_key = api_key
        self._model = model
        self._transport = transport

    async def transcribe(self, audio: bytes, content_type: str, asr_language: str) -> str:
        ext = _extension(content_type)
        try:
            async with httpx.AsyncClient(transport=self._transport, timeout=30) as client:
                res = await client.post(
                    OPENROUTER_URL,
                    headers={"Authorization": f"Bearer {self._api_key}"},
                    files={"file": (f"audio.{ext}", audio, content_type)},
                    # No response_format: OpenRouter returns JSON and 400s on 'text'.
                    data={"model": self._model, "language": asr_language},
                )
        except httpx.HTTPError as exc:
            raise TranscribeUpstreamError(f"transcription request failed: {type(exc).__name__}") from exc
        if not res.is_success:
            raise TranscribeUpstreamError(f"transcription upstream returned {res.status_code}")
        try:
            body = res.json()
        except ValueError as exc:
            raise TranscribeUpstreamError("transcription upstream returned non-JSON") from exc
        text = body.get("text") if isinstance(body, dict) else None
        if not isinstance(text, str):
            raise TranscribeUpstreamError("transcription upstream returned no text")
        return text


class InMemoryQuota:
    """Per-user sliding-window call budget (a minute window and a day window).

    Single-process only: Cloud Run runs up to 3 instances (deploy.py), so a user's real budget is at most 3x
    these numbers until a shared store (Firestore) replaces this.
    """

    def __init__(self, per_min: int, per_day: int, clock: Callable[[], float] = time.monotonic) -> None:
        self._per_min = per_min
        self._per_day = per_day
        self._clock = clock
        # Each recorded call is (timestamp, ticket); the ticket lets a refund remove exactly that call.
        self._calls: dict[str, deque[tuple[float, int]]] = {}
        self._next_ticket = 0
        self._lock = threading.Lock()

    @staticmethod
    def _prune(calls: deque[tuple[float, int]], now: float) -> None:
        while calls and calls[0][0] <= now - _DAY:
            calls.popleft()

    @staticmethod
    def _last_minute(calls: deque[tuple[float, int]], now: float) -> list[float]:
        return [t for t, _ in calls if t > now - _MINUTE]

    def try_consume(self, user_id: str) -> int | None:
        """Record a call only when both windows have room; return its reservation handle, or None if refused."""
        with self._lock:
            now = self._clock()
            calls = self._calls.setdefault(user_id, deque())
            self._prune(calls, now)
            if len(calls) >= self._per_day or len(self._last_minute(calls, now)) >= self._per_min:
                return None
            self._next_ticket += 1
            calls.append((now, self._next_ticket))
            return self._next_ticket

    def refund(self, user_id: str, handle: int) -> None:
        """Remove exactly the reservation `handle`; a no-op if it is already gone."""
        with self._lock:
            calls = self._calls.get(user_id)
            if not calls:
                return
            for entry in calls:
                if entry[1] == handle:
                    calls.remove(entry)
                    return

    def retry_after(self, user_id: str) -> int:
        """Whole seconds until a refused call could succeed (at least 1)."""
        with self._lock:
            now = self._clock()
            calls = self._calls.get(user_id, deque())
            self._prune(calls, now)
            wait = 0.0
            if len(calls) >= self._per_day:
                wait = max(wait, calls[0][0] + _DAY - now)
            recent = self._last_minute(calls, now)
            if len(recent) >= self._per_min:
                wait = max(wait, recent[0] + _MINUTE - now)
            return max(1, math.ceil(wait))


_quota = InMemoryQuota(per_min=RATE_PER_MIN, per_day=RATE_PER_DAY)


def require_memory_user(user: FirebaseUser = Depends(get_firebase_user)) -> str:
    """The signed-in user's uid: the Bearer Firebase ID token, then App Check per ``APP_CHECK_MODE``, then a
    confirmed email.

    ``get_firebase_user`` (not the identity-only variant) because a call spends the paid upstream. It answers 401
    for a missing or bad token and 503 when verification can't run; a verified token whose ``email_verified``
    claim is not exactly True gets 403 ``EMAIL_NOT_VERIFIED_DETAIL`` (so throwaway, unconfirmed accounts can't
    each get a quota). All of these come before the body is read and before the quota is touched; the quota
    keys on the uid.
    """
    if user.email_verified is not True:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail=EMAIL_NOT_VERIFIED_DETAIL)
    return user.uid


def get_transcriber() -> Transcriber | None:
    api_key = (os.environ.get("OPENROUTER_API_KEY") or "").strip()
    if not api_key:
        return None
    model = os.environ.get("TRANSCRIBE_MODEL") or DEFAULT_MODEL
    return OpenRouterTranscriber(api_key, model)


def get_quota_store() -> InMemoryQuota:
    return _quota


router = APIRouter(prefix="/memory", tags=["memory"])


@router.post("/transcribe")
async def transcribe(
    request: Request,
    lang: str | None = Query(default=None),
    user_id: str = Depends(require_memory_user),
    transcriber: Transcriber | None = Depends(get_transcriber),
    quota: InMemoryQuota = Depends(get_quota_store),
) -> dict[str, str]:
    if transcriber is None:
        raise HTTPException(status_code=503, detail="transcription is not configured")

    content_type = request.headers.get("content-type", "")
    if not content_type.strip().lower().startswith("audio/"):
        raise HTTPException(status_code=415, detail="audio content type required")

    too_large = HTTPException(status_code=413, detail=f"audio too large (max {MAX_AUDIO_BYTES} bytes)")
    declared = request.headers.get("content-length")
    if declared is not None and declared.isdigit() and int(declared) > MAX_AUDIO_BYTES:
        raise too_large

    # Read in chunks so a body with no (or an understated) Content-Length can't be buffered unbounded.
    chunks: list[bytes] = []
    size = 0
    async for chunk in request.stream():
        size += len(chunk)
        if size > MAX_AUDIO_BYTES:
            raise too_large
        chunks.append(chunk)
    audio = b"".join(chunks)
    if not audio:
        raise HTTPException(status_code=400, detail="empty audio body")

    asr_code = ASR_CODE.get(lang or "", ASR_CODE["mandarin"])

    reservation = quota.try_consume(user_id)
    if reservation is None:
        raise HTTPException(
            status_code=429,
            detail="rate limited",
            headers={"Retry-After": str(quota.retry_after(user_id))},
        )

    try:
        text = await transcriber.transcribe(audio, content_type, asr_code)
    except (TranscribeUpstreamError, httpx.HTTPError) as exc:
        quota.refund(user_id, reservation)
        logger.warning("memory transcription upstream error: %s", exc)
        raise HTTPException(status_code=502, detail="transcription upstream error") from exc
    return {"text": text.strip()}
