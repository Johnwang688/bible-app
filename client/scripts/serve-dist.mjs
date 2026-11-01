// Serves the web export (dist/) for the Playwright smoke tests. Unknown paths fall back to
// index.html, as the single-page export expects.
import http from 'node:http';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import handler from 'serve-handler';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', 'dist');
const port = Number(process.env.PORT ?? 8099);

http
  .createServer((req, res) => handler(req, res, { public: root, rewrites: [{ source: '**', destination: '/index.html' }] }))
  .listen(port, '127.0.0.1', () => console.log(`serving ${root} on http://127.0.0.1:${port}`));
