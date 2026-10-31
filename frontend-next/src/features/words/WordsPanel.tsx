'use client';

import { useCallback, useEffect, useLayoutEffect, useRef, useState } from 'react';
import type { MutableRefObject } from 'react';
import styles from './WordsPanel.module.css';

export interface WordsTarget {
  bookNumber: number;
  bookName: string;
  chapter: number;
  verse: number;
}

type EnglishKind = 'text' | 'untranslated' | 'continues' | 'elsewhere';
type WordLanguage = 'hebrew' | 'aramaic' | 'greek';

interface ApiWord {
  english_order: number;
  english: string | null;
  english_kind: EnglishKind;
  original: string;
  translit: string | null;
  language: WordLanguage;
  strongs: string | null;
  lemma: string | null;
  gloss: string | null;
  grammar: string | null;
  parsing: string | null;
  parsing_code: string | null;
  footnote: string | null;
}

interface WordsResponse {
  words: ApiWord[];
}

interface LexiconEntry {
  strongs: string;
  language: WordLanguage;
  lemma: string | null;
  translit: string | null;
  gloss: string | null;
  definition: string | null;
  occurrences: number;
  verse_count: number;
  references: Array<{ book: string; book_number: number; chapter: number; verse: number }>;
  source: string | null;
}

/** One aligned English phrase and the original word(s) under it. */
interface Row {
  english: string | null;
  kind: EnglishKind;
  words: ApiWord[];
}

export interface WordsPanelProps {
  target: WordsTarget | null;
  translation: string;
  navigateToPassage: (
    bookName: string | null | undefined,
    nextChapter: number,
    nextTranslation?: string,
    verseNumber?: number,
  ) => boolean;
}

const LANGUAGE_LABEL: Record<WordLanguage, string> = { hebrew: 'Hebrew', aramaic: 'Aramaic', greek: 'Greek' };
const LANG_ATTR: Record<WordLanguage, string> = { hebrew: 'he', aramaic: 'arc', greek: 'grc' };
const CACHE_LIMIT = 60;

type Cache<T> = MutableRefObject<Map<string, T>>;
type FetchState<T> = { status: 'idle' | 'loading' | 'error' } | { status: 'ready'; data: T };

/**
 * Fetches JSON for `url` (null = nothing to fetch). A new url aborts the in-flight request,
 * so a stale response never overwrites a newer target. Successful responses are kept in `cache`.
 */
function useCachedJson<T>(url: string | null, cache: Cache<T>): FetchState<T> & { retry: () => void } {
  const [failedUrl, setFailedUrl] = useState<string | null>(null);
  const [, setLoadedTick] = useState(0);
  const [attempt, setAttempt] = useState(0);
  const [seenUrl, setSeenUrl] = useState<string | null>(url);

  // A new url forgets the previous failure, so revisiting a target that failed shows Loading, not the old error.
  if (seenUrl !== url) {
    setSeenUrl(url);
    setFailedUrl(null);
  }

  useEffect(() => {
    if (!url || cache.current.has(url)) return;
    const controller = new AbortController();
    // Start on the next tick: a target that changes again straight away (or a dev-mode
    // remount) cancels the timer, so no request is sent for a target nobody looked at.
    const timer = window.setTimeout(() => {
      fetch(url, { signal: controller.signal })
        .then(response => {
          if (!response.ok) throw new Error(`HTTP ${response.status}`);
          return response.json() as Promise<T>;
        })
        .then(data => {
          if (controller.signal.aborted) return;
          const store = cache.current;
          if (store.size >= CACHE_LIMIT) store.delete(store.keys().next().value as string);
          store.set(url, data);
          setLoadedTick(n => n + 1);
        })
        .catch(() => {
          if (controller.signal.aborted) return;
          setFailedUrl(url);
        });
    }, 0);
    return () => {
      window.clearTimeout(timer);
      controller.abort();
    };
  }, [url, attempt, cache]);

  const retry = useCallback(() => {
    setFailedUrl(null);
    setAttempt(n => n + 1);
  }, []);

  if (!url) return { status: 'idle', retry };
  const cached = cache.current.get(url);
  if (cached !== undefined) return { status: 'ready', data: cached, retry };
  if (failedUrl === url) return { status: 'error', retry };
  return { status: 'loading', retry };
}

function buildRows(words: ApiWord[]): Row[] {
  const rows: Row[] = [];
  const ordered = [...words].sort((a, b) => a.english_order - b.english_order);
  for (const word of ordered) {
    const previous = rows[rows.length - 1];
    if (word.english_kind === 'continues' && previous) {
      previous.words.push(word);
      continue;
    }
    rows.push({ english: word.english, kind: word.english_kind, words: [word] });
  }
  return rows;
}

function OriginalWord({ word }: { word: ApiWord }) {
  const isGreek = word.language === 'greek';
  return (
    <span
      lang={LANG_ATTR[word.language]}
      dir={isGreek ? undefined : 'rtl'}
      className={`${styles.original} ${isGreek ? styles.greek : styles.hebrew}`}
    >
      {word.original}
    </span>
  );
}

