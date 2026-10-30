"""
Live eval for the Claude chat path: run tests/ai_eval/cases.json through chat_with_ai in-process.

Each case is one chat request. Deterministic checks decide pass or fail, and a report is written
for reading after a live run.

Usage:
    python scripts/run_ai_eval.py                       # live run (needs ANTHROPIC_API_KEY or VERTEX_PROJECT_ID)
    python scripts/run_ai_eval.py --dry-run             # offline fake client, no network
    python scripts/run_ai_eval.py --only ID --only ID   # subset of cases
    python scripts/run_ai_eval.py --max-cost-usd 0.25   # stop early once running cost exceeds this

Output goes to <out>/<UTC timestamp>/results.json and report.md. Returns 0 when the run completes
(even with failing cases) and 2 for config errors.
"""

from __future__ import annotations

import argparse
import asyncio
import json
import re
import sqlite3
import statistics
import sys
import time
import unicodedata
from contextlib import ExitStack, closing
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any
from unittest import mock

ROOT = Path(__file__).resolve().parent.parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from app.core.config import Settings, get_settings  # noqa: E402
from app.schemas.ai import AIChatRequest, AIContext, AIHistoryMessage  # noqa: E402
from app.services import ai_service, claude_agent  # noqa: E402
from app.services.ai_service import AIServiceUnavailable, extract_all_references, roleplay_refusal_response  # noqa: E402

CASES_PATH = ROOT / "tests" / "ai_eval" / "cases.json"
DEFAULT_OUT = ROOT / "build" / "ai-eval"
DEFAULT_MAX_COST_USD = 1.00
CLAUDE_PROVIDERS = ("anthropic", "vertex")

# USD per million tokens. Prompts over LONG_CONTEXT_TOKENS use the higher rates.
PRICE_INPUT = 0.10
PRICE_OUTPUT = 0.50
LONG_PRICE_INPUT = 0.50
LONG_PRICE_OUTPUT = 2.50
LONG_CONTEXT_TOKENS = 100_000
CACHE_READ_FACTOR = 0.10
CACHE_WRITE_FACTOR = 1.25

QUOTE_RE = re.compile(r'"([^"\n]+)"|“([^”\n]+)”|「([^」\n]+)」|『([^』\n]+)』')
MIN_QUOTE_WORDS = 5
MIN_QUOTE_CJK = 8
MIN_CJK_SHARE = 0.30
LONG_HISTORY_TURNS = 30
REFUSAL_TEXT = claude_agent.REFUSAL_MESSAGE

DRY_RUN_JSON = json.dumps({"message": "Dry run.", "references": [], "suggested_follow_ups": []})


# ── Pure checks (imported by tests/test_ai_eval_runner.py) ───────────────────

def _is_cjk(ch: str) -> bool:
    return "㐀" <= ch <= "䶿" or "一" <= ch <= "鿿"


def is_mostly_cjk(text: str) -> bool:
    chars = [ch for ch in text if not ch.isspace()]
    if not chars:
        return False
    return sum(1 for ch in chars if _is_cjk(ch)) / len(chars) >= MIN_CJK_SHARE


def _same_passage(expected, got) -> bool:
    if expected.book != got.book or expected.chapter != got.chapter:
        return False
    if expected.verse_start is None:
        return True
    if got.verse_start is None:
        return False
    expected_end = expected.verse_end or expected.verse_start
    got_end = got.verse_end or got.verse_start
    return expected.verse_start <= got_end and got.verse_start <= expected_end


_PSALM_ALIAS_RE = re.compile(r"\bPsalm\b(?!s)", re.IGNORECASE)


def _parse_refs(labels: list[str]) -> list:
    # The parser only knows the plural "Psalms"; the singular is a common model output, so alias it here.
    text = "; ".join(_PSALM_ALIAS_RE.sub("Psalms", label) for label in labels)
    return extract_all_references(text)


def references_match(expected: list[str], got: list[str]) -> bool:
    wanted = _parse_refs(expected)
    found = _parse_refs(got)
    return any(_same_passage(e, g) for e in wanted for g in found)


def _normalise(text: str) -> str:
    """Casefold, drop punctuation (Latin, CJK and curly quotes alike), collapse whitespace."""
    kept = "".join("" if unicodedata.category(ch).startswith("P") else ch for ch in text.casefold())
    return " ".join(kept.split())


_TEXT_CACHE: dict[str, str] = {}


