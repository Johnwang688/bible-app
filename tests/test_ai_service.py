from __future__ import annotations

import pytest
from fastapi.testclient import TestClient

import app.main as app_main
from app.schemas.ai import AIChatResponse, AIContext, AIHistoryMessage, AIModelResponse
from app.schemas.bible import ChapterOut, VerseOut
from app.services import ai_service


def make_verse(book: str, chapter: int, verse: int, text: str) -> VerseOut:
    return VerseOut(
        id=chapter * 100 + verse,
        book=book,
        book_number=43 if book == "John" else 1,
        chapter=chapter,
        verse=verse,
        text=text,
        translation="WEB",
    )


def make_payload(message: str) -> dict:
    return {
        "message": message,
        "context": {
            "book": "John",
            "chapter": 3,
            "translation": "WEB",
        },
        "conversation_history": [],
    }


def test_load_prompt_bundle_uses_lexical_order() -> None:
    class FakeFile:
        def __init__(self, name: str, text: str):
            self.name = name
            self._text = text

        def __lt__(self, other: "FakeFile") -> bool:
            return self.name < other.name

        def is_file(self) -> bool:
            return True

        def read_text(self, encoding: str = "utf-8") -> str:
            return self._text

    class FakePromptDir:
        def glob(self, pattern: str) -> list[FakeFile]:
            assert pattern == "*.md"
            return [
                FakeFile("20-second.md", "second"),
                FakeFile("10-first.md", "first"),
            ]

    bundle = ai_service.load_prompt_bundle(FakePromptDir())  # type: ignore[arg-type]

    assert bundle == "first\n\nsecond"


def test_prompt_bundle_includes_scripture_fidelity_rules() -> None:
    bundle = ai_service.load_prompt_bundle()

    assert "Scripture is the highest authority" in bundle
    assert "Before returning a response to the user" in bundle
    assert "interpretation, possibility, or uncertainty" in bundle


def test_trim_history_keeps_last_eight_messages() -> None:
    history = [
        AIHistoryMessage(role="user" if index % 2 == 0 else "assistant", content=f"message-{index}")
        for index in range(10)
    ]

    trimmed = ai_service.trim_history(history)

    assert len(trimmed) == 8
    assert trimmed[0].content == "message-2"
    assert trimmed[-1].content == "message-9"


def test_extract_explicit_reference_supports_ranges() -> None:
    reference = ai_service.extract_explicit_reference("Compare this with 1 John 4:7-8.")

    assert reference is not None
    assert reference.book == "1 John"
    assert reference.chapter == 4
    assert reference.verse_start == 7
    assert reference.verse_end == 8


def test_extract_all_references_finds_multiple() -> None:
    refs = ai_service.extract_all_references("See John 3:16 and Romans 8:1.")

    books = [(r.book, r.chapter, r.verse_start) for r in refs]
    assert ("John", 3, 16) in books
    assert ("Romans", 8, 1) in books


@pytest.mark.asyncio
async def test_build_scripture_payload_fetches_explicit_passage(monkeypatch: pytest.MonkeyPatch) -> None:
    async def fake_get_chapter(book: str, chapter: int, translation: str = "WEB") -> ChapterOut | None:
        return ChapterOut(
            book=book,
            book_number=43 if book == "John" else 1,
            chapter=chapter,
            translation=translation,
            verses=[make_verse(book, chapter, 1, "Current chapter verse.")],
            total_verses=1,
        )

    async def fake_get_verse_range(
        book: str,
        chapter: int,
        verse_start: int,
        verse_end: int,
        translation: str = "WEB",
    ) -> list[VerseOut]:
        return [
            make_verse(book, chapter, verse_start, "For God so loved the world."),
            make_verse(book, chapter, verse_end, "That whoever believes in him should not perish."),
        ]

    monkeypatch.setattr(ai_service, "get_chapter", fake_get_chapter)
    monkeypatch.setattr(ai_service, "get_verse_range", fake_get_verse_range)

    payload = await ai_service.build_scripture_payload(
        AIContext(book="Genesis", chapter=1, translation="WEB"),
        "Compare this with John 3:16-17.",
    )

    labels = [label for label, _ in payload.supplementary_passages]
    assert "John 3:16-17" in labels
    joined = "\n".join(text for _, text in payload.supplementary_passages)
    assert "For God so loved the world." in joined


