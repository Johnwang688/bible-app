// Send feedback on Me (design/proposed/feedback.html, approved 11-03): the row, the sheet's states and the request,
// over a mocked backend (page.route; nothing reaches a server), in English and Chinese, plus Under 13 and the
// privacy page's sentence.
import { expect, test, type Page, type Request, type Route } from '@playwright/test';

import { mockApi, seed } from './helpers';

const FEEDBACK = '**/api/v1/feedback';

type Answer = (route: Route) => Promise<void>;
const created: Answer = (route) => route.fulfill({ status: 201, json: { ok: true } });

/** Answers every feedback POST with `answer` (changeable), and records the requests. */
async function mockFeedback(page: Page, first: Answer = created) {
  const requests: Request[] = [];
  const state = { answer: first };
  await page.route(FEEDBACK, async (route) => {
    if (route.request().method() === 'OPTIONS') return route.fulfill({ status: 204 });
    requests.push(route.request());
    await state.answer(route);
  });
  return { requests, set: (a: Answer) => (state.answer = a) };
}

async function openSheet(page: Page) {
  await page.goto('/');
  await page.getByTestId('tab-me').click();
  await expect(page.getByTestId('screen-me')).toBeVisible();
  await page.getByTestId('me-row-feedback').click();
  await expect(page.getByTestId('feedback-sheet')).toBeVisible();
}

const overflow = (page: Page) => page.evaluate(() => document.documentElement.scrollWidth - window.innerWidth);

test.describe('Send feedback (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('the row is last in More; a message goes with its topic and context, then thanks', async ({ page }) => {
    await mockApi(page);
    const fb = await mockFeedback(page);
    await page.goto('/');
    await page.getByTestId('tab-me').click();
    const row = page.getByTestId('me-row-feedback');
    await expect(row).toHaveText(/Send feedback/);
    await row.click();
    const sheet = page.getByTestId('feedback-sheet');
    await expect(sheet.getByRole('heading', { name: 'Send feedback' })).toBeVisible();

    const send = page.getByTestId('feedback-send');
    await expect(send).toHaveAttribute('aria-disabled', 'true');
    // Off, but still in the tab order, so a screen-reader or keyboard user finds it.
    await expect(send).toHaveAttribute('tabindex', '0');
    await send.focus();
    await page.keyboard.press('Enter');
    expect(fb.requests).toHaveLength(0);

    await expect(page.getByTestId('feedback-attached')).toContainText('app language English, Silver look');
    await expect(page.getByTestId('feedback-attached')).toContainText('not signed in');
    await page.getByTestId('feedback-topic-bug').click();
    await expect(page.getByTestId('feedback-topic-bug')).toHaveAttribute('aria-pressed', 'true');
    await page.getByTestId('feedback-input').fill('Highlights vanish in Graphite.');
    await expect(send).not.toHaveAttribute('aria-disabled', 'true');
    await send.click();

    await expect(page.getByTestId('feedback-thanks')).toContainText('Thanks for your feedback');
    expect(fb.requests).toHaveLength(1);
    const req = fb.requests[0]!;
    expect(req.method()).toBe('POST');
    expect(req.headers()['authorization']).toBeUndefined();
    expect(req.postDataJSON()).toEqual({
      message: 'Highlights vanish in Graphite.',
      category: 'bug',
      appVersion: expect.any(String),
      platform: 'web',
      language: 'en',
      preset: 'silver',
    });
    await page.getByTestId('feedback-done').click();
    await expect(page.getByTestId('feedback-sheet')).toHaveCount(0);
    // The draft was cleared by the send.
    await page.getByTestId('me-row-feedback').click();
    await expect(page.getByTestId('feedback-input')).toHaveValue('');
  });

  test('offline keeps the text; Send again goes through', async ({ page }) => {
    await mockApi(page);
    const fb = await mockFeedback(page, (route) => route.abort('internetdisconnected'));
    await openSheet(page);
    await page.getByTestId('feedback-input').fill('Keep this');
    await page.getByTestId('feedback-send').click();
    await expect(page.getByTestId('feedback-error')).toContainText('You’re offline. Your message is still here');
    await expect(page.getByTestId('feedback-error')).toHaveAttribute('role', 'alert');
    await expect(page.getByTestId('feedback-input')).toHaveValue('Keep this');
    fb.set(created);
    await page.getByTestId('feedback-send').click();
    await expect(page.getByTestId('feedback-thanks')).toBeVisible();
    expect(fb.requests).toHaveLength(2);
  });

  test('a rate-limited send says how long to wait; a server error says try again', async ({ page }) => {
    await mockApi(page);
    const fb = await mockFeedback(page, (route) =>
      route.fulfill({ status: 429, headers: { 'Retry-After': '400', 'Access-Control-Expose-Headers': 'Retry-After' }, json: { detail: 'x' } }),
    );
    await openSheet(page);
    await page.getByTestId('feedback-input').fill('Again');
    await page.getByTestId('feedback-send').click();
    await expect(page.getByTestId('feedback-error')).toContainText('Try again in 7 min. Your message is still here.');
    fb.set((route) => route.fulfill({ status: 503, json: { detail: 'down' } }));
    await page.getByTestId('feedback-send').click();
    await expect(page.getByTestId('feedback-error')).toContainText('Couldn’t send your feedback.');
    await expect(page.getByTestId('feedback-input')).toHaveValue('Again');
  });

  test('over the limit: nothing is cut, the counter says what to remove, Send is off', async ({ page }) => {
    await mockApi(page);
    const fb = await mockFeedback(page);
    await openSheet(page);
    await page.getByTestId('feedback-input').fill('a'.repeat(1962));
    await expect(page.getByTestId('feedback-counter')).toHaveText('38 characters left');
    await page.getByTestId('feedback-input').fill('a'.repeat(2112));
    await expect(page.getByTestId('feedback-counter')).toHaveText('Remove 112 characters to send. The limit is 2,000.');
    await expect(page.getByTestId('feedback-send')).toHaveAttribute('aria-disabled', 'true');
    await expect(page.getByTestId('feedback-input')).toHaveValue('a'.repeat(2112));
    // Screen readers hear it: the field is invalid and described by the counter, and the live region said it.
    await expect(page.getByTestId('feedback-input')).toHaveAttribute('aria-invalid', 'true');
    await expect(page.getByTestId('feedback-input')).toHaveAttribute('aria-describedby', 'feedback-counter-text');
    await expect(page.getByTestId('feedback-live')).toHaveText('Remove 112 characters to send. The limit is 2,000.');
    await page.getByTestId('feedback-send').focus();
    await page.keyboard.press('Enter');
    expect(fb.requests).toHaveLength(0);
  });

  test('from the keyboard: focus stays on Send through Sending and an error, with the preset’s own ring', async ({ page }) => {
    await mockApi(page);
    let release: () => void = () => undefined;
    await mockFeedback(page, (route) => new Promise<void>((r) => (release = r)).then(() => route.abort('internetdisconnected')));
    await openSheet(page);
    // The sheet moves focus to its heading once it has settled; start after that.
    await expect(page.getByTestId('feedback-sheet').getByRole('heading', { name: 'Send feedback' })).toBeFocused();
    await page.getByTestId('feedback-input').fill('From the keyboard');
    await page.getByTestId('feedback-send').focus();
    await page.keyboard.press('Enter');
    await expect(page.getByTestId('feedback-send')).toHaveAttribute('aria-busy', 'true');
    await expect(page.getByTestId('feedback-live')).toHaveText('Sending…');
    const focusedId = () => page.evaluate(() => document.activeElement?.getAttribute('data-testid') ?? document.activeElement?.tagName);
    expect(await focusedId()).toBe('feedback-send');
    release();
    await expect(page.getByTestId('feedback-error')).toBeVisible();
    expect(await focusedId()).toBe('feedback-send');
    // Silver's text colour (#111418), not the browser's amber. Desktop only: on the touch phone profile
    // react-native-web does not mark programmatic focus as keyboard focus.
    if (test.info().project.name !== 'phone') {
      const ring = await page.getByTestId('feedback-send').evaluate((el) => getComputedStyle(el).outlineColor);
      expect(ring).toBe('rgb(17, 20, 24)');
    }
  });

  test('Escape closes the sheet, and the draft comes back', async ({ page }) => {
    await mockApi(page);
    await mockFeedback(page);
    await openSheet(page);
    await page.getByTestId('feedback-topic-idea').click();
    await page.getByTestId('feedback-input').fill('Half a thought');
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('feedback-sheet')).toHaveCount(0);
    await expect(page.getByTestId('screen-me')).toBeVisible();
    await page.getByTestId('me-row-feedback').click();
    await expect(page.getByTestId('feedback-input')).toHaveValue('Half a thought');
    await expect(page.getByTestId('feedback-topic-idea')).toHaveAttribute('aria-pressed', 'true');
  });

  test('the privacy page says what feedback stores', async ({ page }) => {
    await mockApi(page);
    await page.goto('/privacy?lang=en');
    await expect(page.getByText(/If you send feedback from the Me tab, your message is stored in Cloud Firestore/)).toBeVisible();
  });
});

