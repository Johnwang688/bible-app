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
  await page.route('**/api/v1/words/**', (route) => {
    const p = decodeURIComponent(new URL(route.request().url()).pathname);
    if (p.endsWith('/John/3/16')) return route.fulfill({ json: body('words_john3_16') });
    if (p.endsWith('/Genesis/1/1')) return route.fulfill({ json: body('words_genesis1_1') });
    return route.fulfill({ json: { book: 'x', book_number: 1, chapter: 1, verse: 1, translation: 'BSB', words: [] } });
  });
  await page.route('**/api/v1/lexicon/**', (route) => route.fulfill({ json: body('lexicon_g0025') }));
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
    // A new reader is in BSB, which has no fixture, so the mock synthesises the text.
    await expect(page.getByText(synth('John', 3, 1, 'BSB'))).toBeVisible();
    await expect(page.getByTestId('reader-book-button')).toContainText('John 3');
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

  test('verses flow in one paragraph: a long verse wraps as text, not as a block', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    // An inline run that wraps has one client rect per line; an inline-block (a whole verse that
    // jumps to a new line) has just one.
    const rects = await page.evaluate(() => {
      const el = document.querySelector('[data-testid="verse-16"]')!;
      return Array.from(el.getClientRects()).length;
    });
    expect(rects).toBeGreaterThan(1);
    // And verse 17 starts on the line where verse 16 ends.
    const [end16, start17] = await page.evaluate(() => {
      const r16 = Array.from(document.querySelector('[data-testid="verse-16"]')!.getClientRects());
      const r17 = document.querySelector('[data-testid="verse-17"]')!.getClientRects()[0]!;
      return [r16[r16.length - 1]!.top, r17.top];
    });
    expect(Math.abs(end16! - start17!)).toBeLessThan(4);
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

test.describe('verse sheet (R-2)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('a highlight made in the verse sheet survives a reload', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByText(/For God so loved the world/).click();
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    await expect(page.getByTestId('verse-sheet').getByText('John 3:16')).toBeVisible();
    await page.getByTestId('sheet-swatch-yellow').click();
    await page.getByTestId('sheet-close').click();
    await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
    await page.reload();
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    const bg = await page.getByTestId('verse-16').evaluate((el) => getComputedStyle(el).backgroundColor);
    expect(bg).not.toBe('rgba(0, 0, 0, 0)');
  });

  test('Original words opens the word list and a word card', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-original-words').click();
    await expect(page.getByTestId('words-list')).toBeVisible();
    await page.getByTestId('words-list').getByText('loved', { exact: true }).click();
    await expect(page.getByTestId('word-card')).toBeVisible();
    await expect(page.getByText('Used 143 times in 110 verses')).toBeVisible();
  });

  test('the verse-tools button is a real button and Escape closes the sheet', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await expect(page.getByRole('button', { name: 'Verse 16: verse tools' })).toBeVisible();
    await expect(page.getByTestId('verse-16')).not.toHaveAttribute('role', 'link');
    await page.getByRole('button', { name: 'Verse 16: verse tools' }).click();
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
  });

  // Verifier round 1 on the verse sheet (GPT-6.1 Sol).
  test('R2 review F2: Escape restores the words list scroll and row focus', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.route('**/api/v1/words/**', route => {
      const data = body('words_john3_16');
      const template = data.words.find((w: { strongs: string }) => w.strongs === 'G0025');
      return route.fulfill({ json: { ...data, words: Array.from({ length: 80 }, (_, i) => ({
        ...template, english_order: i + 1, english: 'phrase ' + (i + 1), english_kind: 'text',
      })) } });
    });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-original-words').click();
    const row = page.getByTestId('word-row-40');
    await row.scrollIntoViewIfNeeded();
    const scrollTop = () => page.getByTestId('words-list').evaluate(el => {
      const nodes = [el, ...el.querySelectorAll('*')];
      const scroller = nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto');
      return scroller!.scrollTop;
    });
    const before = await scrollTop();
    expect(before).toBeGreaterThan(0);
    await row.click();
    await expect(page.getByTestId('word-card')).toBeVisible();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('words-list')).toBeVisible();
    await expect.poll(scrollTop).toBe(before);
    await expect(row).toBeFocused();
  });

  test('R2 review mutant guard: Back restores the words list scroll and row focus', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.route('**/api/v1/words/**', route => {
      const data = body('words_john3_16');
      const template = data.words.find((w: { strongs: string }) => w.strongs === 'G0025');
      return route.fulfill({ json: { ...data, words: Array.from({ length: 80 }, (_, i) => ({
        ...template, english_order: i + 1, english: 'phrase ' + (i + 1), english_kind: 'text',
      })) } });
    });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-original-words').click();
    const row = page.getByTestId('word-row-40');
    await row.scrollIntoViewIfNeeded();
    const scrollTop = () => page.getByTestId('words-list').evaluate(el => {
      const nodes = [el, ...el.querySelectorAll('*')];
      const scroller = nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto');
      return scroller!.scrollTop;
    });
    const before = await scrollTop();
    expect(before).toBeGreaterThan(0);
    await row.click();
    await expect(page.getByTestId('word-card')).toBeVisible();
    await page.getByTestId('word-back').click();
    await expect(page.getByTestId('words-list')).toBeVisible();
    await expect.poll(scrollTop).toBe(before);
    await expect(row).toBeFocused();
  });

  test('R2 review F3: tapping a second verse with the sheet open extends the selection (the chapter stays usable)', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    const point = await page.getByTestId('verse-17').evaluate((el) => {
      const r = Array.from(el.getClientRects()).find((x) => x.width > 5 && x.top >= 0 && x.top < innerHeight - 10)!;
      return { x: r.left + 3, y: r.top + 3 };
    });
    await page.mouse.click(point.x, point.y);
    await expect(page.getByTestId('verse-sheet').getByText('John 3:16–17', { exact: true })).toBeVisible();
  });

  test('keyboard users open the verse sheet from the verse-tools button with Enter', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByRole('button', { name: 'Verse 16: verse tools' }).focus();
    await page.keyboard.press('Enter');
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
  });
});

