// Regression tests from the Sol review of the R-5 data layer (round 1). F6 was a caught bug; F10 kills a
// mutant that survived the acceptance suite.
import { QueryClient } from '@tanstack/react-query';
import { renderHook, waitFor } from '@testing-library/react-native';
import type { ReactNode } from 'react';

import { ApiProvider } from '../../api/ApiProvider';
import type { ApiClient } from '../../api/client';
import type { CommentaryEntry } from '../../api/schemas';
import { commentaryParagraphs, useVerseCommentary } from '../useVerseCommentary';

test('F6: splits CR-only line breaks too', () => {
  expect(commentaryParagraphs('One.\rTwo.\r\rThree.')).toEqual(['One.', 'Two.', 'Three.']);
  expect(commentaryParagraphs('One.\r\nTwo.\n\nThree.')).toEqual(['One.', 'Two.', 'Three.']);
});

test('F10: entries starting on the same verse are ordered by id', async () => {
  const rows: CommentaryEntry[] = [9, 1].map((id) => ({
    id,
    book_number: 1,
    chapter: 1,
    verse_start: 1,
    verse_end: 3,
    source: 'matthew_henry',
    content: String(id),
  }));
  const queryClient = new QueryClient({ defaultOptions: { queries: { retry: false, gcTime: Infinity } } });
  const wrapper = ({ children }: { children: ReactNode }) => (
    <ApiProvider client={{ commentary: async () => rows } as unknown as ApiClient} queryClient={queryClient}>
      {children}
    </ApiProvider>
  );
  const book = { book_number: 1, name: 'Genesis', testament: 'OT', total_chapters: 50 };
  const view = await renderHook(() => useVerseCommentary(book, 1, 2), { wrapper });
  await waitFor(() => expect(view.result.current.isSuccess).toBe(true));
  expect(view.result.current.data?.map((r) => r.id)).toEqual([1, 9]);
});
