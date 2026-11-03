// Regression test from the Sol review of the R-5 data layer (round 1): F11 kills a surviving mutant.
import { matchEntities } from '../data';

test('F11: a word after a hyphen matches', () => {
  expect(matchEntities({ person: [{ slug: 'mary-magdalene', label: 'Mary-Magdalene' }] }, 'magd')).toEqual([
    { kind: 'person', slug: 'mary-magdalene', label: 'Mary-Magdalene' },
  ]);
});
