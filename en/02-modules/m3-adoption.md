# M3 Adoption

> Status: not started (first priority in Phase 2) | Last updated: 2026-08-16 | Framework: `../01-framework/research-framework.md`

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

To be researched.

## 6. Link to Commercialization

M3 determines the skills needed to "productize capabilities as agent-invocable assets" (MCP development, API design, pricing engineering) and the right timing to invest in protocol integration. Maps to skill domains S2 and S5 in `../03-commercialization/skill-portfolio.md`, and opportunities A4 and A5 in `opportunity-matrix.md`.

## 7. Next Steps

1. Survey admission rules and data visibility of mainstream MCP directories (are install counts public?)
2. Design a minimal A/B experiment on tool descriptions
3. Start `protocol-tracker.md` (ACP / UCP / x402 / domestic moves)
