# Smart Gift Finder — Paperclip Skill Ecosystem

> Production-grade agent skills for the Smart Gift Finder autonomous AI commerce company.

**Version:** v1.0
**Status:** Production Live
**Platform:** Paperclip AI + DigitalOcean VPS + Vercel
**Campaign:** Father's Day 2026

---

## What This Repository Is

This repository contains the custom skill library that powers the **Smart Gift Finder** autonomous agency. Each skill is a specialized instruction set loaded by a Paperclip agent to perform a specific role within the AI commerce workflow.

These are not generic AI prompts. Each skill is purpose-built for the Smart Gift Finder production system — referencing real APIs, real database schemas, real deployment infrastructure, and real business objectives.

---

## Skill Architecture

```
smartgiftfinder-skills/
│
├── recommendation-engine-architect/   ← AI recommendation pipeline & vector search
├── seo-programmatic-engine/           ← Programmatic SEO & keyword strategy
├── affiliate-revenue-optimizer/       ← CTR optimization & affiliate monetization
├── ai-commerce-analytics/             ← Event tracking, KPIs & funnel analysis
├── smartgiftfinder-devops/            ← Infrastructure, PM2, Vercel, OpenRouter
└── autonomous-content-factory/        ← AI blog generation & publishing pipeline
```

---

## Skill Summary

| Skill | Agent | Primary Focus |
|-------|-------|---------------|
| `recommendation-engine-architect` | CTO / Backend Agent | pgvector, hybrid ranking, Redis caching |
| `seo-programmatic-engine` | SEO Agent | Keyword clustering, landing page scaling |
| `affiliate-revenue-optimizer` | Revenue Agent | CTR optimization, affiliate monetization |
| `ai-commerce-analytics` | Analytics Agent | PostHog events, KPIs, funnel tracking |
| `smartgiftfinder-devops` | CTO / DevOps Agent | PM2, Vercel, OpenRouter, auth debugging |
| `autonomous-content-factory` | Content Agent + CMO | AI content pipeline, blog publishing |

---

## Recommended Agent Assignments

```
CEO Agent
  └── Uses: seo-programmatic-engine (strategic review)
           ai-commerce-analytics (weekly KPI reports)

CTO Agent
  └── Uses: smartgiftfinder-devops
           recommendation-engine-architect

CMO Agent
  └── Uses: autonomous-content-factory
           seo-programmatic-engine
           affiliate-revenue-optimizer

SEO Agent
  └── Uses: seo-programmatic-engine

Content Agent
  └── Uses: autonomous-content-factory

Revenue Agent
  └── Uses: affiliate-revenue-optimizer
           ai-commerce-analytics

Analytics Agent
  └── Uses: ai-commerce-analytics
```

---

## Paperclip Integration

### Step 1 — Add this repository to your Paperclip workspace

In your Paperclip configuration, add the skills repository as a skill source:

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

### Step 2 — Assign skills to agents

In each agent's `AGENT.md` or `TOOLS.md`, reference the relevant skill:

```markdown
## Skills
- smartgiftfinder-skills/seo-programmatic-engine
- smartgiftfinder-skills/autonomous-content-factory
```

### Step 3 — Configure environment variables on VPS

```bash
export OPENAI_API_KEY="your-openrouter-key"
export OPENAI_BASE_URL="https://openrouter.ai/api/v1"
export PAPERCLIP_AGENT_SECRET="your-shared-secret"
```

### Step 4 — Start the agent runtime

```bash
pm2 start $(which paperclipai) --name "SmartGiftAgency" -- run
pm2 save
```

---

## Production Workflow

The full content → revenue pipeline runs as follows:

```
SEO Agent (seo-programmatic-engine)
  → Researches keywords, identifies opportunities, creates campaign brief
  ↓
Content Agent (autonomous-content-factory)
  → Writes SEO article with embedded product slots
  ↓
CMO Review (autonomous-content-factory — CMO checklist)
  → Validates quality, brand voice, CTA compliance
  ↓
Revenue Agent (affiliate-revenue-optimizer)
  → Selects and ranks affiliate products for insertion
  ↓
API Publish → POST /api/admin/blog/publish
  → BlogPost record created with status: "published"
  ↓
Analytics Agent (ai-commerce-analytics)
  → Monitors CTR, funnel conversion, revenue attribution
```

---

## Authentication

All agent-to-API communication is secured via:

```
Header: X-Agent-Secret: <PAPERCLIP_AGENT_SECRET>
```

The middleware at `src/middleware.ts` validates this header for all `/api/admin/*` routes.

Debug endpoint:
```bash
curl -H "X-Agent-Secret: <secret>" \
  https://smartgiftfinder.xyz/api/admin/debug
```

---

## Contributing

Skills are living documents. Update them when:
- Infrastructure changes (new models, new services)
- Business strategy shifts (new campaigns, new verticals)
- New API endpoints are added to the main application
- Performance data suggests workflow improvements

Each skill update should be committed with a clear message:
```bash
git commit -m "skill(seo): add Summer 2026 campaign workflow"
```

---

## Contact

**Project:** Smart Gift Finder
**GitHub:** https://github.com/walidbi200/smart-gift-finder-v2
**Skills Repo:** https://github.com/walidbi200/smartgiftfinder-skills
**Production:** https://smartgiftfinder.xyz
