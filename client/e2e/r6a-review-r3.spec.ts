import { expect, test } from '@playwright/test';

// F10 through ordinary, awaited browser clicks: no batched-event or provider mocks.
for (const [standalone, mode, next] of [
  ['liberty', 'dark', 'sky'],
  ['northern-lights', 'light', 'deep-blue'],
] as const) {
  test(`R-6a F10: ${standalone} in ${mode} mode can select ${next}`, async ({ page }) => {
    await page.goto('/');
    await page.getByTestId('tab-me').click();
    await page.getByTestId('me-row-look').click();
    await page.getByTestId(`customise-preset-${standalone}`).click();
    await page.getByTestId(`customise-mode-${mode}`).click();
    await expect(page.getByTestId(`customise-preset-${standalone}`)).toHaveAttribute('aria-checked', 'true');
    await page.getByTestId(`customise-preset-${next}`).click();
    await expect(page.getByTestId(`customise-preset-${next}`)).toHaveAttribute('aria-checked', 'true');
  });
}