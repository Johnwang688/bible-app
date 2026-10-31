'use client';

import { createContext, useContext, useMemo, useState } from 'react';
import type { Dispatch, ReactNode, SetStateAction } from 'react';
import type { BookInfo, Translation } from '@/features/reader/types';

interface ReaderPositionContextValue {
  books: BookInfo[];
  setBooks: Dispatch<SetStateAction<BookInfo[]>>;
  translations: Translation[];
  setTranslations: Dispatch<SetStateAction<Translation[]>>;
  currentBook: BookInfo | null;
  setCurrentBook: Dispatch<SetStateAction<BookInfo | null>>;
  chapter: number;
  setChapter: Dispatch<SetStateAction<number>>;
  translation: string;
  setTranslation: Dispatch<SetStateAction<string>>;
}

const ReaderPositionContext = createContext<ReaderPositionContextValue | null>(null);

export function ReaderPositionProvider({ children }: { children: ReactNode }) {
  const [books, setBooks]             = useState<BookInfo[]>([]);
  const [translations, setTranslations] = useState<Translation[]>([]);
  const [currentBook, setCurrentBook] = useState<BookInfo | null>(null);
  const [chapter, setChapter]         = useState(1);
  const [translation, setTranslation] = useState('WEB');

  const value = useMemo(
    () => ({
      books, setBooks,
      translations, setTranslations,
      currentBook, setCurrentBook,
      chapter, setChapter,
      translation, setTranslation,
    }),
    [books, translations, currentBook, chapter, translation],
  );
  return <ReaderPositionContext.Provider value={value}>{children}</ReaderPositionContext.Provider>;
}

export function useReaderPosition(): ReaderPositionContextValue {
  const ctx = useContext(ReaderPositionContext);
  if (!ctx) throw new Error('useReaderPosition must be used within a ReaderPositionProvider');
  return ctx;
}
