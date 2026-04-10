import type { Metadata } from 'next';
import LandingClient from './LandingClient';

export const metadata: Metadata = {
  title: 'Open Bible — Read, understand, and study Scripture',
  description:
    'Open Bible is a modern Bible reader with AI-powered commentary, chapter summaries, reading themes, quizzes, and study tools that help you actually finish what you start.',
};

export default function LandingPage() {
  return <LandingClient />;
}
