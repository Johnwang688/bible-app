// One person, place or theme (a root stack screen above the tabs).
import { useLocalSearchParams } from 'expo-router';

import { EntityPageScreen } from '../../../entities/components/EntityPageScreen';
import { parseEntityKind, routeParam } from '../../../entities/routes';

export default function EntityPageRoute() {
  const params = useLocalSearchParams();
  return <EntityPageScreen kind={parseEntityKind(params.kind)} slug={routeParam(params.slug)} />;
}
