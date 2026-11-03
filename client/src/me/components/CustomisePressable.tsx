// One pressable for the Customise screens: always a role and a label, at least 44 pt, dimmed
// when disabled. Radios carry `selected` (and `checked`, which the web maps to aria-checked).
import type { ReactNode } from 'react';
import { Pressable, type StyleProp, type ViewStyle } from 'react-native';

export function CustomisePressable({
  testID,
  role,
  label,
  selected,
  disabled = false,
  onPress,
  style,
  children,
}: {
  testID: string;
  role: 'button' | 'radio';
  label: string;
  selected?: boolean;
  disabled?: boolean;
  onPress(): void;
  style?: StyleProp<ViewStyle>;
  children?: ReactNode;
}) {
  const radio = role === 'radio';
  return (
    <Pressable
      testID={testID}
      accessibilityRole={role}
      accessibilityLabel={label}
      accessibilityState={radio ? { selected: !!selected, checked: !!selected, disabled } : { disabled }}
      aria-checked={radio ? !!selected : undefined}
      disabled={disabled}
      onPress={() => {
        if (!disabled) onPress();
      }}
      style={[{ minWidth: 44, minHeight: 44 }, style, disabled ? { opacity: 0.4 } : null]}
    >
      {children}
    </Pressable>
  );
}
