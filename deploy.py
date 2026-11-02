#!/usr/bin/env python3
"""
Build the FastAPI backend with Cloud Build and deploy it to Cloud Run (`bible-api`, us-central1).

Usage (from the repo root; see deploy/README.md for the one-time setup):
  python deploy.py --sync-secrets   # copy the secret values in .env into Secret Manager
  python deploy.py                  # build the image from this checkout, then deploy it
  python deploy.py --dry-run        # print the gcloud commands only
  python deploy.py --image <ref>    # redeploy an image that is already in Artifact Registry

Requires an authenticated `gcloud` CLI (on Windows, set GCLOUD_PATH if it is not on PATH).
Every command passes --project explicitly; the global gcloud config is never changed.

Override defaults with flags or env: DEPLOY_PROJECT, DEPLOY_REGION, DEPLOY_CORS_ORIGINS.
"""

from __future__ import annotations

import argparse
import base64
import ipaddress
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
from pathlib import Path
from typing import Callable
from urllib.parse import urlsplit

DEFAULT_PROJECT = "bible-app-492520"
# Co-located with Firestore (us-central1). Not the gcloud default region.
DEFAULT_REGION = "us-central1"
SERVICE = "bible-api"
REPOSITORY = "bible-app"
SERVICE_ACCOUNT_NAME = "bible-api"

# Browser origins allowed to call the API (the backend sends credentials-enabled CORS, so never "*").
# Expo web dev server (8081) plus the Firebase Hosting domains of this project, the planned web host.
DEFAULT_CORS_ORIGINS = (
    "http://localhost:8081",
    "http://127.0.0.1:8081",
    "https://bible-app-492520.web.app",
    "https://bible-app-492520.firebaseapp.com",
)

# Values the backend reads from .env that must stay secret. Each becomes a Secret Manager secret of the
# same name, mounted as the env var of the same name. SUPABASE_URL is not secret, but keeping every
# .env-derived value in one place means nothing project-specific is committed here.
# Read by Settings but unused by any code, so deliberately not deployed: GOOGLE_CLIENT_ID,
# GOOGLE_CLIENT_SECRET, APP_SECRET_KEY.
SECRET_ENV_VARS = (
    "SUPABASE_URL",
    "SUPABASE_ANON_KEY",
    "SUPABASE_SERVICE_ROLE_KEY",
    "OPENAI_API_KEY",
    "ANTHROPIC_API_KEY",
)

# Cost guard: scale to zero, a small ceiling, request-based CPU billing (the gcloud default).
RUN_SETTINGS = {
    "min_instances": 0,
    "max_instances": 3,
    "memory": "512Mi",
    "cpu": "1",
    "concurrency": 80,
    "timeout": 300,  # AI chat answers can take tens of seconds
}

# What Cloud Build uploads (must match the allowlist in .gcloudignore); used for the -dirty tag.
BUILD_INPUTS = ("Dockerfile", ".dockerignore", "requirements.txt", "app", "scripts/build_content.py", "content/source")

GcloudFn = Callable[[list[str], "str | None"], subprocess.CompletedProcess]


def repo_root() -> Path:
    return Path(__file__).resolve().parent


def service_account_email(project: str) -> str:
    return f"{SERVICE_ACCOUNT_NAME}@{project}.iam.gserviceaccount.com"


def image_base(project: str, region: str) -> str:
    return f"{region}-docker.pkg.dev/{project}/{REPOSITORY}/{SERVICE}"


_DEFAULT_PORTS = {"http": 80, "https": 443}
_HOST_LABEL = re.compile(r"[a-z0-9_]([a-z0-9_-]*[a-z0-9_])?")
_NUMERIC_LABEL = re.compile(r"[0-9]+|0x[0-9a-f]*")


