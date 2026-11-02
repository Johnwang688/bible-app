// Verifier round 4 on the reader UI (GPT-6.1 Sol). Orchestrator-owned; do not edit.
import * as fs from 'fs';
import * as path from 'path';
import { expect, test } from '@playwright/test';

test.use({ locale: 'en-US' });

test('reader keys resume after returning from another tab', async ({ page }) => {
  const fixture = (name: string) =>
    JSON.parse(fs.readFileSync(path.resolve(
      __dirname, '../../tests/golden/fixtures', name + '.json',
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
  const header = page.getByTestId('reader-book-button');
  await expect(page.getByTestId('verse-1')).toBeVisible();
  await expect(header).toHaveText('Genesis 1');
  await page.keyboard.press('ArrowRight');
  await expect(header).toHaveText('Genesis 2');

  for (const tab of ['home', 'study', 'me']) {
    await page.getByTestId('tab-' + tab).click();
    await expect(page.getByTestId('screen-' + tab)).toBeVisible();
    await page.keyboard.press('ArrowRight');
    await page.keyboard.press('ArrowLeft');
    await page.getByTestId('tab-bible').click();
    await expect(page.getByTestId('screen-bible')).toBeVisible();
    await expect(header).toHaveText('Genesis 2');
    await page.keyboard.press('ArrowRight');
    await expect(header).toHaveText('Genesis 3');
    await page.keyboard.press('ArrowLeft');
    await expect(header).toHaveText('Genesis 2');
  }
});
