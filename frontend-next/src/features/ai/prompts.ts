import { MAX_MESSAGE_CHARS } from '@/components/AiSidebar';

export function buildExplainVersePrompt(refLabel: string | undefined, selectedText: string): string {
  const intro = 'Explain what this passage means.\n\n';
  const refLine = refLabel ? `Reference: ${refLabel}\n\n` : '';
  const normalized = selectedText.replace(/\s+/g, ' ').trim();
  const quoted = `"${normalized}"`;
  let full = intro + refLine + quoted;
  if (full.length <= MAX_MESSAGE_CHARS) return full;
  const overhead = intro.length + refLine.length + 4;
  const budget = MAX_MESSAGE_CHARS - overhead;
  const inner =
    normalized.length > budget ? `${normalized.slice(0, Math.max(0, budget - 1))}…` : normalized;
  return intro + refLine + `"${inner}"`;
}
