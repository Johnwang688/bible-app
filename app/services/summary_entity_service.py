"""Themes and key people from Chapter Summaries: parsing, mentions index, lookups."""

from __future__ import annotations

import logging
from collections import defaultdict
from dataclasses import dataclass
from typing import Any
import re

from app.core.book_catalog import BOOK_BY_NUMBER
from app.core.slugify import slugify_label
from app.core.supabase_client import get_supabase, get_supabase_admin

logger = logging.getLogger(__name__)

SUMMARY_SOURCE = "summary"
_ID_CHUNK = 500
_ENTITY_INSERT_BATCH = 250
_MENTION_INSERT_BATCH = 500
_ENTITY_PAGE_SIZE = 1000
_PLACE_ENTITY_INDEXING_ENABLED = True
_PLACE_LIKE_NAMES = frozenset(
    {
        "israel",
        "judah",
        "jerusalem",
        "samaria",
        "judea",
        "galilee",
        "egypt",
        "babylon",
        "assyria",
        "nineveh",
        "damascus",
        "canaan",
        "promised land",
        "zion",
        "sinai",
        "moriah",
        "bethlehem",
        "nazareth",
        "jericho",
        "bethany",
        "rome",
        "antioch",
        "corinth",
        "ephesus",
        "philippi",
        "thessalonica",
    }
)
_PERSON_GENERIC_LABELS = frozenset(
    {
        "light",
        "darkness",
        "earth",
        "heavens",
        "heaven",
        "waters",
        "water",
        "land",
        "the land",
        "firmament",
        "void",
        "sky",
        "deep",
        "the deep",
        "fire",
        "night",
        "day",
        "breath",
        "clay",
        "chaos",
        "sea",
        "clouds",
        "cloud",
        "storm",
        "rain",
        "wind",
        "dust",
        "shadow",
        "glory",
        "spirit",
        "the spirit",
    }
)
_PLACE_GENERIC_LABELS = frozenset(
    {
        *_PERSON_GENERIC_LABELS,
        "wilderness",
        "the wilderness",
        "mountain",
        "mountains",
        "the mountain",
        "valley",
        "the valley",
        "river",
        "the river",
        "desert",
        "the desert",
        "field",
        "fields",
        "the field",
        "city",
        "the city",
        "town",
        "the town",
        "forest",
        "the forest",
        "cave",
        "the cave",
        "hill",
        "the hill",
        "hills",
        "plain",
        "the plain",
        "shore",
        "coast",
        "border",
        "gate",
        "the gate",
        "road",
        "the road",
        "way",
        "the way",
        "path",
        "the path",
        "camp",
        "the camp",
        "palace",
        "the palace",
        "house",
        "the house",
        "land of canaan",
        "the land of canaan",
    }
)
_TITLE_ONLY_PERSONS = frozenset(
    {
        "king",
        "queen",
        "prophet",
        "priest",
        "judge",
        "pharaoh",
        "caesar",
        "governor",
        "high priest",
        "scribe",
        "disciple",
        "apostle",
        "servant",
        "slave",
        "messenger",
        "angel",
    }
)
_PERSON_NAME_RE = re.compile(r"^[A-Z][A-Za-z'`\-]*(?:\s+[A-Z][A-Za-z'`\-]*)*$")


def _label_fold(label: str) -> str:
    return label.strip().casefold()


def _clean_entity_label(label: str) -> str:
    return " ".join((label or "").strip().split())


def _is_valid_person_label(label: str) -> bool:
    clean = _clean_entity_label(label)
    if not clean:
        return False
    lower = clean.casefold()
    if lower in _PERSON_GENERIC_LABELS:
        return False
    if lower in _PLACE_LIKE_NAMES:
        return False
    if lower in _TITLE_ONLY_PERSONS:
        return False
    if lower.startswith("the "):
        return False
    if clean.isupper() and len(clean) > 4:
        return False
    return bool(_PERSON_NAME_RE.match(clean))


