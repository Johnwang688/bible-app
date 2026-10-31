/**
 * Labels that should be silently dropped from people/place tags —
 * abstract nouns and natural phenomena that crept into AI-generated key_people lists.
 */
export const ENTITY_SKIP_LABELS = new Set([
  'light', 'darkness', 'earth', 'heavens', 'heaven', 'waters', 'water', 'land',
  'the land', 'firmament', 'void', 'sky', 'deep', 'the deep', 'fire', 'night',
  'day', 'breath', 'clay', 'chaos', 'sea', 'clouds', 'cloud', 'storm', 'rain',
  'wind', 'dust', 'shadow', 'glory', 'spirit', 'the spirit',
]);

// Additional abstract/generic geographic words that aren't proper place names.
// Compound names containing these words (e.g. "Wilderness of Sinai", "Mount Moriah")
// are kept because they won't match this exact set.
export const PLACE_ABSTRACT_LABELS = new Set([
  'wilderness', 'the wilderness', 'mountain', 'mountains', 'the mountain',
  'valley', 'the valley', 'river', 'the river', 'desert', 'the desert',
  'field', 'fields', 'the field', 'city', 'the city', 'town', 'the town',
  'forest', 'the forest', 'cave', 'the cave', 'hill', 'the hill', 'hills',
  'plain', 'the plain', 'shore', 'coast', 'border', 'gate', 'the gate',
  'road', 'the road', 'way', 'the way', 'path', 'the path',
  'camp', 'the camp', 'palace', 'the palace', 'house', 'the house',
  'land of canaan', 'the land of canaan',
]);

export function isSkipLabel(label: string): boolean {
  return ENTITY_SKIP_LABELS.has(label.toLowerCase().trim());
}

export function isSkipPlaceLabel(label: string): boolean {
  const l = label.toLowerCase().trim();
  return ENTITY_SKIP_LABELS.has(l) || PLACE_ABSTRACT_LABELS.has(l);
}

export function slugifyEntityLabel(label: string): string {
  return label
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .replace(/-{2,}/g, '-');
}

export function parseSummaryContent(content: string) {
  const result = {
    title: '', summary: '',
    themes: [] as string[], people: [] as string[], places: [] as string[],
    points: [] as string[], verses: [] as string[],
  };
  const titleMatch = content.match(/^TITLE::(.+)/m);
  if (titleMatch) result.title = titleMatch[1].trim();
  let rest = content.replace(/^TITLE::.+\n?/, '').trim();
  const themesMatch = rest.match(/^Themes:\s*(.+)$/m);
  if (themesMatch) result.themes = themesMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const peopleMatch = rest.match(/^Key People:\s*(.+)$/m);
  if (peopleMatch) result.people = peopleMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const placesMatch = rest.match(/^Key Places:\s*(.+)$/m);
  if (placesMatch) result.places = placesMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const versesMatch = rest.match(/^Supporting Verses:\s*(.+)$/m);
  if (versesMatch) result.verses = versesMatch[1].split(' · ').map(s => s.trim()).filter(Boolean);
  const pointsMatch = rest.match(/^Key Points:\n([\s\S]+?)(?=\n\n[A-Z]|$)/m);
  if (pointsMatch) {
    result.points = pointsMatch[1].split('\n').map(l => l.replace(/^• /, '').trim()).filter(Boolean);
  }
  const sectionStart = rest.search(/^(Themes:|Key People:|Key Places:|Key Points:|Supporting Verses:)/m);
  result.summary = (sectionStart > 0 ? rest.slice(0, sectionStart) : rest).trim();
  return result;
}
