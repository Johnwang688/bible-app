from typing import Literal

from pydantic import BaseModel, Field, field_validator


class QuizQuestion(BaseModel):
    id: int
    prompt: str
    choices_json: list[str]
    source_verse_start: int | None = None
    source_verse_end: int | None = None
    # correct_answer intentionally omitted — revealed only after submission


class ChapterQuizOut(BaseModel):
    book_number: int
    chapter: int
    stage: int  # 1–5, the stage this quiz tests
    stage_label: str  # e.g. "Stage 1"
    questions: list[QuizQuestion]


class QuizAnswerIn(BaseModel):
    question_id: int
    answer: str


class QuizSubmitIn(BaseModel):
    book_number: int
    chapter: int
    answers: list[QuizAnswerIn]
    grace_shield: bool = False
    coin_multiplier: Literal["none", "coin_rush", "blessing"] = "none"

    @field_validator("answers")
    @classmethod
    def must_have_five(cls, v: list[QuizAnswerIn]) -> list[QuizAnswerIn]:
        if len(v) != 5:
            raise ValueError("Exactly 5 answers are required.")
        return v


class MasteryScopeBonusOut(BaseModel):
    """One-time bonus for fully mastering a book, section, or testament."""

    kind: str  # "book" | "section" | "testament"
    label: str
    coins: int


class QuizSubmitOut(BaseModel):
    score: int
    total_questions: int
    passed: bool
    stage_attempted: int
    mastery_before: int
    mastery_after: int
    currency_awarded: int
    perfect_score_bonus: int
    mastery_completion_bonus: int  # coins for advancing to a new mastery stage (50–100% tiers)
    scope_completion_bonus_total: int = 0
    scope_completion_bonuses: list[MasteryScopeBonusOut] = Field(default_factory=list)
    is_mastered: bool
    correct_answers: dict[int, str]       # question_id → correct answer text
    explanations: dict[int, str | None]   # question_id → explanation text
    grace_shield_applied: bool = False
    coin_multiplier_applied: Literal["none", "coin_rush", "blessing"] = "none"


class QuizHintIn(BaseModel):
    question_id: int


class QuizHintOut(BaseModel):
    correct_answer: str


class ChapterProgressOut(BaseModel):
    book_number: int
    chapter: int
    mastery_stage: int
    mastery_percent: int
    next_stage: int       # stage the user would attempt next (1–5)
    has_quiz: bool        # True if the bank has enough questions for next_stage
    total_attempts: int
    total_passes: int
    highest_score: int
    is_completed: bool
    is_mastered: bool
    last_attempt_at: str | None


class WalletOut(BaseModel):
    user_id: str
    balance: int


class DailyRewardsStatusOut(BaseModel):
    """UTC calendar day; which one-time daily rewards were already claimed."""

    date: str
    verse_claimed: bool
    tasks_claimed: bool


class DailyRewardClaimOut(BaseModel):
    date: str
    coins_awarded: int
    already_claimed: bool
    balance: int


class MasteryChapterOut(BaseModel):
    chapter: int
    mastery_percent: int
    is_mastered: bool


class MasteryBookOut(BaseModel):
    book_number: int
    name: str
    quizzable_chapters: int
    mastered_chapters: int
    average_mastery_percent: int
    chapters: list[MasteryChapterOut]


class MasterySectionOut(BaseModel):
    id: str
    label: str
    quizzable_chapters: int
    mastered_chapters: int
    average_mastery_percent: int
    books: list[MasteryBookOut]


class MasteryTestamentOut(BaseModel):
    id: str
    label: str
    quizzable_chapters: int
    mastered_chapters: int
    average_mastery_percent: int
    sections: list[MasterySectionOut]


class MasteryOverviewOut(BaseModel):
    """Rollup of quiz mastery by testament → section → book → chapter."""

    testaments: list[MasteryTestamentOut]
