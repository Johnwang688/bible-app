import type { FullConfig } from '@playwright/test';

/**
 * `next dev` compiles each route on first request. Hit the routes the suite uses once, up front,
 * so parallel workers don't all pay (and race on) the cold compile inside a test timeout.
 */
export default async function globalSetup(config: FullConfig) {
  const baseURL = config.projects[0].use.baseURL;
  if (!baseURL) return;
  for (const route of ['/app', '/signin', '/people/god']) {
    await fetch(new URL(route, baseURL)).catch(() => undefined);
  }
}
