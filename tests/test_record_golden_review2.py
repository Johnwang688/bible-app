"""Regression tests from the verifier re-check (W0.2). Owned by the orchestrator: do not edit."""

from unittest.mock import MagicMock

import pytest
import scripts.record_golden as recorder
from tests.test_record_golden_review import recorder_io


@pytest.mark.parametrize("before,after", [
    ([1], [1, 2]),
    ([1, 2], [1]),
])
def test_rejects_list_length_instability(
    monkeypatch, recorder_io, before, after
):
    directory, opened = recorder_io
    monkeypatch.setattr(
        recorder,
        "run_once",
        MagicMock(side_effect=[
            (200, {"items": before}),
            (200, {"items": after}),
        ]),
    )

    assert recorder.main([]) == 1, "List length changes must be unstable"
    opened.assert_not_called()
    directory.mkdir.assert_not_called()
    directory.glob.assert_not_called()
