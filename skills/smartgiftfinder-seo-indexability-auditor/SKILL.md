---
name: smartgiftfinder-seo-indexability-auditor
description: Audit Smart Gift Finder crawlability, sitemap, robots.txt, canonicals, meta robots/noindex, structured data, duplicate metadata, and Google indexing readiness. Use for SEO indexing tasks, GSC issues, crawled/discovered-not-indexed analysis, or before publishing/upgrading guide/blog pages.
---

# Smart Gift Finder SEO Indexability Auditor

## Purpose

Find technical reasons Google may fail to crawl, understand, index, or rank Smart Gift Finder pages.

## Inspect

- `/robots.txt`
- `/sitemap.xml`
- canonical URLs
- meta robots / noindex
- Open Graph URLs
- schema markup
- duplicate titles/metas/H1s
- 404s and redirects
- draft/deferred/fallback pages
- admin/API/private routes
- public guide/blog/product routes

## Priority URLs

- `/`
- `/gift-finder`
- `/gifts/last-minute-gifts`
- `/gifts/tech-gifts`
- `/gifts/gifts-for-students`
- `/gifts/gifts-for-teens`
- `/gifts/gifts-for-boyfriend`
- `/gifts/gifts-for-girlfriend`
- `/gifts/gifts-under-50`
- `/blog`
- published blog posts
- public product pages if included in sitemap

## Rules

- Public SEO pages must be indexable unless intentionally excluded.
- Admin, API, auth, drafts, tests, and fallback pages must not be indexed.
- Sitemap must include only published public canonical URLs.
- Canonicals must be self-referencing for public pages.
- Do not request indexing before fixing technical/content/internal-link issues.
- Do not implement Google Indexing API automation.

## Validation

```bash
npm run typecheck
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
