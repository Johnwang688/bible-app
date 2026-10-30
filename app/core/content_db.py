"""Read-only access to the content SQLite file built by scripts/build_content.py.

One connection per thread. The file is opened immutable, so writes fail and no locks are taken.
"""

from __future__ import annotations

import json
import sqlite3
import threading
from pathlib import Path
from typing import Any

from app.core.config import get_settings

_REPO_ROOT = Path(__file__).resolve().parents[2]
_JSON_COLUMNS = frozenset({"choices_json", "profile"})

_local = threading.local()


def _db_path() -> Path:
    path = Path(get_settings().content_db_path)
    return path if path.is_absolute() else _REPO_ROOT / path


def _row_factory(cursor: sqlite3.Cursor, row: tuple) -> dict[str, Any]:
    out: dict[str, Any] = {}
    for column, value in zip(cursor.description, row):
        name = column[0]
        if value is not None and name in _JSON_COLUMNS:
            value = json.loads(value)
        out[name] = value
    return out


def _connection() -> sqlite3.Connection:
    path = _db_path()
    con = getattr(_local, "con", None)
    if con is not None and getattr(_local, "path", None) == path:
        return con
    if not path.is_file():
        raise RuntimeError(
            f"Content database not found at {path}. Build it with: python scripts/build_content.py"
        )
    if con is not None:
        con.close()
    con = sqlite3.connect(f"file:{path.as_posix()}?mode=ro&immutable=1", uri=True, check_same_thread=False)
    con.row_factory = _row_factory
    _local.con = con
    _local.path = path
    return con


def fetch_all(sql: str, params: tuple | dict = ()) -> list[dict[str, Any]]:
    return _connection().execute(sql, params).fetchall()


def fetch_one(sql: str, params: tuple | dict = ()) -> dict[str, Any] | None:
    return _connection().execute(sql, params).fetchone()
