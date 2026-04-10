'use client';

import { useEffect, useRef, useState } from 'react';
import type { AuthSession } from '@/lib/account';
import {
  type ChapterProgressOut,
  type ChapterQuizOut,
  type QuizSubmitOut,
  getChapterProgress,
  getChapterQuiz,
  submitQuiz,
} from '@/lib/quiz';

// ── Mastery strip (shown at chapter bottom) ───────────────────────────────────

const MASTERY_MILESTONES = [0, 50, 75, 87, 99, 100];

interface MasteryStripProps {
  bookNumber: number;
  chapter: number;
  session: AuthSession;
  onTakeQuiz: () => void;
  /** When false, the quiz button stays disabled (e.g. until scroll + dwell requirements are met). */
  quizGateMet?: boolean;
  /** Shown when the gate is not met; explains what is still required. */
  quizGateHint?: string | null;
}

export function MasteryStrip({
  bookNumber,
  chapter,
  session,
  onTakeQuiz,
  quizGateMet = true,
  quizGateHint = null,
}: MasteryStripProps) {
  const [progress, setProgress] = useState<ChapterProgressOut | null>(null);
  const [loading, setLoading] = useState(true);
  const prevKey = useRef('');

  useEffect(() => {
    const key = `${bookNumber}-${chapter}`;
    if (key === prevKey.current) return;
    prevKey.current = key;
    setLoading(true);
    setProgress(null);
    getChapterProgress(session, bookNumber, chapter)
      .then(setProgress)
      .catch(() => setProgress(null))
      .finally(() => setLoading(false));
  }, [bookNumber, chapter, session]);

  if (loading) return <div className="mastery-strip mastery-strip--loading" />;
  if (!progress || !progress.has_quiz) return null;

  const pct = progress.mastery_percent;
  const nextStage = progress.next_stage;

  return (
    <div className="mastery-strip">
      <div className="mastery-strip-info">
        <span className="mastery-strip-label">
          Mastery: <strong>{pct}%</strong>
        </span>
        {!progress.is_mastered && (
          <span className="mastery-strip-stage">
            Next: Stage {nextStage}
          </span>
        )}
        {progress.is_mastered && (
          <span className="mastery-strip-complete">Mastered!</span>
        )}
      </div>
      <div className="mastery-bar-wrap">
        <div className="mastery-bar-track">
          <div className="mastery-bar-fill" style={{ width: `${pct}%` }} />
          {MASTERY_MILESTONES.map((m) => (
            <div
              key={m}
              className={`mastery-bar-tick${pct >= m ? ' reached' : ''}`}
              style={{ left: `${m}%` }}
            />
          ))}
        </div>
      </div>
      <div className="mastery-quiz-actions">
        <button
          className="mastery-quiz-btn reader-onboarding-btn"
          type="button"
          disabled={!quizGateMet}
          title={!quizGateMet && quizGateHint ? quizGateHint : undefined}
          aria-describedby={!quizGateMet && quizGateHint ? 'mastery-quiz-gate-hint' : undefined}
          onClick={onTakeQuiz}
        >
          Take Quiz
        </button>
        {!quizGateMet && quizGateHint && (
          <p id="mastery-quiz-gate-hint" className="mastery-quiz-gate-hint">
            {quizGateHint}
          </p>
        )}
      </div>
    </div>
  );
}

// ── Quiz modal ────────────────────────────────────────────────────────────────

type QuizScreen = 'loading' | 'quiz' | 'results' | 'error';

interface ChapterQuizProps {
  bookNumber: number;
  chapter: number;
  session: AuthSession;
  onClose: () => void;
  /** Called after a successful quiz submission (results shown). */
  onSubmitted?: () => void;
  onProgressUpdate?: (progress: ChapterProgressOut) => void;
}

