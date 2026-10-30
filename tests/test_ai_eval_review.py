"""Regression tests from the verifier review (W3-E). Owned by the orchestrator: do not edit."""

from scripts.run_ai_eval import CallRecord
from scripts.run_ai_eval import is_mostly_cjk, quote_violations
from scripts.run_ai_eval import quote_violations
import pytest
import unicodedata


@pytest.mark.parametrize("left,right", [
    ('"', '"'), ("“", "”"), ("「", "」"), ("『", "』"),
])
def test_multiline_quotes(left, right):
    span = (
        "God helps those who help\n"
        "themselves and rewards hard work"
    )
    assert quote_violations(left + span + right, "WEB") == [span]


@pytest.mark.parametrize("check", ["language", "fidelity"])
def test_extension_b(check):
    text = "\U00020000" * 8
    assert unicodedata.name(text[0]).startswith(
        "CJK UNIFIED IDEOGRAPH-"
    )
    if check == "language":
        assert is_mostly_cjk(text)
    else:
        assert quote_violations("「" + text + "」", "WEB") == [text]


@pytest.mark.parametrize("tokens,cost,long_context", [
    ((1000, 2000, 3000, 4000), 0.00163, False),
    ((100000, 1000, 0, 0), 0.0105, False),
    ((100001, 1000, 0, 0), 0.0525005, True),
    ((1, 1000, 100000, 0), 0.0075005, True),
])
def test_token_prices(tokens, cost, long_context):
    record = CallRecord("end_turn", [], *tokens)
    assert record.cost_usd == pytest.approx(cost)
    assert record.long_context is long_context
