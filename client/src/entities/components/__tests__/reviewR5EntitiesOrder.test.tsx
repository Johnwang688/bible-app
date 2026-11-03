// R-5 part 2, Sol review r1 (entities F2 sorting): mutant-killing regression tests (pass on HEAD).
import { render, screen } from '@testing-library/react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { I18nProvider } from '../../../i18n/I18nProvider';
import { createStorage, memoryBackend } from '../../../storage/storage';
import { ThemeProvider } from '../../../theme/ThemeProvider';
import { EntityListScreen } from '../EntityListScreen';

jest.mock('../../data', () => ({
  ...jest.requireActual('../../data'),
  useEntityList: () => ({
    data: [
      { slug: 'john-z', label: 'John Z' },
      { slug: 'john-a', label: 'John A' },
    ],
    isError: false,
  }),
}));

it('sorts filtered rows even when the API list is unordered', async () => {
  const storage = createStorage(memoryBackend());
  await render(
    <SafeAreaProvider initialMetrics={{
      frame: { x: 0, y: 0, width: 390, height: 844 },
      insets: { top: 0, left: 0, right: 0, bottom: 0 },
    }}>
      <I18nProvider storage={storage} locales={[
        { languageTag: 'en-US', languageCode: 'en', regionCode: 'US' },
      ]}>
        <ThemeProvider storage={storage} systemScheme="light">
          <EntityListScreen
            kind="person"
            initialFilter="john"
            onBack={() => {}}
          />
        </ThemeProvider>
      </I18nProvider>
    </SafeAreaProvider>,
  );

  expect(screen.getAllByTestId(/^entity-row-/).map(row => row.props.testID))
    .toEqual(['entity-row-john-a', 'entity-row-john-z']);
});
