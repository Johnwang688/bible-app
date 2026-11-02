"""W5: deploy.py builds a least-privilege, scale-to-zero Cloud Run deploy and never leaks secrets."""

from __future__ import annotations

import importlib.util
import json
import subprocess
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]
_spec = importlib.util.spec_from_file_location("deploy_script", ROOT / "deploy.py")
deploy = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(deploy)

PROJECT = "bible-app-492520"


def _flag(args: list[str], name: str) -> str:
    return args[args.index(name) + 1]


def _deploy_args(**overrides) -> list[str]:
    kwargs = dict(
        project=PROJECT, region="us-central1", image="img:tag", env_vars_file="env.yaml",
        secrets=list(deploy.SECRET_ENV_VARS), max_instances=3,
    )
    kwargs.update(overrides)
    return deploy.deploy_args(**kwargs)


def test_defaults_target_us_central1_project():
    assert deploy.DEFAULT_PROJECT == PROJECT
    assert deploy.DEFAULT_REGION == "us-central1"
    assert deploy.image_base(PROJECT, "us-central1") == f"us-central1-docker.pkg.dev/{PROJECT}/bible-app/bible-api"


def test_deploy_scales_to_zero_with_small_ceiling():
    args = _deploy_args()
    assert args[:3] == ["run", "deploy", "bible-api"]
    assert _flag(args, "--min-instances") == "0"
    assert _flag(args, "--max-instances") == "3"
    assert _flag(args, "--region") == "us-central1"
    assert _flag(args, "--project") == PROJECT
    assert "--no-cpu-throttling" not in args  # request-based billing: no CPU charge while idle


def test_deploy_runs_as_dedicated_service_account_and_is_public():
    args = _deploy_args()
    assert _flag(args, "--service-account") == f"bible-api@{PROJECT}.iam.gserviceaccount.com"
    assert "compute@developer" not in " ".join(args)
    assert "--allow-unauthenticated" in args


def test_secrets_are_mounted_by_reference_only():
    args = _deploy_args()
    mapping = _flag(args, "--set-secrets").split(",")
    assert mapping == [f"{name}={name}:latest" for name in deploy.SECRET_ENV_VARS]
    assert "--set-env-vars" not in args and "--update-env-vars" not in args


def test_no_secrets_clears_them():
    args = _deploy_args(secrets=[])
    assert "--clear-secrets" in args and "--set-secrets" not in args


def test_env_vars_are_production_and_cors_only():
    env = deploy.runtime_env_vars(list(deploy.DEFAULT_CORS_ORIGINS))
    assert env == {"APP_ENV": "production", "CORS_ORIGINS": ",".join(deploy.DEFAULT_CORS_ORIGINS)}
    assert not set(env) & set(deploy.SECRET_ENV_VARS)


@pytest.mark.parametrize(
    "raw",
    ["*", "https://*.web.app", "localhost:8081", "https://a.app/", "https://a.app/path", "ftp://a.app", " , ",
     "https://user:pw@a.app"],
)
def test_cors_rejects_wildcards_and_non_origins(raw):
    with pytest.raises(ValueError):
        deploy.parse_cors_origins(raw)


def test_cors_accepts_exact_origins():
    assert deploy.parse_cors_origins(" http://localhost:8081 , https://x.web.app ,") == [
        "http://localhost:8081", "https://x.web.app",
    ]
    assert deploy.parse_cors_origins(",".join(deploy.DEFAULT_CORS_ORIGINS)) == list(deploy.DEFAULT_CORS_ORIGINS)


class FakeGcloud:
    """Records calls; pretends secrets exist with the given latest values."""

    def __init__(self, existing: dict[str, str]):
        self.existing = dict(existing)
        self.calls: list[tuple[list[str], str | None]] = []

    def __call__(self, args: list[str], stdin: str | None) -> subprocess.CompletedProcess:
        self.calls.append((list(args), stdin))
        out, code = "", 0
        if args[:2] == ["secrets", "describe"]:
            code = 0 if args[2] in self.existing else 1
        elif args[:3] == ["secrets", "versions", "access"]:
            name = args[args.index("--secret") + 1]
            out = self.existing.get(name, "")
        elif args[:3] == ["secrets", "versions", "list"]:
            out = "projects/p/secrets/x/versions/3 ENABLED\nprojects/p/secrets/x/versions/2 DISABLED\nprojects/p/secrets/x/versions/1 DESTROYED\n"
        return subprocess.CompletedProcess(args, code, out, "")


