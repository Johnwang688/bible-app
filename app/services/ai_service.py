from __future__ import annotations

import json
import re
import time
from collections import deque
from dataclasses import dataclass, field
from pathlib import Path
from threading import Lock
from typing import Any

from fastapi import Request
from openai import AsyncOpenAI

from app.core.config import get_settings
from app.schemas.ai import (
    AIAction,
    AIActionParams,
    AIActionType,
    AIChatRequest,
    AIChatResponse,
    AIContext,
    AIHistoryMessage,
    AIModelResponse,
)
from app.services.bible_service import BOOK_DATA, get_chapter, get_verse_range, resolve_book

PROMPTS_DIR = Path(__file__).resolve().parents[1] / "prompts" / "ai"
MAX_HISTORY_MESSAGES = 8
MAX_OUTPUT_TOKENS = 450
RATE_LIMIT_REQUESTS = 12
RATE_LIMIT_WINDOW_SECONDS = 300
DEFAULT_COMMENTARY_SOURCE = "matthew_henry"
MAX_SUPPLEMENTARY_PASSAGES = 3
GENESIS_CH3_EDEN_CROSS_CHAPTER_RE = re.compile(
    r"\b(serpent|deceive|deceived|tree\s+of|forbidden|not\s+eat|shall\s+not\s+eat|"
    r"touch|lest\s+you\s+die|woman|eve|adam|garden|command|tempt|naked)\b",
    re.IGNORECASE,
)
LOW_STAKES_USER_MESSAGE_RE = re.compile(
    r"^(hi|hello|hey|thanks|thank you|what can you do|help)\b",
    re.IGNORECASE,
)
CHAPTER_SUMMARY_REQUEST_RE = re.compile(
    r"\b(summarize|summary|recap|overview|outline|gist|main points|walk me through)\b",
    re.IGNORECASE,
)
BOOK_NAMES = sorted((book["name"] for book in BOOK_DATA), key=len, reverse=True)
PASSAGE_RE = re.compile(
    r"(?<!\w)("
    + "|".join(re.escape(name) for name in BOOK_NAMES)
    + r")(?:\s+(\d+)(?::(\d+)(?:\s*-\s*(\d+))?)?)?(?!\w)",
    re.IGNORECASE,
)


class AIServiceUnavailable(RuntimeError):
    pass


class RateLimitExceeded(RuntimeError):
    def __init__(self, retry_after_seconds: int):
        self.retry_after_seconds = max(1, retry_after_seconds)
        self.message = (
            f"You're sending messages a little too quickly. Try again in about {self.retry_after_seconds} seconds."
        )
        super().__init__(self.message)


class InMemoryRateLimiter:
    def __init__(self, limit: int, window_seconds: int):
        self.limit = limit
        self.window_seconds = window_seconds
        self._events: dict[str, deque[float]] = {}
        self._lock = Lock()

    def check(self, key: str) -> None:
        now = time.time()
        window_start = now - self.window_seconds
        with self._lock:
            bucket = self._events.setdefault(key, deque())
            while bucket and bucket[0] < window_start:
                bucket.popleft()
            if len(bucket) >= self.limit:
                retry_after = int(bucket[0] + self.window_seconds - now) + 1
                raise RateLimitExceeded(retry_after)
            bucket.append(now)

    def clear(self) -> None:
        with self._lock:
            self._events.clear()


_RATE_LIMITER = InMemoryRateLimiter(
    limit=RATE_LIMIT_REQUESTS,
    window_seconds=RATE_LIMIT_WINDOW_SECONDS,
)
_OPENAI_CLIENT: AsyncOpenAI | None = None


@dataclass
class ParsedReference:
    book: str
    chapter: int
    verse_start: int | None = None
    verse_end: int | None = None

    @property
    def label(self) -> str:
        if self.verse_start is None:
            return f"{self.book} {self.chapter}"
        if self.verse_end and self.verse_end != self.verse_start:
            return f"{self.book} {self.chapter}:{self.verse_start}-{self.verse_end}"
        return f"{self.book} {self.chapter}:{self.verse_start}"


