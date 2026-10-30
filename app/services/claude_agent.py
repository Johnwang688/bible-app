"""Claude chat backend: a bounded tool loop over the content DB behind the /ai/chat contract."""

from __future__ import annotations

import json
import logging
from collections.abc import Awaitable, Callable
from dataclasses import dataclass, field
from typing import Any

import anthropic
from anthropic import AsyncAnthropic, AsyncAnthropicVertex

from app.core.config import get_settings
from app.core.content_db import fetch_one
from app.core.slugify import slugify_label
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
from app.services.ai_service import (
    DEFAULT_COMMENTARY_SOURCE,
    AIServiceUnavailable,
    build_context_message,
    build_scripture_payload,
    build_system_prompt,
    default_fallback_response,
    extract_explicit_reference,
    format_context_label,
    trim_history,
    validate_ai_response,
)
from app.services.bible_service import get_chapter, get_verse_range, resolve_book, search_verses
from app.services.commentary_service import get_commentary
from app.services.summary_entity_service import get_summary_entity_page

logger = logging.getLogger(__name__)

MAX_OUTPUT_TOKENS = 4000
MAX_TOOL_RESULT_CHARS = 24_000
TRUNCATED_MARKER = "\n…(truncated)"
CHARS_PER_TOKEN = 3
MAX_ACTIONS = 3
SEARCH_LIMIT = 15
ENTITY_REFERENCE_LIMIT = 30
ENTITY_KINDS = ("theme", "person", "place")

# Haiku 5.5 list prices, USD per million tokens.
PRICE_INPUT_PER_MTOK = 0.10
PRICE_OUTPUT_PER_MTOK = 0.50
CACHE_READ_FACTOR = 0.10
CACHE_WRITE_FACTOR = 1.25

REFUSAL_MESSAGE = "I can't help with that one, but I'm glad to look at the passage with you."
OFFERED_MESSAGE = "Offered to the user as a button."
FINAL_ROUND_NOTICE = "The tool budget is used up. Answer now from what you already have, without calling any more tools."

FINAL_SCHEMA: dict[str, Any] = {
    "type": "object",
    "properties": {
        "message": {"type": "string"},
        "references": {"type": "array", "items": {"type": "string"}},
        "suggested_follow_ups": {"type": "array", "items": {"type": "string"}},
    },
    "required": ["message", "references", "suggested_follow_ups"],
    "additionalProperties": False,
}

TOOLS_PROMPT = (
    "Tools:\n"
    "You can look things up with tools: get_passage (any verse or chapter), search_scripture (find verses by "
    "words or topic), get_commentary (Matthew Henry and other notes for a chapter or verse) and lookup_entity "
    "(a theme, person or place profile). The passage the reader has open is already included below, so do not "
    "fetch it again. Quote Scripture only from tool results or from that passage, never from memory. "
    "navigate and open_commentary do not look anything up: they offer the reader a button, so use them only when "
    "that is directly helpful. Offer buttons through those tools, not in your final JSON. Answer in the final "
    "JSON with `message`, `references` and `suggested_follow_ups`."
)


def _str(*, nullable: bool = False) -> dict[str, Any]:
    return {"type": ["string", "null"] if nullable else "string"}


def _int(*, nullable: bool = False) -> dict[str, Any]:
    return {"type": ["integer", "null"] if nullable else "integer"}


def _tool(name: str, description: str, properties: dict[str, dict[str, Any]]) -> dict[str, Any]:
    return {
        "name": name,
        "description": description,
        "strict": True,
        "input_schema": {
            "type": "object",
            "properties": properties,
            "required": list(properties),
            "additionalProperties": False,
        },
    }


TOOLS: list[dict[str, Any]] = [
    _tool(
        "get_passage",
        "Fetch Bible text for a chapter or verse range, for example 'Romans 8', 'John 3:16' or 'Psalm 23:1-6'. "
        "translation is a code such as WEB, ASV, CUV or CUV-SIMP; null uses the reader's translation.",
        {"reference": _str(), "translation": _str(nullable=True)},
    ),
    _tool(
        "search_scripture",
        "Search verses by words or topic, best matches first (up to 15). book optionally limits the search to one "
        "book; null searches the whole Bible.",
        {"query": _str(), "translation": _str(nullable=True), "book": _str(nullable=True)},
    ),
    _tool(
        "get_commentary",
        "Fetch commentary notes for a chapter, or for one verse when verse is given.",
        {"book": _str(), "chapter": _int(), "verse": _int(nullable=True)},
    ),
    _tool(
        "lookup_entity",
        "Look up the profile of a theme, person or place (overview, timeline, chapters where it appears).",
        {"kind": {"type": "string", "enum": list(ENTITY_KINDS)}, "name": _str()},
    ),
    _tool(
        "navigate",
        "Offer the reader a button that opens a passage. Nothing is opened until they press it. verse_start and "
        "verse_end may be null for a whole chapter.",
        {
            "book": _str(),
            "chapter": _int(),
            "verse_start": _int(nullable=True),
            "verse_end": _int(nullable=True),
            "label": _str(),
        },
    ),
    _tool(
        "open_commentary",
        "Offer the reader a button that opens the commentary for a chapter. Nothing is opened until they press it.",
        {"book": _str(), "chapter": _int(), "label": _str()},
    ),
]


