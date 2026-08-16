# Methods and Templates

> Usage: consult this page before starting new research so that everything in the corpus stays comparable, reproducible, and citable.

## Evidence Grading

| Grade | Definition | Examples |
|---|---|---|
| A | First-party official material, or results of self-designed reproducible experiments | Stripe official blog; M1 blind-test data |
| B | Verifiable third-party research, checkable data | arxiv papers; vendor research reports |
| C | Industry opinion, anecdotes, single cases | Community discussion; press retellings |

Rules: C-grade evidence may only raise hypotheses, never support conclusions; upgrading a conclusion requires A or B evidence to replace it. Every conclusion is tagged `[YYYY-MM-DD][grade] source or experiment id`.

## Conclusion Lifecycle

```
Hypothesis (framework H list)
  → verification (module experiments / literature)
  → conclusion (written into the module's "Current conclusions" with evidence tag)
  → commercialization (triggers opportunity-matrix scoring or a decision-board item)
  → expiry (on platform/protocol change, rewrite or delete the entry; leave one index line in the log)
```

## Research Note Template (for new topics)

```markdown
# Topic: [title] (id: Tn)
- Started: YYYY-MM-DD | Module: M? | Hypothesis: H?
## Question
## Method (data sources, sample, time window)
## Evidence (each item tagged [date][grade])
## Conclusion (one citable sentence + applicability boundary)
## Business impact (which of matrix / skill map / decision board changes)
```

## Blind-test Protocol Template (M1; freeze and store as `../02-modules/blind-test-protocol.md`)

```markdown
# Blind-test Protocol v[n] (frozen date)
## Sample entities and selection rationale
## Prompt set (fixed 20 questions: what-is / capabilities / price / differentiation / risk)
## Execution parameters (model list, temperature, web access, round interval)
## Scoring sheet (category correctness / capability list / price / hallucinations / differentiators, each 0-2)
## Recording (verbatim answers + score sheets, stored under data/ in this directory)
```

## Panel-test Recording Convention (M2)

One round per month. Granularity: platform × question × answer gist × entities mentioned × citation URL list × absorption verdict (did content enter the answer body). From the second round on, register only deltas versus the previous round. Data tables live under `../02-modules/data/`, named `panel-YYYYMM.csv`.

## Monthly Review Template (last week of each month, 30–60 min)

```markdown
# Monthly Review YYYY-MM
- Evidence updates this month (cite module conclusions; do not copy content)
- Hypothesis status changes (verified / refuted / added)
- Whether the opportunity matrix or skill map needs to move
- Next month's priorities (at most 3)
```

## Citation and Linking Rules

- Internal cross-references use relative-path links; never copy the other document's body
- External sources record "source name + URL (if any) + access date"; keep the source name and mark it when a URL dies
- Numeric conclusions must be traceable to a data file or an external URL; otherwise downgrade to a qualitative statement
