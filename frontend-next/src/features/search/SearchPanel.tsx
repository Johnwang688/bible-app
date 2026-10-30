'use client';

import type { Dispatch, RefObject, SetStateAction } from 'react';
import type { SavedPassage, SearchResult, SearchSuggestion } from '@/features/reader/types';

export interface SearchPanelProps {
  searchOpen: boolean;
  setSearchOpen: Dispatch<SetStateAction<boolean>>;
  searchPanelRef: RefObject<HTMLDivElement | null>;
  searchInputRef: RefObject<HTMLInputElement | null>;
  searchQuery: string;
  setSearchQuery: Dispatch<SetStateAction<string>>;
  searchLoading: boolean;
  searchError: string | null;
  searchSuggestions: SearchSuggestion[];
  searchResults: SearchResult[];
  recentPassages: SavedPassage[];
  runSearch: () => Promise<void>;
  applySearchSuggestion: (suggestion: SearchSuggestion, options?: { closePanel?: boolean }) => void;
  navigateToPassage: (
    bookName: string | null | undefined,
    nextChapter: number,
    nextTranslation?: string,
    verseNumber?: number,
  ) => boolean;
}

export default function SearchPanel({
  searchOpen,
  setSearchOpen,
  searchPanelRef,
  searchInputRef,
  searchQuery,
  setSearchQuery,
  searchLoading,
  searchError,
  searchSuggestions,
  searchResults,
  recentPassages,
  runSearch,
  applySearchSuggestion,
  navigateToPassage,
}: SearchPanelProps) {
  return (
    <div
      className={`popup-overlay${searchOpen ? ' open' : ''}`}
      onClick={e => { if (e.target === e.currentTarget) setSearchOpen(false); }}
    >
      <div ref={searchPanelRef} className="search-panel search-dropdown-panel" id="nav-search-panel">
        <form
          className="search-form"
          onSubmit={event => {
            event.preventDefault();
            void runSearch();
          }}
        >
          <input
            ref={searchInputRef}
            className="search-input"
            type="search"
            value={searchQuery}
            placeholder="John 3, Romans 8:28, or a phrase…"
            onChange={event => setSearchQuery(event.target.value)}
            autoComplete="off"
          />
          <button
            className="search-submit search-submit-icon-only"
            type="submit"
            disabled={searchLoading}
            aria-label={searchLoading ? 'Searching' : 'Search'}
          >
            {searchLoading ? (
              <span className="spinner search-submit-spinner" aria-hidden />
            ) : (
              <svg className="search-submit-icon" viewBox="0 0 24 24" width={20} height={20} aria-hidden="true">
                <circle cx="11" cy="11" r="7" fill="none" stroke="currentColor" strokeWidth="2" />
                <path d="M20 20 16.5 16.5" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" />
              </svg>
            )}
          </button>
        </form>
        {searchSuggestions.length > 0 && (
          <div className="search-section search-section--compact">
            <div className="search-section-title">
              {searchQuery.trim() ? 'Suggestions' : 'Popular & recent'}
            </div>
            <div className="search-suggestion-list" role="listbox" aria-label="Search suggestions">
              {searchSuggestions.map(suggestion => (
                <button
                  key={suggestion.id}
                  className="search-suggestion"
                  type="button"
                  onClick={() => applySearchSuggestion(suggestion)}
                >
                  <div className="search-suggestion-top">
                    <span className={`search-suggestion-badge search-suggestion-badge--${suggestion.source}`}>
                      {suggestion.source === 'typo'
                        ? 'Typo match'
                        : suggestion.source === 'recent'
                          ? 'Recent'
                          : suggestion.source === 'direct'
                            ? 'Go to'
                            : 'Popular'}
                    </span>
                    <span className="search-suggestion-arrow" aria-hidden="true">&gt;</span>
                  </div>
                  <div className="search-suggestion-title">{suggestion.label}</div>
                  <div className="search-suggestion-subtitle">{suggestion.hint}</div>
                </button>
              ))}
            </div>
          </div>
        )}
        {!searchQuery.trim() && recentPassages.length > 0 && searchSuggestions.length === 0 && (
          <div className="search-section search-section--compact">
            <div className="search-chip-row" aria-label="Recent passages">
              {recentPassages.slice(0, 6).map(entry => (
                <button
                  key={`${entry.book}-${entry.chapter}-${entry.translation}`}
                  className="search-chip"
                  type="button"
                  onClick={() => navigateToPassage(entry.book, entry.chapter, entry.translation)}
                >
                  {entry.book} {entry.chapter}
                </button>
              ))}
            </div>
          </div>
        )}
        {searchError && <div className="search-empty">{searchError}</div>}
        {searchResults.length > 0 && (
          <div className="search-results">
            {searchResults.map(result => (
              <button
                key={`${result.verse.book}-${result.verse.chapter}-${result.verse.verse}-${result.verse.translation}`}
                className="search-result"
                type="button"
                onClick={() => {
                  navigateToPassage(result.verse.book, result.verse.chapter, result.verse.translation, result.verse.verse);
                  setSearchOpen(false);
                }}
              >
                <div className="search-result-ref">
                  {result.verse.book} {result.verse.chapter}:{result.verse.verse} ({result.verse.translation})
                </div>
                <div className="search-result-text">{result.verse.text}</div>
              </button>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