test.describe('verse sheet labels at 150% display scale (John’s setting)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light', viewport: { width: 375, height: 812 }, deviceScaleFactor: 1.5 });

  for (const preset of ['strawberry-milk', 'silver']) {
  test(`verse sheet action labels fit on one line, never breaking a word (${preset})`, async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await seed(page, 'appearance', { preset, mode: 'light' });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    // Fonts load on first use; measure only once the label's own font has loaded.
    await page.waitForFunction(() => {
      const btn = document.querySelector('[data-testid="sheet-bookmark"]');
      const leaf = btn && Array.from(btn.querySelectorAll('*')).find((e) => e.childElementCount === 0 && e.textContent!.trim());
      if (!leaf) return false;
      const cs = getComputedStyle(leaf);
      return document.fonts.check(`${cs.fontWeight} ${cs.fontSize} ${cs.fontFamily}`);
    });
    await page.evaluate(() => document.fonts.ready);
    const labels = await page.evaluate(() =>
      ['sheet-note', 'sheet-bookmark', 'sheet-copy', 'sheet-share', 'sheet-original-words'].map((id) => {
        const btn = document.querySelector(`[data-testid="${id}"]`)!;
        const leaves = Array.from(btn.querySelectorAll('*')).filter((e) => e.childElementCount === 0 && e.textContent!.trim());
        return leaves.map((e) => {
          const cs = getComputedStyle(e);
          return { id, text: e.textContent, lines: Math.round(e.getBoundingClientRect().height / (parseFloat(cs.lineHeight) || parseFloat(cs.fontSize) * 1.2)) };
        });
      }).flat(),
    );
    for (const l of labels) {
      // A two-word label may wrap onto two lines; a one-word label must not.
      const max = l.text!.trim().includes(' ') ? 2 : 1;
      expect([l.id, l.text, l.lines <= max]).toEqual([l.id, l.text, true]);
    }
  });
  }

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
