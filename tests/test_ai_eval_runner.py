"""Acceptance tests for scripts/run_ai_eval.py (W3 live-eval harness). Owned by the orchestrator: do not edit."""

from __future__ import annotations

import json
from pathlib import Path

import pytest

REPO = Path(__file__).resolve().parents[1]


@pytest.fixture(scope="module", autouse=True)
def content_db():
    db = REPO / "build" / "content.sqlite"
    if not db.exists():
        from scripts.build_content import build

        build(REPO / "content" / "source", db)


def test_reference_matching_rules():
    from scripts.run_ai_eval import references_match

    assert references_match(["John 3:16"], ["John 3:16"])
    assert references_match(["John 3:16"], ["John 3:14-18"])          # range overlaps
    assert references_match(["Judges 19"], ["Judges 19:22"])          # chapter-only expectation
    assert references_match(["Psalm 23:1"], ["Psalms 23:1-3"])        # Psalm/Psalms alias
    assert references_match(["Romans 8:28", "Philippians 4:6"], ["Philippians 4:6-7"])
    assert not references_match(["John 3:16"], ["John 3:17"])
    assert not references_match(["John 3:16"], ["John 4:16"])
    assert not references_match(["John 3:16"], [])


def test_quote_fidelity_accepts_exact_scripture():
    from scripts.run_ai_eval import quote_violations

    msg = 'Jesus says, "For God so loved the world, that he gave his one and only Son" (John 3:16).'
    assert quote_violations(msg, "WEB") == []
    curly = "It reads “Yahweh is my shepherd; I shall lack nothing.”"
    assert quote_violations(curly, "WEB") == []


def test_quote_fidelity_flags_invented_scripture():
    from scripts.run_ai_eval import quote_violations

    msg = 'The Bible says "God helps those who help themselves and rewards hard work" in Proverbs.'
    assert len(quote_violations(msg, "WEB")) == 1


def test_short_quotes_are_ignored():
    from scripts.run_ai_eval import quote_violations

    assert quote_violations('Jesus called it being "born again" here.', "WEB") == []


def test_chinese_quote_fidelity():
    from scripts.run_ai_eval import quote_violations

    ok = "经文说：“神爱世人，甚至将他的独生子赐给他们”。"
    bad = "经文说：“神每天都会奖励努力工作的人和帮助自己的人”。"
    assert quote_violations(ok, "CUV-SIMP") == []
    assert len(quote_violations(bad, "CUV-SIMP")) == 1


def test_language_check():
    from scripts.run_ai_eval import is_mostly_cjk

    assert is_mostly_cjk("这节经文的意思是神爱世人。John 3:16")
    assert not is_mostly_cjk("This verse means God loves the world.")


def test_cases_file_is_valid():
    cases = json.loads((REPO / "tests" / "ai_eval" / "cases.json").read_text(encoding="utf-8"))["cases"]
    assert len(cases) >= 30
    assert len({c["id"] for c in cases}) == len(cases)


def test_dry_run_end_to_end(tmp_path, monkeypatch):
    from scripts import run_ai_eval

    monkeypatch.delenv("ANTHROPIC_API_KEY", raising=False)
    code = run_ai_eval.main(["--dry-run", "--out", str(tmp_path)])
    assert code == 0
    runs = list(tmp_path.glob("*/results.json"))
    assert len(runs) == 1
    data = json.loads(runs[0].read_text(encoding="utf-8"))
    assert len(data["cases"]) >= 30
    assert {"id", "passed", "checks", "rounds", "tools", "input_tokens", "output_tokens", "cost_usd", "latency_ms",
            "message"} <= set(data["cases"][0])
    assert "total_cost_usd" in data["summary"] and "pass_rate" in data["summary"]
    assert (runs[0].parent / "report.md").exists()


def test_refuses_live_run_without_key(tmp_path, monkeypatch):
    from scripts import run_ai_eval

    monkeypatch.delenv("ANTHROPIC_API_KEY", raising=False)
    monkeypatch.setenv("AI_PROVIDER", "anthropic")
    assert run_ai_eval.main(["--out", str(tmp_path)]) == 2