class ToolError(Exception):
    """A tool problem the model should see as an error result (never raised out of the loop)."""


def _cap(text: str) -> str:
    if len(text) <= MAX_TOOL_RESULT_CHARS:
        return text
    return text[:MAX_TOOL_RESULT_CHARS] + TRUNCATED_MARKER


# ── Client ───────────────────────────────────────────────────────────────────

_CLIENT: AsyncAnthropic | AsyncAnthropicVertex | None = None


def get_claude_client() -> AsyncAnthropic | AsyncAnthropicVertex:
    global _CLIENT
    settings = get_settings()
    if _CLIENT is not None:
        return _CLIENT
    if settings.ai_provider == "vertex":
        if not settings.vertex_project_id:
            raise AIServiceUnavailable("Claude on Vertex AI is not configured on this server yet.")
        _CLIENT = AsyncAnthropicVertex(project_id=settings.vertex_project_id, region=settings.vertex_region)
    else:
        if not settings.anthropic_api_key:
            raise AIServiceUnavailable("Claude is not configured on this server yet.")
        _CLIENT = AsyncAnthropic(api_key=settings.anthropic_api_key)
    return _CLIENT


def reset_claude_client() -> None:
    global _CLIENT
    _CLIENT = None


# ── Tools ────────────────────────────────────────────────────────────────────

