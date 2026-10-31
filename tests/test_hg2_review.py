"""Regression tests from the HG-2 verifier review (Sol), plus orchestrator grammar cases. Owned by the orchestrator: do not edit."""

import pytest
from fastapi.testclient import TestClient

from app.main import app
from app.services.word_service import plain_grammar


@pytest.mark.parametrize(
    "book,chapter,verse",
    [
        ("John", 2**63, 1),
        ("John", 1, 2**63),
        ("John", -(2**63) - 1, 1),
        ("9" * 4301, 1, 1),
    ],
    ids=["huge-chapter", "huge-verse", "negative-overflow", "huge-book"],
)
def test_invalid_word_coordinates(book, chapter, verse):
    client = TestClient(app, raise_server_exceptions=False)
    response = client.get(f"/api/v1/words/{book}/{chapter}/{verse}")
    assert response.status_code == 404, response.status_code


@pytest.mark.parametrize("raw", ["G0025%0A", "G0025%0D", "%20G0025", "G0025%20"])
def test_lexicon_rejects_whitespace(raw):
    response = TestClient(app, raise_server_exceptions=False).get(f"/api/v1/lexicon/{raw}")
    assert response.status_code == 404


@pytest.mark.parametrize(
    "mood,inflection",
    [
        ("Participle", " - Nominative Masculine Singular"),
        ("Infinitive", ""),
    ],
)
def test_nonfinite_keeps_unknown_feature(mood, inflection):
    parsing = f"Verb - Present {mood} Active{inflection} - Mystery"
    result = plain_grammar("greek", parsing)
    assert result.endswith(" · mystery"), result


def test_greek_future_means_future():
    parsing = "Verb - Future Indicative Active - 1st Person Singular"
    assert plain_grammar("greek", parsing) == "verb · future · I"


@pytest.mark.parametrize("parsing,expected", [
    ("Pronoun - third person masculine singular", "pronoun · he"),
    ("Pronoun - first person common singular", "pronoun · I"),
    ("Pronoun - second person masculine plural", "pronoun · you all"),
    ("Pronoun - third person masculine plural", "pronoun · they"),
    ("Conjunctive waw | Pronoun - first person common singular", "and + pronoun · I"),
    ("Conjunctive waw | Verb - Qal - Conjunctive imperfect Jussive - third person masculine singular",
     "and + verb · let it happen · he"),
])
def test_hebrew_pronouns_and_jussive(parsing, expected):
    assert plain_grammar("hebrew", parsing) == expected
