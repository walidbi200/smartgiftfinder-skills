# landing-page-generator

**Domain:** Next.js Component Generation | Conversion Design | Gift Guide Pages
**Agent Type:** Content Agent (Frontend Specialist)
**Applies To:** All Smart Gift Finder gift category and campaign landing pages

---

## Description & Objective

This skill produces production-ready Next.js/Tailwind TSX components for high-converting gift guide landing pages. Pages must load fast, look premium, and funnel visitors directly toward affiliate clicks. This skill is not for blog posts — it is for structured gift category pages (`/gifts/[category]`, `/fathers-day-gifts-under-50`) that serve as the primary revenue-generating pages of the site.

---

## Triggers

- When the SEO Agent identifies a new keyword cluster requiring a dedicated landing page
- When the CMO requests a new campaign page (e.g., a Father's Day hub page)
- When an existing landing page has a bounce rate > 65% and needs a redesign
- When a new budget category or recipient segment is added to the campaign

---

## Strict Constraints

- NEVER use placeholder text or `[INSERT PRODUCT HERE]` — every product slot must have real data from the `Product` Prisma table
- NEVER use `<img>` tags — always use Next.js `<Image>` from `next/image` with explicit `width`, `height`, and `alt`
- ALWAYS route affiliate links through `/api/affiliate/click?url=` — never direct Amazon URLs
- NEVER use inline styles — use only Tailwind utility classes
- ALWAYS include `generateMetadata()` export for SEO
- ALWAYS include `ItemList` JSON-LD schema via `dangerouslySetInnerHTML`
- Page must pass Lighthouse performance score ≥ 85 on mobile

---

## Component Architecture

Each landing page is composed of these sections, in order:

```
1. Hero Section         — H1, subtitle, CTA to quiz
2. Quick Picks Strip    — Top 3 products above the fold
3. Full Gift Grid       — All ranked products with CTAs
4. Buyer's Guide        — H2 section with purchase criteria
5. FAQ Section          — 5 questions with answers (FAQPage schema)
6. Related Pages        — Internal links to related gift guides
```

---

## Step-by-Step Execution Workflow

1. **Fetch Products** — Query `prisma.product.findMany()` filtered by `category` and `budgetCategory`. Sort by `rating DESC, reviewCount DESC`. Take top 8.

2. **Generate Hero** — H1 must contain the primary keyword exactly. Subtitle must reference the occasion (Father's Day 2026) and the benefit (AI-curated, every budget).

3. **Quick Picks Strip** — Display the top 3 products in a horizontal row. Show: product image, title (truncated to 60 chars), price, star rating, and CTA button. These are above-the-fold — they must load instantly (use Tailwind skeleton loaders for SSR).

4. **Full Gift Grid** — Display all 8 products in a 2-column grid (mobile: 1-column). Each card: image, title, price, rating, 1-line description, CTA.

5. **Buyer's Guide** — 3 H2 subsections covering: how to choose, what to avoid, best value picks. 150–250 words each.

6. **FAQ Section** — 5 questions extracted from SEO Agent's keyword report. Use `<details>/<summary>` for accordion behavior. Add FAQPage schema.

7. **Related Pages** — Link to 4 related pages. Use descriptive anchor text. Example: "See all [Tech Gifts for Dad →]"

---

## Output Format

```tsx
// src/app/(public)/gifts/[category]/page.tsx

import Image from "next/image";
import Link from "next/link";
import { prisma } from "@/lib/prisma";

export const revalidate = 3600;

export async function generateMetadata({ params }) {
  return {
    title: `Best ${params.category} Gifts for Dad 2026 | Smart Gift Finder`,
    description: `AI-curated ${params.category} gift picks for Father's Day 2026. Every budget covered.`,
  };
}

export default async function GiftCategoryPage({ params }) {
  const products = await prisma.product.findMany({
    where: { category: params.category, availability: true },
    orderBy: [{ rating: "desc" }, { reviewCount: "desc" }],
    take: 8,
  });

  return (
    <main className="mx-auto max-w-5xl px-4 py-12">
      {/* Hero */}
      <section className="mb-12 text-center">
        <h1 className="text-4xl font-bold tracking-tight">
          Best {params.category} Gifts for Dad 2026
        </h1>
        <p className="mt-3 text-lg text-muted-foreground">
          AI-curated picks for every budget — updated weekly.
        </p>
        <Link href="/gift-finder"
          className="mt-6 inline-block rounded-full bg-primary px-6 py-3 font-semibold text-white">
          Find His Perfect Gift →
        </Link>
      </section>

      {/* Product Grid */}
      <section className="grid grid-cols-1 gap-6 sm:grid-cols-2">
        {products.map((product, i) => (
          <div key={product.id} className="rounded-xl border p-4 shadow-sm">
            <p className="mb-2 text-xs font-bold uppercase text-muted-foreground">
              #{i + 1} Pick
            </p>
            <p className="text-lg font-semibold">{product.title}</p>
            <p className="mt-1 text-2xl font-bold">${product.price}</p>
            <p className="mt-1 text-sm text-muted-foreground">{product.description}</p>
            <a
              href={`/api/affiliate/click?url=${encodeURIComponent(product.affiliateLink)}&source=${params.category}`}
              target="_blank" rel="noopener noreferrer"
              className="mt-4 block rounded-lg bg-amber-500 px-4 py-2 text-center font-semibold text-white">
              Check Price on Amazon →
            </a>
          </div>
        ))}
      </section>
    </main>
  );
}
```
