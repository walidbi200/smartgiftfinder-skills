# Smart Gift Finder — Paperclip Skill Ecosystem

> Production-grade agent skills for the Smart Gift Finder autonomous AI commerce company.

**Version:** v2.0
**Status:** Production Live
**Platform:** Paperclip AI + DigitalOcean VPS + Vercel
**Campaign:** Father's Day 2026

---

## What This Repository Is

This repository contains the custom skill library that powers the **Smart Gift Finder** autonomous agency. Each skill is a specialized instruction set loaded by a Paperclip agent to perform a specific role within the AI commerce workflow.

These are not generic AI prompts. Each skill is purpose-built for the Smart Gift Finder production system — referencing real APIs, real database schemas, real deployment infrastructure, and real business objectives.

---

## Full Skill Roster

```
smartgiftfinder-skills/
│
├── 🎯 CEO & Strategy Pod
│   ├── ceo-strategic-alignment/
│   └── brand-narrative-enforcer/
│
├── 🔍 SEO Pod
│   ├── seo-programmatic-engine/
│   ├── ai-seo-optimizer/
│   └── schema-markup-architect/
│
├── ✍️ Content & Conversion Pod
│   ├── autonomous-content-factory/
│   ├── landing-page-generator/
│   └── page-cro-expert/
│
├── 💰 Revenue Pod
│   └── affiliate-revenue-optimizer/
│
├── 📊 Analytics Pod
│   └── ai-commerce-analytics/
│
├── 📧 Email Pod
│   └── lifecycle-email-architect/
│
├── 🔧 Engineering Pod
│   ├── recommendation-engine-architect/
│   ├── smartgiftfinder-devops/
│   ├── nextjs-performance-profiler/
│   └── systematic-bug-squasher/
│
└── README.md
```

---

## Skill Reference

### CEO & Strategy Pod

| Skill | Purpose |
|-------|---------|
| `ceo-strategic-alignment` | Weekly OKR tracking, scope gate enforcement, inter-agent priority management |
| `brand-narrative-enforcer` | CMO review gate — eliminates AI clichés, enforces voice consistency, quality scoring |

### SEO Pod

| Skill | Purpose |
|-------|---------|
| `seo-programmatic-engine` | Father's Day keyword clusters, URL pattern generation, metadata automation |
| `ai-seo-optimizer` | Generative Engine Optimization — structures content for AI Overview and Perplexity citations |
| `schema-markup-architect` | JSON-LD generation (Article, FAQPage, ItemList, Organization) for Next.js pages |

### Content & Conversion Pod

| Skill | Purpose |
|-------|---------|
| `autonomous-content-factory` | Full SEO→Content→CMO→Publish pipeline, blog post generation, QA checklist |
| `landing-page-generator` | Next.js/Tailwind TSX components for gift guide landing pages |
| `page-cro-expert` | CTA placement rules, pricing table format, affiliate CTR optimization |

### Revenue Pod

| Skill | Purpose |
|-------|---------|
| `affiliate-revenue-optimizer` | Product ranking heuristics, CTA copy library, seasonal monetization calendar |

### Analytics Pod

| Skill | Purpose |
|-------|---------|
| `ai-commerce-analytics` | PostHog/GA4 event taxonomy, KPI definitions, funnel analysis, analytics API |

### Email Pod

| Skill | Purpose |
|-------|---------|
| `lifecycle-email-architect` | Father's Day countdown drip, welcome sequence, re-engagement flows via Resend |

### Engineering Pod

| Skill | Purpose |
|-------|---------|
| `recommendation-engine-architect` | pgvector retrieval pipeline, hybrid ranking, Redis caching |
| `smartgiftfinder-devops` | PM2 nuclear restart, OpenRouter config, Vercel env sync, auth debugging |
| `nextjs-performance-profiler` | Core Web Vitals monitoring, LCP/CLS/INP optimization workflows |
| `systematic-bug-squasher` | Evidence-based debugging for Next.js 500s, Prisma errors, auth failures |

---

