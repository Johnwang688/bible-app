import random
from datetime import UTC, datetime

from fastapi import HTTPException

from app.core.book_catalog import BOOK_BY_NUMBER
from app.core.config import get_settings
from app.core.supabase_client import get_supabase_admin
from app.schemas.quiz import (
    ChapterProgressOut,
    ChapterQuizOut,
    DailyRewardClaimOut,
    DailyRewardsStatusOut,
    MasteryBookOut,
    MasteryChapterOut,
    MasteryOverviewOut,
    MasteryScopeBonusOut,
    MasterySectionOut,
    MasteryTestamentOut,
    QuizHintOut,
    QuizQuestion,
    QuizSubmitIn,
    QuizSubmitOut,
    WalletOut,
)

# ── Constants ─────────────────────────────────────────────────────────────────

STAGE_MAP: dict[int, int] = {0: 0, 1: 50, 2: 75, 3: 87, 4: 99, 5: 100}

# Minimum correct answers required to pass each stage
PASS_THRESHOLD: dict[int, int] = {1: 4, 2: 4, 3: 4, 4: 4, 5: 5}

STAGE_LABELS: dict[int, str] = {
    1: "Stage 1",
    2: "Stage 2",
    3: "Stage 3",
    4: "Stage 4",
    5: "Stage 5",
}

CURRENCY_FAIL = 2
CURRENCY_PASS = 10
CURRENCY_PERFECT_BONUS = 5
# Coins when advancing to a new mastery stage (STAGE_MAP tiers: 50%, 75%, 87%, 99%, 100%).
CURRENCY_MASTERY_MILESTONE: dict[int, int] = {
    1: 3,
    2: 5,
    3: 5,
    4: 5,
    5: 20,
}

# PostgREST returns at most ~1000 rows per request unless paged.
_POSTGREST_PAGE_SIZE = 1000

# One-time bonuses when every quizzable chapter in a scope is fully mastered (stage 5).
COINS_BOOK_COMPLETE = 500
COINS_SECTION_COMPLETE = 3000

# Testament: one-time bonus when average mastery across all quizzable chapters in OT or NT reaches 100%.
COINS_TESTAMENT_PCT_100 = 25000
TESTAMENT_PCT_MILESTONES: tuple[tuple[int, int], ...] = ((100, COINS_TESTAMENT_PCT_100),)

# Home daily freebies (claimed once per UTC day; keys in user_mastery_scope_rewards).
COINS_DAILY_VERSE = 10
COINS_DAILY_TASKS_ALL = 20

# Bible sections for mastery drill-down (Protestant 66-book canon, matches book_catalog)
_OT_SECTIONS: tuple[tuple[str, str, tuple[int, ...]], ...] = (
    ("law", "Law (Pentateuch)", (1, 2, 3, 4, 5)),
    ("history", "History", tuple(range(6, 18))),
    ("poetry", "Poetry & Wisdom", (18, 19, 20, 21, 22)),
    ("major_prophets", "Major Prophets", (23, 24, 25, 26, 27)),
    ("minor_prophets", "Minor Prophets", tuple(range(28, 40))),
)
_NT_SECTIONS: tuple[tuple[str, str, tuple[int, ...]], ...] = (
    ("gospels", "Gospels", (40, 41, 42, 43)),
    ("acts", "Acts", (44,)),
    ("paul", "Pauline Letters", tuple(range(45, 58))),
    ("general", "General Letters", tuple(range(58, 66))),
    ("revelation", "Revelation", (66,)),
)


# ── Helpers ───────────────────────────────────────────────────────────────────

def _dev_wallet_email_matches(email: str | None) -> bool:
    if not email:
        return False
    settings = get_settings()
    if not settings.is_dev:
        return False
    dev = (settings.dev_account_email or "").strip().lower()
    if not dev:
        return False
    return email.strip().lower() == dev


