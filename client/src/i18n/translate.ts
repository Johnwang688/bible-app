// The message lookup: key + locale → string, with {placeholders} filled in.
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

export function createT(locale: AppLocale): TFunction {
  const catalogue = catalogues[locale];
  return (key, params) => interpolate(catalogue[key] ?? en[key], params);
}
