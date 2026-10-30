"""Fixed request set for the golden-response tests (W0.2). Owned by the orchestrator: do not edit.

Each entry is replayed in-process against app.main:app. Quiz, auth, user and AI-completion
endpoints are excluded on purpose: they need sign-in, are random, or call a model.
"""

from __future__ import annotations

REQUESTS: list[dict] = [
    # Reference data
    {"name": "translations", "method": "GET", "path": "/api/v1/translations"},
    {"name": "books", "method": "GET", "path": "/api/v1/books"},
    {"name": "commentary_sources", "method": "GET", "path": "/api/v1/commentary/sources"},
    # Chapters, every translation that has text
    {"name": "chapter_john3_web", "method": "GET", "path": "/api/v1/chapters/John/3", "params": {"translation": "WEB"}},
    {"name": "chapter_john3_asv", "method": "GET", "path": "/api/v1/chapters/John/3", "params": {"translation": "ASV"}},
    {"name": "chapter_john3_cuv", "method": "GET", "path": "/api/v1/chapters/John/3", "params": {"translation": "CUV"}},
    {"name": "chapter_john3_cuvsimp", "method": "GET", "path": "/api/v1/chapters/John/3", "params": {"translation": "CUV-SIMP"}},
    {"name": "chapter_genesis1_web", "method": "GET", "path": "/api/v1/chapters/Genesis/1", "params": {"translation": "WEB"}},
    {"name": "chapter_psalm119_web", "method": "GET", "path": "/api/v1/chapters/Psalms/119", "params": {"translation": "WEB"}},
    {"name": "chapter_obadiah1_web", "method": "GET", "path": "/api/v1/chapters/Obadiah/1", "params": {"translation": "WEB"}},
    {"name": "chapter_revelation22_web", "method": "GET", "path": "/api/v1/chapters/Revelation/22", "params": {"translation": "WEB"}},
    {"name": "chapter_lowercase_book", "method": "GET", "path": "/api/v1/chapters/john/3", "params": {"translation": "WEB"}},
    {"name": "chapter_missing", "method": "GET", "path": "/api/v1/chapters/John/22", "params": {"translation": "WEB"}},
    {"name": "chapter_empty_translation", "method": "GET", "path": "/api/v1/chapters/John/3", "params": {"translation": "KJV"}},
    {"name": "chapter_unknown_book", "method": "GET", "path": "/api/v1/chapters/Hezekiah/1", "params": {"translation": "WEB"}},
    # Verses
    {"name": "verse_john3_16_web", "method": "GET", "path": "/api/v1/verses/John/3/16", "params": {"translation": "WEB"}},
    {"name": "verse_john3_16_cuv", "method": "GET", "path": "/api/v1/verses/John/3/16", "params": {"translation": "CUV"}},
    {"name": "verse_range_john3_16_18", "method": "GET", "path": "/api/v1/verses/John/3/16/18", "params": {"translation": "WEB"}},
    {"name": "verse_missing", "method": "GET", "path": "/api/v1/verses/John/3/99", "params": {"translation": "WEB"}},
    {"name": "verse_range_missing", "method": "GET", "path": "/api/v1/verses/John/3/40/45", "params": {"translation": "WEB"}},
    # Search
    {"name": "search_love_web", "method": "POST", "path": "/api/v1/search", "json": {"query": "love", "translation": "WEB", "limit": 20}},
    {"name": "search_two_words", "method": "POST", "path": "/api/v1/search", "json": {"query": "faith hope", "translation": "WEB", "limit": 20}},
    {"name": "search_love_in_john", "method": "POST", "path": "/api/v1/search", "json": {"query": "love", "translation": "WEB", "book": "John", "limit": 20}},
    {"name": "search_jerusalem_asv", "method": "POST", "path": "/api/v1/search", "json": {"query": "Jerusalem", "translation": "ASV", "limit": 5}},
    {"name": "search_chinese_cuv", "method": "POST", "path": "/api/v1/search", "json": {"query": "神愛世人", "translation": "CUV", "limit": 10}},
    {"name": "search_chinese_cuvsimp", "method": "POST", "path": "/api/v1/search", "json": {"query": "神爱世人", "translation": "CUV-SIMP", "limit": 10}},
    {"name": "search_no_results", "method": "POST", "path": "/api/v1/search", "json": {"query": "xyzzyqq", "translation": "WEB", "limit": 20}},
    # Commentary
    {"name": "commentary_john3", "method": "GET", "path": "/api/v1/commentary", "params": {"book": "John", "chapter": 3}},
    {"name": "commentary_john3_16", "method": "GET", "path": "/api/v1/commentary", "params": {"book": "John", "chapter": 3, "verse": 16}},
    {"name": "commentary_john3_mh", "method": "GET", "path": "/api/v1/commentary", "params": {"book": "John", "chapter": 3, "source": "matthew_henry"}},
    {"name": "commentary_john3_summary", "method": "GET", "path": "/api/v1/commentary", "params": {"book": "John", "chapter": 3, "source": "summary"}},
    {"name": "commentary_genesis1", "method": "GET", "path": "/api/v1/commentary", "params": {"book": "Genesis", "chapter": 1}},
    {"name": "commentary_obadiah1", "method": "GET", "path": "/api/v1/commentary", "params": {"book": "Obadiah", "chapter": 1}},
    # Summary entities
    {"name": "entities_theme", "method": "GET", "path": "/api/v1/summary-entities/list/theme"},
    {"name": "entities_person", "method": "GET", "path": "/api/v1/summary-entities/list/person"},
    {"name": "entities_place", "method": "GET", "path": "/api/v1/summary-entities/list/place"},
    {"name": "entity_theme_covenant", "method": "GET", "path": "/api/v1/summary-entities/theme/covenant-promise"},
    {"name": "entity_person_god", "method": "GET", "path": "/api/v1/summary-entities/person/god"},
    {"name": "entity_place_antioch", "method": "GET", "path": "/api/v1/summary-entities/place/antioch"},
    {"name": "entity_place_achaia", "method": "GET", "path": "/api/v1/summary-entities/place/achaia"},
    {"name": "entity_missing", "method": "GET", "path": "/api/v1/summary-entities/person/not-a-real-slug"},
    {"name": "entity_bad_kind", "method": "GET", "path": "/api/v1/summary-entities/animal/lion"},
    # Guided-chapter sections (deterministic, derived from commentary intervals)
    {"name": "guided_sections_john3", "method": "GET", "path": "/api/v1/ai/guided-chapter/sections", "params": {"book": "John", "chapter": 3}},
    {"name": "guided_sections_genesis1", "method": "GET", "path": "/api/v1/ai/guided-chapter/sections", "params": {"book": "Genesis", "chapter": 1}},
]
