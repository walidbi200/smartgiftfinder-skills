# nextjs-performance-profiler

**Domain:** Core Web Vitals | Vercel Speed Insights | Next.js Optimization
**Agent Type:** CTO Agent (Performance Specialist)
**Applies To:** Smart Gift Finder Next.js application on Vercel

---

## Description & Objective

This skill monitors and optimizes Core Web Vitals (LCP, CLS, INP) for Smart Gift Finder using Vercel Speed Insights data. Poor Core Web Vitals directly harm Google rankings — especially on mobile. This skill provides a systematic process for identifying performance bottlenecks, applying targeted Next.js optimizations, and verifying improvements without guessing or making untested changes.

---

## Triggers

- When Vercel Speed Insights shows any metric in "Needs Improvement" or "Poor" range
- Weekly performance review (every Monday alongside SEO audit)
- After any major deployment that adds new components or third-party scripts
- When Google Search Console reports a Core Web Vitals issue

---

## Strict Constraints

- NEVER apply a performance fix without first measuring the baseline — document the before metric
- NEVER add a new third-party script without evaluating its impact on INP and LCP
- ALWAYS test performance changes on mobile viewport — desktop scores do not represent real user traffic
- NEVER remove `@vercel/speed-insights` or `@vercel/analytics` — these are production monitoring requirements
- ALWAYS verify the fix using Vercel Speed Insights data after deployment — not just Lighthouse in dev mode
- NEVER use `useEffect` to load critical above-the-fold content — use server components

---

## Core Web Vitals Targets

| Metric | Good | Needs Improvement | Poor | Smart Gift Finder Target |
|--------|------|-------------------|------|--------------------------|
| LCP (Largest Contentful Paint) | ≤ 2.5s | 2.5–4.0s | > 4.0s | ≤ 2.0s |
| CLS (Cumulative Layout Shift) | ≤ 0.1 | 0.1–0.25 | > 0.25 | ≤ 0.05 |
| INP (Interaction to Next Paint) | ≤ 200ms | 200–500ms | > 500ms | ≤ 150ms |

---

## Step-by-Step Execution Workflow

### 1. Baseline Measurement
- Open Vercel Dashboard → Speed Insights → last 7 days, mobile device filter
- Record current P75 values for LCP, CLS, INP per page group
- Identify the worst-performing page (by P75 LCP)

### 2. LCP Diagnosis
Common LCP causes on Next.js affiliate sites:
- **Hero image not priority** → Add `priority` prop to `<Image>` in hero section
- **Large unoptimized images** → Ensure all `<Image>` components have explicit `width`/`height` and use WebP format
- **Server component fetching blocking render** → Move non-critical DB queries to client components with `Suspense` boundaries
- **No streaming** → Wrap slow data-fetching sections in `<Suspense fallback={<Skeleton />}>`

**Fix pattern:**
```tsx
// Before — blocks entire page render
const products = await prisma.product.findMany({ take: 50 });

// After — streams fast, loads products progressively
<Suspense fallback={<ProductGridSkeleton />}>
  <ProductGrid />
</Suspense>
```

### 3. CLS Diagnosis
Common CLS causes:
- **Images without dimensions** → All `<Image>` components must have `width` and `height`
- **Font flash** → Use `display: swap` (already configured in layout.tsx via Next.js font)
- **Dynamic content injected above existing content** → Use CSS `min-height` to reserve space

### 4. INP Diagnosis
Common INP causes on affiliate pages:
- **Heavy click handlers on product cards** → Debounce or defer non-critical work
- **PostHog/GA4 event calls blocking interaction** → Fire analytics events async without awaiting
- **Large JS bundles** → Run `npx @next/bundle-analyzer` to identify heavy dependencies

### 5. Apply Fix
- Make the single targeted change — do not batch multiple changes in one deploy
- Commit with descriptive message: `perf: add priority prop to hero image on /gifts/[category]`
- Deploy to Vercel

### 6. Verify
- Wait 24–48 hours for Vercel Speed Insights to collect real user data
- Compare P75 values against baseline
- If improved: log result, close task
- If unchanged or worse: revert and diagnose further

---

## Output Format

**Performance Report (Markdown):**
```markdown
## Performance Report — [Date]

**Page:** /gifts/tech-gifts-for-dad
**Device:** Mobile (P75)

| Metric | Before | After | Status |
|--------|--------|-------|--------|
| LCP | 3.8s | 2.1s | ✅ Good |
| CLS | 0.08 | 0.04 | ✅ Good |
| INP | 340ms | 180ms | ✅ Good |

**Fix Applied:** Added `priority` prop to hero `<Image>`, wrapped product grid in `<Suspense>`
**Commit:** abc1234
**Next Review:** [Date + 7 days]
```
