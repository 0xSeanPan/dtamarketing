# Protocol Tracker

> Created: 2026-10-08 | Last updated: 2026-11-07 | Status: maintained monthly (in lockstep with the monthly cycle) | Owned by: M3 method section 3 "protocol-positioning tracking" | Framework: `../01-framework/research-framework.md`

## 1. Purpose and Conventions

Records merchant admission, category expansion, settlement rules, and governance changes month by month across ACP / UCP / x402 / MCP and the Chinese AI-shopping lines, forming a protocol timeline that feeds M3-RQ3 (admission and ranking in protocolized catalogs), M4-RQ4 (trust infrastructure), and decision-board D2/D3 reviews.

Conventions:
- Only events that change merchant strategy or research judgment are logged; every event carries a `[date][evidence grade]` marker
- For one fact reported by multiple sources, keep the earliest first-party source
- Superseded statements are rewritten, not retained (consistent with the project's documentation-maintenance rule)

## 2. Five Lines, Current State (2026-11-07)

| Line | Positioning | Key facts now | Implication for merchant strategy |
|---|---|---|---|
| ACP (Stripe × OpenAI × Meta) | Distribution inside ChatGPT | Stripe's docs now list Meta as co-creator, spec directories `spec/2026-04-*` [A]; Shopify is the preferred catalog provider for ACS [A]; merchants: Etsy, URBN, Kate Spade, Best Buy, Coach, Quince, Fanatics, JD Sports | Three distribution surfaces (ChatGPT / Meta / Google) reachable through one ACS integration; camp boundaries blur further |
| UCP (Google × Shopify) | Distribution across Google AI surfaces | Lodging Booking capability draft (2026-09-25) [A]; Merchant Center UCP hub opens in the US from 2026-10-06 (cart transfer / native checkout / identity linking), AU and Canada in 2027 [B]; live merchants: Etsy, Wayfair, Target, Walmart [A/B] | Admission moves from approval to self-service; friction falls, but regional sequencing (US → AU/CA) becomes the new variable |
| x402 | Agent-native payment rail | Linux Foundation governance (2026-07-14) [A]; 57 members, executive director appointed 2026-10-01 [A]; **volume correction**: October 2026 saw 5.1M transactions / about $274K; 196M transactions / $42M cumulative through 2026-11-01, more than half from late-2025 PING farming [B]; identity gap (Cloudflare Wallets) unresolved [B] | Governance neutralized, but commercial settlement is still small; the "at scale" narrative does not hold; identity is the main gap |
| MCP (tool ecosystem) | Agent tool-adoption standard | Spec 2026-07-28 (stateless core, multi round-trip requests, auth hardening); no new version this period [A]; Claude Marketplace opened 2026-09-23 with 2,000+ connectors and plugins; plugin submission portal opened 2026-10-01 with a security scan [A]; Tasks primitive still iterating in production [A] | Directory distribution formalized with review; plugins are the main listing format |
| Domestic (Qwen / Yuanbao / Doubao) | Chinese AI shopping | Doubao listed Douyin Shop orders/GMV/ROI separately from 2026-07-15 and has charged an independent 9%–18% take rate since 2026-08-10 (Lodging 12% vs 8% main channel) [A]; Qwen Office e-commerce Agent (2026-10) and "双11帮我挑" [B]; Qwen app integrated Taobao/Alipay/Flash Purchase/Fliggy/Amap on 2026-01-15 [A] | Chinese loop leads internationally; first "AI entry = independent channel with independent pricing"; integration still fragmented, no unified protocol |

## 3. Timeline (by line, reverse chronological)

### ACP / Agentic Commerce (Stripe camp)

- [2026-11][A] Creator lineup change: Stripe's docs list ACP as created by Stripe, OpenAI, and Meta (previously recorded as Stripe × OpenAI only); spec directories `spec/2026-04-*`; API version at `2026-10-28`
- [2026-09][A] Stripe Sessions: Shopify becomes the preferred catalog provider for the Agentic Commerce Suite; platforms Wix and commercetools added; Meta partnership for native checkout inside Facebook ads (discovery and purchase in one flow)
- [2026-09][A] ACS integrated with Google (AI Mode / Gemini); Quince, Fanatics, JD Sports coming soon
- [2026-08][A] Etsy and URBN live in production; machine payments supported (from Stripe's official 10-lessons post)

### UCP / Google camp

- [2026-10-15][A] AI Overviews / AI Mode update: more inline links placed higher, a dedicated "official websites" section for task queries, clickable creator profiles — presentation changes only, not citation selection
- [2026-10-06][B] Merchant Center UCP hub begins rolling out in the US: cart transfer, native checkout, identity linking; AU and Canada expected in 2027
- [2026-10-05][A] Google UCP developer docs updated: waitlist application + Google approval required before going live on AI Mode / Gemini; Gemini web supported, app coming
- [2026-09-25][A] UCP Lodging: Booking capability draft (`dev.ucp.lodging.booking`) merged into the protocol repo — formal entry into the Lodging domain (Lodging TC: Amadeus, Booking.com, Expedia, Google, Hilton, Marriott, Trip.com)
- [2026-09-16][A] Merchant Center "AI performance insights" GA in US/AU/CA/IN/NZ (brand share of voice in AI Mode / AI Overviews); Business Agent for YouTube ads US beta; UCP hub adds checkout-flow testing; conversational attributes were incorporated in 50% of relevant AI Mode recommendations in a lululemon test
- [2026-09][B] Google Merchant Center rolls out a UCP integration hub in the US (merchants self-select capabilities from native checkout to identity linking)
- [2026-09][B] Live UCP merchants: Etsy, Wayfair (orders completed inside AI Mode)
- [2026-08-25][A] UCP v2026-08-25 released: multi-vertical architecture rework, Grocery ready, 3DS2, independent capability versioning
- [2026-08-11][A] Lodging technical committee formed

### x402 / payment rail

- [2026-11][B] **Volume correction**: Fireblocks / agenteconomy.to — October 2026 saw 5.1M transactions / about $274K; 196M transactions / $42M cumulative through 2026-11-01 across 12 chains and about 22K sellers; more than half of lifetime transactions came from late-2025 PING token farming. The previously logged "75.41M in 30 days" was the site's rolling figure and is not accurate; from this line on, use the third-party monthly reading
- [2026-11][A] Foundation membership rose to 57 (including Visa/Mastercard/Amex/PayPal/Google/Shopify/Circle/Stripe/AWS); Michael Hursta appointed executive director on 2026-10-01
- [2026-11][B] IETF draft `draft-vauban-x402-lifecycle-fsm-00`: defines a normative state machine for x402 V2 payment lifecycle (PaymentIntent / SettlementReceipt / RefundClaim / DelegationGrant) with JCS-canonical cryptographic linkage — refund and delegation boundaries enter a standards text for the first time
- [2026-10][B] Cloudflare Wallets: stablecoin balances plus a cloudflare.pay identity for AI agents (built on x402, Linux Foundation hosted); identity claim has no domain-verification mechanism, already drawing brand-squatting and trust controversy — a live case of the identity-verification gap
- [2026-09][A] Block joins the x402 Foundation
- [2026-08][B] 40+ members; premier members include Visa, Mastercard, American Express, Stripe, Adyen, Fiserv, Google
- [2026-07-14][A] Linux Foundation announces the operational launch of the x402 Foundation (protocol contributed by Coinbase)
- [2026-06][B] Ecosystem landings: AWS Bedrock AgentCore Payments (preview), Arbitrum, Fireblocks Agentic Payments Suite, Casper mainnet

### MCP / tool ecosystem

- [2026-10-01][A] "Build plugins for Claude" submission portal opens: a plugin is an MCP connector, Agent Skills, or both packaged; submissions go through an automatic security scan and directory review, then appear in the Claude directory
- [2026-09-23][A] Claude Marketplace opens: 2,000+ connectors and plugins (Google, Salesforce, Notion, Atlassian, Microsoft, etc.); enterprises can pay with committed Anthropic spend; Accenture/BCG/Deloitte are service partners
- [2026-09][A] MCP Apps render interactive UI inside the conversation; enterprise-managed auth
- [2026-08-22][A] Official roadmap updated: Agentic Messaging Primitives is the priority area; the Tasks primitive (SEP-1686) shipped experimental, production use exposes lifecycle gaps (failure-retry semantics, result-expiry policy)
- [2026-07-28][A] Spec released: stateless core, Multi Round-Trip Requests, header routing, cacheable lists, auth hardening, extension framework
- [2026-09-14][B] Snipp's brand-rebate plugin listed in both the ChatGPT plugin directory and the Claude directory (no platform fees) — a new paid channel for brands into agent answers

### Domestic AI shopping

- [2026-10-15][B] Douyin e-commerce announced Double 11 coupons distributed in batches across Doubao, Toutiao and other products, extending promotions beyond the Douyin app; Doubao added a "双十一问豆包" nav (pre-purchase check, product comparison, pick by budget), and Qwen launched "双11帮我挑"
- [2026-10][B] Qwen Office launched an e-commerce operations Agent (cross-platform dashboard, trend insight, bulk creative generation, cross-platform ROI optimization), positioned as an independent third-party service for all platforms
- [2026-08-10][A] Doubao independent channel pricing takes effect: orders routed from Doubao to Douyin Life Services settle at a 9%–18% composite rate (Lodging 12% = 11.4% software service fee + 0.6% payment fee, versus 8% on the main channel); charges are based on user payment plus platform subsidies, excluding merchant-funded subsidies
- [2026-07-15][A] Douyin Shop backend lists Doubao orders, GMV, and ROI as an independent channel; H1 2026 average daily e-commerce GMV through Doubao exceeded RMB 10M, about RMB 100M during 618 [B]
- [2026-07-15][B] Tencent Yuanbao × JD.com: one tap from a Yuanbao answer into a JD mini-program for purchases across all categories
- [2026-05-11][A] Qwen × Taobao full pipeline live (4B-SKU catalog; Qwen AI shopping assistant inside the Taobao app: AI try-on, AI coupon math, AI low-price sniping)
- [2026-01-15][A] Qwen app fully integrates Taobao, Alipay, Taobao Flash Purchase, Fliggy, Amap (food delivery, shopping, flight booking); Qwen consumer MAU passed 100M (2026-01-14)

## 4. Implications for Research Judgments

1. **Merchants no longer choose sides**: Visa Intelligent Commerce Connect (2026-04, [B]) offers a cross-protocol gateway; ACP adding Meta as co-creator further erodes camp boundaries — one ACS integration can cover ChatGPT / Meta / Google
2. **Directory distribution formalizes with review**: Claude Marketplace at 2,000+ entries with security scanning on submission; the ChatGPT plugin directory (Shoppable, Snipp and others) — agent app directories are now storefronts with review, billing, and service partners, strengthening the H5 observation
3. **Admission shifts from approval to self-service**: the UCP Merchant Center hub opens three capabilities in the US, ACS prefers Shopify for catalogs — friction falls, but regional sequencing (US → AU/CA 2027) becomes the new threshold; D3 must be rewritten around "regional batches," not "apply early to reserve a slot"
4. **Paid placement becomes a new variable**: ChatGPT Ads expanded to 26 countries on 10-21 and added multi-image formats on 10-26 — agent answers move from pure earned competition to earned + paid; H8 is proposed accordingly
5. **Trust-infrastructure gap narrows but does not close**: x402 governance neutralized (57 members, executive director), yet real settlement is only 5.1M transactions/month and the identity gap (Cloudflare Wallets) is unresolved; cross-platform identity drafts such as OpenA2A begin to fill it — the M4-RQ4 window stays open
6. **First channel-level pricing in China**: Doubao's independent 9%–18% rate (Lodging 12% vs 8%) plus separately reported GMV/ROI upgrades H7 from a weak signal to an auditable fact

## 5. Cadence

- Monthly: update this page plus module conclusions in the same cycle
- Trigger: a major merchant-policy or settlement change in any protocol → register a review item on the decision board the same day
- Reading point: x402 now uses Fireblocks / agenteconomy.to monthly data (the site's rolling 30-day figure proved inaccurate and is no longer primary)

## 6. Next Steps

1. Chinese merchant admission paths: Doubao (fee schedule + Douyin Shop settlement) is done; still need Qwen Office e-commerce merchant admission and revenue-share terms — feeds D3
2. Verify the full help documentation for the three Merchant Center UCP hub capabilities (merchant prerequisites and regional availability)
3. Track the x402 identity-verification controversy (Cloudflare Wallets corrections or industry reactions) and the IETF x402 lifecycle FSM draft
4. Submit a minimal MCP server through the Claude plugin portal and record review cycle, security scan, and exposure — feeds D2
5. Track ChatGPT Ads placement rules and auction terms inside agent answers (starting point for H8)
