"""Regression test from the HG-1 verifier review, round 2 (Sol). Owned by the orchestrator: do not edit."""

import json
import runpy
from pathlib import Path

import pytest
from scripts import build_content as b


@pytest.mark.parametrize("table", ["bsb_words", "lexicon"])
def test_zero_count_still_declares_missing_source(tmp_path, table):
    make_source = runpy.run_path(
        str(Path(__file__).with_name("test_build_content_review.py"))
    )["source"]
    src = make_source(tmp_path / "source")
    manifest_path = src / "MANIFEST.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    manifest["tables"][table] = 0
    manifest_path.write_text(json.dumps(manifest), encoding="utf-8")
    out = tmp_path / "content.sqlite"
    out.write_bytes(b"old output")

    with pytest.raises(b.BuildError, match=table):
        b.build(src, out)
    assert out.read_bytes() == b"old output"
