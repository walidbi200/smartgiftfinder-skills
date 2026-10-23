---
name: smartgiftfinder-deployment-observability-checker
description: Verify Smart Gift Finder deployment readiness and production observability, including validations, browser QA routes, /api/version commit verification, Vercel deployment health, and safe-to-commit/push decisions. Use before commit, before push, and after deployment.
---

# Smart Gift Finder Deployment Observability Checker

## Purpose

Confirm code is safe to commit, push, and verify in production.

## Before Commit

Check:

- focused diff only
- no unrelated files
- no secrets
- no `.env.local`
- no direct Amazon public CTAs
- validations passed
- working tree understood

## Before Push

User approval is required.

## After Deploy

Verify:

```bash
curl https://smartgiftfinder.xyz/api/version
SEO_VALIDATE_BASE_URL="https://smartgiftfinder.xyz" npm run validate:seo-pages
```

## Priority Browser QA Routes

- `/`
- `/gift-finder`
- `/gifts/last-minute-gifts`
- `/gifts/tech-gifts`
- `/gifts/gifts-for-students`
- `/gifts/gifts-for-teens`
- `/gifts/gifts-for-boyfriend`
- `/gifts/gifts-for-girlfriend`
- `/gift/product-B09B8V1LZ3`

## Required Local Validation

```bash
npm run typecheck
npm run build
npm run validate:seo-pages
```

For product/recommendation changes:

```bash
npm run validate:products
npm run products:coverage
npm run products:qa
npm run validate:recommendations
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
