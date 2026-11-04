import { railWidthFor } from '../layout';
import { activeRailTab } from '../tabs';

it.each([[767, 0], [1023, 0], [1024, 88], [1279, 88], [1280, 208], [1920, 208]])('reserves the rail at %i', (width, rail) => {
  expect(railWidthFor(width)).toBe(rail);
});

it.each([
  ['/', 'home'], ['/bible', 'bible'], ['/study', 'study'], ['/study/memory/week', 'study'],
  ['/entities/person/god', 'study'], ['/me', 'me'], ['/me/help', 'me'],
  ['/search', null], ['/privacy', null], ['/memory/lesson/x', null], ['/meander', null],
] as const)('maps %s to its active rail item', (path, active) => {
  expect(activeRailTab(path)).toBe(active);
});
