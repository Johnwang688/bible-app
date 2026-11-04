"""Rebuild people and places from the curated lists; leave themes and kept lines intact.

Standard library only. All validation finishes before any source file is written.
"""

from __future__ import annotations

import argparse
from collections import Counter
import gzip
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
CREATED_AT = "2026-11-04T00:00:00+00:00"
ENTITIES = "summary_entities.jsonl"
MENTIONS = "commentary_entity_mentions.jsonl"


class RebuildFailed(ValueError):
    """Invalid input: no files have been written."""


def _json_line(row: dict) -> bytes:
    return (json.dumps(row, sort_keys=True, ensure_ascii=False, separators=(",", ":")) + "\n").encode("utf-8")


def _lines(data: bytes) -> list[tuple[dict, bytes]]:
    return [(json.loads(line), line) for line in data.splitlines(keepends=True) if line.strip()]


def _curated(path: Path, kind: str) -> dict[str, dict]:
    entries = json.loads(path.read_bytes())
    if not isinstance(entries, list):
        raise RebuildFailed(f"{path}: expected a list")
    result = {}
    for entry in entries:
        if not isinstance(entry, dict):
            raise RebuildFailed(f"{path}: expected an entry object")
        slug = entry.get("slug")
        if not isinstance(slug, str) or not slug.strip():
            raise RebuildFailed(f"{path}: missing slug")
        if slug in result:
            raise RebuildFailed(f"{path}: duplicate slug {slug!r}")
        if entry.get("kind") != kind:
            raise RebuildFailed(f"{path}: {slug}: expected kind {kind!r}")
        for field in ("label", "overview"):
            if not isinstance(entry.get(field), str) or not entry[field].strip():
                raise RebuildFailed(f"{path}: {slug}: empty {field}")
        if not isinstance(entry.get("timeline"), dict):
            raise RebuildFailed(f"{path}: {slug}: missing timeline object")
        result[slug] = entry
    return result


def rebuild(source: Path, people: Path, places: Path) -> dict:
    curated = {"person": _curated(people, "person"), "place": _curated(places, "place")}
    manifest_path = source / "MANIFEST.json"
    manifest_bytes = manifest_path.read_bytes()
    manifest = json.loads(manifest_bytes)
    dump_manifest = lambda m: (json.dumps(m, indent=2, sort_keys=True, ensure_ascii=False) + "\n").encode("utf-8")
    if dump_manifest(manifest) != manifest_bytes:
        raise RebuildFailed("MANIFEST.json: not in the canonical format")

    original = {name: (source / name).read_bytes() for name in (ENTITIES, MENTIONS)}
    entities = _lines(original[ENTITIES])
    by_id = {}
    by_key = {}
    for row, _ in entities:
        key = (row["kind"], row["slug"])
        if row["id"] in by_id or key in by_key:
            raise RebuildFailed(f"duplicate entity id or kind/slug: {key}")
        by_id[row["id"]] = row
        by_key[key] = row

    dropped_rows = Counter()
    kept = []
    for row, raw in entities:
        kind, slug = row["kind"], row["slug"]
        if kind == "theme":
            kept.append((row, raw))
        elif kind in curated:
            if slug not in curated[kind]:
                dropped_rows[kind] += 1
                continue
            profile = {field: curated[kind][slug][field] for field in ("overview", "timeline")}
            if row.get("profile") != profile:
                row = {**row, "profile": profile}
                raw = _json_line(row)
            kept.append((row, raw))
        else:
            raise RebuildFailed(f"unknown entity kind: {kind!r}")

    next_id = max(by_id, default=0) + 1
    new_entries = sorted(
        (slug, kind) for kind, entries in curated.items() for slug in entries
        if (kind, slug) not in by_key
    )
    for slug, kind in new_entries:
        entry = curated[kind][slug]
        row = {"id": next_id, "kind": kind, "slug": slug, "label": entry["label"],
               "created_at": CREATED_AT,
               "profile": {field: entry[field] for field in ("overview", "timeline")}}
        kept.append((row, _json_line(row)))
        next_id += 1

    ids = {row["id"] for row, _ in kept}
    for kind, entries in curated.items():
        actual = [row["slug"] for row, _ in kept if row["kind"] == kind]
        if len(actual) != len(entries) or set(actual) != set(entries):
            raise RebuildFailed(f"{kind}: curated count or slugs do not match")

    # Read every commentary shard, as the content builder does.
    commentary_ids = set()
    for name, info in manifest["files"].items():
        if info["table"] == "commentaries":
            data = (source / name).read_bytes()
            if name.endswith(".gz"):
                data = gzip.decompress(data)
            commentary_ids.update(row["id"] for row, _ in _lines(data))

    dropped_mentions = Counter()
    mentions = []
    mentioned_ids = set()
    for row, raw in _lines(original[MENTIONS]):
        eid = row["entity_id"]
        if eid not in ids:
            dropped_mentions[by_id[eid]["kind"] if eid in by_id else "missing"] += 1
            continue
        if row["commentary_id"] not in commentary_ids:
            raise RebuildFailed(f"mention references missing commentary id {row['commentary_id']}")
        mentions.append(raw)
        mentioned_ids.add(eid)

    no_mentions = {kind: sorted(row["slug"] for row, _ in kept
                               if row["kind"] == kind and row["id"] not in mentioned_ids)
                   for kind in curated}
    outputs = {ENTITIES: b"".join(raw for _, raw in kept), MENTIONS: b"".join(mentions)}
    for name, count in ((ENTITIES, len(kept)), (MENTIONS, len(mentions))):
        table = name.removesuffix(".jsonl")
        manifest["files"][name] = {"rows": count, "sha256": hashlib.sha256(outputs[name]).hexdigest(), "table": table}
        manifest["tables"][table] = count
    outputs["MANIFEST.json"] = dump_manifest(manifest)

    # Every check passed. Avoid even rewriting an unchanged file on a second run.
    for name, data in outputs.items():
        previous = manifest_bytes if name == "MANIFEST.json" else original[name]
        if data != previous:
            (source / name).write_bytes(data)
    return {"counts": dict(Counter(row["kind"] for row, _ in kept)),
            "mentions": len(mentions), "rows_dropped": dict(dropped_rows),
            "mentions_dropped": dict(dropped_mentions), "no_mentions": no_mentions}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=ROOT / "content/source")
    parser.add_argument("--people", type=Path, default=ROOT / "people/people.json")
    parser.add_argument("--places", type=Path, default=ROOT / "places/places.json")
    args = parser.parse_args()
    try:
        stats = rebuild(args.source, args.people, args.places)
    except (RebuildFailed, OSError, ValueError, KeyError, TypeError) as exc:
        print(f"Entity rebuild failed: {exc}", file=sys.stderr)
        return 1
    print("Entity counts: " + ", ".join(f"{kind}={stats['counts'].get(kind, 0)}" for kind in ("person", "place", "theme")))
    print(f"Mentions retained: {stats['mentions']}")
    for kind in ("person", "place", "theme", "missing"):
        if kind != "missing":
            print(f"Rows dropped ({kind}): {stats['rows_dropped'].get(kind, 0)}")
        print(f"Mentions dropped ({kind}): {stats['mentions_dropped'].get(kind, 0)}")
    for kind, slugs in stats["no_mentions"].items():
        print(f"Curated {kind} entries with no mentions ({len(slugs)}): " + (", ".join(slugs) or "none"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
