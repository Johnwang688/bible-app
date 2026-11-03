# Agent notes for this repo

## Claim work before you start it

Several agent sessions build this app at the same time, in separate worktrees. To avoid
duplicate work and merge conflicts:

**Before claiming or starting any feature, phase or fix, read
`C:\dev\bible-app-work\CLAIMS.md`.** It is the live list of who owns which item and which
files.

- If what you want, or any file it touches, overlaps an active claim, don't start it. Pick
  another item, or ask John.
- Add your claim (item, session, branch, files owned) **before** creating a branch or
  dispatching workers. Edit only your own rows, and keep the status current until the PR
  merges.
- The file's own "Rules" section has the details (shared files, stale claims, workers).

The plan of record is `docs/plans/app-rebuild.md`. The claims file says who holds what
right now. The client has its own notes in `client/AGENTS.md`.
