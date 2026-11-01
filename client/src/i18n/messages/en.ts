// The English message catalogue. Every UI string goes through a key here (R-0 string ratchet).
// Keys are flat and dotted. Placeholders are {name}.
export const en = {
  'app.name': 'Bible App',

  'tabs.home': 'Home',
  'tabs.bible': 'Bible',
  'tabs.study': 'Study',
  'tabs.me': 'Me',
  'tabs.home.a11y': 'Home tab',
  'tabs.bible.a11y': 'Bible tab',
  'tabs.study.a11y': 'Study tab',
  'tabs.me.a11y': 'Me tab',

  'screen.home.title': 'Home',
  'screen.bible.title': 'Bible',
  'screen.study.title': 'Study',
  'screen.me.title': 'Me',

  'style.pastel': 'Neubrutalist pastel',
  'style.glass': 'Aurora glass',
  'mode.system': 'Follow the phone',
  'mode.light': 'Light',
  'mode.dark': 'Dark',

  'preset.strawberry-milk': 'Strawberry milk',
  'preset.matcha-latte': 'Matcha latte',
  'preset.lavender-haze': 'Lavender haze',
  'preset.bubblegum-night': 'Bubblegum night',
  'preset.matcha-night': 'Matcha night',
  'preset.grape-soda': 'Grape soda',
  'preset.liberty': 'Liberty',
  'preset.silver': 'Silver',
  'preset.sky': 'Sky',
  'preset.northern-lights': 'Northern lights',
  'preset.graphite': 'Graphite',
  'preset.deep-blue': 'Deep blue',

  'language.system': 'Follow the phone',
  'language.en': 'English',
  'language.zh-Hans': '简体中文',

  'content.englishOnly': 'English',

  'common.loading': 'Loading…',
  'common.retry': 'Try again',
  'error.network': 'Can’t reach the server. Check your connection and try again.',
  'error.generic': 'Something went wrong.',
  'error.notFound': 'Not found.',
} as const;

export type MessageKey = keyof typeof en;