@pytest.mark.asyncio
async def test_build_scripture_payload_adds_genesis_2_for_genesis_3_eden_question(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    async def fake_get_chapter(book: str, chapter: int, translation: str = "WEB") -> ChapterOut:
        return ChapterOut(
            book=book,
            book_number=1,
            chapter=chapter,
            translation=translation,
            verses=[make_verse(book, chapter, 1, f"Stub {book} {chapter}:1.")],
            total_verses=1,
        )

    monkeypatch.setattr(ai_service, "get_chapter", fake_get_chapter)

    payload = await ai_service.build_scripture_payload(
        AIContext(book="Genesis", chapter=3, translation="WEB"),
        "Do you want to look at how the woman responds in Genesis 3:2-3?",
    )

    labels = [label for label, _ in payload.supplementary_passages]
    assert any(label.startswith("Genesis 2") for label in labels)


def test_validate_ai_response_requires_scripture_support() -> None:
    response = AIModelResponse(
        message="This passage clearly teaches a promise of material wealth for every believer.",
        references=[],
        actions=[],
        suggested_follow_ups=[],
    )

    validated = ai_service.validate_ai_response(
        response,
        user_message="Does this passage promise wealth?",
        context=AIContext(book="John", chapter=3, translation="WEB"),
    )

    assert "can't support that clearly from Scripture" in validated.message
    assert validated.references == []


def test_validate_ai_response_infers_reference_for_same_chapter_summary() -> None:
    response = AIModelResponse(
        message="Genesis 1 describes God creating heaven, earth, light, sky, land, plants, heavenly lights, animals, and humankind in six days, resting on the seventh.",
        references=[],
        actions=[],
        suggested_follow_ups=[],
    )

    validated = ai_service.validate_ai_response(
        response,
        user_message="Summarize Genesis 1 for me.",
        context=AIContext(book="Genesis", chapter=1, translation="WEB"),
    )

    assert "can't support" not in validated.message.lower()
    assert validated.references == ["Genesis 1"]


def test_ai_chat_rejects_oversized_message() -> None:
    client = TestClient(app_main.app)
    ai_service.reset_rate_limit_state()

    response = client.post("/api/v1/ai/chat", json=make_payload("x" * 1501))

    assert response.status_code == 400
    assert "1,500 characters" in response.json()["detail"]


def test_ai_chat_enforces_rate_limit(monkeypatch: pytest.MonkeyPatch) -> None:
    client = TestClient(app_main.app)
    ai_service.reset_rate_limit_state()

    async def fake_chat(_: object) -> AIChatResponse:
        return AIChatResponse(
            message="John 3 emphasizes new birth.",
            references=["John 3:3-8"],
            actions=[],
            suggested_follow_ups=[],
            context_label="John 3 (WEB)",
        )

    monkeypatch.setattr(app_main, "chat_with_ai", fake_chat)

    for _ in range(ai_service.RATE_LIMIT_REQUESTS):
        response = client.post("/api/v1/ai/chat", json=make_payload("Summarize this chapter."))
        assert response.status_code == 200

    blocked = client.post("/api/v1/ai/chat", json=make_payload("One more question."))

    assert blocked.status_code == 429
    assert "Try again" in blocked.json()["detail"]


def test_ai_chat_surfaces_service_unavailable(monkeypatch: pytest.MonkeyPatch) -> None:
    client = TestClient(app_main.app)
    ai_service.reset_rate_limit_state()

    async def fake_chat(_: object) -> AIChatResponse:
        raise app_main.AIServiceUnavailable("OpenAI is not configured on this server yet.")

    monkeypatch.setattr(app_main, "chat_with_ai", fake_chat)

    response = client.post("/api/v1/ai/chat", json=make_payload("Summarize this chapter."))

    assert response.status_code == 503
    assert "OpenAI is not configured" in response.json()["detail"]
