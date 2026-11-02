"""Counterexamples for the Memory transcription proxy; no paid network calls."""

from __future__ import annotations

import asyncio

import httpx
from fastapi import FastAPI

from app.memory import transcribe as tx


def test_late_failure_does_not_refund_a_newer_successful_request() -> None:
    # P2: refund pops a newer success, letting it escape the sliding-minute budget.
    async def scenario() -> None:
        clock = [1000.0]
        quota = tx.InMemoryQuota(per_min=2, per_day=100, clock=lambda: clock[0])
        entered = asyncio.Event()
        release = asyncio.Event()

        class OverlappingTranscriber:
            async def transcribe(self, audio: bytes, content_type: str, asr_language: str) -> str:
                if audio == b"slow-failure":
                    entered.set()
                    await release.wait()
                    raise tx.TranscribeUpstreamError("provider failure")
                return "ok"

        app = FastAPI()
        app.include_router(tx.router)
        app.dependency_overrides[tx.require_memory_user] = lambda: "user-1"
        app.dependency_overrides[tx.get_transcriber] = lambda: OverlappingTranscriber()
        app.dependency_overrides[tx.get_quota_store] = lambda: quota
        async with httpx.AsyncClient(transport=httpx.ASGITransport(app=app), base_url="http://test") as client:
            async def post(audio: bytes) -> httpx.Response:
                return await client.post("/memory/transcribe", content=audio, headers={"Content-Type": "audio/webm"})

            older = asyncio.create_task(post(b"slow-failure"))
            try:
                await asyncio.wait_for(entered.wait(), timeout=5)
                clock[0] = 1010.0
                assert (await post(b"newer-success")).status_code == 200
            finally:
                release.set()
                failed = await asyncio.wait_for(older, timeout=5)
            assert failed.status_code == 502
            clock[0] = 1061.0
            assert (await post(b"second-success")).status_code == 200
            refused = await post(b"third-success-in-60-seconds")
            assert refused.status_code == 429

    asyncio.run(scenario())