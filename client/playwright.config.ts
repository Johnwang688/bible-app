// End-to-end smoke tests against the web export (`npm run export:web` first).
import { defineConfig, devices } from '@playwright/test';

// E2E_PORT lets two worktrees run the suite at once.
const PORT = Number(process.env.E2E_PORT ?? 8099);

export default defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  retries: 0,
  reporter: [['list']],
  use: {
    baseURL: `http://127.0.0.1:${PORT}`,
    trace: 'retain-on-failure',
    // The real GPU (ANGLE on D3D11, this PC), not SwiftShader: the glass looks run a WebGL aurora (R-7a), which
    // on the CPU slows every test. Other platforms ignore the flag and get SwiftShader (the aurora then uses flow).
    launchOptions: { args: ['--use-angle=d3d11', '--enable-gpu', '--ignore-gpu-blocklist'] },
  },
  projects: [
    { name: 'phone', use: { ...devices['Pixel 7'] } },
    { name: 'desktop', use: { ...devices['Desktop Chrome'] } },
  ],
  webServer: {
    command: 'node scripts/serve-dist.mjs',
    url: `http://127.0.0.1:${PORT}`,
    reuseExistingServer: false,
    env: { PORT: String(PORT) },
  },
});
