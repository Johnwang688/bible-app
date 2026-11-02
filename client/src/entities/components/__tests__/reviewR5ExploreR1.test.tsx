// R-5 part 2, Sol review r1 (Explore F1 retry only failed lists, F2 sample names): mutant-killing regression tests (pass on HEAD).
import { QueryClient } from '@tanstack/react-query';
import {
  act, fireEvent, render, screen, within,
} from '@testing-library/react-native';

import { ApiProvider } from '../../../api/ApiProvider';
import { ApiError, type ApiClient } from '../../../api/client';
import type {
  EntityKind, SummaryEntityListItemOut,
} from '../../../api/schemas';
import { I18nProvider } from '../../../i18n/I18nProvider';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { ExploreView } from '../ExploreView';

const item = (label: string): SummaryEntityListItemOut => ({
  slug: label.toLowerCase().replace(/ /g, '-'),
  label,
});

const lists: Record<EntityKind, SummaryEntityListItemOut[]> = {
  person: [item('Abraham'), item('King David'), item('John')],
  place: [item('Rome')],
  theme: [item('Grace')],
};

async function mount(
  load: (kind: EntityKind) => Promise<SummaryEntityListItemOut[]>
    = async (kind) => lists[kind],
) {
  const calls: EntityKind[] = [];
  const api = {
    entities: async (kind: EntityKind) => {
      calls.push(kind);
      return load(kind);
    },
  } as unknown as ApiClient;

  const storage = createStorage(memoryBackend());
  const queryClient = new QueryClient({
    defaultOptions: { queries: { retry: false, gcTime: Infinity } },
  });

  await render(
    <ApiProvider client={api} queryClient={queryClient}>
      <I18nProvider
        storage={storage}
        locales={[{
          languageTag: 'en-US',
          languageCode: 'en',
          regionCode: 'US',
        }]}
      >
        <ThemeProvider storage={storage} systemScheme="light">
          <ExploreView
            header={null}
            bottomInset={120}
            onOpen={jest.fn()}
          />
        </ThemeProvider>
      </I18nProvider>
    </ApiProvider>,
  );
  await act(async () => undefined);
  return { calls };
}

it('retry refetches only failed lists', async () => {
  let down = true;
  const { calls } = await mount(async (kind) => {
    if (kind === 'place' && down) {
      throw new ApiError({
        kind: 'network',
        status: 0,
        path: '/summary-entities/list/place',
      });
    }
    return lists[kind];
  });

  expect(screen.getByTestId('explore-find').props.editable).toBe(false);
  down = false;
  await fireEvent.press(screen.getByTestId('explore-retry'));
  await act(async () => undefined);

  expect(screen.getByTestId('explore-card-place')).toBeTruthy();
  expect(screen.getByTestId('explore-find').props.editable).toBe(true);
  expect(calls.filter((kind) => kind === 'person')).toHaveLength(1);
  expect(calls.filter((kind) => kind === 'place')).toHaveLength(2);
  expect(calls.filter((kind) => kind === 'theme')).toHaveLength(1);
});

it('shows only supported sample names in the specified order', async () => {
  await mount(async (kind) => kind === 'person'
    ? [item('Zed'), item('Paul'), item('Moses')]
    : lists[kind]);

  const card = within(screen.getByTestId('explore-card-person'));
  expect(card.getByText('Moses \u00b7 Paul').props.numberOfLines).toBe(1);
  expect(card.queryByText(/Abraham|Zed/)).toBeNull();
});

it('falls back to the first five labels when no canonical samples exist', async () => {
  await mount(async (kind) => kind === 'person'
    ? ['Atlas', 'Bravo', 'Charlie', 'Delta', 'Echo', 'Foxtrot'].map(item)
    : lists[kind]);

  const card = within(screen.getByTestId('explore-card-person'));
  expect(
    card.getByText(
      'Atlas \u00b7 Bravo \u00b7 Charlie \u00b7 Delta \u00b7 Echo',
    ).props.numberOfLines,
  ).toBe(1);
  expect(card.queryByText(/Foxtrot/)).toBeNull();
});
