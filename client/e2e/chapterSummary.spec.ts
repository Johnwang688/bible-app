import { expect, test, type Page } from '@playwright/test';

import { mockApi, seed } from './helpers';

const CONTENT = 'TITLE::Life in the Son\n\nJesus speaks to Nicodemus about new birth.\n\nThemes: hidden-theme\nKey People: hidden-person\nKey Places: hidden-place\n\nKey Points:\n• God loves the world.\n• Believe in the Son.\n\nSupporting Verses: John 3:16-18 · John 3:36';
const ROW = { id: 91001, book_number: 43, chapter: 3, verse_start: 1, verse_end: 36, source: 'summary', content: CONTENT };

async function setup(page: Page, opts: { chinese?: boolean; state?: 'error' | 'empty' | 'loading' } = {}) {
  await mockApi(page);
  await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: opts.chinese ? 'CUV-SIMP' : 'WEB' });
  await seed(page, 'language', opts.chinese ? 'zh-Hans' : 'en');
  const seen: string[] = [];
  let state = opts.state;
  let release: () => void = () => {};
  const loading = new Promise<void>((resolve) => { release = resolve; });
  await page.route(/\/api\/v1\/commentary\?/, async (route) => {
    const url = new URL(route.request().url());
    seen.push(url.search);
    if (url.searchParams.get('source') !== 'summary') return route.fulfill({ json: [] });
    if (state === 'loading') await loading;
    if (state === 'error') return route.fulfill({ status: 400, json: { detail: 'down' } });
    return route.fulfill({ json: state === 'empty' ? [] : [ROW] });
  });
  await page.goto('/bible');
  await expect(page.getByTestId('verse-1')).toBeVisible();
  return { seen, recover: () => { state = undefined; release(); } };
}

async function tools(page: Page) {
  await page.getByTestId('reader-tools-button').click();
  await expect(page.getByTestId('chapter-summary-open')).toBeVisible();
  await page.getByTestId('chapter-summary-open').click();
}

test('tools opens the same sheet; ordered content, reference range jump and focus', async ({ page }) => {
  const { seen } = await setup(page);
  await tools(page);
  const view = page.getByTestId('summary-view');
  await expect(view.getByTestId('summary-content-title')).toHaveText('Life in the Son');
  await expect(page.getByTestId('chapter-tools-sheet')).toHaveCount(1);
  await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
  await expect(view).not.toContainText('hidden-');
  expect(seen.some((s) => { const p = new URLSearchParams(s); return p.get('source') === 'summary' && p.get('book') === 'John' && p.get('chapter') === '3' && !p.has('verse'); })).toBe(true);
  const order = await view.locator('[data-testid="summary-content-title"], [data-testid="summary-points"], [data-testid="summary-footnote"]').evaluateAll((els) => els.map((el) => el.getAttribute('data-testid')));
  expect(order).toEqual(['summary-content-title', 'summary-points', 'summary-footnote']);
  await expect(view.getByTestId('summary-reference-0')).toHaveAccessibleName('Read John 3:16–18, starting at verse 16');
  await view.getByTestId('summary-reference-0').click();
  await expect(page.getByTestId('chapter-tools-sheet')).toHaveCount(0);
  await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
  for (const n of [16, 17, 18]) await expect(page.getByTestId(`verse-${n}-tools`)).toHaveAttribute('aria-selected', 'true');
  await expect(page.getByTestId('verse-16-tools')).toBeFocused();
});

test('Escape and Back return to tools, restoring the entry row focus', async ({ page }) => {
  await setup(page);
  await tools(page);
  await expect(page.getByTestId('summary-content-title')).toBeVisible();
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('chapter-summary-open')).toBeFocused();
  await page.getByTestId('chapter-summary-open').click();
  await page.getByTestId('summary-back').click();
  await expect(page.getByTestId('chapter-summary-open')).toBeFocused();
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('chapter-tools-sheet')).toHaveCount(0);
  await expect(page.getByTestId('reader-tools-button')).toBeFocused();
});

test('commentary fallback stays in the verse sheet and keeps its back stack', async ({ page }) => {
  await setup(page);
  await page.getByTestId('verse-16-tools').click();
  await page.getByTestId('sheet-commentary').click();
  await expect(page.getByTestId('commentary-empty')).toContainText('No Matthew Henry note covers this verse.');
  await page.getByTestId('commentary-summary').click();
  await expect(page.getByTestId('summary-content-title')).toBeVisible();
  await expect(page.getByTestId('verse-sheet')).toHaveCount(1);
  await expect(page.getByTestId('chapter-tools-sheet')).toHaveCount(0);
  await page.getByTestId('summary-back').click();
  await expect(page.getByTestId('commentary-summary')).toBeVisible();
  await page.getByTestId('commentary-summary').click();
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('commentary-view')).toBeVisible();
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('sheet-actions')).toBeVisible();
  await page.keyboard.press('Escape');
  await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
});

test('fallback reference closes the verse sheet and selects the whole range', async ({ page }) => {
  await setup(page);
  await page.getByTestId('verse-16-tools').click();
  await page.getByTestId('sheet-commentary').click();
  await page.getByTestId('commentary-summary').click();
  await page.getByTestId('summary-reference-0').click();
  await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
  for (const n of [16, 17, 18]) await expect(page.getByTestId(`verse-${n}-tools`)).toHaveAttribute('aria-selected', 'true');
});

