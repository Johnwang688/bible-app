import {
  HIGHLIGHT_COLOR_IDS,
  READER_FONT_IDS,
  READER_FONT_PX_OPTIONS,
  READER_LINE_HEIGHT_OPTIONS,
  READING_MODE_IDS,
  type ReaderFontId,
  type ReaderFontPx,
  type ReaderHighlightColorId,
  type ReaderLineHeightOption,
  type ReaderReadingMode,
  type ReaderSettings,
  type ReaderSettingsNormalizeInput,
} from '@/features/reader/types';

export function isPagedReadingMode(mode: ReaderReadingMode): boolean {
  return mode === 'paged-single' || mode === 'paged-double';
}

export const READER_HIGHLIGHT_PRESETS: Record<
  ReaderHighlightColorId,
  { light: string; dark: string; darkText: string }
> = {
  yellow: { light: '#ffe066', dark: '#c9a800', darkText: '#fff' },
  amber: { light: '#ffcc80', dark: '#b07d00', darkText: '#fff' },
  green: { light: '#b8e6b8', dark: '#2e7d32', darkText: '#fff' },
  blue: { light: '#a8c8ff', dark: '#1565c0', darkText: '#fff' },
  pink: { light: '#ffc1e0', dark: '#ad1457', darkText: '#fff' },
  lavender: { light: '#d4c4ff', dark: '#5e35b1', darkText: '#fff' },
  mint: { light: '#a8ede4', dark: '#00897b', darkText: '#fff' },
};

export function applyReaderHighlightVars(id: ReaderHighlightColorId) {
  if (typeof document === 'undefined') return;
  const p = READER_HIGHLIGHT_PRESETS[id];
  const root = document.documentElement;
  root.style.setProperty('--reader-highlight-bg', p.light);
  root.style.setProperty('--reader-highlight-bg-dark', p.dark);
  root.style.setProperty('--reader-highlight-fg-dark', p.darkText);
}

export const LEGACY_READER_FONT: Record<string, ReaderFontPx> = {
  comfortable: '16',
  large: '18',
  xlarge: '24',
};
export const LEGACY_READER_LINE_HEIGHT: Record<string, ReaderLineHeightOption> = {
  relaxed: '1.5',
  airy: '2',
  '1': '1.5',
  '1.15': '1.5',
  '1.25': '1.5',
};

export const DEFAULT_READER_SETTINGS: ReaderSettings = {
  fontScale: '20',
  lineHeight: '2',
  readerFont: 'georgia',
  highlightColor: 'yellow',
  readingMode: 'single',
  specialEffects: true,
  pageFlipEnabled: true,
  defaultPanel: 'none',
  sidePanelPosition: 'right',
  graphicsMode: 'auto',
};

export function normalizeReaderSettings(raw: ReaderSettingsNormalizeInput | null | undefined): ReaderSettings {
  const rawFont = raw?.fontScale;
  let fontScale: ReaderFontPx = DEFAULT_READER_SETTINGS.fontScale;
  if (typeof rawFont === 'string') {
    if ((READER_FONT_PX_OPTIONS as readonly string[]).includes(rawFont)) fontScale = rawFont as ReaderFontPx;
    else if (rawFont in LEGACY_READER_FONT) fontScale = LEGACY_READER_FONT[rawFont];
  }
  const rawLh = raw?.lineHeight;
  let lineHeight: ReaderLineHeightOption = DEFAULT_READER_SETTINGS.lineHeight;
  if (typeof rawLh === 'string') {
    if ((READER_LINE_HEIGHT_OPTIONS as readonly string[]).includes(rawLh)) lineHeight = rawLh as ReaderLineHeightOption;
    else if (rawLh in LEGACY_READER_LINE_HEIGHT) lineHeight = LEGACY_READER_LINE_HEIGHT[rawLh];
  }
  const rawRf = raw?.readerFont;
  let readerFont: ReaderFontId = DEFAULT_READER_SETTINGS.readerFont;
  if (typeof rawRf === 'string' && (READER_FONT_IDS as readonly string[]).includes(rawRf)) {
    readerFont = rawRf as ReaderFontId;
  }
  const rawHc = raw?.highlightColor;
  let highlightColor: ReaderHighlightColorId = DEFAULT_READER_SETTINGS.highlightColor;
  if (typeof rawHc === 'string' && (HIGHLIGHT_COLOR_IDS as readonly string[]).includes(rawHc)) {
    highlightColor = rawHc as ReaderHighlightColorId;
  }
  const rawReadingMode = raw?.readingMode;
  let readingMode: ReaderReadingMode = DEFAULT_READER_SETTINGS.readingMode;
  if (typeof rawReadingMode === 'string' && (READING_MODE_IDS as readonly string[]).includes(rawReadingMode)) {
    readingMode = rawReadingMode as ReaderReadingMode;
  }
  let specialEffects = DEFAULT_READER_SETTINGS.specialEffects;
  if (raw && typeof raw['specialEffects'] === 'boolean') {
    specialEffects = raw['specialEffects'];
  } else if (raw && typeof raw['reducedMotion'] === 'boolean') {
    specialEffects = !raw['reducedMotion'];
  }
  return {
    fontScale,
    lineHeight,
    readerFont,
    highlightColor,
    readingMode,
    specialEffects,
    pageFlipEnabled: typeof raw?.['pageFlipEnabled'] === 'boolean' ? raw['pageFlipEnabled'] : true,
    defaultPanel:
      raw?.['defaultPanel'] === 'ai' || raw?.['defaultPanel'] === 'commentary' || raw?.['defaultPanel'] === 'study'
        ? raw['defaultPanel'] as 'ai' | 'commentary' | 'study'
        : 'none',
    sidePanelPosition: raw?.['sidePanelPosition'] === 'left' ? 'left' : 'right',
    graphicsMode:
      raw?.['graphicsMode'] === 'performance' || raw?.['graphicsMode'] === 'efficiency'
        ? raw['graphicsMode'] as 'performance' | 'efficiency'
        : 'auto',
  };
}

export function detectGraphicsCapability(): 'performance' | 'efficiency' {
  if (typeof window === 'undefined') return 'efficiency';
  if (/Android|iPhone|iPad|iPod|Mobile/i.test(navigator.userAgent)) return 'efficiency';
  const cores = navigator.hardwareConcurrency ?? 2;
  const mem = (navigator as Navigator & { deviceMemory?: number }).deviceMemory ?? 2;
  if (cores >= 4 && mem >= 4) return 'performance';
  return 'efficiency';
}
