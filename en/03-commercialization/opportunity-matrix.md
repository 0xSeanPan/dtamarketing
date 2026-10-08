# Opportunity Matrix

> Last updated: 2026-10-08 | Usage: candidate opportunities are registered, scored, and traded off here. Scores must cite conclusions from the module documents as evidence; dimensions lacking evidence are marked "tbd," never guessed. Review cadence: quarterly.

## Scoring Dimensions (each 1–5)

| Dimension | Question | 1 means | 5 means |
|---|---|---|---|
| Timing maturity | Are protocols, platforms, client awareness ready | Concept stage; no client budget | Production ramp-up; budgets real |
| Demand authenticity | Are companies paying for this problem today | No paying cases | Multiple verifiable paying cases |
| Competitive density (reverse-scored) | How crowded and strong is the supply side | Incumbents and mature tools everywhere | Almost no mature supply |
| Personal fit | Match with own skills, resources, positioning | Multiple capabilities to build from zero | Direct reuse of existing capabilities |
| Monetization speed | Distance from investment to first revenue | 12+ months | Within 3 months |

Composite = sum of five (competitive density reverse-scored: fewer competitors, higher score). ≥ 18 enters "committed investment" candidates; ≤ 12 is dropped; 13–17 is watchlist or a small-cost experiment.

## First-Round Scores (2026-10-08)

> Basis: evidence landed in the 2026-10 monthly cycle (M1–M4 conclusion sections, `../02-modules/protocol-tracker.md`, plus third-party data from Adobe / Ahrefs / arxiv). Convention: **high scores all cite existing evidence**; low scores rest on the observable fact that verifiable paying cases or data are absent (the 1-point anchor of each dimension), not on subjective judgment. Personal fit refers to `skill-portfolio.md` (capabilities still to be assessed, so scored conservatively by proximity to the main research line).

| ID | Opportunity | Timing | Demand | Competition (rev.) | Fit | Speed | Total | Status |
|---|---|---|---|---|---|---|---|---|
| A1 | AI entity-recognition audit & fix service | 2 | 2 | 4 | 3 | 3 | 14 | Watch |
| A2 | AI-visibility diagnostics & GEO optimization service | 4 | 4 | 2 | 4 | 4 | 18 | Committed-investment candidate (conditional) |
| A3 | Highly cited vertical content assets | 3 | 2 | 3 | 5 | 2 | 15 | Watch (high option value) |
| A4 | MCP server development & directory operations service | 4 | 3 | 2 | 2 | 3 | 14 | Watch / small-cost experiment |
| A5 | ACP/UCP merchant admission & protocol-integration service | 5 | 3 | 2 | 2 | 3 | 15 | Watch / small-cost experiment |
| A6 | Agent-channel trust & fulfillment consulting | 2 | 2 | 5 | 3 | 1 | 13 | Watch |

### Itemized Evidence (scoring basis)

**A2 AI-visibility diagnostics & GEO optimization (total 18, the only one above the line)**

- Timing 4: AI referral traffic has scaled — Adobe July 2026 +62% YoY, cumulative +1,219% from Oct 2024 to Jul 2026, AI-visitor conversion +60% [M2 2026-10][A]; GEO methodology mature (GEO-Bench, three 2026 arxiv papers) [A/B]
- Demand 4: enterprise AI-visibility budgets are real and a GEO vendor ecosystem is forming [2026-08][C]; conversion premium and multi-engine shift evidenced [A/B]
- Competition (rev.) 2: GEO tools and agencies emerging fast (ProFound / Peec class); high competitive density
- Fit 4: citation-share measurement method is owned, same lineage as the main research line
- Speed 4: service model, can ramp quickly
- **Precondition**: confirms promotion only after the M2 first-round baseline (core 30 questions × 3 platforms) verifies that "citation-share measurement + optimization actions" is reproducible

**A5 ACP/UCP merchant admission & protocol integration (total 15; timing full marks, dragged down by fit and competition)**

