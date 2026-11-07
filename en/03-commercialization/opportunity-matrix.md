# Opportunity Matrix

> Last updated: 2026-11-07 | Usage: candidate opportunities are registered, scored, and traded off here. Scores must cite conclusions from the module documents as evidence; dimensions lacking evidence are marked "tbd," never guessed. Review cadence: quarterly.

## Scoring Dimensions (each 1–5)

| Dimension | Question | 1 means | 5 means |
|---|---|---|---|
| Timing maturity | Are protocols, platforms, client awareness ready | Concept stage; no client budget | Production ramp-up; budgets real |
| Demand authenticity | Are companies paying for this problem today | No paying cases | Multiple verifiable paying cases |
| Competitive density (reverse-scored) | How crowded and strong is the supply side | Incumbents and mature tools everywhere | Almost no mature supply |
| Personal fit | Match with own skills, resources, positioning | Multiple capabilities to build from zero | Direct reuse of existing capabilities |
| Monetization speed | Distance from investment to first revenue | 12+ months | Within 3 months |

Composite = sum of five (competitive density reverse-scored: fewer competitors, higher score). ≥ 18 enters "committed investment" candidates; ≤ 12 is dropped; 13–17 is watchlist or a small-cost experiment.

## Scores (First Round 2026-10-08 → First Quarterly Review 2026-11-07)

> Basis: evidence landed in the 2026-10 and 2026-11 monthly cycles (M1–M4 conclusion sections, `../02-modules/protocol-tracker.md`, plus Adobe / Ahrefs / Google official / arxiv data). Convention: **high scores all cite existing evidence**; low scores rest on the observable fact that verifiable paying cases or data are absent (the 1-point anchor of each dimension), not on subjective judgment. Personal fit refers to `skill-portfolio.md` (capabilities still to be assessed, so scored conservatively by proximity to the main research line).

| ID | Opportunity | Timing | Demand | Competition (rev.) | Fit | Speed | Total | Status |
|---|---|---|---|---|---|---|---|---|
| A1 | AI entity-recognition audit & fix service | 2 | 2 | 4 | 3 | 3 | 14 | Watch |
| A2 | AI-visibility diagnostics & GEO optimization service | **5** | 4 | 2 | 4 | 4 | **19** | Committed-investment candidate (conditional, awaiting reduced baseline) |
| A3 | Highly cited vertical content assets | **4** | 2 | 3 | 5 | 2 | **16** | Watch (high option value) |
| A4 | MCP server development & directory operations service | 4 | 3 | **1** | 2 | 3 | **13** | Watch (supply crowded; downgraded) |
| A5 | ACP/UCP merchant admission & protocol-integration service | 5 | 3 | 2 | 2 | 3 | 15 | Watch / small-cost experiment (re-score after splitting D3) |
| A6 | Agent-channel trust & fulfillment consulting | **3** | 2 | 5 | 3 | 1 | **14** | Watch (trust standards emerging) |

### Review Change Log (changed dimensions only)

| Opportunity | Dimension | First round | Review | Evidence |
|---|---|---|---|---|
| A2 | Timing | 4 | 5 | Adobe September: AI-referral traffic +71%, conversion +90%, RPV +83% (widest gap this year); Google Merchant Center officializes AI share of voice [M2 2026-11][A] |
| A3 | Timing | 3 | 4 | Citations are not fully random: citations lasting 8+ days return 96–99% of the time (Ahrefs, 37,500 citations); Google added an "official websites" section on 10-15 — owned-content assets now have a measurable long-term return rationale [M2 2026-11][A/B] |
| A4 | Competition (rev.) | 2 | 1 | Claude Marketplace at 2,000+ connectors and plugins, submission portal open with security review — supply density well above the 950+ assumed in the first round [M3 / protocol tracker 2026-11][A] |
| A6 | Timing | 2 | 3 | OpenA2A AIP/ATP drafts and two IETF drafts appear; the cross-platform identity layer moves from blank to early standardization [M4 2026-11][B] |

### Itemized Evidence (scoring basis)

**A2 AI-visibility diagnostics & GEO optimization (total 19, the only one above the line)**

- Timing 5: AI referral traffic and commercial value are scaling together — Adobe September: traffic +71% YoY, conversion +90%, RPV +83%, with Thanksgiving/Black Friday/Cyber Monday projected +159%/+95%/+88% [M2 2026-11][A]; Google Merchant Center officially provides an AI share-of-voice panel (GA 2026-09-16), turning "AI visibility" into an operational metric that can be quoted [A]
- Demand 4: enterprise AI-visibility budgets are real and a GEO vendor ecosystem is forming [2026-08][C]; conversion premium and multi-engine shift evidenced [A/B]
- Competition (rev.) 2: GEO tools and agencies emerging fast (ProFound / Peec class); high competitive density
- Fit 4: citation-share measurement method is owned, same lineage as the main research line
- Speed 4: service model, can ramp quickly
- **Precondition**: promotion is confirmed only after the M2 first-round baseline (core 30 questions × 3 platforms × 7-day rolling) verifies that "citation-share measurement + optimization actions" is reproducible; the baseline has not run for 3 months, so run a reduced baseline first (6 questions × 3 platforms × 7 days)

**A5 ACP/UCP merchant admission & protocol integration (total 15; timing full marks, dragged down by fit and competition)**