def _is_valid_place_label(label: str) -> bool:
    clean = _clean_entity_label(label)
    if not clean:
        return False
    lower = clean.casefold()
    if lower in _PLACE_GENERIC_LABELS:
        return False
    if lower.startswith("the ") and " of " not in lower:
        return False
    # Keep specific named places like "Garden of Eden", "Promised Land", "Mount Zion".
    # Drop generic lowercase single-word place nouns like "river", "mountain", "land".
    return True


def _profile_api_fields(ent: dict[str, Any]) -> dict[str, Any]:
    """Map summary_entities.profile JSONB to optional overview / timeline for the API."""
    prof = ent.get("profile")
    if not isinstance(prof, dict):
        return {}
    out: dict[str, Any] = {}
    ov = prof.get("overview")
    if isinstance(ov, str) and ov.strip():
        out["overview"] = ov
    tl = prof.get("timeline")
    if isinstance(tl, dict):
        out["timeline"] = tl
    return out


def _dedupe_keep_order(labels: list[str]) -> list[str]:
    out: list[str] = []
    seen: set[str] = set()
    for raw in labels:
        clean = _clean_entity_label(raw)
        if not clean:
            continue
        folded = clean.casefold()
        if folded in seen:
            continue
        seen.add(folded)
        out.append(clean)
    return out


def _build_place_fallback_index() -> tuple[list[dict[str, Any]], dict[str, dict[str, Any]]]:
    """
    Build place entities directly from summary commentary text.
    Used when _PLACE_ENTITY_INDEXING_ENABLED is False (no place rows in summary_entities).
    """
    db = get_supabase()
    rows: list[dict[str, Any]] = []
    offset = 0
    while True:
        res = (
            db.table("commentaries")
            .select("id, book_number, chapter, content, source")
            .eq("source", SUMMARY_SOURCE)
            .range(offset, offset + _ENTITY_PAGE_SIZE - 1)
            .execute()
        )
        batch = res.data or []
        rows.extend(batch)
        if len(batch) < _ENTITY_PAGE_SIZE:
            break
        offset += _ENTITY_PAGE_SIZE

    by_slug: dict[str, dict[str, Any]] = {}
    for row in rows:
        cid = int(row["id"])
        bn = int(row["book_number"])
        ch = int(row["chapter"])
        book = BOOK_BY_NUMBER.get(bn)
        _, _, places = parse_summary_themes_people_places(row.get("content") or "")
        for label in places:
            slug = slugify_label(label)
            rec = by_slug.setdefault(
                slug,
                {"kind": "place", "slug": slug, "label": label, "references": []},
            )
            # keep first-seen canonical label but dedupe refs
            ref = {
                "commentary_id": cid,
                "book_number": bn,
                "book_name": book["name"] if book else str(bn),
                "chapter": ch,
            }
            rec["references"].append(ref)

    for rec in by_slug.values():
        refs = rec["references"]
        seen = set()
        deduped = []
        for r in refs:
            key = (r["commentary_id"], r["book_number"], r["chapter"])
            if key in seen:
                continue
            seen.add(key)
            deduped.append(r)
        deduped.sort(key=lambda x: (x["book_number"], x["chapter"]))
        rec["references"] = deduped

    items = sorted(
        [{"slug": v["slug"], "label": v["label"]} for v in by_slug.values()],
        key=lambda x: x["label"].casefold(),
    )
    return items, by_slug


def _fetch_all_summary_entities(admin: Any) -> list[dict[str, Any]]:
    """PostgREST defaults to max ~1000 rows; page until exhausted."""
    out: list[dict[str, Any]] = []
    offset = 0
    while True:
        res = (
            admin.table("summary_entities")
            .select("id, kind, slug, label")
            .range(offset, offset + _ENTITY_PAGE_SIZE - 1)
            .execute()
        )
        batch = res.data or []
        out.extend(batch)
        if len(batch) < _ENTITY_PAGE_SIZE:
            break
        offset += _ENTITY_PAGE_SIZE
    return out


