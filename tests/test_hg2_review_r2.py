"""Regression test from the HG-2 verifier review, round 2 (Sol). Owned by the orchestrator: do not edit."""

from app.services.word_service import plain_grammar


def test_first_person_plural_pronoun_is_we():
    for language in ("hebrew", "aramaic"):
        result = plain_grammar(language, "Pronoun - first person common plural")
        assert result == "pronoun · we", (language, result)