def _load_verse_texts(translation: str) -> list[str]:
    path = Path(get_settings().content_db_path)
    if not path.is_absolute():
        path = ROOT / path
    with closing(sqlite3.connect(f"file:{path.as_posix()}?mode=ro&immutable=1", uri=True)) as con:
        rows = con.execute(
            "SELECT text FROM verses WHERE translation = ? ORDER BY book_number, chapter, verse",
            (translation,),
        ).fetchall()
    return [row[0] for row in rows]


def _translation_text(translation: str) -> str:
    """Normalised concatenation of every verse in a translation; loaded from the content DB once."""
    code = translation.strip().upper()
    if code not in _TEXT_CACHE:
        _TEXT_CACHE[code] = _normalise(" ".join(_load_verse_texts(code)))
    return _TEXT_CACHE[code]


def quote_violations(message: str, translation: str) -> list[str]:
    """Quoted spans of 5+ words (or 8+ CJK characters) that appear in neither the translation nor WEB."""
    scripture = _translation_text(translation)
    web = _translation_text("WEB")
    violations: list[str] = []
    for match in QUOTE_RE.finditer(message):
        span = next(group for group in match.groups() if group is not None)
        normal = _normalise(span)
        long_enough = len(normal.split()) >= MIN_QUOTE_WORDS or sum(_is_cjk(ch) for ch in span) >= MIN_QUOTE_CJK
        if not normal or not long_enough:
            continue
        if normal in scripture or normal in web:
            continue
        violations.append(span)
    return violations


# ── Cost and recording ───────────────────────────────────────────────────────

@dataclass
class CallRecord:
    stop_reason: str | None
    tools: list[str]
    input_tokens: int
    output_tokens: int
    cache_read_tokens: int
    cache_write_tokens: int

    @property
    def prompt_tokens(self) -> int:
        return self.input_tokens + self.cache_read_tokens + self.cache_write_tokens

    @property
    def long_context(self) -> bool:
        return self.prompt_tokens > LONG_CONTEXT_TOKENS

    @property
    def cost_usd(self) -> float:
        in_rate, out_rate = (LONG_PRICE_INPUT, LONG_PRICE_OUTPUT) if self.long_context else (PRICE_INPUT, PRICE_OUTPUT)
        per_token = in_rate / 1_000_000
        return (
            self.input_tokens * per_token
            + self.cache_read_tokens * per_token * CACHE_READ_FACTOR
            + self.cache_write_tokens * per_token * CACHE_WRITE_FACTOR
            + self.output_tokens * out_rate / 1_000_000
        )


def _field(obj: Any, name: str) -> Any:
    return obj.get(name) if isinstance(obj, dict) else getattr(obj, name, None)


def _count(usage: Any, name: str) -> int:
    return int(_field(usage, name) or 0)


def _record(response: Any) -> CallRecord:
    usage = _field(response, "usage")
    tools = [
        _field(block, "name") or ""
        for block in (_field(response, "content") or [])
        if _field(block, "type") == "tool_use"
    ]
    return CallRecord(
        stop_reason=_field(response, "stop_reason"),
        tools=tools,
        input_tokens=_count(usage, "input_tokens"),
        output_tokens=_count(usage, "output_tokens"),
        cache_read_tokens=_count(usage, "cache_read_input_tokens"),
        cache_write_tokens=_count(usage, "cache_creation_input_tokens"),
    )


class _RecordingMessages:
    def __init__(self, inner: Any, calls: list[CallRecord]) -> None:
        self._inner = inner
        self._calls = calls

    async def create(self, **kwargs: Any) -> Any:
        response = await self._inner.messages.create(**kwargs)
        self._calls.append(_record(response))
        return response


class RecordingClient:
    """Proxy around the Claude client: forwards every messages.create and records what came back."""

    def __init__(self, inner: Any) -> None:
        self._inner = inner
        self.calls: list[CallRecord] = []
        self.messages = _RecordingMessages(inner, self.calls)


# ── Offline fake for --dry-run ───────────────────────────────────────────────

@dataclass
class _FakeBlock:
    type: str
    text: str


@dataclass
class _FakeUsage:
    input_tokens: int
    output_tokens: int
    cache_read_input_tokens: int
    cache_creation_input_tokens: int


@dataclass
class _FakeResponse:
    content: list[_FakeBlock]
    stop_reason: str
    usage: _FakeUsage