def reset_dev_wallet_on_auth(user_id: str, email: str | None) -> None:
    """In development, set the dev account wallet to DEV_WALLET_BALANCE after sign-in or sign-up."""
    if not _dev_wallet_email_matches(email):
        return
    settings = get_settings()
    balance = max(0, int(settings.dev_wallet_balance))
    db = get_supabase_admin()
    now_iso = datetime.now(UTC).isoformat()
    db.table("user_wallet").upsert(
        {"user_id": user_id, "balance": balance, "updated_at": now_iso},
        on_conflict="user_id",
    ).execute()


def _get_or_create_progress(db, user_id: str, book_number: int, chapter: int) -> dict:
    result = (
        db.table("user_chapter_progress")
        .select("*")
        .eq("user_id", user_id)
        .eq("book_number", book_number)
        .eq("chapter", chapter)
        .limit(1)
        .execute()
    )
    row = (result.data or [None])[0]
    if row:
        return row

    # Create default row
    default = {
        "user_id": user_id,
        "book_number": book_number,
        "chapter": chapter,
        "mastery_stage": 0,
        "mastery_percent": 0,
        "total_attempts": 0,
        "total_passes": 0,
        "highest_score": 0,
        "is_completed": False,
        "is_mastered": False,
        "last_attempt_at": None,
    }
    try:
        db.table("user_chapter_progress").insert(default).execute()
    except Exception:
        pass  # Row may have been created by a concurrent request
    return default


def _get_or_create_wallet(db, user_id: str) -> dict:
    result = (
        db.table("user_wallet")
        .select("*")
        .eq("user_id", user_id)
        .limit(1)
        .execute()
    )
    row = (result.data or [None])[0]
    if row:
        return row

    default = {"user_id": user_id, "balance": 0}
    try:
        db.table("user_wallet").insert(default).execute()
    except Exception:
        pass
    return default


def _count_questions_for_stage(
    db, book_number: int, chapter: int, difficulty_stage: int
) -> int:
    result = (
        db.table("quiz_question_bank")
        .select("id", count="exact")
        .eq("book_number", book_number)
        .eq("chapter", chapter)
        .eq("difficulty_stage", difficulty_stage)
        .limit(1)
        .execute()
    )
    return int(result.count or 0)


# ── Public functions ──────────────────────────────────────────────────────────

def get_chapter_quiz(user_id: str, book_number: int, chapter: int) -> ChapterQuizOut:
    db = get_supabase_admin()

    progress = _get_or_create_progress(db, user_id, book_number, chapter)
    current_stage = progress["mastery_stage"]

    # Stage to attempt: one above current, capped at 5
    stage_to_attempt = min(current_stage + 1, 5)

    # Fetch all questions for this chapter + stage
    result = (
        db.table("quiz_question_bank")
        .select("id, prompt, choices_json, source_verse_start, source_verse_end")
        .eq("book_number", book_number)
        .eq("chapter", chapter)
        .eq("difficulty_stage", stage_to_attempt)
        .execute()
    )
    all_questions = result.data or []

    if len(all_questions) < 5:
        raise HTTPException(
            status_code=404,
            detail=f"Not enough questions for this chapter (stage {stage_to_attempt}). "
                   "Quiz content hasn't been added yet.",
        )

    # Randomly select 5
    selected = random.sample(all_questions, 5)
    questions = [QuizQuestion(**q) for q in selected]

    return ChapterQuizOut(
        book_number=book_number,
        chapter=chapter,
        stage=stage_to_attempt,
        stage_label=STAGE_LABELS[stage_to_attempt],
        questions=questions,
    )


