// Acceptance (orchestrator-owned, R-7a): the moving aurora behind the glass presets on the web.
import { expect, test, type Page } from '@playwright/test';

/** MMKV's web build keeps each value in localStorage under `bible-app` + one backslash + `<key>`. */
const storageKey = (key: string) => `bible-app${String.fromCharCode(92)}${key}`;

async function seed(page: Page, key: string, v: number, data: unknown) {
  await page.addInitScript(([k, value]) => localStorage.setItem(k, value), [
    storageKey(key),
    JSON.stringify({ v, data }),
  ] as const);
}

/** Fails the test on any page error or console error. */
function watchErrors(page: Page): string[] {
  const errors: string[] = [];
  page.on('pageerror', (e) => errors.push(String(e)));
  page.on('console', (m) => {
    // Home now loads data, and the e2e build's API origin is a closed local port (scripts/gate.mjs).
    if (m.type() === 'error' && !m.text().includes('net::ERR_CONNECTION_REFUSED')) errors.push(m.text());
  });
  return errors;
}

const canvasIn = (page: Page, screen: string) => page.getByTestId(screen).getByTestId('aurora-canvas');
const attr = (page: Page, screen: string, name: string) => canvasIn(page, screen).getAttribute(name);
const frames = async (page: Page, screen: string) => Number(await attr(page, screen, 'data-aurora-frames'));

test.describe('aurora', () => {
  test.use({ locale: 'en-US', colorScheme: 'light' });

  test('runs the fluid simulation by default behind Home, at half resolution', async ({ page }) => {
    const errors = watchErrors(page);
    await page.goto('/');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'running');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-style', 'fluid');
    const first = await frames(page, 'screen-home');
    await page.waitForTimeout(1000);
    expect(await frames(page, 'screen-home')).toBeGreaterThan(first + 10);

    const size = await canvasIn(page, 'screen-home').evaluate((el) => {
      const c = el as HTMLCanvasElement;
      const r = c.getBoundingClientRect();
      return { w: c.width, h: c.height, cssW: r.width, cssH: r.height, dpr: window.devicePixelRatio };
    });
    const scale = Math.min(size.dpr, 2) * 0.5;
    expect(Math.abs(size.w - size.cssW * scale)).toBeLessThanOrEqual(2);
    expect(Math.abs(size.h - size.cssH * scale)).toBeLessThanOrEqual(2);
    // The canvas fills the screen behind the content.
    const screen = await page.getByTestId('screen-home').boundingBox();
    expect(Math.abs(size.cssW - screen!.width)).toBeLessThanOrEqual(1);
    expect(errors).toEqual([]);
  });

  test('stirring with a drag keeps it running without errors', async ({ page }) => {
    const errors = watchErrors(page);
    await page.goto('/');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'running');
    const box = (await page.getByTestId('screen-home').boundingBox())!;
    await page.mouse.move(box.x + box.width * 0.3, box.y + box.height * 0.5);
    await page.mouse.down();
    for (let i = 1; i <= 10; i++) await page.mouse.move(box.x + box.width * (0.3 + i * 0.04), box.y + box.height * 0.5);
    await page.mouse.up();
    const before = await frames(page, 'screen-home');
    await page.waitForTimeout(300);
    expect(await frames(page, 'screen-home')).toBeGreaterThan(before);
    expect(errors).toEqual([]);
  });

  test('runs the flow shader when that is the chosen style', async ({ page }) => {
    await seed(page, 'aurora.style', 1, 'flow');
    await page.goto('/');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-style', 'flow');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'running');
  });

  test('pauses when the tab is left or the page is hidden, and resumes', async ({ page }) => {
    await page.goto('/');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'running');
    await page.getByTestId('tab-me').click();
    await expect(page.getByTestId('screen-me')).toBeVisible();
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'paused');
    await expect(canvasIn(page, 'screen-me')).toHaveAttribute('data-aurora-state', 'running');
    const paused = await frames(page, 'screen-home');
    await page.waitForTimeout(500);
    expect(await frames(page, 'screen-home')).toBe(paused);

    await page.evaluate(() => {
      Object.defineProperty(document, 'visibilityState', { value: 'hidden', configurable: true });
      Object.defineProperty(document, 'hidden', { value: true, configurable: true });
      document.dispatchEvent(new Event('visibilitychange'));
    });
    await expect(canvasIn(page, 'screen-me')).toHaveAttribute('data-aurora-state', 'paused');
    await page.evaluate(() => {
      Object.defineProperty(document, 'visibilityState', { value: 'visible', configurable: true });
      Object.defineProperty(document, 'hidden', { value: false, configurable: true });
      document.dispatchEvent(new Event('visibilitychange'));
    });
    await expect(canvasIn(page, 'screen-me')).toHaveAttribute('data-aurora-state', 'running');

    await page.getByTestId('tab-home').click();
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'running');
  });

  test('falls back to the still gradient when the GPU context is lost, and comes back', async ({ page }) => {
    const errors = watchErrors(page);
    await page.goto('/');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'running');
    await canvasIn(page, 'screen-home').evaluate((el) => {
      const gl = (el as HTMLCanvasElement).getContext('webgl2');
      (window as unknown as { __lose: unknown }).__lose = gl?.getExtension('WEBGL_lose_context');
      (gl?.getExtension('WEBGL_lose_context') as { loseContext(): void } | null)?.loseContext();
    });
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'off');
    await page.evaluate(() => (window as unknown as { __lose: { restoreContext(): void } }).__lose.restoreContext());
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'running');
    expect(errors).toEqual([]);
  });

  test('gives the title on the aurora a soft shadow', async ({ page }) => {
    await page.goto('/');
    const shadow = await page.getByTestId('home-greeting').evaluate((el) => getComputedStyle(el).textShadow);
    expect(shadow).not.toBe('none');
  });

  test('is not behind Scripture, and not in a pastel look', async ({ page }) => {
    await page.goto('/bible');
    await expect(page.getByTestId('screen-bible')).toBeVisible();
    await expect(page.getByTestId('screen-bible').getByTestId('aurora-canvas')).toHaveCount(0);
  });

  test('is absent in a pastel look', async ({ page }) => {
    await seed(page, 'appearance', 1, { preset: 'matcha-latte', mode: 'system' });
    await page.goto('/');
    await expect(page.getByTestId('screen-home')).toBeVisible();
    await expect(page.getByTestId('aurora-canvas')).toHaveCount(0);
    const shadow = await page.getByTestId('home-greeting').evaluate((el) => getComputedStyle(el).textShadow);
    expect(shadow).toBe('none');
  });
});

test.describe('aurora under Reduce Motion', () => {
  test.use({ locale: 'en-US', colorScheme: 'dark', reducedMotion: 'reduce' });

  test('shows one still frame and does not animate', async ({ page }) => {
    await page.goto('/');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-state', 'still');
    await expect(canvasIn(page, 'screen-home')).toHaveAttribute('data-aurora-frames', '1');
    await page.waitForTimeout(800);
    expect(await frames(page, 'screen-home')).toBe(1);
  });
});
