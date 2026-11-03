// Web e2e for R-5: search from the reader header. Orchestrator-owned.
import { expect, test, type Page } from '@playwright/test';

import { mockEntities } from './entityMocks';
import { body, mockApi, seed } from './helpers';

// John 3:16 first, so the result opens a chapter the mock has whole (John 3 WEB).
const LOVE = [
  { relevance: 9, verse: { id: 43003016, book: 'John', book_number: 43, chapter: 3, verse: 16, text: 'For God so loved the world, that he gave his one and only Son', translation: 'WEB' } },
  ...body('search_love_web'),
];
const CHINESE = body('search_chinese_cuvsimp');

async function mockSearch(page: Page, fail = false) {
  const seen: { query: string; translation: string }[] = [];
  await page.route('**/api/v1/search', async (route) => {
    const req = route.request().postDataJSON() as { query: string; translation: string };
    seen.push({ query: req.query, translation: req.translation });
    if (fail) return route.fulfill({ status: 503, json: { detail: 'down' } });
    if (/[一-鿿]/.test(req.query)) return route.fulfill({ json: CHINESE });
    if (req.query.toLowerCase().startsWith('love')) return route.fulfill({ json: LOVE });
    return route.fulfill({ json: [] });
  });
  return seen;
}

test.beforeEach(async ({ page }) => mockApi(page));

test.describe('Search (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });
  test.beforeEach(async ({ page }) => seed(page, 'reader.position', { bookNumber: 1, chapter: 1, translation: 'WEB' }));

  test('the header button opens search with the field focused; back returns to the reader', async ({ page }) => {
    await mockSearch(page);
    await page.goto('/bible');
    const button = page.getByTestId('reader-search-button');
    await expect(button).toHaveAccessibleName('Search');
    const box = await button.boundingBox();
    expect(box!.width).toBeGreaterThanOrEqual(44);
    expect(box!.height).toBeGreaterThanOrEqual(44);
    await button.click();
    await expect(page).toHaveURL(/\/search$/);
    await expect(page.getByTestId('search-input')).toBeFocused();
    await page.getByTestId('search-back').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('reader-header')).toBeVisible();
  });

  test('a reference opens in context, with the verses selected and in view', async ({ page }) => {
    const seen = await mockSearch(page);
    await page.goto('/search');
    await page.getByTestId('search-input').fill('jn 3:16');
    await expect(page.getByTestId('search-passage-0')).toContainText('John 3:16');
    await page.getByTestId('search-passage-0').click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('verse-16')).toBeInViewport();
    await expect(page.getByTestId('verse-16-tools')).toHaveAttribute('aria-selected', 'true');
    expect(seen).toEqual([]);
  });

  test('Enter opens a typed reference', async ({ page }) => {
    await mockSearch(page);
    await page.goto('/search');
    await page.getByTestId('search-input').fill('John 3:16');
    await page.getByTestId('search-input').press('Enter');
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('verse-16-tools')).toHaveAttribute('aria-selected', 'true');
  });

  test('words search the reader’s translation; a result opens in context', async ({ page }) => {
    const seen = await mockSearch(page);
    await page.goto('/search');
    await page.getByTestId('search-input').fill('love');
    const first = page.getByTestId(/^search-verse-\d+-\d+-\d+$/).first();
    await expect(first).toBeVisible();
    expect(seen.at(-1)).toEqual({ query: 'love', translation: 'WEB' });
    await expect(first).toHaveAttribute('data-testid', 'search-verse-43-3-16');
    await first.click();
    await expect(page).toHaveURL(/\/bible$/);
    await expect(page.getByTestId('verse-16')).toBeInViewport();
    await expect(page.getByTestId('verse-16-tools')).toHaveAttribute('aria-selected', 'true');
  });

  test('people, places and themes come after the verses and open their page', async ({ page }) => {
    await mockSearch(page);
    await mockEntities(page);
    await page.goto('/search');
    await page.getByTestId('search-input').fill('love');
    await expect(page.getByTestId(/^search-verse-/).first()).toBeVisible();
    const group = page.getByTestId('search-entities');
    await expect(group).toBeVisible();
    const verses = await page.getByTestId('search-verses').boundingBox();
    const names = await group.boundingBox();
    expect(names!.y).toBeGreaterThan(verses!.y);
    const row = page.getByTestId(/^search-entity-theme-/).first();
    const id = await row.getAttribute('data-testid');
    await row.click();
    await expect(page).toHaveURL(new RegExp(`/entities/theme/${id!.replace('search-entity-theme-', '')}$`));
    await expect(page.getByTestId('screen-entity')).toBeVisible();
    await page.getByTestId('entity-back').click();
    await expect(page).toHaveURL(/\/search$/);
  });

  test('Escape goes back', async ({ page }) => {
    await mockSearch(page);
    await page.goto('/bible');
    await page.getByTestId('reader-search-button').click();
    await expect(page.getByTestId('search-input')).toBeFocused();
    await page.keyboard.press('Escape');
    await expect(page).toHaveURL(/\/bible$/);
  });

  test('a failed search shows Try again and keeps the passages', async ({ page }) => {
    await mockSearch(page, true);
    await page.goto('/search');
    await page.getByTestId('search-input').fill('John');
    await expect(page.getByTestId('search-error')).toBeVisible();
    await expect(page.getByTestId('search-passage-0')).toContainText('John');
  });
});

test.describe('Search in Chinese', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'dark' });
  test.beforeEach(async ({ page }) => seed(page, 'reader.position', { bookNumber: 43, chapter: 1, translation: 'CUV-SIMP' }));

  test('Chinese references and words', async ({ page }) => {
    const seen = await mockSearch(page);
    await page.goto('/search');
    await expect(page.getByTestId('search-input')).toHaveAttribute('placeholder', '经文出处或关键词');
    await page.getByTestId('search-input').fill('约翰福音 3');
    await expect(page.getByTestId('search-passage-0')).toContainText('约翰福音 3');
    await page.getByTestId('search-input').fill('神爱世人');
    await expect(page.getByTestId('search-verse-43-3-16')).toContainText('约翰福音 3:16');
    expect(seen.at(-1)).toEqual({ query: '神爱世人', translation: 'CUV-SIMP' });
  });
});

for (const [locale, name] of [['en-US', 'English'], ['zh-CN', 'Chinese']] as const) {
  test.describe(`Search layout at 150% display scale (${name})`, () => {
    test.use({ locale, viewport: { width: 260, height: 560 }, deviceScaleFactor: 1.5 });
    test('nothing runs off the screen', async ({ page }) => {
      await mockSearch(page);
      await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
      await seed(page, 'reader.recent', [{ bookNumber: 43, chapter: 3, translation: 'WEB' }]);
      await page.goto('/search');
      const width = await page.evaluate(() => document.documentElement.scrollWidth);
      expect(width).toBeLessThanOrEqual(260);
      await page.getByTestId('search-input').fill('love');
      await expect(page.getByTestId(/^search-verse-/).first()).toBeVisible();
      expect(await page.evaluate(() => document.documentElement.scrollWidth)).toBeLessThanOrEqual(260);
    });
  });
}
