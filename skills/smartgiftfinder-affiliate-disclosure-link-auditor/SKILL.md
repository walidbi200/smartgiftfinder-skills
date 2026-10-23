---
name: smartgiftfinder-affiliate-disclosure-link-auditor
description: Audit Smart Gift Finder affiliate link routing, disclosures, CTA safety, tracking metadata, and revenue-leak prevention. Use when modifying product cards, guide pages, product pages, affiliate click APIs, Pinterest/social traffic, or monetization flows.
---

# Smart Gift Finder Affiliate Disclosure and Link Auditor

## Purpose

Protect revenue attribution, affiliate compliance, and user trust.

## Rules

- All outbound product affiliate clicks must route through `/api/affiliate/click`.
- Do not expose direct Amazon affiliate links in public CTAs/cards unless explicitly scoped.
- Reject unsafe arbitrary redirect URLs.
- Preserve product/page/session/source tracking where available.
- Show affiliate disclosure anywhere product affiliate links appear.
- Pinterest/social traffic must go to Smart Gift Finder pages first, not directly to merchants.

## Correct Flow

```text
Pinterest/social/search
→ Smart Gift Finder guide/blog/product page
→ product card / CTA
→ /api/affiliate/click
→ merchant
```

## Checks

- product cards
- guide pages
- blog product embeds
- product detail pages
- sticky CTAs
- Gift Finder results
- affiliate click API
- UTM/source metadata

## Validation

```bash
npm run typecheck
npm run build
npm run validate:seo-pages
npm run validate:products
npm run products:coverage
npm run products:qa
```

## Output

Return:
- Summary
- Files inspected/changed
- P0/P1 blockers
- P2/P3 follow-ups
- Validation commands run
- Validation results
- Safe to commit?
- Safe to push?
- Recommended next action
