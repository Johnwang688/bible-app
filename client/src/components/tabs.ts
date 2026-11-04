import type { MessageKey } from '../i18n/messages/en';
import type { TabIconName } from './TabIcon';

export const TABS: { name: string; href: '/' | '/bible' | '/study' | '/me'; icon: TabIconName; labelKey: MessageKey; a11yKey: MessageKey }[] = [
  { name: 'index', href: '/', icon: 'home', labelKey: 'tabs.home', a11yKey: 'tabs.home.a11y' },
  { name: 'bible', href: '/bible', icon: 'bible', labelKey: 'tabs.bible', a11yKey: 'tabs.bible.a11y' },
  { name: 'study', href: '/study', icon: 'study', labelKey: 'tabs.study', a11yKey: 'tabs.study.a11y' },
  { name: 'me', href: '/me', icon: 'me', labelKey: 'tabs.me', a11yKey: 'tabs.me.a11y' },
];

export function activeRailTab(pathname: string): TabIconName | null {
  if (pathname === '/') return 'home';
  if (pathname === '/bible') return 'bible';
  if (/^\/(study|entities)(\/|$)/.test(pathname)) return 'study';
  if (/^\/me(\/|$)/.test(pathname)) return 'me';
  return null;
}