def submit_quiz(user_id: str, payload: QuizSubmitIn) -> QuizSubmitOut:
    db = get_supabase_admin()

    book_number = payload.book_number
    chapter = payload.chapter

    # Load progress
    progress = _get_or_create_progress(db, user_id, book_number, chapter)
    current_stage = progress["mastery_stage"]
    mastery_before = progress["mastery_percent"]

    stage_attempted = min(current_stage + 1, 5)

    # Fetch correct answers for the submitted question IDs
    question_ids = [a.question_id for a in payload.answers]
    result = (
        db.table("quiz_question_bank")
        .select("id, correct_answer, explanation")
        .in_("id", question_ids)
        .execute()
    )
    question_rows = {row["id"]: row for row in (result.data or [])}

    # Validate all IDs exist
    for qid in question_ids:
        if qid not in question_rows:
            raise HTTPException(status_code=400, detail=f"Unknown question id: {qid}")

    # Grade
    score = 0
    for ans in payload.answers:
        row = question_rows[ans.question_id]
        if ans.answer.strip() == row["correct_answer"].strip():
            score += 1

    total_questions = 5
    threshold = PASS_THRESHOLD[stage_attempted]
    raw_passed = score >= threshold
    shield_saves = bool(payload.grace_shield) and not raw_passed
    passed = raw_passed or shield_saves

    # Calculate mastery changes
    new_stage = current_stage
    mastery_after = mastery_before
    if passed and current_stage < 5:
        new_stage = stage_attempted
        mastery_after = STAGE_MAP[new_stage]

    # Currency: one milestone payout per successful stage advance (stages 1–5).
    base_currency = CURRENCY_PASS if passed else CURRENCY_FAIL
    perfect_bonus = CURRENCY_PERFECT_BONUS if score == total_questions else 0
    milestone_bonus = (
        CURRENCY_MASTERY_MILESTONE[new_stage]
        if passed and new_stage > current_stage
        else 0
    )

    scope_bonus_total = 0
    scope_bonuses: list[MasteryScopeBonusOut] = []
    newly_mastered = passed and new_stage == 5 and current_stage < 5
    if mastery_after != mastery_before:
        quizzable = _quizzable_chapters_stage1(db)
        prog_map = _user_progress_map(db, user_id)
        tb, tbon = _collect_testament_average_milestones(
            db, user_id, book_number, chapter, quizzable, prog_map, mastery_after
        )
        scope_bonus_total += tb
        scope_bonuses.extend(tbon)
        if newly_mastered:
            sb, sbon = _collect_scope_completion_bonuses(
                db, user_id, book_number, chapter, quizzable, prog_map
            )
            scope_bonus_total += sb
            scope_bonuses.extend(sbon)

    mult = (
        2
        if payload.coin_multiplier in ("coin_rush", "blessing")
        else 1
    )
    currency_awarded_scaled = int((base_currency + milestone_bonus) * mult)
    perfect_bonus_scaled = int(perfect_bonus * mult)
    milestone_bonus_scaled = int(milestone_bonus * mult)
    scope_bonuses_scaled = [
        MasteryScopeBonusOut(
            kind=b.kind, label=b.label, coins=int(b.coins * mult)
        )
        for b in scope_bonuses
    ]
    scope_bonus_total_scaled = sum(b.coins for b in scope_bonuses_scaled)
    total_currency = (
        currency_awarded_scaled + perfect_bonus_scaled + scope_bonus_total_scaled
    )

    # Update user_chapter_progress
    new_total_attempts = progress["total_attempts"] + 1
    new_total_passes = progress["total_passes"] + (1 if passed else 0)
    new_highest_score = max(progress["highest_score"], score)

    now_iso = datetime.now(UTC).isoformat()

    db.table("user_chapter_progress").upsert(
        {
            "user_id": user_id,
            "book_number": book_number,
            "chapter": chapter,
            "mastery_stage": new_stage,
            "mastery_percent": mastery_after,
            "total_attempts": new_total_attempts,
            "total_passes": new_total_passes,
            "highest_score": new_highest_score,
            "is_completed": new_stage >= 1,
            "is_mastered": new_stage == 5,
            "last_attempt_at": now_iso,
        },
        on_conflict="user_id,book_number,chapter",
    ).execute()

    # Update wallet
    wallet = _get_or_create_wallet(db, user_id)
    new_balance = wallet["balance"] + total_currency
    db.table("user_wallet").upsert(
        {"user_id": user_id, "balance": new_balance, "updated_at": now_iso},
        on_conflict="user_id",
    ).execute()

    # Record attempt
    db.table("quiz_attempts").insert(
        {
            "user_id": user_id,
            "book_number": book_number,
            "chapter": chapter,
            "stage_attempted": stage_attempted,
            "score": score,
            "total_questions": total_questions,
            "passed": passed,
            "mastery_before": mastery_before,
            "mastery_after": mastery_after,
            "currency_awarded": currency_awarded_scaled,
            "perfect_score_bonus": perfect_bonus_scaled,
        }
    ).execute()

    correct_answers = {row_id: row["correct_answer"] for row_id, row in question_rows.items()}
    explanations = {row_id: row.get("explanation") for row_id, row in question_rows.items()}

    return QuizSubmitOut(
        score=score,
        total_questions=total_questions,
        passed=passed,
        stage_attempted=stage_attempted,
        mastery_before=mastery_before,
        mastery_after=mastery_after,
        currency_awarded=currency_awarded_scaled,
        perfect_score_bonus=perfect_bonus_scaled,
        mastery_completion_bonus=milestone_bonus_scaled,
        scope_completion_bonus_total=scope_bonus_total_scaled,
        scope_completion_bonuses=scope_bonuses_scaled,
        is_mastered=new_stage == 5,
        correct_answers=correct_answers,
        explanations=explanations,
        grace_shield_applied=shield_saves,
        coin_multiplier_applied=payload.coin_multiplier,
    )


