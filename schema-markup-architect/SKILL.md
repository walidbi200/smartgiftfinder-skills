# schema-markup-architect

**Domain:** Structured Data | JSON-LD | Rich Snippets
**Agent Type:** SEO Agent (Schema Specialist)
**Applies To:** All Smart Gift Finder pages requiring rich search result features

---

## Description & Objective

This skill generates production-ready JSON-LD structured data for Smart Gift Finder pages. Correct schema markup unlocks rich snippets in Google Search (star ratings, FAQs, product prices, breadcrumbs), which significantly improve click-through rates. This skill outputs schema that integrates cleanly with Next.js App Router via `<script type="application/ld+json">` blocks — no third-party library required.

---

## Triggers

- When any new blog post, gift guide, or landing page is created
- When a page ranks in the top 10 but shows no rich snippet in SERPs
- When Google Search Console reports schema validation errors
- When a new page type is introduced (e.g., category pages, quiz results)

---

## Strict Constraints

- NEVER invent product prices or ratings — only use data from the Prisma `Product` table
- NEVER use relative URLs in schema — all `url` fields must be absolute (`https://smartgiftfinder.xyz/...`)
- ALWAYS validate schema using Google's Rich Results Test before flagging as complete
- NEVER place schema in `<head>` via a third-party tag manager — use Next.js `<script>` in the page component
- ALWAYS include `@context: "https://schema.org"` in every schema block
- NEVER duplicate schema types on the same page (e.g., two `FAQPage` blocks)

---

## Schema Types by Page Type

| Page Type | Required Schema | Optional Schema |
|-----------|----------------|-----------------|
| Blog post | `Article`, `FAQPage`, `BreadcrumbList` | `HowTo` |
| Gift category page | `ItemList`, `FAQPage`, `BreadcrumbList` | — |
| Product detail | `Product`, `BreadcrumbList` | `Review` |
| Homepage | `Organization`, `WebSite` | `SiteLinksSearchBox` |
| Quiz result | `ItemList` | — |

---

## Step-by-Step Execution Workflow

### 1. Identify Page Type
Read the page's route pattern:
- `/blog/[slug]` → Article + FAQPage
- `/gifts/[category]` → ItemList + FAQPage
- `/` → Organization + WebSite

### 2. Extract Data from Database
Pull required fields from Prisma — never hardcode values:
- Blog posts: `title`, `metaDescription`, `publishedAt`, `author`, `slug`
- Products: `title`, `price`, `rating`, `reviewCount`, `imageUrl`, `affiliateLink`
- FAQs: defined in page content or CMS

### 3. Generate JSON-LD Block
Use the templates below. Insert into page component as:

```typescript
<script
  type="application/ld+json"
  dangerouslySetInnerHTML={{ __html: JSON.stringify(schemaObject) }}
/>
```

---

## Schema Templates

### Article Schema (Blog Posts)
```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Best Tech Gifts for Dad 2026",
  "description": "AI-curated tech gift picks for Father's Day 2026 — tested and ranked.",
  "url": "https://smartgiftfinder.xyz/blog/tech-gifts-for-dad-2026",
  "datePublished": "2026-05-08T00:00:00Z",
  "dateModified": "2026-05-08T00:00:00Z",
  "author": { "@type": "Organization", "name": "Smart Gift Finder" },
  "publisher": {
    "@type": "Organization",
    "name": "Smart Gift Finder",
    "url": "https://smartgiftfinder.xyz"
  }
}
```

### FAQPage Schema
```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What are the best tech gifts for dad under $50?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "The top picks under $50 include the Anker 737 Power Bank ($45), a set of high-quality wireless earbuds from JLab ($29), and the Tile Mate Bluetooth tracker ($25)."
      }
    }
  ]
}
```

### ItemList Schema (Gift Category Pages)
```json
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "name": "Best Father's Day Gifts Under $50",
  "url": "https://smartgiftfinder.xyz/gifts/under-50",
  "numberOfItems": 8,
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Anker 737 Power Bank",
      "url": "https://smartgiftfinder.xyz/api/affiliate/click?url=..."
    }
  ]
}
```

### Organization Schema (Homepage — already in layout.tsx)
```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Smart Gift Finder",
  "url": "https://smartgiftfinder.xyz",
  "description": "AI-powered gift recommendations for every occasion and budget.",
  "sameAs": []
}
```

---

## Output Format

**TypeScript function for Next.js page:**
```typescript
export function generateArticleSchema(post: BlogPost) {
  return {
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": post.title,
    "description": post.metaDescription ?? post.excerpt,
    "url": `https://smartgiftfinder.xyz/blog/${post.slug}`,
    "datePublished": post.publishedAt?.toISOString(),
    "dateModified": post.updatedAt.toISOString(),
    "author": { "@type": "Organization", "name": "Smart Gift Finder" }
  };
}
```

Place in `src/lib/schema-markup.ts` alongside existing `generateOrganizationSchema()`.
