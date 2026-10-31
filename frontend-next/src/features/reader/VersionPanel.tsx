'use client';

import type { Dispatch, SetStateAction } from 'react';
import { getTranslationDisplayId, getTranslationDisplayName } from '@/features/reader/translations';
import { useReaderPosition } from '@/features/reader/ReaderPositionContext';

export interface VersionPanelProps {
  versionPopupOpen: boolean;
  setVersionPopupOpen: Dispatch<SetStateAction<boolean>>;
  versionPanelLeft: number;
  pickTranslation: (id: string) => void;
}

export default function VersionPanel({
  versionPopupOpen,
  setVersionPopupOpen,
  versionPanelLeft,
  pickTranslation,
}: VersionPanelProps) {
  const { translation, translations } = useReaderPosition();
  return (
    <div
      className={`popup-overlay${versionPopupOpen ? ' open' : ''}`}
      onClick={e => { if (e.target === e.currentTarget) setVersionPopupOpen(false); }}
    >
      <div className="version-panel" style={{ left: `${versionPanelLeft}px` }}>
        <div className="version-header">Translation</div>
        {translations.map(t => (
          <button
            key={t.id}
            className={`version-item${t.id === translation ? ' selected' : ''}`}
            type="button"
            onClick={() => pickTranslation(t.id)}
          >
            <span className="v-abbr">{getTranslationDisplayId(t.id)}</span>
            <span className="v-name">{getTranslationDisplayName(t.id, t.name)}</span>
            {t.id === translation && <span className="v-check">✓</span>}
          </button>
        ))}
      </div>
    </div>
  );
}
