import { Suspense } from 'react';
import EntityBankPage from '@/components/EntityBankPage';

export default function PeopleBankPage() {
  return (
    <Suspense fallback={<div className="bank-page"><header className="bank-page-header"><h1 className="bank-page-title">People</h1></header></div>}>
      <EntityBankPage kind="person" />
    </Suspense>
  );
}
