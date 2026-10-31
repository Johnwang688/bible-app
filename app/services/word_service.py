"""Original-language words for a verse, Strong's lexicon entries, and plain-English grammar."""

from __future__ import annotations

import re

from app.core.book_catalog import BOOK_BY_NUMBER
from app.core.content_db import fetch_all, fetch_one
from app.schemas.words import (
    LexiconEntryOut,
    LexiconReferenceOut,
    VerseWordOut,
    VerseWordsOut,
)
from app.services.bible_service import resolve_book

LEXICON_SOURCE = "STEP Bible brief lexicon (STEPBible.org, CC BY 4.0)"
_REFERENCE_LIMIT = 20
_STRONGS_RE = re.compile(r"([HGhg])0*(\d{1,4})([A-Za-z]?)")
_MAX_BOOK_DIGITS = 3
_MAX_COORD = 999

# ── Plain-English grammar ────────────────────────────────────────────────────

_SEP = " · "
_OF = "“of” form"

# Prefixes, particles and other whole-token renderings (Hebrew, Aramaic and Greek).
_PARTICLES = {
    "Conjunctive waw": "and",
    "Article": "the",
    "Preposition-b": "in/with",
    "Preposition-l": "to/for",
    "Preposition-k": "like/as",
    "Preposition-m": "from",
    "Preposition": "preposition",
    "Direct object marker": "object marker (not translated)",
    "Conjunction": "joining word",
    "Adverb - Negative particle": "not",
    "Adverb": "adverb",
    "Interjection": "exclamation",
    "Interrogative": "question word",
    "Pronoun - relative": "who/which",
}

_HEB_STEMS = {
    "Qal": None,
    "Nifal": "passive or reflexive",
    "Piel": "intensive",
    "Pual": "intensive, passive",
    "Hifil": "causes it to happen",
    "Hofal": "made to happen",
    "Hitpael": "done to oneself",
}

_HEB_ASPECTS = {
    "Perfect": "completed action",
    "Imperfect": "ongoing or future action",
    "Conjunctive imperfect": "ongoing or future action",
    "Consecutive imperfect": "past narrative",
    "Conjunctive perfect": "future or ongoing",
    "Imperative": "command",
    "Imperfect Jussive": "let it happen",
    "Imperfect Cohortative": "let me/us",
    "Conjunctive imperfect Cohortative": "let me/us",
    "Conjunctive imperfect Jussive": "let it happen",
    "Infinitive construct": "“to” form",
    "Infinitive absolute": "emphatic form",
    "Participle": "“-ing” form",
    "QalPassParticiple": "“-ed” form",
}

_HEB_POS = {"Noun": "noun", "Adjective": "describing word", "Number": "number", "Pronoun": "pronoun"}

_PERSON_RE = re.compile(r"^(first|second|third) person(?: (masculine|feminine|common))?(?: (singular|plural|dual))?$")
_CODE_RE = re.compile(r"^([mfcb])([spd])(c?)$")

_SUFFIX_PRONOUNS = {
    ("third", "singular", "feminine"): "her",
    ("third", "singular", None): "him/his",
    ("third", "plural", None): "them/their",
    ("second", "singular", None): "you/your",
    ("second", "plural", None): "you all/your",
    ("first", "singular", None): "me/my",
    ("first", "plural", None): "us/our",
}