def reveal_hint(question_id: int) -> QuizHintOut:
    """
    Return the correct answer for a quiz question (for Hint Token UI).
    """
    db = get_supabase_admin()
    result = (
        db.table("quiz_question_bank")
        .select("id, correct_answer")
        .eq("id", question_id)
        .limit(1)
        .execute()
    )
    row = (result.data or [None])[0]
    if not row:
        raise HTTPException(status_code=404, detail="Unknown question id.")
    return QuizHintOut(correct_answer=str(row["correct_answer"]))


def get_chapter_progress(
    user_id: str, book_number: int, chapter: int
) -> ChapterProgressOut:
    db = get_supabase_admin()
    progress = _get_or_create_progress(db, user_id, book_number, chapter)
    next_stage = min(progress["mastery_stage"] + 1, 5)
    q_count = _count_questions_for_stage(db, book_number, chapter, next_stage)
    return ChapterProgressOut(
        book_number=book_number,
        chapter=chapter,
        mastery_stage=progress["mastery_stage"],
        mastery_percent=progress["mastery_percent"],
        next_stage=next_stage,
        has_quiz=q_count >= 5,
        total_attempts=progress["total_attempts"],
        total_passes=progress["total_passes"],
        highest_score=progress["highest_score"],
        is_completed=progress["is_completed"],
        is_mastered=progress["is_mastered"],
        last_attempt_at=progress["last_attempt_at"],
    )


def get_wallet(user_id: str, email: str | None = None) -> WalletOut:
    db = get_supabase_admin()
    wallet = _get_or_create_wallet(db, user_id)
    balance = int(wallet["balance"])
    settings = get_settings()
    if _dev_wallet_email_matches(email):
        floor = max(0, int(settings.dev_wallet_balance))
        if balance < floor:
            now_iso = datetime.now(UTC).isoformat()
            db.table("user_wallet").upsert(
                {"user_id": user_id, "balance": floor, "updated_at": now_iso},
                on_conflict="user_id",
            ).execute()
            balance = floor
    return WalletOut(user_id=user_id, balance=balance)


def _try_claim_daily_coins(db, user_id: str, milestone_key: str, coins: int) -> bool:
    """Record a daily milestone and credit the wallet. Returns True if this call awarded coins."""
    if not _claim_milestone_reward(db, user_id, milestone_key, coins):
        return False
    wallet = _get_or_create_wallet(db, user_id)
    new_balance = int(wallet["balance"]) + coins
    now_iso = datetime.now(UTC).isoformat()
    db.table("user_wallet").upsert(
        {"user_id": user_id, "balance": new_balance, "updated_at": now_iso},
        on_conflict="user_id",
    ).execute()
    return True


