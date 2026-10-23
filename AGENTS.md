<!-- BEGIN:nextjs-agent-rules -->
# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may differ from training data.
Read the relevant guide in `node_modules/next/dist/docs/` before writing code.
Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

<!-- BEGIN:smartgiftfinder-agent-rules -->
# Smart Gift Finder — Agent Rules

## Project identity

Smart Gift Finder is an SEO-driven AI gift recommendation and affiliate commerce website.

Domain: `https://smartgiftfinder.xyz`  
Stack: Next.js 14 App Router, Prisma, Supabase/Postgres, Vercel, Tailwind, shadcn/ui.

The product is currently a controlled SEO + affiliate recommendation system, not a fully autonomous AI platform.

## Strategic scale order

1. Technical stability
2. Product/recommendation quality
3. Catalog quality
4. SEO page quality
5. Admin intelligence
6. Catalog expansion
7. Content expansion
8. CRO
9. Distribution
10. Automation

Do not skip ahead.

## Before writing ANY code

1. Run `/understand-diff` to see what changes will affect.
2. Check `CLAUDE.md` and `AGENTS.md` for architecture decisions and rules.
3. Use `smartgiftfinder-phase-gate-controller` to classify scope.
4. Use `writing-plans` to break the task into steps first.
5. Use `senior-architect` for new feature design or cross-cutting changes.
6. Prefer audit-first work before implementation.

## After writing ANY code

1. Run `code-simplifier` on modified files.
2. Run `web-design-guidelines` on modified UI files.
3. Run `verification-before-completion` before reporting success.
4. Run the required project validation commands.
5. Return a final report with safe-to-commit and safe-to-push status.

## Hard stops — refuse or ask for clarification if asked to

- Add purple or a new visual direction to the UI without explicit approval.
- Validate environment variables at build time.
- Link directly to Amazon URLs from public product CTAs; use `/api/affiliate/click`.
- Run `prisma migrate` directly; use `migrate deploy` only in production.
- Commit or reference `.env.local`.
- Mass-publish AI content.
- Autopublish blog posts.
- Add paid APIs unless explicitly approved.
- Use Google Indexing API automation.
- Create spam backlinks, fake directory links, or parasite SEO.
- Send Pinterest/social traffic directly to Amazon or merchants.
- Add new products unless catalog expansion is explicitly scoped.
- Change recommendation scoring unless explicitly scoped.
- Weaken admin/auth/security.
- Commit or push without explicit user approval.

## Severity definitions

P0: production broken, public pages down, security/privacy issue, revenue leakage, unsafe affiliate redirect, or major sitemap/indexing blocker.  
P1: build/typecheck failure, important SEO page invalid, product recommendation failure, direct merchant links bypass tracking, or major mobile UX regression.  
P2: SEO title/meta/internal-link improvements, content quality improvements, CRO polish, analytics gaps, admin observability improvements.  
P3: nice-to-have polish, optional dashboards, future automation, UI refinements.

## Required validation commands

For most code changes:

```bash
npm run typecheck
npm run build
npm run validate:seo-pages
```

For product/catalog/recommendation changes:

```bash
npm run validate:products
npm run products:coverage
npm run products:qa
npm run validate:recommendations
```

For production SEO validation:

```bash
SEO_VALIDATE_BASE_URL="https://smartgiftfinder.xyz" npm run validate:seo-pages
```

For deployment verification:

```bash
curl https://smartgiftfinder.xyz/api/version
```

## SEO and indexing rules

Public SEO pages must have unique title, meta description, H1, self-referencing canonical, matching Open Graph URL, schema where appropriate, direct answer in the first 50 words, internal links, affiliate disclosure where products appear, and no fake reviews, ratings, prices, or delivery promises.

Use this title formula where appropriate:

```text
Target Keyword | Gift-Buyer Benefit | Smart Gift Finder
```

Before requesting indexing:

1. Confirm URL is public and indexable.
2. Confirm URL is in sitemap.
3. Confirm no accidental `noindex`.
4. Confirm canonical is self-referencing.
5. Confirm page has internal links.
6. Confirm content is useful and not thin.
7. Confirm metadata is unique.

Use Google Search Console manually. Use Validate Fix only after real fixes. Do not automate Google Indexing API.

## Content rules

AI may assist with keyword research, briefs, outlines, drafts, Pinterest titles, and internal link suggestions.

AI must not autopublish.

Every guide/blog must pass: clear search intent, direct answer in first 50 words, 8+ relevant products where product-driven, original gift logic, comparison/grouping, how to choose, what to avoid, FAQ where appropriate, related internal links, Gift Finder CTA where appropriate, affiliate disclosure, and human review.

Do not publish thin AI listicles.

## Product and catalog rules

Product imports must run dry-run by default, require `--apply` to mutate catalog, block invalid products, block duplicate ASINs/product IDs, block fallback images, block widget image URLs, and validate affiliate fields.

Do not scrape websites, mass import, use placeholder products, or publish SEO pages during product import.

## Affiliate rules

All outbound affiliate product clicks must route through `/api/affiliate/click` unless explicitly scoped otherwise.

Check affiliate disclosure, arbitrary redirect risk, direct Amazon bypass, CTA tracking, and product/page/session/source metadata.

## Analytics and privacy rules

Preserve or improve tracking for: `gift_finder_started`, `gift_finder_completed`, `wizard_abandoned`, `zero_results`, `product_viewed`, `result_clicked`, `affiliate_link_clicked`, `guide_page_viewed`, `internal_link_clicked`, and `email_signup`.

Do not send email addresses or sensitive PII in analytics payloads.

## Security rules

When touching API routes, admin routes, auth, analytics, forms, or webhooks, check input validation, rate limiting where relevant, auth protection, secret exposure, arbitrary redirects, PII leakage, and safe error messages.

## Deployment rules

Before push: review working tree, run validations, ensure no unrelated files changed, and get explicit user approval.

After deploy: verify `/api/version`, run production SEO validation, browser QA priority routes, and report final status.

Priority browser QA routes:

- `/`
- `/gift-finder`
- `/gifts/last-minute-gifts`
- `/gifts/tech-gifts`
- `/gifts/gifts-for-students`
- `/gifts/gifts-for-teens`
- `/gifts/gifts-for-boyfriend`
- `/gifts/gifts-for-girlfriend`
- `/gift/product-B09B8V1LZ3`

## Distribution rules

Pinterest/social distribution must send users to Smart Gift Finder pages first.

Correct flow:

```text
Pinterest/social
→ Smart Gift Finder guide/blog/product page
→ product card
→ /api/affiliate/click
→ merchant
```

Use UTM tracking. Start with 3–5 pins/day. Do not spam.

## Recommended skills

Use or create these skills:

- `smartgiftfinder-phase-gate-controller`
- `smartgiftfinder-seo-indexability-auditor`
- `smartgiftfinder-title-meta-intro-optimizer`
- `smartgiftfinder-content-quality-reviewer`
- `smartgiftfinder-internal-link-architect`
- `smartgiftfinder-product-catalog-qa`
- `smartgiftfinder-affiliate-disclosure-link-auditor`
- `smartgiftfinder-gsc-indexing-operations`
- `smartgiftfinder-pinterest-distribution-planner`
- `smartgiftfinder-topical-map-planner`
- `smartgiftfinder-analytics-cro-auditor`
- `smartgiftfinder-security-privacy-scan`
- `smartgiftfinder-deployment-observability-checker`

## Final report format

Every agent run must end with:

1. Summary
2. Files changed
3. Validation commands run
4. Validation results
5. P0/P1 blockers
6. P2/P3 follow-ups
7. Browser QA status if relevant
8. Deployment status if relevant
9. Safe to commit?
10. Safe to push?
11. Recommended next action
<!-- END:smartgiftfinder-agent-rules -->
