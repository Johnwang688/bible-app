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
    AdditionalChapter,
    AIChatRequest,
    AIChatResponse,
    AIContext,
    AIHistoryMessage,
    AIModelResponse,
    GuidedChapterAction,
    GuidedChapterRequest,
    GuidedChapterResponse,
)
from app.services.bible_service import BOOK_DATA, get_chapter, get_verse_range, resolve_book
from app.services.commentary_service import get_commentary

PROMPTS_DIR = Path(__file__).resolve().parents[1] / "prompts" / "ai"
MAX_HISTORY_MESSAGES = 8
# Room for verse-grounded answers that need a short paragraph (e.g. "what does this mean?").
MAX_OUTPUT_TOKENS = 550
MAX_ENTITY_CONTENT_TOKENS = 4000
RATE_LIMIT_REQUESTS = 20
RATE_LIMIT_WINDOW_SECONDS = 300
DEFAULT_COMMENTARY_SOURCE = "matthew_henry"
MAX_SUPPLEMENTARY_PASSAGES = 3
GUIDED_SECTION_MAX_TOKENS = 900
GUIDED_DIVE_MAX_TOKENS = 520
GUIDED_MH_EXCERPT_MAX_CHARS = 9000


def merge_overlapping_verse_intervals(intervals: list[tuple[int, int]]) -> list[tuple[int, int]]:
    """Merge only overlapping verse ranges (adjacent blocks stay separate)."""
    if not intervals:
        return []
    cleaned = [(min(a, b), max(a, b)) for a, b in intervals]
    cleaned.sort()
    out: list[tuple[int, int]] = [cleaned[0]]
    for a, b in cleaned[1:]:
        la, lb = out[-1]
        if a <= lb:
            out[-1] = (la, max(lb, b))
        else:
            out.append((a, b))
    return out


def fill_verse_gaps(intervals: list[tuple[int, int]], max_verse: int) -> list[tuple[int, int]]:
    """Cover every verse 1..max_verse: keep each supplied interval and insert gaps as their own sections."""
    if max_verse < 1:
        return []
    if not intervals:
        return [(1, max_verse)]
    out: list[tuple[int, int]] = []
    cur = 1
    for vs, ve in intervals:
        vs = max(1, min(vs, max_verse))
        ve = max(vs, min(ve, max_verse))
        if cur < vs:
            out.append((cur, vs - 1))
        out.append((vs, ve))
        cur = ve + 1
    if cur <= max_verse:
        out.append((cur, max_verse))
    return out


def build_guided_sections_from_mh(mh_intervals: list[tuple[int, int]], max_verse: int) -> list[tuple[int, int]]:
    merged = merge_overlapping_verse_intervals(mh_intervals)
    return fill_verse_gaps(merged, max_verse)


async def compute_guided_chapter_sections(book: str, chapter: int, translation: str) -> list[dict[str, int]]:
    resolved = resolve_book(book)
    if not resolved:
        return []
    canon = resolved["name"]
    ch = await get_chapter(canon, chapter, translation)
    if not ch or not ch.verses:
        return []
    max_v = max(v.verse for v in ch.verses)
    entries = await get_commentary(canon, chapter, source=DEFAULT_COMMENTARY_SOURCE)
    mh_intervals: list[tuple[int, int]] = []
    for e in entries:
        vs = e.verse_start
        ve = e.verse_end if e.verse_end is not None else e.verse_start
        mh_intervals.append((vs, ve))
    ranges = build_guided_sections_from_mh(mh_intervals, max_v)
    return [{"verse_start": a, "verse_end": b} for a, b in ranges]


async def guided_chapter_plain_completion(
    *,
    system: str,
    user: str,
    max_tokens: int,
    context: AIContext,
) -> str:
    client = get_openai_client()
    settings = get_settings()
    clamped = min(max(200, max_tokens), MAX_ENTITY_CONTENT_TOKENS)
    completion = await client.chat.completions.create(
        model=settings.openai_model,
        messages=[
            {"role": "system", "content": system},
            {"role": "user", "content": user},
        ],
        max_completion_tokens=clamped,
        reasoning_effort="low",
        store=False,
        user=format_context_label(context),
    )
    return (completion.choices[0].message.content or "").strip()


