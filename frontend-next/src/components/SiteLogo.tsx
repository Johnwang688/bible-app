import Link from 'next/link';

export default function SiteLogo({ className = 'site-logo' }: { className?: string }) {
  return (
    <Link href="/" className={className} aria-label="Open Bible home">
      <img
        src="/logo/openbible-logo-black.png"
        alt=""
        width={28}
        height={28}
        className={`${className}-img`}
        aria-hidden="true"
      />
      <span className={`${className}-text`}>
        Open<span className={`${className}-accent`}> Bible</span>
      </span>
    </Link>
  );
}
