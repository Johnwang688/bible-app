// The playback state machine, driven through a fake speech engine.
import { ReadAloudController, memoryPrefs, readAloudKey, watchdogMs, type ReadAloudChapter } from '../controller';
import { DEFAULT_PREFS } from '../keys';
import { FakeEngine, VOICES } from './fakeEngine';

const JOHN_3 = readAloudKey(43, 3, 'CUV-SIMP');
const JOHN_4 = readAloudKey(43, 4, 'CUV-SIMP');

function cuv(verses: [number, string][], key = JOHN_3, nextKey: string | null = JOHN_4): ReadAloudChapter {
  return { key, translation: 'CUV-SIMP', verses: verses.map(([verse, text]) => ({ verse, text })), nextKey };
}

const john3 = cuv([
  [14, '摩西在旷野怎样举蛇，人子也必照样被举起来，'],
  [15, '叫一切信他的都得永生〔或作：叫一切信的人在他里面得永生〕。'],
  [16, '神爱世人，甚至将他的独生子赐给他们，叫一切信他的，不至灭亡，反得永生。'],
  [17, '因为神差他的儿子降世，乃是要叫世人因他得救。'],
]);
const john4 = cuv([[1, '主知道法利赛人听见他收门徒施洗比约翰还多，'], [2, '其实不是耶稣亲自施洗，乃是他的门徒施洗；']], JOHN_4, readAloudKey(43, 5, 'CUV-SIMP'));

async function playing(chapter = john3, fromVerse?: number, prefs = memoryPrefs()) {
  const engine = new FakeEngine();
  const c = new ReadAloudController({ engine, prefs });
  await c.start(chapter, fromVerse);
  return { engine, c, prefs };
}

// The controller's watchdog uses timers; fake ones keep tests from leaving real timers behind.
beforeEach(() => jest.useFakeTimers());
afterEach(() => jest.useRealTimers());

describe('watchdog', () => {
  it('pauses on the verse when a piece never calls back (Chrome’s cut-off, a phone call on iOS)', async () => {
    const { engine, c } = await playing(john3, 16);
    const stops = engine.stops;
    jest.advanceTimersByTime(watchdogMs(engine.current!.text, 'zh-Hans', 1) - 1);
    expect(c.getState().status).toBe('playing');
    jest.advanceTimersByTime(1);
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 16 });
    expect(engine.stops).toBe(stops + 1);
  });

  it('never fires for a piece that ended, or after a pause', async () => {
    const { engine, c } = await playing(john3, 16);
    engine.finish();
    c.pause();
    jest.advanceTimersByTime(10 * 60 * 1000);
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 17 });
  });

  it('gives a long piece at a slow speed more time than a short one', () => {
    expect(watchdogMs('神'.repeat(33), 'zh-Hans', 0.75)).toBeGreaterThan(watchdogMs('神爱世人。', 'zh-Hans', 1));
  });
});

