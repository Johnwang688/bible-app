// Regression tests from the HG-3a verifier review, round 2 (Sol): verse popup placement. Owned by the orchestrator: do not edit.
import type { Page } from '@playwright/test';
import { expect, openReaderAt, test, verse } from './fixtures';

async function words(page: Page) {
  await openReaderAt(page, 'John', 3);
  await verse(page, 16).click();
  await page.getByRole('button', { name: 'Original words', exact: true }).click();
  await expect(page.locator('.side-scroll').first().getByRole('button', { name: /loved/ })).toBeVisible();
  await page.waitForTimeout(400);
}
const popup = (page: Page) => page.locator('.verse-study-popup');

for (const side of ['right', 'left']) {
  test(`F1: a wide ${side} pane at 800px keeps the popup inside the reader`, async ({ page }) => {
    await page.addInitScript((s) => localStorage.setItem('bible-app-reader-settings', JSON.stringify({ sidePanelPosition: s })), side);
    await page.setViewportSize({ width: 800, height: 900 });
    await words(page);
    const b = (await page.locator('.pane-divider').boundingBox())!;
    await page.mouse.move(b.x + b.width / 2, b.y + b.height / 2);
    await page.mouse.down();
    await page.mouse.move(side === 'right' ? 224 : 576, b.y + b.height / 2, { steps: 10 });
    await page.mouse.up();
    await verse(page, 20).click();
    await page.waitForTimeout(250);
    const p = (await popup(page).boundingBox())!;
    const s = (await page.locator('.side-pane.open').boundingBox())!;
    expect(p.x).toBeGreaterThanOrEqual(0);
    expect(p.x + p.width).toBeLessThanOrEqual(800);
    if (side === 'right') expect(p.x + p.width).toBeLessThanOrEqual(s.x + 1);
    else expect(p.x).toBeGreaterThanOrEqual(s.x + s.width - 1);
  });
}

test('F1: an open popup stays inside the viewport after a window resize', async ({ page }) => {
  await page.addInitScript(() => localStorage.setItem('bible-app-reader-settings', JSON.stringify({ sidePanelPosition: 'left' })));
  await words(page);
  await verse(page, 20).click();
  await page.waitForTimeout(250);
  await page.setViewportSize({ width: 720, height: 900 });
  await page.waitForTimeout(500);
  const p = (await popup(page).boundingBox())!;
  expect(p.x).toBeGreaterThanOrEqual(0);
  expect(p.x + p.width).toBeLessThanOrEqual(720);
});

test('F2: on a short viewport the popup stays below the top bar', async ({ page }) => {
  await openReaderAt(page, 'John', 3);
  await page.setViewportSize({ width: 1400, height: 280 });
  await verse(page, 20).click();
  await page.mouse.move(700, 5);
  await page.waitForTimeout(300);
  const p = (await popup(page).boundingBox())!;
  const h = await page.locator('.topbar').evaluate((el) => (el as HTMLElement).offsetHeight);
  expect(p.y).toBeGreaterThanOrEqual(h);
});

test('F3: beside the words pane, the popup does not cover the verse it describes', async ({ page }) => {
  await words(page);
  await verse(page, 20).click();
  await page.waitForTimeout(250);
  const p = (await popup(page).boundingBox())!;
  const v = (await verse(page, 20).boundingBox())!;
  const ow = Math.max(0, Math.min(p.x + p.width, v.x + v.width) - Math.max(p.x, v.x));
  const oh = Math.max(0, Math.min(p.y + p.height, v.y + v.height) - Math.max(p.y, v.y));
  expect(ow * oh).toBe(0);
});

test('F4: a left-side pane is respected too', async ({ page }) => {
  await page.addInitScript(() => localStorage.setItem('bible-app-reader-settings', JSON.stringify({ sidePanelPosition: 'left' })));
  await words(page);
  await verse(page, 20).click();
  await page.waitForTimeout(300);
  const p = (await popup(page).boundingBox())!;
  const s = (await page.locator('.side-pane.open').boundingBox())!;
  expect(p.x).toBeGreaterThanOrEqual(s.x + s.width - 1);
});
