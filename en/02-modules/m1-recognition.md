# M1 Recognition

> Status: not started (first priority in Phase 1) | Last updated: 2026-08-16 | Framework: `../01-framework/research-framework.md`

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

To be researched. (Format per entry: `[date][grade] one-sentence conclusion — source / experiment id`)

## 6. Link to Commercialization

Recognition is the foundation of every external promise. If M1 shows that structured content materially improves recognition, then "entity-recognition audits and fixes" is itself a sellable service (the evidence base for opportunity A1 in `../03-commercialization/opportunity-matrix.md`), and the first action for our own properties.

## 7. Next Steps

1. Design and freeze the blind-test prompt set (~20 questions) and scoring sheet; store as `blind-test-protocol.md` in this directory
2. Run the first baseline on 2–3 sample entities (own business + a well-known competitor + an unknown small site)
3. Collect first-party statements on the llms.txt controversy (OpenAI, Anthropic, Google each required)
