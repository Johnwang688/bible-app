// Verifier round 2 (GPT-6.1 Sol): mutant-killing regression test. Orchestrator-owned; do not edit.
import { act, render } from '@testing-library/react-native';
import { useEffect } from 'react';

import { languageKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
import { I18nProvider, useI18n } from '../I18nProvider';

test('formatDate follows the resolved locale and forwards options', async () => {
  let latest: ReturnType<typeof useI18n> | undefined;

  function Probe() {
    const value = useI18n();
    useEffect(() => {
      latest = value;
    }, [value]);
    return null;
  }

  const storage = createStorage(memoryBackend());
  await render(
    <I18nProvider storage={storage} locales={[{ languageTag: 'zh-CN', languageCode: 'zh', regionCode: 'CN' }]}>
      <Probe />
    </I18nProvider>,
  );

  const date = new Date('2026-01-15T12:00:00Z');
  const options: Intl.DateTimeFormatOptions = { year: 'numeric', month: 'long', day: 'numeric', timeZone: 'UTC' };
  expect(latest!.formatDate(date, options)).toBe(new Intl.DateTimeFormat('zh-Hans', options).format(date));

  await act(async () => storage.set(languageKey, 'en'));
  expect(latest!.formatDate(date, options)).toBe(new Intl.DateTimeFormat('en', options).format(date));
});
