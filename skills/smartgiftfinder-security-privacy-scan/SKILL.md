---
name: smartgiftfinder-security-privacy-scan
description: Review Smart Gift Finder security and privacy risks when touching admin routes, API routes, analytics, email capture, affiliate redirects, webhooks, credentials, or deployment metadata. Use before completing any change that could expose data or weaken controls.
---

# Smart Gift Finder Security and Privacy Scan

## Purpose

Prevent data leaks, auth regressions, unsafe redirects, and tracking/privacy mistakes.

## Check When Touching

- API routes
- admin routes
- auth/session logic
- analytics/event endpoints
- email capture
- affiliate redirects
- webhooks
- environment variables
- deployment metadata
- automation integrations

## Checks

- admin auth remains enforced
- input validation exists
- public endpoints are rate limited where needed
- affiliate redirects reject unsafe arbitrary URLs
- no secrets exposed
- no `.env.local` committed or referenced
- no email/PII in analytics payloads
- safe error messages
- no build-time environment validation
- `/api/version` exposes only safe deployment metadata

## Hard Stops

Refuse or ask for clarification before:

- weakening admin/auth/security
- exposing secrets or env values
- committing `.env.local`
- adding arbitrary redirect behavior
- adding unreviewed webhook automation

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
