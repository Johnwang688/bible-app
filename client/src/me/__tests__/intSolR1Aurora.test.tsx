// INT Sol round 1: app-background text must carry the halo when aurora is mounted.
// These are ordinary failing tests, deliberately left red for the owning implementer.
import { act, fireEvent, screen, within } from '@testing-library/react-native';

import { queryKeys } from '../../api';
import { auroraTextShadow } from '../../aurora';
import { EntityListScreen } from '../../entities/components/EntityListScreen';
import { ENTITY_KINDS } from '../../entities/data';
import { appearanceKey } from '../../storage/keys';
import { createStorage, memoryBackend, setStorageForTesting } from '../../storage/storage';
import { renderStudy } from '../../study/__tests__/studyHarness';
import { getTheme } from '../../theme/presets';
import { AdvancedScreen } from '../AdvancedScreen';
import { CustomiseScreen } from '../CustomiseScreen';
import { SourcesScreen } from '../SourcesScreen';
import { renderMe, ZH } from './meHarness';

afterEach(() => setStorageForTesting(null));

const halo = auroraTextShadow(getTheme('silver'));

describe('INT-R1 F1: Me sub-screen text directly on the aurora', () => {
  it('gives the Reset label a halo', async () => {
    await renderMe(<CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />);
    expect(screen.getByTestId('aurora-background')).toBeTruthy();
    expect(within(screen.getByTestId('customise-reset')).getByText('Reset')).toHaveStyle(halo);
  });

  it('gives the text-size value a halo', async () => {
    await renderMe(<CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />);
    expect(screen.getByTestId('aurora-background')).toBeTruthy();
    expect(screen.getByTestId('customise-size-value')).toHaveStyle(halo);
  });

  it('gives the Chinese Scripture font note a halo', async () => {
    await renderMe(<CustomiseScreen onBack={() => {}} onAdvanced={() => {}} />, { locales: [ZH] });
    expect(screen.getByTestId('aurora-background')).toBeTruthy();
    expect(screen.getByTestId('customise-font-note')).toHaveStyle(halo);
  });

  it('gives the Advanced contrast instructions a halo', async () => {
    await renderMe(<AdvancedScreen onBack={() => {}} />);
    expect(screen.getByTestId('aurora-background')).toBeTruthy();
    expect(screen.getByText(/^Changes apply to Silver only\./)).toHaveStyle(halo);
  });

  it('gives the Sources introduction a halo', async () => {
    await renderMe(<SourcesScreen onBack={() => {}} />);
    expect(screen.getByTestId('aurora-background')).toBeTruthy();
    expect(screen.getByText('Every text in this app is public domain or openly licensed.')).toHaveStyle(halo);
  });
});

describe('INT-R1 F2: Study and entity state text directly on the aurora', () => {
  it.each(['Nothing saved yet', 'Tap a verse in the Bible to highlight it, write a note or bookmark it.'])('gives the empty Study message "%s" a halo', async (text) => {
    const storage = createStorage(memoryBackend());
    storage.set(appearanceKey, { preset: 'silver', mode: 'light' });
    setStorageForTesting(storage);
    const { queryClient } = await renderStudy({ storage });
    try {
      expect(screen.getByTestId('aurora-background')).toBeTruthy();
      expect(within(screen.getByTestId('study-empty')).getByText(text)).toHaveStyle(halo);
    } finally {
      queryClient.clear();
    }
  });

  it.each(['This page isn’t here', 'The link may be out of date.'])('gives the entity state message "%s" a halo', async (text) => {
    await renderMe(<EntityListScreen kind={null} onBack={() => {}} />);
    expect(screen.getByTestId('aurora-background')).toBeTruthy();
    expect(within(screen.getByTestId('entity-not-found')).getByText(text)).toHaveStyle(halo);
  });

  it('gives the Explore no-match explanation a halo', async () => {
    const storage = createStorage(memoryBackend());
    setStorageForTesting(storage);
    const { queryClient } = await renderStudy({ storage });
    try {
      await act(() => {
        for (const kind of ENTITY_KINDS) queryClient.setQueryData(queryKeys.entities(kind), []);
      });
      await fireEvent.press(screen.getByTestId('study-tab-explore'));
      await fireEvent.changeText(screen.getByTestId('explore-find'), 'zzzzzz');
      expect(screen.getByTestId('aurora-background')).toBeTruthy();
      expect(screen.getByTestId('explore-no-match')).toHaveStyle(halo);
    } finally {
      queryClient.clear();
    }
  });
});
