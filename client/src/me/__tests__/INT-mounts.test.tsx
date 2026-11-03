// INT: the goal row, the beta label and note in the language sheet, and About's link to the privacy page.
import { act, fireEvent, screen } from '@testing-library/react-native';

import { readingProgressKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { AboutScreen } from '../AboutScreen';
import { MeScreen } from '../MeScreen';
import { renderMe } from './meHarness';

const mockBeta = jest.fn<boolean, []>(() => false);
jest.mock('../../beta', () => {
  const actual = jest.requireActual('../../beta');
  return {
    ...actual,
    languageLabelKey: (lang: string) => (mockBeta() && lang === 'zh-Hans' ? 'beta.language.zh-Hans' : `language.${lang}`),
    showChineseBetaNote: () => mockBeta(),
  };
});

beforeEach(() => mockBeta.mockReturnValue(false));

describe('Me: daily goal row', () => {
  it('shows the stored goal and opens the goal sheet', async () => {
    const storage = createStorage(memoryBackend());
    storage.set(readingProgressKey, { ...storage.get(readingProgressKey), goalMinutes: 25 });
    await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
    expect(screen.getByTestId('me-row-goal-value')).toHaveTextContent('25 min');
    expect(screen.queryByTestId('goal-sheet')).toBeNull();
    fireEvent.press(screen.getByTestId('me-row-goal'));
    expect(await screen.findByTestId('goal-sheet')).toBeTruthy();
  });

  it('follows a goal written elsewhere', async () => {
    const storage = createStorage(memoryBackend());
    await renderMe(<MeScreen onNavigate={() => {}} />, { storage });
    await act(async () => storage.set(readingProgressKey, { ...storage.get(readingProgressKey), goalMinutes: 40 }));
    expect(screen.getByTestId('me-row-goal-value')).toHaveTextContent('40 min');
  });
});

describe('Me: language sheet in the beta build', () => {
  it('labels Chinese as beta and shows the note, tied to the Chinese option', async () => {
    mockBeta.mockReturnValue(true);
    await renderMe(<MeScreen onNavigate={() => {}} />);
    fireEvent.press(screen.getByTestId('me-row-language'));
    const note = await screen.findByTestId('me-language-beta-note');
    expect(note.props.nativeID).toBe('me-language-beta-note');
    expect(screen.getByTestId('me-language-zh-Hans').props['aria-describedby']).toBe('me-language-beta-note');
    expect(screen.getByTestId('me-language-en').props['aria-describedby']).toBeUndefined();
    expect(screen.getByLabelText('简体中文（测试版）')).toBeTruthy();
  });

  it('shows no note and the plain label outside the beta build', async () => {
    await renderMe(<MeScreen onNavigate={() => {}} />);
    fireEvent.press(screen.getByTestId('me-row-language'));
    await screen.findByTestId('me-language-sheet');
    expect(screen.queryByTestId('me-language-beta-note')).toBeNull();
    expect(screen.getByTestId('me-language-zh-Hans').props['aria-describedby']).toBeUndefined();
    expect(screen.getByLabelText('简体中文')).toBeTruthy();
    expect(screen.queryByLabelText(/测试版/)).toBeNull();
  });
});

describe('About: privacy link', () => {
  it('calls onPrivacy', async () => {
    const onPrivacy = jest.fn();
    await renderMe(<AboutScreen onBack={() => {}} onPrivacy={onPrivacy} />);
    const link = screen.getByTestId('about-privacy-link');
    expect(link.props.accessibilityRole).toBe('link');
    expect(screen.getByText('Read the privacy policy')).toBeTruthy();
    fireEvent.press(link);
    expect(onPrivacy).toHaveBeenCalledTimes(1);
  });
});
