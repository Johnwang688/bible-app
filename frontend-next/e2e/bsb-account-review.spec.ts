// Regression tests from Sol review round 1 of HG-3b (F1). Owned by the orchestrator: do not edit.
// A signed-in reader on a device with no saved position must get their account's translation, not the new BSB default.
import type { Page } from '@playwright/test';
import { expect, test } from './fixtures';
import me from './mocks/me.json';
import settings from './mocks/user-settings.json';
import johnAsv from './mocks/chapter-john-3-asv.json';

test.use({ seedWebPosition: false });

type Remote = { recentTranslation?: string; progressTranslation?: string };

async function signedInWithRemote(page: Page, remote: Remote) {
  await page.addInitScript(() => {
    localStorage.setItem('bible-app-auth-session', JSON.stringify({
      accessToken: 'e2e-access-token',
      refreshToken: 'e2e-refresh-token',
      userId: '00000000-0000-4000-8000-000000000001',
      email: 'e2e@example.com',
    }));
  });
  // The profile field is never written by the app, so it must not decide the translation.
  await page.route('**/api/v1/chapters/John/3?translation=ASV', route => route.fulfill({ json: johnAsv }));
  await page.route('**/api/v1/me', route => route.fulfill({ json: { ...me, preferred_translation: 'WEB' } }));
  await page.route('**/api/v1/study-items', route => {
    if (route.request().method() !== 'GET') return route.fallback();
    return route.fulfill({
      json: [{ id: 1, user_id: me.id, translation: 'WEB', book_number: 43, chapter: 3, verse_start: 16, verse_end: 16, kind: 'bookmark' }],
    });
  });
  await page.route('**/api/v1/reading-progress', route => {
    if (route.request().method() !== 'GET') return route.fallback();
    return route.fulfill({
      json: remote.progressTranslation
        ? [{ book_number: 43, chapter: 3, translation: remote.progressTranslation, last_verse: 1, updated_at: '2026-10-30T12:00:00Z' }]
        : [],
    });
  });
  await page.route('**/api/v1/user-settings', route => {
    if (route.request().method() !== 'GET') return route.fallback();
    return route.fulfill({
      json: {
        ...settings,
        recent_passages: remote.recentTranslation
          ? [
              { book: 'John', chapter: 3, translation: remote.recentTranslation, saved_at: '2026-10-30T12:00:00Z' },
              { book: 'Genesis', chapter: 1, translation: 'CUV', saved_at: '2026-10-29T12:00:00Z' },
            ]
          : [],
      },
    });
  });
  await page.goto('/app');
  await page.getByRole('button', { name: 'Bible reader' }).click();
  // Remote state has been applied once the bookmark lands locally.
  await expect.poll(() => page.evaluate(() => JSON.parse(localStorage.getItem('bible-app-bookmarks') ?? '[]'))).toContain('john::3::16');
}

const storedTranslation = (page: Page) =>
  page.evaluate(() => JSON.parse(localStorage.getItem('bible-app-last-position') ?? 'null')?.translation);

test('F1: no reading progress: the newest recent passage\'s WEB is restored', async ({ page }) => {
  await signedInWithRemote(page, { recentTranslation: 'WEB' });
  await expect.poll(() => storedTranslation(page)).toBe('WEB');
  await expect(page.getByRole('button', { name: 'WEB' })).toBeVisible();
});

test('F1: no reading progress: the newest recent passage\'s ASV is restored', async ({ page }) => {
  await signedInWithRemote(page, { recentTranslation: 'ASV' });
  await expect.poll(() => storedTranslation(page)).toBe('ASV');
});

test('F1: reading progress still wins over recent passages', async ({ page }) => {
  await signedInWithRemote(page, { progressTranslation: 'ASV', recentTranslation: 'WEB' });
  await expect.poll(() => storedTranslation(page)).toBe('ASV');
});

test('F1: an account with no progress and no recent passages starts in the BSB', async ({ page }) => {
  await signedInWithRemote(page, {});
  await expect(page.getByRole('button', { name: 'BSB' })).toBeVisible();
  await expect.poll(() => storedTranslation(page)).toBe('BSB');
});
