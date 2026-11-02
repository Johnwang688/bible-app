// S4-1 fix (R6b-fu-sec4-rules): the adapter's push path never gets stuck on a client clock the rules refuse.
// Items and settings stamped past now + CLOCK_AHEAD_MAX_MS are held back and the rest is written; a goal
// stamped that far ahead is omitted from the device document; a batch refused anyway is retried document by
// document; a refusal of the whole account (the deletion marker) still surfaces as an error.
// Run: export PATH="/c/dev/tools/jdk-21.0.13+9-jre/bin:$PATH"; npm run test:emulator
import { createFirestoreRemote, CLOCK_AHEAD_MAX_MS } from '../../firestoreRemote';
import type { DeviceProgress, RemoteItem, RemoteSetting } from '../../types';
import { clearFirestore, closeAll, dbAs, FIRESTORE_HOST, FIRESTORE_PORT, PROJECT } from './emulator';

const DEV = 'Cl0ck_-Ahead01234567';
const HOUR = 3_600_000;
const DAY = 24 * HOUR;

let warn: jest.SpyInstance;
beforeEach(async () => {
  await clearFirestore();
  warn = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
});
afterEach(() => {
  warn.mockRestore();
  jest.restoreAllMocks();
});
afterAll(closeAll);

const alice = () => createFirestoreRemote(dbAs('alice'), 'alice');
/** The adapter's own warnings (the Firestore SDK also warns about each refused write). */
const syncWarnings = () => warn.mock.calls.map((c) => c.join(' ')).filter((w) => w.startsWith('[sync]'));
const warnings = () => syncWarnings().join('\n');

const note = (ref: string, text: string, updatedAt = Date.now() - 1000, deviceId = DEV): RemoteItem => ({
  id: `note:${ref}`,
  kind: 'note',
  ref,
  deleted: false,
  value: { text },
  updatedAt,
  deviceId,
});

const setting = (key: RemoteSetting['key'], json: string, updatedAt = Date.now() - 1000): RemoteSetting => ({
  key,
  json,
  updatedAt,
  deviceId: DEV,
});

const progress = (over: Partial<DeviceProgress> = {}): DeviceProgress => ({
  deviceId: DEV,
  activeMs: { '2026-11-02': 300_000 },
  chaptersRead: { '43:3': '2026-11-02T10:00:00.000Z' },
  goalMetDays: ['2026-11-02'],
  goal: { minutes: 15, updatedAt: Date.now() - 1000 },
  updatedAt: Date.now() - 1000,
  ...over,
});

async function ids(): Promise<string[]> {
  return (await alice().pullItems(null)).items.map((i) => i.id).sort();
}

async function mine(): Promise<DeviceProgress | undefined> {
  return (await alice().pullDevices()).find((d) => d.deviceId === DEV);
}

describe('items and settings stamped too far ahead are held back; the rest is written', () => {
  test('a note two days ahead is held back, the others are written, with one warning and no user data', async () => {
    const list = [note('1:1:1', 'secret ahead', Date.now() + 2 * DAY), note('43:3:16', 'For God so loved'), note('19:23:1', 'shepherd')];
    const before = JSON.stringify(list);
    await alice().pushItems(list);
    expect(await ids()).toEqual(['note:19:23:1', 'note:43:3:16']);
    expect(JSON.stringify(list)).toBe(before); // the caller's values are not changed
    expect(syncWarnings()).toHaveLength(1);
    expect(warnings()).toMatch(/1 study items/);
    expect(warnings()).toMatch(/clock/);
    expect(warnings()).not.toMatch(/secret|1:1:1|shepherd/);
  });

  test('the bound is now + 23 h: a clock 22 h ahead is written, one 23 h 1 min ahead is held back', async () => {
    expect(CLOCK_AHEAD_MAX_MS).toBe(23 * HOUR);
    await alice().pushItems([note('1:1:1', 'a', Date.now() + 22 * HOUR), note('1:1:2', 'b', Date.now() + 23 * HOUR + 60_000)]);
    expect(await ids()).toEqual(['note:1:1:1']);
  });

  test('a push of only held-back items resolves and writes nothing', async () => {
    await alice().pushItems([note('1:1:1', 'a', Date.now() + 30 * DAY)]);
    expect(await ids()).toEqual([]);
    expect(syncWarnings()).toHaveLength(1);
  });

  test('a setting stamped ahead is held back; the other settings are written', async () => {
    await alice().pushSettings([setting('language', '"en"', Date.now() + 2 * DAY), setting('appearance', '{"mode":"dark","preset":null}')]);
    expect((await alice().pullSettings()).map((s) => s.key)).toEqual(['appearance']);
    expect(syncWarnings()).toHaveLength(1);
    expect(warnings()).toMatch(/1 settings/);
  });

  test('nothing ahead: no warning', async () => {
    await alice().pushItems([note('1:1:1', 'a')]);
    await alice().pushSettings([setting('language', '"en"')]);
    await alice().pushDevice(progress());
    expect(syncWarnings()).toHaveLength(0);
  });
});

