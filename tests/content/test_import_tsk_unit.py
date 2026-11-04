"""TSK grammar, binary format, validation, and pinned-source acceptance checks."""

import gzip
import hashlib
import importlib.util
import io
import json
from pathlib import Path
import struct
import subprocess
import sys
import zipfile
import zlib

import pytest

# File-based loading also works when another installed package is named scripts.
ROOT = Path(__file__).resolve().parents[2]
SPEC = importlib.util.spec_from_file_location("import_tsk", ROOT / "scripts/import_tsk.py")
imp = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(imp)
UPSTREAM = Path("C:/dev/bible-app-work/commentary/upstream")


@pytest.fixture(scope="module")
def maxima():
    return imp.load_verses(imp.DEFAULT_VERSES)[1]


@pytest.mark.parametrize("raw,origin,expected", [
    ("Job 26:7; Isa 45:18; Jer 4:23; Na 2:10", (1, 1, 2),
     [(18, 26, 7, None), (23, 45, 18, None), (24, 4, 23, None), (34, 2, 10, None)]),
    ("Job 26:14; Ps 33:6; 104:30; Isa 40:12-14", (1, 1, 2),
     [(18, 26, 14, None), (19, 33, 6, None), (19, 104, 30, None), (23, 40, 12, 14)]),
    ("10,12,18,25,31; Ec 2:13; 11:7", (1, 1, 4),
     [(1, 1, v, None) for v in (10, 12, 18, 25, 31)] + [(21, 2, 13, None), (21, 11, 7, None)]),
    ("Ps 33:6,9", (1, 1, 1), [(19, 33, 6, None), (19, 33, 9, None)]),
    ("3:1-5,8,10-12", (43, 3, 16), [(43, 3, 1, 5), (43, 3, 8, None), (43, 3, 10, 12)]),
    ("Jud 2:16; Jude 1:4", (8, 1, 1), [(7, 2, 16, None), (65, 1, 4, None)]),
    ("Ge 16:13, 22:14", (1, 1, 1), [(1, 16, 13, None), (1, 22, 14, None)]),
    ("Nu 32:34, De 2:36, Jos 13:15-21", (13, 5, 8),
     [(4, 32, 34, None), (5, 2, 36, None), (6, 13, 15, 21)]),
    ("Pr 1:,27,28; Re 3: 22", (9, 28, 6), [(20, 1, 27, None), (20, 1, 28, None), (66, 3, 22, None)]),
    ("2Th 1:7,-9", (43, 1, 51), [(53, 1, 7, 9)]),
])
def test_real_grammar(raw, origin, expected, maxima):
    parsed = imp.parse_list(raw, origin, maxima)
    assert parsed["targets"] == expected
    assert parsed["drops"] == []
    assert parsed["items"] == imp.independent_count(raw)


@pytest.mark.parametrize("raw,origin,expected", [
    ("Ge 1:1-2:3", (1, 1, 1), [(1, 1, 1, 31), (1, 2, 1, 3)]),
    ("1:31-2:3", (1, 1, 1), [(1, 1, 31, None), (1, 2, 1, 3)]),
    ("Ge 1:1-3:4", (1, 1, 1), [(1, 1, 1, 31), (1, 2, 1, 25), (1, 3, 1, 4)]),
    ("Mal 4:6- Mt 1:2", (1, 1, 1), [(39, 4, 6, None), (40, 1, 1, 2)]),
])
def test_cross_chapter_and_cross_book_ranges(raw, origin, expected, maxima):
    parsed = imp.parse_list(raw, origin, maxima)
    assert parsed["targets"] == expected
    assert parsed["splits"][0]["extra_rows"] == len(expected) - 1
    assert parsed["items"] == imp.independent_count(raw) == 1


@pytest.mark.parametrize("raw,expected,annotations", [
    ("Ps 69:34; *marg:", [(19, 69, 34, None)], 1),
    ("Ps 60:1; *title", [(19, 60, 1, None)], 1),
    ("Ps 30:1; *title Joh 10:22", [(19, 30, 1, None), (43, 10, 22, None)], 1),
    ("Ge 38:27,29,30; 46:12; * Judah, Pharez, Zarah:",
     [(1, 38, 27, None), (1, 38, 29, None), (1, 38, 30, None), (1, 46, 12, None)], 1),
    ("Ps 60:1; *title, marg:", [(19, 60, 1, None)], 1),
    ("Joh 1:1; *Gr:; Ge 1:1; *Heb:; *margins; *compared with:; *Sept:; *etc:",
     [(43, 1, 1, None), (1, 1, 1, None)], 6),
])
def test_star_annotations_are_not_references(raw, expected, annotations, maxima):
    parsed = imp.parse_list(raw, (1, 1, 1), maxima)
    assert parsed["targets"] == expected
    assert not parsed["drops"]
    assert len(parsed["stars"]) == annotations
    assert parsed["items"] == imp.independent_count(raw)