def test_sync_secrets_never_puts_values_in_argv():
    values = {name: f"value-of-{name}-s3cr3t" for name in deploy.SECRET_ENV_VARS}
    fake = FakeGcloud(existing={"OPENAI_API_KEY": "old"})
    logs: list[str] = []
    synced = deploy.sync_secrets(values, project=PROJECT, region="us-central1", gcloud=fake, log=logs.append)
    assert synced == list(deploy.SECRET_ENV_VARS)
    for args, stdin in fake.calls:
        joined = " ".join(args)
        assert "s3cr3t" not in joined
        if stdin:
            assert args[:3] == ["secrets", "versions", "add"] and "--data-file=-" in args
    assert not any("s3cr3t" in line for line in logs)
    adds = [stdin for args, stdin in fake.calls if args[:3] == ["secrets", "versions", "add"]]
    assert sorted(adds) == sorted(values.values())


def test_sync_secrets_skips_unchanged_and_empty():
    fake = FakeGcloud(existing={"OPENAI_API_KEY": "same"})
    synced = deploy.sync_secrets(
        {"OPENAI_API_KEY": "same", "ANTHROPIC_API_KEY": ""}, project=PROJECT, region="us-central1",
        gcloud=fake, log=lambda _line: None,
    )
    assert synced == ["OPENAI_API_KEY"]
    assert not [a for a, _ in fake.calls if a[:3] == ["secrets", "versions", "add"]]
    assert not [a for a, _ in fake.calls if "ANTHROPIC_API_KEY" in a]


def test_sync_secrets_creates_regional_secret_and_grants_accessor_per_secret():
    fake = FakeGcloud(existing={})
    deploy.sync_secrets({"OPENAI_API_KEY": "v"}, project=PROJECT, region="us-central1", gcloud=fake, log=lambda _l: None)
    create = next(a for a, _ in fake.calls if a[:2] == ["secrets", "create"])
    assert "--replication-policy=user-managed" in create and "--locations=us-central1" in create
    binding = next(a for a, _ in fake.calls if a[:2] == ["secrets", "add-iam-policy-binding"])
    assert binding[2] == "OPENAI_API_KEY"
    assert _flag(binding, "--role") == "roles/secretmanager.secretAccessor"
    assert _flag(binding, "--member") == f"serviceAccount:bible-api@{PROJECT}.iam.gserviceaccount.com"
    assert not [a for a, _ in fake.calls if a[:2] == ["projects", "add-iam-policy-binding"]]


def test_sync_secrets_destroys_superseded_versions_only():
    fake = FakeGcloud(existing={"OPENAI_API_KEY": "old"})
    deploy.sync_secrets({"OPENAI_API_KEY": "new"}, project=PROJECT, region="us-central1", gcloud=fake, log=lambda _l: None)
    destroyed = [a[3] for a, _ in fake.calls if a[:3] == ["secrets", "versions", "destroy"]]
    assert destroyed == ["2"]  # 3 is the new latest, 1 is already destroyed


def test_dry_run_prints_commands_without_secret_values(capsys):
    assert deploy.main(["--dry-run", "--image", "img:tag"]) == 0
    out = capsys.readouterr().out
    assert "run deploy bible-api" in out and "--min-instances 0" in out
    assert "builds submit" not in out  # --image skips the build
    env_json = out.split("env vars file:", 1)[1].split("[dry-run] gcloud", 1)[0]
    assert json.loads(env_json)["APP_ENV"] == "production"


def test_dry_run_rejects_wildcard_cors():
    assert deploy.main(["--dry-run", "--image", "i", "--cors-origins", "*"]) == 1


def test_gcloudignore_is_an_allowlist_that_excludes_env():
    lines = [l.strip() for l in (ROOT / ".gcloudignore").read_text(encoding="utf-8").splitlines()]
    assert lines[lines.index("/*")] == "/*"  # ignore everything first
    assert ".env" in lines and ".env.*" in lines
    allowed = {l[2:].rstrip("/") for l in lines if l.startswith("!/")}
    assert {"Dockerfile", "requirements.txt", "app", "scripts/build_content.py", "content/source"} <= allowed
    for path in deploy.BUILD_INPUTS:
        assert path in allowed, path