def canonical_origin(origin: str) -> str:
    """Return `origin` in the exact form a browser sends it, or raise ValueError.

    Starlette's CORSMiddleware compares origins as exact strings, so a configured origin that differs
    from the browser's serialisation silently never matches. Case and default ports are normalised;
    anything a browser would rewrite in a less obvious way (IDN, percent-encoding, IPv4 shorthand,
    IPv6 zone ids) is rejected, so the operator gives the exact ASCII form instead.
    """
    bad = ValueError(f"not an exact http(s) origin: {origin!r}")
    if not origin.isascii() or any(ch in origin for ch in "*@%") or any(ch.isspace() for ch in origin):
        raise bad
    parts = urlsplit(origin)
    scheme = parts.scheme.lower()
    if scheme not in _DEFAULT_PORTS or not parts.hostname or parts.path or parts.query or parts.fragment:
        raise bad
    try:
        port = parts.port
    except ValueError:
        raise bad from None
    if port == 0 or (port is None and parts.netloc.endswith(":")):
        raise bad
    host = parts.hostname  # lowercased by urlsplit
    if parts.netloc.split("@")[-1].startswith("["):
        try:
            host = f"[{ipaddress.IPv6Address(host).compressed}]"
        except ValueError:
            raise bad from None
    else:
        labels = host.rstrip(".").split(".")
        if not all(_HOST_LABEL.fullmatch(label) for label in labels):
            raise bad
        for label in labels:
            if label.startswith("xn--"):
                # Malformed punycode is rejected by browsers' URL parsers: it must decode and round-trip.
                try:
                    if label.encode("ascii").decode("idna").encode("idna") != label.encode("ascii"):
                        raise bad
                except UnicodeError:
                    raise bad from None
        if _NUMERIC_LABEL.fullmatch(labels[-1]):
            # Browsers parse this as IPv4 (and rewrite shorthand, hex and octal): only a canonical
            # dotted quad is accepted.
            try:
                if str(ipaddress.IPv4Address(host)) != host:
                    raise bad
            except ValueError:
                raise bad from None
    suffix = f":{port}" if port is not None and port != _DEFAULT_PORTS[scheme] else ""
    return f"{scheme}://{host}{suffix}"


def parse_cors_origins(raw: str) -> list[str]:
    """Split and validate a comma-separated origin list into canonical, de-duplicated exact origins."""
    origins: list[str] = []
    for part in raw.split(","):
        part = part.strip()
        if part:
            origin = canonical_origin(part)
            if origin not in origins:
                origins.append(origin)
    if not origins:
        raise ValueError("CORS origin list is empty")
    return origins


def runtime_env_vars(cors_origins: list[str]) -> dict[str, str]:
    """Plain (non-secret) env vars for the service."""
    return {"APP_ENV": "production", "CORS_ORIGINS": ",".join(cors_origins)}


def deploy_args(
    *,
    project: str,
    region: str,
    image: str,
    env_vars_file: str,
    secrets: list[str],
    max_instances: int,
) -> list[str]:
    args = [
        "run", "deploy", SERVICE,
        "--project", project,
        "--region", region,
        "--platform", "managed",
        "--image", image,
        "--service-account", service_account_email(project),
        "--allow-unauthenticated",
        "--port", "8080",
        "--min-instances", str(RUN_SETTINGS["min_instances"]),
        "--min", str(RUN_SETTINGS["min_instances"]),  # service-level minimum, separate from the revision's
        "--max-instances", str(max_instances),
        "--memory", RUN_SETTINGS["memory"],
        "--cpu", RUN_SETTINGS["cpu"],
        "--concurrency", str(RUN_SETTINGS["concurrency"]),
        "--timeout", str(RUN_SETTINGS["timeout"]),
        "--cpu-boost",
        "--cpu-throttling",  # request-based billing, even if an earlier revision had always-on CPU
        "--labels", f"app={SERVICE}",
        # A file, not --set-env-vars: the origin list has commas, and gcloud's ^delim^ escape is
        # mangled by cmd.exe when gcloud is gcloud.cmd on Windows. Replaces all plain env vars.
        "--env-vars-file", env_vars_file,
    ]
    if secrets:
        # Replaces all secret env vars, so the service matches SECRET_ENV_VARS exactly.
        args += ["--set-secrets", ",".join(f"{name}={name}:latest" for name in secrets)]
    else:
        args += ["--clear-secrets"]
    return args


def build_args(*, project: str, image: str) -> list[str]:
    # Uploads the checkout filtered by .gcloudignore (an allowlist), then runs the two-stage Dockerfile.
    return ["builds", "submit", "--project", project, "--tag", image, "."]


def resolve_gcloud() -> str:
    override = os.environ.get("GCLOUD_PATH")
    if override and Path(override).is_file():
        return override
    for name in ("gcloud", "gcloud.cmd", "gcloud.exe"):
        found = shutil.which(name)
        if found:
            return found
    raise FileNotFoundError("gcloud CLI not found. Add Google Cloud SDK\\bin to PATH or set GCLOUD_PATH.")


def git_image_tag(root: Path) -> str:
    sha = subprocess.run(
        ["git", "rev-parse", "--short=12", "HEAD"], cwd=root, check=True, capture_output=True, text=True
    ).stdout.strip()
    dirty = subprocess.run(
        ["git", "status", "--porcelain", "--", *BUILD_INPUTS],
        cwd=root, check=True, capture_output=True, text=True,
    ).stdout.strip()
    return f"{sha}-dirty-{time.strftime('%Y%m%d%H%M%S')}" if dirty else sha