## Recommended Agent Assignments

```
CEO Agent
  └── ceo-strategic-alignment
      ai-commerce-analytics (KPI reads)

CMO Agent
  └── brand-narrative-enforcer
      autonomous-content-factory
      page-cro-expert

CTO Agent
  └── smartgiftfinder-devops
      recommendation-engine-architect
      nextjs-performance-profiler
      systematic-bug-squasher

SEO Agent
  └── seo-programmatic-engine
      ai-seo-optimizer
      schema-markup-architect

Content Agent
  └── autonomous-content-factory
      landing-page-generator
      brand-narrative-enforcer (apply rules)

Revenue Agent
  └── affiliate-revenue-optimizer
      page-cro-expert
      ai-commerce-analytics

Analytics Agent
  └── ai-commerce-analytics

Email Agent
  └── lifecycle-email-architect
```

---

## Production Workflow

The full content → revenue pipeline:

```
CEO Agent (ceo-strategic-alignment)
  → Sets weekly priority directive
  ↓
SEO Agent (seo-programmatic-engine + ai-seo-optimizer)
  → Keyword cluster + GEO content brief
  ↓
Content Agent (autonomous-content-factory + landing-page-generator)
  → Draft article or TSX landing page component
  ↓
CMO Review (brand-narrative-enforcer + page-cro-expert)
  → Quality gate — approve / revise / reject
  ↓
Revenue Agent (affiliate-revenue-optimizer)
  → Injects ranked affiliate products + CTA optimization
  ↓
Schema Agent (schema-markup-architect)
  → Adds JSON-LD to page
  ↓
POST /api/admin/blog/publish → status: "published"
  ↓
Analytics Agent (ai-commerce-analytics)
  → Monitors CTR, funnel, revenue attribution
  ↓
Email Agent (lifecycle-email-architect)
  → Announces new content to subscriber list
```

---

## Paperclip Integration

### Step 1 — Add skill source to Paperclip config

```json
{
  "skillSources": [
    {
      "type": "github",
      "url": "https://github.com/walidbi200/smartgiftfinder-skills",
      "branch": "main"
    }
  ]
}
```

### Step 2 — Assign skills in each agent's AGENT.md

```markdown
## Skills
- smartgiftfinder-skills/seo-programmatic-engine
- smartgiftfinder-skills/ai-seo-optimizer
```

### Step 3 — Configure VPS environment

```bash
export OPENAI_API_KEY="your-openrouter-key"
export OPENAI_BASE_URL="https://openrouter.ai/api/v1"
export PAPERCLIP_AGENT_SECRET="your-shared-secret"
unset ANTHROPIC_API_KEY
unset ANTHROPIC_AUTH_TOKEN
```

### Step 4 — Start the agency runtime

```bash
pm2 start $(which paperclipai) --name "SmartGiftAgency" -- run
pm2 save
```

---

## Authentication

All agent-to-API calls require:

```
Header: X-Agent-Secret: <PAPERCLIP_AGENT_SECRET>
```

Debug endpoint:
```bash
curl -H "X-Agent-Secret: <secret>" \
  https://smartgiftfinder.xyz/api/admin/debug
# Expected: { "match": true, "stored_length": 64 }
```

---

## Key URLs

| Resource | URL |
|----------|-----|
| Production site | https://smartgiftfinder.xyz |
| Main repository | https://github.com/walidbi200/smart-gift-finder-v2 |
| Skills repository | https://github.com/walidbi200/smartgiftfinder-skills |
| Analytics API | https://smartgiftfinder.xyz/api/admin/analytics |
| Health check | https://smartgiftfinder.xyz/api/health |
| Debug endpoint | https://smartgiftfinder.xyz/api/admin/debug |

---

## Contributing

Update skills when infrastructure, strategy, or API surfaces change. Each update should be a focused commit:

```bash
git commit -m "skill(seo): add Summer 2026 keyword clusters"
git commit -m "skill(devops): add Redis configuration protocol"
git commit -m "feat: add new-skill-name for [agent]"
```
