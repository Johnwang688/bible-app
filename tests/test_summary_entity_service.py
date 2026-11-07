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


def test_people_list_keeps_curated_labels_and_still_drops_junk(monkeypatch) -> None:
    from app.services import summary_entity_service as service

    rows = [
        {"id": 1, "kind": "person", "slug": "james-brother-of-john", "label": "James (son of Zebedee)", "profile": '{"overview": "x"}'},
        {"id": 2, "kind": "person", "slug": "darius-the-mede", "label": "Darius the Mede", "profile": '{"overview": "x"}'},
        {"id": 3, "kind": "person", "slug": "peter", "label": "Peter", "profile": None},
        {"id": 4, "kind": "person", "slug": "the-crowd", "label": "the crowd", "profile": None},
    ]
    monkeypatch.setattr(service, "fetch_all", lambda *_: [dict(r) for r in rows])
    listed = service.list_summary_entities("person")
    assert {r["slug"] for r in listed} == {"james-brother-of-john", "darius-the-mede", "peter"}
    assert all("profile" not in r for r in listed)
