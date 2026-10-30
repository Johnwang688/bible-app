"""Regression tests from the verifier review (W0.2). Owned by the orchestrator: do not edit."""

import io
from unittest.mock import MagicMock

import pytest
import scripts.record_golden as recorder


@pytest.fixture
def recorder_io(monkeypatch):
    directory = MagicMock()
    directory.glob.return_value = []
    opened = MagicMock(side_effect=lambda *a, **kw: io.StringIO())
    monkeypatch.setattr(recorder, "FIXTURES_DIR", directory)
    monkeypatch.setattr(recorder, "TestClient", MagicMock())
    monkeypatch.setattr(recorder, "open", opened, raising=False)
    entry = {"name": "sample", "method": "GET", "path": "/sample"}
    monkeypatch.setattr(recorder, "REQUESTS", [entry])
    return directory, opened


@pytest.mark.parametrize("after", [1.0, True, {"nested": [1.0]}])
def test_rejects_json_type_instability(monkeypatch, recorder_io, after):
    before = {"nested": [1]} if isinstance(after, dict) else 1
    replay = MagicMock(side_effect=[
        (200, {"value": before}),
        (200, {"value": after}),
    ])
    monkeypatch.setattr(recorder, "run_once", replay)

    assert recorder.main([]) == 1, "JSON type changes must be unstable"

    directory, opened = recorder_io
    opened.assert_not_called()
    directory.mkdir.assert_not_called()
    directory.glob.assert_not_called()


def test_replays_selection_twice(monkeypatch, recorder_io):
    replay = MagicMock(return_value=(200, {"value": 1}))
    monkeypatch.setattr(recorder, "run_once", replay)

    assert recorder.main(["--only", "sample"]) == 0
    assert [call.args[1]["name"] for call in replay.call_args_list] == [
        "sample", "sample"
    ]
