# M4 Repurchase and Trust

> Status: in progress (second priority in Phase 2; protocol intel logged; trust-infrastructure case study open) | Last updated: 2026-10-08 | Framework: `../01-framework/research-framework.md`

## 1. Definition

The agent (and its principal) form a repeating transactional relationship with the target entity. The classic-marketing parallel is the repurchase and loyalty system (CRM, membership, brand stickiness), but the mechanism differs: machine loyalty does not come from emotion or habit — it comes from fulfillment records, price stability, trust scores, and organizational memory. Every transaction updates the agent's Bayesian belief about you.

State of the field: Stripe has shipped machine-payment support and published first-generation agentic-commerce engineering lessons, including failure modes [2026-08][A] stripe.com/blog/10-lessons; x402 provides an agent-native payment rail; agent identity and authenticity ("which principal authorized this agent") is an open topic. Repurchase research therefore spans transaction protocols and trust infrastructure by construction.

## 2. Research Questions

- M4-RQ1: What composes machine loyalty, and with what weights — fulfillment success rate, SLA, price volatility, dispute handling, new supply, trust scores? Which factor has the largest marginal effect?
- M4-RQ2: What does vendor lock-in look like in the agent era — whitelist configuration, organizational memory, proprietary fulfillment data, protocol binding? Does lock-in happen at the principal layer or the agent layer?
- M4-RQ3: What is the amplification factor of negative events (a failed fulfillment, a bad review) in agent channels — which corpora and scores do they enter, and how many positive records offset one negative?
- M4-RQ4: State of trust infrastructure — agent identity verification, verifiable transaction records, reputation networks (who keeps score for agents or merchants)? Barriers to entry and first-mover advantages?
- M4-RQ5: How do subscriptions, protocol-managed auto-renewal, and usage-based settlement fit agent channels — how do agent budget-authorization mechanisms shape consumption rhythm?
- M4-RQ6: The cross-period question: when a principal switches agent platforms, does the vendor relationship migrate with the transaction records? This decides where repurchase assets actually accumulate.

## 3. Method and Experiment Protocol (draft)

Case dissection: take public ACP/UCP merchant cases (Etsy, URBN, etc.) and Stripe engineering retrospectives; extract repurchase-relevant design decisions and failure modes into case cards.

Fulfillment-signal modeling: overlay fulfillment variables on the M3 invocation experiment (simulated 95% vs 99% success, latency jitter, price changes) and estimate the marginal effect of each factor on repeat invocation.

Corpus-offset experiment: inject one negative review into a controlled corpus and measure its decaying influence on M1 recognition and M2 citation as offsetting content accumulates.

## 4. Metrics

| Metric | Definition | Collection |
|---|---|---|
| Repeat-invocation rate | Share of agents/principals invoking again within 30 days | Server logs |
| Fulfillment score | Composite of success rate, latency compliance, dispute rate | Transaction data |
| Trust-score movement | Change in platform or third-party trust systems | Platform data |
| Negative-impact half-life | Time for metrics to recover to 50% of baseline after a negative event | Experiments |
| Whitelist entry rate | Share of vendors written into standing supplier lists | Sampled interviews / public cases |

## 5. Current Conclusions

- [2026-09][B] HUMAN Security (2026-07): agent-browser session mix — Perplexity Comet 47.13%, Claude in Chrome 24%, Atlas 15.5%, ChatGPT Agent 6.1%; 76% of agent activity hits product and search routes — "agents as shopping visitors" is now a measurable, routine traffic class
- [2026-09][A] x402 moved under Linux Foundation governance with 75.41M transactions per month (see `m3-adoption.md` conclusions) — machine payments graduated from protocol experiment to scaled operation; neutral foundation governance signals long-term neutrality for the repurchase infrastructure
- [2026-09][A] UCP v2026-08-25 builds in 3DS2 payment security and structured shopping constraints — the trust layer is being embedded in the protocol itself rather than bolted on (M4-RQ4)
- [2026-09][A] Adobe: AI-visitor conversion runs 42% higher than non-AI (2026-03; see M2 conclusions) — an AI-channel customer-quality premium; on the repurchase side, agent-referred traffic converts above the channel average
- [2026-10][B] Cloudflare Wallets (x402 ecosystem): stablecoin balances plus a cloudflare.pay identity for AI agents, but the identity claim has no domain-verification mechanism and already draws brand-squatting and trust controversy — a live case of the agent-identity authenticity gap; research window opens for M4-RQ4 (trust infrastructure) (see `protocol-tracker.md`)
- [2026-10][A] Adobe (2026-08-19): AI-visitor conversion runs 60% higher than non-AI (11th consecutive month) — the AI-channel customer-quality premium keeps widening; repurchase-side baseline updated: "agent-referred = high-intent traffic"
- [2026-10][B] Machine payments on dual parallel tracks: x402 (Linux Foundation governance, 40+ members) coexists with a Visa/Stripe/OpenAI multi-protocol gateway (Visa Intelligent Commerce Connect) — payment-track neutrality lowers vendor lock-in; M4-RQ2 (lock-in form) watch item: lock-in shifts from "protocol binding" to "fulfillment records and trust scores"

## 6. Link to Commercialization

M4 answers whether the business compounds. If repurchase is driven mainly by fulfillment and trust assets, then service-quality engineering and trust-infrastructure participation are long-horizon investments; if cross-platform migration holds, customer relationships should be designed to live on portable, self-owned layers rather than a single platform. Maps to skill domains S5 and S6 in `../03-commercialization/skill-portfolio.md`, and opportunities A5 and A6 in `opportunity-matrix.md`.

## 7. Next Steps

1. Map agent-identity and trust-scoring schemes (starting points: the Cloudflare Wallets squatting controversy, the x402 identity gap, Claude enterprise-managed auth)
2. Read the Stripe agentic-commerce engineering retrospective closely; extract a citable failure-mode list
3. Collect public data and interviews for ACP merchants (Etsy, URBN) and UCP live merchants (Wayfair, Etsy)
4. Monthly: track x402/UCP merchant-side settlement and trust readings, plus Adobe and HUMAN quarterly updates
