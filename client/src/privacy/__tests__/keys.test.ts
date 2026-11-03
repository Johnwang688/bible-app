// Every catalogue key the privacy page can show exists in both languages.
import { en } from '../../i18n/messages/en';
import { zhHans } from '../../i18n/messages/zh-Hans';
import { PRIVACY_SECTIONS, privacyBulletKeys } from '../index';

describe('privacy keys', () => {
  it('has every bullet, title and summary in English and Chinese', () => {
    for (const id of PRIVACY_SECTIONS) {
      for (const beta of [false, true]) {
        const keys = [...privacyBulletKeys(id, beta), `privacy.${id}.title`, `privacy.${id}.summary`];
        for (const key of keys) {
          expect({ key, en: key in en }).toEqual({ key, en: true });
          expect({ key, zh: key in zhHans }).toEqual({ key, zh: true });
        }
      }
    }
  });

  it('shows the beta bullet only in beta builds, and the age rule first', () => {
    expect(privacyBulletKeys('changes', false)).toEqual(['privacy.changes.b1']);
    expect(privacyBulletKeys('changes', true)).toEqual(['privacy.changes.b1', 'privacy.changes.b2']);
    expect(privacyBulletKeys('children', false)[0]).toBe('privacy.children.age');
    expect(privacyBulletKeys('contact', true)).toEqual([]);
  });
});
