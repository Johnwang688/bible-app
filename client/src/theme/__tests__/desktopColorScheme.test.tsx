import { render } from '@testing-library/react-native';
import { Platform } from 'react-native';

import { createStorage, memoryBackend } from '../../storage/storage';
import { ThemeProvider } from '../ThemeProvider';

it('updates the document colour scheme with the theme on web', async () => {
  const originalOS = Platform.OS;
  const originalDocument = Object.getOwnPropertyDescriptor(globalThis, 'document');
  const element = { style: { colorScheme: '' } };
  Object.defineProperty(Platform, 'OS', { configurable: true, value: 'web' });
  Object.defineProperty(globalThis, 'document', { configurable: true, value: { documentElement: element } });
  const storage = createStorage(memoryBackend());
  const tree = (systemScheme: 'light' | 'dark') => <ThemeProvider storage={storage} systemScheme={systemScheme}>{null}</ThemeProvider>;
  try {
    const { rerender } = await render(tree('light'));
    expect(element.style.colorScheme).toBe('light');
    await rerender(tree('dark'));
    expect(element.style.colorScheme).toBe('dark');
    Object.defineProperty(Platform, 'OS', { configurable: true, value: 'ios' });
    await rerender(tree('light'));
    expect(element.style.colorScheme).toBe('dark');
  } finally {
    Object.defineProperty(Platform, 'OS', { configurable: true, value: originalOS });
    if (originalDocument) Object.defineProperty(globalThis, 'document', originalDocument);
    else Reflect.deleteProperty(globalThis, 'document');
  }
});
