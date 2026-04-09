"""Deterministic slug generation for summary themes and people (must match frontend)."""

import re


def slugify_label(label: str) -> str:
    s = label.strip().lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    s = s.strip("-")
    return s or "x"
