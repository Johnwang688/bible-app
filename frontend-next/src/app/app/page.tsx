import BibleApp from '@/components/BibleApp';

type AppSearchParams = {
  book?: string;
  chapter?: string;
  panel?: string;
  source?: string;
};

export default async function Page({
  searchParams,
}: {
  searchParams: Promise<AppSearchParams>;
}) {
  const sp = await searchParams;
  let initialReader: { book: string; chapter: number } | null = null;
  if (sp.book && sp.chapter) {
    const ch = parseInt(sp.chapter, 10);
    if (Number.isFinite(ch) && ch > 0) {
      initialReader = { book: sp.book, chapter: ch };
    }
  }

  let initialPanel: 'commentary' | 'ai' | 'study' | null = null;
  if (sp.panel === 'commentary' || sp.panel === 'ai' || sp.panel === 'study') {
    initialPanel = sp.panel;
  }

  let initialCommentarySource: string | null = null;
  const src = sp.source?.trim();
  if (src && /^[\w-]+$/.test(src) && src.length <= 64) {
    initialCommentarySource = src;
  }

  return (
    <BibleApp
      initialReader={initialReader}
      initialPanel={initialPanel}
      initialCommentarySource={initialCommentarySource}
    />
  );
}
