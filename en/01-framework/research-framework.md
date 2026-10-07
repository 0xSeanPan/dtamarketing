# Research Framework: From the Attention Economy to the Agent Economy

> Last updated: 2026-08-16 | Status: v1.0 (Phase 0 deliverable; revise on major paradigm shifts)

## 1. Core Thesis

Human purchase decisions are shaped by attention-allocation mechanisms: feeds distribute by dwell time, search ranks by click behavior, brands build associations through repeated exposure. The marketing discipline built over the past three decades is, in essence, "systematic intervention in human attention and emotion."

AI agents change that premise. When a user delegates "find a product, compare prices, place the order" to an agent:

- Information access shifts from "being pushed to" to "retrieving and invoking tools," so impressions no longer equate to mind share
- Decisions rest on facts in the corpus, structured data, ratings, and fulfillment records rather than emotion and brand association
- The persuasion target splits into two layers: the principal who sets the objective function, and the model that executes the decision

"Agent marketing" is therefore not a continuation of channel optimization but a switch of marketing's target: from cultivating "human attention assets" to cultivating "discoverability and trustworthiness inside the model's decision chain."

## 2. Paradigm Comparison

| Dimension | Attention economy (persuading humans) | Agent economy (persuading the agentic decision chain) |
|---|---|---|
| Decision maker | The human mind: bounded rationality, emotion-driven | Model + the principal's objective function |
| Information access | Pushed: feeds, search rankings | Pull: RAG retrieval, tool invocation, protocol directories |
| Influence mechanism | Repeated exposure, storytelling, social proof | Factual corpus, machine readability, ratings, fulfillment records |
| Content preference | Simple, visually striking, emotionally resonant | Accurate, chunk-extractable, data-backed with provenance |
| Primary channels | Feeds, search, social media | AI-search answers, agent crawlers, MCP directories, protocol product listings |
| Conversion path | Click → landing page → copy-driven conversion | Cited / invoked → protocol-based ordering and settlement |
| Source of loyalty | Brand trust, habit | Fulfillment quality, SLAs, price stability, transaction records |
| Core metrics | Impressions, CTR, ROI | Recognition accuracy, citation share, invocation volume, repeat-invocation rate |

Key corollary: assets that are "ambiguous but moving" (brand stories, emotional value) lose weight in the agentic decision chain, while assets that are "precise and verifiable" (structured product data, third-party factual corpus, fulfillment records) gain weight. The principal is still human, so branding does not die — it retreats to the layer where principals set goals and whitelists.

## 3. The Agentic Chain

```
End user (intent & budget)
    |  delegation: objective function + constraints
    v
User agent (retrieve → evaluate → select → execute)
    |  relies on: training corpus / RAG sources / tool directories / protocol networks / fulfillment memory
    v
Your product (recognized → discovered → adopted → repurchased)
```

Marketing actions therefore distribute across three battlegrounds:

1. **Corpus layer** — the model's prior picture of the world comes from training and retrieval corpora; factual presence is built here
2. **Decision layer** — the signals an agent weighs inside a candidate set: structured data, ratings, price, invocability
3. **Protocol layer** — standardized transaction and trust: product listings, ordering, settlement, identity (ACP / UCP / x402)

## 4. The Agent Marketing Funnel (Main Line of Research)

| Stage | Definition | Core question | Keywords |
|---|---|---|---|
| M1 Recognition | The agent and its model accurately understand your entity, capabilities, prices, constraints | How far apart are the real you and the you inside the model | Machine readability, structured data, llms.txt, entity disambiguation |
| M2 Discovery | When a user searches via an agent, you enter the candidate set and the final answer | What determines your citation share | GEO, AEO, AI search, agent crawlers, citation share |
| M3 Adoption | The agent recommends you to the user, or invokes your tool to complete a task | Which variables sit in the agent's choice function | MCP, tool calls, API productization, protocol directories |
| M4 Repurchase | The agent (and its principal) form a durable transactional relationship with you | What constitutes machine loyalty | ACP, UCP, x402, fulfillment records, trust scores |

The four stages are strictly one-directional: misrecognition makes discovery meaningless (the agent cites a capability you do not have), absence from discovery removes any chance of adoption, and adoption below standard kills repurchase. Research order and baseline measurement therefore run M1 → M4.

## 5. Glossary and Terminology Notes

| Term | Meaning |
|---|---|
| GEO | Generative Engine Optimization — optimizing for citation by generative engines (AI search, AI overviews), aiming to be cited rather than ranked |
| AEO | Answer Engine Optimization — optimizing for answer engines (voice assistants, Q&A-style AI); increasingly interchangeable with GEO |
| Citation share / Share of Model | The share of standardized prompts in which an entity is mentioned or cited by AI answers — this era's analogue of market share |
| Agent crawler | Bots that crawl on behalf of models or AI platforms, e.g. GPTBot, ClaudeBot, PerplexityBot, Google-Extended |
| llms.txt | A site-level convention for offering LLM-friendly content summaries (proposed at llmstxt.org); adoption is contested — see M1 |
| MCP | Model Context Protocol — the tool-integration protocol originated by Anthropic, now a mainstream standard |
| A2A | Agent2Agent — protocol direction for agents discovering and collaborating with each other |
| ACP | Agentic Commerce Protocol — the agent-commerce protocol led by OpenAI and Stripe, spanning discovery, ordering, and payment; live in ChatGPT production [2026-08][A] Stripe official blog (stripe.com/blog/10-lessons) |
| UCP | Universal Commerce Protocol — the commerce protocol led by Google and Shopify; official site ucp.dev verified, current version v2026-08-25, expanding across verticals [2026-09][A] GitHub releases |
| x402 | The agent-native payment protocol by Coinbase, built on HTTP status code 402 |
| Machine loyalty | An agent's repeated selection of the same vendor, driven by fulfillment quality, price stability, trust scores, and organizational memory |

