from app.services.summary_entity_service import parse_summary_themes_people


def test_parse_summary_themes_people_basic() -> None:
    text = """TITLE::Hello

First paragraph.

Themes: A · B · C

Key People: X · Y
"""
    themes, people = parse_summary_themes_people(text)
    assert themes == ["A", "B", "C"]
    assert people == ["X", "Y"]


def test_parse_summary_themes_people_empty() -> None:
    themes, people = parse_summary_themes_people("no structured lines")
    assert themes == []
    assert people == []
