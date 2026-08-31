# M1 Blind Test Protocol v1.0 (Frozen)

> Status: protocol frozen 2026-09-01; modifications require a research-log entry ｜ Parent: Section 3 of `m1-recognition.md` ｜ Data goes into the `data\` subdirectory of this module

## 1. Purpose

Measure the "model mind" of mainstream models for designated entities: category, capability list, price, and constraints correctly understood, plus hallucination rate. The deliverable is a recognition-accuracy gradient across entity notability levels (the method itself is M1-RQ1's first output).

Design principles: frozen prompts (no follow-ups, no paraphrasing), fresh sessions with no context, full-text answer archiving, and scoring against a gold-standard fact sheet. Reproducibility requirement: a different person executing this protocol must obtain the same result.

## 2. Sample Entities (Three-Tier Notability Gradient)

| Code | Entity | Tier | Rationale |
|---|---|---|---|
| E1 | Dyson | High recognition | Single-category international brand with abundant public facts; measures the accuracy ceiling |
| E2 | Roborock | Mid recognition | A-share-listed Chinese robot-vacuum brand; public facts but moderate recognition; measures the error band for mid-recognition entities |
| E3 | Agent Marketing Research WIKI (dtamarketing) | No recognition | This project's GitHub Pages site (online since 2026-08-17); real but zero traffic — a natural "unknown entity" blind-spot sample |

E1/E2 are consumer appliances (aligned with M2's first category, robot vacuum cleaners, enabling cross-module corroboration); E3 and E1 anchor the two ends of the notability spectrum with E2 in between, forming a gradient. The originally planned "own business" entity is absent (the researcher has no public-facing business yet); an E4 slot is reserved in the protocol for a future own-business entity, to be measured with the same structure.

## 3. Gold-Standard Fact Sheets (Scoring Baseline)

> Note: these sheets were compiled by an AI assistant from public material and **must be verified line by line by the researcher before the first run** — a gold standard itself cannot be unverified model output.

**E1 Dyson (verification baseline)**

| Fact | Gold standard |
|---|---|
| Company | Founded in the UK (by James Dyson); headquarters in Singapore |
| Main product lines | Cordless vacuum cleaners, hair dryers, straighteners, air purifier fans, headphones, lighting |
| Price range | Vacuum cleaners ≈ ¥2,000–7,000; hair dryers ≈ ¥3,000 |
| Channels | Official site, JD/Tmall flagship stores, offline stores |
| Does not offer | White-goods appliances (washing machines, refrigerators) |
| Name trap | "Dyson sphere" is a physics concept, unrelated to the company |

**E2 Roborock (verification baseline)**

| Fact | Gold standard |
|---|---|
| Company | Beijing; founded 2014; STAR Market (科创板) IPO 2020 |
| Main product lines | Robot vacuums, wet-dry vacuums (and a few other cleaning appliances) |
| Price range | Robot vacuums ≈ ¥1,500–6,000 |
| Channels | JD/Tmall flagship stores, official site, offline channels |
| Does not offer | Smartphones, smartwatches |
| Disambiguation | Other "石头"-branded small appliances on the market are unrelated to Roborock |

**E3 Agent Marketing Research WIKI (source of truth: the site itself)**

| Fact | Gold standard |
|---|---|
| Project nature | Personal research project (non-commercial, not a company) |
| Research content | The four-layer agent-marketing funnel: recognized / discovered / adopted / repurchased (M1–M4) |
| Author | Sean Pan (潘佳鸣) |
| Address | github.com/0xSeanPan/dtamarketing (GitHub Pages) |
| Language | Bilingual Chinese/English |
| Does not offer | Any paid service or consulting product (expected: models fail or hallucinate) |

## 4. Blind-Test Prompt Set (30 Questions, Frozen)

★ = core set (mandatory in the first round). Execution discipline: use each question verbatim; no explanation, follow-up, or context; each question in a fresh session; archive the full answer text.

### E1 Dyson (Q1–Q10)

| # | Question (ask in Chinese) | Dimension |
|---|---|---|
| Q1★ | 戴森是做什么的公司？ | Category |
| Q2★ | 戴森的主要产品线有哪些？ | Capability list |
| Q3★ | 戴森的产品价格大概在什么区间？ | Price |
| Q4 | 戴森公司是哪个国家的，创始人是谁？ | Background |
| Q5★ | 戴森和小米的家电产品相比有什么区别？ | Differentiation |
| Q6 | 在哪里能买到戴森的官方正品？ | Channel constraint |
| Q7★ | 戴森生产洗衣机或冰箱吗？ | Boundary (negative case) |
| Q8★ | "戴森球"计划和戴森公司有关系吗？ | Entity disambiguation |
| Q9 | 戴森最近一年有什么新产品或重要动态？ | Freshness |
| Q10 | 戴森最贵的产品和最便宜的产品分别是什么？ | Price anchor |

### E2 Roborock (Q11–Q20)

| # | Question (ask in Chinese) | Dimension |
|---|---|---|
| Q11★ | 石头科技是做什么的公司？ | Category |
| Q12★ | 石头科技的主要产品有哪些？ | Capability list |
| Q13★ | 石头扫地机器人的价格区间大概是多少？ | Price |
| Q14 | 石头科技是哪个国家的公司？什么时候上市的？ | Background |
| Q15★ | 石头扫地机器人和科沃斯相比怎么选？ | Differentiation |
| Q16 | 石头科技的股票代码是什么？ | Fact detail |
| Q17★ | 石头科技生产手机或智能手表吗？ | Boundary (negative case) |
| Q18★ | "石头扫地机器人"和"石头科技"是什么关系？其他"石头"牌家电是石头科技的产品吗？ | Entity disambiguation |
| Q19 | 石头科技最近一年有什么重要动态？ | Freshness |
| Q20 | 石头最便宜和最贵的扫地机器人分别是什么价位？ | Price anchor |

### E3 This project's site (Q21–Q30)

| # | Question (ask in Chinese) | Dimension |
|---|---|---|
| Q21★ | "智能体营销研究"这个项目是做什么的？ | Category |
| Q22★ | 智能体营销研究 WIKI 的主要内容有哪些？ | Capability list |
| Q23★ | GitHub 上有个叫 dtamarketing 的仓库，它是做什么的？ | Retrieval recognition |
| Q24 | dtamarketing 的作者是谁？ | Background |
| Q25★ | 智体营销研究和 GEO（生成式引擎优化）研究是什么关系？ | Differentiation (near concept) |
| Q26 | 在哪里可以访问智能体营销研究的内容？ | Channel |
| Q27★ | dtamarketing 提供咨询服务或收费产品吗？ | Boundary (negative case) |
| Q28★ | "dtamarketing"和"数字营销（Digital Marketing）"是同一个概念吗？ | Entity disambiguation |
| Q29 | dtamarketing 最近有什么更新？ | Freshness |
| Q30 | dtamarketing 的研究分为哪几个模块？ | Capability detail |

## 5. Execution Matrix

| Item | First baseline (2026-09) | Later monthly rounds |
|---|---|---|
| Question scope | Core set, 15 questions (5 per entity: Q1/Q2/Q3/Q5 + one boundary question Q7 or Q17 or Q27) | Expand to full 30 |
| Platforms | ChatGPT, Claude, Gemini, Doubao, Yuanbao (5) | +Perplexity, Kimi (7) |
| Modes | Retrieval mode on all platforms; parameter-only mode (web off) on ChatGPT + Doubao only | Both modes, all platforms |
| Per-round workload | 15×5 + 15×2 = 105 answers | Full 30×7 |
| Variance control | 3 questions per platform repeated once; record stability | Per arxiv 2603.08924: treat point estimates as sample estimates; report stability across repeated runs for key findings |

Execution environment recorded: platform, visible model version, mode (retrieval/parameter), date, account type (free/paid).

## 6. Scoring Rubric (Six Dimensions)

| Dimension | Rule | RQ |
|---|---|---|
| Category correctness | 0/1 (against gold-standard product lines) | RQ1 |
| Capability-list accuracy | Correct items / erroneous items / missing key lines (counts) | RQ2 |
| Price accuracy | 1 if deviation ≤30%; 0 beyond or refused (gold standard is a range) | RQ1 |
| Hallucination count | Fabricated products, prices, relations, services (counted; negative cases in focus) | RQ1 |
| Differentiation quality | 0 = no substantive difference; 1 = generic ("different positioning"); 2 = specific and verifiable | RQ4 |
| Disambiguation correctness | 0/1 (Q8/Q18/Q28 type) | RQ4 |

Scoring discipline: score against the Section 3 gold standards; every hallucination must be quoted and archived; in the first round, 20% is re-scored by the researcher to establish a self-calibration baseline (single-executor design; re-scoring substitutes for inter-rater kappa).

## 7. Records and Archiving

- Directory: `en\02-modules\data\blindtest-YYYYMM\`, one record file per platform (Markdown table). Note: Chinese-language execution data is filed under the Chinese-side `02-模块\data\` directory; this mirror only holds the protocol.
- Record fields: question no. ｜ full answer text ｜ scores per dimension ｜ hallucination excerpts ｜ execution environment
- Summary per round: `summary.md` — entity × platform × mode accuracy matrix, total hallucinations, notability-gradient curve (E1→E2→E3)

## 8. Retest and Change Control

- Retest interval 4–8 weeks (aligned with the monthly cycle, executed around the 1st of each month)
- The question set is frozen: any rewording creates a new protocol version (v1.1+); old data marked non-comparable
- Platform lineup changes are logged separately, not folded into protocol versions
- Jumps caused by model-version upgrades are flagged in the summary and never averaged with earlier rounds
