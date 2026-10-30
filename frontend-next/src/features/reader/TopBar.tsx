'use client';

import type { Dispatch, RefObject, SetStateAction } from 'react';
import type { SidePanelMode } from '@/features/reader/types';

export interface TopBarProps {
  chromeTopVisible: boolean;
  bumpChromeScrollInteraction: () => void;
  topChromeHoverRef: RefObject<boolean>;
  setChromeTopShown: Dispatch<SetStateAction<boolean>>;
  chromeScrollRevealActiveRef: RefObject<boolean>;
  lastPointerYRef: RefObject<number>;
  bookPopupOpen: boolean;
  setBookPopupOpen: Dispatch<SetStateAction<boolean>>;
  setSearchOpen: Dispatch<SetStateAction<boolean>>;
  setVersionPopupOpen: Dispatch<SetStateAction<boolean>>;
  navLabel: string;
  versionBtnRef: RefObject<HTMLButtonElement | null>;
  versionPopupOpen: boolean;
  openVersionPopup: () => void;
  currentTranslationTitle: string;
  currentTranslationLabel: string;
  searchOpen: boolean;
  sidePanelMode: SidePanelMode;
  toggleStudyPanel: () => void;
}

export default function TopBar({
  chromeTopVisible,
  bumpChromeScrollInteraction,
  topChromeHoverRef,
  setChromeTopShown,
  chromeScrollRevealActiveRef,
  lastPointerYRef,
  bookPopupOpen,
  setBookPopupOpen,
  setSearchOpen,
  setVersionPopupOpen,
  navLabel,
  versionBtnRef,
  versionPopupOpen,
  openVersionPopup,
  currentTranslationTitle,
  currentTranslationLabel,
  searchOpen,
  sidePanelMode,
  toggleStudyPanel,
}: TopBarProps) {
  return (
    <nav
      className={`topbar${chromeTopVisible ? '' : ' chrome-hide-top'}`}
      onPointerDown={bumpChromeScrollInteraction}
      onFocusCapture={bumpChromeScrollInteraction}
      onMouseEnter={() => {
        topChromeHoverRef.current = true;
        setChromeTopShown(true);
      }}
      onMouseLeave={() => {
        topChromeHoverRef.current = false;
        if (chromeScrollRevealActiveRef.current) return;
        const h = typeof window !== 'undefined' ? window.innerHeight : 0;
        if (h === 0) return;
        const topZone = h * 0.2;
        if (lastPointerYRef.current > topZone) setChromeTopShown(false);
      }}
    >
      <div className="nav-left">
        <button
          className={`nav-btn nav-btn-book${bookPopupOpen ? ' active' : ''}`}
          type="button"
          onClick={e => { e.stopPropagation(); setSearchOpen(false); setVersionPopupOpen(false); setBookPopupOpen(v => !v); }}
        >
          <span className="nav-btn-label" title={navLabel}>{navLabel}</span>
          <span className="chevron" aria-hidden="true" />
        </button>
        <button
          ref={versionBtnRef}
          className={`nav-btn nav-btn-version${versionPopupOpen ? ' active' : ''}`}
          type="button"
          onClick={e => { e.stopPropagation(); setBookPopupOpen(false); versionPopupOpen ? setVersionPopupOpen(false) : openVersionPopup(); }}
        >
          <span className="nav-btn-label" title={currentTranslationTitle}>{currentTranslationLabel}</span>
          <span className="chevron" aria-hidden="true" />
        </button>
      </div>
      <div className="nav-right">
        <span className="topbar-tooltip-wrap" data-tooltip="Search">
          <button
            className={`nav-btn nav-btn-icon-only${searchOpen ? ' active' : ''}`}
            type="button"
            aria-label="Open search"
            aria-expanded={searchOpen}
            aria-controls="nav-search-panel"
            onClick={e => {
              e.stopPropagation();
              setBookPopupOpen(false);
              setVersionPopupOpen(false);
              setSearchOpen(v => !v);
            }}
          >
            <svg className="nav-search-icon" viewBox="0 0 24 24" width={20} height={20} aria-hidden="true">
              <circle cx="11" cy="11" r="7" fill="none" stroke="currentColor" strokeWidth="2" />
              <path d="M20 20 16.5 16.5" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
            </svg>
          </button>
        </span>
        <span className="topbar-tooltip-wrap" data-tooltip="Account">
          <button
            className={`nav-btn nav-btn-icon-only${sidePanelMode === 'study' ? ' active' : ''}`}
            type="button"
            aria-label="My stuff"
            aria-expanded={sidePanelMode === 'study'}
            onClick={e => {
              e.stopPropagation();
              setBookPopupOpen(false);
              setVersionPopupOpen(false);
              setSearchOpen(false);
              toggleStudyPanel();
            }}
          >
            <svg className="nav-search-icon" viewBox="0 0 24 24" width={20} height={20} aria-hidden="true">
              <circle cx="12" cy="9" r="3.25" />
              <path d="M5 20.5v-.35c0-3.2 2.85-5.65 7-5.65s7 2.45 7 5.65v.35" />
            </svg>
          </button>
        </span>
      </div>
    </nav>
  );
}
