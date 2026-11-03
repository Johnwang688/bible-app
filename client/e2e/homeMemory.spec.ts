// Web e2e for Home's Memory card and the one-row Surprise me (GAPS, design home-memory-card.html variant B,
// John 2026-11-02): the three lesson states, the card's one accessible name, and the whole Home above the tab bar.
import { expect, test, type Page } from '@playwright/test';

import { mockApi, seed } from './helpers';

const PRESETS = [
  'strawberry-milk', 'matcha-latte', 'lavender-haze', 'bubblegum-night', 'matcha-night', 'grape-soda',
  'silver', 'graphite', 'sky', 'deep-blue', 'liberty', 'northern-lights',
] as const;

const TODAY = '2026-11-04';
const AT = '2026-11-04T08:00:00.000Z';

/** Today's lesson: 2 Corinthians 5:17 in three steps, then a review of Galatians 2:20; the first `done` ticked. */
function lesson(done: number) {
  const steps = [
    { verseId: '2-corinthians-5-17', stage: 'chunk-order' },
    { verseId: '2-corinthians-5-17', stage: 'fill-blank' },
    { verseId: '2-corinthians-5-17', stage: 'full-recall' },
    { verseId: 'galatians-2-20', stage: 'full-recall' },
  ].map((s, i) => ({ ...s, completedAt: i < done ? AT : null }));
  return { date: TODAY, steps, completedAt: done >= steps.length ? AT : null };
}

test.beforeEach(async ({ page }) => {
  await mockApi(page);
  await page.clock.install({ time: new Date(2026, 10, 4, 9, 0) });
});

test.describe('Home: the Memory card (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('a new lesson: Start opens its first step', async ({ page }) => {
    await seed(page, 'memory.lesson', lesson(0));
    await page.goto('/');
    const card = page.getByRole('button', { name: 'Start Memory lesson, 2 Corinthians 5:17', exact: true });
    await expect(card).toBeVisible();
    await expect(page.getByTestId('home-memory-sub')).toHaveText('Step 1 of 4');
    await expect(page.getByTestId('home-memory-action')).toHaveText('Start');
    await card.click();
    await expect(page).toHaveURL(/\/memory\/lesson\/2-corinthians-5-17\/chunk-order/);
  });

  test('part-way: Continue opens the next step', async ({ page }) => {
    await seed(page, 'memory.lesson', lesson(1));
    await page.goto('/');
    const card = page.getByRole('button', { name: 'Continue Memory lesson, 2 Corinthians 5:17', exact: true });
    await expect(card).toBeVisible();
    await expect(page.getByTestId('home-memory-sub')).toHaveText('Step 2 of 4');
    await expect(page.getByTestId('home-memory-action')).toHaveText('Continue');
    await card.click();
    await expect(page).toHaveURL(/\/memory\/lesson\/2-corinthians-5-17\/fill-blank/);
  });

  test('done for today: Week opens Memory’s week', async ({ page }) => {
    await seed(page, 'memory.lesson', lesson(4));
    await page.goto('/');
    const card = page.getByRole('button', { name: 'See the week', exact: true });
    await expect(card).toBeVisible();
    await expect(page.getByTestId('home-memory-sub')).toHaveText('Done for today');
    await expect(page.getByTestId('home-memory-action')).toHaveText('Week');
    await card.click();
    await expect(page).toHaveURL(/\/study\/memory\/week$/);
  });

  test('the card is one control: its button is hidden from screen readers', async ({ page }) => {
    await seed(page, 'memory.lesson', lesson(0));
    await page.goto('/');
    await expect(page.getByTestId('home-memory')).toBeVisible();
    await expect(page.getByTestId('home-memory').getByRole('button')).toHaveCount(0);
    await expect(page.getByTestId('home-memory-action')).toHaveAttribute('aria-hidden', 'true');
    const box = (await page.getByTestId('home-memory').boundingBox())!;
    expect(box.height).toBeGreaterThanOrEqual(48);
    await expect(page.getByRole('button', { name: 'Take me somewhere new', exact: true })).toBeVisible();
    await expect(page.getByRole('button', { name: 'Continue reading John 3', exact: true })).toBeVisible();
  });
});

/** The bottom of the last card is above the top of the tab bar, with the page not scrolled. */
async function expectAllAboveTabBar(page: Page) {
  await expect(page.getByTestId('home-memory')).toBeVisible();
  await expect(page.getByTestId('home-votd-text')).toBeVisible();
  const last = (await page.getByTestId('home-surprise').boundingBox())!;
  const tab = (await page.getByTestId('tab-home').boundingBox())!;
  expect(last.y + last.height).toBeLessThanOrEqual(tab.y);
}

for (const [lang, locale, translation] of [
  ['English', 'en-US', 'WEB'],
  ['Chinese', 'zh-CN', 'CUV-SIMP'],
] as const) {
  test.describe(`Home fits above the tab bar at 390×844 (${lang})`, () => {
    test.use({ locale, viewport: { width: 390, height: 844 } });

    for (const preset of PRESETS) {
      test(`${preset}`, async ({ page }) => {
        await seed(page, 'appearance', { preset, mode: 'system' });
        await seed(page, 'reader.position', { bookNumber: 43, chapter: 3, translation });
        await seed(page, 'memory.lesson', lesson(1));
        await page.goto('/');
        await expectAllAboveTabBar(page);
      });
    }
  });
}
