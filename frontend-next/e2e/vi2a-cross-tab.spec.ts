// Regression test from Sol review round 2 of VI-2a: a theme picked in another tab reaches this tab's picker and account sync. Owned by the orchestrator: do not edit.
import path from 'node:path';
import type { Page } from '@playwright/test';
import { test, expect, revealTaskbar } from './fixtures';
import { installMocks } from './mocks';
import auth from './mocks/auth-session.json';

async function openSettings(page: Page) {
  await page.goto('/app');
  await page.addStyleTag({
    content: 'nextjs-portal { display: none !important; }',
  });
  await page.getByRole('button', { name: 'Bible reader' }).click();
  await expect(page.locator('.verse-line').first()).toBeVisible();
  await revealTaskbar(page);
  await page.getByRole('button', { name: 'Settings', exact: true }).click();
}

test('cross-tab choice updates the picker and outgoing account theme',
  async ({ page, context }) => {
    await context.addInitScript((session) => {
      if (localStorage.getItem('theme') === null) {
        localStorage.setItem('theme', 'light');
      }
      localStorage.setItem('bible-app-onboarding-complete', '1');
      localStorage.setItem('bible-app-last-position', JSON.stringify({
        book: 'Genesis', chapter: 1, translation: 'WEB',
      }));
      localStorage.setItem('bible-app-auth-session', JSON.stringify({
        accessToken: session.access_token,
        refreshToken: session.refresh_token,
        userId: session.user_id,
        email: session.email,
      }));
    }, auth);

    await openSettings(page);

    const other = await context.newPage();
    try {
      await other.routeFromHAR(path.join(__dirname, 'fixtures', 'api.har'), {
        url: '**/api/v1/**',
        notFound: 'abort',
      });
      await installMocks(other);
      await openSettings(other);
      await other.getByRole('button', { name: 'Dark', exact: true }).click();

      await expect(page.locator('html')).toHaveAttribute('data-theme', 'dark');
      await expect(page.locator('.taskbar-btn-brand img'))
        .toHaveAttribute('src', /openbible-logo-white\.png$/);

      const outgoing = page.waitForRequest(request =>
        request.url().endsWith('/api/v1/user-settings') &&
        request.method() === 'PUT' &&
        request.postDataJSON()?.font_scale === '16'
      );
      await page.getByLabel('Text size').selectOption('16');

      expect({
        selected: await page.locator('.theme-card.selected .theme-name')
          .textContent(),
        pushed: (await outgoing).postDataJSON().theme,
      }).toEqual({ selected: 'Dark', pushed: 'dark' });
    } finally {
      await other.close();
    }
  });