function scrollParent(el: HTMLElement | null): HTMLElement | null {
  return el?.closest<HTMLElement>('.side-scroll') ?? null;
}

function WordCard({
  row,
  translation,
  lexiconCache,
  onBack,
  navigateToPassage,
}: {
  row: Row;
  translation: string;
  lexiconCache: Cache<LexiconEntry>;
  onBack: () => void;
  navigateToPassage: WordsPanelProps['navigateToPassage'];
}) {
  const word = row.words[0];
  const headingRef = useRef<HTMLHeadingElement>(null);
  const [showParsing, setShowParsing] = useState(false);
  const [showDefinition, setShowDefinition] = useState(false);
  const lexiconUrl = word.strongs ? `/api/v1/lexicon/${encodeURIComponent(word.strongs)}` : null;
  const lexicon = useCachedJson<LexiconEntry>(lexiconUrl, lexiconCache);
  const entry = lexicon.status === 'ready' ? lexicon.data : null;

  useLayoutEffect(() => {
    const heading = headingRef.current;
    if (!heading) return;
    const scroller = scrollParent(heading);
    if (scroller) scroller.scrollTop = 0;
    heading.focus({ preventScroll: true });
  }, []);

  const footnotes = row.words.map(w => w.footnote).filter((f): f is string => !!f);
  const hasMoreParsing = !!word.parsing && word.parsing !== word.grammar;
  const lemma = entry?.lemma ?? word.lemma ?? word.original;
  const isGreek = word.language === 'greek';

  return (
    <div className={styles.card}>
      <button type="button" className={`${styles.action} ${styles.back}`} onClick={onBack}>
        ‹ Back
      </button>

      <h3
        ref={headingRef}
        tabIndex={-1}
        lang={LANG_ATTR[word.language]}
        dir={isGreek ? undefined : 'rtl'}
        className={`${styles.cardTitle} ${isGreek ? styles.greek : styles.hebrew}`}
      >
        {lemma}
      </h3>

      {word.strongs ? (
        lexicon.status === 'ready' ? (
          <p className={styles.line}>{[entry?.translit, entry?.gloss].filter(Boolean).join(' · ')}</p>
        ) : lexicon.status === 'error' ? (
          <div className={styles.state} role="alert">
            <p>Couldn&apos;t load the dictionary entry.</p>
            <button type="button" className={styles.action} onClick={lexicon.retry}>Try again</button>
          </div>
        ) : (
          <p className={`${styles.line} ${styles.muted}`} role="status">Loading…</p>
        )
      ) : (
        <p className={styles.line}>{[word.translit, word.gloss].filter(Boolean).join(' · ')}</p>
      )}

      {(word.grammar || word.parsing) && (
        <div>
          <div className={styles.grammar}>
            {word.grammar && <span className={styles.line}>{word.grammar}</span>}
            {word.strongs && hasMoreParsing && (
              <button
                type="button"
                className={styles.toggle}
                aria-expanded={showParsing}
                onClick={() => setShowParsing(v => !v)}
              >
                {showParsing ? 'Less' : 'More'}
              </button>
            )}
          </div>
          {word.parsing && (!word.strongs || showParsing) && (
            <p className={`${styles.line} ${styles.muted}`}>{word.parsing}</p>
          )}
        </div>
      )}

      {footnotes.map(note => (
        <p key={note} className={styles.footnote}>{note}</p>
      ))}

      {!word.strongs && <p className={`${styles.line} ${styles.muted}`}>No dictionary entry for this word.</p>}

      {entry && (
        <>
          <p className={styles.line}>
            Used {entry.occurrences} {entry.occurrences === 1 ? 'time' : 'times'} in {entry.verse_count}{' '}
            {entry.verse_count === 1 ? 'verse' : 'verses'}
          </p>

          {entry.references.length > 0 && (
            <div>
              <h4 className={styles.sectionLabel}>
                Where it appears
                {entry.verse_count > entry.references.length ? ` (first ${entry.references.length})` : ''}
              </h4>
              <div className={styles.refs}>
                {entry.references.map(ref => (
                  <button
                    key={`${ref.book_number}:${ref.chapter}:${ref.verse}`}
                    type="button"
                    className={styles.ref}
                    onClick={() => navigateToPassage(ref.book, ref.chapter, translation, ref.verse)}
                  >
                    {ref.book} {ref.chapter}:{ref.verse}
                  </button>
                ))}
              </div>
            </div>
          )}

          {entry.definition && (
            <div>
              <button
                type="button"
                className={styles.toggle}
                aria-expanded={showDefinition}
                onClick={() => setShowDefinition(v => !v)}
              >
                Full definition
              </button>
              {showDefinition && <p className={styles.definition}>{entry.definition}</p>}
            </div>
          )}
        </>
      )}

      <p className={styles.credit}>
        {entry?.source ? `${entry.source}. ` : ''}Alignment: Berean Standard Bible.
      </p>
    </div>
  );
}

