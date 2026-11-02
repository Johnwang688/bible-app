// Verifier round 3 on the reader UI (GPT-6.1 Sol). Orchestrator-owned; do not edit.
import * as fs from 'fs';
import * as path from 'path';
import { expect, test } from '@playwright/test';

test.use({ locale: 'en-US' });

test('arrows on Home preserve the reader position', async ({ page }) => {
  const fixture = (name: string) =>
    JSON.parse(fs.readFileSync(path.resolve(
      __dirname, '../../tests/golden/fixtures', `${name}.json`,
    ), 'utf8')).body;

  await page.route('**/api/v1/books', route =>
    route.fulfill({ json: fixture('books') }));

  await page.route('**/api/v1/chapters/**', route => {
    const url = new URL(route.request().url());
    const chapter = Number(url.pathname.split('/').at(-1));
    const translation = url.searchParams.get('translation') ?? 'BSB';
    const base = fixture('chapter_genesis1_web');

    return route.fulfill({
      json: {
        ...base, chapter, translation,
        verses: base.verses.map((verse: object) => ({
          ...verse, chapter, translation,
        })),
      },
    });
  });

  await page.goto('/bible');
  await expect(page.getByTestId('verse-1')).toBeVisible();
  await expect(page.getByTestId('reader-book-button'))
    .toHaveText('Genesis 1');

  await page.getByTestId('tab-home').click();
  await expect(page.getByTestId('screen-home')).toBeVisible();
  await page.keyboard.press('ArrowRight');
  await page.getByTestId('tab-bible').click();

  await expect(page.getByTestId('reader-book-button'))
    .toHaveText('Genesis 1');
});
