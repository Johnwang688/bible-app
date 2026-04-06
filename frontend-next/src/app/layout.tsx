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
                var t = localStorage.getItem('theme') || 'default';
                if (t === 'dynamic') {
                  document.documentElement.setAttribute('data-theme', 'default');
                  document.documentElement.setAttribute('data-dynamic-wave', '1');
                } else {
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
