// Acceptance (English Memory; orchestrator-owned): the English verse data, as fetched by
// scripts/fetch_tms_english.py. Every TMS verse has English text, and its chunks join back to it exactly.
import { getAllMemoryVerses } from '../library';
import { TMS_ENGLISH, TMS_ENGLISH_TRANSLATION } from '../library/tmsEnglish';

const verses = getAllMemoryVerses();

it('covers exactly the 60 TMS verses', () => {
  expect(verses).toHaveLength(60);
  expect(Object.keys(TMS_ENGLISH).sort()).toEqual(verses.map((v) => v.id).sort());
});

it('is the ESV or the BSB', () => {
  expect(['ESV', 'BSB']).toContain(TMS_ENGLISH_TRANSLATION);
});

it.each(verses.map((v) => [v.referenceEn, v] as const))('%s: chunks join back to the exact text', (_, verse) => {
  expect(verse.textEn).toBe(TMS_ENGLISH[verse.id]!.text);
  expect(verse.chunksEn.join(' ')).toBe(verse.textEn);
  expect(verse.chunksEn.length).toBeGreaterThanOrEqual(2);
  for (const chunk of verse.chunksEn) {
    expect(chunk).toBe(chunk.trim());
    expect(chunk).not.toBe('');
    expect(chunk).not.toMatch(/\s{2}/);
  }
});

it('carries no verse numbers, headings or copyright text', () => {
  for (const verse of verses) {
    expect(verse.textEn).not.toMatch(/\[\d+\]|\(ESV\)|Crossway|^\d/);
  }
});