def test_dockerfile_runs_as_non_root():
    dockerfile = (ROOT / "Dockerfile").read_text(encoding="utf-8")
    final_stage = dockerfile.rsplit("FROM ", 1)[1]
    assert "\nUSER app" in final_stage
    assert ".env" not in dockerfile


# --- Sol review round 1 (counterexamples, kept as regression tests) -----------------------------


def test_review_redeploy_enforces_request_billing_and_service_minimum():
    args = _deploy_args()
    assert "--cpu-throttling" in args  # an earlier revision may have set always-on CPU
    assert _flag(args, "--min") == "0"  # a service-level minimum would keep instances warm


@pytest.mark.parametrize(
    "origin",
    ["https://@x.app", "https://x.app:bad", "https://x.app:65536", "https://x .app", "https://x.app\t.evil.app",
     "https://x.app:0"],
)
def test_review_cors_rejects_invalid_origin(origin):
    with pytest.raises(ValueError):
        deploy.parse_cors_origins(origin)


@pytest.mark.parametrize(
    ("configured", "browser"),
    [("http://LOCALHOST:8081", "http://localhost:8081"), ("https://x.app:443", "https://x.app"),
     ("HTTP://x.app:80", "http://x.app"), ("http://[::1]:8081", "http://[::1]:8081")],
)
def test_review_cors_origins_match_what_browsers_send(configured, browser):
    from starlette.middleware.cors import CORSMiddleware

    cors = CORSMiddleware(app=None, allow_origins=deploy.parse_cors_origins(configured), allow_credentials=True)
    assert cors.is_allowed_origin(browser)


def test_review_retry_finishes_version_cleanup():
    class Interrupted(FakeGcloud):
        failed = False

        def __call__(self, args, stdin):
            result = super().__call__(args, stdin)
            if args[:3] == ["secrets", "versions", "add"]:
                self.existing[args[3]] = stdin
            if args[:3] == ["secrets", "versions", "list"] and not self.failed:
                self.failed = True
                return subprocess.CompletedProcess(args, 1, "", "transient failure")
            return result

    fake = Interrupted({"OPENAI_API_KEY": "old"})
    kwargs = dict(project=PROJECT, region="us-central1", gcloud=fake, log=lambda _: None)
    with pytest.raises(subprocess.CalledProcessError):
        deploy.sync_secrets({"OPENAI_API_KEY": "new"}, **kwargs)
    fake.calls.clear()
    deploy.sync_secrets({"OPENAI_API_KEY": "new"}, **kwargs)
    assert [a[3] for a, _ in fake.calls if a[:3] == ["secrets", "versions", "destroy"]] == ["2"]


def test_review_gcloud_runner_passes_secret_bytes_unchanged():
    import sys

    run = deploy.make_gcloud_runner(sys.executable)
    sent = run(["-c", "import sys; sys.stdout.write(sys.stdin.buffer.read().hex())"], "line1\nline2\r\nline3")
    assert sent.stdout == "line1\nline2\r\nline3".encode().hex()  # no \n -> \r\n on Windows
    read = run(["-c", "import sys; sys.stdout.buffer.write(bytes.fromhex('6c696e65310d0a6c696e6532'))"], None)
    assert read.stdout == "line1\r\nline2"  # no \r\n -> \n, so an unchanged CRLF value compares equal


def test_review_missing_required_secrets_prevents_deploy(monkeypatch, capsys):
    calls: list[list[str]] = []
    monkeypatch.setattr(deploy, "resolve_gcloud", lambda: "fake-gcloud.cmd")
    monkeypatch.setattr(deploy, "existing_secrets", lambda _g, _p: ["OPENAI_API_KEY"])
    monkeypatch.setattr(
        deploy.subprocess, "run", lambda cmd, **kw: calls.append(cmd) or subprocess.CompletedProcess(cmd, 0, "", "")
    )
    assert deploy.main(["--image", "img:tag"]) != 0
    assert not [c for c in calls if "deploy" in c]
    assert "--sync-secrets" in capsys.readouterr().err