describe('starting', () => {
  it('unlocks the engine before waiting for voices (mobile Safari)', async () => {
    const engine = new FakeEngine();
    const unlock = jest.fn();
    engine.unlock = unlock;
    engine.holdVoices = true;
    const c = new ReadAloudController({ engine });
    const started = c.start(john3);
    expect(unlock).toHaveBeenCalledTimes(1);
    engine.releaseVoices();
    await started;
  });

  it('Pause pressed while the voices load lands on the start verse, paused', async () => {
    const engine = new FakeEngine();
    engine.holdVoices = true;
    const c = new ReadAloudController({ engine });
    const started = c.start(john3, 15);
    c.toggle();
    engine.releaseVoices();
    await started;
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 15 });
    expect(engine.spoken).toHaveLength(0);
  });

  it('Pause then Play while the voices load still plays', async () => {
    const engine = new FakeEngine();
    engine.holdVoices = true;
    const c = new ReadAloudController({ engine });
    const started = c.start(john3, 15);
    c.toggle();
    c.toggle();
    engine.releaseVoices();
    await started;
    expect(c.getState()).toMatchObject({ status: 'playing', verse: 15 });
  });

  it('reads from the first verse on screen, with a Chinese voice for 和合本', async () => {
    const { engine, c } = await playing(john3, 15);
    expect(c.getState()).toMatchObject({ status: 'playing', verse: 15, position: 2, total: 4, group: 'zh-Hans' });
    expect(c.getState().voice?.id).toBe('tingting');
    expect(engine.current?.opts).toMatchObject({ lang: 'zh-CN', voiceId: 'tingting', rate: 1 });
  });

  it('does not speak the bracketed alternate readings', async () => {
    const { engine } = await playing(john3, 15);
    expect(engine.current?.text).toBe('叫一切信他的都得永生。');
  });

  it('is preparing while the voices load, then plays', async () => {
    const engine = new FakeEngine();
    engine.holdVoices = true;
    const c = new ReadAloudController({ engine });
    const started = c.start(john3);
    expect(c.getState().status).toBe('preparing');
    engine.releaseVoices();
    await started;
    expect(c.getState()).toMatchObject({ status: 'playing', verse: 14 });
  });

  it('a stop while the voices load wins: nothing is spoken', async () => {
    const engine = new FakeEngine();
    engine.holdVoices = true;
    const c = new ReadAloudController({ engine });
    const started = c.start(john3);
    c.stop();
    engine.releaseVoices();
    await started;
    expect(c.getState().status).toBe('idle');
    expect(engine.spoken).toHaveLength(0);
  });

  it('has no voice when the device has none for the language, and never uses another language’s', async () => {
    const engine = new FakeEngine([VOICES.samantha, VOICES.daniel]);
    const c = new ReadAloudController({ engine });
    await c.start(john3);
    expect(c.getState()).toMatchObject({ status: 'no-voice', group: 'zh-Hans' });
    expect(engine.spoken).toHaveLength(0);
  });

  it('uses the remembered voice for the language', async () => {
    const { c } = await playing(john3, undefined, memoryPrefs({ ...DEFAULT_PREFS, voices: { 'zh-Hans': 'meijia' } }));
    expect(c.getState().voice?.id).toBe('meijia');
  });

  it('mends a voice tag written with an underscore', async () => {
    const engine = new FakeEngine([{ ...VOICES.tingting, lang: 'zh_CN' }]);
    const c = new ReadAloudController({ engine });
    await c.start(john3);
    expect(engine.current?.opts.lang).toBe('zh-CN');
  });

  it('skips verses with nothing to speak', async () => {
    const { c, engine } = await playing(cuv([[1, '〔此节或缺〕'], [2, '其实不是耶稣亲自施洗。']]));
    expect(c.getState()).toMatchObject({ verse: 2, total: 1 });
    expect(engine.spoken).toHaveLength(1);
  });

  it('starting past the last verse ends at once', async () => {
    const { c, engine } = await playing(john3, 40);
    expect(c.getState().status).toBe('ended');
    expect(engine.spoken).toHaveLength(0);
  });
});

describe('reading through', () => {
  it('moves the verse along as each one ends, then ends the chapter', async () => {
    const { engine, c } = await playing(john3, 16);
    engine.finish();
    expect(c.getState()).toMatchObject({ verse: 17, position: 4 });
    engine.finish();
    expect(c.getState()).toMatchObject({ status: 'ended', verse: null });
  });

  it('speaks a long verse in pieces, keeping the verse highlighted until the last piece', async () => {
    const long = '神'.repeat(120) + '。';
    const { engine, c } = await playing(cuv([[1, long], [2, '短。']]));
    const firstPieces: string[] = [];
    while (c.getState().verse === 1) {
      firstPieces.push(engine.current!.text);
      engine.finish();
    }
    expect(firstPieces.length).toBeGreaterThan(1);
    expect(firstPieces.every((p) => p.length <= 45)).toBe(true);
    expect(firstPieces.join('')).toBe(long);
    expect(engine.current?.text).toBe('短。');
  });

  it('pauses on the verse when something outside cuts the speech off', async () => {
    const { engine, c } = await playing(john3, 16);
    engine.fail('interrupted');
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 16 });
  });

  it('shows an error for other failures; Play tries the verse again', async () => {
    const { engine, c } = await playing(john3, 16);
    engine.fail('synthesis-failed', 'speech failed: synthesis-failed');
    expect(c.getState()).toMatchObject({ status: 'error', error: 'speech failed: synthesis-failed' });
    c.resume();
    expect(c.getState()).toMatchObject({ status: 'playing', verse: 16, error: null });
  });

  it('a verse that starts by itself keeps the user’s scroll: following stays off', async () => {
    const { engine, c } = await playing(john3, 16);
    c.userScrolled();
    engine.finish();
    expect(c.getState()).toMatchObject({ verse: 17, following: false });
  });
});

