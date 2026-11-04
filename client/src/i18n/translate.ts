// The message lookup: key + locale → string, with {placeholders} filled in.
import { desktopEn, desktopZhHans } from './messages/desktop';
import { en, type MessageKey } from './messages/en';
import { zhHans } from './messages/zh-Hans';
import type { AppLocale } from './types';

export type { MessageKey } from './messages/en';

export type TFunction = (key: MessageKey, params?: Record<string, string | number>) => string;

export function interpolate(template: string, params?: Record<string, string | number>): string {
  if (!params) return template;
  return template.replace(/\{(\w+)\}/g, (whole, name: string) =>
    Object.prototype.hasOwnProperty.call(params, name) ? String(params[name]) : whole,
  );
}

const catalogues: Record<AppLocale, Partial<Record<MessageKey, string>>> = { en, 'zh-Hans': zhHans };

const desktopCatalogues: Record<AppLocale, Partial<Record<MessageKey, string>>> = { en: desktopEn, 'zh-Hans': desktopZhHans };

export function createT(locale: AppLocale, wide = false): TFunction {
  const catalogue = catalogues[locale];
  const overrides = wide ? desktopCatalogues[locale] : undefined;
  return (key, params) => interpolate(overrides?.[key] ?? catalogue[key] ?? en[key], params);
}
