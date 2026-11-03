import { expect, test } from '@playwright/test';

// The wrapping fix must retain a single usable size row at an ordinary phone width.
for (const locale of ['en-US', 'zh-CN']) {
  test.describe(`R-6a round 2 normal-size layout (${locale})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 375, height: 812 } });
    test('size controls stay on one row inside the screen in every preset', async ({ page }) => {
      await page.goto('/');
      await page.getByTestId('tab-me').click();
      await page.getByTestId('me-row-look').click();
      const presets = page.locator('[data-testid^="customise-preset-"]');
      await expect(presets).toHaveCount(12);
      const count = await presets.count();
      for (let i = 0; i < count; i++) {
        await presets.nth(i).click();
        const rects = await Promise.all(
          ['customise-size-smaller', 'customise-size-value', 'customise-size-larger'].map((id) => page.getByTestId(id).boundingBox()),
        );
        for (const rect of rects) {
          expect(rect).not.toBeNull();
          expect(rect!.x).toBeGreaterThanOrEqual(0);
          expect(rect!.x + rect!.width).toBeLessThanOrEqual(375);
        }
        const centers = rects.map((r) => r!.y + r!.height / 2);
        expect(Math.max(...centers) - Math.min(...centers)).toBeLessThanOrEqual(1);
        for (const rect of [rects[0]!, rects[2]!]) {
          expect(rect.width).toBeGreaterThanOrEqual(44);
          expect(rect.height).toBeGreaterThanOrEqual(44);
        }
      }
    });
  });
}