// Acceptance test for VI-1 (design tokens). Owned by the orchestrator: do not edit.
// Every semantic token must resolve in every current theme, to the same value as the legacy variable it bridges.
import { expect, test } from './fixtures';

const THEMES = [
  'default', 'dark', 'dynamic', 'pink', 'blue', 'green', 'yellow', 'purple', 'orange', 'gold',
  'midnight', 'rebecca', 'galaxy', 'parchment', 'teal', 'forest', 'magenta', 'emerald', 'canyon', 'neonrose',
  // VI-2a: retired ids now migrate to a mode; 'paper' and 'system' are new.
  'paper', 'system', 'light',
];

// token -> legacy variable it must equal while VI-1's bridge is in place
const BRIDGE: Record<string, string> = {
  '--color-surface-0': '--bg',
  '--color-surface-1': '--panel',
  '--color-surface-2': '--panel-2',
  '--color-surface-popover': '--popup-bg',
  '--color-surface-hover': '--list-hover',
  '--color-surface-selected': '--list-active',
  '--color-text-primary': '--text',
  '--color-text-secondary': '--muted',
  '--color-text-muted': '--rdrlabel',
  '--color-verse-number': '--vnum',
  '--color-accent': '--accent',
  '--color-accent-soft': '--accent-soft',
  '--color-line': '--line',
  '--color-line-soft': '--line-soft',
  '--color-focus': '--accent',
  '--color-highlight': '--reader-highlight-bg',
  '--font-ui': '--ui',
  '--font-scripture': '--serif',
};

const NEW_ONLY = [
  '--color-on-accent', '--font-hebrew', '--font-greek',
  '--radius-control', '--radius-card', '--space-1', '--space-2', '--space-3', '--space-4', '--space-5', '--space-6',
];

for (const theme of THEMES) {
  test(`tokens resolve and match the legacy variables: ${theme}`, async ({ page }) => {
    await page.addInitScript((t) => localStorage.setItem('theme', t), theme);
    await page.goto('/app');
    await expect(page.getByRole('button', { name: 'Bible reader' })).toBeVisible();
    const values = await page.evaluate(([bridge, extra]) => {
      const cs = getComputedStyle(document.documentElement);
      const read = (name: string) => cs.getPropertyValue(name).trim();
      return {
        bridged: Object.entries(bridge as Record<string, string>).map(([token, legacy]) => [token, read(token), read(legacy)]),
        extra: (extra as string[]).map((token) => [token, read(token)]),
      };
    }, [BRIDGE, NEW_ONLY] as const);
    for (const [token, value, legacy] of values.bridged) {
      expect(value, `${token} in ${theme}`).not.toBe('');
      expect(value, `${token} should equal its legacy variable in ${theme}`).toBe(legacy);
    }
    for (const [token, value] of values.extra) expect(value, `${token} in ${theme}`).not.toBe('');
  });
}

test('Hebrew and Greek fonts are wired through next/font', async ({ page }) => {
  await page.goto('/app');
  await expect(page.getByRole('button', { name: 'Bible reader' })).toBeVisible();
  const fonts = await page.evaluate(() => {
    const cs = getComputedStyle(document.documentElement);
    return { hebrew: cs.getPropertyValue('--font-hebrew'), greek: cs.getPropertyValue('--font-greek') };
  });
  expect(fonts.hebrew).toMatch(/Noto Serif Hebrew/);
  expect(fonts.greek).toMatch(/Gentium Book Plus/);
});
