# Content workflow

How agents produce bulk content for this app: anything written or tagged at scale that readers
will see or rely on. That covers chapter summaries, people and places, themes, key words, the
question bank, and imported texts.

**Every bulk content job follows this file.** If a step doesn't fit a job, say so in the brief and
get John's OK. Don't skip it quietly. One-off edits to a few items don't need this workflow, but
they still go through a PR.

The aim is that content is correct first, cheap to produce second, and quick for John to review
third. Most checking is done by scripts and agents, so John only sees what needs his judgment.

## The stages

| # | Stage | Who | Leaves behind | Gate |
|---|---|---|---|---|
| 0 | Brief and claim | Orchestrator | Brief, claim row | **John: G1** |
| 1 | Inputs ready | Orchestrator | Pinned sources, finished lists | Input check passes |
| 2 | Spec and checker | Orchestrator | Spec, checker, risk list | Checker tested on bad examples |
| 3 | Pilot | Writer, reviewers | Pilot set, review page | **John: G2** |
| 4 | Batch run | Writer | One file per item, run state | First batch read in full |
| 5 | Verify | Checker, second pass, Claude | Flags, sample results | Stop rules below |
| 6 | Final review | John | Verdict | **John: G3** |
| 7 | Merge | Orchestrator | Data-only PR | Fresh build, trial gate |
| 8 | Release | Orchestrator | Deployed revision | Live spot checks |
| 9 | Close | Orchestrator | Run log, updated workflow | Claim closed |

John has three gates. Everything else runs without him unless a stop rule fires.

## Roles

- **Orchestrator (Claude):** writes the brief, spec and checker, runs the job, and owns the result.
- **Writer (Sol by default):** writes the items by reading the sources. It never edits the checker,
  the inputs or the lists.
- **Second pass (a fresh Sol thread):** assumes there are mistakes and looks for them. It doesn't
  see the writer's notes, and it can't change the items.
- **Claude reviewer:** reads the samples and rules on flags. It never writes bulk content.
- **John:** decides G1, G2 and G3, plus anything doctrinal, editorial or legal.

Paid API spend needs John's OK first. Security reviews stay on Opus.

## Stage 0: brief and claim

Claim the work in `CLAIMS.md`, then write a brief of one screen or less:

- what is being made, how many items, and who reads it
- where each item will appear in the app
- the sources, each with its licence
- the output schema
- what a serious error looks like for this content
- estimated time and spend

**G1:** John approves the brief. A licence doubt comes to him here, before anything is built.

## Stage 1: inputs ready

Nothing is generated until all of these hold:

- **Sources are pinned** in `content/source/MANIFEST.json` with URL, sha256, version and licence.
- **Curated lists are finished.** A list that tagging depends on has been checked for coverage and
  identity. Don't tag from a list with known gaps.
- **New work starts from the source text.** Don't map or repair old generated content. Old labels
  and old summaries are not inputs unless the brief says so.
- **Dependencies run in order.** Lists come before tagging, and tagging comes before the entity
  rebuild.

## Stage 2: spec and checker

Write the spec and the checker together. Keep both in the repo, and give the spec a version.

The spec has these parts, in this order: what this is, inputs, output schema with one example,
style rules, accuracy rules, what the writer must do when unsure, acceptance, out of scope.

Rules for specs:

- **Every rule is either checked by a script or named in the second pass.** A rule nobody checks
  isn't a rule.
- **Test each rule against the words that matter.** A style rule can damage meaning across the
  whole run. The pilot's plain-word rule turned "righteousness" into "acceptance". Say what must
  not be simplified.
- **The source text is the authority.** Say which translation. Outside facts are out unless the
  spec allows them.
- **Say what to do with uncertainty.** Where the text is silent or Christians differ, the item says
  so or stays out of it. It never settles the question. The writer records doubts in a field for
  review, and doesn't guess.
- **Name the writer's method.** Items are written by reading, one at a time, never by a template or
  a script.

Then write the **risk list**: the items most likely to go wrong, such as disputed passages, shared
names, hard sayings and sensitive subjects. Risk items always get human review (stage 5).

The checker has to catch known bad examples before it is trusted. Keep those examples as tests.

## Stage 3: pilot

- **Sample:** 30 to 50 items, covering each genre or type, the risk list, and some ordinary items.
  Don't sample only the easy ones.
- **Run the whole pipeline** on the pilot: writer, checker, second pass, Claude reviewer.
- **Review page:** old and new side by side where there is an old version, flags beside each item,
  and the worst items first.

**G2:** John gives a verdict. If rules change, update the spec and checker and rerun the items
those rules affect. Once John approves, **freeze the spec**: the run uses that version, recorded in
every item. A later rule change is a new version, and the items it affects are redone.

