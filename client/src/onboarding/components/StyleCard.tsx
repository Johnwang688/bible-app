// One of the look step's two style cards (r7a-look.html), drawn in its own style's tokens: a header that
// picks the style (a small Home sketch, the style name, a hint, the radio mark) and, below it, a radio group
// of the style's three presets for the current mode as Customise's swatch tiles.
import { Pressable, Text, View, useWindowDimensions } from 'react-native';

import { uiFace } from '../../fonts/fonts';
import { useT } from '../../i18n/I18nProvider';
import { Icon } from '../../reader/components/icons';
import { getTheme, type PresetMeta } from '../../theme/presets';
import type { PresetId, Theme, ThemeStyle } from '../../theme/types';
import { LookSketch } from './LookSketch';
import { RadioGroup } from './RadioGroup';
import { Swatch } from './swatch';
import { TextCard } from './TextCard';
import { useRadioKeys } from './useRadioKeys';

export function StyleCard({
  style,
  cardTheme,
  presets,
  selectedId,
  styleSelected,
  onChoose,
}: {
  style: ThemeStyle;
  /** The preset this card is drawn in: the selected one if it is in this style, else the style's default. */
  cardTheme: Theme;
  /** This style's presets for the current mode. */
  presets: readonly PresetMeta[];
  selectedId: PresetId;
  styleSelected: boolean;
  onChoose(id: PresetId): void;
}) {
  const t = useT();
  const { width } = useWindowDimensions();
  const { colors } = cardTheme;
  const name = t(style === 'pastel' ? 'style.pastel' : 'style.glass');
  const hint = t(style === 'pastel' ? 'onboarding.look.pastelHint' : 'onboarding.look.glassHint');

  // Three tiles share the card's width; on a very narrow screen the swatch shrinks so tiles never overlap.
  const tileWidth = (width - 48 - 24) / 3;
  const swatch = Math.max(24, Math.min(56, Math.floor(tileWidth - 12)));

  const checkedIndex = presets.findIndex((p) => p.id === selectedId);
  const keys = useRadioKeys(presets.length, checkedIndex, (i) => onChoose(presets[i]!.id));

  return (
    <TextCard testID={`look-${style}-card`} theme={cardTheme} style={{ paddingHorizontal: 12, paddingVertical: 10, gap: 4 }}>
      <Pressable
        testID={`look-style-${style}`}
        role="button"
        aria-pressed={styleSelected}
        accessibilityState={{ selected: styleSelected }}
        onPress={() => onChoose(styleSelected ? selectedId : cardTheme.id)}
        style={{ minHeight: 44, flexDirection: 'row', alignItems: 'flex-start', gap: 12 }}
      >
        <LookSketch theme={cardTheme} />
        <View style={{ flex: 1, minWidth: 0, gap: 6, paddingTop: 2 }}>
          <Text style={{ color: colors.text, fontFamily: uiFace(cardTheme.type.head, cardTheme.type.headWeight), fontSize: 18, lineHeight: 22 }}>
            {name}
          </Text>
          <Text style={{ color: colors.muted, fontFamily: uiFace(cardTheme.type.ui, '400'), fontSize: 13, lineHeight: 18 }}>{hint}</Text>
        </View>
        {/* The selected card shows only this filled radio check (no card outline). */}
        <View
          aria-hidden
          style={{
            width: 24,
            height: 24,
            borderRadius: 12,
            borderWidth: 2,
            borderColor: styleSelected ? colors.cta : colors.muted,
            backgroundColor: styleSelected ? colors.cta : undefined,
            alignItems: 'center',
            justifyContent: 'center',
          }}
        >
          {styleSelected ? <Icon name="check" size={16} strokeWidth={3} color={colors.onCta} /> : null}
        </View>
      </Pressable>
      <RadioGroup label={name} style={{ flexDirection: 'row', gap: 4 }}>
        {presets.map((p, i) => {
          const checked = p.id === selectedId;
          return (
            <Pressable
              key={p.id}
              testID={`look-tile-${p.id}`}
              role="radio"
              aria-checked={checked}
              accessibilityState={{ checked }}
              onPress={() => onChoose(p.id)}
              style={{ flex: 1, minWidth: 0, minHeight: 44, alignItems: 'center', gap: 4, paddingTop: 2 }}
              {...keys(i)}
            >
              {/* The selected tile shows only its ring (3 pt in the frame's accent, offset 2). */}
              <View
                style={{
                  padding: 2,
                  borderWidth: 3,
                  borderRadius: 21,
                  borderColor: checked ? colors.accent : 'transparent',
                }}
              >
                <Swatch theme={getTheme(p.id)} size={swatch} radius={16} edge={colors.muted} />
              </View>
              <Text
                style={{
                  color: colors.text,
                  fontFamily: uiFace(cardTheme.type.ui, checked ? '700' : '400'),
                  fontSize: 12,
                  lineHeight: 14,
                  textAlign: 'center',
                  maxWidth: '100%',
                }}
              >
                {t(p.nameKey)}
              </Text>
            </Pressable>
          );
        })}
      </RadioGroup>
    </TextCard>
  );
}
