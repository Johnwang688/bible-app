"""Small ThML regressions, independent of downloaded classics and live services."""

import hashlib
import json
from pathlib import Path
import xml.etree.ElementTree as ET

import pytest

from scripts import import_classics as imp


def parse(xml, source="matthew_henry"):
    chapter = ET.fromstring(xml)
    report = {"errata_applied": [], "cross_chapter_ranges": []}
    stream = imp.ChapterStream(source, 1, 1, {(1, 1): 31}, report)
    rows, audit = stream.finish(chapter, imp.chapter_drops(chapter, source))
    assert audit["characters_in"] == audit["characters_out"] + audit["characters_dropped"]
    return rows, audit, report


def test_matthew_henry_commentary_div_preserves_inline_spacing():
    rows, _, _ = parse('''<div2><h2>Chapter 1</h2>
        <scripCom parsed="|Gen|1|1|1|2"/>
        <div class="Commentary"><h3>Verses 1, 2</h3>
        <p>  God <b>made</b> the <scripRef>earth</scripRef>;\n it is good. </p>
        <p>And <i>light</i>—yes.</p></div></div2>''')
    assert len(rows) == 1
    assert (rows[0]["verse_start"], rows[0]["verse_end"]) == (1, 2)
    assert rows[0]["content"] == "God made the earth; it is good. And light—yes."


def test_matthew_henry_bold_references_split_entries():
    rows, audit, _ = parse('''<div2><h2>Chapter 1</h2>
        <p>An outline (<scripRef>1-3</scripRef>).</p>
        <p><b><scripRef parsed="|Gen|1|1|1|2">Ge 1:1-2</scripRef></b> First <i>note</i>.</p>
        <p>Continued.</p>
        <p><b><scripRef parsed="|Gen|1|3|0|0">Ge 1:3</scripRef></b> Second note.</p></div2>''')
    assert [(r["verse_start"], r["verse_end"]) for r in rows] == [(1, 2), (3, None)]
    assert rows[0]["content"] == "First note. Continued."
    assert rows[1]["content"] == "Second note."
    assert audit["drop_categories"] == {"heading": 1, "chapter_outline_paragraph": 1, "leading_reference": 2}
    assert audit["drop_characters"]["leading_reference"] == len("Ge1:1-2Ge1:3")


def test_chapter_without_marker_gets_whole_chapter_range():
    rows, _, _ = parse("<div2><h2>Chapter 1</h2><p>An outline.</p><p> Body  text. </p></div2>")
    assert len(rows) == 1
    assert (rows[0]["verse_start"], rows[0]["verse_end"], rows[0]["content"]) == (1, 31, "Body text.")
    rows, _, _ = parse("<div2><p>The only paragraph is body text.</p></div2>")
    assert rows[0]["content"] == "The only paragraph is body text."


def test_new_mh_prefixes_are_named_drops_but_legacy_text_is_unchanged():
    rows, audit, _ = parse("<div2><p>—  This chapter gives counsel.</p></div2>")
    assert rows[0]["content"] == "This chapter gives counsel."
    assert audit["drop_categories"] == {"leading_dash": 1}
    assert audit["drop_characters"]["leading_dash"] == 1
    rows, audit, _ = parse('''<div2><p><b><scripRef parsed="|Gen|1|1|0|0">Gen. 1:1</scripRef></b>
        — First word.</p></div2>''')
    assert rows[0]["content"] == "First word."
    assert audit["drop_categories"] == {"leading_reference": 1, "leading_dash": 1}
    rows, audit, _ = parse('''<div2><scripCom parsed="|Gen|1|1|0|0"/>
        <div class="Commentary"><p>— Legacy text.</p></div></div2>''')
    assert rows[0]["content"] == "— Legacy text."
    assert not audit["drop_categories"]


