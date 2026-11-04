// The reader header (Reader.dc.html): book and chapter, translation, reading settings. It slides up
// out of view while reading; a small pill at the top always brings it back.
import { router } from 'expo-router';
import type { ComponentRef, Ref } from 'react';
import { Animated, Pressable, StyleSheet, Text, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import type { BookInfo } from '../../api/schemas';
import { scriptureFace, uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import type { ReaderPosition } from '../../storage/keys';
import { useTheme } from '../../theme/ThemeProvider';
import { bookName } from '../books';
import { TRANSLATIONS, type TranslationId } from '../translations';
import { Icon } from './icons';
import { buttonStyle } from './ui';

/** The height of the header below the status bar: a 44 pt row plus its padding. */
export const HEADER_BODY_HEIGHT = 52;

export function ReaderHeader({
  book,
  position,
  second,
  hidden,
  translateY,
  onShow,
  onOpenBook,
  onOpenVersions,
  onOpenSettings,
  onOpenTools,
  toolsButtonRef,
  onOpenSearch = () => router.push('/search'),
}: {
  book: BookInfo | undefined;
  position: ReaderPosition;
  /** The parallel translation, or null when reading one. */
  second: TranslationId | null;
  hidden: boolean;
  translateY: Animated.Value;
  onShow(): void;
  onOpenBook(): void;
  onOpenVersions(): void;
  onOpenSettings(): void;
  onOpenTools?(): void;
  toolsButtonRef?: Ref<ComponentRef<typeof View>>;
  /** Opens the search screen (default: push the `/search` route). */
  onOpenSearch?: () => void;
}) {
  const theme = useTheme();
  const t = useT();
  const insets = useSafeAreaInsets();
  const first = position.translation;

  const short = (id: TranslationId) => t(TRANSLATIONS[id].shortKey);
  const full = (id: TranslationId) => t(TRANSLATIONS[id].nameKey);
  const translationA11y = second
    ? t('reader.chooseTranslations', { first: full(first), second: full(second) })
    : t('reader.chooseTranslation', { translation: full(first) });
  const title = book ? t('reader.chapterTitle', { book: bookName(book, first), chapter: position.chapter }) : null;

  return (
    <>
      <Animated.View
        testID="reader-header"
        accessibilityElementsHidden={hidden}
        importantForAccessibility={hidden ? 'no-hide-descendants' : 'auto'}
        style={[
          styles.header,
          theme.backgrounds.reader,
          { paddingTop: insets.top, transform: [{ translateY }], pointerEvents: hidden ? 'none' : 'auto' },
        ]}
      >
        <View style={styles.row}>
          {book && title ? (
            <Pressable
              testID="reader-book-button"
              accessibilityRole="button"
              accessibilityLabel={t('reader.chooseBook', { book: bookName(book, first), chapter: position.chapter })}
              onPress={onOpenBook}
              style={[styles.bookButton, buttonStyle(theme)]}
            >
              <Text
                numberOfLines={1}
                style={{
                  flexShrink: 1,
                  color: theme.colors.btnText,
                  fontFamily: uiFace(theme.type.head, '700'),
                  fontSize: 18,
                }}
              >
                {bookName(book, first)}
              </Text>
              <Text style={{ flexShrink: 0, color: theme.colors.btnText, fontFamily: uiFace(theme.type.head, '700'), fontSize: 18 }}>
                {` ${position.chapter}`}
              </Text>
              <Icon name="chevronDown" size={16} color={theme.colors.btnText} />
            </Pressable>
          ) : null}
          <Pressable
            testID="reader-translation-button"
            accessibilityRole="button"
            accessibilityLabel={translationA11y}
            onPress={onOpenVersions}
            style={styles.translationButton}
          >
            <Text
              numberOfLines={1}
              style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: second ? 12 : 14, lineHeight: second ? 14 : undefined }}
            >
              {short(first)}
            </Text>
            {second ? <Text numberOfLines={1} style={{ color: theme.colors.muted, fontFamily: uiFace(theme.type.ui, '700'), fontSize: 12, lineHeight: 14 }}>{short(second)}</Text> : null}
          </Pressable>
          <View style={styles.spacer} />
          <Pressable ref={toolsButtonRef} testID="reader-tools-button" accessibilityRole="button" accessibilityLabel={t('readAloud.tools')} aria-haspopup="dialog" onPress={onOpenTools} style={styles.iconButton}>
            <Icon name="more" size={24} strokeWidth={3.2} color={theme.colors.text} />
          </Pressable>
          <Pressable
            testID="reader-search-button"
            accessibilityRole="button"
            accessibilityLabel={t('reader.search')}
            onPress={onOpenSearch}
            style={styles.iconButton}
          >
            <Icon name="search" size={20} color={theme.colors.text} />
          </Pressable>
          <Pressable
            testID="reader-settings-button"
            accessibilityRole="button"
            accessibilityLabel={t('reader.settings')}
            onPress={onOpenSettings}
            style={styles.iconButton}
          >
            <Text style={{ color: theme.colors.text, fontFamily: scriptureFace(theme.type.scripture), fontSize: 19 }}>
              {t('reader.settingsGlyph')}
            </Text>
          </Pressable>
        </View>
      </Animated.View>
      {hidden ? (
        <Pressable
          testID="reader-show-controls"
          accessibilityRole="button"
          accessibilityLabel={t('reader.showControls')}
          onPress={onShow}
          style={[styles.pill, buttonStyle(theme), { top: insets.top + 4, borderRadius: 999 }]}
        >
          <Icon name="chevronDown" size={20} color={theme.colors.btnText} />
        </Pressable>
      ) : null}
    </>
  );
}

const styles = StyleSheet.create({
  header: { position: 'absolute', top: 0, left: 0, right: 0, zIndex: 2, paddingBottom: 8, paddingLeft: 14, paddingRight: 10 },
  row: { height: 44, flexDirection: 'row', alignItems: 'center', gap: 6 },
  bookButton: { height: 44, paddingHorizontal: 10, flexDirection: 'row', alignItems: 'center', flexShrink: 1, minWidth: 0 },
  translationButton: { minHeight: 44, minWidth: 44, paddingHorizontal: 8, justifyContent: 'center', flexShrink: 1 },
  spacer: { flex: 1 },
  iconButton: { width: 44, height: 44, alignItems: 'center', justifyContent: 'center' },
  pill: {
    position: 'absolute',
    alignSelf: 'center',
    zIndex: 3,
    minWidth: 72,
    height: 44,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
