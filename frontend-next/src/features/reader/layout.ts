import type { VerseData } from '@/features/reader/types';

export function biblePaneScrollDepthRatio(pane: HTMLElement): number {
  const sh = pane.scrollHeight;
  const ch = pane.clientHeight;
  if (sh <= ch + 2) return 1;
  return Math.min(1, (pane.scrollTop + ch) / sh);
}

/** Build paginated slices by filling a measurement div until scrollHeight exceeds pageHeight. */
export function sliceVersesIntoPages(
  verses: VerseData[],
  measurer: HTMLDivElement,
  pageWidth: number,
  pageHeight: number,
): VerseData[][] {
  if (verses.length === 0 || pageWidth < 64 || pageHeight < 64) return [];
  measurer.innerHTML = '';
  measurer.style.width = `${Math.floor(pageWidth)}px`;
  const pages: VerseData[][] = [];
  let idx = 0;
  while (idx < verses.length) {
    measurer.innerHTML = '';
    const page: VerseData[] = [];
    let j = idx;
    while (j < verses.length) {
      const span = document.createElement('span');
      span.className = 'verse-line';
      const sup = document.createElement('sup');
      sup.className = 'vnum';
      sup.textContent = String(verses[j].verse);
      span.appendChild(sup);
      span.appendChild(document.createTextNode(`${verses[j].text} `));
      measurer.appendChild(span);
      if (measurer.scrollHeight > pageHeight) {
        if (page.length === 0) {
          page.push(verses[j]);
          j++;
        }
        break;
      }
      page.push(verses[j]);
      j++;
    }
    pages.push(page);
    idx = j;
  }
  measurer.innerHTML = '';
  return pages;
}

export function verseStorageKey(book: string, chapter: number, verse: number) {
  return `${book}::${chapter}::${verse}`.toLowerCase();
}

export function formatVerseGroupRef(book: string, chapter: number, verses: number[]): string {
  if (verses.length === 0) return '';
  const sorted = [...verses].sort((a, b) => a - b);
  const parts: string[] = [];
  let start = sorted[0];
  let end = sorted[0];
  for (let i = 1; i <= sorted.length; i++) {
    if (i < sorted.length && sorted[i] === end + 1) {
      end = sorted[i];
    } else {
      if (end === start) parts.push(`${start}`);
      else if (end === start + 1) parts.push(`${start}, ${end}`);
      else parts.push(`${start}\u2013${end}`);
      if (i < sorted.length) { start = sorted[i]; end = sorted[i]; }
    }
  }
  return `${book} ${chapter}:${parts.join(', ')}`;
}

export function chapterStorageKey(book: string, chapter: number, translation: string) {
  return `${book}::${chapter}::${translation}`.toLowerCase();
}

/**
 * Centers a verse line in the reader scroll container. `scrollIntoView({ block: 'center' })` often scrolls the
 * window or the wrong ancestor when the real scroller is `.bible-pane` or a nested overflow region (e.g. paged).
 */
export function scrollVerseLineIntoBiblePaneCenter(verseEl: HTMLElement, biblePane: HTMLElement | null) {
  const pickScrollParent = (): HTMLElement | null => {
    if (biblePane && biblePane.scrollHeight > biblePane.clientHeight + 2) {
      return biblePane;
    }
    let p: HTMLElement | null = verseEl.parentElement;
    while (p) {
      const st = window.getComputedStyle(p);
      const oy = st.overflowY;
      if (
        (oy === 'auto' || oy === 'scroll' || oy === 'overlay') &&
        p.scrollHeight > p.clientHeight + 2
      ) {
        return p;
      }
      p = p.parentElement;
    }
    return biblePane;
  };

  const pane = pickScrollParent();
  if (!pane) {
    verseEl.scrollIntoView({ block: 'center', inline: 'nearest', behavior: 'smooth' });
    return;
  }
  const paneRect = pane.getBoundingClientRect();
  const verseRect = verseEl.getBoundingClientRect();
  const yInContent = verseRect.top - paneRect.top + pane.scrollTop;
  const target = yInContent - pane.clientHeight / 2 + verseRect.height / 2;
  const maxScroll = Math.max(0, pane.scrollHeight - pane.clientHeight);
  pane.scrollTo({ top: Math.min(maxScroll, Math.max(0, target)), behavior: 'smooth' });
}

export function splitVersesForBookMode(verses: VerseData[]) {
  const midpoint = Math.ceil(verses.length / 2);
  return [verses.slice(0, midpoint), verses.slice(midpoint)];
}

export function closestVerseLine(node: Node | null): HTMLElement | null {
  let n: Node | null = node;
  if (n?.nodeType === Node.TEXT_NODE) n = n.parentElement;
  const el = n as Element | null;
  return el?.closest?.('.verse-line[data-verse]') ?? null;
}