class _FakeMessages:
    def __init__(self, owner: "FakeClaude") -> None:
        self._owner = owner

    async def create(self, **kwargs: Any) -> _FakeResponse:
        # First call of a case writes the cached system prompt; later calls read it back.
        cached = self._owner.cache_warm
        self._owner.cache_warm = True
        prompt_chars = sum(len(str(m.get("content", ""))) for m in kwargs.get("messages", []))
        return _FakeResponse(
            content=[_FakeBlock(type="text", text=DRY_RUN_JSON)],
            stop_reason="end_turn",
            usage=_FakeUsage(
                input_tokens=150 + prompt_chars // 4,
                output_tokens=40,
                cache_read_input_tokens=0 if not cached else 2400,
                cache_creation_input_tokens=2400 if not cached else 0,
            ),
        )


class FakeClaude:
    """Stands in for the Claude client in --dry-run. Never touches the network."""

    def __init__(self) -> None:
        self.cache_warm = False
        self.messages = _FakeMessages(self)

    def reset(self) -> None:
        self.cache_warm = False


# ── Cases ────────────────────────────────────────────────────────────────────

def load_cases(path: Path = CASES_PATH) -> list[dict[str, Any]]:
    return json.loads(path.read_text(encoding="utf-8"))["cases"]


def _history(spec: Any) -> list[AIHistoryMessage]:
    if spec is None:
        return []
    if spec == "LONG":
        turns = []
        for index in range(LONG_HISTORY_TURNS):
            verse = index + 1
            if index % 2 == 0:
                turns.append(AIHistoryMessage(role="user", content=f"What is the point of Romans 8:{verse}?"))
            else:
                turns.append(
                    AIHistoryMessage(
                        role="assistant",
                        content=f"Romans 8:{verse} is about life in the Spirit and God's care for those in Christ.",
                    )
                )
        return turns
    return [AIHistoryMessage(role=role, content=text) for role, text in spec]


def _enum_value(value: Any) -> Any:
    return getattr(value, "value", value)


def _check_expectations(
    expect: dict[str, Any],
    *,
    message: str,
    references: list[str],
    actions: list[Any],
    rounds: int,
    tools: list[str],
    context: AIContext,
) -> dict[str, bool]:
    checks: dict[str, bool] = {}
    lowered = message.casefold()
    if "references_any" in expect:
        found = [ref.label for ref in _parse_refs([message])]
        checks["references_any"] = references_match(expect["references_any"], [*references, *found])
    if "tools_any" in expect:
        checks["tools_any"] = any(name in expect["tools_any"] for name in tools)
    if "actions_any" in expect:
        types = {_enum_value(action.type) for action in actions}
        checks["actions_any"] = any(kind in types for kind in expect["actions_any"])
    if "max_rounds" in expect:
        checks["max_rounds"] = rounds <= expect["max_rounds"]
    if expect.get("no_refusal"):
        checks["no_refusal"] = message != REFUSAL_TEXT
    if "must_contain_any" in expect:
        checks["must_contain_any"] = any(term.casefold() in lowered for term in expect["must_contain_any"])
    if "must_not_contain" in expect:
        checks["must_not_contain"] = not any(term.casefold() in lowered for term in expect["must_not_contain"])
    if expect.get("language") == "zh":
        checks["language"] = is_mostly_cjk(message)
    if expect.get("zero_model_calls_or_refusal"):
        refusals = (REFUSAL_TEXT, roleplay_refusal_response(context).message)
        checks["zero_model_calls_or_refusal"] = rounds == 0 or message in refusals
    return checks


def _cost_of(calls: list[CallRecord]) -> float:
    return sum(call.cost_usd for call in calls)


async def run_case(case: dict[str, Any], recorder: RecordingClient) -> dict[str, Any]:
    context = AIContext(**case["context"])
    request = AIChatRequest(
        message=case["message"],
        context=context,
        conversation_history=_history(case.get("history")),
    )
    recorder.calls.clear()
    started = time.perf_counter()
    error: str | None = None
    response = None
    try:
        response = await ai_service.chat_with_ai(request)
    except Exception as exc:  # one failing call must not stop the run
        error = f"{type(exc).__name__}: {exc}"
    latency_ms = round((time.perf_counter() - started) * 1000)

    calls = list(recorder.calls)
    tools = [name for call in calls for name in call.tools]
    rounds = len(calls)
    message = response.message if response else ""
    references = list(response.references) if response else []
    actions = list(response.actions) if response else []

    if response is None:
        checks = {"call_succeeded": False}
        violations: list[str] = []
    else:
        violations = quote_violations(message, context.translation)
        checks = _check_expectations(
            case.get("expect", {}),
            message=message,
            references=references,
            actions=actions,
            rounds=rounds,
            tools=tools,
            context=context,
        )
        checks["verse_fidelity"] = not violations

    return {
        "id": case["id"],
        "passed": all(checks.values()) and error is None,
        "checks": checks,
        "rounds": rounds,
        "tools": tools,
        "input_tokens": sum(call.input_tokens for call in calls),
        "output_tokens": sum(call.output_tokens for call in calls),
        "cache_read_tokens": sum(call.cache_read_tokens for call in calls),
        "cache_write_tokens": sum(call.cache_write_tokens for call in calls),
        "cost_usd": round(_cost_of(calls), 6),
        "long_context_calls": sum(1 for call in calls if call.long_context),
        "latency_ms": latency_ms,
        "message": message,
        "references": references,
        "actions": [action.model_dump(mode="json") for action in actions],
        "judge": case.get("judge", ""),
        "quote_violations": violations,
        "error": error,
        "skipped": False,
    }