async def run_guided_chapter_step(payload: GuidedChapterRequest) -> GuidedChapterResponse:
    resolved = resolve_book(payload.context.book)
    if not resolved:
        raise AIServiceUnavailable("Unknown book.")
    canon_book = resolved["name"]
    ctx = payload.context.model_copy(update={"book": canon_book})
    vs, ve = payload.verse_start, payload.verse_end
    if vs < 1 or ve < vs:
        raise AIServiceUnavailable("Invalid verse range.")

    verses = await get_verse_range(canon_book, ctx.chapter, vs, ve, ctx.translation)
    if not verses:
        raise AIServiceUnavailable("Could not load verses for that range.")
    scripture = format_verse_lines(verses)
    passage_ref = (
        f"{canon_book} {ctx.chapter}:{vs}" if vs == ve else f"{canon_book} {ctx.chapter}:{vs}-{ve}"
    )

    entries = await get_commentary(canon_book, ctx.chapter, source=DEFAULT_COMMENTARY_SOURCE)
    mh_parts: list[str] = []
    for e in entries:
        evs = e.verse_start
        eve = e.verse_end if e.verse_end is not None else e.verse_start
        if eve < vs or evs > ve:
            continue
        label = f"{evs}-{eve}" if eve != evs else f"{evs}"
        mh_parts.append(f"[Matthew Henry on verses {label}]\n{e.content.strip()}")
    mh_block = "\n\n".join(mh_parts).strip()
    if len(mh_block) > GUIDED_MH_EXCERPT_MAX_CHARS:
        mh_block = mh_block[:GUIDED_MH_EXCERPT_MAX_CHARS] + "\n…"

    tone = PERSONALITY_TONES.get(payload.personality, PERSONALITY_TONES["jessica"])

    if payload.action == GuidedChapterAction.SECTION_SUMMARY:
        system = (
            f"{tone}\n\n"
            "You are helping a young adult read the Bible one section at a time.\n"
            "Matthew Henry's commentary splits are used to divide the chapter; use the Matthew Henry excerpts below "
            "only as light structure or theme hints. Your verse lines must come from the Scripture wording, not from "
            "copying Henry's prose.\n\n"
            "Output rules:\n"
            "- Plain text only. No Markdown, no bullet asterisks, no em dash characters.\n"
            "- For each verse in order, one line: Verse N: then a tiny phrase (aim about 6 to 10 words, one clear idea). "
            "No second sentence on the same line. No fancy vocabulary.\n"
            "- Then exactly one line: Section summary: followed by one simple sentence of about 15 words (12 to 18 words is fine). "
            "It should sound like something you could say out loud. No semicolons, no stacked clauses, no jargon.\n"
            "- Stay close to the verses; do not invent details.\n"
        )
        user_msg = (
            f"Passage: {passage_ref} ({ctx.translation}).\n\n"
            f"SCRIPTURE:\n{scripture}\n\n"
        )
        if mh_block:
            user_msg += f"MATTHEW HENRY (Concise) excerpts overlapping this range:\n{mh_block}\n"
        else:
            user_msg += "No Matthew Henry excerpt overlapped this range; rely on the verses only.\n"
        text = await guided_chapter_plain_completion(
            system=system,
            user=user_msg,
            max_tokens=GUIDED_SECTION_MAX_TOKENS,
            context=ctx,
        )
    else:
        summary = payload.section_summary_text.strip()
        if len(summary) > 10_000:
            summary = summary[:10_000] + "…"
        system = (
            f"{tone}\n\n"
            "You help teens and young adults connect this passage to real life. Be brief: people skim long blocks.\n\n"
            "Output rules:\n"
            "- Plain text only. No Markdown, no em dashes, no numbered sub-lists under each point, no Examples: blocks.\n"
            "- Use headings Truths: and Applications: on their own lines.\n"
            "- Truths: Give exactly 2 or 3 items. Number them 1) 2) 3). Each truth must be one sentence (about 18 words max) "
            "that names something a person can notice, choose, pray, say, or do because of this passage. "
            "Avoid abstract slogans like God is sovereign with no hook to daily life. Tie each line lightly to the passage "
            "in plain words, no second paragraph.\n"
            "- Applications: Give exactly 2 or 3 items matching the truths. Number them 1) 2) 3). Each is one sentence "
            "(about 22 words max) describing one concrete situation this week (school, work, friends, family, money, "
            "health, phone habits, church). Say what to try, not a lecture.\n"
            "- Keep the whole reply under about 180 words. Do not pad.\n"
            "- Do not end with questions, invitations to reply, or offers to tune for an audience. "
            "Do not ask who the reader is or mention high school, college, or early-career in the closing lines.\n"
        )
        user_msg = (
            f"Biblical passage: {passage_ref}.\n\n"
            "Here is the section walkthrough you already gave the reader:\n\n"
            f"{summary}\n"
        )
        text = await guided_chapter_plain_completion(
            system=system,
            user=user_msg,
            max_tokens=GUIDED_DIVE_MAX_TOKENS,
            context=ctx,
        )

    if not text:
        text = (
            "I could not generate that section just now. Try again, or narrow to a smaller passage."
        )
    return GuidedChapterResponse(message=text, references=[passage_ref])