@dataclass
class ScripturePayload:
    current_label: str
    current_chapter_text: str
    supplementary_passages: list[tuple[str, str]] = field(default_factory=list)


def get_request_identity(request: Request) -> str:
    forwarded_for = request.headers.get("x-forwarded-for")
    if forwarded_for:
        return forwarded_for.split(",")[0].strip()
    if request.client and request.client.host:
        return request.client.host
    return "anonymous"


def check_rate_limit(identity: str) -> None:
    _RATE_LIMITER.check(identity)


def reset_rate_limit_state() -> None:
    _RATE_LIMITER.clear()


def get_openai_client() -> AsyncOpenAI:
    global _OPENAI_CLIENT
    settings = get_settings()
    if not settings.openai_api_key:
        raise AIServiceUnavailable("OpenAI is not configured on this server yet.")
    if _OPENAI_CLIENT is None:
        _OPENAI_CLIENT = AsyncOpenAI(api_key=settings.openai_api_key)
    return _OPENAI_CLIENT


def load_prompt_bundle(prompt_dir: Path = PROMPTS_DIR) -> str:
    files = sorted(prompt_dir.glob("*.md"))
    return "\n\n".join(path.read_text(encoding="utf-8").strip() for path in files if path.is_file()).strip()


def trim_history(messages: list[AIHistoryMessage], limit: int = MAX_HISTORY_MESSAGES) -> list[AIHistoryMessage]:
    cleaned = [message for message in messages if message.content.strip()]
    return cleaned[-limit:]


def format_context_label(context: AIContext) -> str:
    return f"{context.book} {context.chapter} ({context.translation})"


def format_verse_lines(verses: list[Any]) -> str:
    return "\n".join(f"{verse.verse}. {verse.text}" for verse in verses)


def infer_reference_for_chapter_summary_request(message: str, context: AIContext) -> str | None:
    """When the model omits `references`, recover for obvious same-chapter summary asks."""
    if not CHAPTER_SUMMARY_REQUEST_RE.search(message):
        return None
    explicit = extract_explicit_reference(message)
    if explicit is not None:
        if explicit.book == context.book and explicit.chapter == context.chapter:
            return f"{context.book} {context.chapter}"
        return None
    if re.search(r"\b(this|the)\s+(chapter|passage)\b", message, re.IGNORECASE):
        return f"{context.book} {context.chapter}"
    if re.search(r"\bsummarize\s+this\b", message, re.IGNORECASE):
        return f"{context.book} {context.chapter}"
    return None


def _parsed_reference_from_match(match: re.Match[str]) -> ParsedReference | None:
    book_name, chapter_raw, verse_start_raw, verse_end_raw = match.groups()
    if not chapter_raw:
        return None
    resolved = resolve_book(book_name)
    if not resolved:
        return None
    verse_start = int(verse_start_raw) if verse_start_raw else None
    verse_end = int(verse_end_raw) if verse_end_raw else verse_start
    return ParsedReference(
        book=resolved["name"],
        chapter=int(chapter_raw),
        verse_start=verse_start,
        verse_end=verse_end,
    )


def extract_explicit_reference(message: str) -> ParsedReference | None:
    match = PASSAGE_RE.search(message)
    if not match:
        return None
    return _parsed_reference_from_match(match)


def extract_all_references(text: str) -> list[ParsedReference]:
    return [ref for m in PASSAGE_RE.finditer(text) if (ref := _parsed_reference_from_match(m))]


def infer_cross_chapter_context(context: AIContext, message: str) -> list[ParsedReference]:
    """Heuristic passages that often belong in context with the active chapter (no extra model call)."""
    refs: list[ParsedReference] = []
    if (
        context.book == "Genesis"
        and context.chapter == 3
        and GENESIS_CH3_EDEN_CROSS_CHAPTER_RE.search(message)
    ):
        refs.append(ParsedReference(book="Genesis", chapter=2, verse_start=None, verse_end=None))
    return refs


