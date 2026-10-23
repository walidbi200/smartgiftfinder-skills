---
name: smartgiftfinder-product-catalog-qa
description: Validate Smart Gift Finder product catalog safety, recommendation eligibility, product coverage, duplicate ASINs/slugs/titles, images, affiliate metadata, and guide publication readiness. Use before product imports, catalog expansion, or product-backed SEO content.
---

# Smart Gift Finder Product Catalog QA

## Purpose

Protect product quality, recommendation eligibility, and SEO publication readiness.

## Checks

- active public curated product count
- recommendation eligibility
- duplicate ASINs/product IDs/slugs/titles
- fallback images
- widget image URLs
- remote image validity
- affiliate fields
- unknown tags
- product-card rendering
- product coverage per guide/blog
- at least 8 relevant products before new guide publication

## Import Rules

- dry-run by default
- require `--apply` to mutate catalog
- do not scrape websites
- do not mass import
- do not use placeholder products
- do not publish SEO pages during product import

## Validation

```bash
npm run validate:products
npm run products:coverage
npm run products:qa
npm run validate:recommendations
npm run build
npm run validate:seo-pages
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