describe('the device document', () => {
  test('a goal stamped two days ahead is omitted; progress is written; the caller value is unchanged', async () => {
    const p = progress({ goal: { minutes: 20, updatedAt: Date.now() + 2 * DAY } });
    const before = JSON.stringify(p);
    await alice().pushDevice(p);
    const back = await mine();
    expect(back).toEqual({ ...p, goal: null });
    expect(JSON.stringify(p)).toBe(before);
    expect(syncWarnings()).toHaveLength(1);
    // Held back by the push path's bound, not by a refused write and a retry.
    expect(warnings()).toMatch(/clock more than 23 h ahead/);
    expect(warnings()).not.toMatch(/refused by the server/);
    expect(warnings()).not.toMatch(/2026|43:3/);
  });

  test('a goal stamped inside the bound is kept', async () => {
    const goal = { minutes: 20, updatedAt: Date.now() + 22 * HOUR };
    await alice().pushDevice(progress({ goal }));
    expect((await mine())?.goal).toEqual(goal);
  });

  test('a goal the server refuses although it passed the local bound (skew) is retried without the goal', async () => {
    // This device's clock runs 2 h ahead of the server: its bound (now + 23 h) is past the server's (+ 24 h).
    const real = Date.now;
    const goal = { minutes: 20, updatedAt: real() + 24 * HOUR + 30 * 60_000 };
    jest.spyOn(Date, 'now').mockImplementation(() => real() + 2 * HOUR);
    await alice().pushDevice(progress({ goal, updatedAt: real() - 1000 }));
    jest.restoreAllMocks();
    expect((await mine())?.goal).toBeNull();
    expect(warnings()).toMatch(/refused by the server/);
  });
});

describe('a batch refused anyway is retried document by document', () => {
  test('a document the rules refuse that the push path lets through does not take its batch down', async () => {
    // Device ids are the engine's and are not checked by the push path; the rules refuse a malformed one.
    await alice().pushItems([note('1:1:1', 'a', undefined, 'not-a-device-id'), note('1:1:2', 'b'), note('1:1:3', 'c')]);
    expect(await ids()).toEqual(['note:1:1:2', 'note:1:1:3']);
    expect(syncWarnings()).toHaveLength(1);
    expect(warnings()).toMatch(/1 study items.*refused by the server/);
  });

  test('when every document is refused (the deletion marker), the push fails as denied', async () => {
    const url = `http://${FIRESTORE_HOST}:${FIRESTORE_PORT}/v1/projects/${PROJECT}/databases/(default)/documents/deletedUsers/alice`;
    const res = await fetch(url, {
      method: 'PATCH',
      headers: { Authorization: 'Bearer owner', 'Content-Type': 'application/json' },
      body: JSON.stringify({ fields: { deletedAt: { timestampValue: new Date().toISOString() } } }),
    });
    expect(res.ok).toBe(true);
    await expect(alice().pushItems([note('1:1:1', 'a'), note('1:1:2', 'b')])).rejects.toMatchObject({ kind: 'denied' });
    await expect(alice().pushSettings([setting('language', '"en"'), setting('appearance', '{"mode":"dark","preset":null}')])).rejects.toMatchObject({
      kind: 'denied',
    });
    await expect(alice().pushDevice(progress())).rejects.toMatchObject({ kind: 'denied' });
  });

  test('a one-document batch that is refused fails as denied (nothing to separate)', async () => {
    await expect(alice().pushItems([note('1:1:1', 'a', undefined, 'not-a-device-id')])).rejects.toMatchObject({ kind: 'denied' });
  });
});