def is_covered_by_active_chapter(ref: ParsedReference, context: AIContext) -> bool:
    return ref.book == context.book and ref.chapter == context.chapter


def collect_supplementary_references(
    context: AIContext,
    message: str,
    history: list[AIHistoryMessage],
) -> list[ParsedReference]:
    refs: list[ParsedReference] = []
    refs.extend(extract_all_references(message))
    for entry in history[-6:]:
        refs.extend(extract_all_references(entry.content))
    refs.extend(infer_cross_chapter_context(context, message))
    return [r for r in refs if not is_covered_by_active_chapter(r, context)]


@dataclass
class PassageFetchPlan:
    book: str
    chapter: int
    whole_chapter: bool
    verse_start: int | None = None
    verse_end: int | None = None

    @property
    def label(self) -> str:
        if self.whole_chapter:
            return f"{self.book} {self.chapter}"
        assert self.verse_start is not None
        ve = self.verse_end if self.verse_end is not None else self.verse_start
        if ve != self.verse_start:
            return f"{self.book} {self.chapter}:{self.verse_start}-{ve}"
        return f"{self.book} {self.chapter}:{self.verse_start}"


def merge_passage_fetch_plans(refs: list[ParsedReference]) -> list[PassageFetchPlan]:
    buckets: dict[tuple[str, int], PassageFetchPlan] = {}
    for ref in refs:
        key = (ref.book, ref.chapter)
        if ref.verse_start is None:
            buckets[key] = PassageFetchPlan(
                book=ref.book,
                chapter=ref.chapter,
                whole_chapter=True,
            )
            continue
        vs = ref.verse_start
        ve = ref.verse_end if ref.verse_end is not None else vs
        existing = buckets.get(key)
        if existing and existing.whole_chapter:
            continue
        if existing and not existing.whole_chapter:
            assert existing.verse_start is not None
            existing.verse_start = min(existing.verse_start, vs)
            existing.verse_end = max(existing.verse_end or existing.verse_start, ve)
        else:
            buckets[key] = PassageFetchPlan(
                book=ref.book,
                chapter=ref.chapter,
                whole_chapter=False,
                verse_start=vs,
                verse_end=ve,
            )
    return list(buckets.values())


async def fetch_passage_for_plan(plan: PassageFetchPlan, translation: str) -> tuple[str, str] | None:
    if plan.whole_chapter:
        chapter = await get_chapter(plan.book, plan.chapter, translation)
        if not chapter:
            return None
        return plan.label, format_verse_lines(chapter.verses)
    assert plan.verse_start is not None
    verse_end = plan.verse_end if plan.verse_end is not None else plan.verse_start
    verses = await get_verse_range(
        plan.book,
        plan.chapter,
        plan.verse_start,
        verse_end,
        translation,
    )
    if not verses:
        return None
    return plan.label, format_verse_lines(verses)


async def build_scripture_payload(
    context: AIContext,
    message: str,
    conversation_history: list[AIHistoryMessage] | None = None,
) -> ScripturePayload:
    current_chapter = await get_chapter(context.book, context.chapter, context.translation)
    if current_chapter is None:
        raise AIServiceUnavailable("The assistant could not load the current chapter.")

    payload = ScripturePayload(
        current_label=format_context_label(context),
        current_chapter_text=format_verse_lines(current_chapter.verses),
    )

    history = conversation_history or []
    raw_refs = collect_supplementary_references(context, message, history)
    if not raw_refs:
        return payload

    plans = merge_passage_fetch_plans(raw_refs)
    seen_labels: set[str] = set()
    for plan in plans:
        if len(payload.supplementary_passages) >= MAX_SUPPLEMENTARY_PASSAGES:
            break
        fetched = await fetch_passage_for_plan(plan, context.translation)
        if not fetched:
            continue
        label, text = fetched
        key = label.lower()
        if key in seen_labels:
            continue
        seen_labels.add(key)
        payload.supplementary_passages.append((label, text))

    return payload


