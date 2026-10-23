---
name: smartgiftfinder-content-quality-reviewer
description: Review Smart Gift Finder gift guides, blog posts, and SEO pages for quality, uniqueness, AI-content risk, affiliate compliance, and publication readiness. Use before publishing or upgrading SEO content, especially blog automation or answer-first gift articles.
---

# Smart Gift Finder Content Quality Reviewer

## Purpose

Prevent thin, duplicate, mass AI, or low-trust content from being published.

## Required Quality Checklist

Each public guide/blog page must have:

- clear search intent
- direct answer in first 50 words
- unique title/meta/H1
- original gift logic
- 8+ relevant products where product-driven
- comparison table or structured grouping where useful
- how to choose section
- what to avoid section
- FAQ where appropriate
- related internal links
- Gift Finder CTA where appropriate
- visible affiliate disclosure when product links appear
- no fake reviews, ratings, prices, or delivery promises
- no copied/paraphrased competitor content
- no raw markdown artifacts
- no unresolved product-card placeholders

## AI Content Rules

AI may assist with briefs, outlines, drafts, and Pinterest titles. AI must not autopublish. Human review is required before publishing.

## Process

1. Identify page type: guide, blog, product, landing page.
2. Check product coverage and content depth.
3. Check affiliate disclosure and internal links.
4. Flag P0/P1/P2/P3 issues.
5. Recommend publish, improve, or defer.

## Validation

```bash
npm run typecheck
npm run build
npm run validate:seo-pages
```

If product cards or coverage are touched:

```bash
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