def test_jfb_marker_inside_previous_div_starts_next_entry():
    rows, _, _ = parse('''<div3><scripCom parsed="|Gen|1|0|0|0"/>
        <p>CHAPTER 1</p><scripCom parsed="|Gen|1|1|0|0"/>
        <div class="Commentary"><p>First.</p><scripCom parsed="|Gen|1|2|0|0"/></div>
        <div class="Commentary"><p>Second <b>bold</b> <i>word</i>—<span>λόγος</span>.</p>
        <p>Another paragraph: <scripRef>Ge 1:1</scripRef>.</p></div></div3>''', "jfb")
    assert [r["content"] for r in rows] == ["First.", "Second bold word—λόγος.\nAnother paragraph: Ge 1:1."]
    assert rows[1]["verse_end"] is None


def test_jfb_chapter_lead_and_section_heading_stay_in_first_entry():
    rows, audit, _ = parse('''<div3><p>PSALM 3</p><p> A chapter lead. </p>
        <scripCom parsed="|Gen|1|1|0|0"/><div>
        <p>Ge 1:1, 2. The Creation of Heaven and Earth.</p><p>  Note\n here. </p>
        </div></div3>''', "jfb")
    assert rows[0]["content"] == "A chapter lead.\nGe 1:1, 2. The Creation of Heaven and Earth.\nNote here."
    assert audit["drop_categories"] == {"bare_chapter_heading": 1}


def test_tables_poetry_and_blockquotes_keep_each_row_or_line():
    rows, _, _ = parse('''<div3><scripCom parsed="|Gen|1|1|0|0"/>
        <table><tr><td><b>First</b></td><td>row</td></tr><tr><td>Next</td><td>row</td></tr></table>
        <verse><l>Line one</l><l>Line two</l></verse><blockquote>Quoted <i>words</i>.</blockquote>
        <p>Hebrew: אֵל; e&#769;.</p></div3>''', "jfb")
    assert rows[0]["content"] == "First row\nNext row\nLine one\nLine two\nQuoted words.\nHebrew: אֵל; é."


def test_empty_jfb_markers_do_not_make_empty_rows_or_duplicate_text():
    rows, _, report = parse('''<div3><scripCom parsed="|Gen|1|1|0|0"/><p>One.</p>
        <scripCom parsed="|Gen|1|2|0|0"/><div><scripCom parsed="|Gen|1|3|0|0"/></div>
        <div><p>Three.</p></div></div3>''', "jfb")
    assert [r["verse_start"] for r in rows] == [1, 3]
    assert report["markers_without_text"]["jfb"] == [[1, 1, 2, None]]


def test_mislabeled_introduction_keeps_verse_sections_and_drops_actual_intro(monkeypatch):
    monkeypatch.setitem(imp.ERRATA, ("jfb", "snippet"), ("Introduction", "|Gen|1|0|0|0", "body"))
    rows, audit, _ = parse('''<div3 id="snippet" title="Introduction">
        <scripCom parsed="|Gen|1|1|0|0"/><div><div><p>INTRODUCTION</p></div>
        <p>Actual introductory prose.</p><p id="body">Ge 1:1. A section heading.</p>
        <p>Verse one note.</p><scripCom parsed="|Gen|1|2|0|0"/></div>
        <div><p>Verse two note.</p></div></div3>''', "jfb")
    assert [r["content"] for r in rows] == ["Ge 1:1. A section heading.\nVerse one note.", "Verse two note."]
    assert audit["drop_categories"] == {"book_introduction_block": 2}


def test_bare_elegy_heading_dropped_but_section_title_retained():
    rows, audit, _ = parse('''<div3><p>CHAPTER (ELEGY) 1</p><scripCom parsed="|Gen|1|1|0|0"/>
        <div class="Center"><p>A section title.</p></div><p>Note.</p></div3>''', "jfb")
    assert rows[0]["content"] == "A section title.\nNote."
    assert audit["drop_categories"] == {"bare_chapter_heading": 1}


