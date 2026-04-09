import { Suspense } from 'react';
import SummaryEntityPage from '@/components/SummaryEntityPage';

export default async function ThemePage({
  params,
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  return (
    <Suspense
      fallback={
        <div className="entity-page">
          <header className="entity-page-header">
            <span className="entity-page-back">← Reader</span>
            <h1 className="entity-page-title">…</h1>
          </header>
        </div>
      }
    >
      <SummaryEntityPage kind="theme" slug={slug} />
    </Suspense>
  );
}