def get_daily_rewards_status(user_id: str) -> DailyRewardsStatusOut:
    today = datetime.now(UTC).date().isoformat()
    db = get_supabase_admin()
    vkey = f"daily:verse:{today}"
    tkey = f"daily:tasks:{today}"
    result = (
        db.table("user_mastery_scope_rewards")
        .select("milestone_key")
        .eq("user_id", user_id)
        .in_("milestone_key", [vkey, tkey])
        .execute()
    )
    keys = {row["milestone_key"] for row in (result.data or [])}
    return DailyRewardsStatusOut(
        date=today,
        verse_claimed=vkey in keys,
        tasks_claimed=tkey in keys,
    )


def claim_daily_verse_reward(user_id: str, email: str | None) -> DailyRewardClaimOut:
    db = get_supabase_admin()
    today = datetime.now(UTC).date().isoformat()
    key = f"daily:verse:{today}"
    awarded = _try_claim_daily_coins(db, user_id, key, COINS_DAILY_VERSE)
    w = get_wallet(user_id, email)
    return DailyRewardClaimOut(
        date=today,
        coins_awarded=COINS_DAILY_VERSE if awarded else 0,
        already_claimed=not awarded,
        balance=w.balance,
    )


def claim_daily_tasks_bonus(user_id: str, email: str | None) -> DailyRewardClaimOut:
    db = get_supabase_admin()
    today = datetime.now(UTC).date().isoformat()
    key = f"daily:tasks:{today}"
    awarded = _try_claim_daily_coins(db, user_id, key, COINS_DAILY_TASKS_ALL)
    w = get_wallet(user_id, email)
    return DailyRewardClaimOut(
        date=today,
        coins_awarded=COINS_DAILY_TASKS_ALL if awarded else 0,
        already_claimed=not awarded,
        balance=w.balance,
    )


def _quizzable_chapters_stage1(db) -> set[tuple[int, int]]:
    """Chapters that have enough stage-1 questions to start a quiz (same bar as get_chapter_progress).

    Uses DB view ``quizzable_chapters_stage1`` (GROUP BY + HAVING) so we do not rely on
    scanning every question row in Python — PostgREST returns at most ~1000 rows per call
    and OFFSET without ORDER can skip rows when aggregating from the base table.
    """
    out: set[tuple[int, int]] = set()
    offset = 0
    while True:
        result = (
            db.table("quizzable_chapters_stage1")
            .select("book_number, chapter")
            .order("book_number")
            .order("chapter")
            .range(offset, offset + _POSTGREST_PAGE_SIZE - 1)
            .execute()
        )
        batch = result.data or []
        for row in batch:
            out.add((int(row["book_number"]), int(row["chapter"])))
        if len(batch) < _POSTGREST_PAGE_SIZE:
            break
        offset += _POSTGREST_PAGE_SIZE
    return out


def _user_progress_map(db, user_id: str) -> dict[tuple[int, int], dict]:
    out: dict[tuple[int, int], dict] = {}
    offset = 0
    while True:
        result = (
            db.table("user_chapter_progress")
            .select("book_number, chapter, mastery_percent, is_mastered")
            .eq("user_id", user_id)
            .range(offset, offset + _POSTGREST_PAGE_SIZE - 1)
            .execute()
        )
        batch = result.data or []
        for row in batch:
            key = (int(row["book_number"]), int(row["chapter"]))
            out[key] = row
        if len(batch) < _POSTGREST_PAGE_SIZE:
            break
        offset += _POSTGREST_PAGE_SIZE
    return out


def _claim_milestone_reward(db, user_id: str, milestone_key: str, coins: int) -> bool:
    """Insert a one-time scope reward row; return True if this call claimed it."""
    existing = (
        db.table("user_mastery_scope_rewards")
        .select("milestone_key")
        .eq("user_id", user_id)
        .eq("milestone_key", milestone_key)
        .limit(1)
        .execute()
    )
    if existing.data:
        return False
    try:
        db.table("user_mastery_scope_rewards").insert(
            {
                "user_id": user_id,
                "milestone_key": milestone_key,
                "coins_awarded": coins,
            }
        ).execute()
    except Exception:
        retry = (
            db.table("user_mastery_scope_rewards")
            .select("milestone_key")
            .eq("user_id", user_id)
            .eq("milestone_key", milestone_key)
            .limit(1)
            .execute()
        )
        return bool(retry.data)
    return True


