import { BOOKS } from '../../reader/__tests__/readerHarness';
import { parseSummary } from '../parseSummary';

const parse = (text: string) => parseSummary(text, BOOKS);

it('parses every section, preserving paragraphs and positional supporting ranges while hiding tags', () => {
  expect(parse('TITLE::A title\r\n\r\nFirst paragraph.\r\n\r\nSecond paragraph.\r\n\r\nThemes: faith\r\nKey People: Jesus\r\nKey Places: Jerusalem\r\n\r\nKey Points:\r\n• First point\r\n• Second point\r\n\r\nSupporting Verses: John 3:1-8 · John 3:16')).toEqual({
    title: 'A title', paragraphs: ['First paragraph.', 'Second paragraph.'],
    points: [
      { text: 'First point', target: { bookNumber: 43, chapter: 3, start: 1, end: 8 } },
      { text: 'Second point', target: { bookNumber: 43, chapter: 3, start: 16, end: 16 } },
    ],
  });
});

it.each(['', ' \n ', 'Themes: faith\nKey People: Jesus\nKey Places: Jerusalem'])('handles empty content %j', (content) => {
  expect(parse(content)).toBeNull();
});

it('handles absent title, tags, points, prose and references independently', () => {
  expect(parse('Only prose.')).toEqual({ title: '', paragraphs: ['Only prose.'], points: [] });
  expect(parse('TITLE::Title only')).toEqual({ title: 'Title only', paragraphs: [], points: [] });
  expect(parse('Key Points:\n• Point only')).toEqual({ title: '', paragraphs: [], points: [{ text: 'Point only', target: null }] });
});

it('does not shift a missing or invalid verse onto another point or invent a link', () => {
  const summary = parse('Key Points:\n• One\n• Two\n• Three\n• Four\nSupporting Verses: invalid · · John 3:16–18');
  expect(summary?.points.map((p) => p.target)).toEqual([null, null, { bookNumber: 43, chapter: 3, start: 16, end: 18 }, null]);
  expect(parse('Key Points:\n• One\nSupporting Verses: John 3:16 · John 3:17')?.points).toHaveLength(1);
});

it('validates ranges and resolves numbered books, cross-book references and dash variants', () => {
  const summary = parse('Key Points:\n• One\n• Two\n• Three\n• Four\nSupporting Verses: 1 Corinthians 13:4–7 · Psalm 117:2 · John 3:18-16 · John 3');
  expect(summary?.points.map((p) => p.target)).toEqual([
    { bookNumber: 46, chapter: 13, start: 4, end: 7 },
    { bookNumber: 19, chapter: 117, start: 2, end: 2 }, null, null,
  ]);
});
