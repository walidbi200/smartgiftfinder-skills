---
name: smartgiftfinder-analytics-cro-auditor
description: Audit Smart Gift Finder analytics, CRO funnels, events, UTM/source attribution, affiliate click performance, email signup tracking, and admin visibility. Use for Phase 8/9 CRO, source tracking, and conversion optimization tasks.
---

# Smart Gift Finder Analytics and CRO Auditor

## Purpose

Protect event tracking, funnel visibility, and conversion optimization while improving growth.

## Core Events

Preserve or improve:

- gift_finder_started
- gift_finder_completed
- wizard_abandoned
- zero_results
- product_viewed
- result_clicked
- affiliate_link_clicked
- guide_page_viewed
- internal_link_clicked
- email_signup

## Privacy Rules

- Do not send email addresses or sensitive PII in analytics payloads.
- Keep subscriber data inside authenticated admin only.
- Do not expose admin analytics publicly.

## CRO Checks

- Gift Finder start → completion
- completion → affiliate click
- completion → email signup
- product view → affiliate click
- guide page view → product click
- source/UTM → page → affiliate click
- internal link destination metadata

## Validation

```bash
npm run typecheck
npm run build
npm run validate:seo-pages
```

If public event endpoints are touched, also perform a security/rate-limit review.

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
