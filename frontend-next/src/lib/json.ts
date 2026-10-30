export function safelyParseJson<T>(raw: string | null, fallback: T): T {
  if (!raw) return fallback;
  try {
    return JSON.parse(raw) as T;
  } catch {
    return fallback;
  }
}

export function asStringArray(value: unknown): string[] {
  return Array.isArray(value) ? value.filter((entry): entry is string => typeof entry === 'string') : [];
}

export function asPlainObject<T extends object>(value: unknown): T {
  return value !== null && typeof value === 'object' && !Array.isArray(value) ? (value as T) : ({} as T);
}

export function asPassageArray<T extends { book: string; chapter: number }>(value: unknown): T[] {
  if (!Array.isArray(value)) return [];
  return value.filter(
    (entry): entry is T =>
      entry !== null &&
      typeof entry === 'object' &&
      typeof (entry as { book?: unknown }).book === 'string' &&
      typeof (entry as { chapter?: unknown }).chapter === 'number',
  );
}
