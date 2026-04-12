#!/usr/bin/env python3
"""Start the FastAPI backend and Next.js frontend together (cross-platform).

Backend: uvicorn on port 8000 (same as start.ps1 / start.sh).
Frontend: npm run dev in frontend-next (port 3000).
"""

from __future__ import annotations

import os
import shutil
import signal
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent
FRONTEND_DIR = ROOT / "frontend-next"


def _merge_root_dotenv(env: dict[str, str]) -> None:
    """Expose repo-root .env to the Next.js child when missing (e.g. BACKEND_URL)."""
    path = ROOT / ".env"
    if not path.is_file():
        return
    try:
        raw = path.read_text(encoding="utf-8")
    except OSError:
        return
    for line in raw.splitlines():
        s = line.strip()
        if not s or s.startswith("#") or "=" not in s:
            continue
        key, _, val = s.partition("=")
        key = key.strip()
        if not key or key in env:
            continue
        val = val.strip()
        if len(val) >= 2 and val[0] == val[-1] and val[0] in "\"'":
            val = val[1:-1]
        env[key] = val


def _resolve_venv_python(root: Path) -> Path | None:
    """Project .venv interpreter if it exists (same deps as `pip install -r requirements.txt`)."""
    if sys.platform == "win32":
        exe = root / ".venv" / "Scripts" / "python.exe"
        return exe if exe.is_file() else None
    for name in ("python3", "python"):
        exe = root / ".venv" / "bin" / name
        if exe.is_file():
            return exe
    return None


def _backend_python() -> Path:
    venv_py = _resolve_venv_python(ROOT)
    return venv_py if venv_py is not None else Path(sys.executable)


def _resolve_npm() -> str:
    """Windows: subprocess needs a real executable; `npm` is usually npm.cmd."""
    for name in ("npm", "npm.cmd"):
        path = shutil.which(name)
        if path:
            return path
    raise FileNotFoundError(
        "npm not found on PATH. Install Node.js or use a terminal where `npm` works."
    )


def _terminate_process(proc: subprocess.Popen) -> None:
    if proc.poll() is not None:
        return
    proc.terminate()
    try:
        proc.wait(timeout=8)
    except subprocess.TimeoutExpired:
        if sys.platform == "win32":
            subprocess.run(
                ["taskkill", "/F", "/T", "/PID", str(proc.pid)],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0),
                check=False,
            )
        else:
            proc.kill()
            proc.wait(timeout=3)


def main() -> int:
    if not FRONTEND_DIR.is_dir():
        print(f"Missing frontend directory: {FRONTEND_DIR}", file=sys.stderr)
        return 1

    os.chdir(ROOT)
    env = os.environ.copy()
    _merge_root_dotenv(env)

    try:
        npm = _resolve_npm()
    except FileNotFoundError as e:
        print(str(e), file=sys.stderr)
        return 1

    py = _backend_python()
    print("Starting backend (port 8000)...")
    backend = subprocess.Popen(
        [str(py), "-m", "uvicorn", "app.main:app", "--reload"],
        cwd=ROOT,
        env=env,
    )

    print("Starting frontend (port 3000)...")
    try:
        frontend = subprocess.Popen(
            [npm, "run", "dev"],
            cwd=FRONTEND_DIR,
            env=env,
        )
    except OSError:
        _terminate_process(backend)
        raise

    procs: list[tuple[str, subprocess.Popen]] = [
        ("backend", backend),
        ("frontend", frontend),
    ]

    shutting_down = False

    def shutdown(_signum: int | None = None, _frame: object | None = None) -> None:
        nonlocal shutting_down
        if shutting_down:
            return
        shutting_down = True
        print("\nShutting down...")
        for _name, p in procs:
            _terminate_process(p)
        sys.exit(0)

    if sys.platform != "win32":
        signal.signal(signal.SIGINT, shutdown)
        signal.signal(signal.SIGTERM, shutdown)

    print("")
    print(f"Backend PID: {backend.pid}")
    print(f"Frontend PID: {frontend.pid}")
    print("Press Ctrl+C to stop both.")
    print("")

    try:
        while True:
            for name, p in procs:
                code = p.poll()
                if code is not None:
                    print(f"{name} exited with code {code}")
                    shutdown()
                    return 0
            time.sleep(0.25)
    except KeyboardInterrupt:
        shutdown()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
