// Shared e2e helpers (R-3 on): the API mocked from the golden fixtures, and seeding stored values.
// (reader.spec.ts keeps its own copy from R-1/R-2.)
import * as fs from 'fs';
import * as path from 'path';

import type { Page } from '@playwright/test';

const FIXTURES = path.resolve(__dirname, '../../tests/golden/fixtures');
export const body = (name: string) => JSON.parse(fs.readFileSync(path.join(FIXTURES, `${name}.json`), 'utf8')).body;
export const BOOKS = body('books') as { book_number: number; name: string }[];
const FIXTURE_CHAPTERS: Record<string, string> = {
  'John 3 WEB': 'chapter_john3_web',
  'John 3 CUV-SIMP': 'chapter_john3_cuvsimp',
  'John 3 CUV': 'chapter_john3_cuv',
};
export const synth = (book: string, chapter: number, verse: number, tr: string) => `${book} ${chapter}:${verse} ${tr}`;

export async function mockApi(page: Page) {
  await page.route('**/api/v1/books', (route) => route.fulfill({ json: BOOKS }));
  await page.route('**/api/v1/words/**', (route) =>
    route.fulfill({ json: { book: 'x', book_number: 1, chapter: 1, verse: 1, translation: 'BSB', words: [] } }),
  );
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

export const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;

/** Stores `data` under `key` (at `version`) before the first load only, so reloads see the app's own writes. */
export async function seed(page: Page, key: string, data: unknown, version = 1) {
  await page.addInitScript(
    ([k, v]) => {
      if (!sessionStorage.getItem('seeded:' + k)) {
        localStorage.setItem(k, v);
        sessionStorage.setItem('seeded:' + k, '1');
      }
    },
    [storageKey(key), JSON.stringify({ v: version, data })] as const,
  );
}

/** A stored value as the app wrote it (the envelope's data), or null. */
export async function stored<T>(page: Page, key: string): Promise<T | null> {
  const raw = await page.evaluate((k) => localStorage.getItem(k), storageKey(key));
  return raw ? (JSON.parse(raw) as { data: T }).data : null;
}