_GK_TENSE = {
    "Present": "ongoing",
    "Imperfect": "ongoing in the past",
    "Future": "future",
    "Aorist": "simple",
    "Perfect": "completed, with lasting results",
    "Pluperfect": "had already happened",
}
_GK_MOOD = {
    "Subjunctive": "might/could",
    "Optative": "wish",
    "Imperative": "command",
    "Infinitive": "“to” form",
    "Participle": "“-ing” form",
}
_GK_VOICE = {
    "Middle": "for oneself",
    "Passive": "done to the subject",
    "Middle or Passive": "for oneself or done to the subject",
}
_GK_CASE = {
    "Nominative": "subject",
    "Genitive": "“of” (genitive)",
    "Dative": "“to/for” (dative)",
    "Accusative": "object",
    "Vocative": "spoken to",
}
_GK_PERSON = {
    ("1st", "Singular"): "I",
    ("1st", "Plural"): "we",
    ("2nd", "Singular"): "you",
    ("2nd", "Plural"): "you all",
    ("3rd", "Singular"): "he/she/it",
    ("3rd", "Plural"): "they",
}
_GK_PERSON_RE = re.compile(r"\b(1st|2nd|3rd) Person (Singular|Plural)\b")
_GK_CASE_RE = re.compile(r"\b(Nominative|Genitive|Dative|Accusative|Vocative)\b")
_GK_NUMBER_RE = re.compile(r"\b(Singular|Plural)\b")
_GK_AGREEMENT_RE = re.compile(
    r"(?:Nominative|Genitive|Dative|Accusative|Vocative|Masculine|Feminine|Neuter|Singular|Plural"
    r"|[123](?:st|nd|rd) Person)(?: (?:Nominative|Genitive|Dative|Accusative|Vocative|Masculine|Feminine"
    r"|Neuter|Singular|Plural|[123](?:st|nd|rd) Person))*"
)
_GK_TENSES = ("Pluperfect", "Imperfect", "Present", "Future", "Aorist", "Perfect")
_GK_MOODS = ("Indicative", "Subjunctive", "Optative", "Imperative", "Infinitive", "Participle")


def _lower(text: str) -> str:
    return " ".join(text.split()).lower()


def _number_features(token: str) -> list[str] | None:
    """Features from a gender-number token (words or short code). None if unreadable."""
    token = token.strip()
    code = _CODE_RE.match(token)
    if code:
        feats = [{"s": "singular", "p": "plural", "d": "pair"}[code.group(2)]]
        if code.group(3):
            feats.append(_OF)
        return feats
    low = token.lower()
    m = re.search(r"\b(singular|plural|dual)(d?)\b", low)
    if not m:
        return None
    feats = [{"singular": "singular", "plural": "plural", "dual": "pair"}[m.group(1)]]
    rest = (low[: m.start()] + " " + low[m.end():]).split()
    if "construct" in rest:
        feats.append(_OF)
        rest.remove("construct")
    if m.group(2) == "d" or "determinate" in rest:
        feats.append("“the” form")
        if "determinate" in rest:
            rest.remove("determinate")
    for word in rest:
        if word not in ("masculine", "feminine", "common", "both"):
            feats.append(word)
    return feats


def _person_parts(token: str) -> tuple[str, str, str | None] | None:
    m = _PERSON_RE.match(token.strip().lower())
    if not m or not m.group(3):
        return None
    return m.group(1), m.group(3), m.group(2)


def _heb_subject(token: str) -> str | None:
    parts = _person_parts(token)
    if not parts:
        return None
    person, number, gender = parts
    if person == "third":
        if number == "plural":
            return "they"
        if number == "singular":
            return {"masculine": "he", "feminine": "she"}.get(gender or "", "he/she")
        return None
    if person == "second":
        return {"singular": "you", "plural": "you all"}.get(number)
    return {"singular": "I", "plural": "we"}.get(number)


def _heb_suffix(token: str) -> str | None:
    parts = _person_parts(token)
    if not parts:
        return None
    person, number, gender = parts
    if person == "third" and number == "singular":
        return _SUFFIX_PRONOUNS[("third", "singular", "feminine" if gender == "feminine" else None)]
    return _SUFFIX_PRONOUNS.get((person, number, None))


