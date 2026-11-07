# Monitoring Source List

> Last updated: 2026-11-07 | Usage: weekly sweep (~30 min); write valuable updates into the relevant module document and log one research-log line; delete dead sources without ceremony. Resolve "to verify" items into regular entries once confirmed.

## Official Protocols and Specs (low frequency; major changes trigger the decision board directly)

| Object | Channel | Watch for | Priority | Note |
|---|---|---|---|---|
| MCP spec & ecosystem | modelcontextprotocol.io, GitHub repo, blog.modelcontextprotocol.io | Spec versions, registry policy changes | High | Current spec 2026-07-28; no new spec release this period (10-08 → 11-07) [2026-11][A]; Roadmap updated 2026-08-22 (identity and message-primitive direction) [2026-09][A] |
| ACP (Agentic Commerce Protocol) | agenticcommerce.dev, Stripe official docs & newsroom | Merchant admission, category expansion, machine payments, spec version | High | Official spec home verified (agenticcommerce.dev) [2026-11][A]; Stripe docs list Stripe, OpenAI, and Meta as co-creators, spec directories `spec/2026-04-*` [2026-11][A]; ACS now integrated into Google (AI Mode / Gemini) [2026-09][A] |
| UCP (Universal Commerce Protocol) | ucp.dev, GitHub releases (Universal-Commerce-Protocol/ucp), Google Merchant Center help | Camp differences vs ACP; vertical expansion; merchant onboarding capabilities and regional sequencing | High | Current version v2026-08-25; Merchant Center UCP hub rolling out in the US (cart transfer / native checkout / identity linking), AU/CA expected 2027 [2026-10][B]; Lodging TC formed 2026-08-11 |
| x402 | x402.org, Fireblocks / agenteconomy.to data, IETF drafts | Agent-native payment adoption, governance and identity | Medium | Reading point changed: the site's rolling 30-day figure disagrees with third-party tracking, so use Fireblocks/agenteconomy.to monthly data plus membership/governance announcements [2026-11][A/B]; October 2026 saw 5.1M transactions / about $274K; 196M / $42M cumulative through 11-01 |
| llms.txt | llmstxt.org | Adoption and platform attitudes | Medium | Verdict settled (M1-RQ3 complete) [2026-10][B]; no new platform statements this period — now a low-frequency watch item |

## Platform Updates (AI search, agent products, directory policy)

| Object | Watch for | Priority | Note |
|---|---|---|
| OpenAI (ChatGPT search / app directory / in-app commerce / **ads**) | Directory admission, recommendation logic, ACP integration, **ChatGPT Ads availability and formats** | High | ChatGPT Ads expanded to 26 countries/regions (2026-10-21) and a multi-image format beta launched (2026-10-26) [A] — paid placement now in scope |
| Anthropic (Claude / MCP ecosystem / Marketplace) | Tool-ecosystem policy, directory size and listing rules, plugin submission and security review | High | Claude Marketplace opened 2026-09-23 with 2,000+ connectors and plugins; submission portal opened 2026-10-01 with security scanning [A] |
| Google (AI Overviews / AI Mode / UCP / Merchant Center) | Coverage changes, official statements on citation rules and presentation, **AI performance insights and share-of-voice metrics** | High | 2026-10-15 update raises inline links and their position (presentation only, not selection) [A]; Merchant Center AI performance insights GA 2026-09-16 (US/AU/CA/IN/NZ) [A] |
| Perplexity | Citation mechanics, merchant programs, commission terms | Medium | No new public merchant-policy terms this period — kept on watch (gap) |
| Domestic: Doubao, Yuanbao, Wenxin, Tongyi (Qwen), Kimi | Agent product forms, shopping/tool entry points, **independent transaction channels and take rates**, Chinese citation-source traits | High (M2-RQ5 / H7) | Doubao has charged an independent 9%–18% rate since 2026-08-10 (Lodging 12% vs 8% main channel) and Douyin Shop reports Doubao orders/GMV separately from 2026-07-15 [A/B]; Qwen launched an office e-commerce Agent in 2026-10 and "双11帮我挑" for Double 11 [B] |

## Research and Data (academic + vendor research)

| Object | Watch for | Priority | Note |
|---|---|---|
| arxiv GEO / LLM-citation track (incl. 2604.25707 citation-absorption framework) | New measurement methods, benchmark datasets | High | New papers this period are logged in the next row |
| arxiv GEO methodology tracking: 2603.08924 (measurement uncertainty), 2605.29107 (rank-manipulation benchmark), 2607.14035 (survey) and follow-ups | Method updates, metric-hierarchy evolution | High | New: 2610.24081 (query location changes citations), 2610.15033 (content/retrieval/model-knowledge factors), 2611.01126 LIVE-GEO (in-the-wild persistence), 2609.40069 (trajectory-level measurement) [B] |
| geo-citation-lab dataset (github.com/yaojingang/geo-citation-lab) | Public dataset and replication-asset updates | Medium | No updates this period (gap) |
| Princeton GEO team follow-ups (GEO-Bench series) | Method updates | Medium | No new benchmark this period |
| Ahrefs, Semrush, Profound, Peec and other GEO vendor research | Industry data (citation-share distributions, citation stability, mention-visibility correlations), tool capabilities | High | Ahrefs supplied the month's methodological anchors: citation stability (37,500 citations / 5 platforms / 20 days) and mention-type correlation (260M prompts) [B] |
| Adobe Analytics, HUMAN Security and other traffic data sources | Monthly/quarterly updates on AI-referral traffic, conversion and revenue quality, agent-browser behavior | High | Adobe moved to a monthly AI Traffic Trends cadence (September reading published 2026-10-29) [A]; HUMAN had no update this period (gap) |
| Stripe engineering blog and official docs | Agentic-commerce production lessons, failure modes, protocol versions | High | Docs at `Stripe-Version: 2026-10-28`, showing ACS is still iterating fast [A] |
| Fireblocks / agenteconomy.to x402 operating data | Real machine-payment transaction counts and value | Medium | New primary reading point for x402 this period [B] |

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

## Scan Record (Monthly)

| Period | Coverage | Items logged | Dead sources / gaps |
|---|---|---|---|
| 2026-10-08 → 2026-11-07 | 5 official protocols, 5 platform classes, 8 research/data classes | 6 A-grade, 10 B-grade (details in M1–M4 conclusions and the research log) | HUMAN quarterly update missing; no new Perplexity merchant terms; no geo-citation-lab update; x402.org rolling-30-day figure proved inaccurate and was replaced by third-party data |
| 2026-09-01 → 2026-10-08 | Same scope | 16 A/B items | Details in the 2026-10-08 entries of `../00-management/research-log.md` |
