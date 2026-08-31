# M3 Adoption

> Status: not started (first priority in Phase 2; monthly protocol intel logged) | Last updated: 2026-09-01 | Framework: `../01-framework/research-framework.md`

## 1. Definition

The agent chooses you from the candidate set, along one of two paths. Recommendation path: the agent includes you in the answer it hands to the principal, and the human confirms. Invocation path: the agent uses your service directly through a tool call (MCP, API, function calling) without human intervention. The classic-marketing parallel is conversion optimization, but the conversion point moves upstream — from "persuasion on a landing page" to "comparison inside the agent's choice function."

State of the field: MCP has become a mainstream tool-integration ecosystem. On the transaction side, ACP (OpenAI + Stripe; live in ChatGPT production, with Etsy and URBN onboard) and UCP (Google + Shopify; production since January 2026) form two protocol camps [2026-08][A] Stripe official blog (stripe.com/blog/10-lessons) [2026-08][B] third-party documentation. "Being adopted" is thus shifting from an integration question to a protocol-positioning question.

## 2. Research Questions

- M3-RQ1: When an agent chooses among candidate tools or products, what are the decision variables — price, latency, success rate, description quality, ratings, brand priors, directory rank? How are they weighted?
- M3-RQ2: Which MCP servers (official and third-party registries) win installations and invocations? How do tool names, description phrasing, parameter design, and auth friction measurably matter?
- M3-RQ3: What are the admission criteria, ranking logic, and take-rate structure of protocol directories (in-ChatGPT commerce, Google AI Mode listings)? How do the two protocol camps (ACP / UCP) differ in coverage, and what does that imply for merchants?
- M3-RQ4: How do freemium, transparent list pricing, and usage-based pricing perform in agent channels — do agents prefer predictable cost or low price?
- M3-RQ5: How does the split between recommendation and invocation paths vary with task risk and transaction size? In which transaction classes does human confirmation remain mandatory?
- M3-RQ6: How does a content-only business without APIs get "adopted"? (Being recommended is adoption — boundary with M2 citation share; define the border here)

## 3. Method and Experiment Protocol (draft)

Tool-adoption experiment: publish several variants of an MCP server with identical capability but varied name/description/parameter complexity/pricing phrasing, launch with equal exposure, and measure installation and invocation differences. Change one variable at a time.

Protocol-positioning tracker: monthly, record merchant admission, category expansion, and settlement-rule changes across ACP, UCP, x402, and domestic counterparts (Alipay/WeChat agent-payment moves), building a protocol timeline.

Decision-variable interviews: collect public agent product documentation, developer logs, and merchant case studies; extract platform-stated ranking and recommendation logic and cross-check against experiments.

## 4. Metrics

| Metric | Definition | Collection |
|---|---|---|
| Install conversion | Directory exposure → MCP server installation | Directory dashboards |
| Invocation volume & retention | Daily invocations; invoking parties retained at day 7 | Server logs |
| Recommendation share | Share of being the first choice on the recommendation path | Panel testing (shared with M2) |
| Protocol penetration | Share of orders completed via ACP/UCP | Transaction backends |
| Decision-factor weights | Marginal effect of each variable on selection probability | Controlled experiments |

## 5. Current Conclusions

- [2026-09][A] UCP v2026-08-25 released (GitHub releases; official site ucp.dev verified): multi-vertical architecture rework, Grocery vertical ready, 3DS2 payment security, independent capability versioning; Lodging technical committee formed 2026-08-11 (Amadeus, Booking.com, Expedia, Google, Hilton, Marriott, Trip.com) — vertical expansion is faster than the August assessment
- [2026-09][A] Stripe Sessions 2026: the Agentic Commerce Suite now supports Google (selling inside AI Mode and the Gemini app); platform partners Wix, BigCommerce, WooCommerce; merchants include Kate Spade, Best Buy, Coach, Fanatics — the ACP camp has landed Google-side distribution; the two camps are in direct competition
- [2026-09][A] x402 at scale: the Linux Foundation announced the operational launch of the x402 Foundation on 2026-07-14 (protocol contributed by Coinbase); site-reported last-30-days figures: 75.41M transactions, $24.24M volume, 94.06K buyers, 22K sellers; Coinbase x402 Agent Payments opened to businesses (USDC in/out + CDP SDK)
- [2026-09][A] Alibaba official (2026-05-11): the full Taobao catalog (~4 billion SKUs) is connected to the Qwen app, with a Qwen-powered shopping assistant inside the Taobao app (natural-language browsing, comparison, ordering, delivery management) — the largest Chinese "catalog → AI assistant" sample
- [2026-09][B] Tencent Yuanbao × JD.com (2026-07-15): after a Yuanbao answer, one tap jumps to a JD mini-program for purchase across all categories — the second public Chinese "answer → transaction" loop (alongside Doubao × Douyin)
- [2026-09][A] OpenAI (2026-08-21): ChatGPT's connector directory ranking now prioritizes connectors still actively used after installation — the first official disclosure of a directory ranking signal: usage retention > install count; direct evidence for M3-RQ2
- [2026-09][A] MCP: current spec version 2026-07-28; official roadmap updated 2026-08-22 (agentic messaging primitives, HTTP transport unification and hardening, agent identity and enterprise security) — the tool ecosystem's center of gravity is shifting from "integration" to "identity and messaging primitives"

## 6. Link to Commercialization

M3 determines the skills needed to "productize capabilities as agent-invocable assets" (MCP development, API design, pricing engineering) and the right timing to invest in protocol integration. Maps to skill domains S2 and S5 in `../03-commercialization/skill-portfolio.md`, and opportunities A4 and A5 in `opportunity-matrix.md`.

## 7. Next Steps

1. Survey admission rules and data visibility of mainstream MCP directories (ChatGPT directory ranking logic is now officially disclosed — see conclusion 6; MCP Registry data visibility to be checked)
2. Design a minimal A/B experiment on tool descriptions
3. Start `protocol-tracker.md` (ACP / UCP / x402 / domestic moves) at the 2026-10 monthly cycle; this month's changes are already in the conclusions
4. Research merchant-side admission paths for Chinese platforms: Yuanbao × JD, Qwen × Taobao (linked to decision-board D3)
