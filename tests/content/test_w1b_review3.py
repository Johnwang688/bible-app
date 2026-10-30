"""Regression test from the verifier re-check (W1-B round 3). Owned by the orchestrator: do not edit."""

import asyncio

from app.services import bible_service as bs


def test_control_characters_are_term_boundaries():
    for translation, words in (
        ("WEB", ("love", "grace")),
        ("CUV-SIMP", ("\u8036\u7a23", "\u65bd\u6d17")),
    ):
        query = " ".join(words)
        expected_rows = asyncio.run(
            bs.search_verses(query, translation, limit=10)
        )
        expected_matches = bs.find_verse_matches(query, translation)
        assert expected_rows
        if translation == "WEB":
            assert expected_matches

        for separator in ("\x00", "\x01", "\t", "\n", "\x85"):
            query = separator.join(words)
            assert asyncio.run(
                bs.search_verses(query, translation, limit=10)
            ) == expected_rows
            assert (
                bs.find_verse_matches(query, translation)
                == expected_matches
            )
