"""Regression tests from the verifier re-check (W3-E round 2). Owned by the orchestrator: do not edit."""

import subprocess
import sys
from scripts.run_ai_eval import QUOTE_RE
import pytest
from scripts import run_ai_eval as runner


def test_unmatched_quote_scan_is_bounded():
    worker = (
        "import re, sys; "
        "regex = re.compile(sys.stdin.buffer.read().decode('utf-8')); "
        "assert list(regex.finditer('\\u201c\\n' * 100_000)) == []"
    )
    subprocess.run(
        [sys.executable, "-B", "-c", worker],
        input=QUOTE_RE.pattern.encode("utf-8"),
        capture_output=True,
        check=True,
        timeout=5,
    )


@pytest.mark.parametrize("codepoint", [0x31350, 0x323AF])
@pytest.mark.parametrize("check", ["language", "fidelity"])
def test_extension_h_boundaries(monkeypatch, codepoint, check):
    monkeypatch.setattr(runner, "_translation_text", lambda _: "")
    text = chr(codepoint) * 8
    if check == "language":
        assert runner.is_mostly_cjk(text)
    else:
        assert runner.quote_violations(
            "\u300c" + text + "\u300d", "WEB"
        ) == [text]
