// https://docs.expo.dev/guides/using-eslint/
const { defineConfig } = require('eslint/config');
const expoConfig = require('eslint-config-expo/flat');

module.exports = defineConfig([
  expoConfig,
  {
    ignores: [
      'dist/*',
      'playwright-report/*',
      'test-results/*',
      // Verbatim copy of the design canvas code; the canvas test runs it as the oracle.
      'src/theme/__tests__/canvas-themes.js',
    ],
  },
]);
