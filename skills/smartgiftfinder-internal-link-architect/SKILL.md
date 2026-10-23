---
name: smartgiftfinder-internal-link-architect
description: Plan and implement Smart Gift Finder internal linking for SEO discovery, click-depth reduction, topical authority, related guide modules, blog-to-guide links, and Gift Finder CTAs. Use when improving indexing, authority, or page relationships.
---

# Smart Gift Finder Internal Link Architect

## Purpose

Improve crawl discovery, indexing, topical authority, and user navigation through safe internal links.

## Targets

Prioritize links to:

- `/gift-finder`
- `/gifts/last-minute-gifts`
- `/gifts/gifts-for-students`
- `/gifts/gifts-for-teens`
- `/gifts/gifts-for-boyfriend`
- `/gifts/gifts-for-girlfriend`
- `/gifts/tech-gifts`
- `/gifts/gifts-under-50`
- `/blog`
- published blog posts

## Process

1. Find weakly linked or orphan pages.
2. Add links only where contextually useful.
3. Reduce click depth for priority pages.
4. Use descriptive anchors.
5. Avoid exact-match anchor spam.
6. Preserve UX; do not clutter pages.

## Good Anchors

- thoughtful last-minute gifts
- useful gifts for students
- tech gifts under $100
- gifts under $50
- personalized gift finder
- practical gifts they will actually use

## Bad Anchors

- click here
- read more
- this page

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
