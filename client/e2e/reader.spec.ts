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

/**
 * Records where the words list is scrolled when the next press lands on it. A click can scroll its target into view
 * again first (under load the list reflows as the Greek font arrives), so the place to come back to is the list as
 * it was at the press, not an earlier reading (GAPS, board 11-03).
 */
async function recordScrollAtPress(page: Page) {
  await page.evaluate(() => {
    document.addEventListener(
      'pointerdown',
      () => {
        const list = document.querySelector('[data-testid="words-list"]');
        const nodes = list ? [list, ...list.querySelectorAll('*')] : [];
        const scroller = nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto');
        (window as unknown as { scrollAtPress?: number }).scrollAtPress = scroller?.scrollTop;
      },
      { capture: true, once: true },
    );
  });
}

const scrollAtPress = (page: Page) => page.evaluate(() => (window as unknown as { scrollAtPress?: number }).scrollAtPress ?? -1);

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

  test('the Bible tab text never sits under the tab bar at the end of the chapter', async ({ page }, testInfo) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    const next = page.getByTestId('reader-next');
    await expect(page.getByText(/For God so loved the world/)).toBeVisible();
    // Scroll to the very end of the chapter.
    await page.getByText(/For God so loved the world/).hover();
    for (let i = 0; i < 12; i++) await page.mouse.wheel(0, 4000);
    await expect(next).toBeVisible();
    if (testInfo.project.name === 'desktop') {
      await expect(page.getByTestId('bottom-bar-background')).toHaveCount(0);
      const end = page.getByTestId(/^verse-\d+$/).last();
      await expect(end).toBeInViewport({ ratio: 1 });
      const uncovered = await end.evaluate((el) => {
        const range = document.createRange(); range.selectNodeContents(el);
        const rect = Array.from(range.getClientRects()).filter((r) => r.width > 0 && r.height > 0).at(-1)!;
        if (rect.bottom > window.innerHeight || rect.top < 0) return false;
        // Hit-test across the last line: a player or any other overlay must not cover Scripture.
        for (let x = rect.left + 1; x < rect.right; x += 8) {
          const hit = document.elementFromPoint(x, rect.top + rect.height / 2);
          if (!hit || !el.contains(hit)) return false;
        }
        return true;
      });
      expect(uncovered).toBe(true);
    } else {
      const tab = await page.getByLabel('Bible tab', { exact: true }).boundingBox();
      const btn = await next.boundingBox();
      expect(btn!.y + btn!.height).toBeLessThanOrEqual(tab!.y + 1);
    }
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
    await recordScrollAtPress(page);
    const scrollTop = () => page.getByTestId('words-list').evaluate(el => {
      const nodes = [el, ...el.querySelectorAll('*')];
      const scroller = nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto');
      return scroller!.scrollTop;
    });
    await row.click();
    const before = await scrollAtPress(page);
    expect(before).toBeGreaterThan(0);
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
    await recordScrollAtPress(page);
    const scrollTop = () => page.getByTestId('words-list').evaluate(el => {
      const nodes = [el, ...el.querySelectorAll('*')];
      const scroller = nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto');
      return scroller!.scrollTop;
    });
    await row.click();
    const before = await scrollAtPress(page);
    expect(before).toBeGreaterThan(0);
    await expect(page.getByTestId('word-card')).toBeVisible();
    await page.getByTestId('word-back').click();
    await expect(page.getByTestId('words-list')).toBeVisible();
    await expect.poll(scrollTop).toBe(before);
    await expect(row).toBeFocused();
  });

  test('R2 review F3: tapping a second verse with the sheet open extends the selection (the chapter stays usable)', async ({ page }, testInfo) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    // A point on verse 17 that the sheet does not cover, once nothing moves: the sheet slides in, and the chapter
    // makes room for it, for a while after it is first visible (longer under load), so a point read at once could
    // be under the sheet by the time of the click (GAPS: the flake under a full gate).
    const pointOn17 = () => page.getByTestId('verse-17').evaluate((el) => {
      for (const r of Array.from(el.getClientRects())) {
        if (r.width <= 5 || r.top < 0) continue;
        const x = r.left + 3;
        const y = r.top + r.height / 2;
        if (el.contains(document.elementFromPoint(x, y))) return `${Math.round(x)},${Math.round(y)}`;
      }
      return null;
    });
    let point: string | null = null;
    await expect.poll(async () => {
      const first = await pointOn17();
      await page.waitForTimeout(150);
      const second = await pointOn17();
      point = first !== null && first === second ? second : null;
      return point;
    }, { timeout: 10_000 }).not.toBeNull();
    const [x, y] = point!.split(',').map(Number);
    await page.mouse.click(x!, y!);
    if (testInfo.project.name === 'desktop') {
      await expect(page.getByTestId('verse-16-tools')).toHaveAttribute('aria-selected', 'false');
      await expect(page.getByTestId('verse-17-tools')).toHaveAttribute('aria-selected', 'true');
      await expect(page.getByTestId('verse-sheet').getByText('John 3:17', { exact: true })).toBeVisible();
      await page.getByTestId('verse-16-tools').click({ modifiers: ['Shift'] });
    }
    await expect(page.getByTestId('verse-sheet').getByText('John 3:16–17', { exact: true })).toBeVisible();
  });

  for (const preset of ['silver', 'strawberry-milk']) {
    test(`nothing covers the verse sheet: its last row is the topmost element (${preset})`, async ({ page }) => {
      await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
      await seed(page, 'appearance', { preset, mode: 'light' });
      await page.goto('/bible');
      await page.getByTestId('verse-16-tools').click();
      const row = page.getByTestId('sheet-commentary');
      await expect(row).toBeVisible();
      await expect(row).toBeInViewport({ ratio: 1 });
      const covered = await row.evaluate((el) => {
        const r = el.getBoundingClientRect();
        const hit = document.elementFromPoint(r.left + r.width / 2, r.top + r.height / 2);
        return !(hit && el.contains(hit));
      });
      expect(covered).toBe(false);
    });
  }

  // Verifier round 2 on the verse sheet (GPT-6.1 Sol).
  test('R2 round2: chapter change restores arrow navigation', async ({ page }) => {
    await page.emulateMedia({ reducedMotion: 'reduce' });
    await seed(page, 'reader.position', {
      bookNumber: 43, chapter: 3, translation: 'WEB',
    });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await expect(
      page.getByTestId('verse-sheet').getByRole('heading'),
    ).toBeFocused();

    if (await page.getByTestId('reader-show-controls').count()) {
      await page.getByTestId('reader-show-controls').click();
    }
    await page.getByTestId('reader-book-button').click();
    await page.getByTestId('picker-chapter-4').click();

    await expect(page.getByTestId('reader-book-button'))
      .toContainText('John 4');
    await expect(page.getByTestId('verse-sheet')).toHaveCount(0);

    await page.keyboard.press('ArrowRight');
    await expect(page.getByTestId('reader-book-button'))
      .toContainText('John 5');
  });

  test('R2 round2: picker Escape preserves the underlying verse sheet', async ({ page }) => {
    await page.emulateMedia({ reducedMotion: 'reduce' });
    await seed(page, 'reader.position', {
      bookNumber: 43, chapter: 3, translation: 'WEB',
    });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await expect(
      page.getByTestId('verse-sheet').getByRole('heading'),
    ).toBeFocused();

    if (await page.getByTestId('reader-show-controls').count()) {
      await page.getByTestId('reader-show-controls').click();
    }
    await page.getByTestId('reader-book-button').click();
    await expect(page.getByTestId('book-picker')).toBeVisible();
    await page.getByTestId('picker-close').focus();
    await page.keyboard.press('Escape');

    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    await expect(page.getByTestId('book-picker')).toHaveCount(0);
  });

  test('keyboard users open the verse sheet from the verse-tools button with Enter', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByRole('button', { name: 'Verse 16: verse tools' }).focus();
    await page.keyboard.press('Enter');
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
  });

  // GAPS (board 11-03): the flaky "restores the words list scroll" tests. React Native Web's ScrollView reports a
  // scroll's end 100 ms later, from a timer it never clears; a word opened inside that window got the detached
  // list's offset (0) as the place to come back to. The clock holds that timer until the word card is open.
  test('GAPS: a word opened right after a scroll still comes back to the same place', async ({ page }) => {
    await page.clock.install();
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
    await recordScrollAtPress(page);
    const scrollTop = () => page.getByTestId('words-list').evaluate(el => {
      const nodes = [el, ...el.querySelectorAll('*')];
      const scroller = nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto');
      return scroller!.scrollTop;
    });
    await row.click();
    const before = await scrollAtPress(page);
    expect(before).toBeGreaterThan(0);
    await expect(page.getByTestId('word-card')).toBeVisible();
    await page.clock.runFor(500); // the list's late scroll-end report fires now, with the list gone
    await page.getByTestId('word-back').click();
    await expect(page.getByTestId('words-list')).toBeVisible();
    await page.clock.runFor(50);
    await expect.poll(scrollTop).toBe(before);
    await expect(row).toBeFocused();
  });

  // GAPS follow-up (the #44 gate flake: back one row short): React Native Web reports a scroll at most every 16 ms and
  // the rest only at its end, 100 ms later. With the clock paused, a second scroll is never reported; the word opened
  // after it must still bring the list back to where it was at the press.
  test('GAPS: back returns to a scroll made just before the press, though it was never reported', async ({ page }) => {
    await page.clock.install();
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
    const scrollTop = () => page.getByTestId('words-list').evaluate(el => {
      const nodes = [el, ...el.querySelectorAll('*')];
      const scroller = nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto');
      return scroller!.scrollTop;
    });
    // Held from here: the first scroll is reported (it starts the scroll); the second is not (its 16 ms never pass,
    // and the scroll-end timer never runs).
    await expect(page.getByTestId('word-row-40')).toBeAttached();
    await page.clock.pauseAt(Date.now() + 1000);
    await page.getByTestId('words-list').evaluate(el => {
      const nodes = [el, ...el.querySelectorAll('*')];
      nodes.find(n => n.scrollHeight > n.clientHeight + 50 && getComputedStyle(n).overflowY === 'auto')!.scrollTop = 400;
    });
    await page.waitForTimeout(100);
    const row = page.getByTestId('word-row-40');
    await row.scrollIntoViewIfNeeded();
    await page.waitForTimeout(100);
    await recordScrollAtPress(page);
    await row.click();
    const before = await scrollAtPress(page);
    expect(before).toBeGreaterThan(400);
    await expect(page.getByTestId('word-card')).toBeVisible();
    await page.getByTestId('word-back').click();
    await expect(page.getByTestId('words-list')).toBeVisible();
    await page.clock.runFor(50);
    await expect.poll(scrollTop).toBe(before);
  });

  // GAPS (board 11-03), the R-2 gap: a chapter change while a note is half-written keeps the draft.
  test('GAPS: a chapter change keeps the unsaved note; it comes back on that verse until saved', async ({ page }) => {
    await page.emulateMedia({ reducedMotion: 'reduce' });
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-note').click();
    await page.getByTestId('note-input').fill('Half a thou');

    const goToChapter = async (chapter: number) => {
      if (await page.getByTestId('reader-show-controls').count()) await page.getByTestId('reader-show-controls').click();
      await page.getByTestId('reader-book-button').click();
      await page.getByTestId(`picker-chapter-${chapter}`).click();
      await expect(page.getByTestId('reader-book-button')).toContainText(`John ${chapter}`);
    };
    await goToChapter(4);
    await expect(page.getByTestId('verse-sheet')).toHaveCount(0);
    await goToChapter(3);

    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-note').click();
    await expect(page.getByTestId('note-input')).toHaveValue('Half a thou');
    await expect(page.getByTestId('note-draft')).toBeVisible();
    await page.getByTestId('note-input').fill('Half a thought, finished');
    await page.getByTestId('note-save').click();

    await page.getByTestId('sheet-note').click();
    await expect(page.getByTestId('note-input')).toHaveValue('Half a thought, finished');
    await expect(page.getByTestId('note-draft')).toHaveCount(0);
  });

  // GAPS (board 11-03): Escape is one shared stack now, heard from inside the note field too. It steps back to the
  // actions (one layer), and the typing is kept as the draft.
  test('GAPS: Escape in the note field steps back one view and keeps the draft', async ({ page }) => {
    await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation: 'WEB' });
    await page.goto('/bible');
    await page.getByTestId('verse-16-tools').click();
    await page.getByTestId('sheet-note').click();
    await page.getByTestId('note-input').fill('Typed');
    await page.getByTestId('note-input').focus();
    await page.keyboard.press('Escape');
    await expect(page.getByTestId('note-editor')).toHaveCount(0);
    await expect(page.getByTestId('verse-sheet')).toBeVisible();
    await page.getByTestId('sheet-note').click();
    await expect(page.getByTestId('note-input')).toHaveValue('Typed');
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
    await expect(page.getByTestId('reader-book-button')).toContainText('创世记 1');
    await expect(page.getByText(synth('Genesis', 1, 1, 'CUV-SIMP'))).toBeVisible();
    await expect(page.getByLabel('阅读设置')).toBeVisible();
  });
});
