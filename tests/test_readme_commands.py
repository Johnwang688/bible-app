"""README must not point at scripts that do not exist (from the README review). Owned by the orchestrator."""

import re
from pathlib import Path


def test_readme_python_scripts_exist():
    root = Path(__file__).resolve().parents[1]
    text = (root / "README.md").read_text(encoding="utf-8")
    scripts = set(re.findall(r"\bpython\s+([\w./-]+\.py)\b", text)) | set(re.findall(r"`(scripts/[\w./-]+\.py)`", text))
    missing = sorted(p for p in scripts if not (root / p).is_file())
    assert not missing, f"README references missing scripts: {missing}"
