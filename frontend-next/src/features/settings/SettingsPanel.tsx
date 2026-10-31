'use client';

import type { Dispatch, RefObject, SetStateAction } from 'react';
import { READER_FONT_PX_OPTIONS, READER_LINE_HEIGHT_OPTIONS } from '@/features/reader/types';
import type { GraphicsMode, ReaderFontId, ReaderFontPx, ReaderLineHeightOption, ReaderReadingMode, SidePanelPosition } from '@/features/reader/types';
import styles from '@/features/settings/SettingsPanel.module.css';
import { useReaderSettings } from '@/features/settings/ReaderSettingsContext';
import { THEMES, THEME_GRID_PREVIEW_COUNT, getThemeCardStyle, themesForCollapsedPicker } from '@/features/settings/themeHelpers';

export interface SettingsPanelProps {
  settingsOpen: boolean;
  setSettingsOpen: Dispatch<SetStateAction<boolean>>;
  settingsPanelRef: RefObject<HTMLDivElement | null>;
  settingsOpenedFromHomeRef: RefObject<boolean>;
  setHomeScreenActive: Dispatch<SetStateAction<boolean>>;
  themePickerExpanded: boolean;
  setThemePickerExpanded: Dispatch<SetStateAction<boolean>>;
  currentTheme: string;
  applyTheme: (id: string) => void;
}