def _heb_verb(tokens: list[str]) -> str:
    feats = ["verb"]
    rest = tokens[1:]
    if rest:
        stem = rest.pop(0)
        if stem in _HEB_STEMS:
            if _HEB_STEMS[stem]:
                feats.append(_HEB_STEMS[stem])
        else:
            feats.append(_lower(stem))
    aspect = None
    if rest:
        aspect = rest.pop(0)
        feats.append(_HEB_ASPECTS.get(aspect) or _lower(aspect))
    participle = bool(aspect) and aspect.endswith("articiple")
    for tok in rest:
        if participle:
            nf = _number_features(tok)
            feats.extend(nf if nf else [_lower(tok)])
        else:
            subject = _heb_subject(tok)
            if not subject and aspect == "Imperative":
                nf = _number_features(tok)  # commands have only gender-number: addressed to "you"
                if nf and nf[0] in ("singular", "plural"):
                    subject = "you" if nf[0] == "singular" else "you all"
            feats.append(subject or _lower(tok))
    return _SEP.join(feats)


def _heb_segment(seg: str) -> str:
    if seg in _PARTICLES:
        return _PARTICLES[seg]
    suffix = _heb_suffix(seg)
    if suffix:
        return suffix
    tokens = seg.split(" - ")
    head = tokens[0]
    if head == "Verb":
        return _heb_verb(tokens)
    if head == "Noun" and len(tokens) > 1 and tokens[1] == "proper":
        return "name"
    if head in _HEB_POS:
        feats = [_HEB_POS[head]]
        for tok in tokens[1:]:
            if head == "Pronoun":
                subject = _heb_subject(tok)
                if subject:
                    feats.append(subject)
                    continue
            nf = _number_features(tok)
            if nf is None and _person_parts(tok):
                continue  # pronoun person: the number alone is shown
            feats.extend(nf if nf else [_lower(tok)])
        return _SEP.join(dict.fromkeys(feats))
    return _SEP.join(_lower(t) for t in tokens)


def _gk_verb(tokens: list[str]) -> str:
    feats = ["verb"]
    words = tokens[1] if len(tokens) > 1 else ""
    mood = next((m for m in _GK_MOODS if re.search(rf"\b{m}\b", words)), None)
    tense = next((t for t in _GK_TENSES if re.search(rf"\b{t}\b", words)), None)
    if tense == mood:  # a lone "Imperfect"/"Imperative" word counted twice
        tense = None
    voice_text = words
    for known in (tense, mood):
        if known:
            voice_text = re.sub(rf"\b{known}\b", "", voice_text, count=1)
    voice = " ".join(voice_text.split())
    if tense:
        feats.append("simple past" if tense == "Aorist" and mood == "Indicative" else _GK_TENSE[tense])
    if mood and mood != "Indicative":
        feats.append(_GK_MOOD[mood])
    if voice and voice != "Active":
        feats.append(_GK_VOICE.get(voice) or _lower(voice))
    nonfinite = mood in ("Participle", "Infinitive")
    for tok in tokens[2:]:
        if nonfinite:
            # case, gender, number and subject are omitted; anything else is kept
            if not _GK_AGREEMENT_RE.fullmatch(tok):
                feats.append(_lower(tok))
            continue
        m = _GK_PERSON_RE.fullmatch(tok)
        feats.append(_GK_PERSON[(m.group(1), m.group(2))] if m else _lower(tok))
    return _SEP.join(feats)


def _gk_nominal(tokens: list[str]) -> str:
    head = tokens[0]
    if head == "Article":
        return "the"
    if head == "Noun":
        pos = "noun"
    elif head == "Adjective":
        pos = "describing word"
    elif head.endswith("Pronoun"):
        pos = "pronoun"
    else:
        return _SEP.join(_lower(t) for t in tokens)
    feats = [pos]
    for tok in tokens[1:]:
        case = _GK_CASE_RE.search(tok)
        person = _GK_PERSON_RE.search(tok)
        number = _GK_NUMBER_RE.search(tok)
        if case:
            feats.append(_GK_CASE[case.group(1)])
        if person:
            feats.append(_GK_PERSON[(person.group(1), person.group(2))])
        elif number:
            feats.append(number.group(1).lower())
        if not case and not person and not number:
            feats.append(_lower(tok))
    return _SEP.join(dict.fromkeys(feats))