def build_system_prompt() -> str:
    bundle = load_prompt_bundle()
    return (
        f"{bundle}\n\n"
        "Output requirements:\n"
        "- Return valid JSON matching the provided schema.\n"
        "- Keep the answer concise and practical.\n"
        "- Use Scripture references in the `references` array whenever you make a substantive biblical claim.\n"
        "- If the answer is grounded in the Active passage or Current chapter text, include that reference "
        '(for example \"Genesis 1\" or specific verses). Do not leave `references` empty for substantive '
        "answers about the supplied chapter text.\n"
        "- When an \"Additional passage supplied for context\" block is present, you may ground claims in "
        "that text the same way as the current chapter; cite those verses in `references`.\n"
        "- Only suggest actions when they are directly helpful.\n"
        "- Each action's `params` object must include every key; use JSON `null` for fields that do not apply.\n"
        "- For `navigate` actions, include `book` and `chapter`, and optionally `verse_start` and `verse_end`.\n"
        f"- For `open_commentary`, use `source` `{DEFAULT_COMMENTARY_SOURCE}` unless the user asks for a different source.\n"
    )


def build_context_message(context: AIContext, scripture: ScripturePayload) -> str:
    parts = [
        "Reader context:",
        f"- Active passage: {scripture.current_label}",
        "",
        "Current chapter text:",
        scripture.current_chapter_text,
    ]
    for label, text in scripture.supplementary_passages:
        parts.extend(
            [
                "",
                f"Additional passage supplied for context ({context.translation}): {label}",
                text,
            ]
        )
    return "\n".join(parts)


def build_response_schema() -> dict[str, Any]:
    return {
        "type": "json_schema",
        "json_schema": {
            "name": "bible_ai_response",
            "strict": True,
            "schema": {
                "type": "object",
                "additionalProperties": False,
                "properties": {
                    "message": {"type": "string"},
                    "references": {"type": "array", "items": {"type": "string"}},
                    "actions": {
                        "type": "array",
                        "items": {
                            "type": "object",
                            "additionalProperties": False,
                            "properties": {
                                "type": {"type": "string", "enum": ["navigate", "open_commentary"]},
                                "label": {"type": "string"},
                                "description": {"type": "string"},
                                "params": {
                                    "type": "object",
                                    "additionalProperties": False,
                                    "properties": {
                                        # Strict mode: every property key must appear in `required`;
                                        # use null when a field does not apply to that action type.
                                        "book": {
                                            "anyOf": [
                                                {"type": "string"},
                                                {"type": "null"},
                                            ]
                                        },
                                        "chapter": {
                                            "anyOf": [
                                                {"type": "integer"},
                                                {"type": "null"},
                                            ]
                                        },
                                        "verse_start": {
                                            "anyOf": [
                                                {"type": "integer"},
                                                {"type": "null"},
                                            ]
                                        },
                                        "verse_end": {
                                            "anyOf": [
                                                {"type": "integer"},
                                                {"type": "null"},
                                            ]
                                        },
                                        "source": {
                                            "anyOf": [
                                                {"type": "string"},
                                                {"type": "null"},
                                            ]
                                        },
                                    },
                                    "required": [
                                        "book",
                                        "chapter",
                                        "verse_start",
                                        "verse_end",
                                        "source",
                                    ],
                                },
                            },
                            "required": ["type", "label", "description", "params"],
                        },
                    },
                    "suggested_follow_ups": {"type": "array", "items": {"type": "string"}},
                },
                "required": ["message", "references", "actions", "suggested_follow_ups"],
            },
        },
    }


def default_fallback_response(context: AIContext) -> AIChatResponse:
    return AIChatResponse(
        message=(
            "I can't support that clearly from Scripture based on the passage in view. "
            "Try narrowing the question to a specific verse or chapter, and I'll answer from the text."
        ),
        references=[],
        actions=[],
        suggested_follow_ups=[],
        context_label=format_context_label(context),
    )