def test_untagged_reference_lines_and_prose(maxima):
    entry = ('loved David.<br /> <br />Ge 29:18,20 34:3 Jud 16:4,15 2Sa 13:1 1Ki 11:1,2 Ho 3:2'
             '<br />Probably the same as Nimrim in Jer 48:34<br />'
             '<sync type="Strongs" value="H1" /><See definition xyz>\ufffd<br />')
    lists = imp.reference_lists(entry)
    assert lists == [("untagged", "Ge 29:18,20 34:3 Jud 16:4,15 2Sa 13:1 1Ki 11:1,2 Ho 3:2")]
    assert len(imp.parse_list(lists[0][1], (9, 18, 20), maxima)["targets"]) == 9
    assert imp.reference_lists("Probably the same as Nimrim in Jer 48:34") == []
    assert imp.reference_lists("<br />See Joh 3:16<br />") == []


def test_outline_anchors_are_excluded_and_order_repeats_preserved(maxima):
    entry = ('<scripRef passage="Ge 1:3">3</scripRef> light.<br />'
             '<scripRef>Joh 3:16</scripRef><br />other.<br />'
             'Mt 1:21<br />again.<br /><scripRef>Joh 3:16</scripRef>')
    rows, report = imp.build_rows([((1, 1, 1), entry)], maxima)
    assert [(r["to_book_number"], r["to_chapter"], r["to_verse_start"]) for r in rows] == [(43, 3, 16), (40, 1, 21), (43, 3, 16)]
    assert [r["id"] for r in rows] == [1, 2, 3]
    assert report["rows_tagged"] == 2 and report["rows_untagged"] == 1
    assert all(r["votes"] is None and r["source"] == "treasury_scripture" for r in rows)


def test_adjacent_tag_fragments_continue_context_but_keywords_reset(maxima):
    entry = ('care.<br /><scripRef>Lu 10:40,41; 12:29; *marg:</scripRef><br />'
             '<scripRef>21:34; Php 4:6,11; Heb 13:5; 1Pe 5:7</scripRef>'
             '<br />another keyword.<br /><scripRef>3</scripRef>')
    rows, report = imp.build_rows([((46, 7, 21), entry)], maxima)
    assert (rows[3]["to_book_number"], rows[3]["to_chapter"], rows[3]["to_verse_start"]) == (42, 21, 34)
    assert (rows[-1]["to_book_number"], rows[-1]["to_chapter"], rows[-1]["to_verse_start"]) == (46, 7, 3)
    assert report["tagged_lists"] == 3


def test_errata_and_ambiguous_typos(maxima):
    fixed = imp.parse_list("52:5:5-7", (19, 37, 10), maxima)
    assert fixed["targets"] == [(19, 52, 5, 7)] and len(fixed["corrections"]) == 1
    fixed = imp.parse_list("Phm 2:10,11", (1, 49, 8), maxima)
    assert fixed["targets"] == [(50, 2, 10, None), (50, 2, 11, None)]
    fixed = imp.parse_list("Eze 26:1-28:1-19", (24, 25, 22), maxima)
    assert fixed["targets"] == [(26, 26, 1, 21), (26, 27, 1, 36), (26, 28, 1, 19)]
    bad = imp.parse_list("Isa 58:2:4,7-9; 59:1", (22, 5, 6), maxima)
    assert bad["targets"] == [(23, 58, 7, 9), (23, 59, 1, None)]
    assert bad["drops"][0]["raw"] == "Isa 58:2:4"


def test_all_targets_and_range_endpoints_are_validated(maxima):
    parsed = imp.parse_list("Ge 99:1; Ps 1:7; Ge 1:31-2:99; Ge 2:9-3", (1, 1, 1), maxima)
    assert not parsed["targets"]
    assert len(parsed["drops"]) == 4


def test_count_disagreement_and_excess_drops_fail(maxima, monkeypatch):
    with pytest.raises(imp.ImportFailed, match="drops exceed"):
        imp.build_rows([((1, 1, 1), "<scripRef>Ge 99:1</scripRef>")], maxima)
    monkeypatch.setattr(imp, "independent_count", lambda raw: 2)
    with pytest.raises(imp.ImportFailed, match="independent count mismatch"):
        imp.build_rows([((1, 1, 1), "<scripRef>Ge 1:1</scripRef>")], maxima)


