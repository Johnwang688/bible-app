import type { Metadata } from 'next';
import LandingClient from './LandingClient';

export const metadata: Metadata = {
  title: 'Open Bible - Scripture, study, and insight',
  description:
    'Open Bible is a modern Bible reader with AI-powered commentary, cross-references, translations, and study tools.',
};

export default function LandingPage() {
  return <LandingClient />;
}