describe('pause, previous, next and stop', () => {
  it('pause stops the engine; play restarts the verse from its beginning', async () => {
    const { engine, c } = await playing(john3, 16);
    const stopsBefore = engine.stops;
    c.pause();
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 16 });
    expect(engine.stops).toBe(stopsBefore + 1);
    c.resume();
    expect(c.getState().status).toBe('playing');
    expect(engine.current?.text).toBe(engine.spoken[0]?.text);
  });

  it('a late "done" from speech that was paused never moves the verse', async () => {
    const { engine, c } = await playing(john3, 16);
    const stale = engine.current!.opts;
    c.pause();
    stale.onDone();
    stale.onError(new Error('late'));
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 16 });
  });

  it('next and previous while playing speak the new verse', async () => {
    const { engine, c } = await playing(john3, 15);
    c.next();
    expect(c.getState().verse).toBe(16);
    expect(engine.current?.text.startsWith('神爱世人')).toBe(true);
    c.prev();
    c.prev();
    c.prev();
    expect(c.getState().verse).toBe(14);
  });

  it('next and previous while paused move the verse and stay paused', async () => {
    const { engine, c } = await playing(john3, 15);
    c.pause();
    const spoken = engine.spoken.length;
    c.next();
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 16 });
    expect(engine.spoken).toHaveLength(spoken);
  });

  it('next on the last verse ends the chapter', async () => {
    const { c } = await playing(john3, 17);
    c.next();
    expect(c.getState().status).toBe('ended');
  });

  it('stop closes everything; late callbacks are ignored', async () => {
    const { engine, c } = await playing(john3, 16);
    const stale = engine.current!.opts;
    c.stop();
    stale.onDone();
    expect(c.getState()).toMatchObject({ status: 'idle', verse: null, chapterKey: null });
    expect(engine.current).toBeNull();
  });

  it('toggle pauses and plays', async () => {
    const { c } = await playing(john3, 16);
    c.toggle();
    expect(c.getState().status).toBe('paused');
    c.toggle();
    expect(c.getState().status).toBe('playing');
  });
});

describe('chapter changes and leaving', () => {
  it('another chapter or translation on screen stops reading', async () => {
    const { c } = await playing(john3, 16);
    c.chapterChanged(JOHN_3);
    expect(c.getState().status).toBe('playing');
    c.chapterChanged(readAloudKey(43, 3, 'BSB'));
    expect(c.getState().status).toBe('idle');
  });

  it('a chapter that is still loading stops reading too', async () => {
    const { c } = await playing(john3, 16);
    c.chapterChanged(null);
    expect(c.getState().status).toBe('idle');
  });

  it('leaving the Bible tab stops reading', async () => {
    const { c, engine } = await playing(john3, 16);
    c.leave();
    expect(c.getState().status).toBe('idle');
    expect(engine.current).toBeNull();
  });
});

describe('end of the chapter', () => {
  it('auto-advance is off by default: it ends and offers the next chapter', async () => {
    const { engine, c } = await playing(john3, 17);
    engine.finish();
    expect(c.getState()).toMatchObject({ status: 'ended', autoAdvance: false });
    c.playNextChapter();
    expect(c.getState().status).toBe('advancing');
    c.continueInto(john4);
    await Promise.resolve();
    expect(c.getState()).toMatchObject({ status: 'playing', chapterKey: JOHN_4, verse: 1 });
  });

  it('with auto-advance on, it waits for the next chapter and reads it from verse 1', async () => {
    const { engine, c } = await playing(john3, 17);
    c.setAutoAdvance(true);
    engine.finish();
    expect(c.getState().status).toBe('advancing');
    c.chapterChanged(null);
    c.chapterChanged(JOHN_4);
    expect(c.getState().status).toBe('advancing');
    c.continueInto(john4);
    await Promise.resolve();
    expect(c.getState()).toMatchObject({ status: 'playing', chapterKey: JOHN_4, verse: 1 });
  });

  it('while advancing, any other chapter stops it, and a wrong chapter is never read', async () => {
    const { engine, c } = await playing(john3, 17);
    c.setAutoAdvance(true);
    engine.finish();
    c.continueInto(cuv([[1, '起初，神创造天地。']], readAloudKey(1, 1, 'CUV-SIMP')));
    expect(c.getState().status).toBe('advancing');
    c.chapterChanged(readAloudKey(1, 1, 'CUV-SIMP'));
    expect(c.getState().status).toBe('idle');
  });

  it('the offer survives the reader turning the page before Play next is pressed', async () => {
    const { engine, c } = await playing(john3, 17);
    engine.finish();
    c.chapterChanged(null);
    c.chapterChanged(JOHN_4);
    expect(c.getState().status).toBe('ended');
    c.playNextChapter();
    c.continueInto(john4);
    await Promise.resolve();
    expect(c.getState()).toMatchObject({ status: 'playing', chapterKey: JOHN_4 });
  });

  it('Next past the last verse while paused ends, even with auto-advance on', async () => {
    const { c } = await playing(john3, 17);
    c.setAutoAdvance(true);
    c.pause();
    c.next();
    expect(c.getState().status).toBe('ended');
  });

  it('at the end of the Bible there is nothing to advance to', async () => {
    const { engine, c } = await playing(cuv([[21, '愿主耶稣的恩惠常与众圣徒同在。阿们！']], readAloudKey(66, 22, 'CUV-SIMP'), null));
    c.setAutoAdvance(true);
    engine.finish();
    expect(c.getState().status).toBe('ended');
    c.playNextChapter();
    expect(c.getState().status).toBe('ended');
  });
});