@dataclass(frozen=True)
class SummaryRebuildStats:
    """Returned by rebuild helpers for logging and scripts."""

    commentary_ids_requested: int
    commentary_rows_loaded: int
    distinct_entity_labels: int
    new_entities_inserted: int
    mention_rows_written: int


def parse_summary_themes_people(content: str) -> tuple[list[str], list[str]]:
    """Match frontend parseSummaryContent: Themes / Key People lines, split on ' · '."""
    themes: list[str] = []
    people: list[str] = []
    for line in content.splitlines():
        if line.startswith("Themes:"):
            rest = line[len("Themes:") :].strip()
            if rest:
                themes = [s.strip() for s in rest.split(" · ") if s.strip()]
        elif line.startswith("Key People:"):
            rest = line[len("Key People:") :].strip()
            if rest:
                people = [s.strip() for s in rest.split(" · ") if s.strip()]
    return themes, people


def parse_summary_themes_people_places(content: str) -> tuple[list[str], list[str], list[str]]:
    """Parse Themes / Key People / Key Places lines from summary content."""
    themes: list[str] = []
    people: list[str] = []
    places: list[str] = []
    for line in content.splitlines():
        if line.startswith("Themes:"):
            rest = line[len("Themes:") :].strip()
            if rest:
                themes = [s.strip() for s in rest.split(" · ") if s.strip()]
        elif line.startswith("Key People:"):
            rest = line[len("Key People:") :].strip()
            if rest:
                people = [s.strip() for s in rest.split(" · ") if s.strip()]
        elif line.startswith("Key Places:"):
            rest = line[len("Key Places:") :].strip()
            if rest:
                places = [s.strip() for s in rest.split(" · ") if s.strip()]
    themes = _dedupe_keep_order(themes)
    people = _dedupe_keep_order([p for p in people if _is_valid_person_label(p)])
    places = _dedupe_keep_order([p for p in places if _is_valid_place_label(p)])
    return themes, people, places