export default function WordsPanel({ target, translation, navigateToPassage }: WordsPanelProps) {
  const rootRef = useRef<HTMLDivElement>(null);
  const wordsCache = useRef(new Map<string, WordsResponse>());
  const lexiconCache = useRef(new Map<string, LexiconEntry>());
  const rowRefs = useRef<Array<HTMLButtonElement | null>>([]);
  const savedScroll = useRef(0);
  const restore = useRef<{ index: number; scrollTop: number } | null>(null);

  const targetKey = target ? `${target.bookNumber}/${target.chapter}/${target.verse}` : null;
  const [open, setOpen] = useState<{ targetKey: string; index: number } | null>(null);
  const [seenTargetKey, setSeenTargetKey] = useState<string | null>(targetKey);
  // A new target discards any open card (which unmounts it and aborts its request).
  if (seenTargetKey !== targetKey) {
    setSeenTargetKey(targetKey);
    setOpen(null);
  }
  const openIndex = open && open.targetKey === targetKey && seenTargetKey === targetKey ? open.index : null;

  const words = useCachedJson<WordsResponse>(targetKey ? `/api/v1/words/${targetKey}` : null, wordsCache);

  // After Back: return to the list at the same scroll position, focus on the row that was open.
  useLayoutEffect(() => {
    if (openIndex !== null || !restore.current) return;
    const { index, scrollTop } = restore.current;
    restore.current = null;
    const scroller = scrollParent(rootRef.current);
    if (scroller) scroller.scrollTop = scrollTop;
    rowRefs.current[index]?.focus({ preventScroll: true });
  }, [openIndex, words.status]);

  if (!target || !targetKey) {
    return (
      <div ref={rootRef} className={styles.root}>
        <div className={styles.header}>
          <h2 className={styles.title}>Original words</h2>
        </div>
        <div className={styles.state}>
          <p>Select a verse and choose Original words.</p>
        </div>
      </div>
    );
  }

  const rows = words.status === 'ready' ? buildRows(words.data.words ?? []) : [];

  if (openIndex !== null && rows[openIndex]) {
    return (
      <div ref={rootRef} className={styles.root}>
        <WordCard
          key={`${targetKey}#${openIndex}`}
          row={rows[openIndex]}
          translation={translation}
          lexiconCache={lexiconCache}
          navigateToPassage={navigateToPassage}
          onBack={() => {
            restore.current = { index: openIndex, scrollTop: savedScroll.current };
            setOpen(null);
          }}
        />
      </div>
    );
  }

  const language = rows[0]?.words[0]?.language;

  return (
    <div ref={rootRef} className={styles.root}>
      <div className={styles.header}>
        <h2 className={styles.title}>Original words</h2>
        <div className={styles.meta}>
          <span>{target.bookName} {target.chapter}:{target.verse}</span>
          {language && <span>{LANGUAGE_LABEL[language]}</span>}
        </div>
        <p className={styles.note}>Word alignment from the Berean Standard Bible (BSB)</p>
      </div>

      {words.status === 'loading' && (
        <div className={styles.state} role="status">Loading…</div>
      )}

      {words.status === 'error' && (
        <div className={styles.state} role="alert">
          <p>Couldn&apos;t load the original words.</p>
          <button type="button" className={styles.action} onClick={words.retry}>Try again</button>
        </div>
      )}

      {words.status === 'ready' && rows.length === 0 && (
        <div className={styles.state}>
          <p>No original-language words for this verse.</p>
          <p className={styles.muted}>
            The BSB has no word alignment here. Some verses are left out of its main text, or are English-only.
          </p>
        </div>
      )}

      {rows.length > 0 && (
        <div className={styles.list}>
          {rows.map((row, index) => (
            <button
              key={`${index}-${row.words[0].english_order}`}
              ref={el => { rowRefs.current[index] = el; }}
              type="button"
              className={styles.row}
              onClick={() => {
                savedScroll.current = scrollParent(rootRef.current)?.scrollTop ?? 0;
                setOpen({ targetKey, index });
              }}
            >
              <span className={styles.english}>
                {row.kind === 'untranslated' ? (
                  <span className={styles.muted}>not translated</span>
                ) : row.kind === 'elsewhere' ? (
                  <span className={styles.muted}>translated elsewhere in this verse</span>
                ) : (
                  row.english
                )}
              </span>
              <span className={styles.originals}>
                {row.words.map((word, i) => (
                  <span key={i}>
                    <OriginalWord word={word} />
                    <span className={styles.sub}>
                      {[word.translit, word.gloss].filter(Boolean).join(' · ')}
                    </span>
                  </span>
                ))}
              </span>
            </button>
          ))}
        </div>
      )}
    </div>
  );
}