export default function SettingsPanel({
  settingsOpen,
  setSettingsOpen,
  settingsPanelRef,
  settingsOpenedFromHomeRef,
  setHomeScreenActive,
  themePickerExpanded,
  setThemePickerExpanded,
  currentTheme,
  applyTheme,
}: SettingsPanelProps) {
  const { readerSettings, setReaderSettings } = useReaderSettings();
  return (
    <div
      className={`settings-overlay${settingsOpen ? ' open' : ''}`}
      onClick={e => { if (e.target === e.currentTarget) { setSettingsOpen(false); if (settingsOpenedFromHomeRef.current) setHomeScreenActive(true); } }}
    >
      <div ref={settingsPanelRef} className="settings-panel">
        <div className="settings-header">
          <span className="settings-title">Settings</span>
          <button className="settings-close" type="button" aria-label="Close settings" onClick={() => { setSettingsOpen(false); if (settingsOpenedFromHomeRef.current) setHomeScreenActive(true); }}>✕</button>
        </div>
        <div className="settings-body">
          <div className="settings-section-label">Appearance</div>
          <div className="theme-grid">
            {(themePickerExpanded ? THEMES : themesForCollapsedPicker(currentTheme, THEME_GRID_PREVIEW_COUNT)).map(theme => (
              <div
                key={theme.id}
                className={`theme-card${currentTheme === theme.id ? ' selected' : ''}`}
                style={getThemeCardStyle(theme)}
                role="button"
                tabIndex={0}
                onClick={() => applyTheme(theme.id)}
                onKeyDown={e => e.key === 'Enter' && applyTheme(theme.id)}
              >
                <div className="theme-swatches">
                  {theme.swatches.map((color, i) => (
                    <span key={i} style={{ background: color }} />
                  ))}
                </div>
                <div className="theme-name">{theme.name}</div>
                <span className="theme-check" aria-hidden="true">✓</span>
              </div>
            ))}
          </div>
          {THEMES.length > THEME_GRID_PREVIEW_COUNT && (
            <button
              type="button"
              className="settings-theme-expand"
              onClick={() => setThemePickerExpanded(exp => !exp)}
            >
              {themePickerExpanded ? 'See less' : 'See more'}
            </button>
          )}
          <div className="settings-section-label">Reading</div>
          <div className="settings-controls">
            <label className="settings-field">
              <span>Text size</span>
              <span className="settings-select-wrap">
                <select
                  value={readerSettings.fontScale}
                  onChange={event => setReaderSettings(prev => ({ ...prev, fontScale: event.target.value as ReaderFontPx }))}
                >
                  {READER_FONT_PX_OPTIONS.map(px => (
                    <option key={px} value={px}>{px}px</option>
                  ))}
                </select>
              </span>
            </label>
            <label className="settings-field">
              <span>Reading font</span>
              <span className="settings-select-wrap">
                <select
                  value={readerSettings.readerFont}
                  onChange={event => setReaderSettings(prev => ({
                    ...prev,
                    readerFont: event.target.value as ReaderFontId,
                  }))}
                >
                  <option value="georgia">Georgia (default)</option>
                  <option value="charter">Charter</option>
                  <option value="palatino">Palatino</option>
                  <option value="garamond">Garamond style</option>
                  <option value="times">Times New Roman</option>
                  <option value="sans">Sans (UI)</option>
                  <option value="openSans">Open Sans</option>
                  <option value="dyslexie">Dyslexie</option>
                </select>
              </span>
            </label>
            <label className="settings-field">
              <span>Reading mode</span>
              <span className="settings-select-wrap">
                <select
                  value={readerSettings.readingMode}
                  onChange={event => setReaderSettings(prev => ({
                    ...prev,
                    readingMode: event.target.value as ReaderReadingMode,
                  }))}
                >
                  <option value="single">Scroll — single column</option>
                  <option value="book">Scroll — two columns</option>
                  <option value="paged-single">Pages — single page (no scroll)</option>
                  <option value="paged-double">Pages — two pages (spread)</option>
                </select>
              </span>
            </label>
            <label className="settings-field">
              <span>Line spacing</span>
              <span className="settings-select-wrap">
                <select
                  value={readerSettings.lineHeight}
                  onChange={event => setReaderSettings(prev => ({ ...prev, lineHeight: event.target.value as ReaderLineHeightOption }))}
                >
                  {READER_LINE_HEIGHT_OPTIONS.map(opt => (
                    <option key={opt} value={opt}>
                      {opt === '2' ? '2.0' : opt}
                    </option>
                  ))}
                </select>
              </span>
            </label>
            <label className="settings-field">
              <span>Side panel position</span>
              <span className="settings-select-wrap">
                <select
                  value={readerSettings.sidePanelPosition}
                  onChange={event => setReaderSettings(prev => ({ ...prev, sidePanelPosition: event.target.value as SidePanelPosition }))}
                >
                  <option value="left">Left side</option>
                  <option value="right">Right side</option>
                </select>
              </span>
            </label>
          </div>
          <div className="settings-section-label">Graphics</div>
          <div className="settings-controls">
            <label className="settings-field">
              <span>Graphics mode</span>
              <span className="settings-select-wrap">
                <select
                  value={readerSettings.graphicsMode}
                  onChange={event => setReaderSettings(prev => ({ ...prev, graphicsMode: event.target.value as GraphicsMode }))}
                >
                  <option value="auto">Auto (recommended)</option>
                  <option value="performance">Performance — full effects</option>
                  <option value="efficiency">Efficiency — reduced while scrolling</option>
                </select>
              </span>
            </label>
            <label className="settings-toggle">
              <input
                type="checkbox"
                checked={readerSettings.specialEffects}
                onChange={event => setReaderSettings(prev => ({ ...prev, specialEffects: event.target.checked }))}
              />
              <span>Special effects</span>
            </label>
            <label className="settings-toggle">
              <input
                type="checkbox"
                checked={readerSettings.pageFlipEnabled}
                onChange={event => setReaderSettings(prev => ({ ...prev, pageFlipEnabled: event.target.checked }))}
              />
              <span>Page flip animation</span>
            </label>
          </div>
          <div className="settings-section-label">Sources</div>
          <ul className={styles.sources}>
            <li>
              <span className={styles.sourceName}>Berean Standard Bible (BSB)</span>: dedicated to the public domain.{' '}
              <a href="https://berean.bible" target="_blank" rel="noopener noreferrer">berean.bible</a>
            </li>
            <li>
              <span className={styles.sourceName}>Hebrew and Greek word alignment</span>: the BSB translation tables.
            </li>
            <li>
              <span className={styles.sourceName}>Hebrew and Greek dictionary</span>: STEP Bible brief lexicons, CC BY 4.0.{' '}
              <a href="https://www.stepbible.org" target="_blank" rel="noopener noreferrer">stepbible.org</a>
            </li>
            <li>
              <span className={styles.sourceName}>World English Bible, American Standard Version and Chinese Union Version</span>: public domain.
            </li>
            <li>
              <span className={styles.sourceName}>Matthew Henry&apos;s Commentary</span>: public domain.
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
}
