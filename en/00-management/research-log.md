# Research Log

> Usage: one line per entry, newest on top. Record only "what was done, what was found, what is next"; details live in the module documents.

## Format

`[YYYY-MM-DD][module] action — key finding (if any) → next step`

Modules: mgmt / M1 / M2 / M3 / M4 / commercialization / intel / method

## Entries

- [2026-08-17][mgmt] Project deployed to the public GitHub repository `0xSeanPan/dtamarketing` with Pages enabled; added the zero-dependency deploy_github.ps1 (pushes via the Git Data API; token passed as parameter only) and a root redirect index.html → after each WIKI rebuild, run the deploy script to sync the live site
- [2026-08-16][mgmt] WIKI upgraded to bilingual (Chinese/English): added the 14-document `en/` mirror, language toggle in the reading layer; English terminology choices documented in `01-framework/research-framework.md` §5 → next: Phase 0 baseline measurement
- [2026-08-16][mgmt] System upgraded to a two-layer dynamic structure: build_wiki.ps1 builder and wiki/index.html reading layer (auto-synced from the Markdown truth layer), monthly-cycle SOP, monthly automation → first automatic run 2026-09-01
- [2026-08-16][mgmt] Knowledge base created: framework, M1–M4 module documents, roadmap, decision board, skill portfolio, opportunity matrix, monitoring sources, methods — 13 documents → next: start Phase 0 baseline (blind-test protocol + panel question set)
- [2026-08-16][intel] Field-fact baseline initialized: ACP (OpenAI + Stripe; ChatGPT production; Etsy/URBN onboard; machine payments supported) [A]; UCP (Google + Shopify; production 2026-01) [B]; GEO academic lineage (Princeton 2024 → citation-selection/absorption framework 2026) [B] → key sources recorded in `../04-intel/monitoring-sources.md`