@dataclass
class ToolRunner:
    """Per-request tool state: the reader's translation, open passage and the buttons offered so far."""

    translation: str
    active: tuple[int, int] | None = None  # (book number, chapter) the reader has open
    actions: list[AIAction] = field(default_factory=list)

    async def run(self, name: str, tool_input: Any) -> tuple[str, bool]:
        """Return (result text, is_error). Never raises."""
        handler: Callable[[dict[str, Any]], Awaitable[str]] | None = {
            "get_passage": self._get_passage,
            "search_scripture": self._search_scripture,
            "get_commentary": self._get_commentary,
            "lookup_entity": self._lookup_entity,
            "navigate": self._navigate,
            "open_commentary": self._open_commentary,
        }.get(name)
        if handler is None:
            return f"Unknown tool: {name}", True
        try:
            if not isinstance(tool_input, dict):
                raise ToolError("Tool input must be an object.")
            return _cap(await handler(tool_input)), False
        except ToolError as exc:
            return _cap(str(exc)), True
        except Exception:
            logger.exception("Claude tool %s failed", name)
            return "The tool failed. Try a different approach.", True

    def _translation(self, value: Any) -> str:
        if value is None or value == "":
            return self.translation
        if not isinstance(value, str):
            raise ToolError("translation must be a string or null.")
        return value.strip().upper()

    async def _get_passage(self, args: dict[str, Any]) -> str:
        reference = _required_str(args, "reference")
        translation = self._translation(args.get("translation"))
        ref = extract_explicit_reference(reference)
        if ref is None:
            raise ToolError(f"Could not parse a Bible reference from '{reference}'. Try a form like 'John 3:16'.")
        if ref.verse_start is None:
            chapter = await get_chapter(ref.book, ref.chapter, translation)
            verses = chapter.verses if chapter else []
        else:
            verses = await get_verse_range(ref.book, ref.chapter, ref.verse_start, ref.verse_end or ref.verse_start, translation)
        if not verses:
            raise ToolError(f"{ref.label} was not found in {translation}.")
        lines = "\n".join(f"{v.verse} {v.text}" for v in verses)
        return f"{ref.label} ({translation})\n{lines}"

    async def _search_scripture(self, args: dict[str, Any]) -> str:
        query = _required_str(args, "query")
        translation = self._translation(args.get("translation"))
        book = args.get("book")
        if book is not None and not isinstance(book, str):
            raise ToolError("book must be a string or null.")
        results = await search_verses(query, translation, book or None, limit=SEARCH_LIMIT)
        if not results:
            return f"No verses matched '{query}' in {translation}."
        return "\n".join(
            f"{r.verse.book} {r.verse.chapter}:{r.verse.verse} — {r.verse.text}" for r in results
        )

    async def _get_commentary(self, args: dict[str, Any]) -> str:
        book = _required_str(args, "book")
        chapter = _required_int(args, "chapter")
        verse = _optional_int(args, "verse")
        resolved = resolve_book(book)
        if not resolved:
            raise ToolError(f"Unknown book: {book}")
        entries = await get_commentary(resolved["name"], chapter, verse)
        if not entries:
            where = f"{resolved['name']} {chapter}" + (f":{verse}" if verse is not None else "")
            return f"No commentary found for {where}."
        parts = []
        for entry in entries:
            end = f"-{entry.verse_end}" if entry.verse_end and entry.verse_end != entry.verse_start else ""
            parts.append(f"[{entry.source}, verses {entry.verse_start}{end}]\n{entry.content.strip()}")
        return "\n\n".join(parts)

    async def _lookup_entity(self, args: dict[str, Any]) -> str:
        kind = _required_str(args, "kind")
        name = _required_str(args, "name")
        if kind not in ENTITY_KINDS:
            raise ToolError(f"kind must be one of: {', '.join(ENTITY_KINDS)}.")
        page = get_summary_entity_page(kind, slugify_label(name))
        if not page:
            raise ToolError(f"No {kind} profile found for '{name}'.")
        lines = [f"{page['label']} ({page['kind']})"]
        if page.get("overview"):
            lines.append(str(page["overview"]).strip())
        timeline = page.get("timeline")
        events = timeline.get("events") if isinstance(timeline, dict) else None
        if isinstance(events, list) and events:
            lines.append("Timeline:")
            for event in events:
                if not isinstance(event, dict):
                    continue
                era = f" ({event['era']})" if event.get("era") else ""
                lines.append(f"- {event.get('title', '')}{era}: {event.get('summary', '')}".rstrip())
        refs = page.get("references") or []
        if refs:
            shown = ", ".join(f"{r['book_name']} {r['chapter']}" for r in refs[:ENTITY_REFERENCE_LIMIT])
            more = f" (+{len(refs) - ENTITY_REFERENCE_LIMIT} more)" if len(refs) > ENTITY_REFERENCE_LIMIT else ""
            lines.append(f"Appears in: {shown}{more}")
        return "\n".join(lines)

    async def _navigate(self, args: dict[str, Any]) -> str:
        book, chapter, verse_start, verse_end = self._target(args, with_verses=True)
        label = _required_str(args, "label")
        self._offer(
            AIAction(
                type=AIActionType.NAVIGATE,
                label=label,
                params=AIActionParams(book=book["name"], chapter=chapter, verse_start=verse_start, verse_end=verse_end),
            )
        )
        return OFFERED_MESSAGE

    async def _open_commentary(self, args: dict[str, Any]) -> str:
        book, chapter, _, _ = self._target(args, with_verses=False)
        label = _required_str(args, "label")
        if self.active is not None and self.active != (book["number"], chapter):
            # The commentary button only works on the open chapter, so send the reader there instead.
            action = AIAction(
                type=AIActionType.NAVIGATE,
                label=label,
                params=AIActionParams(book=book["name"], chapter=chapter),
            )
        else:
            action = AIAction(
                type=AIActionType.OPEN_COMMENTARY,
                label=label,
                params=AIActionParams(book=book["name"], chapter=chapter, source=DEFAULT_COMMENTARY_SOURCE),
            )
        self._offer(action)
        return OFFERED_MESSAGE

    def _target(
        self, args: dict[str, Any], *, with_verses: bool
    ) -> tuple[dict[str, Any], int, int | None, int | None]:
        """Validate a button target against the reader's translation: (book info, chapter, verse_start, verse_end)."""
        name = _required_str(args, "book")
        book = resolve_book(name)
        if not book:
            raise ToolError(f"Unknown book: {name}")
        chapter = _required_int(args, "chapter")
        if not 1 <= chapter <= book["chapters"]:
            raise ToolError(f"{book['name']} has no chapter {chapter}.")
        row = fetch_one(
            "SELECT MAX(verse) AS last FROM verses WHERE translation = ? AND book_number = ? AND chapter = ?",
            (self.translation, book["number"], chapter),
        )
        last = row["last"] if row else None
        if last is None:
            raise ToolError(f"{book['name']} {chapter} is not available in {self.translation}.")
        if not with_verses:
            return book, chapter, None, None
        verse_start = _optional_int(args, "verse_start")
        verse_end = _optional_int(args, "verse_end")
        if verse_start is None and verse_end is None:
            return book, chapter, None, None
        if verse_start is None:
            raise ToolError("verse_end needs a verse_start.")
        end = verse_start if verse_end is None else verse_end
        if not 1 <= verse_start <= end <= last:
            raise ToolError(
                f"{book['name']} {chapter} has verses 1-{last} in {self.translation}; "
                f"{verse_start}-{end} is not a valid range."
            )
        return book, chapter, verse_start, verse_end

    def _offer(self, action: AIAction) -> None:
        key = (action.type, action.params)
        if any((a.type, a.params) == key for a in self.actions) or len(self.actions) >= MAX_ACTIONS:
            return
        self.actions.append(action)


