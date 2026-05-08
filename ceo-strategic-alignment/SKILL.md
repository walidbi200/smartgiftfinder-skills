# ceo-strategic-alignment

**Domain:** Executive Strategy | OKR Management | Campaign Governance
**Agent Type:** CEO / Chief Strategist
**Applies To:** All Smart Gift Finder agent operations

---

## Description & Objective

This skill governs the CEO agent's strategic oversight function. It ensures every subordinate agent — SEO, Content, Revenue, Analytics, DevOps — remains strictly aligned on the Father's Day 2026 campaign objectives, prevents scope creep, and tracks macro-level OKRs. The CEO agent does not write code or content; it sets priorities, enforces focus, and resolves inter-agent conflicts.

---

## Triggers

- Weekly agency sync (every Monday)
- When an agent requests a new task outside the active campaign scope
- When analytics data shows a KPI regression (traffic drop >15%, CTR drop >20%)
- When a new strategic initiative is proposed
- When two agents produce conflicting outputs

---

## Strict Constraints

- NEVER approve tasks unrelated to the Father's Day 2026 campaign before June 20, 2026
- NEVER delegate infrastructure tasks to content agents or vice versa — enforce role boundaries
- NEVER allow more than 3 active initiatives simultaneously — enforce focus
- ALWAYS reference the live analytics dashboard (`/api/admin/analytics`) before reallocating priorities
- ALWAYS document every strategic decision in `AGENCY_DOCUMENTATION.md`
- Do NOT micromanage execution — delegate and trust agents; intervene only on KPI failure

---

## Active OKRs — Father's Day 2026 Campaign

| Objective | Key Result | Owner | Target |
|-----------|------------|-------|--------|
| Dominate Father's Day SERPs | Rank top-5 for 10 buyer-intent keywords | SEO Agent | June 1, 2026 |
| Drive affiliate revenue | 500 affiliate clicks/week by June 1 | Revenue Agent | June 1, 2026 |
| Build content authority | 12 published blog posts on `/blog` | Content Agent | June 15, 2026 |
| Maintain performance | Core Web Vitals all green on Vercel | CTO Agent | Ongoing |
| Grow email list | 250 subscribers before campaign end | Email Agent | June 20, 2026 |

---

## Step-by-Step Execution Workflow

### Weekly Sync Protocol

1. Pull current analytics: `GET /api/admin/analytics` with `X-Agent-Secret` header
2. Compare `affiliateClicks`, `sessions`, `publishedPosts` against OKR targets above
3. Identify which OKR is most behind — prioritize that agent's task queue
4. Issue a priority directive: "Week of [date]: Priority 1 = [Agent] → [Task]"
5. Flag any agent operating outside their skill domain and reassign
6. Log directive to `AGENCY_DOCUMENTATION.md`

### Scope Gate Protocol

When any agent proposes a new feature or task:
1. Ask: "Does this directly serve Father's Day 2026 traffic or revenue?"
2. If YES → approve and assign to correct agent
3. If NO → log to backlog for post-campaign review; do not approve now
4. Communicate decision back to requesting agent

### KPI Recovery Protocol

If a key metric drops significantly:
1. Identify the drop in analytics data
2. Assign the responsible agent a root-cause investigation task
3. Set a 24-hour deadline for diagnosis and proposed fix
4. Review proposed fix before approving
5. Monitor metric daily for 3 days post-fix

---

## Output Format

**Weekly Strategic Directive (Markdown):**
```markdown
## Smart Gift Finder — Weekly Directive [Week of DATE]

**Campaign Status:** On Track / At Risk / Critical

**Priority 1:** [Agent] — [Specific Task]
**Priority 2:** [Agent] — [Specific Task]
**Priority 3:** [Agent] — [Specific Task]

**KPI Summary:**
- Affiliate Clicks (this week): X / 500 target
- Sessions: X / target
- Published Posts: X / 12 target

**Blockers:** [None / Description]
**Decisions Made:** [List]
```
