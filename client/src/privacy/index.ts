// The privacy policy page (B-1): its section list, the contact address and the language rule.
// The copy lives in the message catalogue (`privacy.*`); this file says which keys each card shows.
import type { MessageKey } from '../i18n/translate';
import type { AppLocale } from '../i18n/types';

/** The cards, in the order the page shows them (after the short-version box and the intro). */
export const PRIVACY_SECTIONS = [
  'never',
  'device',
  'server',
  'hosting',
  'account',
  'delete',
  'children',
  'contact',
  'changes',
] as const;
export type PrivacySection = (typeof PRIVACY_SECTIONS)[number];

// The contact address (John, 11-02; temporary, he may change it before App Store review). It is the only
// place the page names one: the "Email us" row's mailto link and the copy button both read it.
export const PRIVACY_CONTACT = 'JohnWang.0918.code@gmail.com';

/** The language the page opens in: the URL's `lang` if it names one we have, else the interface language. */
export function privacyLocale(param: string | string[] | undefined, interfaceLocale: AppLocale): AppLocale {
  const value = Array.isArray(param) ? param[0] : param;
  if (value === 'en') return 'en';
  if (value === 'zh-Hans' || value === 'zh') return 'zh-Hans';
  return interfaceLocale;
}

/** How many `bN` bullets each card has. `children` also shows `age` first; `changes` also shows `b2` in beta builds. */
export const PRIVACY_BULLET_COUNT: Record<PrivacySection, number> = {
  never: 3,
  device: 3,
  server: 3,
  hosting: 2,
  account: 3,
  delete: 3,
  children: 2,
  contact: 0,
  changes: 1,
};

/** The catalogue keys of a card's bullets, in order. */
export function privacyBulletKeys(section: PrivacySection, beta: boolean): MessageKey[] {
  const keys: string[] = [];
  if (section === 'children') keys.push('privacy.children.age');
  for (let n = 1; n <= PRIVACY_BULLET_COUNT[section]; n++) keys.push(`privacy.${section}.b${n}`);
  if (section === 'changes' && beta) keys.push('privacy.changes.b2');
  // Built from the table above; the keys test checks that every one is in both catalogues.
  return keys as MessageKey[];
}

/** The four bullets of the short-version box. */
export const PRIVACY_SHORT_KEYS: readonly MessageKey[] = [
  'privacy.short.b1',
  'privacy.short.b2',
  'privacy.short.b3',
  'privacy.short.b4',
];