def rebuild_mentions_for_commentary_ids(commentary_ids: list[int]) -> SummaryRebuildStats:
    """
    Rebuild commentary_entity_mentions for the given commentary rows (source = summary).

    Uses batched HTTP calls and in-memory maps so a full-Bible backfill is seconds—not tens of minutes.
    """
    if not commentary_ids:
        return SummaryRebuildStats(0, 0, 0, 0, 0)

    admin = get_supabase_admin()
    n_ids = len(commentary_ids)
    logger.info("rebuild mentions: start (%d commentary id(s))", n_ids)

    for i in range(0, len(commentary_ids), _ID_CHUNK):
        chunk = commentary_ids[i : i + _ID_CHUNK]
        admin.table("commentary_entity_mentions").delete().in_("commentary_id", chunk).execute()

    rows: list[dict[str, Any]] = []
    for i in range(0, len(commentary_ids), _ID_CHUNK):
        chunk = commentary_ids[i : i + _ID_CHUNK]
        res = (
            admin.table("commentaries")
            .select("id, content")
            .in_("id", chunk)
            .eq("source", SUMMARY_SOURCE)
            .execute()
        )
        rows.extend(res.data or [])

    if len(rows) != n_ids:
        logger.warning(
            "loaded %d commentary row(s) for %d id(s); missing ids may be wrong source or deleted",
            len(rows),
            n_ids,
        )

    ent_rows = _fetch_all_summary_entities(admin)
    logger.info("loaded %d summary_entities row(s) from DB", len(ent_rows))

    by_label: dict[tuple[str, str], tuple[int, str]] = {}
    by_fold: dict[tuple[str, str], tuple[int, str]] = {}
    slug_owner: dict[tuple[str, str], str] = {}
    for e in ent_rows:
        kind, label = str(e["kind"]), str(e["label"])
        eid_slug = (int(e["id"]), str(e["slug"]))
        by_label[(kind, label)] = eid_slug
        fold = _label_fold(label)
        prev = by_fold.get((kind, fold))
        if prev is not None and prev[0] != eid_slug[0]:
            logger.warning(
                "duplicate case-fold label for kind=%r: label=%r collides with earlier id=%s (keeping id=%s)",
                kind,
                label,
                eid_slug[0],
                prev[0],
            )
        else:
            by_fold[(kind, fold)] = eid_slug
        slug_owner[(kind, str(e["slug"]))] = label

    db_folds = frozenset(by_fold.keys())

    parsed: list[tuple[int, list[str], list[str], list[str]]] = []
    needed_labels: set[tuple[str, str]] = set()
    for row in rows:
        cid = int(row["id"])
        themes, people, places = parse_summary_themes_people_places(row.get("content") or "")
        parsed.append((cid, themes, people, places))
        for t in themes:
            needed_labels.add(("theme", t))
        for p in people:
            needed_labels.add(("person", p))
        if _PLACE_ENTITY_INDEXING_ENABLED:
            for pl in places:
                needed_labels.add(("place", pl))

    variants_by_fold: dict[tuple[str, str], set[str]] = defaultdict(set)
    for kind, label in needed_labels:
        variants_by_fold[(kind, _label_fold(label))].add(label)

    new_entities: list[dict[str, str]] = []
    for kind, fold in sorted(variants_by_fold.keys()):
        labs = sorted(variants_by_fold[(kind, fold)])
        if (kind, fold) in by_fold:
            pair = by_fold[(kind, fold)]
            for lab in labs:
                by_label[(kind, lab)] = pair
            continue
        canonical = min(labs)
        base = slugify_label(canonical)
        slug = base
        n = 2
        while (kind, slug) in slug_owner and _label_fold(slug_owner[(kind, slug)]) != fold:
            slug = f"{base}-{n}"
            n += 1
        slug_owner[(kind, slug)] = canonical
        new_entities.append({"kind": kind, "slug": slug, "label": canonical})

    logger.info(
        "entities: %d tag occurrence(s), %d (kind,case-fold) bucket(s), %d bucket(s) matched DB, %d new row(s)",
        len(needed_labels),
        len(variants_by_fold),
        len(db_folds & frozenset(variants_by_fold.keys())),
        len(new_entities),
    )

    for i in range(0, len(new_entities), _ENTITY_INSERT_BATCH):
        batch = new_entities[i : i + _ENTITY_INSERT_BATCH]
        if not batch:
            continue
        ins = admin.table("summary_entities").insert(batch).execute()
        inserted = ins.data or []
        if len(inserted) >= len(batch):
            for e in inserted:
                k, lab = str(e["kind"]), str(e["label"])
                pair = (int(e["id"]), str(e["slug"]))
                fold = _label_fold(lab)
                for variant in variants_by_fold[(k, fold)]:
                    by_label[(k, variant)] = pair
                by_fold[(k, fold)] = pair
        else:
            logger.warning(
                "entity insert returned %d row(s) for batch of %d; fetching ids via select",
                len(inserted),
                len(batch),
            )
            for row in batch:
                res = (
                    admin.table("summary_entities")
                    .select("id, slug")
                    .eq("kind", row["kind"])
                    .eq("label", row["label"])
                    .limit(1)
                    .execute()
                )
                got = res.data or []
                if not got:
                    raise RuntimeError(
                        f"Failed to resolve summary_entities row after insert: kind={row['kind']!r} label={row['label']!r}"
                    )
                pair = (int(got[0]["id"]), str(got[0]["slug"]))
                k, lab = row["kind"], row["label"]
                fold = _label_fold(lab)
                for variant in variants_by_fold[(k, fold)]:
                    by_label[(k, variant)] = pair
                by_fold[(k, fold)] = pair

    # PK (commentary_id, entity_id): collapse duplicate labels in the same chapter.
    mention_rows: list[dict[str, int]] = []
    for cid, themes, people, places in parsed:
        seen_eid: set[int] = set()
        order = 0
        for label in themes:
            key = ("theme", label)
            if key not in by_label:
                logger.error("missing theme entity for commentary_id=%s label=%r", cid, label)
                raise KeyError(key)
            eid = by_label[key][0]
            if eid in seen_eid:
                continue
            seen_eid.add(eid)
            mention_rows.append({"commentary_id": cid, "entity_id": eid, "sort_order": order})
            order += 1
        order = 0
        for label in people:
            key = ("person", label)
            if key not in by_label:
                logger.error("missing person entity for commentary_id=%s label=%r", cid, label)
                raise KeyError(key)
            eid = by_label[key][0]
            if eid in seen_eid:
                continue
            seen_eid.add(eid)
            mention_rows.append({"commentary_id": cid, "entity_id": eid, "sort_order": order})
            order += 1
        if _PLACE_ENTITY_INDEXING_ENABLED:
            order = 0
            for label in places:
                key = ("place", label)
                if key not in by_label:
                    logger.error("missing place entity for commentary_id=%s label=%r", cid, label)
                    raise KeyError(key)
                eid = by_label[key][0]
                if eid in seen_eid:
                    continue
                seen_eid.add(eid)
                mention_rows.append({"commentary_id": cid, "entity_id": eid, "sort_order": order})
                order += 1

    for i in range(0, len(mention_rows), _MENTION_INSERT_BATCH):
        batch = mention_rows[i : i + _MENTION_INSERT_BATCH]
        if batch:
            admin.table("commentary_entity_mentions").insert(batch).execute()

    stats = SummaryRebuildStats(
        commentary_ids_requested=n_ids,
        commentary_rows_loaded=len(rows),
        distinct_entity_labels=len(needed_labels),
        new_entities_inserted=len(new_entities),
        mention_rows_written=len(mention_rows),
    )
    logger.info(
        "rebuild mentions: done (%d mention row(s) written)",
        stats.mention_rows_written,
    )
    return stats


