# Protocol Tracker

> Created: 2026-10-08 | Status: maintained monthly (in lockstep with the monthly cycle) | Owned by: M3 method section 3 "protocol-positioning tracking" | Framework: `../01-framework/research-framework.md`

## 1. Purpose and Conventions

Records merchant admission, category expansion, settlement rules, and governance changes month by month across ACP / UCP / x402 / MCP and the Chinese AI-shopping lines, forming a protocol timeline that feeds M3-RQ3 (admission and ranking in protocolized catalogs), M4-RQ4 (trust infrastructure), and decision-board D2/D3 reviews.

Conventions:
- Only events that change merchant strategy or research judgment are logged; every event carries a `[date][evidence grade]` marker
- For one fact reported by multiple sources, keep the earliest first-party source
- Superseded statements are rewritten, not retained (consistent with the project's documentation-maintenance rule)

## 2. Five Lines, Current State (2026-10-08)

| Line | Positioning | Key facts now | Implication for merchant strategy |
|---|---|---|---|
| ACP (OpenAI × Stripe) | Distribution inside ChatGPT | Shopify is the preferred catalog provider for ACS [A]; Meta partnership for native checkout in Facebook ads [A]; merchants: Etsy, URBN, Kate Spade, Best Buy, Coach, Quince, Fanatics, JD Sports | Catalog + platform dual entry points; one ACS integration reaches multiple surfaces |
| UCP (Google × Shopify) | Distribution across Google AI surfaces | Lodging Booking capability draft (2026-09-25) [A]; admission gated by waitlist + Google approval [A]; live merchants: Etsy, Wayfair [B]; Gemini web supported, app coming [A] | Vertical expansion delivered; admission controlled (approval-based) — apply early to reserve a slot |
| x402 | Agent-native payment rail | Linux Foundation governance (2026-07-14) [A]; 40+ members (premier: Visa, Mastercard, Amex, Stripe, Adyen, Fiserv, Google) [B]; Block joined [A]; Cloudflare Wallets enters on x402 but its no-domain-verification identity claim draws brand-squatting controversy [B] | Payment rail neutralized; identity verification is the open gap |
| MCP (tool ecosystem) | Agent tool-adoption standard | Spec 2026-07-28 (stateless core, multi round-trip requests, auth hardening) [A]; 2026 roadmap: Tasks primitive (SEP-1686) experimental, production gaps exposed [A]; Claude directory 950+ servers, Marketplace opened (2026-09-25) [A] | Directory distribution formalized; usage retention is the ranking signal |
| Domestic (Qwen / Yuanbao / Doubao) | Chinese AI shopping | Qwen app integrated Taobao, Alipay, Flash Purchase, Fliggy, Amap on 2026-01-15 (start-line milestone, earlier than the 05-11 full pipeline) [A]; Yuanbao × JD one-tap purchase [2026-09][B] | Chinese loop closed before the international camps; merchant-side entry points are fragmented, no unified protocol |

## 3. Timeline (by line, reverse chronological)

### ACP / Agentic Commerce (Stripe camp)

- [2026-09][A] Stripe Sessions: Shopify becomes the preferred catalog provider for the Agentic Commerce Suite; platforms Wix and commercetools added; Meta partnership for native checkout inside Facebook ads (discovery and purchase in one flow)
- [2026-09][A] ACS integrated with Google (AI Mode / Gemini); Quince, Fanatics, JD Sports coming soon
- [2026-08][A] Etsy and URBN live in production; machine payments supported (from Stripe's official 10-lessons post)

### UCP / Google camp

- [2026-09-25][A] UCP Lodging: Booking capability draft (`dev.ucp.lodging.booking`) merged into the protocol repo — formal entry into the Lodging domain (Lodging TC: Amadeus, Booking.com, Expedia, Google, Hilton, Marriott, Trip.com)
- [2026-10-05][A] Google UCP developer docs updated: waitlist application + Google approval required before going live on AI Mode / Gemini; Gemini web supported, app coming
- [2026-09][B] Google Merchant Center rolls out a UCP integration hub in the US (merchants self-select capabilities from native checkout to identity linking)
- [2026-09][B] Live UCP merchants: Etsy, Wayfair (orders completed inside AI Mode)
- [2026-08-25][A] UCP v2026-08-25 released: multi-vertical architecture rework, Grocery ready, 3DS2, independent capability versioning
- [2026-08-11][A] Lodging technical committee formed

### x402 / payment rail

- [2026-10][B] Cloudflare Wallets: stablecoin balances plus a cloudflare.pay identity for AI agents (built on x402, Linux Foundation hosted); identity claim has no domain-verification mechanism, already drawing brand-squatting and trust controversy — a live case of the identity-verification gap
- [2026-09][A] Block joins the x402 Foundation
- [2026-08][B] 40+ members; premier members include Visa, Mastercard, American Express, Stripe, Adyen, Fiserv, Google
- [2026-07-14][A] Linux Foundation announces the operational launch of the x402 Foundation (protocol contributed by Coinbase); the site's rolling 30-day figures are the fixed reading point (2026-09 reading: 75.41M transactions / $24.24M / 94.06K buyers / 22K sellers)
- [2026-06][B] Ecosystem landings: AWS Bedrock AgentCore Payments (preview), Arbitrum, Fireblocks Agentic Payments Suite, Casper mainnet

### MCP / tool ecosystem

- [2026-09-25][A] Claude Marketplace opens: plugins (MCP connectors / agent skills packaged), products, and service partners in one storefront
- [2026-09][A] Claude connector directory lists 950+ MCP servers; MCP Apps render interactive UI inside the conversation; enterprise-managed auth
- [2026-08-22][A] Official roadmap updated: Agentic Messaging Primitives is the priority area; the Tasks primitive (SEP-1686) shipped experimental, production use exposes lifecycle gaps (failure-retry semantics, result-expiry policy)
- [2026-07-28][A] Spec released: stateless core, Multi Round-Trip Requests, header routing, cacheable lists, auth hardening, extension framework
- [2026-09-14][B] Snipp's brand-rebate plugin listed in both the ChatGPT plugin directory and the Claude directory (no platform fees) — a new paid channel for brands into agent answers

### Domestic AI shopping

- [2026-01-15][A] Qwen app fully integrates Taobao, Alipay, Taobao Flash Purchase, Fliggy, Amap (food delivery, shopping, flight booking); Qwen consumer MAU passed 100M (2026-01-14)
- [2026-05-11][A] Qwen × Taobao full pipeline live (4B-SKU catalog; Qwen AI shopping assistant inside the Taobao app: AI try-on, AI coupon math, AI low-price sniping)
- [2026-07-15][B] Tencent Yuanbao × JD.com: one tap from a Yuanbao answer into a JD mini-program for purchases across all categories

## 4. Implications for Research Judgments

1. **Merchants no longer choose sides**: Visa Intelligent Commerce Connect (2026-04, [B]) offers a cross-protocol gateway (Visa TAP / Stripe MPP / OpenAI ACP) — an interoperability layer emerges; camp rivalry gives way to "accept on any protocol and reach everywhere"
2. **Directory distribution formalizes**: Claude Marketplace and the ChatGPT plugin directory (Shoppable, Snipp and others listed) show agent app directories reaching the platform-storefront phase — strengthening the H5 observation (catalog dividend window)
3. **Admission becomes gated**: UCP approval + ACS catalogs (Shopify preferred) mean protocol access is moving from open integration to platform review — apply early to reserve position; D3's review point (2026-10) now has sufficient evidence
4. **Trust infrastructure gap**: x402 scales but identity verification is missing (Cloudflare Wallets squatting case) — the M4-RQ4 research window opens

## 5. Cadence

- Monthly: update this page plus module conclusions in the same cycle
- Trigger: a major merchant-policy or settlement change in any protocol → register a review item on the decision board the same day
- Reading point: x402 site rolling 30-day figures, captured monthly

## 6. Next Steps

1. Research merchant-side admission paths for Chinese platforms (Yuanbao × JD, Qwen × Taobao merchant documentation) — feeds D3
2. Verify the full capability list of the Google Merchant Center UCP integration hub (native checkout / identity linking details)
3. Track the x402 identity-verification controversy (Cloudflare Wallets corrections or industry reactions)
