import { test as base, expect, type Page } from '@playwright/test';
import path from 'node:path';
import { installMocks, type MockCalls } from './mocks';

/**
 * Network model
 *  - Hand-written mocks (e2e/mocks) answer AI, auth, account, quiz and wallet calls.
 *  - Everything else under /api/v1 is replayed from e2e/fixtures/api.har (notFound: 'abort').
 *  - Nothing in the suite needs the backend. To re-record the HAR:
 *      1. start the backend:  python -m uvicorn app.main:app --port 8000   (repo root)
 *      2. UPDATE_HAR=1 npx playwright test
 *      3. node e2e/merge-har.mjs
 *    Each test records to its own file under test-results/har (parallel contexts would
 *    otherwise overwrite one another); merge-har.mjs folds them into api.har.
 */
const HAR_PATH = path.join(__dirname, 'fixtures', 'api.har');
const RECORD_DIR = path.join(__dirname, '..', 'test-results', 'har');
const UPDATE_HAR = process.env.UPDATE_HAR === '1';

/** Fixed start time so the home-screen greeting (morning/afternoon/evening) never depends on the real clock. */
const PINNED_NOW = new Date('2026-03-10T10:00:00');

export const test = base.extend<{ calls: MockCalls }>({
  // auto: network wiring is installed for every test, whether or not it asks for `calls`.
  calls: [async ({ page }, use, testInfo) => {
    const apiFailures: string[] = [];
    page.on('requestfailed', (req) => {
      // ERR_FAILED is what a HAR miss (notFound: 'abort') produces; ERR_ABORTED is a navigation cancelling a fetch.
      if (req.url().includes('/api/v1/') && req.failure()?.errorText === 'net::ERR_FAILED') {
        apiFailures.push(`${req.method()} ${new URL(req.url()).pathname}${new URL(req.url()).search}`);
      }
    });

    // The Next.js dev indicator sits on top of the bottom-left Settings button and eats clicks.
    await page.addInitScript(() => {
      const hide = () => {
        const style = document.createElement('style');
        style.textContent = 'nextjs-portal { display: none !important; }';
        document.head.appendChild(style);
      };
      if (document.head) hide();
      else document.addEventListener('DOMContentLoaded', hide);
    });

    await page.clock.install({ time: PINNED_NOW });

    // Registered first = lowest priority: mocks below get first refusal, the HAR catches the rest.
    await page.routeFromHAR(
      UPDATE_HAR ? path.join(RECORD_DIR, `${testInfo.testId}.har`) : HAR_PATH,
      {
        url: '**/api/v1/**',
        update: UPDATE_HAR,
        updateContent: 'embed',
        notFound: 'abort',
      },
    );
    const calls = await installMocks(page);

    await use(calls);

    expect(apiFailures, 'API requests with neither a mock nor a HAR entry').toEqual([]);
  }, { auto: true }],
});

export { expect };

/** The top bar and bottom taskbar auto-hide; moving the pointer to an edge reveals them. */
export async function revealTopBar(page: Page) {
  await page.mouse.move(700, 5);
}
export async function revealTaskbar(page: Page) {
  await page.mouse.move(700, 895);
}

/** Opens a chapter through the book picker (the path that keeps the app's chapter state consistent). */
export async function pickChapter(page: Page, book: string, chapter: number) {
  await revealTopBar(page);
  await page.locator('.nav-btn-book').click();
  await page.getByRole('button', { name: book, exact: true }).click();
  await page
    .locator('.chapter-picker.open')
    .getByRole('button', { name: String(chapter), exact: true })
    .click();
}

/** From the home screen, enter the reader and navigate to `book chapter`. */
export async function openReaderAt(page: Page, book: string, chapter: number) {
  await page.goto('/app');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(page.locator('.verse-line').first()).toBeVisible();
  await pickChapter(page, book, chapter);
  await expect(page.locator('.nav-btn-book')).toHaveText(`${book} ${chapter}`);
}

export const verse = (page: Page, n: number) => page.locator(`.verse-line[data-verse="${n}"]`);

/** Waits until React has attached to the element, so typing/clicking can't race hydration in `next dev`. */
export async function waitForHydration(page: Page, selector: string) {
  await page.waitForFunction(
    (sel) => {
      const el = document.querySelector(sel);
      return !!el && Object.keys(el).some((k) => k.startsWith('__reactProps$'));
    },
    selector,
  );
}
