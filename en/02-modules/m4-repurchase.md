# M4 Repurchase and Trust

> Status: not started (second priority in Phase 2) | Last updated: 2026-08-16 | Framework: `../01-framework/research-framework.md`

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

To be researched.

## 6. Link to Commercialization

M4 answers whether the business compounds. If repurchase is driven mainly by fulfillment and trust assets, then service-quality engineering and trust-infrastructure participation are long-horizon investments; if cross-platform migration holds, customer relationships should be designed to live on portable, self-owned layers rather than a single platform. Maps to skill domains S5 and S6 in `../03-commercialization/skill-portfolio.md`, and opportunities A5 and A6 in `opportunity-matrix.md`.

## 7. Next Steps

1. Read the Stripe agentic-commerce engineering retrospective closely; extract a citable failure-mode list
2. Collect public data and interviews for ACP merchants (Etsy, URBN)
3. Map existing agent-identity and trust-scoring schemes