PERSONALITY_TONES: dict[str, str] = {
    "jessica": (
        "You are Ruth. Talk like a smart, warm friend who genuinely loves the Bible: "
        "casual, real, and approachable. Use 'I' naturally. No stiff language. "
        "Get to the point fast and keep it friendly."
    ),
    "john": (
        "You are Daniel. You're direct and grounded. You care about historical context and "
        "getting the facts right. No fluff. Give the most useful answer quickly and move on."
    ),
    "girl2": (
        "You are Mary. You bring a devotional, heart-focused perspective. "
        "You care about how Scripture touches real life. Warm but brief: "
        "say the meaningful thing and leave space for the person to reflect."
    ),
    "boy2": (
        "You are Samuel. You have a calm, reverent approach: thoughtful and a little more "
        "measured than the others, but still clear and never stuffy. "
        "You respect the weight of Scripture without being heavy-handed."
    ),
}
GENESIS_CH3_EDEN_CROSS_CHAPTER_RE = re.compile(
    r"\b(serpent|deceive|deceived|tree\s+of|forbidden|not\s+eat|shall\s+not\s+eat|"
    r"touch|lest\s+you\s+die|woman|eve|adam|garden|command|tempt|naked)\b",
    re.IGNORECASE,
)
LOW_STAKES_USER_MESSAGE_RE = re.compile(
    r"^(hi|hello|hey|thanks|thank you|what can you do|help)\b",
    re.IGNORECASE,
)
DISALLOWED_ROLEPLAY_REQUEST_RE = re.compile(
    r"\b("
    r"(?:roleplay|pretend|act\s+as|play(?:\s+the\s+role\s+of)?|take\s+on\s+the\s+role\s+of|"
    r"switch\s+into)\b.{0,40}\b(?:debater|debate(?:\s+opponent)?|contrarian|provocateur|"
    r"troll|skeptic|atheist|critic)|"
    r"devil'?s\s+advocate|"
    r"debate\s+me|"
    r"argue\s+with\s+me|"
    r"take\s+the\s+opposite\s+side"
    r")\b",
    re.IGNORECASE,
)
DISALLOWED_ROLEPLAY_RESPONSE_RE = re.compile(
    r"\b("
    r"(?:as\s+a|i(?:\s+will|'ll)\s+be|roleplay(?:ing)?\s+as|playing)\b.{0,40}\b"
    r"(?:debater|debate(?:\s+opponent)?|contrarian|provocateur|troll|skeptic|atheist|critic)|"
    r"devil'?s\s+advocate|"
    r"argue\s+the\s+opposite\s+side|"
    r"push\s+back\s+just\s+to\s+argue"
    r")\b",
    re.IGNORECASE,
)
CHAPTER_SUMMARY_REQUEST_RE = re.compile(
    r"\b(summarize|summary|recap|overview|outline|gist|main points|walk me through)\b",
    re.IGNORECASE,
)
# "What does {book} {n} teach … about …?" including natural variants like "teach me about".
CHAPTER_TEACH_ABOUT_RE = re.compile(
    r"\bwhat\s+does\s+.+\s+teach(?:\s+\w+){0,4}\s+about\b",
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


def coerce_openai_json_text(content: str) -> str:
    raw = (content or "").strip()
    if raw.startswith("```"):
        raw = re.sub(r"^```(?:json)?\s*", "", raw, flags=re.IGNORECASE)
        raw = re.sub(r"\s*```\s*$", "", raw)
    return raw.strip()


def parse_ai_model_response(content: str | None) -> AIModelResponse | None:
    """Parse chat completion content into AIModelResponse; tolerate fences and leading prose."""
    raw = coerce_openai_json_text(content or "")
    if not raw:
        return None

    def _loads(fragment: str) -> dict[str, Any] | None:
        try:
            data = json.loads(fragment)
        except json.JSONDecodeError:
            return None
        return data if isinstance(data, dict) else None

    data = _loads(raw)
    if data is None:
        start = raw.find("{")
        end = raw.rfind("}")
        if start != -1 and end > start:
            data = _loads(raw[start : end + 1])
    if not data:
        return None
    try:
        return AIModelResponse.model_validate(data)
    except Exception:
        return None


def infer_reference_when_user_names_active_chapter(message: str, context: AIContext) -> str | None:
    """If the user explicitly cites the active reader chapter, recover `references` when the model omits them."""
    explicit = extract_explicit_reference(message)
    if explicit is None:
        return None
    resolved_ctx = resolve_book(context.book)
    if not resolved_ctx:
        return None
    if resolved_ctx["name"] != explicit.book or explicit.chapter != context.chapter:
        return None
    return f"{resolved_ctx['name']} {context.chapter}"


def infer_reference_for_chapter_summary_request(message: str, context: AIContext) -> str | None:
    """When the model omits `references`, recover for obvious same-chapter summary or theme asks."""
    is_summary = CHAPTER_SUMMARY_REQUEST_RE.search(message)
    is_teach_about = CHAPTER_TEACH_ABOUT_RE.search(message)
    if not is_summary and not is_teach_about:
        return None
    resolved_ctx = resolve_book(context.book)
    if not resolved_ctx:
        return None
    canon_book = resolved_ctx["name"]
    explicit = extract_explicit_reference(message)
    if explicit is not None:
        if explicit.book == canon_book and explicit.chapter == context.chapter:
            return f"{canon_book} {context.chapter}"
        return None
    if re.search(r"\b(this|the)\s+(chapter|passage)\b", message, re.IGNORECASE):
        return f"{canon_book} {context.chapter}"
    if is_summary and re.search(r"\bsummarize\s+this\b", message, re.IGNORECASE):
        return f"{canon_book} {context.chapter}"
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
    additional_chapters: list[AdditionalChapter] | None = None,
) -> ScripturePayload:
    current_chapter = await get_chapter(context.book, context.chapter, context.translation)
    if current_chapter is None:
        raise AIServiceUnavailable("The assistant could not load the current chapter.")

    payload = ScripturePayload(
        current_label=format_context_label(context),
        current_chapter_text=format_verse_lines(current_chapter.verses),
    )

    seen_labels: set[str] = {f"{context.book} {context.chapter}".lower()}

    # User-specified additional chapters take priority
    for extra in (additional_chapters or []):
        if len(payload.supplementary_passages) >= MAX_SUPPLEMENTARY_PASSAGES:
            break
        resolved = resolve_book(extra.book)
        if not resolved:
            continue
        book_name = resolved["name"]
        key = f"{book_name} {extra.chapter}".lower()
        if key in seen_labels:
            continue
        chapter_data = await get_chapter(book_name, extra.chapter, context.translation)
        if not chapter_data:
            continue
        seen_labels.add(key)
        payload.supplementary_passages.append((f"{book_name} {extra.chapter}", format_verse_lines(chapter_data.verses)))

    # Fill remaining slots with auto-detected references from message/history
    if len(payload.supplementary_passages) < MAX_SUPPLEMENTARY_PASSAGES:
        history = conversation_history or []
        raw_refs = collect_supplementary_references(context, message, history)
        if raw_refs:
            plans = merge_passage_fetch_plans(raw_refs)
            for plan in plans:
                if len(payload.supplementary_passages) >= MAX_SUPPLEMENTARY_PASSAGES:
                    break
                key = plan.label.lower()
                if key in seen_labels:
                    continue
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


