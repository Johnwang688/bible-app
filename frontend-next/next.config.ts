import type { NextConfig } from 'next';

/** Production: set at image build time (e.g. Docker BUILD_ARG). Local dev: defaults to FastAPI on 8000. */
const backendBase = (
  process.env.BACKEND_URL || 'http://localhost:8000'
).replace(/\/$/, '');

const nextConfig: NextConfig = {
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