Terminology notes (why these words):

- **Attention economy** follows Herbert Simon's observation that "a wealth of information creates a poverty of attention" (1971) and Michael Goldhaber's coinage (1997); it is the standard term for the incumbent paradigm.
- **Principal** is borrowed from principal–agent theory in economics (Jensen & Meckling, 1976): the human or organization that sets the agent's objective function. Using it keeps the delegation relationship precise.
- **Recognition → Discovery → Adoption → Repurchase** deliberately mirrors the classic marketing funnel vocabulary (awareness → consideration → conversion → retention) so each stage maps onto a familiar discipline: recognition onto brand awareness, discovery onto SEO, adoption onto conversion optimization, repurchase onto retention.
- **Citation share** follows the generative-engine-optimization literature; **Share of Model** is the industry coinage (AI-visibility vendors such as Profound and Peec AI) retained for market-facing usage.
- **Agentic commerce** follows the usage of Stripe and OpenAI in their ACP announcements; it refers narrowly to commerce transacted by agents, not to AI in general.
- **Machine loyalty** is a working term coined in this project (Chinese: 机器忠诚度); flagged as such, to be replaced if an industry term consolidates.

## 6. Research Hypotheses (falsifiable; each is either upgraded to a conclusion or retired after testing)

- H1: Structured, data-backed, well-attributed content is cited by generative engines significantly more often than conventional marketing copy. Background: the 2024 GEO paper (Princeton, Georgia Tech, Allen Institute, IIT Delhi; GEO-Bench, 10,000 queries × 25 domains) reports that citations, quotations, and statistics raise visibility, while keyword stuffing is the worst strategy [2026-08][B]
- H2: The name and description quality of an MCP server materially affects its invocation rate (experiment to be designed)
- H3: AI-search citations concentrate heavily on a few high-authority knowledge and community sites (Wikipedia, Reddit, GitHub, vertical authorities); entering those sources is higher-leverage than on-site optimization. Directionally supported: Ahrefs data shows Trustpilot/G2 domains draw 3× more ChatGPT citations and Reddit/Quora presence lifts citation rates 4× [2026-09][B]; pending replication on our own panel
- H4: In agent channels, conversion decisions are far more sensitive to "transparent pricing + reliable fulfillment + structured comparability" than to brand and visual design (to be verified)
- H5: Mainstream platforms are forming agent-native app directories and product listings (MCP directories, in-ChatGPT commerce, Google AI Mode); early entrants enjoy a distribution window of roughly 12–24 months. Observational support: UCP's multi-vertical expansion, ACS reaching Google, and the Taobao catalog connecting to the Qwen app [2026-09][A]; Claude Marketplace opening, the ChatGPT plugin directory (Shoppable, Snipp listed), and Google UCP approval gating [2026-10][A/B] — directory density keeps rising and directories enter the platform-storefront phase; the window's start date awaits the M3 panel
- H6: Google states that no special markup or schema unlocks AI Overviews — inclusion rests on content quality and authority. Directionally supported: Google's 2026-07 clarification that llms.txt is not a ranking factor [2026-09][B]; Ahrefs shows only 38% of AI Overview citations come from the organic top 10 [2026-09][B]; citation-mechanism review (2026-10): AI Overviews pulls from the regular index, snippet eligibility is the precondition, schema is marginal, roughly 15 sources per result (see M2) [2026-10][B] — directional support solidifies; full adjudication pending our own panel
- H7: Chinese AI-shopping-guide channels will replicate the CPS affiliate-commission model — rates set first, renegotiated at scale (signal: Doubao × Douyin Laike operating a 12% standalone commission [2026-08][C]; contrast Perplexity's merchant program at 0%) — to be verified by monthly tracking of Chinese platforms' AI-guide commission terms (M3/M4)

## 7. Scope

**In scope**: B2C and B2B scenarios in which information access or transactions pass through an agent; how marketing actions distribute across the corpus, decision, and protocol layers; implications for personal business trade-offs, skill investment, and commercialization.

**Out of scope**: internal agent engineering (studied only to the depth that affects marketing decisions); general LLM benchmarks; growth tactics unrelated to the agent channel.

## 8. Relations to Other Documents

- Stage-by-stage expansion and research protocols: the `02-modules/` documents
- Phase plan and current progress: `00-management/roadmap.md`
- How verified hypotheses change business decisions: `00-management/decision-board.md` and `03-commercialization/`