test('Chinese chrome and English badge keep the footnote punctuation and sentence labels', async ({ page }) => {
  await setup(page, { chinese: true });
  await tools(page);
  await expect(page.getByTestId('summary-chapter')).toHaveText('约翰福音 3');
  await expect(page.getByTestId('summary-view').getByText('英文', { exact: true })).toBeVisible();
  await expect(page.getByTestId('summary-footnote')).toHaveText('AI 撰写的章节概要。 已对照圣经经文核查，仍可能有错误。');
  await expect(page.getByTestId('summary-reference-0')).toHaveAccessibleName('阅读约翰福音 3:16–18，从第 16 节开始');
  await expect(page.getByTestId('summary-content-title')).toHaveAttribute('lang', 'en');
});

test('error Retry and no-summary state retain navigation', async ({ page }) => {
  const { recover } = await setup(page, { state: 'error' });
  await tools(page);
  await expect(page.getByTestId('summary-error')).toBeVisible();
  await page.keyboard.press('Escape');
  await page.getByTestId('chapter-summary-open').click();
  recover();
  await page.getByTestId('summary-retry').click();
  await expect(page.getByTestId('summary-content-title')).toBeVisible();
  await page.getByTestId('summary-close').click();
  await expect(page.getByTestId('chapter-tools-sheet')).toHaveCount(0);
});

test('missing summary has no Retry', async ({ page }) => {
  await setup(page, { state: 'empty' });
  await tools(page);
  await expect(page.getByTestId('summary-empty')).toBeVisible();
  await expect(page.getByTestId('summary-retry')).toHaveCount(0);
  await page.getByTestId('summary-back').click();
  await expect(page.getByTestId('chapter-summary-open')).toBeVisible();
});

test('loading keeps Back, Escape and Close available', async ({ page }) => {
  const { recover } = await setup(page, { state: 'loading' });
  try {
    await tools(page);
    await expect(page.getByTestId('summary-loading')).toBeVisible();
    await page.getByTestId('summary-back').click();
    await page.getByTestId('chapter-summary-open').click();
    await expect(page.getByTestId('summary-loading')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('chapter-summary-open')).toBeFocused();
    await page.getByTestId('chapter-summary-open').click();
    await page.getByTestId('summary-close').click();
    await expect(page.getByTestId('chapter-tools-sheet')).toHaveCount(0);
  } finally { recover(); }
});

test('desktop tools keeps the centred 440px modal; commentary keeps its dock', async ({ page }) => {
  await page.setViewportSize({ width: 1440, height: 900 });
  await setup(page);
  await tools(page);
  const sheet = page.getByTestId('chapter-tools-sheet');
  await expect(page.getByTestId('summary-content-title')).toBeVisible();
  await expect(sheet).toHaveAttribute('role', 'dialog');
  await expect(sheet).toHaveAttribute('aria-modal', 'true');
  const box = (await sheet.boundingBox())!;
  expect(box.width).toBe(440);
  expect(Math.abs(box.x + box.width / 2 - 720)).toBeLessThan(2);
  await page.getByTestId('summary-close').click();
  await page.getByTestId('verse-16-tools').click();
  await page.getByTestId('sheet-commentary').click();
  await page.getByTestId('commentary-summary').click();
  const dock = (await page.getByTestId('verse-sheet').boundingBox())!;
  expect(dock.width).toBe(328);
  expect(dock.x).toBe(1096);
});

test('summary reflows at 375px and in landscape with reduced motion', async ({ page }, testInfo) => {
  await page.setViewportSize({ width: 375, height: 812 });
  await page.emulateMedia({ reducedMotion: 'reduce' });
  await setup(page);
  await tools(page);
  await expect(page.getByTestId('summary-content-title')).toBeVisible();
  expect(await page.evaluate(() => document.documentElement.scrollWidth <= window.innerWidth)).toBe(true);
  await page.screenshot({ path: testInfo.outputPath('summary-phone.png') });
  await page.setViewportSize({ width: 812, height: 375 });
  await expect(page.getByTestId('summary-back')).toBeInViewport();
  await expect(page.getByTestId('summary-close')).toBeInViewport();
  await page.getByTestId('summary-reference-1').focus();
  await expect(page.getByTestId('summary-reference-1')).toBeInViewport();
  await page.screenshot({ path: testInfo.outputPath('summary-landscape.png') });
});

for (const preset of ['strawberry-milk', 'matcha-latte', 'lavender-haze', 'bubblegum-night', 'matcha-night', 'grape-soda', 'liberty', 'silver', 'sky', 'northern-lights', 'graphite', 'deep-blue']) {
  test(`${preset} controls have an outset focus ring`, async ({ page }) => {
    await seed(page, 'appearance', { preset, mode: ['bubblegum-night', 'matcha-night', 'grape-soda', 'northern-lights', 'graphite', 'deep-blue'].includes(preset) ? 'dark' : 'light' });
    await setup(page, { state: 'error' });
    await tools(page);
    await expect(page.getByTestId('summary-error')).toBeVisible();
    for (const id of ['summary-back', 'summary-close', 'summary-retry']) {
      const button = page.getByTestId(id);
      await button.focus();
      await expect(button).toHaveCSS('outline-style', 'solid');
      await expect(button).toHaveCSS('outline-width', '3px');
      await expect(button).toHaveCSS('outline-offset', '2px');
    }
    await page.getByTestId('summary-back').click();
    await page.getByTestId('chapter-summary-open').focus();
    await expect(page.getByTestId('chapter-summary-open')).toHaveCSS('outline-width', '3px');
  });
}