def _skipped_case(case: dict[str, Any]) -> dict[str, Any]:
    return {
        "id": case["id"],
        "passed": False,
        "checks": {},
        "rounds": 0,
        "tools": [],
        "input_tokens": 0,
        "output_tokens": 0,
        "cache_read_tokens": 0,
        "cache_write_tokens": 0,
        "cost_usd": 0.0,
        "long_context_calls": 0,
        "latency_ms": 0,
        "message": "",
        "references": [],
        "actions": [],
        "judge": case.get("judge", ""),
        "quote_violations": [],
        "error": None,
        "skipped": True,
    }


async def run_all(cases: list[dict[str, Any]], recorder: RecordingClient, max_cost_usd: float) -> list[dict[str, Any]]:
    results: list[dict[str, Any]] = []
    spent = 0.0
    for index, case in enumerate(cases):
        if spent > max_cost_usd:
            remaining = cases[index:]
            print(
                f"Running cost ${spent:.4f} exceeded --max-cost-usd {max_cost_usd:.2f}; "
                f"skipping {len(remaining)} remaining case(s).",
                file=sys.stderr,
            )
            results.extend(_skipped_case(item) for item in remaining)
            break
        result = await run_case(case, recorder)
        spent += result["cost_usd"]
        results.append(result)
        status = "PASS" if result["passed"] else "FAIL"
        print(f"{status} {case['id']} ({result['latency_ms']} ms, {result['rounds']} call(s))")
    return results


def summarise(cases: list[dict[str, Any]]) -> dict[str, Any]:
    total = len(cases)
    passed = sum(1 for case in cases if case["passed"])
    timed = [case["latency_ms"] for case in cases if not case["skipped"]]
    return {
        "pass_rate": round(passed / total, 4) if total else 0.0,
        "passed": passed,
        "total": total,
        "skipped": sum(1 for case in cases if case["skipped"]),
        "total_cost_usd": round(sum(case["cost_usd"] for case in cases), 6),
        "p50_latency_ms": round(statistics.median(timed)) if timed else None,
        "fidelity_violations": sum(len(case["quote_violations"]) for case in cases),
    }


# ── Report ───────────────────────────────────────────────────────────────────

def _cell(text: str) -> str:
    return text.replace("\r", " ").replace("\n", " ").replace("|", "\\|")


def _row(case: dict[str, Any]) -> str:
    if case["skipped"]:
        status = "SKIP"
        failed = "not run (cost cap)"
    else:
        status = "PASS" if case["passed"] else "FAIL"
        failed_names = [name for name, ok in case["checks"].items() if not ok]
        failed = ", ".join(failed_names) if failed_names else "-"
        if case["error"]:
            failed = f"{failed}; error: {case['error']}" if failed != "-" else f"error: {case['error']}"
    tools = ", ".join(dict.fromkeys(case["tools"])) or "-"
    cost = f"${case['cost_usd']:.5f}"
    if case["long_context_calls"]:
        cost += " (>100K prompt)"
    message = case["message"][:160]
    return (
        f"| {case['id']} | {status} | {_cell(failed)} | {case['rounds']} | {_cell(tools)} | {cost} "
        f"| {case['latency_ms']} ms | {_cell(message)} | {_cell(case['judge'])} |"
    )