- Timing 5: ACP / UCP both in production, merchants live (Etsy, Wayfair, Target, Walmart, Kate Spade, etc.); UCP admission moved from approval to Merchant Center self-service (US first, AU/CA 2027) [protocol tracker 2026-11][A/B]; in China, Doubao is now an independent transaction channel with a 9%–18% rate [A]
- Demand 3: platform-side integration cases are verifiable; direct paying cases for third-party integration services are unverified (maps to the D3 pre-study)
- Competition (rev.) 2: integrators / consultancies will crowd in, and platforms offer first-party tooling [A/B]
- Fit 2: S6 protocol and settlement-integration capability must be built from zero
- Speed 3: project-based; enterprise sales cycles are long

**A3 Highly cited vertical content assets (total 16; the only asset-type opportunity, high option value)**

- Timing 4: citations have a measurable "stable core" — citations lasting 8+ days return 96–99% of the time and half return within 3 days [M2 2026-11][B]; Google added an "official websites" section and moved inline links higher on 10-15 [A]; mechanics are still evolving, so no 5
- Demand 2: no direct paying case for asset monetization
- Competition (rev.) 3: vertical review sites already have incumbents (see domain categories in `../02-modules/domain-attribution.md`)
- Fit 5: asset-type, compounding, portable, naturally meshes with research capability (the 2026-08-16 note already flagged its option value)
- Speed 2: long asset-building cycle

**A4 MCP server development & directory operations (total 13; downgraded to watch)**

- Timing 4: Claude Marketplace at 2,000+ connectors and plugins, plugin submission portal with security review (2026-10-01), MCP Apps, Tasks primitive moving into production iteration [M3 / protocol tracker 2026-11][A]
- Demand 3: brands paying to enter agent directories has appeared (Snipp, no platform fee) [B]; paying cases for MCP development services remain few
- Competition (rev.) 1: 2,000+ entries in the directory with official review, plus third-party registries — new entrants struggle for exposure [A]; first round scored 2 against 950+, review cuts to 1
- Fit 2: S5 development and directory-operations capability must be built from zero
- Speed 3: service plus directory operations; moderate

**A1 AI entity-recognition audit & fix (total 14)**

- Timing 2: the M1 protocol is frozen but the first-round baseline has not run; no recognition-accuracy data; the only indirect signal is enterprise AI-visibility budgets [M2][A]
- Demand 2: no paying case for "entity-recognition fix"; the GEO ecosystem is an adjacent demand [C]
- Competition (rev.) 4: mature supply dedicated to entity-recognition fix is rare
- Fit 3: same lineage as the M1 method, but S1/S3 capabilities remain to be built
- Speed 3: service model; demand unverified

**A6 Agent-channel trust & fulfillment consulting (total 14; early-stage, high option value)**

- Timing 3: trust infrastructure is moving from "gap only" to "early standardization" — OpenA2A AIP/ATP drafts (2026-09) and two IETF drafts; the x402 lifecycle FSM draft covers refunds and delegation for the first time [M4 / protocol tracker 2026-11][B]; no commercial products yet, still early
- Demand 2: no paying case
- Competition (rev.) 5: almost no mature supply
- Fit 3: builds on M4 research, consulting form
- Speed 1: 12+ months

### Review Conclusions (2026-11-07)

- **A2 remains the only opportunity above the "committed investment" line** (19, +1 vs the first round): timing rose to 5 because Adobe's September figures hit year-highs on all three metrics and Google officially opened AI share of voice; but the promotion condition (method reproducibility) has gone unverified for 3 months — **run the reduced baseline rather than waiting indefinitely for the full one**
- **A3 rises to 16** and stays second: the stable core of citations (96–99% return for 8-day-plus citations) and Google's "official websites" section give owned-content assets a measurable long-term return rationale for the first time, but monetization is still slow (2), so it remains an asset-type option
- **A4 falls from 14 to 13**: Claude Marketplace supply grew from 950+ to 2,000+ with official review, so the directory dividend window has essentially closed — downgraded to watch
- **A5 holds at 15**: timing at full marks (UCP self-service + Doubao independent channel), but fit (protocol integration from zero) and demand (third-party integration paying cases) remain weak; split into two independent decisions by market (US / China), matching D3
- **A6 rises to 14**: trust standards moved from blank to draft stage, but no commercial supply yet — long-term option
- **A1 holds at 14**: heavily overlaps A2; if A2 is funded, A1 folds in rather than standing alone
- No opportunity reaches the "≤ 12 drop" line; no drop action this period; trade-off recommendations go to D1 for researcher confirmation

## Initial Notes (2026-08-16, retained)

- A1/A2 map to M1/M2; enterprise AI-visibility budgets have appeared (a GEO vendor ecosystem is forming) [2026-08][C], but Chinese-market maturity is unknown — exactly what Phase 1 answers
- A5 has the strongest timing evidence (ACP/UCP in production [A/B]) but admission and engineering thresholds, plus domestic adaptation, are unverified; maps to decision D3
- A3 is the only asset-type opportunity (compounding, portable, independent of billable hours) and fits research capability naturally; give its option value extra weight when scoring

## Linkage to Decisions

The first-round scoring is complete (2026-10-08), triggering the pre-review of decision D1 (first commercialization entry point); A5's trade-off is bound to decision D3. On completing or materially changing scores, open a review item on `../00-management/decision-board.md`; dropped opportunities are archived on the board with reasons to avoid re-evaluation loops.