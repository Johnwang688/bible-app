import { useState, type ComponentRef, type Ref } from 'react';
import { Platform, Pressable, Text, type View } from 'react-native';

import { uiFace } from '../fonts/fonts';
import { Icon, type IconName } from '../reader/components/icons';
import { buttonStyle } from '../reader/components/ui';
import { useTheme } from '../theme/ThemeProvider';

/** Commentary's pill CTA, with the app's outset text-colour focus ring at every width. */
export function SummaryButton({ testID, label, accessibilityLabel, onPress, icon, link = false, nodeRef }: {
  testID: string; label: string; onPress(): void; icon?: IconName; link?: boolean;
  accessibilityLabel?: string;
  nodeRef?: Ref<ComponentRef<typeof View>>;
}) {
  const theme = useTheme();
  const [focused, setFocused] = useState(false);
  const plain = !!icon || link;
  return <Pressable ref={nodeRef} testID={testID} accessibilityRole={link ? 'link' : 'button'} accessibilityLabel={accessibilityLabel ?? label}
    onPress={onPress} onFocus={() => setFocused(true)} onBlur={() => setFocused(false)}
    style={({ pressed }) => [plain ? buttonStyle(theme) : { backgroundColor: theme.colors.cta },
      { minHeight: 44, minWidth: 44, paddingHorizontal: icon ? 0 : 20, borderRadius: 999,
        alignItems: 'center', justifyContent: 'center', alignSelf: plain ? 'flex-start' : undefined, opacity: pressed ? 0.7 : 1 },
      !icon && { margin: 5 },
      icon && { width: 44, height: 44 },
      Platform.OS === 'web' && focused && { outlineStyle: 'solid', outlineWidth: 3, outlineColor: theme.colors.text, outlineOffset: 2 }]}>
    {icon ? <Icon name={icon} size={icon === 'close' ? 18 : 20} color={theme.colors.btnText} />
      : <Text style={{ color: link ? theme.colors.accent : theme.colors.onCta, fontFamily: uiFace(theme.type.ui, '700'), fontSize: link ? 13 : 15,
        textDecorationLine: link ? 'underline' : 'none', flexShrink: 1 }}>{label}</Text>}
  </Pressable>;
}
