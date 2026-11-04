"""CM-3 curated people/places, lossless cleanup and application acceptance checks."""

from collections import Counter
import gzip
import hashlib
import json
from pathlib import Path
import shutil

import pytest

from scripts import build_content
from scripts import rebuild_entities as r

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "content/source"
PEOPLE = ROOT / "people/people.json"
PLACES = ROOT / "places/places.json"
THEME_SHA256 = "5297c85c705d9a83bc340d225b1833411e1aa9814955dccbe2c27a6ae2ce46c9"
HIDDEN = {"person": set(), "place": set()}


def rows(path):
    return [json.loads(line) for line in path.read_bytes().splitlines() if line.strip()]


def curated(path):
    return {entry["slug"]: entry for entry in json.loads(path.read_bytes())}


def snapshot(source):
    return {path.name: path.read_bytes() for path in source.iterdir() if path.is_file()}


def write_json(path, value):
    path.write_bytes((json.dumps(value, sort_keys=True, ensure_ascii=False, indent=2) + "\n").encode())


@pytest.fixture
def tiny(tmp_path):
    source = tmp_path / "source"
    source.mkdir()
    person = {"kind": "person", "slug": "aaron", "label": "Curated Aaron",
              "overview": "New overview.", "timeline": {"events": []}}
    people, places = tmp_path / "people.json", tmp_path / "places.json"
    write_json(people, [person])
    write_json(places, [])
    entities = [
        {"id": 1, "kind": "person", "slug": "heavens", "label": "heavens",
         "created_at": "old", "profile": None},
        {"id": 2, "kind": "person", "slug": "aaron", "label": "Aaron",
         "created_at": "original date", "profile": None},
        {"id": 7, "kind": "theme", "slug": "creation", "label": "Creation",
         "created_at": "old", "profile": None},
    ]
    data = {
        r.ENTITIES: b"".join(r._json_line(row) for row in entities[:2])
        + (json.dumps(entities[2], indent=None) + "\r\n").encode(),
        r.MENTIONS: b"".join(r._json_line({"commentary_id": 10, "entity_id": eid, "sort_order": order})
                            for eid, order in [(1, 0), (2, 4), (7, 9)]),
        "commentaries.jsonl": r._json_line({"id": 10, "source": "summary"}),
    }
    manifest = {"exported_at": "preserve", "upstream": {"example": {"license": "preserve"}},
                "files": {}, "tables": {}}
    for name, raw in data.items():
        (source / name).write_bytes(raw)
        table = name.removesuffix(".jsonl")
        count = len(raw.splitlines())
        manifest["files"][name] = {"rows": count, "sha256": hashlib.sha256(raw).hexdigest(), "table": table}
        manifest["tables"][table] = count
    write_json(source / "MANIFEST.json", manifest)
    return source, people, places


def test_tiny_cleanup_preserves_identity_theme_mentions_and_manifest(tiny):
    source, people, places = tiny
    before = snapshot(source)
    stats = r.rebuild(*tiny)
    result = rows(source / r.ENTITIES)
    assert [row["id"] for row in result] == [2, 7]
    assert result[0] == {"id": 2, "kind": "person", "slug": "aaron", "label": "Aaron",
                         "created_at": "original date", "profile": {
                             "overview": "New overview.", "timeline": {"events": []}}}
    assert (source / r.ENTITIES).read_bytes().splitlines(keepends=True)[1] == before[r.ENTITIES].splitlines(keepends=True)[2]
    assert (source / r.MENTIONS).read_bytes() == b"".join(before[r.MENTIONS].splitlines(keepends=True)[1:])
    assert stats == {"counts": {"person": 1, "theme": 1}, "mentions": 2,
                     "rows_dropped": {"person": 1}, "mentions_dropped": {"person": 1},
                     "no_mentions": {"person": [], "place": []}}
    manifest = json.loads((source / "MANIFEST.json").read_bytes())
    for name in (r.ENTITIES, r.MENTIONS):
        raw = (source / name).read_bytes()
        assert manifest["files"][name] == {"rows": 2, "sha256": hashlib.sha256(raw).hexdigest(),
                                            "table": name.removesuffix(".jsonl")}
    previous = json.loads(before["MANIFEST.json"])
    for section in ("files", "tables"):
        for key in (r.ENTITIES, r.MENTIONS) if section == "files" else ("summary_entities", "commentary_entity_mentions"):
            previous[section].pop(key)
            manifest[section].pop(key)
    assert manifest == previous
    after = snapshot(source)
    r.rebuild(*tiny)
    assert snapshot(source) == after


def test_new_curated_slugs_use_original_max_id_and_slug_order(tiny):
    source, people, places = tiny
    old = json.loads(people.read_bytes())
    new = [{**old[0], "slug": slug, "label": slug.title()} for slug in ("zed", "anna")]
    write_json(people, old + new)
    write_json(places, [{**old[0], "slug": "bethany", "kind": "place", "label": "Bethany"}])
    stats = r.rebuild(*tiny)
    added = rows(source / r.ENTITIES)[-3:]
    assert [(row["slug"], row["id"]) for row in added] == [("anna", 8), ("bethany", 9), ("zed", 10)]
    assert all(row["created_at"] == "2026-11-04T00:00:00+00:00" for row in added)
    assert all(row["profile"] == {"overview": old[0]["overview"], "timeline": old[0]["timeline"]} for row in added)
    assert stats["no_mentions"] == {"person": ["anna", "zed"], "place": ["bethany"]}
    after = snapshot(source)
    r.rebuild(*tiny)
    assert snapshot(source) == after