test.describe('Send feedback on a 375 px phone (Chinese, dark)', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'dark', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

  test('speaks Chinese, fits, and every control is at least 44 px', async ({ page }) => {
    await mockApi(page);
    const fb = await mockFeedback(page);
    await openSheet(page);
    const sheet = page.getByTestId('feedback-sheet');
    await expect(sheet.getByRole('heading', { name: '发送反馈' })).toBeVisible();
    await expect(page.getByTestId('feedback-topic-bug')).toHaveText(/故障/);
    await expect(page.getByTestId('feedback-attached')).toContainText('应用语言简体中文、石墨风格');
    expect(await overflow(page)).toBeLessThanOrEqual(0);
    for (const id of ['feedback-close', 'feedback-topic-bug', 'feedback-topic-idea', 'feedback-topic-other', 'feedback-send']) {
      const box = await page.getByTestId(id).boundingBox();
      expect(box, id).not.toBeNull();
      expect(box!.height, `${id} height`).toBeGreaterThanOrEqual(43.9);
      expect(box!.width, `${id} width`).toBeGreaterThanOrEqual(43.9);
      expect(box!.x + box!.width, `${id} right`).toBeLessThanOrEqual(375.5);
    }
    await page.getByTestId('feedback-input').fill('石墨风格下看不到高亮颜色。');
    await page.getByTestId('feedback-send').click();
    await expect(page.getByTestId('feedback-thanks')).toContainText('谢谢你的反馈');
    expect(fb.requests[0]!.postDataJSON()).toMatchObject({ language: 'zh-Hans', preset: 'graphite', platform: 'web' });
  });
});

test.describe('Send feedback for Under 13', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('the row is not there', async ({ page }) => {
    await mockApi(page);
    await seed(page, 'onboarding', { done: true, ageRange: 'under-13' });
    await page.goto('/');
    await page.getByTestId('tab-me').click();
    await expect(page.getByTestId('me-row-help')).toBeVisible();
    await expect(page.getByTestId('me-row-feedback')).toHaveCount(0);
  });
});