describe('following the verse', () => {
  it('stops following when the user scrolls; Back to verse and the controls follow again', async () => {
    const { c } = await playing(john3, 15);
    c.userScrolled();
    expect(c.getState().following).toBe(false);
    c.backToVerse();
    expect(c.getState().following).toBe(true);
    c.userScrolled();
    c.next();
    expect(c.getState().following).toBe(true);
  });

  it('scrolling while idle changes nothing', () => {
    const c = new ReadAloudController({ engine: new FakeEngine() });
    c.userScrolled();
    expect(c.getState().following).toBe(true);
  });
});

describe('voice and speed', () => {
  it('a new speed applies from the next piece and is remembered', async () => {
    const { engine, c, prefs } = await playing(john3, 15);
    c.setRate(1.5);
    expect(engine.current?.opts.rate).toBe(1);
    engine.finish();
    expect(engine.current?.opts.rate).toBe(1.5);
    expect(prefs.get().rate).toBe(1.5);
  });

  it('ignores a speed that is not offered', async () => {
    const { c } = await playing(john3, 15);
    c.setRate(3);
    expect(c.getState().rate).toBe(1);
  });

  it('a new voice starts at the next verse and is remembered for the language', async () => {
    const { engine, c, prefs } = await playing(john3, 15);
    expect(c.setVoice('meijia')).toBe(true);
    expect(engine.current?.opts.voiceId).toBe('tingting');
    engine.finish();
    expect(engine.current?.opts).toMatchObject({ voiceId: 'meijia', lang: 'zh-TW' });
    expect(prefs.get().voices).toEqual({ 'zh-Hans': 'meijia' });
  });

  it('refuses a voice of another language', async () => {
    const { c, prefs } = await playing(john3, 15);
    expect(c.setVoice('samantha')).toBe(false);
    expect(prefs.get().voices).toEqual({});
  });

  it('lists only the voices that may read the translation', async () => {
    const c = new ReadAloudController({ engine: new FakeEngine() });
    expect((await c.listVoices('CUV-SIMP')).map((v) => v.id)).toEqual(['tingting', 'meijia', 'sinji']);
    expect((await c.listVoices('BSB')).map((v) => v.id)).toEqual(['samantha', 'daniel']);
  });

  it('a sample pauses reading; Play then restarts the verse', async () => {
    const { engine, c } = await playing(john3, 16);
    c.sample('meijia', '你好');
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 16 });
    expect(engine.current).toMatchObject({ text: '你好', opts: { voiceId: 'meijia' } });
    engine.finish();
    expect(c.getState()).toMatchObject({ status: 'paused', verse: 16 });
    c.resume();
    expect(engine.current?.text.startsWith('神爱世人')).toBe(true);
  });

  it('Play during a sample stops the sample first', async () => {
    const { engine, c } = await playing(john3, 16);
    c.sample('meijia', '你好');
    const stops = engine.stops;
    c.resume();
    expect(engine.stops).toBe(stops + 1);
    expect(engine.current?.text.startsWith('神爱世人')).toBe(true);
  });

  it('a store that rejects the prefs does not break playback', async () => {
    const prefs = { get: () => DEFAULT_PREFS, set: () => { throw new Error('quota'); } };
    const { c } = await playing(john3, 15, prefs);
    c.setRate(2);
    expect(c.getState().rate).toBe(2);
  });
});