## Stage 4: batch run

- **One file per item,** so a batch can be rerun or resumed without touching finished work.
- **Batches of about 50 items.** Run a few in parallel. The run state file lists each item's status:
  `todo`, `written`, `checked`, `flagged`, `accepted`, `rework`, `escalated`.
- **The first batch is the canary.** Claude reads all of it, and the run continues only if it's clean.
- **Provenance on every item:** `generated_by`, spec version, and date.
- **Retries:** an item that fails gets two rewrites, then goes to `escalated`. Don't loosen a check
  to get an item through.

## Stage 5: verify

Run cheapest first. Each layer sees only what the one before it passed.

| Layer | Covers | Checks |
|---|---|---|
| L1 Checker | Every item, must pass | Schema, lengths, references exist, tags on the lists, banned words, copying limits, required key words |
| L2 Second pass | Every item | Claims against the source: wrong, unsupported, overreach, softened, wrong speaker, bad reference, bad tag |
| L3 Claude sample | 10% random per batch (seeded), plus all risk items, all L2 flags, all escalated items | Judgment, tone, and whether L1 and L2 are missing things |
| L4 John | G3 sample | See stage 6 |

**Severity:**

- **Critical:** states something false about the text or a person, confuses two people, takes a side
  on a disputed doctrine, softens or drops a hard statement central to the passage, invents a fact,
  or breaks a licence or copying limit.
- **Major:** a wrong reference, a wrong tag, a key word lost, or an unclear or misleading sentence.
- **Minor:** style or awkward wording.

**Stop rules:**

- **Any critical error in the L3 sample stops the run.** Find the cause. If it's a spec or checker
  gap, fix that, then recheck every item it could have touched, not only the one found.
- **Major errors above 5% of a sample** stop that batch for the same treatment.
- **L3 finds errors that L2 passed:** widen the sample to 25% for the next batch, and strengthen the
  second pass.
- **Hand fixes:** fix an item through a fix spec and rerun L1 and L2 on it. Never edit items by hand
  without recording why.

**External checks must be independent.** Before relying on a comparison, confirm the other source
doesn't share our text. Bible Hub's Matthew Henry and the SWORD modules came from the same CCEL
text, so they can't confirm it.

## Stage 6: final review

John sees one review page, not the raw files:

- the run's numbers: items, flags, rework, and sample error rates
- everything escalated, grouped by decision, with a recommended answer for each
- a random sample of 30 items (or fewer for a small job), chosen by seed so it can't be picked
- the risk items, if he wants them

**G3:** John approves, sends items back, or stops the release.

## Stage 7: merge

- **Data goes in its own PR,** separate from app code. Keep unrelated decisions in separate commits
  so one can be held without the others.
- **Rebuild first:** run `python scripts/build_content.py` before pytest or the gate. A stale
  `build/content.sqlite` hides new data, and tests can pass or fail for the wrong reason.
- **Tests don't compare with moving refs** such as `origin/main`. Pin a commit, or don't commit the
  test. One-off import checks stay in the tools folder.
- **Follow the merge rule:** trial merge on `origin/main`, gate, merge with `--match-head-commit`,
  and confirm `origin/main^{tree}` equals the trial tree.
- **Check who else reads the data.** List every reader of the table, including the agent's tools and
  any call with no source filter, and say what each will see.

## Stage 8: release

- Say what users will see change, and confirm the deploy with John if it isn't already approved.
- Deploy, run `deploy/smoke.py`, then spot-check named items on the live API or the site.
- AI-written content is labelled as AI-written in the app.
- **Rollback:** shift Cloud Run traffic to the previous revision, then revert the PR. Record the
  previous revision before deploying.

## Stage 9: close

Keep a short run log in the job's folder: items, batches, time, spend, flags per 100 items, rework
rate, what L3 found that L1 and L2 missed, and what John changed. Add anything that should change
how the next job runs to this file. Update `CLAIMS.md`.

## Stop and ask John

Whatever the stage, stop and ask if any of these comes up:

- a licence doubt or an unexpected cost
- a schema change to a live endpoint
- a doctrinal or editorial choice the spec doesn't cover
- a list or source turns out to be incomplete after generation started
- a stop rule fires twice on the same job

## Where things live

- **This file:** the protocol.
- **Plans:** each job's plan and status in `docs/plans/`.
- **Repo:** specs, checkers and importers under `scripts/content/`, so a run can be repeated.
- **Outside the repo:** working files, pilots and review pages under `C:\dev\bible-app-work\`.
- **Reviewed output:** checked in as source, for example `commentary/*.json` and `content/source/`.