def _gk_segment(seg: str) -> str:
    if seg in _PARTICLES:
        return _PARTICLES[seg]
    tokens = seg.split(" - ")
    if tokens[0] == "Verb":
        return _gk_verb(tokens)
    return _gk_nominal(tokens)


def plain_grammar(language: str, parsing: str | None) -> str | None:
    """Plain-English phrase for a STEPBible parsing string; None when there is no parsing."""
    if not parsing or not parsing.strip():
        return None
    render = _gk_segment if language == "greek" else _heb_segment
    out: list[str] = []
    for segment in parsing.split("|"):
        segment = " ".join(segment.split())
        for part in segment.split(", "):
            part = part.strip()
            if part:
                out.append(render(part))
    result = " ".join(" + ".join(x for x in out if x).split())
    return result or None


# ── Queries ──────────────────────────────────────────────────────────────────

def get_verse_words(book: str, chapter: int, verse: int) -> VerseWordsOut | None:
    if not (1 <= chapter <= _MAX_COORD and 1 <= verse <= _MAX_COORD):
        return None
    key = book.strip()
    if key.isdecimal():
        if len(key) > _MAX_BOOK_DIGITS:
            return None
        try:
            book_info = resolve_book(int(key))
        except ValueError:
            return None
    else:
        book_info = resolve_book(book)
    if not book_info:
        return None
    number = book_info["number"]
    rows = fetch_all(
        "SELECT w.english_order, w.english, w.english_kind, w.original, w.translit, w.language, "
        "w.strongs, w.parsing, w.parsing_code, w.footnote, l.lemma, l.gloss "
        "FROM bsb_words w LEFT JOIN lexicon l ON l.strongs = w.strongs "
        "WHERE w.book_number = ? AND w.chapter = ? AND w.verse = ? "
        "ORDER BY w.english_order, w.original_order",
        (number, chapter, verse),
    )
    if not rows:
        exists = fetch_one(
            "SELECT 1 AS found FROM verses WHERE translation IN ('BSB', 'WEB') "
            "AND book_number = ? AND chapter = ? AND verse = ? LIMIT 1",
            (number, chapter, verse),
        )
        if not exists:
            return None
    words = [
        VerseWordOut(**row, grammar=plain_grammar(row["language"], row["parsing"]))
        for row in rows
    ]
    return VerseWordsOut(
        book=book_info["name"],
        book_number=number,
        chapter=chapter,
        verse=verse,
        translation="BSB",
        words=words,
    )


def normalize_strongs(raw: str) -> str | None:
    m = _STRONGS_RE.fullmatch(raw) if raw else None
    if not m:
        return None
    return f"{m.group(1).upper()}{int(m.group(2)):04d}"


def get_lexicon_entry(raw_strongs: str) -> LexiconEntryOut | None:
    strongs = normalize_strongs(raw_strongs)
    if not strongs:
        return None
    entry = fetch_one(
        "SELECT strongs, language, lemma, translit, gloss, definition FROM lexicon WHERE strongs = ?",
        (strongs,),
    )
    if not entry:
        return None
    counts = fetch_one("SELECT COUNT(*) AS n FROM bsb_words WHERE strongs = ?", (strongs,))
    verse_count = fetch_one(
        "SELECT COUNT(*) AS n FROM (SELECT 1 FROM bsb_words WHERE strongs = ? "
        "GROUP BY book_number, chapter, verse)",
        (strongs,),
    )
    refs = fetch_all(
        "SELECT book_number, chapter, verse FROM bsb_words WHERE strongs = ? "
        "GROUP BY book_number, chapter, verse ORDER BY book_number, chapter, verse LIMIT ?",
        (strongs, _REFERENCE_LIMIT),
    )
    references = [
        LexiconReferenceOut(book=BOOK_BY_NUMBER[r["book_number"]]["name"], **r) for r in refs
    ]
    return LexiconEntryOut(
        **entry,
        occurrences=counts["n"],
        verse_count=verse_count["n"],
        references=references,
        source=LEXICON_SOURCE,
    )
