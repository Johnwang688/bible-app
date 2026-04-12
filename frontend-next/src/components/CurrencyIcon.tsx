type CurrencyIconProps = {
  className?: string;
  size?: number;
  decorative?: boolean;
};

export default function CurrencyIcon({
  className = '',
  size = 16,
  decorative = true,
}: CurrencyIconProps) {
  return (
    <img
      className={className}
      src="/currency/denarius.png"
      alt={decorative ? '' : 'Denarius coin'}
      aria-hidden={decorative}
      width={size}
      height={size}
    />
  );
}