- Timing 5: ACP / UCP both in production, merchants live (Etsy, Wayfair, Kate Spade, etc.); UCP admission window open (waitlist + Google review) [protocol tracker 2026-10][A]
- Demand 3: platform-side integration cases are verifiable; direct paying cases for third-party integration services are unverified (maps to the D3 pre-study)
- Competition (rev.) 2: integrators / consultancies will crowd in, and platforms offer first-party tooling [A/B]
- Fit 2: S6 protocol and settlement-integration capability must be built from zero
- Speed 3: project-based; enterprise sales cycles are long

**A3 Highly cited vertical content assets (total 15; the only asset-type opportunity, high option value)**

- Timing 3: content assets can be built now, but citation mechanics are still evolving fast [M2 2026-10][A]
- Demand 2: no direct paying case for asset monetization
- Competition (rev.) 3: vertical review sites already have incumbents (see domain categories in `../02-modules/domain-attribution.md`)
- Fit 5: asset-type, compounding, portable, naturally meshes with research capability (the 2026-08-16 note already flagged its option value)
- Speed 2: long asset-building cycle

**A4 MCP server development & directory operations (total 14)**

- Timing 4: Claude Marketplace opened, connector directory 950+ servers, MCP Apps, Tasks primitive moving into production iteration [M3 / protocol tracker 2026-10][A]
- Demand 3: brands paying to enter agent directories has appeared (Snipp, no platform fee) [B]; paying cases for MCP development services remain few
- Competition (rev.) 2: 950+ servers in the directory plus third-party registries; dense supply [A]
- Fit 2: S5 development and directory-operations capability must be built from zero
- Speed 3: service plus directory operations; moderate

**A1 AI entity-recognition audit & fix (total 14)**

- Timing 2: the M1 protocol is frozen but the first-round baseline has not run; no recognition-accuracy data; the only indirect signal is enterprise AI-visibility budgets [M2][A]
- Demand 2: no paying case for "entity-recognition fix"; the GEO ecosystem is an adjacent demand [C]
- Competition (rev.) 4: mature supply dedicated to entity-recognition fix is rare
- Fit 3: same lineage as the M1 method, but S1/S3 capabilities remain to be built
- Speed 3: service model; demand unverified

**A6 Agent-channel trust & fulfillment consulting (total 13; early-stage, high option value)**

- Timing 2: the trust-infrastructure gap has only just surfaced (Cloudflare Wallets identity-spoofing dispute) [M4 / protocol tracker 2026-10][B]; the market is not yet formed
- Demand 2: no paying case
- Competition (rev.) 5: almost no mature supply
- Fit 3: builds on M4 research, consulting form
- Speed 1: 12+ months

### First-Round Conclusions

- **A2 is the only opportunity above the "committed investment" line**, but its promotion is conditional — it depends on the M2 first-round baseline verifying reproducibility; no investment starts before that baseline runs
- **A5 has the strongest timing (5)** yet is pressed down to 15 by personal fit (protocol-integration capability to be built from zero) and competitive density — a "timing right, capability not yet there" case, tied directly to the D3 pre-study
- **A3 is the only asset-type opportunity**; middling total but the highest option value (compounding, portable, independent of billable hours), kept under extra attention per the 2026-08-16 note
- **A1 / A4 / A6 sit in the 13–14 band**, all watchlist / small-cost experiments; A1 overlaps heavily with A2, so if A2 is funded, A1 folds in as a sub-capability rather than a standalone item
- No opportunity touches the "≤ 12 drop" line; A6 has the slowest monetization (1) but the emptiest competition (5), retained as a long-term option

## Initial Notes (2026-08-16, retained)

- A1/A2 map to M1/M2; enterprise AI-visibility budgets have appeared (a GEO vendor ecosystem is forming) [2026-08][C], but Chinese-market maturity is unknown — exactly what Phase 1 answers
- A5 has the strongest timing evidence (ACP/UCP in production [A/B]) but admission and engineering thresholds, plus domestic adaptation, are unverified; maps to decision D3
- A3 is the only asset-type opportunity (compounding, portable, independent of billable hours) and fits research capability naturally; give its option value extra weight when scoring

## Linkage to Decisions

The first-round scoring is complete (2026-10-08), triggering the pre-review of decision D1 (first commercialization entry point); A5's trade-off is bound to decision D3. On completing or materially changing scores, open a review item on `../00-management/decision-board.md`; dropped opportunities are archived on the board with reasons to avoid re-evaluation loops.