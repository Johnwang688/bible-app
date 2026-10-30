"""Regression tests from the verifier re-check (W1-B round 2). Owned by the orchestrator: do not edit."""

import asyncio

from app.services import bible_service as bs


def test_case_variants():
    variants = [
        "".join(
            ch.upper() if mask & (1 << i) else ch
            for i, ch in enumerate("faith")
        )
        for mask in range(32)
    ]
    query = " ".join(variants + ["zzzznonexistentzzzz"])
    assert len(query) < 512
    assert asyncio.run(bs.search_verses(query, "WEB", limit=5)) == []


def test_control_prefix_bound():
    query = "\x00" * 512 + "love"
    assert asyncio.run(bs.search_verses(query, "WEB", limit=5)) == []


def test_character_cap():
    query = " " * 512 + "love"
    assert asyncio.run(bs.search_verses(query, "WEB", limit=5)) == []