def _required_str(args: dict[str, Any], key: str) -> str:
    value = args.get(key)
    if not isinstance(value, str) or not value.strip():
        raise ToolError(f"{key} must be a non-empty string.")
    return value.strip()


def _optional_int(args: dict[str, Any], key: str) -> int | None:
    value = args.get(key)
    if value is None:
        return None
    if isinstance(value, bool) or not isinstance(value, int):
        raise ToolError(f"{key} must be an integer or null.")
    return value


def _required_int(args: dict[str, Any], key: str) -> int:
    value = args.get(key)
    if isinstance(value, bool) or not isinstance(value, int):
        raise ToolError(f"{key} must be an integer.")
    return value


# ── Request building ─────────────────────────────────────────────────────────

def build_messages(history: list[AIHistoryMessage], question: str) -> list[dict[str, Any]]:
    """Plain-text turns that alternate roles, start with user and end with the user's question."""
    turns: list[dict[str, Any]] = []
    for message in [*history, AIHistoryMessage(role="user", content=question)]:
        text = message.content.strip()
        if not text:
            continue
        if not turns and message.role != "user":
            continue
        if turns and turns[-1]["role"] == message.role:
            turns[-1]["content"] += "\n\n" + text
        else:
            turns.append({"role": message.role, "content": text})
    return turns


async def build_system(payload: AIChatRequest, history: list[AIHistoryMessage]) -> list[dict[str, Any]]:
    scripture = await build_scripture_payload(
        payload.context,
        payload.message,
        conversation_history=history,
        additional_chapters=payload.additional_chapters or None,
    )
    return [
        {
            "type": "text",
            "text": f"{build_system_prompt(payload.personality)}\n{TOOLS_PROMPT}",
            "cache_control": {"type": "ephemeral"},
        },
        {
            "type": "text",
            "text": build_context_message(payload.context, scripture),
            "cache_control": {"type": "ephemeral"},
        },
    ]


# ── Usage ────────────────────────────────────────────────────────────────────

@dataclass
class Usage:
    rounds: int = 0
    input_tokens: int = 0
    output_tokens: int = 0
    cache_read_tokens: int = 0
    cache_write_tokens: int = 0

    def add(self, usage: Any) -> None:
        self.rounds += 1
        self.input_tokens += getattr(usage, "input_tokens", 0) or 0
        self.output_tokens += getattr(usage, "output_tokens", 0) or 0
        self.cache_read_tokens += getattr(usage, "cache_read_input_tokens", 0) or 0
        self.cache_write_tokens += getattr(usage, "cache_creation_input_tokens", 0) or 0

    @property
    def cost_usd(self) -> float:
        per_input = PRICE_INPUT_PER_MTOK / 1_000_000
        return (
            self.input_tokens * per_input
            + self.cache_read_tokens * per_input * CACHE_READ_FACTOR
            + self.cache_write_tokens * per_input * CACHE_WRITE_FACTOR
            + self.output_tokens * PRICE_OUTPUT_PER_MTOK / 1_000_000
        )

    def log(self) -> None:
        logger.info(
            "claude chat rounds=%d input_tokens=%d output_tokens=%d cache_read_tokens=%d cost_usd=%.5f",
            self.rounds,
            self.input_tokens,
            self.output_tokens,
            self.cache_read_tokens,
            self.cost_usd,
        )


def _prompt_tokens(usage: Any) -> int:
    """Everything the last call read as input, cached or not."""
    return sum(
        getattr(usage, name, 0) or 0
        for name in ("input_tokens", "cache_read_input_tokens", "cache_creation_input_tokens")
    )


# ── Chat ─────────────────────────────────────────────────────────────────────

