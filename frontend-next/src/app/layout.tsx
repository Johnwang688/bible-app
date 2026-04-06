import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: 'Bible App',
  description: 'Bible reader with commentary',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <head>
        {/* Apply saved theme before first paint to prevent flash */}
        <script
          dangerouslySetInnerHTML={{
            __html: `
              try {
                var legacyThemeMap = { 'Galaxy Metallic': 'galaxy', 'galaxy metallic': 'galaxy' };
                var knownThemes = {
                  default: 1, dark: 1, dynamic: 1, pink: 1, blue: 1, green: 1, yellow: 1,
                  purple: 1, orange: 1, gold: 1, midnight: 1, rebecca: 1, galaxy: 1,
                  parchment: 1, teal: 1, forest: 1, magenta: 1, emerald: 1, canyon: 1, neonrose: 1
                };
                var rawTheme = localStorage.getItem('theme');
                var t = legacyThemeMap[rawTheme] || rawTheme || 'default';
                if (!knownThemes[t]) t = 'default';
                localStorage.setItem('theme', t);
                if (t === 'dynamic') {
                  document.documentElement.setAttribute('data-theme', 'default');
                  document.documentElement.setAttribute('data-dynamic-wave', '1');
                } else {
                  document.documentElement.removeAttribute('data-dynamic-wave');
                  document.documentElement.setAttribute('data-theme', t);
                }
              } catch(e) {}
            `,
          }}
        />
      </head>
      <body>{children}</body>
    </html>
  );
}
