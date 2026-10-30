// Regression test from the verifier review (W4-4): paged reading modes flip with the keyboard. Owned by the orchestrator: do not edit.
import {
  expect, openReaderAt, revealTaskbar, test,
} from './fixtures';

for (const mode of ['paged-single', 'paged-double']) {
  test(`${mode}: keyboard flips forward and backward`, async ({ page }) => {
    await openReaderAt(page, 'John', 3);
    await revealTaskbar(page);
    await page.getByRole('button', {
      name: 'Settings', exact: true,
    }).click();
    await page.locator(
      'select:has(option[value="paged-single"])',
    ).selectOption(mode);
    await page.getByRole('button', {
      name: 'Close settings',
    }).click();

    await expect(page.locator('.reader-paged-measuring')).toHaveCount(0);

    const counter = mode === 'paged-single'
      ? page.locator('.reader-paged-pagebar-fraction')
      : page.locator('.reader-paged-col-pagenum').first();

    await expect(counter).toHaveText(/^1\s*\/\s*\d+$/);
    const total = Number((await counter.textContent())!.split('/')[1]);
    expect(total).toBeGreaterThan(mode === 'paged-single' ? 1 : 2);

    await page.keyboard.press('ArrowRight');
    await expect(counter).toHaveText(
      mode === 'paged-single' ? /^2\s*\// : /^3\s*\//,
      { timeout: 2500 },
    );
    await expect(page.locator(
      '.reader-paged-flip-shell.page-flip-enter-next',
    )).toHaveCount(0);

    await page.keyboard.press('ArrowLeft');
    await expect(counter).toHaveText(/^1\s*\//, { timeout: 2500 });
  });
}
