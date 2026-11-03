import { expect, test } from '@playwright/test';

// 375 x 812 device-independent points at 150% display scaling leave 250 x 541 CSS px.
// deviceScaleFactor changes raster density only; it does not exercise this smaller layout.
for (const locale of ['en-US', 'zh-CN']) {
  test.describe(`R-6a review at 150% display scale (${locale})`, () => {
    test.use({ locale, colorScheme: 'light', viewport: { width: 250, height: 541 } });

    test('F6: Customise size controls remain inside the available screen width', async ({ page }) => {
      await page.goto('/');
      await page.getByTestId('tab-me').click();
      await expect(page.getByTestId('screen-me')).toBeVisible();
      await page.getByTestId('me-row-look').click();
      await expect(page.getByTestId('screen-customise')).toBeVisible();
      const outside = await page.getByTestId('screen-customise').evaluate((root) => {
        const ids = ['customise-size-smaller', 'customise-size-value', 'customise-size-larger'];
        return ids.flatMap((id) => {
          const element = root.querySelector(`[data-testid="${id}"]`);
          if (!element) throw new Error(`Missing size control: ${id}`);
          const rect = element.getBoundingClientRect();
          return rect.left < 0 || rect.right > window.innerWidth
            ? [{ id, left: rect.left, right: rect.right, viewport: window.innerWidth }]
            : [];
        });
      });
      expect(outside).toEqual([]);
    });
  });
}
