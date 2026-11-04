# Content workflow

How bulk content is produced for this app: anything written, tagged or imported at scale that
readers will see or rely on. That covers chapter summaries, people and places, themes, key words,
the question bank, and imported texts.

**Every bulk content job follows these four rounds.** Claude Opus 5.5 orchestrates. GPT 6.1 Sol
agents write all the content, with `-m gpt-6.1-sol`. If a step doesn't fit a job, get John's OK
first. One-off edits to a few items don't need this workflow, but they still go through a PR.

| Round | What happens | Who | Ends when |
|---|---|---|---|
| 1. Draft | Requirements, factual checks and style checks | Claude, then John | John confirms the criteria |
| 2. Pilot | Short pilot, John reviews, repeat | Sol, then John | The pilot passes and the spec is locked |
| 3. Scale | The locked spec goes to a team of Sol agents | Sol | Every item is written |
| 4. Screen | A deterministic classifier screens every item | Script, then Claude | Serious diversions are cleared |

## Round 1: draft

Claim the work in `CLAIMS.md`. Claude then drafts:

- **Requirements:** what is being made, how many items, who reads it, where it appears in the app,
  the sources and their licences, and the output schema.
- **Factual checks:** what must be true of every item. The source text is the authority, and the
  requirements name which translation.
- **Style checks:** how every item must read.
- **The classifier:** a script for every check that can be tested mechanically. Each check is marked
  as one the classifier can screen or one it can't, so John can see what round 4 won't catch.

Before drafting, make sure the inputs are ready:

- Sources are pinned in `content/source/MANIFEST.json` with URL, sha256, version and licence.
- Any list used for tagging is finished. Don't tag from a list with known gaps.
- Work starts from the source text. Old generated content is not an input unless John says so.

Test each style rule against the words that matter. The summary pilot's plain-word rule turned
"righteousness" into "acceptance". Where the text is silent or Christians differ, the content says
so or stays out of it, and never settles the question.

**John confirms the criteria.** Licence doubts go to him here. Claude then hands the criteria to Sol
for a short pilot.

## Round 2: pilot

- **Short pilot:** just enough items to cover each type of content and the hard cases. The summary
  pilot was 40 chapters.
- **Run it the way round 3 will run:** Sol agents write the items and the classifier screens them.
- **John reviews the product,** on one review page, with old and new side by side where there is an
  old version.
- **Repeat until it passes.** Claude updates the criteria from John's comments, Sol redoes the pilot,
  and John reviews again.

Before the spec locks, John sets **what counts as serious for this job**. For each check, the spec
records the threshold for a serious diversion and what happens to an item that crosses it. This is
decided per job, because a serious error in a quiz question is not the same as one in a summary.

**The spec locks when John passes the pilot.** It gets a version, recorded on every item, and
nothing in it changes during rounds 3 and 4. If it has to change, go back to round 2.

Record the pilot's token use: everything each agent read and wrote, roughly the characters in its
log divided by 4. Round 3 sizes its team from this. The usage total at the end of a job's log counts
the context again on every step, so it can't be used for this.

## Round 3: scale

The locked spec goes to a team of Sol agents, split so that **no agent needs to go above a
272k-token context window.** Long contexts degrade quality, so this limit applies to every agent.

Size the team from the pilot:

```
tokens per item  = pilot tokens for the items / number of items
fixed tokens     = spec + lists + anything every agent must read
items per agent  = (217,000 - fixed tokens) / tokens per item, rounded down
agents           = total items / items per agent, rounded up
```

217,000 is 80% of 272k, because the estimate is rough. For scale, one 58-entry people batch reached
about 246k tokens, so batch sizes can't be guessed.

- Each agent starts fresh, with the locked spec and its own list of items, and nothing else.
- One file per item, so work can be resumed or redone without touching finished items.
- Every item records `generated_by`, the spec version and the date.
- Items are written by reading, one at a time, never by a template or a script.
- Agents can't edit the spec, the classifier, the inputs or the lists.
- After the run, check each agent's log. If one went over 272k, a fresh agent redoes its later items.

## Round 4: screen

All content goes through the deterministic classifier, which screens for obvious diversions from
the criteria: schema, lengths, references, tags, banned or required words, copying limits, and
whatever else the spec makes checkable. It gives the same result every time. Don't loosen a check
to get an item through.

Each diversion is handled as the locked spec says. Items over a serious threshold go to a fresh Sol
agent to redo, up to two times, then to John. Claude reports the totals, and every other diversion
is logged. Spec problems found here send the job back to round 2.

If the classifier shows the same fault across many items, stop, find the cause, and recheck every
item it could have touched.

## After round 4

Merging and release follow the repo's normal rules:

- **Data goes in its own PR,** separate from app code. Keep unrelated decisions in separate commits.
- **Rebuild first:** run `python scripts/build_content.py` before pytest or the gate. A stale
  `build/content.sqlite` hides new data.
- **Tests don't compare with moving refs** such as `origin/main`.
- **Follow the merge rule:** trial merge on `origin/main`, gate, merge with `--match-head-commit`,
  and confirm `origin/main^{tree}` equals the trial tree.
- **List every reader of the data,** including the agent's tools, and say what each will see.
- **Deploy with John's OK,** run `deploy/smoke.py`, and spot-check named items live. Note the previous
  Cloud Run revision first, so traffic can be shifted back.
- AI-written content is labelled as AI-written in the app.

## Stop and ask John

- a licence doubt or an unexpected cost (paid API spend always needs his OK first)
- a schema change to a live endpoint
- a doctrinal or editorial choice the spec doesn't cover
- a list or source turns out to be incomplete after round 3 has started

## Where things live

- **Repo:** this protocol, each job's plan in `docs/plans/`, and specs, classifiers and importers under
  `scripts/content/`, so a run can be repeated.
- **Outside the repo:** working files, pilots and review pages under `C:\dev\bible-app-work\`.
- **Reviewed output:** checked in as source, for example `commentary/*.json` and `content/source/`.
