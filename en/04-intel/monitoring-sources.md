# Monitoring Source List

> Last updated: 2026-09-01 | Usage: weekly sweep (~30 min); write valuable updates into the relevant module document and log one research-log line; delete dead sources without ceremony. Resolve "to verify" items into regular entries once confirmed.

## Official Protocols and Specs (low frequency; major changes trigger the decision board directly)

| Object | Channel | Watch for | Priority | Note |
|---|---|---|---|---|
| MCP spec & ecosystem | modelcontextprotocol.io, GitHub repo, blog.modelcontextprotocol.io | Spec versions, registry policy changes | High | Current spec 2026-07-28; Roadmap updated 2026-08-22 (identity and message-primitive direction) [2026-09][A] |
| ACP (Agentic Commerce Protocol) | Stripe official blog & docs, Sessions newsroom | Merchant admission, category expansion, machine payments [2026-08][A] | High | ACS now integrated into Google (AI Mode / Gemini) [2026-09][A]; official spec home to verify |
| UCP (Universal Commerce Protocol) | ucp.dev, GitHub releases (Universal-Commerce-Protocol/ucp) | Camp differences vs ACP; vertical expansion and TC updates | High | Official home verified [2026-09][A]; current version v2026-08-25; Lodging TC formed 2026-08-11 |
| x402 | x402.org | Agent-native payment adoption | Medium | Linux Foundation governance (2026-07-14); rolling 30-day ops data on the site is the fixed reading point [2026-09][A] |
| llms.txt | llmstxt.org | Adoption and platform attitudes | Medium | Contested; M1-RQ3: Top-10K adoption ~5.6%; Google's official clarification that it is not a ranking factor (2026-07) [2026-09][B] |

## Platform Updates (AI search, agent products, directory policy)

| Object | Watch for | Priority |
|---|---|---|
| OpenAI (ChatGPT search / app directory / in-app commerce) | Directory admission, recommendation logic, ACP integration | High |
| Anthropic (Claude / MCP ecosystem) | Tool-ecosystem policy, MCP directory data | High |
| Google (AI Overviews / AI Mode / UCP) | Coverage changes, official statements on citation rules | High |
| Perplexity | Citation mechanics, merchant programs | Medium |
| Domestic: Doubao, Yuanbao, Wenxin, Tongyi, Kimi | Agent product forms, shopping/tool entry points, Chinese citation-source traits | High (M2-RQ5) |

## Research and Data (academic + vendor research)

| Object | Watch for | Priority |
|---|---|---|
| arxiv GEO / LLM-citation track (incl. 2604.25707 citation-absorption framework) | New measurement methods, benchmark datasets | High |
| arxiv GEO methodology tracking: 2603.08924 (measurement uncertainty), 2605.29107 (rank-manipulation benchmark), 2607.14035 (survey) and follow-ups | Method updates, metric-hierarchy evolution | High |
| geo-citation-lab dataset (github.com/yaojingang/geo-citation-lab) | Public dataset and replication-asset updates | Medium |
| Princeton GEO team follow-ups (GEO-Bench series) | Method updates | Medium |
| Ahrefs, Semrush, Profound, Peec and other GEO vendor research | Industry data (citation-share distributions, crawler-traffic trends), tool capabilities | Medium |
| Adobe Analytics, HUMAN Security and other traffic data sources | Quarterly updates on AI-referral traffic and agent-browser behavior | Medium |
| Stripe engineering blog | Agentic-commerce production lessons and failure modes [2026-08][A] | High |

## Communities and Cases

| Object | Watch for | Priority |
|---|---|---|
| Hacker News | Agent-commerce, MCP, protocol discussions and first-hand cases | Medium |
| Reddit (r/LLMAgents, r/SEO and related) | Practitioner feedback | Medium |
| X / Jike accounts covering agentic commerce | Early signals | Low |

## Cadence

- Weekly: platform updates + communities (30 min; record only what affects research)
- Monthly: protocols & specs + vendor research, batched with the monthly panel retest on the same day
- Trigger: any major protocol merchant-policy change → register a review of the matching item on `../00-management/decision-board.md`
