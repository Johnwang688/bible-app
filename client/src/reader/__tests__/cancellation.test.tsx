// Verifier round 1 on the R-2 data layer (GPT-6.1 Sol): a mutant-killing regression test. Orchestrator-owned.
import { QueryClient } from '@tanstack/react-query';
import { render } from '@testing-library/react-native';
import { ApiProvider } from '../../api/ApiProvider';
import type { ApiClient } from '../../api/client';
import type { BookInfo } from '../../api/schemas';
import { useLexicon, useVerseWords } from '../words';

it('forwards and aborts both query signals on unmount', async () => {
  const signals: (AbortSignal | undefined)[] = [];
  const pending = (opts?: { signal?: AbortSignal }) => {
    signals.push(opts?.signal);
    return new Promise<never>(() => {});
  };
  const api = {
    words: (
      _b: string, _c: number, _v: number,
      opts?: { signal?: AbortSignal },
    ) => pending(opts),
    lexicon: (_s: string, opts?: { signal?: AbortSignal }) =>
      pending(opts),
  } as unknown as ApiClient;
  const book: BookInfo = {
    book_number: 43, name: 'John',
    testament: 'NT', total_chapters: 21,
  };
  const qc = new QueryClient({
    defaultOptions: { queries: { retry: false, gcTime: Infinity } },
  });
  function Probe() {
    useVerseWords(book, 3, 16);
    useLexicon('G0025');
    return null;
  }
  const ui = await render(
    <ApiProvider client={api} queryClient={qc}>
      <Probe />
    </ApiProvider>,
  );
  try {
    expect(signals).toHaveLength(2);
    for (const signal of signals) {
      expect(signal).toBeDefined();
      expect(signal?.aborted).toBe(false);
    }
  } finally {
    await ui.unmount();
    qc.clear();
  }
  for (const signal of signals) expect(signal?.aborted).toBe(true);
});
