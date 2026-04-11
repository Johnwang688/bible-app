import type { Metadata } from 'next';
import ShopPage from '@/components/ShopPage';

export const metadata: Metadata = {
  title: 'Shop — Open Bible',
  description: 'Spend quiz coins on cosmetics and more (coming soon).',
};

export default function ShopRoutePage() {
  return <ShopPage />;
}
