import type { Page, Request } from '@playwright/test';
import aiChat from './ai-chat.json';
import aiEntityContent from './ai-entity-content.json';
import aiGuidedChapter from './ai-guided-chapter.json';
import authSession from './auth-session.json';
import me from './me.json';
import quizJohn3 from './quiz-john-3.json';
import quizMasteryOverview from './quiz-mastery-overview.json';
import quizProgressJohn3 from './quiz-progress-john-3.json';
import quizSubmitJohn3 from './quiz-submit-john-3.json';
import userSettings from './user-settings.json';
import walletClaim from './wallet-claim.json';
import walletDailyRewards from './wallet-daily-rewards.json';
import wallet from './wallet.json';

export const MOCK_USER = { email: 'e2e@example.com', password: 'e2e-password-1' };

/** Request bodies the mocks received, so specs can assert what the UI actually sent. */
export interface MockCalls {
  aiChat: Array<{
    message: string;
    context: { book: string; chapter: number; translation: string };
    personality: string;
    conversation_history: unknown[];
  }>;
  signIn: Array<{ email: string; password: string }>;
  quizSubmit: Array<{
    book_number: number;
    chapter: number;
    answers: Array<{ question_id: number; answer: string }>;
  }>;
}

type Fulfill = { status?: number; json?: unknown };

const USER_ID = authSession.user_id;

function progressFor(bookNumber: number, chapter: number) {
  if (bookNumber === 43 && chapter === 3) return quizProgressJohn3;
  return { ...quizProgressJohn3, book_number: bookNumber, chapter, has_quiz: false };
}

function bodyOf(req: Request): unknown {
  try {
    return req.postDataJSON();
  } catch {
    return null;
  }
}

function resolve(req: Request, calls: MockCalls): Fulfill | null {
  const method = req.method();
  const path = new URL(req.url()).pathname.replace(/^\/api\/v1/, '');

  // ── AI: every endpoint except guided-chapter/sections (that one is replayed from the HAR) ──
  if (path === '/ai/chat' && method === 'POST') {
    calls.aiChat.push(bodyOf(req) as MockCalls['aiChat'][number]);
    return { json: aiChat };
  }
  if (path === '/ai/guided-chapter' && method === 'POST') return { json: aiGuidedChapter };
  if (path === '/ai/entity-content' && method === 'POST') return { json: aiEntityContent };
  if (path.startsWith('/ai/') && path !== '/ai/guided-chapter/sections') {
    return { status: 404, json: { detail: `e2e: no mock for ${method} /api/v1${path}` } };
  }

  // ── Auth + account ──
  if (path === '/auth/signin' && method === 'POST') {
    calls.signIn.push(bodyOf(req) as MockCalls['signIn'][number]);
    return { json: authSession };
  }
  if (path === '/auth/signup' && method === 'POST') return { json: authSession };
  if (path === '/auth/refresh' && method === 'POST') return { json: authSession };
  if (path === '/auth/signout' && method === 'POST') return { status: 204 };
  if (path === '/me') return { json: me };
  if (path === '/study-items') {
    if (method === 'PUT') {
      const items = (bodyOf(req) as Array<Record<string, unknown>>) ?? [];
      return { json: items.map((item, i) => ({ id: i + 1, user_id: USER_ID, ...item })) };
    }
    return { json: [] };
  }
  if (path === '/reading-progress') {
    if (method === 'PUT') {
      const items = (bodyOf(req) as Array<Record<string, unknown>>) ?? [];
      return { json: items.map((item, i) => ({ id: i + 1, user_id: USER_ID, ...item })) };
    }
    return { json: [] };
  }
  if (path === '/user-settings') {
    if (method === 'PUT') return { json: { ...userSettings, ...(bodyOf(req) as object) } };
    return { json: userSettings };
  }

  // ── Quiz + wallet ──
  if (path === '/wallet') return { json: wallet };
  if (path === '/wallet/daily-rewards') return { json: walletDailyRewards };
  if (path === '/wallet/claim-daily-verse' || path === '/wallet/claim-daily-tasks') {
    return { json: walletClaim };
  }
  if (path === '/quiz/mastery-overview') return { json: quizMasteryOverview };
  if (path === '/quiz/hint' && method === 'POST') return { json: { correct_answer: 'Nicodemus' } };
  if (path === '/quiz/submit' && method === 'POST') {
    calls.quizSubmit.push(bodyOf(req) as MockCalls['quizSubmit'][number]);
    return { json: quizSubmitJohn3 };
  }
  const progress = /^\/quiz\/progress\/(\d+)\/(\d+)$/.exec(path);
  if (progress) return { json: progressFor(Number(progress[1]), Number(progress[2])) };
  if (path === '/quiz/43/3') return { json: quizJohn3 };

  return null;
}

/**
 * Registers hand-written mocks for AI, auth, account, quiz and wallet endpoints.
 * Anything not handled here falls through to the HAR route registered earlier on the page.
 */
export async function installMocks(page: Page): Promise<MockCalls> {
  const calls: MockCalls = { aiChat: [], signIn: [], quizSubmit: [] };
  await page.route('**/api/v1/**', async (route) => {
    const mocked = resolve(route.request(), calls);
    if (!mocked) return route.fallback();
    if (mocked.json === undefined) return route.fulfill({ status: mocked.status ?? 200 });
    return route.fulfill({ status: mocked.status ?? 200, json: mocked.json });
  });
  return calls;
}
