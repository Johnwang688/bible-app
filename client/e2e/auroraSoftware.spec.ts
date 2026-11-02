// Acceptance (orchestrator-owned, R-7a): with no GPU (Chromium's SwiftShader software renderer), the aurora
// does not run the fluid simulation on the CPU; it uses the lighter flow shader.
import { expect, test } from '@playwright/test';

test.use({ locale: 'en-US', colorScheme: 'light', launchOptions: { args: [] } });

test('falls back from the fluid simulation to the flow shader on a software renderer', async ({ page }) => {
  const renderer = await page.evaluate(() => {
    const gl = document.createElement('canvas').getContext('webgl2');
    const ext = gl?.getExtension('WEBGL_debug_renderer_info');
    return ext ? String(gl!.getParameter(ext.UNMASKED_RENDERER_WEBGL)) : '';
  });
  test.skip(!/swiftshader/i.test(renderer), `not a software renderer here: ${renderer}`);
  await page.goto('/');
  const canvas = page.getByTestId('screen-home').getByTestId('aurora-canvas');
  await expect(canvas).toHaveAttribute('data-aurora-state', 'running');
  await expect(canvas).toHaveAttribute('data-aurora-style', 'flow');
});

// R-7a follow-up (John, 11-02): with no GPU the aurora keeps moving, at 30 fps, not a still gradient.
async function softwareOrSkip(page: import('@playwright/test').Page) {
  const renderer = await page.evaluate(() => {
    const gl = document.createElement('canvas').getContext('webgl2');
    const ext = gl?.getExtension('WEBGL_debug_renderer_info');
    return ext ? String(gl!.getParameter(ext.UNMASKED_RENDERER_WEBGL)) : '';
  });
  test.skip(!/swiftshader/i.test(renderer), `not a software renderer here: ${renderer}`);
}

test('keeps animating at about 30 fps on a software renderer', async ({ page }) => {
  await softwareOrSkip(page);
  await page.goto('/');
  const canvas = page.getByTestId('screen-home').getByTestId('aurora-canvas');
  await expect(canvas).toHaveAttribute('data-aurora-state', 'running');
  await page.waitForTimeout(1000);
  const frames = async () => Number(await canvas.getAttribute('data-aurora-frames'));
  const t0 = Date.now();
  const f0 = await frames();
  await page.waitForTimeout(3000);
  const fps = ((await frames()) - f0) / ((Date.now() - t0) / 1000);
  // The count is written every 250 ms, so allow for that; 60 fps (no cap) or a still frame both fail.
  expect(fps).toBeGreaterThan(18);
  expect(fps).toBeLessThan(36);
});

test.describe('Reduce Motion', () => {
  test.use({ reducedMotion: 'reduce' });
  test('draws one still frame on a software renderer', async ({ page }) => {
    await softwareOrSkip(page);
    await page.goto('/');
    const canvas = page.getByTestId('screen-home').getByTestId('aurora-canvas');
    await expect(canvas).toHaveAttribute('data-aurora-state', 'still');
    await page.waitForTimeout(1000);
    await expect(canvas).toHaveAttribute('data-aurora-frames', '1');
  });
});
