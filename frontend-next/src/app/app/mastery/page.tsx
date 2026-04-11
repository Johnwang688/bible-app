import type { Metadata } from 'next';
import MasteryPage from '@/components/MasteryPage';

export const metadata: Metadata = {
  title: 'Mastery — Open Bible',
  description: 'Chapter quiz mastery across Old and New Testaments.',
};

export default function MasteryRoutePage() {
  return <MasteryPage />;
}
