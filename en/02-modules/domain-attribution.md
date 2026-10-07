# M2 Domain Attribution Table v1.0 (Robot Vacuum Category)

> Created: 2026-10-08 | Status: v1.0 (prerequisite for the first baseline; reviewed quarterly) | Belongs to: the attribution prerequisite for "citation share" in Section 5 of `m2-discovery.md` | Data archive: `data/panel-YYYYMM/`

## 1. Purpose and Usage

M2's "citation share" = cited count of entity-related domains / total citations for the question. Before computing it, cited domains must be mapped to an attribution category / entity. This table is the single source of truth for that mapping.

Usage: when running the panel test, extract the domain of each citation link in an answer → classify it per this table → aggregate into the cited-domain distribution table in `summary.md`. Domains not listed here go first into the "unattributed" bucket; decide whether to add them at the monthly review.

Evidence marks: created 2026-10-08; grades per row as `[A]/[B]` — official domains taken from the sites themselves (A), review and community domains taken from public site information (B).

## 2. Attribution Category System

| Category | Code | Meaning | How it counts toward citation share |
|---|---|---|---|
| Brand-owned domain | C1 | Brand official site, official store | Counts toward the corresponding entity Tn |
| Platform commerce domain | C2 | JD / Tmall / Taobao / Suning / Pinduoduo etc. | Counts toward the platform bucket; those tagged "official flagship store" also count as brand-direct citations |
| Vertical review / shopping-guide domain | C3 | ZOL, PCOnline, SMZDM etc. | Counts toward the review-domain bucket, not attributed to a single brand |
| Content community domain | C4 | Zhihu, Xiaohongshu, Bilibili, Douyin etc. | Counts toward the community bucket |
| Media and research domain | C5 | Tech media, industry research, consumer associations | Counts toward the media bucket |
| Unattributed | C6 | Long tail, overseas sites, undeterminable | Listed separately, reviewed monthly |

## 3. Brand-Owned Domains (C1)

| Code | Entity | Primary domain | Other owned domains | Evidence |
|---|---|---|---|---|
| T1 | Ecovacs | ecovacs.cn | mall.ecovacs.cn; global ecovacs.com | [2026-10][A] official site |
| T2 | Roborock | roborock.com | cn.roborock.com, mall.roborock.com; legacy rockrobo.com | [2026-10][A] official site |
| T3 | Narwal | narwal.com | — | [2026-10][A] official site |
| T4 | Dreame | dreame.tech | global dreametech.com | [2026-10][A] official site |
| T5 | iRobot | irobot.cn | global irobot.com | [2026-10][A] official site |
| T6 | Xiaomi / Mijia | mi.com | m.mi.com | [2026-10][A] official site |
| T7 | Dyson | dyson.cn | global dyson.com | [2026-10][A] official site |
| T8 | UONI | uoni.com.cn | international uoni.com | [2026-10][A] official site |
| T9 | 360 Robot Vacuum | 360.cn | smart.360.cn, life.360.cn, mall.360.cn; global smart.360.com | [2026-10][A] official site |

## 4. Platform Commerce Domains (C2)

| Platform | Primary domain | Note | Evidence |
|---|---|---|---|
| JD | jd.com | Includes brand official flagship stores (xxx.jd.com, mall.jd.com/index-xxx) and self-operated | [2026-10][A] platform |
| Tmall | tmall.com | Includes brand official flagship stores (xxx.tmall.com) | [2026-10][A] platform |
| Taobao | taobao.com | — | [2026-10][A] platform |
| Suning | suning.com | — | [2026-10][A] platform |
| Pinduoduo | pinduoduo.com / yangkeduo.com | Includes brand flagship stores | [2026-10][A] platform |

Official flagship store identification: JD `xxx.jd.com` or `mall.jd.com/index-xxx`; Tmall `xxx.tmall.com`. These are marked "brand-direct citation," but the domain still attributes to `jd.com` / `tmall.com`.

## 5. Vertical Review and Content Community Domains (C3 / C4)

| Category | Site | Primary domain | Evidence |
|---|---|---|---|
| C3 vertical review / shopping guide | ZOL (Zhongguancun Online) | zol.com.cn | [2026-10][B] site |
| C3 | PCOnline (now PC Tech) | pc.com.cn | [2026-10][B] site |
| C3 | SMZDM (What's Worth Buying) | smzdm.com | [2026-10][B] site |
| C4 content community | Zhihu | zhihu.com | [2026-10][B] site |
| C4 | Xiaohongshu | xiaohongshu.com | [2026-10][B] site |
| C4 | Bilibili | bilibili.com | [2026-10][B] site |
| C4 | Douyin | douyin.com | [2026-10][B] site |

## 6. Media and Research Domains (C5)

| Site | Primary domain | Evidence |
|---|---|---|
| 36Kr | 36kr.com | [2026-10][B] site |
| EET China | eet-china.com | [2026-10][B] site |
| CNR (China National Radio) | cnr.cn | [2026-10][B] site |

Industry data sources (RUNTO, Euromonitor, etc.) count under C5 when they appear.

## 7. Attribution Rules

1. **Subdomains fold into the primary domain**: `jd.zol.com.cn` → `zol.com.cn`; `post.smzdm.com` → `smzdm.com`; `m.mi.com` → `mi.com`
2. **Official flagship stores**: those under a platform domain attribute to the platform (`jd.com` / `tmall.com`), tagged "official flagship store" to separate brand-direct citations from third-party ones on the platform
3. **Brand-owned domains** count toward the corresponding entity Tn; one domain maps to only one entity, and multi-brand shared domains are handled as C3 / C5
4. **Name disambiguation**: other "Stone" small-appliance domains do not map to T2; "360" non-smart-hardware business domains do not map to T9
5. **Overseas sites** (e.g., roborock.com global, dyson.com) map to the corresponding brand entity but carry a "domestic / overseas" tag, to support the cross-language citation analysis for M2-RQ5 Chinese queries
6. **Undeterminable** → C6 unattributed bucket, reviewed monthly

## 8. Maintenance and Updates

- Quarterly review (in sync with the entity list): add high-frequency unattributed domains, remove dead domains
- Update immediately when a brand changes domain or adds a sub-brand
- Log changes in `research-log.md`