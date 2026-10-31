"""Regression tests from the HG-1 verifier review (Sol). Owned by the orchestrator: do not edit."""

import hashlib
import json
import pytest
import re
from pathlib import Path
from scripts import build_content as build
from scripts import import_bsb as imp


def test_reject_missing_declared_word_sources(tmp_path):
    source = tmp_path / "source"
    (source / "verses").mkdir(parents=True)
    tables = (
        "translations", "books", "commentary_sources", "commentaries",
        "cross_references", "summary_entities", "commentary_entity_mentions",
        "quiz_question_bank",
    )
    payloads = {f"{table}.jsonl": b"" for table in tables}
    payloads["translations.jsonl"] = b'{"id":"BSB","language":"en"}\n'
    payloads["verses/BSB.jsonl"] = (
        b'{"id":124406,"translation":"BSB","book_number":1,'
        b'"chapter":1,"verse":1,"text":"In the beginning"}\n'
    )
    files, counts = {}, {}
    for name, data in payloads.items():
        (source / name).write_bytes(data)
        table = "verses" if name.startswith("verses/") else name[:-6]
        rows = len(data.splitlines())
        files[name] = {
            "rows": rows,
            "sha256": hashlib.sha256(data).hexdigest(),
            "table": table,
        }
        counts[table] = rows

    counts.update(bsb_words=7, lexicon=1)
    (source / "MANIFEST.json").write_text(
        json.dumps({"files": files, "tables": counts}), encoding="utf-8"
    )
    output = tmp_path / "content.sqlite"
    output.write_bytes(b"old output")
    with pytest.raises(build.BuildError, match="bsb_words|lexicon"):
        build.build(source, output)
    assert output.read_bytes() == b"old output"


@pytest.mark.skipif(
    not (Path(__file__).resolve().parents[2] / "build" / "upstream" / "bsb_tables.tsv").exists(),
    reason="upstream files not downloaded",
)
@pytest.mark.parametrize(
    "name", ["bsb.txt", "bsb_tables.tsv", "tbesh.txt", "tbesg.txt"]
)
def test_each_upstream_checksum_is_required(monkeypatch, name):
    upstream = Path(__file__).resolve().parents[2] / "build" / "upstream"
    target = (upstream / name).resolve()
    read_bytes = Path.read_bytes

    def altered(path):
        data = read_bytes(path)
        return data + b"\nCORRUPTED\n" if path.resolve() == target else data

    monkeypatch.setattr(Path, "read_bytes", altered)
    with pytest.raises(imp.ImportFailed, match=re.escape(name)):
        imp.verify_upstream(upstream)
