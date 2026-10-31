// Regression test from the VI-1 verifier review (Sol). Owned by the orchestrator: do not edit.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { chromium } = require('@playwright/test');

test('tokens match locally overridden legacy variables', async () => {
  const root = path.resolve(__dirname, '..');
  const browser = await chromium.launch();
  try {
    const page = await browser.newPage();
    await page.setContent(`
      <html data-theme="neonrose"><body>
        <div class="side-pane"></div>
        <div class="settings-panel"></div>
        <div class="verse-study-popup"></div>
      </body></html>
    `);
    await page.addStyleTag({
      content: [
        'src/app/globals.css',
        'src/styles/tokens.css',
      ].map(f => fs.readFileSync(path.join(root, f), 'utf8')).join('\n'),
    });

    for (const selector of [
      '.side-pane', '.settings-panel', '.verse-study-popup',
    ]) {
      const values = await page.locator(selector).evaluate(el => {
        const cs = getComputedStyle(el);
        return ['--text', '--color-text-primary']
          .map(name => cs.getPropertyValue(name).trim());
      });
      assert.equal(values[1], values[0], selector);
    }
  } finally {
    await browser.close();
  }
});
