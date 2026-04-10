"""Specs consumed by john_quiz_expand_core.py."""
from __future__ import annotations

from john_quiz_specs_gap import questions as gap_q
from john_quiz_specs_ch04 import questions as ch4_q
from john_quiz_specs_ch05_21 import all_questions as ch5_21_q

GAP_FILL = gap_q()
CHAPTERS_4_21 = ch4_q() + ch5_21_q()