# --- Secret Manager sync -------------------------------------------------------------------------


def _version_id(resource_name: str) -> int | None:
    tail = resource_name.strip().rsplit("/", 1)[-1]
    return int(tail) if tail.isdigit() else None


def sync_secrets(
    values: dict[str, str | None],
    *,
    project: str,
    region: str,
    gcloud: GcloudFn,
    log: Callable[[str], None] = print,
) -> list[str]:
    """Create or update one secret per SECRET_ENV_VARS name from `values`; return the names synced.

    Secret values only ever travel on stdin (`--data-file=-`), never in argv, and are never logged.
    A new version is added only when the stored bytes differ (read as the API's base64 payload, so
    gcloud's text formatter never rewrites newlines). Afterwards every version older than the one
    kept is destroyed: the local .env is the source of truth, and active versions past six are billed.
    The runtime service account gets secretAccessor on each secret only, not on the project.
    """
    member = f"serviceAccount:{service_account_email(project)}"
    synced: list[str] = []
    for name in SECRET_ENV_VARS:
        value = values.get(name) or ""
        if not value:
            log(f"skip {name}: empty or missing in .env")
            continue
        wanted = value.encode("utf-8")
        exists = gcloud(["secrets", "describe", name, "--project", project, "--format=value(name)"], None)
        current: bytes | None = None
        kept: int | None = None
        if exists.returncode != 0:
            gcloud(
                [
                    "secrets", "create", name, "--project", project,
                    "--replication-policy=user-managed", f"--locations={region}",
                    f"--labels=app={SERVICE}",
                ],
                None,
            ).check_returncode()
        else:
            latest = gcloud(
                ["secrets", "versions", "access", "latest", "--secret", name, "--project", project, "--format=json"],
                None,
            )
            if latest.returncode == 0:
                try:
                    payload = json.loads(latest.stdout)
                    current = base64.b64decode(payload["payload"]["data"], validate=True)
                    kept = _version_id(payload["name"])
                except (ValueError, KeyError, TypeError):
                    current, kept = None, None
        if current is not None and current == wanted and kept is not None:
            log(f"unchanged {name}")
        else:
            added = gcloud(
                ["secrets", "versions", "add", name, "--project", project, "--data-file=-", "--format=value(name)"],
                value,
            )
            added.check_returncode()
            kept = _version_id(added.stdout)
            log(f"updated {name}")
        # Runs on every sync (not only after an add), so a retry finishes an interrupted cleanup.
        listed = gcloud(["secrets", "versions", "list", name, "--project", project, "--format=value(name,state)"], None)
        listed.check_returncode()
        states: dict[int, str] = {}
        for line in listed.stdout.splitlines():
            fields = line.split()
            version = _version_id(fields[0]) if len(fields) >= 2 else None
            if version is not None:
                states[version] = fields[1].upper()
        if kept is None or states.get(kept) != "ENABLED":
            log(f"warning {name}: kept version {kept} is not ENABLED; skipped cleanup of older versions")
        else:
            # Only versions older than the one kept (by number, never by list order or createTime).
            for version in sorted((v for v, st in states.items() if v < kept and st != "DESTROYED"), reverse=True):
                gcloud(
                    ["secrets", "versions", "destroy", str(version), "--secret", name, "--project", project, "--quiet"],
                    None,
                ).check_returncode()
        gcloud(
            [
                "secrets", "add-iam-policy-binding", name, "--project", project,
                "--member", member, "--role", "roles/secretmanager.secretAccessor", "--format=none",
            ],
            None,
        ).check_returncode()
        synced.append(name)
    return synced


def make_gcloud_runner(gcloud_path: str) -> GcloudFn:
    """gcloud adapter for sync_secrets. Bytes mode, so Windows never rewrites \\n as \\r\\n in a secret
    on stdin, and an unchanged value containing \\r\\n reads back equal."""

    def run(cmd: list[str], stdin: str | None) -> subprocess.CompletedProcess:
        result = subprocess.run([gcloud_path, *cmd], input=(stdin or "").encode("utf-8"), capture_output=True)
        return subprocess.CompletedProcess(
            result.args, result.returncode,
            # stdout is strict: a mis-decoded value must fail loudly, never compare equal by accident.
            result.stdout.decode("utf-8"), result.stderr.decode("utf-8", errors="replace"),
        )

    return run


