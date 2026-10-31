"""Unit tests for the parsing rules in scripts/import_bsb.py (HG-1)."""

from __future__ import annotations

import pytest

from scripts import import_bsb as imp


def test_html_to_text_breaks_tags_entities_and_indents():
    raw = " <b>to love</b>, to esteem <BR />__1. <ref='Mat.5.43'>Mat.5:43;</ref><br>  caf&eacute;   &amp; more<BR/>"
    assert imp.html_to_text(raw) == "to love, to esteem\n1. Mat.5:43;\ncafé & more"


def test_html_to_text_footnote_italics():
    assert imp.html_to_text("Literally <i>day one</i>") == "Literally day one"


def test_html_to_text_is_nfc():
    assert imp.html_to_text("ἀγαπάω") == "ἀγαπάω"


def test_english_markers():
    assert imp._english(" - ") == (None, "untranslated")
    assert imp._english("  ") == (None, "untranslated")
    assert imp._english(" . . . ") == (None, "continues")
    assert imp._english(" vvv ") == (None, "elsewhere")
    assert imp._english(" [His] ") == ("[His]", "text")


def test_strongs_formatting_and_errors():
    row = [""] * imp.TABLES_COLUMNS
    row[imp.C_STR_HEB] = "430"
    assert imp._strongs("hebrew", row, 2) == "H0430"
    row[imp.C_STR_HEB] = "7225"
    assert imp._strongs("aramaic", row, 2) == "H7225"
    row[imp.C_STR_GRK] = "25"
    assert imp._strongs("greek", row, 2) == "G0025"
    row[imp.C_STR_GRK] = ""
    assert imp._strongs("greek", row, 2) is None
    row[imp.C_STR_GRK] = "25a"
    with pytest.raises(imp.ImportFailed):
        imp._strongs("greek", row, 2)


def test_lexicon_keeps_first_row_per_plain_number():
    text = "\n".join([
        "eStrong#\tdStrong\tuStrong\tLemma\tTranslit\tMorph\tGloss\tDefinition",
        "H0122a\tH0122A =\tH0122A\tאָדֹם\ta.dom\tH:A\tred\tred, <b>ruddy</b>",
        "H0122b\tH0122B =\tH0122B\tאֱדֹם\te.dom\tH:N-M\tred stuff\ta condiment",
        "H0430\tH0430\tH0430\tאֱלֹהִים\t’ĕlōhîm\tH:N-M\tGod\tgod<BR />gods",
    ])
    entries = imp.parse_lexicon(text, "H", "hebrew", "tbesh.txt")
    assert [e["strongs"] for e in entries] == ["H0122", "H0430"]
    assert entries[0]["gloss"] == "red" and entries[0]["definition"] == "red, ruddy"
    assert entries[1]["definition"] == "god\ngods" and entries[1]["language"] == "hebrew"


def test_lexicon_rejects_wrong_prefix():
    with pytest.raises(imp.ImportFailed):
        imp.parse_lexicon("G0025\tG0025\tG0025\ta\tb\tG:V\tc\td", "H", "hebrew", "tbesh.txt")


def test_parse_reference_maps_psalm_alias():
    books = {"Psalms": 19, "Genesis": 1}
    assert imp.parse_reference("Psalm 23:1", books) == (19, 23, 1)
    assert imp.parse_reference("Genesis 1:1", books) == (1, 1, 1)
    with pytest.raises(imp.ImportFailed):
        imp.parse_reference("Hezekiah 1:1", books)