export default function ChapterQuiz({
  bookNumber,
  chapter,
  session,
  onClose,
  onSubmitted,
  onProgressUpdate,
}: ChapterQuizProps) {
  const [screen, setScreen] = useState<QuizScreen>('loading');
  const [quiz, setQuiz] = useState<ChapterQuizOut | null>(null);
  const [answers, setAnswers] = useState<Record<number, string>>({});
  const [result, setResult] = useState<QuizSubmitOut | null>(null);
  const [errorMsg, setErrorMsg] = useState('');
  const [submitting, setSubmitting] = useState(false);

  // Load quiz on mount
  useEffect(() => {
    setScreen('loading');
    getChapterQuiz(session, bookNumber, chapter)
      .then((q) => {
        setQuiz(q);
        setAnswers({});
        setScreen('quiz');
      })
      .catch((err: unknown) => {
        const msg = err instanceof Error ? err.message : 'Failed to load quiz.';
        setErrorMsg(msg);
        setScreen('error');
      });
  }, [bookNumber, chapter, session]);

  const allAnswered = quiz !== null && Object.keys(answers).length === quiz.questions.length;

  async function handleSubmit() {
    if (!quiz || !allAnswered) return;
    setSubmitting(true);
    try {
      const res = await submitQuiz(session, {
        book_number: bookNumber,
        chapter,
        answers: quiz.questions.map((q) => ({
          question_id: q.id,
          answer: answers[q.id] ?? '',
        })),
      });
      setResult(res);
      setScreen('results');
      onSubmitted?.();
      // Refresh progress for the strip
      if (onProgressUpdate) {
        getChapterProgress(session, bookNumber, chapter)
          .then(onProgressUpdate)
          .catch(() => {});
      }
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : 'Submission failed.';
      setErrorMsg(msg);
      setScreen('error');
    } finally {
      setSubmitting(false);
    }
  }

  // Trap focus inside modal
  const modalRef = useRef<HTMLDivElement>(null);
  useEffect(() => {
    const el = modalRef.current;
    if (!el) return;
    el.focus();
  }, [screen]);

  return (
    <div className="quiz-overlay" role="dialog" aria-modal="true">
      <div className="quiz-backdrop" onClick={onClose} />
      <div className="quiz-modal" ref={modalRef} tabIndex={-1}>
        {/* ── Loading ── */}
        {screen === 'loading' && (
          <div className="quiz-loading">
            <div className="quiz-spinner" />
            <p>Loading quiz…</p>
          </div>
        )}

        {/* ── Error ── */}
        {screen === 'error' && (
          <div className="quiz-error">
            <p className="quiz-error-msg">{errorMsg}</p>
            <button className="reader-onboarding-btn" type="button" onClick={onClose}>
              Close
            </button>
          </div>
        )}

        {/* ── Quiz ── */}
        {screen === 'quiz' && quiz && (
          <>
            <div className="quiz-header">
              <div className="quiz-stage-label">{quiz.stage_label}</div>
              <button className="quiz-close-btn" type="button" aria-label="Close quiz" onClick={onClose}>
                ✕
              </button>
            </div>
            <div className="quiz-questions">
              {quiz.questions.map((q, idx) => (
                <div key={q.id} className="quiz-question">
                  <p className="quiz-question-prompt">
                    <span className="quiz-question-num">{idx + 1}.</span> {q.prompt}
                  </p>
                  <div className="quiz-choices">
                    {q.choices_json.map((choice) => {
                      const selected = answers[q.id] === choice;
                      return (
                        <label
                          key={choice}
                          className={`quiz-choice${selected ? ' selected' : ''}`}
                        >
                          <input
                            type="radio"
                            name={`q-${q.id}`}
                            value={choice}
                            checked={selected}
                            onChange={() => setAnswers((prev) => ({ ...prev, [q.id]: choice }))}
                          />
                          <span className="quiz-choice-text">{choice}</span>
                        </label>
                      );
                    })}
                  </div>
                </div>
              ))}
            </div>
            <div className="quiz-footer">
              <span className="quiz-progress-hint">
                {Object.keys(answers).length}/{quiz.questions.length} answered
              </span>
              <button
                className="reader-onboarding-btn quiz-submit-btn"
                type="button"
                disabled={!allAnswered || submitting}
                onClick={() => void handleSubmit()}
              >
                {submitting ? 'Submitting…' : 'Submit'}
              </button>
            </div>
          </>
        )}

        {/* ── Results ── */}
        {screen === 'results' && result && quiz && (
          <>
            <div className="quiz-header">
              <div className="quiz-stage-label">{quiz.stage_label}</div>
              <button className="quiz-close-btn" type="button" aria-label="Close quiz" onClick={onClose}>
                ✕
              </button>
            </div>
            <div className="quiz-results">
              {/* Score banner */}
              <div className={`quiz-result-banner${result.passed ? ' passed' : ' failed'}`}>
                <span className="quiz-result-icon">{result.passed ? '✓' : '✗'}</span>
                <span className="quiz-result-label">{result.passed ? 'Passed!' : 'Not quite!'}</span>
                <span className="quiz-result-score">
                  {result.score}/{result.total_questions}
                </span>
              </div>

              {/* Mastery change */}
              <div className="quiz-mastery-change">
                <div className="quiz-mastery-row">
                  <span>Mastery</span>
                  <span className="quiz-mastery-values">
                    {result.mastery_before}%
                    {result.mastery_after !== result.mastery_before && (
                      <>
                        {' → '}
                        <strong>{result.mastery_after}%</strong>
                      </>
                    )}
                  </span>
                </div>
                <div className="mastery-bar-track quiz-result-bar">
                  <div
                    className="mastery-bar-fill mastery-bar-fill--before"
                    style={{ width: `${result.mastery_before}%` }}
                  />
                  {result.mastery_after > result.mastery_before && (
                    <div
                      className="mastery-bar-fill mastery-bar-fill--gain"
                      style={{
                        left: `${result.mastery_before}%`,
                        width: `${result.mastery_after - result.mastery_before}%`,
                      }}
                    />
                  )}
                  {MASTERY_MILESTONES.map((m) => (
                    <div
                      key={m}
                      className={`mastery-bar-tick${result.mastery_after >= m ? ' reached' : ''}`}
                      style={{ left: `${m}%` }}
                    />
                  ))}
                </div>
                {result.is_mastered && (
                  <div className="quiz-mastered-badge">Chapter Mastered!</div>
                )}
              </div>

              {/* Coins */}
              <div className="quiz-coins">
                <span className="quiz-coins-icon">🪙</span>
                <span className="quiz-coins-amount">
                  +{result.currency_awarded + result.perfect_score_bonus} coins
                </span>
                {result.perfect_score_bonus > 0 && (
                  <span className="quiz-coins-bonus">perfect score bonus!</span>
                )}
                {result.mastery_completion_bonus > 0 && (
                  <span className="quiz-coins-bonus">mastery bonus!</span>
                )}
              </div>

              {/* Answer review */}
              <div className="quiz-answer-review">
                <div className="quiz-review-heading">Answers</div>
                {quiz.questions.map((q, idx) => {
                  const userAnswer = answers[q.id] ?? '';
                  const correct = result.correct_answers[q.id] ?? '';
                  const isCorrect = userAnswer === correct;
                  const explanation = result.explanations[q.id];
                  return (
                    <div key={q.id} className={`quiz-review-item${isCorrect ? ' correct' : ' wrong'}`}>
                      <p className="quiz-review-prompt">
                        <span className="quiz-review-icon">{isCorrect ? '✓' : '✗'}</span>
                        <span className="quiz-question-num">{idx + 1}.</span> {q.prompt}
                      </p>
                      {!isCorrect && (
                        <p className="quiz-review-correct">Correct: {correct}</p>
                      )}
                      {explanation && (
                        <p className="quiz-review-explanation">{explanation}</p>
                      )}
                    </div>
                  );
                })}
              </div>
            </div>
            <div className="quiz-footer">
              <button className="reader-onboarding-btn quiz-submit-btn" type="button" onClick={onClose}>
                Close
              </button>
            </div>
          </>
        )}
      </div>
    </div>
  );
}
