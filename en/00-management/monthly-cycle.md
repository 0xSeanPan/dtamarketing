# Monthly Research Cycle

> Usage: executed by the automation task on the 1st of each month, or triggered manually at any time. Follows the evidence grading of `../05-method/methods-templates.md` throughout. Total time box ~2.5 hours; unfinished items roll to next month rather than compressing quality.

## Process Steps

### Step 1 Locate (5 min)

Read `../README.md` → `roadmap.md`; confirm the current phase, priority modules, and backlog.

### Step 2 Intel scan (60 min)

Sweep the monthly sources in `../04-intel/monitoring-sources.md` one by one (protocols and specs, platform updates, research and data); mind information timeliness when searching. Record only what affects research judgment, with source and date per item.

### Step 3 Filter noise (applied during the scan)

- Only A/B-grade evidence may enter a module's "Current conclusions"
- C-grade information has exactly two allowed destinations: a new hypothesis in the framework's H list, or a "Next steps" item
- Industry news irrelevant to M1–M4 does not enter the knowledge base
- When multiple outlets report the same fact, keep the earliest first-hand source; do not double-record
- Old conclusions overturned by new evidence: rewrite them, leave one index line in the research log, do not keep the original

### Step 4 Advance research (60 min)

Work through completable items in the current priority module's "Next steps." If a monthly panel retest (M2) is due, run it and store data under the module's data/ subdirectory.

### Step 5 Write back

- Module "Current conclusions": add or rewrite entries, each tagged `[date][grade]`
- Framework hypothesis list: update verification status
- `research-log.md`: append at most 3 lines
- `roadmap.md`: update task status
- On major protocol or platform policy changes: register a review item on `decision-board.md`
- Sync the English mirror: port this round's changes to the corresponding documents under `en/` (identical structure and conclusions, idiomatic language)

### Step 6 Rebuild the WIKI

At the project root run:

```
powershell -NoProfile -ExecutionPolicy Bypass -File build_wiki.ps1
```

Confirm the modification time of `wiki/index.html` has advanced (the build output should report 14 pages per language).

### Step 7 Verify

Four hard checks: every new conclusion carries an evidence tag; the research log has been appended; the English mirror has been synced; `wiki/index.html` has been rebuilt.

## Prohibitions

- Do not delete existing conclusions unless new evidence overturns them (state the basis when overturning)
- Do not create documents outside the six directories; new topics follow the topic template in `../05-method/methods-templates.md` inside the relevant module directory
- Do not hand-edit `wiki/index.html` — it is a build artifact; always change Markdown and rebuild
- After adding a Markdown document, register it in the `$pages` config of `build_wiki.ps1` (Chinese master and `en/` mirror each carry an entry) or it will not appear in the WIKI
