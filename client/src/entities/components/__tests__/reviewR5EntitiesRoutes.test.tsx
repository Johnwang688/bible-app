// R-5 part 2, Sol review r1 (entities F3 array route params): mutant-killing regression tests (pass on HEAD).
import { useLocalSearchParams } from 'expo-router';
import EntityListRoute from '../../../app/entities/[kind]/index';
import EntityPageRoute from '../../../app/entities/[kind]/[slug]';

jest.mock('expo-router', () => ({ useLocalSearchParams: jest.fn() }));
jest.mock('../EntityListScreen', () => ({ EntityListScreen: () => null }));
jest.mock('../EntityPageScreen', () => ({ EntityPageScreen: () => null }));

it('takes the first q and kind when route params are arrays', () => {
  jest.mocked(useLocalSearchParams).mockReturnValue({
    kind: ['person', 'place'], q: ['john mark', 'aaron'],
  });
  expect(EntityListRoute().props).toMatchObject({
    kind: 'person', initialFilter: 'john mark',
  });
});

it('takes the first slug when route params are arrays', () => {
  jest.mocked(useLocalSearchParams).mockReturnValue({
    kind: ['person'], slug: ['john-mark', 'god'],
  });
  expect(EntityPageRoute().props).toMatchObject({
    kind: 'person', slug: 'john-mark',
  });
});

it('preserves decoded q text and rejects an unknown kind', () => {
  jest.mocked(useLocalSearchParams).mockReturnValue({
    kind: ['unknown', 'person'], q: 'John & Mary',
  });
  expect(EntityListRoute().props).toMatchObject({
    kind: null, initialFilter: 'John & Mary',
  });
});
