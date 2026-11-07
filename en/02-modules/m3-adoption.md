# M3 Adoption

> Status: in progress (first priority in Phase 2; protocol intel logged; `protocol-tracker.md` live) | Last updated: 2026-11-07 | Framework: `../01-framework/research-framework.md`

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
- [2026-09][A] x402 governance launch: the Linux Foundation announced the operational launch of the x402 Foundation on 2026-07-14 (protocol contributed by Coinbase); Coinbase x402 Agent Payments opened to businesses (USDC in/out + CDP SDK). **Note: the previously recorded "75.41M transactions in 30 days" came from the site's rolling figure and was corrected in 2026-11 with third-party data — see the 2026-11 entry in this period**
- [2026-09][A] Alibaba official (2026-05-11): the full Taobao catalog (~4 billion SKUs) is connected to the Qwen app, with a Qwen-powered shopping assistant inside the Taobao app (natural-language browsing, comparison, ordering, delivery management) — the largest Chinese "catalog → AI assistant" sample
- [2026-09][B] Tencent Yuanbao × JD.com (2026-07-15): after a Yuanbao answer, one tap jumps to a JD mini-program for purchase across all categories — the second public Chinese "answer → transaction" loop (alongside Doubao × Douyin)
- [2026-09][A] OpenAI (2026-08-21): ChatGPT's connector directory ranking now prioritizes connectors still actively used after installation — the first official disclosure of a directory ranking signal: usage retention > install count; direct evidence for M3-RQ2
- [2026-09][A] MCP: current spec version 2026-07-28; official roadmap updated 2026-08-22 (agentic messaging primitives, HTTP transport unification and hardening, agent identity and enterprise security) — the tool ecosystem's center of gravity is shifting from "integration" to "identity and messaging primitives"
- [2026-10][A] UCP Lodging: the Booking capability draft (`dev.ucp.lodging.booking`) merged into the protocol repo on 2026-09-25 — vertical expansion moves from roadmap to specification (see `protocol-tracker.md`)
- [2026-10][A] Stripe Sessions: Shopify becomes the preferred catalog provider for the Agentic Commerce Suite; Meta partnership for native checkout inside Facebook ads (discovery + purchase in one flow) — ACS upgrades from "protocol integration" to "catalog + ad dual distribution"
- [2026-10][A] Google UCP admission becomes gated: developer docs (updated 2026-10-05) specify waitlist + Google approval before going live; Etsy and Wayfair are the first live merchants; Gemini web supported, app coming — first movers get position
- [2026-11][A] Claude Marketplace opened (official blog 2026-09-23): one storefront for plugins (MCP connectors / Agent Skills packaged), products, and service partners, with **2,000+ connectors and plugins** at launch (the 950+ recorded last month was an older count and is corrected here); enterprises can apply committed Anthropic spend to partner products; Accenture / BCG / Deloitte joined as service partners; a plugin submission portal opened 2026-10-01 with an automatic security scan and directory review — agent app directories have moved from registry to platform storefront with review, billing, and service partners; direct object of study for M3-RQ2 / D2
- [2026-10][A] MCP 2026 roadmap: the Tasks primitive (SEP-1686) shipped as an experimental feature; production use exposes lifecycle gaps (retry semantics, result-expiry policy) — messaging primitives moving from proposal to production iteration
- [2026-10][B] Visa Intelligent Commerce Connect (live 2026-04): a network-, protocol-, and token-vault-agnostic gateway (supports Visa TAP, Stripe MPP, OpenAI ACP) — an interoperability layer over the protocols; merchants no longer need to pick a side; D3 selection cost falls
- [2026-11][B] x402 governance and scale: foundation membership rose from 40 to **57** (including Visa/Mastercard/Amex/PayPal/Google/Shopify/Circle/Stripe/AWS); Michael Hursta appointed executive director on 2026-10-01; but real commerce volume is far below the site's rolling figure — October 2026 saw 5.1M transactions worth about $274K, with 196M transactions / $42M cumulative through 2026-11-01, and more than half of lifetime transactions came from late-2025 PING token farming (see the measurement correction in `protocol-tracker.md`)
- [2026-10][B] Snipp brand-rebate plugin (2026-09-14) listed in both the ChatGPT plugin directory and the Claude directory with no platform fees — a paid brand route into agent answers appears; new evidence for M3-RQ6 and opportunity A4
- [2026-11][A] Doubao becomes an independent transaction channel (merchant-side first-party): since 2026-07-15 the Douyin Shop backend lists Doubao orders, GMV, and ROI separately; since 2026-08-10 orders routed from Doubao to Douyin Life Services carry an independent take rate of 9%–18% (Lodging: 11.4% software service fee + 0.6% payment fee = 12%, versus 8% on the main Douyin channel) — the first Chinese case of "AI entry as an independent channel with channel-specific pricing," direct evidence for H7
- [2026-11][B] Doubao e-commerce scale (media citing Douyin merchants and platform data): average daily GMV through Doubao exceeded RMB 10M in H1 2026 and reached about RMB 100M during 618; product evolution: 2025-10 Douyin e-commerce integration → 2026-03 in-app shopping beta → 2026-04 "Help You Choose" nav → 2026-05 "Ask Doubao Before Buying" closed loop — from feature to channel in roughly seven months
- [2026-11][B] Two Qwen paths: consumer side launched "双11帮我挑" for 2026 Double 11; merchant side launched the Qwen Office "e-commerce operations" Agent in 2026-10 (cross-platform dashboard, trend insight, bulk creative generation, cross-platform ROI optimization), positioned as an independent third-party service for all platforms — a different merchant-integration paradigm from Doubao's owned-channel loop
- [2026-11][B] UCP merchant access shifts from approval to self-service: Google Merchant Center's UCP hub began rolling out in the US from 2026-10-06 with three optional capabilities (cart transfer, native checkout, identity linking), Australia and Canada expected in 2027 — friction falls, but regional sequencing becomes a new variable
- [2026-11][A] ChatGPT Ads expanded to 26 countries/regions on 2026-10-21, with a multi-image ad format beta on 2026-10-26 — paid placements inside agent answers become a buyable product; M3-RQ6 (paid acquisition of agent traffic) expands from directory listing/sponsorship to native advertising
- [2026-11][A] ACP creator lineup updated: Stripe's documentation lists ACP as created by Stripe, OpenAI, and Meta, with spec directories `spec/2026-04-*` — Meta upgrades from integrator to co-creator, widening ACP's distribution surface (Facebook/Instagram)
- [2026-10][A] Qwen's start line moves earlier: on 2026-01-15 the Qwen app already integrated Taobao, Alipay, Taobao Flash Purchase, Fliggy, and Amap (food delivery, shopping, flight booking), with the full Taobao pipeline live by 2026-05-11 — the Chinese "answer → transaction" loop predates the international protocol camps

## 6. Link to Commercialization

M3 determines the skills needed to "productize capabilities as agent-invocable assets" (MCP development, API design, pricing engineering) and the right timing to invest in protocol integration. Maps to skill domains S2 and S5 in `../03-commercialization/skill-portfolio.md`, and opportunities A4 and A5 in `opportunity-matrix.md`.

## 7. Next Steps

1. Chinese merchant admission paths (partly covered this round): Doubao's independent-channel fee schedule and Douyin Shop settlement rules are verified; still need Qwen Office e-commerce edition's merchant admission and revenue-share terms (linked to D3)
2. Test Claude Marketplace admission and data visibility: submit a minimal MCP server through the plugin portal opened 2026-10-01 and record review cycle, security scan, and directory exposure (the empirical starting point for D2)
3. Design a minimal A/B experiment on tool descriptions (M3-RQ2; start after the M2 baseline runs)
4. Compare "AI entry as channel" take-rate structures: Doubao 9%–18%, ChatGPT Ads auction, Perplexity merchant program, UCP platform-fee terms (the latter three unverified) — complete this before re-testing H7
5. Protocol timeline is live in `protocol-tracker.md` — maintain monthly
