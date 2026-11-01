// 简体中文 message catalogue. Drafted with the English; John and Chinese-speaking friends
// review it before launch (R-7). Terms follow CUV-style church usage.
import type { MessageKey } from './en';

export const zhHans: Record<MessageKey, string> = {
  'app.name': '圣经',

  'tabs.home': '首页',
  'tabs.bible': '圣经',
  'tabs.study': '学习',
  'tabs.me': '我的',
  'tabs.home.a11y': '首页标签',
  'tabs.bible.a11y': '圣经标签',
  'tabs.study.a11y': '学习标签',
  'tabs.me.a11y': '我的标签',

  'screen.home.title': '首页',
  'screen.bible.title': '圣经',
  'screen.study.title': '学习',
  'screen.me.title': '我的',

  'style.pastel': '新粗野派粉彩',
  'style.glass': '极光玻璃',
  'mode.system': '跟随手机',
  'mode.light': '浅色',
  'mode.dark': '深色',

  'preset.strawberry-milk': '草莓牛奶',
  'preset.matcha-latte': '抹茶拿铁',
  'preset.lavender-haze': '薰衣草雾',
  'preset.bubblegum-night': '泡泡糖之夜',
  'preset.matcha-night': '抹茶之夜',
  'preset.grape-soda': '葡萄汽水',
  'preset.liberty': '自由',
  'preset.silver': '银色',
  'preset.sky': '天空',
  'preset.northern-lights': '北极光',
  'preset.graphite': '石墨',
  'preset.deep-blue': '深蓝',

  'language.system': '跟随手机',
  'language.en': 'English',
  'language.zh-Hans': '简体中文',

  'content.englishOnly': '英文',

  'common.loading': '加载中…',
  'common.retry': '重试',
  'error.network': '无法连接服务器。请检查网络后重试。',
  'error.generic': '出了点问题。',
  'error.notFound': '未找到。',
};
