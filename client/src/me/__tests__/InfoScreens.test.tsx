// Acceptance (orchestrator-owned): Sources and credits, About and privacy, Help (R-6a).
import { act, fireEvent, screen } from '@testing-library/react-native';
import Constants from 'expo-constants';
import { Linking } from 'react-native';

import { AboutScreen } from '../AboutScreen';
import { HelpScreen } from '../HelpScreen';
import { SourcesScreen } from '../SourcesScreen';
import { renderMe, ZH } from './meHarness';

describe('Sources and credits', () => {
  it('credits every source the app shows, and links STEP Bible', async () => {
    const calls: string[] = [];
    await renderMe(<SourcesScreen onBack={() => calls.push('back')} />);
    expect(screen.getByTestId('screen-sources')).toBeTruthy();
    for (const s of [
      'Sources and credits',
      'Every text in this app is public domain or openly licensed.',
      'Berean Standard Bible (BSB), with its translation tables for Original words: public domain.',
      'World English Bible (WEB): public domain.',
      'American Standard Version (ASV, 1901): public domain.',
      'Chinese Union Version (1919), Simplified and Traditional: public domain.',
      'Hebrew and Greek lexicons: STEP Bible (Tyndale House, Cambridge), CC BY 4.0.',
      "Commentary: Matthew Henry's Commentary on the Whole Bible (1706): public domain.",
    ]) {
      expect(screen.getByText(s)).toBeTruthy();
    }
    const open = jest.spyOn(Linking, 'openURL').mockResolvedValue(true);
    const link = screen.getByTestId('credits-step-link');
    expect(link.props.accessibilityRole).toBe('link');
    await act(async () => fireEvent.press(link));
    expect(open).toHaveBeenCalledWith('https://www.stepbible.org');
    await act(async () => fireEvent.press(screen.getByTestId('sources-back')));
    expect(calls).toEqual(['back']);
  });
});

describe('About and privacy', () => {
  it('says what stays on the device and shows the version', async () => {
    await renderMe(<AboutScreen onBack={() => {}} />);
    expect(screen.getByTestId('screen-about')).toBeTruthy();
    expect(screen.getByText('Privacy')).toBeTruthy();
    expect(screen.getByText(/stay on this device/)).toBeTruthy();
    const version = Constants.expoConfig?.version ?? '';
    expect(version).not.toBe('');
    expect(screen.getByTestId('about-version')).toHaveTextContent(`Version ${version}`);
    expect(screen.getByTestId('about-back')).toBeTruthy();
  });
});

describe('Help', () => {
  it('answers the four questions, in both languages', async () => {
    await renderMe(<HelpScreen onBack={() => {}} />);
    expect(screen.getByTestId('screen-help')).toBeTruthy();
    for (const q of ['How do I highlight a verse?', 'How do I read two translations side by side?', 'How do I see the Hebrew or Greek?', 'Will my notes move to a new phone?']) {
      expect(screen.getByText(q).props.accessibilityRole).toBe('header');
    }
    expect(screen.getByTestId('help-back')).toBeTruthy();
  });

  it('in Chinese', async () => {
    await renderMe(<HelpScreen onBack={() => {}} />, { locales: [ZH] });
    expect(screen.getByText('帮助')).toBeTruthy();
    expect(screen.getByText('怎样高亮经文？')).toBeTruthy();
  });
});