def existing_secrets(gcloud_path: str, project: str) -> list[str]:
    result = subprocess.run(
        [gcloud_path, "secrets", "list", "--project", project, "--format=value(name)"],
        check=True, capture_output=True, text=True,
    )
    present = {line.strip().rsplit("/", 1)[-1] for line in result.stdout.splitlines() if line.strip()}
    return [name for name in SECRET_ENV_VARS if name in present]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Build and deploy bible-api to Cloud Run.")
    parser.add_argument("--project", default=os.environ.get("DEPLOY_PROJECT", DEFAULT_PROJECT))
    parser.add_argument("--region", default=os.environ.get("DEPLOY_REGION", DEFAULT_REGION))
    parser.add_argument(
        "--cors-origins",
        default=os.environ.get("DEPLOY_CORS_ORIGINS", ",".join(DEFAULT_CORS_ORIGINS)),
        help="Comma-separated browser origins allowed by CORS (exact origins, no '*')",
    )
    parser.add_argument("--max-instances", type=int, default=RUN_SETTINGS["max_instances"])
    parser.add_argument("--image", help="Deploy this image instead of building one")
    parser.add_argument("--sync-secrets", action="store_true", help="Copy .env secret values to Secret Manager, then exit")
    parser.add_argument("--env-file", default=str(repo_root() / ".env"), help="Source for --sync-secrets")
    parser.add_argument("--dry-run", action="store_true", help="Print gcloud commands only")
    args = parser.parse_args(argv)

    try:
        cors = parse_cors_origins(args.cors_origins)
    except ValueError as error:
        print(f"--cors-origins: {error}", file=sys.stderr)
        return 1
    if not 1 <= args.max_instances <= 10:
        print("--max-instances must be 1-10 (cost guard)", file=sys.stderr)
        return 1

    root = repo_root()
    try:
        gcloud_path = resolve_gcloud()
    except FileNotFoundError as error:
        if not args.dry_run:
            print(str(error), file=sys.stderr)
            return 1
        gcloud_path = "gcloud"

    if args.sync_secrets:
        from dotenv import dotenv_values

        env_path = Path(args.env_file)
        if not env_path.is_file():
            print(f"{env_path} not found", file=sys.stderr)
            return 1
        values = dotenv_values(env_path)
        if args.dry_run:
            for name in SECRET_ENV_VARS:
                print(f"[dry-run] would sync {name} ({'set' if values.get(name) else 'empty, skipped'})")
            return 0

        try:
            synced = sync_secrets(
                values, project=args.project, region=args.region, gcloud=make_gcloud_runner(gcloud_path)
            )
        except subprocess.CalledProcessError as error:
            # gcloud's stderr never holds a secret value: values only travel on stdin.
            print(f"gcloud failed ({' '.join(map(str, error.cmd[1:4]))} ...):\n{error.stderr}", file=sys.stderr)
            return 1
        print(f"Synced {len(synced)} secret(s). Run `python deploy.py` to roll them out.")
        return 0

    image = args.image or f"{image_base(args.project, args.region)}:{git_image_tag(root)}"
    secrets = list(SECRET_ENV_VARS) if args.dry_run else existing_secrets(gcloud_path, args.project)
    missing = [name for name in SECRET_ENV_VARS if name not in secrets]
    if missing:
        print(f"Secret Manager has no {', '.join(missing)}: run `python deploy.py --sync-secrets` first.",
              file=sys.stderr)
        return 1

    def run(cmd: list[str]) -> None:
        if args.dry_run:
            print(f"[dry-run] gcloud {' '.join(cmd)}")
            return
        print(f"> gcloud {' '.join(cmd)}", flush=True)
        subprocess.run([gcloud_path, *cmd], cwd=root, check=True)

    env_dir = tempfile.mkdtemp(prefix="bible-api-env-")
    env_vars_file = Path(env_dir) / "env.yaml"
    # JSON is valid YAML, and json.dumps quotes every value safely.
    env_vars_file.write_text(json.dumps(runtime_env_vars(cors), indent=2), encoding="utf-8")
    try:
        if args.dry_run:
            print(f"[dry-run] env vars file: {env_vars_file.read_text(encoding='utf-8')}")
        if not args.image:
            run(build_args(project=args.project, image=image))
        run(
            deploy_args(
                project=args.project, region=args.region, image=image,
                env_vars_file=str(env_vars_file), secrets=secrets, max_instances=args.max_instances,
            )
        )
    except subprocess.CalledProcessError:
        return 1
    finally:
        shutil.rmtree(env_dir, ignore_errors=True)

    if not args.dry_run:
        print(f"Deployed {image}")
        print(f"Smoke test: python deploy/smoke.py --url <service URL from the output above>")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