def _block_type(block: Any) -> str | None:
    return block.get("type") if isinstance(block, dict) else getattr(block, "type", None)


def refusal_response(context: AIContext) -> AIChatResponse:
    return AIChatResponse(
        message=REFUSAL_MESSAGE,
        references=[],
        actions=[],
        suggested_follow_ups=[],
        context_label=format_context_label(context),
    )


def parse_final(content: list[Any], actions: list[AIAction]) -> AIModelResponse | None:
    texts = [block for block in content if _block_type(block) == "text"]
    if not texts:
        return None
    try:
        data = json.loads("".join(block.text for block in texts))
        if not isinstance(data, dict):
            return None
        return AIModelResponse(
            message=data["message"],
            references=data["references"],
            actions=actions,
            suggested_follow_ups=data["suggested_follow_ups"],
        )
    except (ValueError, KeyError, TypeError):  # pydantic.ValidationError is a ValueError
        return None


def _with_notice(message: dict[str, Any]) -> dict[str, Any]:
    return {**message, "content": message["content"] + "\n\n" + FINAL_ROUND_NOTICE}


async def chat(payload: AIChatRequest) -> AIChatResponse:
    settings = get_settings()
    client = get_claude_client()
    history = trim_history(payload.conversation_history)
    system = await build_system(payload, history)
    messages = build_messages(history, payload.message)
    active_book = resolve_book(payload.context.book)
    runner = ToolRunner(
        translation=payload.context.translation,
        active=(active_book["number"], payload.context.chapter) if active_book else None,
    )
    usage = Usage()
    max_calls = settings.ai_max_tool_rounds + 1

    request: dict[str, Any] = {
        "model": settings.claude_model,
        "max_tokens": MAX_OUTPUT_TOKENS,
        "output_config": {"effort": "low", "format": {"type": "json_schema", "schema": FINAL_SCHEMA}},
        "system": system,
        "tools": TOOLS,
    }

    response: Any = None
    final_round = max_calls <= 1
    try:
        while True:
            call = dict(request, messages=messages)
            if final_round:
                call["tool_choice"] = {"type": "none"}
                if usage.rounds == 0:
                    call["messages"] = [*messages[:-1], _with_notice(messages[-1])]
            response = await client.messages.create(**call)
            usage.add(response.usage)

            if response.stop_reason != "tool_use" or final_round:
                break
            tool_uses = [block for block in response.content if _block_type(block) == "tool_use"]
            if not tool_uses:
                break

            results: list[dict[str, Any]] = []
            for block in tool_uses:
                text, is_error = await runner.run(block.name, block.input)
                result: dict[str, Any] = {"type": "tool_result", "tool_use_id": block.id, "content": text}
                if is_error:
                    result["is_error"] = True
                results.append(result)

            new_chars = sum(len(r["content"]) for r in results)
            final_round = (
                usage.rounds + 1 >= max_calls
                or _prompt_tokens(response.usage) + new_chars // CHARS_PER_TOKEN > settings.ai_max_input_tokens
            )
            user_content: list[dict[str, Any]] = list(results)
            if final_round:
                user_content.append({"type": "text", "text": FINAL_ROUND_NOTICE})
            messages.append({"role": "assistant", "content": response.content})
            messages.append({"role": "user", "content": user_content})
    except anthropic.APIError as exc:
        logger.warning("Claude API error: %s", exc)
        raise AIServiceUnavailable("The assistant is temporarily unavailable. Please try again in a moment.") from exc
    finally:
        if usage.rounds:
            usage.log()

    if response.stop_reason == "refusal":
        return refusal_response(payload.context)
    if response.stop_reason in ("max_tokens", "tool_use"):
        return default_fallback_response(payload.context)
    parsed = parse_final(response.content, runner.actions)
    if parsed is None:
        return default_fallback_response(payload.context)
    return validate_ai_response(parsed, user_message=payload.message, context=payload.context)


async def complete_text(system: str, user: str, max_tokens: int, effort: str = "low") -> str:
    """One plain completion: no tools, no structured output."""
    client = get_claude_client()
    try:
        response = await client.messages.create(
            model=get_settings().claude_model,
            max_tokens=max_tokens,
            output_config={"effort": effort},
            system=system,
            messages=[{"role": "user", "content": user}],
        )
    except anthropic.APIError as exc:
        logger.warning("Claude API error: %s", exc)
        raise AIServiceUnavailable("The assistant is temporarily unavailable. Please try again in a moment.") from exc
    return "".join(block.text for block in response.content if _block_type(block) == "text").strip()
