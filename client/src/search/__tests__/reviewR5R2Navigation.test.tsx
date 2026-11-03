// Regression test from the Sol review of the R-5 data layer, round 2 (C:/myday/hub/jobs/r5-data-review-r2/review.md).
import { act, renderHook } from '@testing-library/react-native';
import { router } from 'expo-router';
import { useOpenPassage } from '../useOpenPassage';
import { readerTargets } from '../../reader/target';
import { readerPositionKey } from '../../storage/keys';
import { createStorage, memoryBackend } from '../../storage/storage';
jest.mock('expo-router', () => ({ router: { navigate: jest.fn() } }));
afterEach(() => { readerTargets.clear(); jest.clearAllMocks(); });
test('opens a chapter in the Bible tab using the default navigator', async () => {
 const storage = createStorage(memoryBackend());
 storage.set(readerPositionKey, {bookNumber:1,chapter:1,translation:'BSB'});
 const view = await renderHook(() => useOpenPassage({storage}));
 await act(async () => view.result.current({bookNumber:43,chapter:3}));
 expect(router.navigate).toHaveBeenCalledTimes(1);
 expect(router.navigate).toHaveBeenCalledWith('/bible');
});
