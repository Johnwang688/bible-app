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
from fastapi import APIRouter, Depends, HTTPException, Query, Request

logger = logging.getLogger(__name__)

# 256 KB covers any plausible verse recitation (Opus at 64 kbps for ~15 s is ~120 KB).
MAX_AUDIO_BYTES = 256 * 1024
# Per-user budgets: 100/day is 10x the projected normal load; 10/min stops tight loops.
RATE_PER_MIN = 10
RATE_PER_DAY = 100

ASR_CODE = {"mandarin": "zh", "cantonese": "yue"}
DEFAULT_MODEL = "openai/whisper-large-v3-turbo"
OPENROUTER_URL = "https://openrouter.ai/api/v1/audio/transcriptions"

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

    Single-process only: Cloud Run runs several instances, so a shared store (Firestore) replaces
    this when sign-in ships.
    """

    def __init__(self, per_min: int, per_day: int, clock: Callable[[], float] = time.monotonic) -> None:
        self._per_min = per_min
        self._per_day = per_day
        self._clock = clock
        self._calls: dict[str, deque[float]] = {}
        self._lock = threading.Lock()

    @staticmethod
    def _prune(calls: deque[float], now: float) -> None:
        while calls and calls[0] <= now - _DAY:
            calls.popleft()

    @staticmethod
    def _last_minute(calls: deque[float], now: float) -> list[float]:
        return [t for t in calls if t > now - _MINUTE]

    def try_consume(self, user_id: str) -> bool:
        """Record a call only when both windows have room."""
        with self._lock:
            now = self._clock()
            calls = self._calls.setdefault(user_id, deque())
            self._prune(calls, now)
            if len(calls) >= self._per_day or len(self._last_minute(calls, now)) >= self._per_min:
                return False
            calls.append(now)
            return True

    def refund(self, user_id: str) -> None:
        """Remove the user's most recent recorded call."""
        with self._lock:
            calls = self._calls.get(user_id)
            if calls:
                calls.pop()

    def retry_after(self, user_id: str) -> int:
        """Whole seconds until a refused call could succeed (at least 1)."""
        with self._lock:
            now = self._clock()
            calls = self._calls.get(user_id, deque())
            self._prune(calls, now)
            wait = 0.0
            if len(calls) >= self._per_day:
                wait = max(wait, calls[0] + _DAY - now)
            recent = self._last_minute(calls, now)
            if len(recent) >= self._per_min:
                wait = max(wait, recent[0] + _MINUTE - now)
            return max(1, math.ceil(wait))


_quota = InMemoryQuota(per_min=RATE_PER_MIN, per_day=RATE_PER_DAY)


def require_memory_user() -> str:
    # Always refuses until R-6b replaces this body with Firebase ID-token verification.
    raise HTTPException(status_code=401, detail="sign-in required")


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

    if not quota.try_consume(user_id):
        raise HTTPException(
            status_code=429,
            detail="rate limited",
            headers={"Retry-After": str(quota.retry_after(user_id))},
        )

    try:
        text = await transcriber.transcribe(audio, content_type, asr_code)
    except (TranscribeUpstreamError, httpx.HTTPError) as exc:
        quota.refund(user_id)
        logger.warning("memory transcription upstream error: %s", exc)
        raise HTTPException(status_code=502, detail="transcription upstream error") from exc
    return {"text": text.strip()}
