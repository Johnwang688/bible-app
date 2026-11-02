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
