// Web e2e for R-5b: the commentary view in the verse sheet. Orchestrator-owned.
import { expect, test, type Page } from '@playwright/test';

import { body, mockApi, seed } from './helpers';

const JOHN3_MH = body('commentary_john3_mh') as { verse_start: number; source: string }[];

async function mockCommentary(page: Page) {
  await page.route(/\/api\/v1\/commentary\?/, (route) => {
    const url = new URL(route.request().url());
    const verse = Number(url.searchParams.get('verse') ?? 999);
    const book = url.searchParams.get('book');
    const chapter = url.searchParams.get('chapter');
    if (book !== 'John' || chapter !== '3') return route.fulfill({ json: [] });
    return route.fulfill({ json: JOHN3_MH.filter((e) => e.verse_start <= verse) });
  });
}

test.beforeEach(async ({ page }) => {
  await mockApi(page);
  await mockCommentary(page);
});

async function openCommentary(page: Page, verse: number) {
  await page.goto('/bible');
  await page.getByTestId(`verse-${verse}-tools`).click();
  await page.getByTestId('sheet-commentary').click();
  return page.getByTestId('commentary-view');
}

test.describe('Commentary (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });
  test.beforeEach(async ({ page }) => seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' }));

  test('shows Matthew Henry on the verse, and Read all shows the rest', async ({ page }) => {
    const view = await openCommentary(page, 3);
    await expect(view.getByTestId('commentary-range')).toHaveText('John 3:1–8');
    await expect(view.getByTestId('commentary-verse')).toContainText('born anew');
    await expect(view.getByText('Nicodemus was afraid', { exact: false })).toBeVisible();
    await expect(view.getByText('ye workers of iniquity', { exact: false })).toHaveCount(0);
    const readAll = view.getByTestId('commentary-read-all');
    const box = await readAll.boundingBox();
    expect(box!.height).toBeGreaterThanOrEqual(44);
    await readAll.click();
    await expect(view.getByText('ye workers of iniquity', { exact: false })).toHaveCount(1);
    await expect(readAll).toHaveCount(0);
  });

  test('says so where no note covers the verse', async ({ page }) => {
    const view = await openCommentary(page, 16);
    await expect(view.getByTestId('commentary-empty')).toContainText('No commentary on this verse yet');
    await expect(view.getByTestId('commentary-range')).toHaveText('John 3:16');
  });

  test('back returns to the verse’s actions, Escape steps back then closes', async ({ page }) => {
    const view = await openCommentary(page, 3);
    await view.getByTestId('commentary-back').click();
    await expect(page.getByTestId('sheet-commentary')).toBeVisible();
    await page.getByTestId('sheet-commentary').click();
    await expect(page.getByTestId('commentary-view')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('sheet-commentary')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
  });
});

test.describe('Commentary in Chinese', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'dark' });
  test.beforeEach(async ({ page }) => seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'CUV-SIMP' }));

  test('Chinese chrome, the CUV verse pinned, the English note marked 英文', async ({ page }) => {
    const view = await openCommentary(page, 3);
    await expect(view.getByText('注释', { exact: true })).toBeVisible();
    await expect(view.getByTestId('commentary-range')).toHaveText('约翰福音 3:1–8');
    await expect(view.getByTestId('commentary-verse')).toContainText('人若不重生');
    await expect(view.getByText('英文', { exact: true })).toBeVisible();
    await expect(view.getByTestId('commentary-read-all')).toHaveText('阅读全文');
  });
});
