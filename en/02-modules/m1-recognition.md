# M1 Recognition

> Status: protocol frozen (`blind-test-protocol.md` v1.0); first baseline pending execution (carried to 2026-10) | Last updated: 2026-10-08 | Framework: `../01-framework/research-framework.md`

## 1. Definition

An agent and the model behind it accurately understand a business entity's "who, what, at what price, under what constraints." The product of recognition is the entity's internal representation in the model: name, category, capability list, differentiating attributes. Misrecognition distorts everything downstream — discovery, adoption, repurchase — because an agent cannot recommend what it cannot describe correctly.

Classic-marketing parallel: brand awareness. The difference: brand awareness pursues "being remembered with favor," machine recognition pursues "being parsed accurately without hallucination."

## 2. Research Questions

- M1-RQ1: How do we measure how accurately mainstream models recognize a given entity? (The method itself is this module's first deliverable)
- M1-RQ2: Which content forms are parsed most accurately by machines — structured data (schema.org), tables, llms.txt, API documentation, Q&A-style copy, or conventional marketing prose?
- M1-RQ3: How to adjudicate the llms.txt adoption controversy? Platform vendors have stated they do not rely on the file; collect first-party statements from all sides
- M1-RQ4: What signals drive entity disambiguation for same-name entities, multilingual names, and rebrands (knowledge-graph entries, consistency across authoritative sources, domains, social profiles)?
- M1-RQ5: How large is the gap between recognition from frozen training data versus live retrieval (search-enabled agents)? Which optimization actions map to each?

## 3. Method and Experiment Protocol (draft)

Model-mind blind test: a fixed set of standardized prompts ("What is X / what services does it offer / price range / how does it differ from Y") run across mainstream models (ChatGPT, Claude, Gemini, Perplexity; retrieval on and off), answers recorded verbatim and scored by dimension: category correctness, capability-list accuracy, price accuracy, hallucination count, whether differentiators are mentioned. Fix prompts and temperature per round; repeat every 4–8 weeks to build a trend line.

Variable control: measure the baseline first, then intervene with one content variable at a time (e.g. add llms.txt only, or complete schema only), and re-test two weeks later.

## 4. Metrics

| Metric | Definition | Collection |
|---|---|---|
| Recognition accuracy | Correct items / expected items per scoring dimension | Blind-test scoring |
| Hallucination rate | Share of invented capabilities, prices, relationships | Blind-test scoring |
| Key-attribute coverage | Proportion of price, constraints, differentiators stated correctly | Blind-test scoring |
| Cross-model consistency | Variance of descriptions across models | Cross-model comparison |
| Freshness sensitivity | Accuracy gap between retrieval mode and parametric mode | Two-mode comparison |

## 5. Current Conclusions

- [2026-09][B] llms.txt adoption: ~5.6–5.9% of the top 10,000 sites deploy a valid file (two independent tallies concur); third-party analysis finds no significant correlation with AI citations
- [2026-09][A] Google's official clarification (2026-07): llms.txt is not a Google Search ranking factor and confers no visibility or ranking benefit
- [2026-10][B] Platform-stance summary (M1-RQ3 adjudication complete): OpenAI (crawler docs recommend robots.txt only, never reference the file), Anthropic (publishes its own but makes no commitment to consuming others'), Perplexity, and Microsoft have all announced no support; Google confirms it is not a ranking factor yet concedes Perplexity/Claude do fetch it and Cursor/GitHub Copilot genuinely use it for developer docs (which is why Stripe/Cloudflare/Anthropic publish their own) — verdict: llms.txt has no visibility effect on AI-search citations, but is practically useful for "navigation once an agent is already on-site" and developer-documentation contexts; it is an optional enhancement to machine-parseable summaries (M1-RQ2) rather than an entry condition

## 6. Link to Commercialization

Recognition is the foundation of every external promise. If M1 shows that structured content materially improves recognition, then "entity-recognition audits and fixes" is itself a sellable service (the evidence base for opportunity A1 in `../03-commercialization/opportunity-matrix.md`), and the first action for our own properties.

## 7. Next Steps

1. Execute the first baseline: core 15 questions × 5 platforms (retrieval mode) + 15 questions × 2 platforms (parameter mode), per the execution matrix in `blind-test-protocol.md` Section 5 (carried to 2026-10)
2. Verify the gold-standard fact sheets before execution (`blind-test-protocol.md` Section 3; researcher confirms line by line)
3. M1-RQ3 adjudication is complete (see Section 5); fold the verdict into the recognition baseline design — llms.txt optional, structural content primary
4. When an own-business entity appears, add it as E4 (slot reserved) and retest with the same structure
