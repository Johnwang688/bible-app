"""Image test from the verifier review (Docker fix). Owned by the orchestrator: do not edit.

Builds the backend image and serves content from a read-only container. Skipped unless a Docker
daemon is reachable (it takes a few minutes).
"""

import shutil
import subprocess as _sp

import pytest


def _docker_up() -> bool:
    if not shutil.which("docker"):
        return False
    try:
        return _sp.run(["docker", "info"], capture_output=True, timeout=20).returncode == 0
    except Exception:
        return False


pytestmark = pytest.mark.skipif(not _docker_up(), reason="needs a running Docker daemon")

from pathlib import Path
import subprocess
import uuid


def test_image_serves_content_with_read_only_filesystem():
    repo = Path(__file__).resolve().parents[2]
    tag = f"bible-content-review:{uuid.uuid4().hex}"

    def run(*args):
        result = subprocess.run(
            args, cwd=repo, text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            timeout=900,
        )
        assert result.returncode == 0, result.stdout

    smoke = r"""
from pathlib import Path
import sqlite3
from fastapi.testclient import TestClient
from app.core.content_db import fetch_all
from app.main import app

db = Path("/app/build/content.sqlite")
assert db.is_file()
assert not Path("/app/content/source").exists()

with TestClient(app, raise_server_exceptions=False) as client:
    for url in (
        "/api/v1/translations",
        "/api/v1/chapters/John/3",
        "/api/v1/verses/John/3/16?translation=CUV",
        "/api/v1/summary-entities/person/abraham",
    ):
        response = client.get(url)
        assert response.status_code == 200, (url, response.text)
        assert response.json()

    response = client.post(
        "/api/v1/search",
        json={"query": "love", "translation": "WEB", "limit": 5},
    )
    assert response.status_code == 200, response.text
    assert response.json()

try:
    fetch_all("DELETE FROM books")
except sqlite3.OperationalError as error:
    assert "readonly" in str(error).lower()
else:
    raise AssertionError("Content database allowed writes")

for suffix in ("-journal", "-wal", "-shm"):
    assert not Path(str(db) + suffix).exists()
"""

    try:
        run("docker", "build", "-t", tag, ".")
        run(
            "docker", "run", "--rm", "--read-only",
            "--network=none", "--entrypoint", "python",
            tag, "-B", "-c", smoke,
        )
    finally:
        subprocess.run(
            ["docker", "image", "rm", tag],
            cwd=repo, capture_output=True, timeout=60,
        )
