"""The person cards, as they sit in the content source."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "content" / "source"
RETIRED = {"herod", "james", "alexander", "darius", "hanani", "jeconiah"}


def people():
    return json.loads((ROOT / "people" / "people.json").read_text(encoding="utf-8"))


def entities():
    lines = (SOURCE / "summary_entities.jsonl").read_text(encoding="utf-8").splitlines()
    return [json.loads(line) for line in lines]


def test_retired_entries_are_gone_and_nothing_points_at_them():
    assert not RETIRED & {e["slug"] for e in people()}
    assert not RETIRED & {e["slug"] for e in entities() if e["kind"] == "person"}
    for e in people():
        for link in (e.get("card") or {}).get("people", []):
            assert link["slug"] not in RETIRED, e["slug"]


def test_every_mention_points_at_a_live_entity():
    ids = {e["id"] for e in entities()}
    lines = (SOURCE / "commentary_entity_mentions.jsonl").read_text(encoding="utf-8").splitlines()
    assert {json.loads(line)["entity_id"] for line in lines} <= ids


def test_cards_keep_to_the_locked_limits_and_the_old_page_still_works():
    cards = [e for e in people() if "card" in e]
    assert len(cards) == 250
    for e in cards:
        assert len(e["overview"]) <= 250, e["slug"]
        assert isinstance(e["timeline"]["events"], list)


def test_cards_reach_the_entity_profiles():
    by_slug = {e["slug"]: e for e in entities() if e["kind"] == "person"}
    for e in people():
        if "card" in e:
            assert by_slug[e["slug"]]["profile"]["card"] == e["card"]
