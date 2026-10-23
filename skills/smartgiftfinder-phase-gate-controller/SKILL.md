---
name: smartgiftfinder-phase-gate-controller
description: Control Smart Gift Finder phase scope, prevent premature automation or scaling, and decide whether a Codex task is audit-only, implementation-ready, safe to commit, or safe to push. Use before starting any new Smart Gift Finder phase, SEO/content expansion, product catalog expansion, distribution, automation, or deployment review.
---

# Smart Gift Finder Phase Gate Controller

## Purpose

Keep Smart Gift Finder work inside the correct phase and prevent unsafe scope jumps.

## Core Positioning

Smart Gift Finder is currently a controlled SEO + affiliate recommendation system. Do not treat it as a fully autonomous AI/content platform unless the user explicitly opens that phase.

## Scale Order

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

## Process

1. Identify the requested phase or task type.
2. Classify it as audit-only, safe small implementation, phase-gated implementation, or blocked.
3. Enforce hard constraints: no mass AI content, autopublishing, paid APIs, Google Indexing API automation, spam backlinks, direct Pinterest-to-Amazon flow, unscoped product additions, unscoped recommendation scoring changes, or push without approval.
4. Define required validations before editing.
5. Keep unrelated files unchanged.

## Severity

P0: production/security/revenue/indexing blocker.  
P1: key public page, build, affiliate route, or SEO validation failure.  
P2: SEO/content/internal-link/CRO improvement.  
P3: polish or future automation.

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
