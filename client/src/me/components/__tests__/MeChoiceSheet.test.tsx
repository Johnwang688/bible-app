// The choice sheet writes once however many times an option is tapped while it closes; and the Me
// screen's Translation and Parallel pickers behave the same through the real storage hooks.
import { act, fireEvent, screen } from '@testing-library/react-native';

import { readerPositionKey, readingSettingsKey } from '../../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../../storage/storage';
import { MeScreen } from '../../MeScreen';
import { renderMe } from '../../__tests__/meHarness';
import { MeChoiceSheet } from '../MeChoiceSheet';

afterEach(() => setStorageForTesting(null));

describe('MeChoiceSheet', () => {
  it('reports the first tap only, marks the selected option, and offers a close button', async () => {
    const chosen: string[] = [];
    let closed = 0;
    await renderMe(
      <MeChoiceSheet
        testID="sheet"
        titleKey="me.row.language"
        choices={[
          { value: 'a', testID: 'opt-a', label: 'A' },
          { value: 'b', testID: 'opt-b', label: 'B' },
        ]}
        selected="a"
        onChoose={(v) => chosen.push(v)}
        onClose={() => closed++}
      />,
    );
    expect(screen.getByTestId('opt-a').props.accessibilityState).toMatchObject({ selected: true });
    expect(screen.getByTestId('opt-b').props.accessibilityState).toMatchObject({ selected: false });
    await fireEvent.press(screen.getByTestId('opt-b'));
    await fireEvent.press(screen.getByTestId('opt-b'));
    await fireEvent.press(screen.getByTestId('opt-a'));
    expect(chosen).toEqual(['b']);
    expect(closed).toBe(1);
  });

  it('close does not choose', async () => {
    const chosen: string[] = [];
    let closed = 0;
    await renderMe(
      <MeChoiceSheet
        testID="sheet"
        titleKey="me.row.language"
        choices={[{ value: 'a', testID: 'opt-a', label: 'A' }]}
        selected="a"
        onChoose={(v) => chosen.push(v)}
        onClose={() => closed++}
      />,
    );
    await fireEvent.press(screen.getByTestId('sheet-close'));
    expect(chosen).toEqual([]);
    expect(closed).toBe(1);
  });
});

describe('Me reading rows', () => {
  it('a second tap on the version picker while it closes does not write twice', async () => {
    const storage = createStorage(memoryBackend());
    setStorageForTesting(storage);
    storage.set(readerPositionKey, { bookNumber: 43, chapter: 3, translation: 'BSB' });
    storage.set(readingSettingsKey, { textSize: 2, parallel: 'ASV' });
    let writes = 0;
    storage.subscribe(readerPositionKey, () => writes++);
    await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
    await fireEvent.press(screen.getByTestId('me-row-translation'));
    const web = await screen.findByTestId('version-WEB');
    const asv = screen.getByTestId('version-ASV');
    await act(async () => {
      fireEvent.press(web);
      fireEvent.press(asv);
    });
    expect(writes).toBe(1);
    expect(storage.get(readerPositionKey)?.translation).toBe('WEB');
    // The parallel translation was ASV, not WEB, so it stays.
    expect(storage.get(readingSettingsKey).parallel).toBe('ASV');
  });

  it('the parallel sheet closes without writing when dismissed', async () => {
    const storage = createStorage(memoryBackend());
    setStorageForTesting(storage);
    await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
    await fireEvent.press(screen.getByTestId('me-row-parallel'));
    await fireEvent.press(await screen.findByTestId('me-parallel-sheet-close'));
    expect(screen.queryByTestId('me-parallel-sheet')).toBeNull();
    expect(storage.get(readingSettingsKey).parallel).toBeNull();
  });
});
