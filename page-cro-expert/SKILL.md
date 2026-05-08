# page-cro-expert

**Domain:** Conversion Rate Optimization | Affiliate CTR | UX Psychology
**Agent Type:** Revenue Agent (CRO Specialist)
**Applies To:** All gift guide pages and landing pages on Smart Gift Finder

---

## Description & Objective

This skill maximizes affiliate link click-through rates on every page. It defines the exact placement, design, and copy logic for every CTA button, pricing table, and product card on Smart Gift Finder. A 1% improvement in CTR across all pages compounds directly into revenue. This skill prevents agents from placing CTAs in low-converting positions and ensures every above-the-fold pixel is working toward a click.

---

## Triggers

- When a new landing page or blog post is being reviewed before publishing
- When a page's affiliate CTR drops below 5% (Analytics Agent alert)
- When running a structured CRO audit on an existing page
- When the Revenue Agent is inserting products into a content draft

---

## Strict Constraints

- NEVER place the first affiliate CTA below the fold on mobile — it must appear within the first 600px of the page
- NEVER use the CTA text "Buy Now" — it is consistently the lowest-performing variant
- ALWAYS show the product price prominently — hidden pricing kills conversions
- NEVER use more than one CTA style per page — maintain visual consistency
- ALWAYS include "Check Price on Amazon →" as the primary CTA text
- NEVER place more than 2 products per paragraph block — creates decision paralysis
- ALWAYS use a contrasting button color (amber/orange) that stands out from the page background
- NEVER rely on text links alone for primary CTAs — buttons outperform links by 2–4x

---

## CTA Placement Rules

### Above the Fold (Priority Zone)
- 1 featured product with CTA must appear before any scroll is required on mobile
- Hero section may include a soft CTA: "Find His Perfect Gift →" linking to the quiz

### In-Content Product Cards
- CTA button appears at the bottom of every product card
- Star rating visible near product title (trust signal)
- Price displayed in large, bold text immediately above the CTA button
- Shipping badge ("Prime — Ships in 2 days") shown when available

### Mid-Article CTA Strip
- After every 400 words, insert a "Top Pick" callout box with 1 product and CTA
- This captures readers who skim and don't scroll to the full product grid

### End-of-Article CTA
- Close every article with a quiz CTA: "Not sure which to pick? Let our AI choose →"
- Link to `/gift-finder` with UTM params for tracking: `?utm_source=blog&utm_campaign=fathers-day-2026`

---

## Pricing Table Format

Use this format for multi-product comparisons:

```
| Product         | Price  | Rating | Ships Prime | CTA              |
|-----------------|--------|--------|-------------|------------------|
| [Product A]     | $39.99 | ⭐ 4.7 | ✅ Yes       | Check Price →    |
| [Product B]     | $24.99 | ⭐ 4.5 | ✅ Yes       | Check Price →    |
| [Product C]     | $59.99 | ⭐ 4.8 | ✅ Yes       | Check Price →    |
```

Rules:
- Maximum 5 products per table
- Sort by rating descending by default
- "Check Price →" must link through `/api/affiliate/click`
- Include a "Best Value" or "Editor's Pick" badge on 1 product per table

---

## Step-by-Step CRO Audit Workflow

1. **Mobile viewport check** — Does a product CTA appear before the first scroll? If not, move the top product card up.
2. **CTA copy audit** — Is any CTA using forbidden copy ("Buy Now", "Shop Here", "Click")? Replace all with approved variants.
3. **Price visibility** — Is every price displayed in ≥ 18px bold font? If not, update the component.
4. **Color contrast** — Does the CTA button have sufficient contrast against the background? Amber (#F59E0B) on white passes WCAG AA.
5. **Decision paralysis check** — Are more than 2 products shown without visual separation? Add section breaks or badges.
6. **Mid-article CTA** — Count words; insert "Top Pick" callout after every 400 words if not present.
7. **End CTA** — Confirm quiz CTA is the last element before the footer with correct UTM params.

---

## Output Format

**CRO Audit Report (Markdown):**
```markdown
## CRO Audit — /blog/[slug] — [Date]

**CTR Baseline:** X% (from PostHog)
**Target CTR:** 8%

| Issue | Location | Fix Applied |
|-------|----------|-------------|
| First CTA below fold on mobile | Hero section | Moved product card above intro text |
| "Buy Now" CTA copy | Product cards (×4) | Replaced with "Check Price on Amazon →" |
| Price not bold | Line 87 | Applied `font-bold text-2xl` Tailwind class |

**Expected CTR Impact:** +2–3%
**Status:** Changes applied — monitor for 7 days
```
