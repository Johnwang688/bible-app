"""Acceptance tests for scripts/export_supabase.py (W0.1). Owned by the orchestrator: do not edit."""

from __future__ import annotations

import hashlib
import json
from types import SimpleNamespace

import pytest

from scripts.export_supabase import (
    ExportCountMismatch,
    ExportDuplicateKey,
    ExportError,
    clean_row,
    fetch_all_rows,
    write_jsonl,
)


class FakeQuery:
    """Mimics the supabase-py chain: table().select("*", count="exact").order(...).range(a, b).execute()."""

    def __init__(self, rows: list[dict], reported_count: int | None, calls: list):
        self._rows = rows
        self._reported_count = reported_count
        self._order: list[str] = []
        self._range: tuple[int, int] | None = None
        self._calls = calls

    def select(self, *_args, count=None, **_kwargs):
        self._count_mode = count
        return self

    def order(self, column, desc=False, **_kwargs):
        self._order.append(column)
        return self

    def range(self, start, end):
        self._range = (start, end)
        return self

    def execute(self):
        rows = sorted(self._rows, key=lambda r: tuple(r[c] for c in self._order)) if self._order else list(self._rows)
        start, end = self._range if self._range else (0, len(rows) - 1)
        self._calls.append((start, end))
        count = self._reported_count if self._reported_count is not None else len(self._rows)
        return SimpleNamespace(data=rows[start : end + 1], count=count)


class FakeClient:
    def __init__(self, tables: dict[str, list[dict]], reported_counts: dict[str, int] | None = None):
        self.tables = tables
        self.reported_counts = reported_counts or {}
        self.calls: list = []

    def table(self, name):
        return FakeQuery(self.tables[name], self.reported_counts.get(name), self.calls)


def _rows(n: int) -> list[dict]:
    # Deliberately shuffled insert order so the export must sort.
    return [{"id": i, "text": f"row {i}"} for i in reversed(range(1, n + 1))]


@pytest.mark.parametrize("n", [0, 1, 999, 1000, 1001, 2000, 2500])
def test_fetch_all_rows_returns_every_row_once_sorted(n):
    client = FakeClient({"t": _rows(n)})
    rows = fetch_all_rows(client, "t", order_by=("id",), page_size=1000)
    assert [r["id"] for r in rows] == list(range(1, n + 1))


def test_fetch_all_rows_pages_by_page_size():
    client = FakeClient({"t": _rows(2500)})
    fetch_all_rows(client, "t", order_by=("id",), page_size=1000)
    assert client.calls[:3] == [(0, 999), (1000, 1999), (2000, 2999)]


def test_composite_key_sorted_and_complete():
    rows = [{"a": a, "b": b} for a in (3, 1, 2) for b in (2, 1)]
    client = FakeClient({"t": rows})
    out = fetch_all_rows(client, "t", order_by=("a", "b"), page_size=4)
    assert [(r["a"], r["b"]) for r in out] == [(1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2)]


def test_count_mismatch_raises():
    client = FakeClient({"t": _rows(4)}, reported_counts={"t": 5})
    with pytest.raises(ExportCountMismatch):
        fetch_all_rows(client, "t", order_by=("id",), page_size=1000)


def test_duplicate_key_raises():
    rows = [{"id": 1}, {"id": 1}, {"id": 2}]
    client = FakeClient({"t": rows})
    with pytest.raises(ExportDuplicateKey):
        fetch_all_rows(client, "t", order_by=("id",), page_size=1000)


def test_error_hierarchy():
    assert issubclass(ExportCountMismatch, ExportError)
    assert issubclass(ExportDuplicateKey, ExportError)


def test_clean_row_drops_generated_search_columns():
    row = {"id": 1, "text": "x", "text_search": "'x':1", "content_search": "'y':1"}
    assert clean_row(row) == {"id": 1, "text": "x"}


def test_write_jsonl_format_and_hash(tmp_path):
    path = tmp_path / "sub" / "out.jsonl"
    rows = [{"b": 2, "a": "神爱世人"}, {"a": "x", "b": None}]
    digest = write_jsonl(path, rows)
    data = path.read_bytes()
    assert digest == hashlib.sha256(data).hexdigest()
    assert b"\r\n" not in data
    lines = data.decode("utf-8").splitlines()
    assert lines == [
        json.dumps({"a": "神爱世人", "b": 2}, ensure_ascii=False, sort_keys=True, separators=(",", ":")),
        json.dumps({"a": "x", "b": None}, ensure_ascii=False, sort_keys=True, separators=(",", ":")),
    ]
    assert data.endswith(b"\n")


def test_write_jsonl_is_deterministic(tmp_path):
    rows = [{"id": i, "v": "é"} for i in range(50)]
    assert write_jsonl(tmp_path / "a.jsonl", rows) == write_jsonl(tmp_path / "b.jsonl", rows)
