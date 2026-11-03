// The Me tab's screens (R-6a). Owned by the orchestrator: screens navigate through callbacks, and
// the route files in src/app/(tabs)/me/ map them to Expo Router, so screens test without a router.
export const ME_ROUTES = ['customise', 'advanced', 'sources', 'about', 'help'] as const;
export type MeRoute = (typeof ME_ROUTES)[number];