def normalize_references(references: list[str]) -> list[str]:
    seen: set[str] = set()
    normalized: list[str] = []
    for ref in references:
        cleaned = ref.strip()
        if not cleaned:
            continue
        lowered = cleaned.lower()
        if lowered in seen:
            continue
        seen.add(lowered)
        normalized.append(cleaned)
        if len(normalized) == 6:
            break
    return normalized


def normalize_follow_ups(items: list[str]) -> list[str]:
    cleaned = [item.strip() for item in items if item.strip()]
    return cleaned[:3]


def normalize_actions(actions: list[AIAction]) -> list[AIAction]:
    normalized: list[AIAction] = []
    for action in actions:
        if action.type == AIActionType.NAVIGATE:
            if not action.params.book or not action.params.chapter:
                continue
            resolved = resolve_book(action.params.book)
            if not resolved:
                continue
            params = AIActionParams(
                book=resolved["name"],
                chapter=int(action.params.chapter),
                verse_start=action.params.verse_start,
                verse_end=action.params.verse_end,
            )
            normalized.append(
                AIAction(
                    type=AIActionType.NAVIGATE,
                    label=action.label.strip() or f"Go to {resolved['name']} {params.chapter}",
                    description=action.description.strip(),
                    params=params,
                )
            )
        elif action.type == AIActionType.OPEN_COMMENTARY:
            normalized.append(
                AIAction(
                    type=AIActionType.OPEN_COMMENTARY,
                    label=action.label.strip() or "Open commentary",
                    description=action.description.strip(),
                    params=AIActionParams(source=action.params.source or DEFAULT_COMMENTARY_SOURCE),
                )
            )
        if len(normalized) == 2:
            break
    return normalized


def requires_scripture_reference(user_message: str, response: AIModelResponse) -> bool:
    text = response.message.strip()
    if not text:
        return False
    if LOW_STAKES_USER_MESSAGE_RE.match(user_message.strip()):
        return False
    if text.endswith("?") and len(text) < 180 and not response.actions:
        return False
    return True


def validate_ai_response(
    response: AIModelResponse,
    *,
    user_message: str,
    context: AIContext,
) -> AIChatResponse:
    normalized = AIModelResponse(
        message=response.message.strip(),
        references=normalize_references(response.references),
        actions=normalize_actions(response.actions),
        suggested_follow_ups=normalize_follow_ups(response.suggested_follow_ups),
    )
    if not normalized.message:
        return default_fallback_response(context)
    if requires_scripture_reference(user_message, normalized) and not normalized.references:
        inferred = infer_reference_for_chapter_summary_request(user_message.strip(), context)
        if inferred:
            normalized = normalized.model_copy(update={"references": normalize_references([inferred])})
        else:
            return default_fallback_response(context)
    return AIChatResponse(
        **normalized.model_dump(),
        context_label=format_context_label(context),
    )


async def chat_with_ai(payload: AIChatRequest) -> AIChatResponse:
    settings = get_settings()
    client = get_openai_client()
    history = trim_history(payload.conversation_history)
    scripture = await build_scripture_payload(
        payload.context,
        payload.message,
        conversation_history=history,
    )

    messages: list[dict[str, str]] = [
        {"role": "system", "content": build_system_prompt()},
        {"role": "system", "content": build_context_message(payload.context, scripture)},
    ]
    messages.extend(
        {"role": message.role, "content": message.content.strip()}
        for message in history
        if message.content.strip()
    )
    messages.append({"role": "user", "content": payload.message.strip()})

    completion = await client.chat.completions.create(
        model=settings.openai_model,
        messages=messages,
        response_format=build_response_schema(),
        max_completion_tokens=MAX_OUTPUT_TOKENS,
        reasoning_effort="low",
        store=False,
        user=format_context_label(payload.context),
    )
    content = completion.choices[0].message.content or "{}"
    try:
        parsed = AIModelResponse.model_validate(json.loads(content))
    except Exception:
        return default_fallback_response(payload.context)
    return validate_ai_response(parsed, user_message=payload.message, context=payload.context)
