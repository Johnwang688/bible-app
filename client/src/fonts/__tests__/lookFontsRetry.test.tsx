// A web font that failed to download is forgotten, and unloaded (its failed `@font-face` rule removed) when the next
// `ensureLookFonts` asks for it, so that call downloads it again. Faces that loaded are never unloaded.
import { getTheme } from '../../theme/presets';
import { ensureLookFonts, lookFontNames, resetLookFontsForTesting } from '../lookFonts';

jest.mock('expo-font', () => ({
  loadAsync: jest.fn(),
  unloadAsync: jest.fn(() => Promise.resolve()),
  FontDisplay: { AUTO: 'auto', SWAP: 'swap', BLOCK: 'block', FALLBACK: 'fallback', OPTIONAL: 'optional' },
}));

// eslint-disable-next-line import/first
import * as Font from 'expo-font';

const loadAsync = Font.loadAsync as unknown as jest.Mock;
const unloadAsync = Font.unloadAsync as unknown as jest.Mock;

const theme = getTheme('silver');
const FAILING = 'PlusJakartaSans_700Bold';

const loadedNames = () => loadAsync.mock.calls.map((args) => args[0] as string);

beforeEach(() => {
  loadAsync.mockReset();
  unloadAsync.mockReset();
  unloadAsync.mockImplementation(() => Promise.resolve());
  resetLookFontsForTesting();
});

test('only the failed face is unloaded, when the next call asks for it, and it is downloaded again', async () => {
  let failOnce = true;
  loadAsync.mockImplementation((name: string) =>
    name === FAILING && failOnce ? Promise.reject(new Error('network')) : Promise.resolve(),
  );
  await expect(ensureLookFonts(theme)).rejects.toThrow('network');
  expect(unloadAsync).not.toHaveBeenCalled(); // the failed face stays in its error state until asked for again
  expect(loadedNames().sort()).toEqual([...lookFontNames(theme)].sort());

  failOnce = false;
  loadAsync.mockClear();
  await expect(ensureLookFonts(theme)).resolves.toBeUndefined();
  expect(loadedNames()).toEqual([FAILING]);
  expect(unloadAsync.mock.calls.map((args) => args[0])).toEqual([FAILING]);
  expect(unloadAsync.mock.invocationCallOrder[0]).toBeLessThan(loadAsync.mock.invocationCallOrder[0]!);
});

test('nothing is unloaded when every face loads', async () => {
  loadAsync.mockImplementation(() => Promise.resolve());
  await ensureLookFonts(theme);
  expect(unloadAsync).not.toHaveBeenCalled();
});

test('a failing unloadAsync does not hide the load failure or block the retry', async () => {
  let failOnce = true;
  loadAsync.mockImplementation((name: string) =>
    name === FAILING && failOnce ? Promise.reject(new Error('network')) : Promise.resolve(),
  );
  unloadAsync.mockImplementation(() => Promise.reject(new Error('nothing to unload')));
  await expect(ensureLookFonts(theme)).rejects.toThrow('network');
  failOnce = false;
  loadAsync.mockClear();
  await ensureLookFonts(theme);
  expect(loadedNames()).toEqual([FAILING]);
});

test('concurrent callers share a face; a failed face is not unloaded until asked for again', async () => {
  loadAsync.mockImplementation((name: string) =>
    name === FAILING ? Promise.reject(new Error('network')) : Promise.resolve(),
  );
  const results = await Promise.allSettled([ensureLookFonts(theme), ensureLookFonts(theme)]);
  expect(results.map((r) => r.status)).toEqual(['rejected', 'rejected']);
  expect(loadedNames().filter((n) => n === FAILING)).toHaveLength(1);
  expect(unloadAsync).not.toHaveBeenCalled();
});
