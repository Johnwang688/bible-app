"""Shared helpers for john quiz spec modules."""
from __future__ import annotations


def U(
    chapter: int,
    stage: int,
    prompt: str,
    correct: str,
    w1: str,
    w2: str,
    w3: str,
    expl: str,
) -> dict:
    return {
        "chapter": chapter,
        "stage": stage,
        "prompt": prompt,
        "correct": correct,
        "wrongs": (w1, w2, w3),
        "explanation": expl,
    }


def stages_for_50() -> list[int]:
    return [1] * 10 + [2] * 10 + [3] * 10 + [4] * 10 + [5] * 10


def zip_chapter(ch: int, items: list[tuple[str, str, str, str, str, str]]) -> list[dict]:
    stg = stages_for_50()
    if len(items) != 50:
        raise ValueError(f"chapter {ch}: expected 50 items, got {len(items)}")
    return [U(ch, stg[i], *items[i]) for i in range(50)]