def _section_for_book(book_number: int) -> tuple[str, str, tuple[int, ...]] | None:
    for sec_id, sec_label, book_nums in (*_OT_SECTIONS, *_NT_SECTIONS):
        if book_number in book_nums:
            return sec_id, sec_label, book_nums
    return None


def _keys_for_book(quizzable: set[tuple[int, int]], book_num: int) -> list[tuple[int, int]]:
    return sorted((b, c) for (b, c) in quizzable if b == book_num)


def _keys_for_section(quizzable: set[tuple[int, int]], book_nums: tuple[int, ...]) -> list[tuple[int, int]]:
    book_set = set(book_nums)
    return sorted((b, c) for (b, c) in quizzable if b in book_set)


def _keys_for_testament(quizzable: set[tuple[int, int]], tid: str) -> list[tuple[int, int]]:
    if tid == "OT":
        return sorted((b, c) for (b, c) in quizzable if 1 <= b <= 39)
    return sorted((b, c) for (b, c) in quizzable if 40 <= b <= 66)


def _all_quizzable_chapters_mastered(
    keys: list[tuple[int, int]], prog: dict[tuple[int, int], dict]
) -> bool:
    for key in keys:
        row = prog.get(key)
        if not row:
            return False
        if row.get("is_mastered"):
            continue
        if int(row.get("mastery_percent") or 0) >= 100:
            continue
        return False
    return True


def _collect_testament_average_milestones(
    db,
    user_id: str,
    book_number: int,
    chapter: int,
    quizzable: set[tuple[int, int]],
    prog: dict[tuple[int, int], dict],
    mastery_after: int,
) -> tuple[int, list[MasteryScopeBonusOut]]:
    """Award one-time coins when OT/NT average mastery reaches 100%."""
    testament_id = "OT" if 1 <= book_number <= 39 else "NT"
    testament_label = "Old Testament" if testament_id == "OT" else "New Testament"
    test_keys = _keys_for_testament(quizzable, testament_id)
    if not test_keys:
        return 0, []

    avg_before, _, _ = _avg_percent(sorted(test_keys), prog)

    prog_after = dict(prog)
    prev = prog_after.get((book_number, chapter)) or {}
    prog_after[(book_number, chapter)] = {
        **prev,
        "mastery_percent": mastery_after,
        "is_mastered": mastery_after >= 100,
    }
    avg_after, _, _ = _avg_percent(sorted(test_keys), prog_after)

    bonuses: list[MasteryScopeBonusOut] = []
    total = 0
    for threshold, coins in TESTAMENT_PCT_MILESTONES:
        if avg_before < threshold <= avg_after:
            mkey = f"testament:{testament_id}:pct{threshold}"
            if _claim_milestone_reward(db, user_id, mkey, coins):
                bonuses.append(
                    MasteryScopeBonusOut(
                        kind="testament",
                        label=f"{testament_label} ({threshold}% average)",
                        coins=coins,
                    )
                )
                total += coins
    return total, bonuses


def _collect_scope_completion_bonuses(
    db,
    user_id: str,
    book_number: int,
    chapter: int,
    quizzable: set[tuple[int, int]],
    prog: dict[tuple[int, int], dict],
) -> tuple[int, list[MasteryScopeBonusOut]]:
    """
    After a chapter reaches full mastery, award one-time coins if the book or Bible
    section is now fully mastered (all quizzable chapters in that scope have stage 5).
    """
    if (book_number, chapter) not in quizzable:
        return 0, []

    prog = dict(prog)
    prog[(book_number, chapter)] = {"mastery_percent": 100, "is_mastered": True}

    bonuses: list[MasteryScopeBonusOut] = []
    total = 0

    book_keys = _keys_for_book(quizzable, book_number)
    if book_keys and _all_quizzable_chapters_mastered(book_keys, prog):
        mkey = f"book:{book_number}"
        if _claim_milestone_reward(db, user_id, mkey, COINS_BOOK_COMPLETE):
            meta = BOOK_BY_NUMBER.get(book_number)
            label = meta["name"] if meta else f"Book {book_number}"
            bonuses.append(
                MasteryScopeBonusOut(kind="book", label=label, coins=COINS_BOOK_COMPLETE)
            )
            total += COINS_BOOK_COMPLETE

    section = _section_for_book(book_number)
    if section:
        sec_id, sec_label, book_nums = section
        sec_keys = _keys_for_section(quizzable, book_nums)
        if sec_keys and _all_quizzable_chapters_mastered(sec_keys, prog):
            mkey = f"section:{sec_id}"
            if _claim_milestone_reward(db, user_id, mkey, COINS_SECTION_COMPLETE):
                bonuses.append(
                    MasteryScopeBonusOut(
                        kind="section", label=sec_label, coins=COINS_SECTION_COMPLETE
                    )
                )
                total += COINS_SECTION_COMPLETE

    return total, bonuses