def tiny_module(*, bad_size=False, bad_entry=False, padding=False):
    buffer = io.BytesIO()
    blocks = [b"first\x00second", b"third"]
    packed = [zlib.compress(b) + (b"\0" * 1024 if padding else b"") for b in blocks]
    bzs = struct.pack("<III", 0, len(packed[0]), len(blocks[0]) + int(bad_size))
    bzs += struct.pack("<III", len(packed[0]), len(packed[1]), len(blocks[1]))
    bzv = b"".join(struct.pack("<IIH", *r) for r in [(0, 0, 0), (0, 0, 5), (0, 6, 6), (1, 9 if bad_entry else 0, 5)])
    with zipfile.ZipFile(buffer, "w") as z:
        for suffix, data in [(".bzs", bzs), (".bzv", bzv), (".bzz", b"".join(packed))]:
            z.writestr("modules/comments/zcom/tsk/ot" + suffix, data)
    buffer.seek(0)
    return zipfile.ZipFile(buffer)


@pytest.mark.parametrize("padding", [False, True])
def test_binary_reader_two_blocks_and_entry_offsets(padding):
    with tiny_module(padding=padding) as z:
        assert imp.read_module(z, "ot") == ["", "first", "second", "third"]


@pytest.mark.parametrize("kwargs,message", [({"bad_size": True}, "block size"), ({"bad_entry": True}, "entry outside")])
def test_binary_reader_rejects_corruption(kwargs, message):
    with tiny_module(**kwargs) as z, pytest.raises(imp.ImportFailed, match=message):
        imp.read_module(z, "ot")


def test_entry_count_and_alignment_checks():
    with pytest.raises(imp.ImportFailed, match="expected 24115"):
        imp.verse_entries([], "ot", {})
    entries = [""] * 24115
    entries[4] = '<scripRef passage="Ex 1:1">1</scripRef>'
    with pytest.raises(imp.ImportFailed, match="chapter alignment"):
        imp.verse_entries(entries, "ot", {(1, 1): 1})


def canonical(value):
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n").encode()


@pytest.mark.parametrize("upstream", [None, {}, [{"name": "other.zip", "version": "old"}]])
def test_manifest_preserves_other_content_and_creates_upstream(upstream):
    original = {"files": {"other.jsonl": {"rows": 7, "table": "other", "sha256": "old"}}, "tables": {"other": 7}, "keep": "yes"}
    if upstream is not None:
        original["upstream"] = upstream
    updated = imp.manifest_bytes(canonical(original), b"payload", 123)
    value = json.loads(updated)
    assert value["keep"] == "yes" and value["files"]["other.jsonl"] == original["files"]["other.jsonl"]
    assert value["tables"] == {"other": 7, "cross_references": 123}
    assert value["files"][imp.OUT_FILE] == {"rows": 123, "sha256": hashlib.sha256(b"payload").hexdigest(), "table": "cross_references"}
    record = value["upstream"][-1] if isinstance(value["upstream"], list) else value["upstream"]["TSK.zip"]
    assert record == imp.UPSTREAM
    assert imp.manifest_bytes(updated, b"payload", 123) == updated
    with pytest.raises(imp.ImportFailed, match="canonical format"):
        imp.manifest_bytes(b'{"files":{},"tables":{}}', b"", 0)


def test_gzip_is_deterministic_and_canonical():
    rows = [{"z": None, "a": "text"}, {"id": 2}]
    first = imp.gzip_rows(rows)
    assert first == imp.gzip_rows(rows)
    assert first[4:8] == b"\0" * 4
    assert gzip.decompress(first) == b'{"a":"text","z":null}\n{"id":2}\n'


def test_checksum_failure_writes_nothing_and_is_first(tmp_path, monkeypatch):
    upstream = tmp_path / "upstream/sword-tsk"
    upstream.mkdir(parents=True)
    (upstream / "TSK.zip").write_bytes(b"not a zip")
    out, report = tmp_path / "out", tmp_path / "report.json"
    monkeypatch.setattr(imp, "load_verses", lambda path: pytest.fail("read verses before sha256"))
    with pytest.raises(imp.ImportFailed, match="sha256 mismatch"):
        imp.run(upstream.parent, out, report_path=report)
    assert not out.exists() and not report.exists()