def test_outline_table_is_dropped_but_commentary_table_is_kept():
    rows, audit, _ = parse('''<div2><h2>Chapter 1</h2>
        <table><tr><td>Chapter Outline</td><td>outline text</td></tr></table>
        <scripCom parsed="|Gen|1|1|0|0"/><div class="Commentary"><h3>Verse 1</h3>
        <p>Note.</p><table><tr><td>Visible</td><td>table</td></tr></table></div></div2>''')
    assert rows[0]["content"] == "Note. Visible table"
    assert audit["drop_categories"] == {"heading": 2, "chapter_outline_table": 1}


def test_cross_chapter_range_is_clipped_and_reported():
    rows, _, report = parse('<div2><scripCom id="range" parsed="|Gen|1|29|2|3"/><p>Note.</p></div2>')
    assert rows[0]["verse_end"] == 31
    assert report["cross_chapter_ranges"] == [{"source": "matthew_henry", "id": "range", "parsed": "|Gen|1|29|2|3", "verse_end": 31}]


@pytest.mark.parametrize("ref", ["|Gen|1|32|0|0", "|Gen|1|3|1|2", "|Exod|1|1|0|0", "|Gen|2|1|0|0"])
def test_bad_references_fail_without_heuristic_corrections(ref):
    with pytest.raises(imp.ImportFailed):
        parse(f'<div2><scripCom parsed="{ref}"/><p>Note.</p></div2>')


def test_xml_entities_and_no_external_dtd_fetch():
    root = imp.parse_xml(b'<!DOCTYPE ThML SYSTEM "https://invalid.example/dtd"><ThML>&nbsp;&mdash;&amp;</ThML>')
    assert root.text == "\xa0—&"
    with pytest.raises(imp.ImportFailed, match="undefined XML entity"):
        imp.parse_xml(b"<ThML>&undefined;</ThML>")
    with pytest.raises(imp.ImportFailed, match="internal DTD"):
        imp.parse_xml(b'<!DOCTYPE x [<!ENTITY a "boom">]><x>&a;</x>')


def test_both_hashes_are_verified_before_parsing_and_nothing_is_written(tmp_path, monkeypatch):
    upstream, out = tmp_path / "upstream", tmp_path / "out"
    upstream.mkdir()
    out.mkdir()
    original = out / "commentaries.jsonl"
    original.write_bytes(b"unchanged")
    for name in imp.UPSTREAM:
        p = upstream / name
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(b"<invalid>")
    first = next(iter(imp.UPSTREAM.values()))
    monkeypatch.setitem(first, "sha256", hashlib.sha256(b"<invalid>").hexdigest())
    monkeypatch.setattr(imp, "parse_xml", lambda _: pytest.fail("parsed before checking both hashes"))
    with pytest.raises(imp.ImportFailed, match="sha256 mismatch"):
        imp.run(upstream, out, tmp_path / "report.json")
    assert original.read_bytes() == b"unchanged"
    assert not (tmp_path / "report.json").exists()
    assert list(out.iterdir()) == [original]


def jfb_row(verse, content, end=None):
    return {"source": "jfb", "book_number": 1, "chapter": 1, "verse_start": verse,
            "verse_end": end, "content": content}


@pytest.mark.parametrize("label", ["13, 14. Moses said", "13-14. Moses said", "13–14: Moses said"])
def test_jfb_ranges_use_first_numeric_paragraph_after_section_headings(label):
    report = {}
    rows = imp.apply_jfb_labels([jfb_row(13, "Ge 1:13-14. Section title.\n" + label)], {(1, 1): 31}, report)
    assert (rows[0]["verse_start"], rows[0]["verse_end"]) == (13, 14)
    assert report["jfb_verse_labels"]["rows_gained_range"] == 1
    assert report["jfb_verse_labels"]["uncovered_before_count"] == 30
    assert report["jfb_verse_labels"]["uncovered_after_count"] == 29