@pytest.mark.parametrize("file", ["people", "places"])
@pytest.mark.parametrize("defect", ["duplicate", "kind", "label", "overview", "timeline"])
def test_invalid_curated_entries_write_nothing(tiny, file, defect):
    source, people, places = tiny
    path = people if file == "people" else places
    entry = json.loads(people.read_bytes())[0]
    entry["kind"] = "person" if file == "people" else "place"
    if defect == "duplicate":
        entries = [entry, entry]
    else:
        entry[defect] = "theme" if defect == "kind" else " " if defect in ("label", "overview") else None
        entries = [entry]
    write_json(path, entries)
    before = snapshot(source)
    with pytest.raises(r.RebuildFailed, match="duplicate slug" if defect == "duplicate" else defect):
        r.rebuild(*tiny)
    assert snapshot(source) == before


def test_missing_commentary_writes_nothing(tiny):
    source, _, _ = tiny
    with (source / r.MENTIONS).open("ab") as f:
        f.write(r._json_line({"commentary_id": 999, "entity_id": 2, "sort_order": 20}))
    before = snapshot(source)
    with pytest.raises(r.RebuildFailed, match="missing commentary id 999"):
        r.rebuild(*tiny)
    assert snapshot(source) == before


def test_commentary_shards_and_already_missing_entities(tiny):
    source, _, _ = tiny
    shard = "commentaries/extra.jsonl.gz"
    (source / "commentaries").mkdir()
    (source / shard).write_bytes(gzip.compress(r._json_line({"id": 11}), mtime=0))
    manifest = json.loads((source / "MANIFEST.json").read_bytes())
    manifest["files"][shard] = {"table": "commentaries", "rows": 1, "sha256": "unused by rebuild"}
    write_json(source / "MANIFEST.json", manifest)
    with (source / r.MENTIONS).open("ab") as f:
        f.write(r._json_line({"commentary_id": 11, "entity_id": 2, "sort_order": 20}))
        f.write(r._json_line({"commentary_id": 999, "entity_id": 999, "sort_order": 3}))
    stats = r.rebuild(*tiny)
    assert stats["mentions_dropped"] == {"person": 1, "missing": 1}
    assert rows(source / r.MENTIONS)[-1] == {"commentary_id": 11, "entity_id": 2, "sort_order": 20}


def test_real_source_matches_curated_profiles_and_unchanged_themes():
    entities = rows(SOURCE / r.ENTITIES)
    assert Counter(row["kind"] for row in entities) == {"person": 284, "place": 89, "theme": 2989}
    for kind, path in (("person", PEOPLE), ("place", PLACES)):
        expected = curated(path)
        actual = {row["slug"]: row for row in entities if row["kind"] == kind}
        assert actual.keys() == expected.keys()
        for slug, row in actual.items():
            assert row["profile"] == {field: expected[slug][field] for field in ("overview", "timeline")}
    themes = b"".join(line for line in (SOURCE / r.ENTITIES).read_bytes().splitlines(keepends=True)
                      if json.loads(line)["kind"] == "theme")
    assert hashlib.sha256(themes).hexdigest() == THEME_SHA256
    ids = {row["id"] for row in entities}
    manifest = json.loads((SOURCE / "MANIFEST.json").read_bytes())
    commentary_ids = set()
    for name, entry in manifest["files"].items():
        if entry["table"] == "commentaries":
            raw = (SOURCE / name).read_bytes()
            if name.endswith(".gz"):
                raw = gzip.decompress(raw)
            commentary_ids.update(json.loads(line)["id"] for line in raw.splitlines() if line.strip())
    for mention in rows(SOURCE / r.MENTIONS):
        assert mention["entity_id"] in ids
        assert mention["commentary_id"] in commentary_ids


def test_real_source_temp_copy_is_byte_idempotent(tmp_path):
    source = tmp_path / "source"
    source.mkdir()
    manifest = json.loads((SOURCE / "MANIFEST.json").read_bytes())
    names = [r.ENTITIES, r.MENTIONS, "MANIFEST.json"] + [
        name for name, entry in manifest["files"].items() if entry["table"] == "commentaries"]
    for name in names:
        (source / name).parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(SOURCE / name, source / name)
    before = {name: (source / name).read_bytes() for name in names}
    r.rebuild(source, PEOPLE, PLACES)
    r.rebuild(source, PEOPLE, PLACES)
    assert {name: (source / name).read_bytes() for name in names} == before


@pytest.fixture(scope="module")
def built_database(tmp_path_factory):
    database = tmp_path_factory.mktemp("curated-db") / "content.sqlite"
    build_content.build(SOURCE, database)
    return database


def test_application_pages_and_lists_use_curated_entities(built_database, monkeypatch):
    from app.core import content_db
    from app.services import summary_entity_service as service

    # Keep real SQL/JSON decoding and service functions; point reads at a fresh build.
    monkeypatch.setattr(content_db, "_db_path", lambda: built_database)
    try:
        for kind, path in (("person", PEOPLE), ("place", PLACES)):
            expected = curated(path)
            listed = {row["slug"] for row in service.list_summary_entities(kind)}
            assert listed <= expected.keys()
            assert expected.keys() - listed == HIDDEN[kind]
            for slug, entry in expected.items():
                page = service.get_summary_entity_page(kind, slug)
                assert page is not None
                assert (page["kind"], page["slug"]) == (kind, slug)
                assert page["overview"] == entry["overview"]
                assert page["timeline"] == entry["timeline"]
        assert service.get_summary_entity_page("person", "heavens") is None
    finally:
        connection = getattr(content_db._local, "con", None)
        if connection is not None:
            connection.close()
            del content_db._local.con
            del content_db._local.path
