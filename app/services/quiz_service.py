import random

from fastapi import HTTPException

from app.core.book_catalog import BOOK_BY_NUMBER
from app.core.supabase_client import get_supabase_admin
from app.schemas.quiz import (
    ChapterProgressOut,
    ChapterQuizOut,
    MasteryBookOut,
    MasteryChapterOut,
    MasteryOverviewOut,
    MasterySectionOut,
    MasteryTestamentOut,
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
CURRENCY_MASTERY_BONUS = 20

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
    passed = score >= threshold

    # Calculate mastery changes
    new_stage = current_stage
    mastery_after = mastery_before
    newly_mastered = False

    if passed and current_stage < 5:
        new_stage = stage_attempted
        mastery_after = STAGE_MAP[new_stage]
        if new_stage == 5:
            newly_mastered = True

    # Currency
    base_currency = CURRENCY_PASS if passed else CURRENCY_FAIL
    perfect_bonus = CURRENCY_PERFECT_BONUS if score == total_questions else 0
    mastery_bonus = CURRENCY_MASTERY_BONUS if newly_mastered else 0
    total_currency = base_currency + perfect_bonus + mastery_bonus

    # Update user_chapter_progress
    new_total_attempts = progress["total_attempts"] + 1
    new_total_passes = progress["total_passes"] + (1 if passed else 0)
    new_highest_score = max(progress["highest_score"], score)

    from datetime import UTC, datetime
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
            "currency_awarded": base_currency + mastery_bonus,
            "perfect_score_bonus": perfect_bonus,
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
        currency_awarded=base_currency + mastery_bonus,
        perfect_score_bonus=perfect_bonus,
        mastery_completion_bonus=mastery_bonus,
        is_mastered=new_stage == 5,
        correct_answers=correct_answers,
        explanations=explanations,
    )


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


def get_wallet(user_id: str) -> WalletOut:
    db = get_supabase_admin()
    wallet = _get_or_create_wallet(db, user_id)
    return WalletOut(user_id=user_id, balance=wallet["balance"])


def _quizzable_chapters_stage1(db) -> set[tuple[int, int]]:
    """Chapters that have enough stage-1 questions to start a quiz (same bar as get_chapter_progress)."""
    result = (
        db.table("quiz_question_bank")
        .select("book_number, chapter")
        .eq("difficulty_stage", 1)
        .execute()
    )
    counts: dict[tuple[int, int], int] = {}
    for row in result.data or []:
        key = (int(row["book_number"]), int(row["chapter"]))
        counts[key] = counts.get(key, 0) + 1
    return {k for k, c in counts.items() if c >= 5}


def _user_progress_map(db, user_id: str) -> dict[tuple[int, int], dict]:
    result = (
        db.table("user_chapter_progress")
        .select("book_number, chapter, mastery_percent, is_mastered")
        .eq("user_id", user_id)
        .execute()
    )
    out: dict[tuple[int, int], dict] = {}
    for row in result.data or []:
        key = (int(row["book_number"]), int(row["chapter"]))
        out[key] = row
    return out


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
