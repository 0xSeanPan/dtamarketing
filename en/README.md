# Agent Marketing Research

> Created: 2026-08-16 | Current phase: Phase 0 (framework & baseline) | Nature: long-running rolling research knowledge base (bilingual) | Reading layer: `wiki/index.html` (toggle 中文 / English in the sidebar) | Chinese master: root directory of the project

## Mission

Study "marketing to AI agents" as an emerging discipline, and convert findings into three reusable asset classes that decide what to invest in and what to walk away from:

- **Business trade-offs** — which opportunities deserve investment and which to decline (see `../03-商业化/业务机会矩阵.md`, Chinese master)
- **Skill portfolio** — which capabilities to build ahead of demand
- **Commercialization paths** — turning research into billable services, products, or content assets

## Core Thesis

Humans are products of the attention economy — their decisions are shaped by feeds, search rankings, emotion, and brand association. AI agents are not: they make delegated decisions through retrieval, scoring, and their principal's objective function. The target of marketing is migrating from human attention to the agent's decision chain. Being **recognized, discovered, adopted, and repurchased** by AI agents is the marketing problem that comes after the attention economy. Full argument: `01-framework/research-framework.md`.

## Researcher

Pan Jiaming (Sean Pan) | Contact: [seanpanjiaming@aliyun.com](mailto:seanpanjiaming@aliyun.com)

## The Agent Marketing Funnel

| Module | One-line definition | Classic-marketing parallel | Document |
|---|---|---|---|
| M1 Recognition | The agent accurately reads who you are, what you offer, at what price | Brand awareness | `02-modules/m1-recognition.md` |
| M2 Discovery | When a user searches through an agent, you enter the candidate set and the final answer | SEO / SEM | `02-modules/m2-discovery.md` |
| M3 Adoption | The agent recommends you to the user, or invokes your tool or API directly | Conversion optimization | `02-modules/m3-adoption.md` |
| M4 Repurchase | The agent forms durable trust and repeats transactions with you | Retention / loyalty / CRM | `02-modules/m4-repurchase.md` |

## Directory Guide (English mirror)

| Path | Contents |
|---|---|
| `00-management/` | Roadmap, monthly research cycle, research log, decision board |
| `01-framework/` | Research framework: paradigm comparison, funnel model, glossary, hypotheses |
| `02-modules/` | The four module documents M1–M4 |
| `03-commercialization/` | Skill portfolio map, opportunity matrix |
| `04-intel/` | Monitoring source list |
| `05-method/` | Methods, evidence grading, note and experiment templates |

## Workflow (enter here at every research session)

1. Read `00-management/roadmap.md` to confirm the current phase and priority modules
2. Open the relevant module document and advance through "research questions → method → evidence → conclusions → next steps"
3. Record new findings in two places: the module's "Current conclusions" section, plus one line in `00-management/research-log.md`
4. When a conclusion is strong enough to change business judgment, update the two `03-commercialization/` documents and, if needed, open a review item on the decision board
5. After saving Markdown, run `powershell -NoProfile -ExecutionPolicy Bypass -File build_wiki.ps1` at the project root to rebuild the WIKI

## Two-layer Architecture and Sync

This project is a dynamic system with a truth layer and a reading layer:

- **Truth layer**: the Markdown corpus — the Chinese master in the root directories plus this `en/` mirror — the single source of truth, continuously updated with AI assistance
- **Reading layer**: `wiki/index.html` — a single-file WIKI for human reading (sidebar navigation, full-text search, SVG diagrams, Chinese/English toggle), generated from the truth layer by `build_wiki.ps1`

Sync rules:

- Rebuild after every Markdown change; never hand-edit `wiki/index.html` — rebuild to restore consistency
- New documents must be registered in the `$pages` config of `build_wiki.ps1` before they appear in the WIKI
- The `en/` mirror maps one-to-one onto the Chinese master; after updating Chinese content, sync the English counterpart, then rebuild
- The monthly cycle (`00-management/monthly-cycle.md`) keeps both languages current: scan → filter noise → advance research → write back → rebuild

## Maintenance Rules

- Single source of truth: each conclusion lives in exactly one document; other locations link to it rather than copying it
- Every conclusion carries a tag: `[date][evidence grade A/B/C] source`; grades are defined in `05-method/methods-templates.md`
- Documents keep only currently valid content: rewrite or delete stale conclusions; the timeline lives in the research log
- Formal external research reports are delivered as PDF per the owner's preference; this knowledge base remains a living Markdown corpus
