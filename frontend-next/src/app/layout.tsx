import type { Metadata } from 'next';
import { Open_Sans, Noto_Serif_Hebrew, Gentium_Book_Plus } from 'next/font/google';
import '@fontsource/opendyslexic/400.css';
import '@fontsource/opendyslexic/700.css';
import './globals.css';
import '../styles/tokens.css';

const openSans = Open_Sans({
  subsets: ['latin'],
  variable: '--font-open-sans',
  display: 'swap',
});

// Original-language fonts: loaded only when a Hebrew or Greek glyph is rendered.
const notoSerifHebrew = Noto_Serif_Hebrew({
  subsets: ['hebrew'],
  variable: '--font-hebrew-face',
  display: 'swap',
  preload: false,
});

const gentiumBookPlus = Gentium_Book_Plus({
  subsets: ['greek', 'greek-ext', 'latin'],
  weight: ['400', '700'],
  variable: '--font-greek-face',
  display: 'swap',
  preload: false,
});

export const metadata: Metadata = {
  title: 'Open Bible',
  description:
    'Read Scripture with AI commentary, translations, and study tools — a modern Bible reader built for deep, open study.',
  icons: {
    icon: [{ url: '/logo/openbible-logo.png', type: 'image/png' }],
    apple: [{ url: '/logo/openbible-logo.png', type: 'image/png' }],
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${openSans.variable} ${notoSerifHebrew.variable} ${gentiumBookPlus.variable}`} suppressHydrationWarning>
      <head>
        {/* Apply saved theme before first paint to prevent flash */}
        <script
          dangerouslySetInnerHTML={{
            __html: `
              try {
                // Inline copy of normalizeThemeId / resolveAppliedTheme in src/lib/themes.ts: keep in step.
                var themeMigration = {
                  system: 'system', paper: 'paper', dark: 'dark',
                  midnight: 'dark', rebecca: 'dark', galaxy: 'dark', 'Galaxy Metallic': 'dark', 'galaxy metallic': 'dark',
                  teal: 'dark', forest: 'dark', magenta: 'dark', emerald: 'dark', canyon: 'dark', neonrose: 'dark',
                  parchment: 'paper', gold: 'paper',
                  dynamic: 'default', pink: 'default', blue: 'default', green: 'default',
                  yellow: 'default', purple: 'default', orange: 'default'
                };
                // After the first run 'default' means an explicit Light, not the old "never chose".
                var rawTheme = localStorage.getItem('theme');
                var migrated = localStorage.getItem('theme-version') === '2';
                var pref = 'system';
                if (rawTheme) {
                  if (migrated && { system: 1, default: 1, dark: 1, paper: 1 }[rawTheme] === 1) pref = rawTheme;
                  else if (Object.prototype.hasOwnProperty.call(themeMigration, rawTheme)) pref = themeMigration[rawTheme];
                }
                localStorage.setItem('theme', pref);
                localStorage.setItem('theme-version', '2');
                var applied = pref === 'system'
                  ? (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'default')
                  : pref;
                document.documentElement.setAttribute('data-theme', applied);
              } catch(e) {}
            `,
          }}
        />
      </head>
      <body>{children}</body>
    </html>
  );
}