def _avg_percent(pairs: list[tuple[int, int]], prog: dict[tuple[int, int], dict]) -> tuple[int, int, int]:
    """Returns (average_mastery_percent, quizzable_count, mastered_count)."""
    if not pairs:
        return 0, 0, 0
    total_m = 0
    mastered = 0
    for key in pairs:
        row = prog.get(key)
        m = int(row["mastery_percent"]) if row else 0
        total_m += m
        if row and row.get("is_mastered"):
            mastered += 1
        elif m >= 100:
            mastered += 1
    n = len(pairs)
    return round(total_m / n), n, mastered


def get_mastery_overview(user_id: str) -> MasteryOverviewOut:
    db = get_supabase_admin()
    quizzable = _quizzable_chapters_stage1(db)
    prog = _user_progress_map(db, user_id)

    def build_testament(
        tid: str,
        tlabel: str,
        sections_def: tuple[tuple[str, str, tuple[int, ...]], ...],
    ) -> MasteryTestamentOut:
        section_out: list[MasterySectionOut] = []

        for sec_id, sec_label, book_nums in sections_def:
            book_num_set = set(book_nums)
            books_out: list[MasteryBookOut] = []
            for bn in book_nums:
                meta = BOOK_BY_NUMBER.get(bn)
                if not meta:
                    continue
                book_keys = sorted(
                    (b, c) for (b, c) in quizzable if b == bn
                )
                if not book_keys:
                    continue
                ch_out = [
                    MasteryChapterOut(
                        chapter=c,
                        mastery_percent=int(prog.get((bn, c), {}).get("mastery_percent") or 0),
                        is_mastered=bool(prog.get((bn, c), {}).get("is_mastered")),
                    )
                    for b, c in book_keys
                ]
                avg, qc, mast = _avg_percent(book_keys, prog)
                books_out.append(
                    MasteryBookOut(
                        book_number=bn,
                        name=meta["name"],
                        quizzable_chapters=qc,
                        mastered_chapters=mast,
                        average_mastery_percent=avg,
                        chapters=ch_out,
                    )
                )
            if not books_out:
                continue
            sec_keys = [k for k in quizzable if k[0] in book_num_set]
            s_avg, s_qc, s_mast = _avg_percent(sorted(sec_keys), prog)
            section_out.append(
                MasterySectionOut(
                    id=sec_id,
                    label=sec_label,
                    quizzable_chapters=s_qc,
                    mastered_chapters=s_mast,
                    average_mastery_percent=s_avg,
                    books=sorted(books_out, key=lambda x: x.book_number),
                )
            )

        if tid == "OT":
            t_keys = [k for k in quizzable if 1 <= k[0] <= 39]
        else:
            t_keys = [k for k in quizzable if 40 <= k[0] <= 66]
        t_avg, t_qc, t_mast = _avg_percent(sorted(t_keys), prog)
        return MasteryTestamentOut(
            id=tid,
            label=tlabel,
            quizzable_chapters=t_qc,
            mastered_chapters=t_mast,
            average_mastery_percent=t_avg,
            sections=section_out,
        )

    testaments = [
        build_testament("OT", "Old Testament", _OT_SECTIONS),
        build_testament("NT", "New Testament", _NT_SECTIONS),
    ]
    return MasteryOverviewOut(testaments=testaments)
