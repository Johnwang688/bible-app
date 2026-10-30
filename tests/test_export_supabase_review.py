"""Regression tests from the verifier review (W0.1). Owned by the orchestrator: do not edit."""

import json
import os

import pytest
from scripts import export_supabase as export


def test_case_colliding_translation_ids_fail_loudly(tmp_path, monkeypatch, capsys):
    """Translation ids that differ only by case would share a file on Windows/macOS: refuse."""
    tables = {table: [] for table, _ in export.CONTENT_TABLES}
    tables["translations"] = [{"id": "WEB"}, {"id": "web"}]
    tables["verses"] = [
        {"id": 1, "translation": "WEB"},
        {"id": 2, "translation": "web"},
    ]
    monkeypatch.setattr(export, "_admin_client", lambda: object())
    monkeypatch.setattr(export, "_project_ref", lambda: "review")
    monkeypatch.setattr(export, "fetch_all_rows", lambda client, table, order_by: tables[table])

    assert export.main(["--content-only", "--out-root", str(tmp_path)]) == 1
    err = capsys.readouterr().err
    assert "WEB" in err and "web" in err
    assert not (tmp_path / "content" / "source" / "MANIFEST.json").exists()


import httpx
from postgrest import SyncPostgrestClient
from scripts import export_supabase as export


def test_real_postgrest_ordering():
    rows = [{"a": 1, "b": 1}, {"a": 1, "b": 2}, {"a": 2, "b": 1}]
    offsets = []

    def respond(request):
        params = request.url.params
        assert params.get_list("select") == ["*"]
        assert params.get_list("order") == ["a,b"]
        assert params.get_list("limit") == ["2"]
        assert "count=exact" in request.headers["prefer"]

        offset = int(params["offset"])
        offsets.append(offset)
        page = rows[offset:offset + 2]
        count = 3 if offset == 0 else 99
        return httpx.Response(
            200,
            json=page,
            headers={
                "Content-Range":
                    f"{offset}-{offset + len(page) - 1}/{count}"
            },
        )

    client = SyncPostgrestClient("https://review.invalid/rest/v1")
    client.session.close()
    client.session = httpx.Client(
        base_url="https://review.invalid/rest/v1/",
        transport=httpx.MockTransport(respond),
    )
    try:
        assert export.fetch_all_rows(
            client, "t", ("a", "b"), page_size=2
        ) == rows
    finally:
        client.session.close()

    assert offsets == [0, 2]
