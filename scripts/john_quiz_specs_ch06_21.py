"""Aggregate chapters 6–21 for john quiz expansion."""
from __future__ import annotations

from john_quiz_ch06_08 import ch6_8
from john_quiz_ch09_14 import ch9_14
from john_quiz_ch15_21 import all_chapters as ch15_21


def all_chapters() -> list[dict]:
    return ch6_8() + ch9_14() + ch15_21()