@pytest.mark.parametrize("marker,label,start,end", [(10, "9, 10. Words.", 9, 10), (11, "9, 10. Words.", 9, 10), (2, "1. Now these are the names.", 1, None)])
def test_jfb_labels_can_start_before_the_marker(marker, label, start, end):
    rows = imp.apply_jfb_labels([jfb_row(marker, label)], {(1, 1): 31}, {})
    assert (rows[0]["verse_start"], rows[0]["verse_end"]) == (start, end)


def test_jfb_ambiguous_and_colliding_labels_stay_on_marker():
    report = {}
    rows = imp.apply_jfb_labels([jfb_row(2, "7. A different note."), jfb_row(9, "9. Own entry."),
                                jfb_row(10, "9, 10. Would collide."), jfb_row(29, "32-33. Beyond chapter.")],
                               {(1, 1): 31}, report)
    assert [r["verse_start"] for r in rows] == [2, 9, 10, 29]
    cases = report["jfb_verse_labels"]["kept_on_marker"]
    assert [r["marker"] for r in cases] == [2, 10, 29]
    assert "already has an entry" in cases[1]["reason"]


def test_jfb_overlaps_are_shortened_before_next_entry_and_reported():
    report = {}
    rows = imp.apply_jfb_labels([jfb_row(1, "1-4. First note."), jfb_row(3, "3. Next note.")], {(1, 1): 31}, report)
    assert rows[0]["verse_end"] == 2
    assert report["jfb_verse_labels"]["shortened_ranges"] == [
        {"reference": [1, 1, 1], "before": 4, "after": 2, "next_entry_start": 3}]


def test_jfb_label_range_is_clipped_to_chapter_end_and_reported():
    report = {}
    rows = imp.apply_jfb_labels([jfb_row(29, "29-33. Last note.")], {(1, 1): 31}, report)
    assert rows[0]["verse_end"] == 31
    assert report["jfb_verse_labels"]["shortened_ranges"] == [
        {"reference": [1, 1, 29], "before": 33, "after": 31, "reason": "chapter end"}]


def test_jfb_duplicate_chapter_lead_is_joined_without_losing_text():
    report = {}
    rows = imp.apply_jfb_labels([jfb_row(1, "Chapter lead.", 31), jfb_row(1, "1, 2. Verse note.")], {(1, 1): 31}, report)
    assert len(rows) == 1
    assert rows[0]["content"] == "Chapter lead.\n1, 2. Verse note."
    assert rows[0]["verse_end"] == 2
    assert len(report["jfb_verse_labels"]["merged_duplicate_starts"]) == 1


@pytest.mark.parametrize("tsk_first", [True, False])
def test_manifest_merges_classics_and_tsk_in_either_order(tsk_first):
    from scripts import import_tsk

    original = {"files": {"summary_entities.jsonl": {"rows": 42, "sha256": "unchanged", "table": "summary_entities"}},
                "tables": {"summary_entities": 42}, "upstream": {"other.xml": {"name": "Keep me"}},
                "coverage": {"other_source": {"every_chapter": False}}}
    current = imp.pretty(original)
    declarations = {"jfb": {"every_chapter": True}}
    classics = lambda data: imp.update_manifest(data, {"commentaries/jfb.jsonl.gz": (b"notes", 1, "commentaries")}, declarations)
    tsk = lambda data: import_tsk.manifest_bytes(data, imp.gzip_bytes(b'{}\n'), 1)
    result = json.loads(classics(tsk(current)) if tsk_first else tsk(classics(current)))
    assert {"other.xml", "TSK.zip", "mhcc.xml", "jfb.xml"} == set(result["upstream"])
    assert result["coverage"] == {**original["coverage"], **declarations}
    assert result["files"]["summary_entities.jsonl"] == original["files"]["summary_entities.jsonl"]
    assert result["tables"]["cross_references"] == 1
    assert result["files"]["cross_references.jsonl.gz"]["rows"] == 1
