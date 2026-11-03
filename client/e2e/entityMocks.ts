// The people, places and themes API mocked from the golden fixtures (R-5 part 2, orchestrator-owned).
import type { Page } from '@playwright/test';

import { body } from './helpers';

const LISTS: Record<string, unknown> = {
  person: body('entities_person'),
  place: body('entities_place'),
  theme: body('entities_theme'),
};
const GOD = body('entity_person_god') as Record<string, unknown>;
const PAGES: Record<string, unknown> = {
  'person/god': GOD,
  'place/achaia': body('entity_place_achaia'),
  'theme/covenant-promise': body('entity_theme_covenant'),
};

/** Lists for every kind; known pages from the fixtures; any other person or theme is God's page relabelled; `nobody` is a 404. */
export async function mockEntities(page: Page, opts: { listsDown?: boolean } = {}) {
  const seen: string[] = [];
  await page.route('**/api/v1/summary-entities/**', async (route) => {
    const url = new URL(route.request().url());
    const parts = url.pathname.split('/').slice(4).map(decodeURIComponent); // after /api/v1/summary-entities
    seen.push(parts.join('/'));
    if (parts[0] === 'list') {
      if (opts.listsDown) return route.fulfill({ status: 503, json: { detail: 'down' } });
      return route.fulfill({ json: LISTS[parts[1]!] ?? [] });
    }
    const [kind, slug] = parts as [string, string];
    const known = PAGES[`${kind}/${slug}`];
    if (known) return route.fulfill({ json: known });
    if (slug === 'nobody') return route.fulfill({ status: 404, json: { detail: 'Entity not found' } });
    const label = slug.charAt(0).toUpperCase() + slug.slice(1);
    return route.fulfill({ json: { ...GOD, kind, slug, label } });
  });
  return seen;
}