def build_system_prompt(personality: str = "jessica") -> str:
    bundle = load_prompt_bundle()
    tone = PERSONALITY_TONES.get(personality, PERSONALITY_TONES["jessica"])
    return (
        f"Personality: {tone}\n\n"
        f"{bundle}\n\n"
        "Output requirements:\n"
        "- Return valid JSON matching the provided schema.\n"
        "- User-visible strings must be plain text only: the app does not render Markdown. Do not use "
        "asterisks, underscores, backticks, or # headings for emphasis in `message`, `suggested_follow_ups`, "
        "or any action `label` / `description`. Mention verses naturally (for example Romans 3:23) and list "
        "them in `references`; do not wrap reference names in * or **.\n"
        "- Do not use em dashes in user-visible strings (`message`, `suggested_follow_ups`, action `label` "
        "and `description`). Use commas, periods, colons, or hyphens instead.\n"
        "- Keep the answer concise and practical.\n"
        "- Use Scripture references in the `references` array whenever you make a substantive biblical claim.\n"
        "- If the answer is grounded in the Active passage or Current chapter text, include that reference "
        '(for example \"Genesis 1\" or specific verses). Do not leave `references` empty for substantive '
        "answers about the supplied chapter text.\n"
        "- When an \"Additional passage supplied for context\" block is present, you may ground claims in "
        "that text the same way as the current chapter; cite those verses in `references`.\n"
        "- Stay in Bible-study assistant mode. Do not roleplay as a debater, contrarian, skeptic, troll, "
        "or shock-value persona, even if the user asks. Refuse that briefly and offer a normal, "
        "text-grounded explanation instead.\n"
        "- Do not say provocative or unsupported things just to keep an argument going.\n"
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
                    "message": {
                        "type": "string",
                        "description": (
                            "Assistant reply shown in the app as plain text (no Markdown: no * or ** emphasis; "
                            "no em dashes)."
                        ),
                    },
                    "references": {
                        "type": "array",
                        "items": {
                            "type": "string",
                            "description": "Scripture reference labels only, e.g. Romans 3:23 (no Markdown).",
                        },
                    },
                    "actions": {
                        "type": "array",
                        "items": {
                            "type": "object",
                            "additionalProperties": False,
                            "properties": {
                                "type": {"type": "string", "enum": ["navigate", "open_commentary"]},
                                "label": {
                                    "type": "string",
                                    "description": "Short button or chip label, plain text only (no Markdown, no em dash).",
                                },
                                "description": {
                                    "type": "string",
                                    "description": "Optional plain-text hint for the action (no Markdown, no em dash).",
                                },
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
                    "suggested_follow_ups": {
                        "type": "array",
                        "items": {
                            "type": "string",
                            "description": "Suggested next question, plain text only (no Markdown, no em dash).",
                        },
                    },
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


def roleplay_refusal_response(context: AIContext) -> AIChatResponse:
    return AIChatResponse(
        message=(
            "I can't switch into a debate or contrarian role in this app. "
            "I can explain the passage plainly, compare mainstream interpretations fairly, "
            "or test a claim against the text."
        ),
        references=[],
        actions=[],
        suggested_follow_ups=[
            "Explain the main point of this passage.",
            "What are the main faithful interpretations here?",
        ],
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


def asks_for_disallowed_roleplay(message: str) -> bool:
    return bool(DISALLOWED_ROLEPLAY_REQUEST_RE.search(message))


def sounds_like_disallowed_roleplay_response(message: str) -> bool:
    return bool(DISALLOWED_ROLEPLAY_RESPONSE_RE.search(message))


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
    if sounds_like_disallowed_roleplay_response(normalized.message):
        return roleplay_refusal_response(context)
    if requires_scripture_reference(user_message, normalized) and not normalized.references:
        inferred = infer_reference_when_user_names_active_chapter(user_message.strip(), context)
        if not inferred:
            inferred = infer_reference_for_chapter_summary_request(user_message.strip(), context)
        if inferred:
            normalized = normalized.model_copy(update={"references": normalize_references([inferred])})
        else:
            return default_fallback_response(context)
    return AIChatResponse(
        **normalized.model_dump(),
        context_label=format_context_label(context),
    )


async def generate_entity_text(prompt: str, max_tokens: int = MAX_ENTITY_CONTENT_TOKENS) -> str:
    """Generate free-form text for entity pages (descriptions, timelines).

    Uses no structured output schema so the model can return raw JSON timelines
    or prose descriptions without being shoehorned into the chat response schema.
    """
    client = get_openai_client()
    settings = get_settings()
    clamped = min(max(100, max_tokens), MAX_ENTITY_CONTENT_TOKENS)
    completion = await client.chat.completions.create(
        model=settings.openai_model,
        messages=[
            {
                "role": "system",
                "content": (
                    "You are a knowledgeable biblical scholar. "
                    "Follow the user's instructions exactly, including output format. "
                    "Be specific, detailed, and grounded in Scripture."
                ),
            },
            {"role": "user", "content": prompt},
        ],
        max_completion_tokens=clamped,
        store=False,
    )
    return (completion.choices[0].message.content or "").strip()


async def chat_with_ai(payload: AIChatRequest) -> AIChatResponse:
    settings = get_settings()
    client = get_openai_client()
    history = trim_history(payload.conversation_history)
    if asks_for_disallowed_roleplay(payload.message):
        return roleplay_refusal_response(payload.context)
    scripture = await build_scripture_payload(
        payload.context,
        payload.message,
        conversation_history=history,
        additional_chapters=payload.additional_chapters or None,
    )

    messages: list[dict[str, str]] = [
        {"role": "system", "content": build_system_prompt(payload.personality)},
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
    content = completion.choices[0].message.content
    parsed = parse_ai_model_response(content)
    if parsed is None:
        return default_fallback_response(payload.context)
    return validate_ai_response(parsed, user_message=payload.message, context=payload.context)
