"""Regression test from the verifier re-check (W3-E round 3). Owned by the orchestrator: do not edit.

Known, accepted tradeoff: quoted spans longer than 2,000 characters are not fidelity-checked (bounded scan).
"""

from scripts import run_ai_eval as runner


def test_two_quotes_remain_separate(monkeypatch):
    monkeypatch.setattr(runner, "_translation_text", lambda _: "")
    first = "God helps those who help themselves"
    second = "Angels reward anyone who buys magic bicycles"
    message = f'"{first}" "{second}"'
    assert runner.quote_violations(message, "WEB") == [first, second]
