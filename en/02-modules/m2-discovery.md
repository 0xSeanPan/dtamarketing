# M2 Discovery

> Status: protocol frozen (`panel-question-set.md` v1.0); first baseline pending execution (carried to 2026-10); domain attribution table v1.0 established | Last updated: 2026-10-08 | Framework: `../01-framework/research-framework.md`

## 1. Definition

When a user retrieves information through an agent, the target entity enters the agent's candidate set and appears in the final answer. Discovery parallels SEO/SEM in classic marketing, but the allocation mechanism differs: search grants rank and clicks; AI answers grant mentions and citations — and the answer often dissolves the query, leaving no click to rely on.

State of the field: an academic framework already exists. The 2024 GEO paper (Princeton, Georgia Tech, Allen Institute, IIT Delhi) introduced GEO-Bench (10,000 queries × 25 domains) [2026-08][B]; a 2026 framework separates "citation selection" from "citation absorption," distinguishing being listed as a source from content actually entering the answer [2026-08][B] arxiv 2604.25707. Three methodological additions (2026-09 scan): AI-visibility measurement requires repeated sampling and confidence intervals rather than single-run point estimates (arxiv 2603.08924 [A]); a unified benchmark for GEO rank-manipulation attacks (arxiv 2605.29107 [A]; black-box content rewrites can match gradient attacks); and a systematic survey establishing the three-tier metric hierarchy "mention / citation / absorption" (arxiv 2607.14035 [A]). This module builds on that work and focuses on empirical measurement in Chinese-language and own-category contexts.

## 2. Research Questions

- M2-RQ1: Across a fixed set of category questions, how is citation share distributed on each AI platform (ChatGPT, Perplexity, Gemini, AI Overviews, Doubao/Yuanbao and other Chinese entries)? How concentrated is it?
- M2-RQ2: What do cited sources share — domain authority, chunkable structure, data and provenance, community signals (Reddit/Zhihu-style discussion), freshness? Google states no special markup unlocks AI Overviews and inclusion rests on content quality [2026-08][B]; re-verify against the original
- M2-RQ3: How does agent-crawler traffic (GPTBot, ClaudeBot, PerplexityBot, Google-Extended) correlate with AI citations? What is the framework for the robots.txt allow/block trade-off?
- M2-RQ4: How does classic SEO rank correlate with AI citation — does high rank imply high citation? What explains deviations (small sites cited, big sites ignored)?
- M2-RQ5: Chinese-language specifics — the Chinese corpus ecology, visibility of closed-platform content (WeChat Official Accounts, Xiaohongshu) to agents, citation-source differences between domestic and international models
- M2-RQ6: Paid routes into agent channels (platform ads, sponsored placements, directory listings) — current state and cost-effectiveness

## 3. Method and Experiment Protocol (draft)

Prompt-panel testing: construct 50–100 genuine purchase-intent questions for the target category (layered informational / comparative / transactional), executed monthly on a fixed platform set. Track: mention rate (does the answer name the entity), citation share (citations of the entity / all citations), cited-domain distribution, answer position (first recommendation / mixed / mention only). Follow the two-stage framework of arxiv 2604.25707 and separately score "citation absorption" — whether language, data, or structure actually enter the answer. Variance control and stability reporting follow arxiv 2603.08924. Execution details frozen in `panel-question-set.md` (category: robot vacuums; 60 questions; statistical definitions and change control); the domain-attribution prerequisite for citation-share computation is established in `domain-attribution.md` (v1.0: T1–T9 official sites / platform commerce domains / vertical review sites + attribution rules).

Crawler-log analysis: for owned or sample sites, track agent-crawler request volume and UA mix monthly, and correlate with panel results.

## 4. Metrics

| Metric | Definition | Collection |
|---|---|---|
| Mention rate | Share of questions naming the target entity | Panel testing |
| Citation share | Entity citations / all citations for the question | Panel testing |
| Citation absorption rate | Share of citations whose content substantively enters the answer | Two-stage scoring |
| Domain concentration | Top-10 cited domains as a share of all citations | Panel testing |
| Agent-crawler traffic | Request counts and growth per agent crawler | Site logs |

## 5. Current Conclusions

