"""Regression tests from the HG-1 verifier review, round 3 (Sol). Owned by the orchestrator: do not edit."""

import json
import runpy
from pathlib import Path

import pytest
from scripts import build_content as b


def make_source(root, rows=None):
    factory = runpy.run_path(
        str(Path.cwd() / "tests/content/test_build_content_review.py")
    )["source"]
    return factory(root, rows)


def test_table_count_checked_independently_of_file_count(tmp_path):
    src = make_source(
        tmp_path / "source", {"books.jsonl": [{"book_number": 1}]}
    )
    path = src / "MANIFEST.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    manifest["tables"]["books"] = 0
    path.write_text(json.dumps(manifest), encoding="utf-8")
    out = tmp_path / "content.sqlite"
    out.write_bytes(b"old output")

    with pytest.raises(b.BuildError, match="books"):
        b.build(src, out)
    assert out.read_bytes() == b"old output"
    assert not out.with_name(out.name + ".tmp").exists()
