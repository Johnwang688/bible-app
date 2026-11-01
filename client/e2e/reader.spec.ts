// Web e2e for the R-1 reader against the web export, with the API mocked from the golden fixtures.
import * as fs from 'fs';
import * as path from 'path';

import { expect, test, type Page } from '@playwright/test';

const FIXTURES = path.resolve(__dirname, '../../tests/golden/fixtures');
const body = (name: string) => JSON.parse(fs.readFileSync(path.join(FIXTURES, `${name}.json`), 'utf8')).body;
const BOOKS = body('books') as { book_number: number; name: string }[];
const FIXTURE_CHAPTERS: Record<string, string> = {
  'John 3 WEB': 'chapter_john3_web',
  'John 3 CUV-SIMP': 'chapter_john3_cuvsimp',
  'John 3 CUV': 'chapter_john3_cuv',
};
const synth = (book: string, chapter: number, verse: number, tr: string) => `${book} ${chapter}:${verse} ${tr}`;

async function mockApi(page: Page) {
  await page.route('**/api/v1/books', (route) => route.fulfill({ json: BOOKS }));
  await page.route('**/api/v1/chapters/**', (route) => {
    const url = new URL(route.request().url());
    const [, , , , bookRaw, chRaw] = url.pathname.split('/');
    const bookName = decodeURIComponent(bookRaw!);
    const chapter = Number(chRaw);
    const tr = url.searchParams.get('translation') ?? 'BSB';
    const fx = FIXTURE_CHAPTERS[`${bookName} ${chapter} ${tr}`];
    if (fx) return route.fulfill({ json: body(fx) });
    const b = BOOKS.find((x) => x.name.toLowerCase() === bookName.toLowerCase())!;
    return route.fulfill({
      json: {
        book: b.name,
        book_number: b.book_number,
        chapter,
        translation: tr,
        total_verses: 3,
        verses: [1, 2, 3].map((v) => ({ id: v, book: b.name, book_number: b.book_number, chapter, verse: v, text: synth(b.name, chapter, v, tr), translation: tr })),
      },
    });
  });
}

const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;
async function seed(page: Page, key: string, data: unknown) {
  await page.addInitScript(([k, v]) => {
    if (!sessionStorage.getItem('seeded:' + k)) {
      localStorage.setItem(k, v);
      sessionStorage.setItem('seeded:' + k, '1');
    }
  }, [storageKey(key), JSON.stringify({ v: 1, data })] as const);
}

test.beforeEach(async ({ page }) => mockApi(page));

test.describe('reader (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('opens Genesis 1 for a new reader and keeps the place across a reload', async ({ page }) => {
    await page.goto('/bible');
    await expect(page.getByText(synth('Genesis', 1, 1, 'BSB'))).toBeVisible();
    await page.getByTestId('reader-next').click();
    await expect(page.getByText(synth('Genesis', 2, 1, 'BSB'))).toBeVisible();
    await page.reload();
    await expect(page.getByText(synth('Genesis', 2, 1, 'BSB'))).toBeVisible();
  });

  test('picks a passage from the book picker', async ({ page }) => {
    await page.goto('/bible');
    await page.getByTestId('reader-book-button').click();
    await page.getByTestId('picker-testament-NT').click();
    await page.getByTestId('picker-book-43').click();
    await page.getByTestId('picker-chapter-3').click();
    await expect(page.getByText(/For God so loved the world/)).toBeVisible({ timeout: 10_000 });
  });

  test('turns chapters with the arrow keys', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 4, translation: 'BSB' });
    await page.goto('/bible');
    await expect(page.getByText(synth('John', 4, 1, 'BSB'))).toBeVisible();
    await page.keyboard.press('ArrowRight');
    await expect(page.getByText(synth('John', 5, 1, 'BSB'))).toBeVisible();
    await page.keyboard.press('ArrowLeft');
    await page.keyboard.press('ArrowLeft');
    await expect(page.getByText(synth('John', 3, 1, 'BSB'))).toBeVisible();
  });

  test('parallel reading: interleaved on a phone, two columns on a wide screen', async ({ page }, info) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await seed(page, 'reader.settings', { textSize: 2, parallel: 'CUV-SIMP' });
    await page.goto('/bible');
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    await expect(page.getByText(/神爱世人/)).toBeVisible();
    if (info.project.name === 'desktop') await expect(page.getByTestId('parallel-columns')).toBeVisible();
    else await expect(page.getByTestId('parallel-columns')).toHaveCount(0);
    // Verse 16 of both translations sit in the same row.
    const row = page.getByTestId('verse-row-16');
    await expect(row.getByText(/For God so loved/)).toBeVisible();
    await expect(row.getByText(/神爱世人/)).toBeVisible();
  });

  test('the Bible tab text never sits under the tab bar at the end of the chapter', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    const next = page.getByTestId('reader-next');
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    // Scroll to the very end of the chapter.
    await page.getByText(/For God so loved the world/).hover();
    for (let i = 0; i < 12; i++) await page.mouse.wheel(0, 4000);
    await expect(next).toBeVisible();
    const tab = await page.getByLabel('Bible tab', { exact: true }).boundingBox();
    const btn = await next.boundingBox();
    expect(btn!.y + btn!.height).toBeLessThanOrEqual(tab!.y + 1);
  });
});

test.describe('reader (Chinese phone)', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'light' });

  test('a new Chinese reader starts in CUV-SIMP with Chinese book names', async ({ page }) => {
    await page.goto('/bible');
    await expect(page.getByTestId('reader-book-button')).toContainText('创世纪 1');
    await expect(page.getByText(synth('Genesis', 1, 1, 'CUV-SIMP'))).toBeVisible();
    await expect(page.getByLabel('阅读设置')).toBeVisible();
  });
});
