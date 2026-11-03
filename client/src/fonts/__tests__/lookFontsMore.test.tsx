// Sol review of the R-7a follow-up, F2 (orchestrator-owned regression; do not edit): a failed face rejects.
import * as Font from 'expo-font';

import { getTheme } from '../../theme/presets';
import {
  ensureLookFonts,
  resetLookFontsForTesting,
} from '../lookFonts';

jest.mock('expo-font', () => ({
  loadAsync: jest.fn(),
  isLoaded: jest.fn(() => false),
  FontDisplay: { SWAP: 'swap' },
}));

test('rejects when a required face fails', async () => {
  resetLookFontsForTesting();
  const error = new Error('offline');
  jest.mocked(Font.loadAsync).mockRejectedValueOnce(error);

  await expect(ensureLookFonts(getTheme('silver'))).rejects.toBe(error);
});
