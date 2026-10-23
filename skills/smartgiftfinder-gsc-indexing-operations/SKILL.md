---
name: smartgiftfinder-gsc-indexing-operations
description: Create and maintain Smart Gift Finder Google Search Console indexing operations: sitemap URL inventory, index status tracker, request-indexing checklist, Validate Fix procedure, and crawled/discovered-not-indexed remediation. Use for indexing issues or Phase 9 SEO operations.
---

# Smart Gift Finder GSC Indexing Operations

## Purpose

Run a repeatable indexing workflow without unsafe automation.

## Tracker Schema

```text
URL
Page Type
Target Keyword
In Sitemap?
Canonical OK?
Noindex?
GSC Status
Indexed?
Coverage Status
Last Checked
Internal Links Count
Click Depth
Needs Fix?
Fix Type
Request Indexing Date
Validate Fix Date
Notes
```

## GSC Status Handling

- Submitted and indexed: monitor.
- Discovered, currently not indexed: improve internal links, sitemap, and authority signals.
- Crawled, currently not indexed: improve distinct value, title/meta, content quality, and internal links.
- Duplicate/canonical issue: fix canonical or consolidate intent.
- Page with redirect: verify intentional.
- 404: remove from sitemap or restore page.
- Blocked/noindex: confirm intentional.
- Server error: treat as P0/P1 depending on scope.

## Process

1. Export sitemap URLs.
2. Check GSC Pages → All submitted pages.
3. Inspect priority URLs manually.
4. Fix real issues first.
5. Request indexing only for high-quality important pages.
6. Use Validate Fix only after actual fixes.
7. Recheck after 7, 14, and 30 days.

## Do Not

- Do not use Google Indexing API automation.
- Do not request indexing for thin/fallback/draft pages.
- Do not repeatedly click Validate Fix without changes.

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
