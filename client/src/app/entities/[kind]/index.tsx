// The people, places or themes list (a root stack screen above the tabs). `?q=` opens it already filtered.
import { useLocalSearchParams } from 'expo-router';

import { EntityListScreen } from '../../../entities/components/EntityListScreen';
import { parseEntityKind, routeParam } from '../../../entities/routes';

export default function EntityListRoute() {
  const params = useLocalSearchParams();
  return <EntityListScreen kind={parseEntityKind(params.kind)} initialFilter={routeParam(params.q)} />;
}
