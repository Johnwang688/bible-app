import { QueryClientProvider, type QueryClient } from '@tanstack/react-query';
import { createContext, useContext, useState, type ReactNode } from 'react';

import { createApiClient, type ApiClient } from './client';
import { getApiBaseUrl } from './config';
import { createQueryClient } from './queryClient';

const ApiContext = createContext<ApiClient | null>(null);

export function ApiProvider(props: { children: ReactNode; client?: ApiClient; queryClient?: QueryClient }) {
  const [client] = useState<ApiClient>(() => props.client ?? createApiClient({ baseUrl: getApiBaseUrl() }));
  const [queryClient] = useState<QueryClient>(() => props.queryClient ?? createQueryClient());
  return (
    <ApiContext.Provider value={client}>
      <QueryClientProvider client={queryClient}>{props.children}</QueryClientProvider>
    </ApiContext.Provider>
  );
}

export function useApi(): ApiClient {
  const client = useContext(ApiContext);
  if (!client) throw new Error('useApi must be used inside ApiProvider');
  return client;
}
