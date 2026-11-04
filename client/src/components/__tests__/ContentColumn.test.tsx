import { act, render, screen } from '@testing-library/react-native';
import * as RN from 'react-native';

import { ContentColumn, useColumn } from '../ContentColumn';
import { COLUMN } from '../layout';

async function setWidth(width: number) {
  await act(() => RN.Dimensions.set({
    window: { width, height: 900, scale: 1, fontScale: 1 },
    screen: { width, height: 900, scale: 1, fontScale: 1 },
  }));
}
beforeEach(() => setWidth(767));

function Probe({ gutter = 0 }: { gutter?: number }) {
  const column = useColumn('text', gutter);
  return <RN.Text testID="column">{JSON.stringify(column)}</RN.Text>;
}

it('leaves a 767px window uncapped and applies the column at 768px', async () => {
  const { rerender } = await render(<Probe />);
  expect(screen.getByTestId('column')).toHaveTextContent('null');
  await setWidth(768);
  await rerender(<Probe />);
  expect(JSON.parse(screen.getByTestId('column').props.children)).toEqual({ width: '100%', maxWidth: COLUMN.text, alignSelf: 'center' });
});

it('adds both gutters so inner content stays at the specified width', async () => {
  await setWidth(1024);
  await render(<Probe gutter={20} />);
  expect(JSON.parse(screen.getByTestId('column').props.children).maxWidth).toBe(760);
});

it('wraps children with the chosen column and supplied style', async () => {
  await setWidth(1024);
  await render(<ContentColumn kind="lesson" gutter={16} style={{ paddingHorizontal: 16 }} testID="lesson"><RN.Text>child</RN.Text></ContentColumn>);
  expect(screen.getByTestId('lesson')).toHaveStyle({ maxWidth: 672, width: '100%', paddingHorizontal: 16 });
  expect(screen.getByText('child')).toBeTruthy();
});
