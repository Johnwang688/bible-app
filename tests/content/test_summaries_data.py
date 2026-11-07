"""The rewritten chapter summaries, as they sit in the content source."""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def summary_rows():
    lines = (ROOT / "content" / "source" / "commentaries.jsonl").read_text(encoding="utf-8").splitlines()
    return [r for r in map(json.loads, lines) if r["source"] == "summary"]


def test_every_chapter_has_one_summary_in_the_stored_format():
    rows = summary_rows()
    assert len(rows) == 1189
    assert len({(r["book_number"], r["chapter"]) for r in rows}) == 1189
    for r in rows:
        assert r["content"].startswith("TITLE::")
        assert "\n\nKey Points:\n• " in r["content"]
        assert "\n\nSupporting Verses: " in r["content"]


def test_no_old_pasted_text_is_left():
    archaic = re.compile(r"\b(unto|saith|thee|hath|begat|moveth)\b", re.I)
    for r in summary_rows():
        body = r["content"].split("\n\nThemes: ")[0].split("\n\nKey Points:")[0]
        assert not archaic.search(body), (r["book_number"], r["chapter"])


def test_authoring_files_record_where_each_summary_came_from():
    count = 0
    for path in (ROOT / "commentary").glob("*.json"):
        for entry in json.loads(path.read_text(encoding="utf-8")):
            count += 1
            assert entry["translation"] == "BSB"
            assert entry["generated_by"].startswith("gpt-6.1-sol")
            assert entry["spec_version"] in {"summary-0.2", "summary-1.0"}
    assert count == 1189


def test_key_biblical_words_stay_in_romans_3():
    row = next(r for r in summary_rows() if (r["book_number"], r["chapter"]) == (45, 3))
    assert "justif" in row["content"].lower()
    assert "put right" not in row["content"].lower()
