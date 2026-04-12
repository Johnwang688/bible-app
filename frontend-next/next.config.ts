import path from 'path';
import { fileURLToPath } from 'url';
import type { NextConfig } from 'next';

/** Directory containing this config (the Next.js app root). Fixes Turbopack when a parent folder has another lockfile. */
const appRoot = path.dirname(fileURLToPath(import.meta.url));

/** Production: set at image build time (e.g. Docker BUILD_ARG). Local dev: defaults to FastAPI on 8000. */
const backendBase = (
  process.env.BACKEND_URL || 'http://localhost:8000'
).replace(/\/$/, '');

const nextConfig: NextConfig = {
  turbopack: {
    root: appRoot,
  },
  async rewrites() {
    return [
      {
        source: '/api/:path*',
        destination: `${backendBase}/api/:path*`,
      },
      {
        source: '/health',
        destination: `${backendBase}/health`,
      },
    ];
  },
};

export default nextConfig;
