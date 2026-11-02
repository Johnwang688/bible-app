// Web e2e for the Memory screens (team MEM, orchestrator-owned): the entry in Study, Memory home in the Study
// tab's stack, the week, a day's lesson done by typing, and the voice notices. Implementers may not edit it.
import { expect, test } from '@playwright/test';

import { mockApi, seed, stored } from './helpers';

test.beforeEach(async ({ page }) => mockApi(page));

test.describe('Memory home (English)', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('Study has a Memory entry that opens Memory home inside the Study tab', async ({ page }) => {
    await page.goto('/study');
    await page.getByTestId('study-memory-entry').click();
    await expect(page).toHaveURL(/\/study\/memory$/);
    await expect(page.getByTestId('memory-home')).toBeVisible();
    await expect(page.getByTestId('memory-lesson-card')).toContainText('Your first lesson');
    // The tab bar stays, with Study selected.
    await expect(page.getByTestId('tab-study')).toBeVisible();
    await expect(page.getByTestId('memory-row-2-corinthians-5-17')).toBeVisible();
  });

  test('the streak chip opens the week; it has its own address', async ({ page }) => {
    await page.goto('/study/memory');
    await page.getByTestId('memory-streak-chip').click();
    await expect(page).toHaveURL(/\/study\/memory\/week$/);
    await expect(page.getByTestId('memory-week')).toBeVisible();
    await expect(page.getByTestId('memory-week-today')).toBeVisible();
  });

  test('settings: turning voice off is stored', async ({ page }) => {
    await page.goto('/study/memory');
    await page.getByTestId('memory-settings-button').click();
    await page.getByTestId('memory-voice-switch').click();
    await expect(page.getByTestId('memory-voice-switch')).toHaveAttribute('aria-checked', 'false');
    await expect.poll(() => stored<{ voice: boolean }>(page, 'memory.settings')).toMatchObject({ voice: false });
  });

  test('large text: the home scrolls and nothing is cut off sideways', async ({ page }) => {
    await page.goto('/study/memory');
    await page.evaluate(() => {
      document.documentElement.style.fontSize = '200%';
    });
    const overflow = await page.evaluate(() => document.documentElement.scrollWidth - document.documentElement.clientWidth);
    expect(overflow).toBeLessThanOrEqual(0);
  });
});

test.describe('Memory home (Chinese)', () => {
  test.use({ locale: 'zh-CN', colorScheme: 'dark' });

  test('shows in Chinese', async ({ page }) => {
    await page.goto('/study/memory');
    await expect(page.getByTestId('memory-lesson-card')).toContainText('第一课');
  });
});

test.describe('Memory lesson by typing', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('chunk order: place the phrases, check, and the step is ticked', async ({ page }) => {
    await page.goto('/study/memory');
    await page.getByTestId('memory-lesson-start').click();
    await expect(page).toHaveURL(/\/memory\/lesson\/[a-z0-9-]+\/chunk-order\?/);
    // Trainers hide the tab bar.
    await expect(page.getByTestId('tab-study')).toBeHidden();
    await expect(page.getByTestId('memory-step')).toContainText(/1 of \d+/);
    const chips = page.getByTestId(/^chunk-chip-\d+$/);
    const n = await chips.count();
    expect(n).toBeGreaterThan(1);
    for (let pos = 0; pos < n; pos++) await page.getByTestId(`chunk-chip-${pos}`).click();
    await page.getByTestId('chunk-check').click();
    await expect(page.getByTestId('memory-result')).toContainText('Correct');
    const lesson = await stored<{ steps: { completedAt: string | null }[] }>(page, 'memory.lesson');
    expect(lesson?.steps[0]?.completedAt).not.toBeNull();
    await page.getByTestId('memory-next').click();
    await expect(page).toHaveURL(/i=1/);
  });

  test('fill-in, signed out: the signed-out notice stands in the mic’s place; typing passes the step', async ({ page }) => {
    const verse = '2-corinthians-5-17';
    await page.goto(`/memory/lesson/${verse}/fill-blank`);
    await expect(page.getByTestId('memory-notice-signed-out')).toBeVisible();
    await expect(page.getByTestId('memory-mic')).toHaveCount(0);
    const blank = Number(await page.getByTestId('memory-blank').getAttribute('data-position'));
    const chunks = ['若有人在基督里', '他就是新造的人', '旧事已过，都变成新的了'];
    await page.getByTestId('memory-type-input').fill(chunks[blank]!);
    await page.getByTestId('memory-type-check').click();
    await expect(page.getByTestId('memory-result')).toContainText('Correct');
    await expect(page.getByTestId('memory-result')).toContainText('100%');
    // Free practice: Next goes back to Memory home.
    await page.getByTestId('memory-next').click();
    await expect(page).toHaveURL(/\/study\/memory$/);
    const progress = await stored<Record<string, { successes: number }>>(page, 'memory.progress');
    expect(progress?.[verse]?.successes).toBe(1);
  });

  test('full recall typed with the reference passes; without it fails with "Heard differently? Type it"', async ({ page }) => {
    const verse = '2-timothy-3-16';
    await page.goto(`/memory/lesson/${verse}/full-recall`);
    await page.getByTestId('memory-type-input').fill('圣经都是神所默示的，于教训、督责、使人归正、教导人学义都是有益的。');
    await page.getByTestId('memory-type-check').click();
    await expect(page.getByTestId('memory-result')).toContainText(/No reference heard|reference/i);
    await page.getByTestId('memory-try-again').click();
    await page.getByTestId('memory-type-input').fill('提摩太后书3:16 圣经都是神所默示的，于教训、督责、使人归正、教导人学义都是有益的。');
    await page.getByTestId('memory-type-check').click();
    await expect(page.getByTestId('memory-result')).toContainText('Correct');
  });

  test('Back mid-lesson returns to Memory with "Progress saved"', async ({ page }) => {
    await page.goto('/study/memory');
    await page.getByTestId('memory-lesson-start').click();
    await page.getByTestId('memory-back').click();
    await expect(page).toHaveURL(/\/study\/memory$/);
    await expect(page.getByTestId('memory-saved-toast')).toContainText('Progress saved');
  });

  test('voice off: the voice-off notice, and Memory settings opens over the trainer', async ({ page }) => {
    await seed(page, 'memory.settings', { speech: 'mandarin', script: 'simplified', voice: false, voiceConsent: false }, 2);
    await page.goto('/memory/lesson/2-corinthians-5-17/fill-blank');
    await expect(page.getByTestId('memory-notice-voice-off')).toBeVisible();
    await page.getByTestId('memory-notice-settings').click();
    await expect(page.getByTestId('memory-settings-sheet')).toBeVisible();
    await expect(page).toHaveURL(/fill-blank/);
  });
});
