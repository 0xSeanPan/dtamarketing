# M2 Discovery

> Status: not started (second priority in Phase 1) | Last updated: 2026-08-16 | Framework: `../01-framework/research-framework.md`

## 1. Definition

When a user retrieves information through an agent, the target entity enters the agent's candidate set and appears in the final answer. Discovery parallels SEO/SEM in classic marketing, but the allocation mechanism differs: search grants rank and clicks; AI answers grant mentions and citations — and the answer often dissolves the query, leaving no click to rely on.

State of the field: an academic framework already exists. The 2024 GEO paper (Princeton, Georgia Tech, Allen Institute, IIT Delhi) introduced GEO-Bench (10,000 queries × 25 domains) [2026-08][B]; a 2026 framework separates "citation selection" from "citation absorption," distinguishing being listed as a source from content actually entering the answer [2026-08][B] arxiv 2604.25707. This module builds on that work and focuses on empirical measurement in Chinese-language and own-category contexts.

## 2. Research Questions

- M2-RQ1: Across a fixed set of category questions, how is citation share distributed on each AI platform (ChatGPT, Perplexity, Gemini, AI Overviews, Doubao/Yuanbao and other Chinese entries)? How concentrated is it?
- M2-RQ2: What do cited sources share — domain authority, chunkable structure, data and provenance, community signals (Reddit/Zhihu-style discussion), freshness? Google states no special markup unlocks AI Overviews and inclusion rests on content quality [2026-08][B]; re-verify against the original
- M2-RQ3: How does agent-crawler traffic (GPTBot, ClaudeBot, PerplexityBot, Google-Extended) correlate with AI citations? What is the framework for the robots.txt allow/block trade-off?
- M2-RQ4: How does classic SEO rank correlate with AI citation — does high rank imply high citation? What explains deviations (small sites cited, big sites ignored)?
- M2-RQ5: Chinese-language specifics — the Chinese corpus ecology, visibility of closed-platform content (WeChat Official Accounts, Xiaohongshu) to agents, citation-source differences between domestic and international models
- M2-RQ6: Paid routes into agent channels (platform ads, sponsored placements, directory listings) — current state and cost-effectiveness

## 3. Method and Experiment Protocol (draft)

Prompt-panel testing: construct 50–100 genuine purchase-intent questions for the target category (layered informational / comparative / transactional), executed monthly on a fixed platform set. Track: mention rate (does the answer name the entity), citation share (citations of the entity / all citations), cited-domain distribution, answer position (first recommendation / mixed / mention only). Follow the two-stage framework of arxiv 2604.25707 and separately score "citation absorption" — whether language, data, or structure actually enter the answer.

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

To be researched.

## 6. Link to Commercialization

Citation share is this generation's "market share." If M2 yields a reproducible measurement-and-improvement method, it supports two commercialization paths: client-facing "AI-visibility diagnostics and optimization" services, and building owned vertical content assets (a highly cited source is itself an asset). Maps to opportunities A2 and A3 in `../03-commercialization/opportunity-matrix.md`.

## 7. Next Steps

1. Choose the first study category; build the layered question set as `panel-question-set.md` in this directory
2. Set up the monthly panel record (platform × question × citation); first round measures the distribution of 5 leading entities
3. Append GEO academic tracking items (arxiv, follow-ups to GEO-Bench) to `../04-intel/monitoring-sources.md`
