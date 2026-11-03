// Short book names for the coverage map (Study → Progress), one per book in canon order, as drawn on the
// signed-off canvas ("Study: progress"). English uses the three-letter codes; Chinese the usual CUV
// abbreviations. Screen readers get the full book name instead.
import type { AppLocale } from './types';

const EN =
  'Gen Exo Lev Num Deu Jos Jdg Rut 1Sa 2Sa 1Ki 2Ki 1Ch 2Ch Ezr Neh Est Job Psa Pro Ecc Sng Isa Jer Lam Ezk Dan Hos Jol Amo Oba Jon Mic Nam Hab Zep Hag Zec Mal ' +
  'Mat Mrk Luk Jhn Act Rom 1Co 2Co Gal Eph Php Col 1Th 2Th 1Ti 2Ti Tit Phm Heb Jas 1Pe 2Pe 1Jn 2Jn 3Jn Jud Rev';
const ZH =
  '创 出 利 民 申 书 士 得 撒上 撒下 王上 王下 代上 代下 拉 尼 斯 伯 诗 箴 传 歌 赛 耶 哀 结 但 何 珥 摩 俄 拿 弥 鸿 哈 番 该 亚 玛 ' +
  '太 可 路 约 徒 罗 林前 林后 加 弗 腓 西 帖前 帖后 提前 提后 多 门 来 雅 彼前 彼后 约一 约二 约三 犹 启';

const TABLE: Record<AppLocale, string[]> = { en: EN.split(' '), 'zh-Hans': ZH.split(' ') };

/** The short name of book `bookNumber` (1–66) in the interface language. */
export function bookAbbreviation(bookNumber: number, locale: AppLocale): string {
  return TABLE[locale][bookNumber - 1] ?? String(bookNumber);
}