def build_report(run: dict[str, Any]) -> str:
    summary = run["summary"]
    p50 = f"{summary['p50_latency_ms']} ms" if summary["p50_latency_ms"] is not None else "n/a"
    lines = [
        "# AI eval report",
        "",
    ]
    if run["dry_run"]:
        lines += [
            "> **Dry run.** Offline fake client, no network calls. Checks are recorded but not enforced, "
            "and costs are not real.",
            "",
        ]
    lines += [
        "## Summary",
        "",
        f"- Provider: `{run['provider']}`, model `{run['model']}`",
        f"- Started: {run['started_at']}",
        f"- Pass rate: {summary['passed']}/{summary['total']} ({summary['pass_rate'] * 100:.0f}%)",
        f"- Cost: ${summary['total_cost_usd']:.4f} (cap ${run['max_cost_usd']:.2f})",
        f"- Median latency: {p50}",
        f"- Verse fidelity violations (quoted spans not found in Scripture): {summary['fidelity_violations']}",
        f"- Skipped by cost cap: {summary['skipped']}",
        "",
        "## Cases",
        "",
        "| id | pass | failed checks | rounds | tools | cost | latency | message (first 160 chars) | judge |",
        "|---|---|---|---|---|---|---|---|---|",
    ]
    lines += [_row(case) for case in run["cases"]]
    return "\n".join(lines) + "\n"


# ── CLI ──────────────────────────────────────────────────────────────────────

def _config_problem(settings: Settings) -> str | None:
    provider = settings.ai_provider
    if provider == "anthropic" and not settings.anthropic_api_key:
        return "AI_PROVIDER=anthropic but ANTHROPIC_API_KEY is empty. Add the key to .env, or use --dry-run."
    if provider == "vertex" and not settings.vertex_project_id:
        return "AI_PROVIDER=vertex but VERTEX_PROJECT_ID is empty. Set it in .env, or use --dry-run."
    if provider not in CLAUDE_PROVIDERS:
        return (
            f"AI_PROVIDER={provider!r} is not a Claude provider. The eval runs the Claude chat path only: "
            "set AI_PROVIDER=anthropic or vertex, or use --dry-run."
        )
    return None


def _parse_args(argv: list[str] | None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run the live Claude chat eval (tests/ai_eval/cases.json).")
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT, help="output directory (default: build/ai-eval)")
    parser.add_argument("--only", action="append", default=[], metavar="ID", help="run only this case (repeatable)")
    parser.add_argument("--dry-run", action="store_true", help="offline fake client, no network calls")
    parser.add_argument(
        "--max-cost-usd",
        type=float,
        default=DEFAULT_MAX_COST_USD,
        help="stop early and skip the remaining cases once running cost exceeds this (default: 1.00)",
    )
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(argv)

    cases = load_cases()
    if args.only:
        known = {case["id"] for case in cases}
        unknown = [case_id for case_id in args.only if case_id not in known]
        if unknown:
            print(f"Unknown case id(s): {', '.join(unknown)}", file=sys.stderr)
            return 2
        cases = [case for case in cases if case["id"] in set(args.only)]

    with ExitStack() as stack:
        if args.dry_run:
            settings = get_settings().model_copy(update={"ai_provider": "anthropic"})
            fake = FakeClaude()
            recorder = RecordingClient(fake)
            stack.enter_context(mock.patch.object(ai_service, "get_settings", lambda: settings))
            stack.enter_context(mock.patch.object(claude_agent, "get_settings", lambda: settings))
            stack.enter_context(mock.patch.object(claude_agent, "get_claude_client", lambda: recorder))
            print("Dry run: offline fake client, no network calls.")
        else:
            settings = get_settings()
            problem = _config_problem(settings)
            if problem:
                print(problem, file=sys.stderr)
                return 2
            try:
                real = claude_agent.get_claude_client()
            except (AIServiceUnavailable, Exception) as exc:
                print(f"Could not create the Claude client: {exc}", file=sys.stderr)
                return 2
            recorder = RecordingClient(real)
            stack.enter_context(mock.patch.object(claude_agent, "get_claude_client", lambda: recorder))

        started = datetime.now(timezone.utc)
        results = asyncio.run(run_all(cases, recorder, args.max_cost_usd))

    out_dir = args.out / started.strftime("%Y%m%dT%H%M%SZ")
    out_dir.mkdir(parents=True, exist_ok=True)
    run = {
        "provider": settings.ai_provider,
        "model": settings.claude_model,
        "started_at": started.isoformat(timespec="seconds"),
        "dry_run": args.dry_run,
        "max_cost_usd": args.max_cost_usd,
        "cases": results,
        "summary": summarise(results),
    }
    results_path = out_dir / "results.json"
    report_path = out_dir / "report.md"
    results_path.write_text(json.dumps(run, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    report_path.write_text(build_report(run), encoding="utf-8")
    print(f"Results: {results_path}")
    print(f"Report: {report_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