def _fetch_all_summary_commentary_ids(admin: Any) -> list[int]:
    """Page through commentaries so we do not stop at PostgREST's default row cap (~1000)."""
    ids: list[int] = []
    offset = 0
    while True:
        res = (
            admin.table("commentaries")
            .select("id")
            .eq("source", SUMMARY_SOURCE)
            .range(offset, offset + _ENTITY_PAGE_SIZE - 1)
            .execute()
        )
        batch = res.data or []
        ids.extend(int(r["id"]) for r in batch)
        if len(batch) < _ENTITY_PAGE_SIZE:
            break
        offset += _ENTITY_PAGE_SIZE
    return ids


def rebuild_all_summary_mentions() -> SummaryRebuildStats:
    """Rebuild mentions for every summary commentary row."""
    admin = get_supabase_admin()
    ids = _fetch_all_summary_commentary_ids(admin)
    if not ids:
        logger.warning("no commentaries with source=%r — nothing to index", SUMMARY_SOURCE)
        return SummaryRebuildStats(0, 0, 0, 0, 0)
    return rebuild_mentions_for_commentary_ids(ids)


def fetch_tags_for_commentary_ids(commentary_ids: list[int]) -> dict[int, dict[str, list[dict[str, str]]]]:
    """
    Returns map commentary_id -> { "theme_tags": [{slug, label}], "people_tags": [...] }.
    """
    if not commentary_ids:
        return {}
    db = get_supabase()
    mres = (
        db.table("commentary_entity_mentions")
        .select("commentary_id, entity_id, sort_order")
        .in_("commentary_id", commentary_ids)
        .execute()
    )
    rows = mres.data or []
    if not rows:
        return {cid: {"theme_tags": [], "people_tags": []} for cid in commentary_ids}

    entity_ids = list({int(r["entity_id"]) for r in rows})
    eres = db.table("summary_entities").select("id, kind, slug, label").in_("id", entity_ids).execute()
    ent_map = {int(e["id"]): e for e in (eres.data or [])}

    by_cid: dict[int, list[tuple[int, dict[str, str]]]] = {cid: [] for cid in commentary_ids}
    for r in rows:
        cid = int(r["commentary_id"])
        eid = int(r["entity_id"])
        ent = ent_map.get(eid)
        if not ent:
            continue
        kind = str(ent.get("kind") or "")
        tag = {"slug": str(ent["slug"]), "label": str(ent["label"])}
        by_cid.setdefault(cid, []).append((int(r.get("sort_order") or 0), kind, tag))

    out: dict[int, dict[str, list[dict[str, str]]]] = {}
    for cid in commentary_ids:
        triples = by_cid.get(cid, [])
        themes = sorted([t for t in triples if t[1] == "theme"], key=lambda x: x[0])
        people = sorted([t for t in triples if t[1] == "person"], key=lambda x: x[0])
        places = sorted([t for t in triples if t[1] == "place"], key=lambda x: x[0])
        out[cid] = {
            "theme_tags": [t[2] for t in themes],
            "people_tags": [t[2] for t in people],
            "place_tags": [t[2] for t in places],
        }
    return out