@pytest.fixture(scope="module")
def pinned_entries():
    path = UPSTREAM / "sword-tsk/TSK.zip"
    if not path.exists():
        pytest.skip("pinned TSK.zip is absent")
    assert hashlib.sha256(path.read_bytes()).hexdigest() == imp.ZIP_SHA256
    layout, maxima = imp.load_verses(imp.DEFAULT_VERSES)
    entries, checked = [], 0
    with zipfile.ZipFile(path) as archive:
        for testament in ("ot", "nt"):
            mapped, alignment, _ = imp.verse_entries(imp.read_module(archive, testament), testament, layout)
            entries.extend(mapped)
            checked += alignment
    assert len(entries) == 31102 and checked == 1172
    return entries, maxima


def test_pinned_spot_checks(pinned_entries):
    entries, maxima = pinned_entries
    selected = [e for e in entries if e[0] in {(43, 3, 16), (23, 53, 5)}]
    rows, _ = imp.build_rows(selected, maxima)
    john = {(r["to_book_number"], r["to_chapter"], r["to_verse_start"]) for r in rows if r["from_book_number"] == 43}
    isaiah = {(r["to_book_number"], r["to_chapter"], r["to_verse_start"]) for r in rows if r["from_book_number"] == 23}
    assert {(45, 5, 8), (62, 4, 9)} <= john
    assert (60, 2, 24) in isaiah
    assert [(r["to_book_number"], r["to_chapter"], r["to_verse_start"], r["to_verse_end"]) for r in rows if r["from_book_number"] == 43] == [
        (42, 2, 14, None), (45, 5, 8, None), (47, 5, 19, 21), (56, 3, 4, None),
        (62, 4, 9, None), (62, 4, 10, None), (62, 4, 19, None), (43, 1, 14, None),
        (43, 1, 18, None), (1, 22, 12, None), (41, 12, 6, None), (45, 5, 10, None),
        (45, 8, 32, None), (43, 3, 15, None), (40, 9, 13, None), (54, 1, 15, None), (54, 1, 16, None)]


def test_pinned_whole_source_counts_and_alignment_corruption(pinned_entries):
    entries, maxima = pinned_entries
    rows, report = imp.build_rows(entries, maxima)
    assert len(rows) == report["total_rows"]
    assert report["parser_items"] == report["independent_items"]
    assert report["rows_tagged"] == report["parser_items"]["tagged"] - report["drop_count"] + report["extra_split_rows"]["tagged"]
    assert report["rows_untagged"] == 16
    assert report["drop_count"] / sum(report["independent_items"].values()) < 0.002
    assert sum(report["rows_per_book"].values()) == len(rows)
    assert all(report["rows_per_book"][str(b)] > 0 for b in range(1, 67))
    assert report["verses_with_references"] + len(report["verses_with_none"]) == 31102
    # Mutating an outline anchor must invalidate an otherwise correct layout.
    layout, _ = imp.load_verses(imp.DEFAULT_VERSES)
    with zipfile.ZipFile(UPSTREAM / "sword-tsk/TSK.zip") as archive:
        original = imp.read_module(archive, "ot")
    original[4] = original[4].replace('passage="Ge 1:1"', 'passage="Ge 2:1"')
    with pytest.raises(imp.ImportFailed, match="chapter alignment"):
        imp.verse_entries(original, "ot", layout)


def test_pinned_invalid_manifest_does_not_replace_existing_output(tmp_path):
    if not (UPSTREAM / "sword-tsk/TSK.zip").exists():
        pytest.skip("pinned TSK.zip is absent")
    out = tmp_path / "out"
    out.mkdir()
    (out / imp.OUT_FILE).write_bytes(b"keep")
    (out / "MANIFEST.json").write_bytes(b'{"files":{},"tables":{}}')
    report = tmp_path / "report.json"
    with pytest.raises(imp.ImportFailed, match="canonical format"):
        imp.run(UPSTREAM, out, report_path=report)
    assert (out / imp.OUT_FILE).read_bytes() == b"keep"
    assert not report.exists()


def test_isolated_cli_has_no_sibling_import_requirement(tmp_path):
    # A bad checksum reaches the intended validation under -I, even outside cwd.
    upstream = tmp_path / "sword-tsk"
    upstream.mkdir()
    (upstream / "TSK.zip").write_bytes(b"bad checksum")
    result = subprocess.run([sys.executable, "-I", str(ROOT / "scripts/import_tsk.py"),
                             "--upstream", str(tmp_path), "--out", str(tmp_path / "out")],
                            cwd=tmp_path, capture_output=True, text=True)
    assert result.returncode == 1 and "sha256 mismatch" in result.stderr
    assert not (tmp_path / "out").exists()