- [2026-09][A] Adobe Analytics (130+ top North American retailers, 1T+ visits): AI-referral traffic to US retail sites grew +393% YoY in Q1 2026; AI-visitor conversion ran 42% higher than non-AI (a record, 2026-03) — the AI channel has moved from directional trend to scaled fact
- [2026-09][B] Ahrefs: only 38% of AI Overview citations come from Google's top-10 organic results (76% in mid-2025); 80% of LLM citations fall outside Google's top 100 — the SEO-rank-to-AI-citation correlation keeps weakening; first quantitative anchor for M2-RQ4
- [2026-09][B] Goodie panel (41 B2B brand sites, 2025.08–2026.05): ChatGPT's share of B2B AI referrals fell 89.1%→62.6%; Claude 1.4%→18.5%, Gemini 2.4%→10.6%, Perplexity 3.1%→7.3% — AI referrals are multi-engine; single-platform optimization strategies depreciate faster
- [2026-09][A] arxiv 2603.08924: single-run AI-visibility point estimates are sample estimates; repeated sampling plus confidence intervals are the minimum methodological bar; content changes can move citation share materially — this module's panel protocol is designed accordingly (variance sample of 6 questions × 3 runs)
- [2026-09][A] arxiv 2604.25707 (geo-citation-lab, 602 prompts, 21,143 citations): citation behavior diverges by platform — Perplexity and Google cite broadly, ChatGPT cites fewer but with higher average influence — a reproducible reference gradient that the Chinese-language panel results will be compared against
- [2026-10][A] Adobe (2026-08-19 report): AI-referral traffic to US retail sites +62% YoY in July 2026 (cumulative +1,219% from Oct 2024 through July); AI-visitor conversion ran 60% higher than non-AI (11th consecutive month); financial-services AI referrals bounced 27% less — the AI channel has upgraded from growth engine to a standing traffic component
- [2026-10][B] Adobe: AI-referral multi-engining accelerated Q1→Q2 2026 — ChatGPT lost its top-referrer status at 122 retailers, Gemini doubled 16→32, Claude rose — single-platform strategies keep depreciating; empirical support for the M2-RQ1 platform-matrix requirement
- [2026-10][B] Naming-effect quantification (ppc.land analysis of 27 ChatGPT sessions): in 21 sessions the first search named a brand the user never typed; named brands reached the answer 68.9% of the time vs 2.1% for unnamed ones; only 3.1% of 3,554 retrieved pages were cited — "prior naming into the answer" and "cited after retrieval" are two nearly independent gates; brand-mention strategy (content/community/directory) moves up in priority
- [2026-10][B] Google AI Overviews citation-mechanism review (closing M2-RQ2 / H6): AI Overviews pulls from the regular Search index; indexability plus Featured-Snippet eligibility is the precondition (direct answer in the first sentence of a section, 40–60 words, no setup paragraph); no special markup file or schema unlocks it; FAQPage/HowTo/Article/Product/Organization (sameAs/knowsAbout)/Person schema correlates weakly (marginal parsing help); roughly 15 sources cited per result — H6's directional support solidifies; content structure and entity consistency beat speculative markup
- [2026-10][B] GEO methodology, three new works: arxiv 2604.19113 FeatGEO (feature-level multi-objective optimization; document-level content properties beat isolated lexical edits), 2609.27845 QI-GEO (query-implied intent approximation; +15.9% objective), 2604.19516 MAGEO (multi-agent reusable strategies) — GEO optimization shifts from "rewriting text" to "restructuring document features and intent coverage"; updated methodological anchors for an owned-content business

## 6. Link to Commercialization

Citation share is this generation's "market share." If M2 yields a reproducible measurement-and-improvement method, it supports two commercialization paths: client-facing "AI-visibility diagnostics and optimization" services, and building owned vertical content assets (a highly cited source is itself an asset). Maps to opportunities A2 and A3 in `../03-commercialization/opportunity-matrix.md`.

## 7. Next Steps

1. Execute the first baseline: core 30 questions × 3 platforms (ChatGPT, Perplexity, Doubao) + variance sample of 6 questions × 3 runs, per `panel-question-set.md` Section 4 (carried to 2026-10)
2. Domain attribution table established (`domain-attribution.md` v1.0, 2026-10-08): T1–T9 official sites / platform commerce domains / vertical review sites + attribution rules; next, review quarterly and fold in first-round unattributed domains
3. Set up the monthly record and summary templates (entity × layer × platform matrix) — the first item of each subsequent monthly cycle
4. Add a naming-effect check to the panel: in the 2026-10 first round, test "user names the brand first" vs "no brand named" question pairs to see whether the ppc.land 68.9% vs 2.1% gap reproduces on Chinese platforms