def list_summary_entities(kind: str) -> list[dict[str, Any]]:
    """Return all summary entities of the given kind, sorted alphabetically by label."""
    if kind not in ("theme", "person", "place"):
        return []
    if kind == "place" and not _PLACE_ENTITY_INDEXING_ENABLED:
        items, _ = _build_place_fallback_index()
        return items
    db = get_supabase()
    res = (
        db.table("summary_entities")
        .select("id, kind, slug, label")
        .eq("kind", kind)
        .order("label")
        .execute()
    )
    rows = res.data or []
    if kind == "person":
        return [r for r in rows if _is_valid_person_label(str(r.get("label") or ""))]
    if kind == "place":
        return [r for r in rows if _is_valid_place_label(str(r.get("label") or ""))]
    return rows


def get_summary_entity_page(kind: str, slug: str) -> dict[str, Any] | None:
    """kind is 'theme', 'person', or 'place'. Returns entity + references (book, chapter, commentary id)."""
    if kind not in ("theme", "person", "place"):
        return None
    if kind == "place" and not _PLACE_ENTITY_INDEXING_ENABLED:
        _, index = _build_place_fallback_index()
        return index.get(slug)
    db = get_supabase()
    # One round trip: entity row + mentions + joined commentaries (filter summary source in Python).
    eres = (
        db.table("summary_entities")
        .select(
            "id, kind, slug, label, profile, "
            "commentary_entity_mentions(commentary_id, commentaries(id, book_number, chapter, source))"
        )
        .eq("kind", kind)
        .eq("slug", slug)
        .limit(1)
        .execute()
    )
    ents = eres.data or []
    if not ents:
        return None
    ent = ents[0]

    references: list[dict[str, Any]] = []
    seen_cid: set[int] = set()
    for mrow in ent.get("commentary_entity_mentions") or []:
        comm = mrow.get("commentaries")
        if not isinstance(comm, dict):
            continue
        if str(comm.get("source") or "") != SUMMARY_SOURCE:
            continue
        cid = int(comm["id"])
        if cid in seen_cid:
            continue
        seen_cid.add(cid)
        bn = int(comm["book_number"])
        ch = int(comm["chapter"])
        book = BOOK_BY_NUMBER.get(bn)
        references.append(
            {
                "commentary_id": cid,
                "book_number": bn,
                "book_name": book["name"] if book else str(bn),
                "chapter": ch,
            }
        )

    references.sort(key=lambda x: (x["book_number"], x["chapter"]))
    return {
        "kind": ent["kind"],
        "slug": ent["slug"],
        "label": ent["label"],
        "references": references,
        **_profile_api_fields(ent),
    }
