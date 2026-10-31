"""Regression test from the HG-1 verifier review, round 2 (Sol). Owned by the orchestrator: do not edit."""

import gzip
import hashlib
import json
import runpy
from pathlib import Path

import pytest
from scripts import build_content as b


@pytest.mark.parametrize("table", ["bsb_words", "lexicon"])
def test_reject_relocated_declared_word_file(tmp_path, table):
    make_source = runpy.run_path(
        str(Path(__file__).with_name("test_build_content_review.py"))
    )["source"]
    src = make_source(tmp_path / "source")
    name = "words/" + b._table_file(table)
    record = {"id": 1} if table == "bsb_words" else {"strongs": "H0001"}
    raw = (json.dumps(record) + "\n").encode("utf-8")
    if table == "bsb_words":
        raw = gzip.compress(raw, mtime=0)
    (src / "words").mkdir()
    (src / name).write_bytes(raw)
    manifest_path = src / "MANIFEST.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    manifest["files"][name] = {
        "sha256": hashlib.sha256(raw).hexdigest(), "table": table, "rows": 1,
    }
    manifest_path.write_text(json.dumps(manifest), encoding="utf-8")
    out = tmp_path / "content.sqlite"
    out.write_bytes(b"old output")

    with pytest.raises(b.BuildError, match=table):
        b.build(src, out)
    assert out.read_bytes() == b"old output"
