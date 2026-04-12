import type { AuthSession } from './account';

// ── Types ─────────────────────────────────────────────────────────────────────

export interface QuizQuestion {
  id: number;
  prompt: string;
  choices_json: string[];
  source_verse_start: number | null;
  source_verse_end: number | null;
}

export interface ChapterQuizOut {
  book_number: number;
  chapter: number;
  stage: number;
  stage_label: string;
  questions: QuizQuestion[];
}

export interface QuizAnswerIn {
  question_id: number;
  answer: string;
}

export type QuizCoinMultiplier = 'none' | 'coin_rush' | 'blessing';

export interface QuizSubmitIn {
  book_number: number;
  chapter: number;
  answers: QuizAnswerIn[];
  grace_shield?: boolean;
  coin_multiplier?: QuizCoinMultiplier;
}

export interface MasteryScopeBonusOut {
  kind: string;
  label: string;
  coins: number;
}

export interface QuizSubmitOut {
  score: number;
  total_questions: number;
  passed: boolean;
  stage_attempted: number;
  mastery_before: number;
  mastery_after: number;
  currency_awarded: number;
  perfect_score_bonus: number;
  mastery_completion_bonus: number;
  /** Present when API supports full-Bible scope bonuses (book / section / testament). */
  scope_completion_bonus_total?: number;
  scope_completion_bonuses?: MasteryScopeBonusOut[];
  is_mastered: boolean;
  correct_answers: Record<number, string>;
  explanations: Record<number, string | null>;
  grace_shield_applied?: boolean;
  coin_multiplier_applied?: QuizCoinMultiplier;
}

export interface ChapterProgressOut {
  book_number: number;
  chapter: number;
  mastery_stage: number;
  mastery_percent: number;
  next_stage: number;
  has_quiz: boolean;
  total_attempts: number;
  total_passes: number;
  highest_score: number;
  is_completed: boolean;
  is_mastered: boolean;
  last_attempt_at: string | null;
}

export interface WalletOut {
  user_id: string;
  balance: number;
}

export interface DailyRewardsStatusOut {
  date: string;
  verse_claimed: boolean;
  tasks_claimed: boolean;
}

export interface DailyRewardClaimOut {
  date: string;
  coins_awarded: number;
  already_claimed: boolean;
  balance: number;
}

export interface QuizHintOut {
  correct_answer: string;
}

export interface MasteryChapterOut {
  chapter: number;
  mastery_percent: number;
  is_mastered: boolean;
}

export interface MasteryBookOut {
  book_number: number;
  name: string;
  quizzable_chapters: number;
  mastered_chapters: number;
  average_mastery_percent: number;
  chapters: MasteryChapterOut[];
}

export interface MasterySectionOut {
  id: string;
  label: string;
  quizzable_chapters: number;
  mastered_chapters: number;
  average_mastery_percent: number;
  books: MasteryBookOut[];
}

export interface MasteryTestamentOut {
  id: string;
  label: string;
  quizzable_chapters: number;
  mastered_chapters: number;
  average_mastery_percent: number;
  sections: MasterySectionOut[];
}

export interface MasteryOverviewOut {
  testaments: MasteryTestamentOut[];
}

// ── Helpers ───────────────────────────────────────────────────────────────────

function quizHeaders(session: AuthSession): HeadersInit {
  return {
    'Content-Type': 'application/json',
    Authorization: `Bearer ${session.accessToken}`,
  };
}

async function quizRequest<T>(path: string, init: RequestInit): Promise<T> {
  const res = await fetch(path, init);
  if (!res.ok) {
    const payload = await res.json().catch(() => null);
    const detail =
      payload && typeof payload === 'object' && 'detail' in payload
        ? String((payload as { detail: unknown }).detail)
        : `Request failed: ${res.status}`;
    throw new Error(detail);
  }
  return res.json() as Promise<T>;
}

// ── API functions ─────────────────────────────────────────────────────────────

export async function getChapterQuiz(
  session: AuthSession,
  bookNumber: number,
  chapter: number,
): Promise<ChapterQuizOut> {
  return quizRequest<ChapterQuizOut>(`/api/v1/quiz/${bookNumber}/${chapter}`, {
    method: 'GET',
    headers: quizHeaders(session),
  });
}

export async function submitQuiz(
  session: AuthSession,
  payload: QuizSubmitIn,
): Promise<QuizSubmitOut> {
  return quizRequest<QuizSubmitOut>('/api/v1/quiz/submit', {
    method: 'POST',
    headers: quizHeaders(session),
    body: JSON.stringify(payload),
  });
}

export async function getChapterProgress(
  session: AuthSession,
  bookNumber: number,
  chapter: number,
): Promise<ChapterProgressOut> {
  return quizRequest<ChapterProgressOut>(
    `/api/v1/quiz/progress/${bookNumber}/${chapter}`,
    { method: 'GET', headers: quizHeaders(session) },
  );
}

export async function getWallet(session: AuthSession): Promise<WalletOut> {
  return quizRequest<WalletOut>('/api/v1/wallet', {
    method: 'GET',
    headers: quizHeaders(session),
  });
}

export async function getDailyRewardsStatus(
  session: AuthSession,
): Promise<DailyRewardsStatusOut> {
  return quizRequest<DailyRewardsStatusOut>('/api/v1/wallet/daily-rewards', {
    method: 'GET',
    headers: quizHeaders(session),
  });
}

export async function claimDailyVerseReward(
  session: AuthSession,
): Promise<DailyRewardClaimOut> {
  return quizRequest<DailyRewardClaimOut>('/api/v1/wallet/claim-daily-verse', {
    method: 'POST',
    headers: quizHeaders(session),
  });
}

export async function claimDailyTasksBonus(
  session: AuthSession,
): Promise<DailyRewardClaimOut> {
  return quizRequest<DailyRewardClaimOut>('/api/v1/wallet/claim-daily-tasks', {
    method: 'POST',
    headers: quizHeaders(session),
  });
}

export async function revealQuizHint(
  session: AuthSession,
  questionId: number,
): Promise<QuizHintOut> {
  return quizRequest<QuizHintOut>('/api/v1/quiz/hint', {
    method: 'POST',
    headers: quizHeaders(session),
    body: JSON.stringify({ question_id: questionId }),
  });
}

export async function getMasteryOverview(
  session: AuthSession,
): Promise<MasteryOverviewOut> {
  return quizRequest<MasteryOverviewOut>('/api/v1/quiz/mastery-overview', {
    method: 'GET',
    headers: quizHeaders(session),
  });
}
