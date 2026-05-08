# ai-seo-optimizer

**Domain:** Generative Engine Optimization (GEO) | AI Search Visibility
**Agent Type:** SEO Agent (GEO Specialist)
**Applies To:** All Smart Gift Finder content targeting AI-generated search results

---

## Description & Objective

This skill optimizes Smart Gift Finder content to be **cited by AI search engines** — Google AI Overviews, Perplexity, ChatGPT, Gemini, and Copilot — in addition to ranking in traditional blue-link results. GEO is distinct from classic SEO: it requires structured, high-density factual content formatted for AI extractability, not just keyword density. A citation in Perplexity or an AI Overview placement can drive significant referral traffic with zero additional link-building.

---

## Triggers

- When creating any new blog post or landing page targeting informational or commercial-investigation intent
- When a page ranks on page 1 but receives no AI Overview placement
- When Perplexity or ChatGPT is observed citing competitors for target keywords
- During weekly SEO review when GEO score is below threshold

---

## Strict Constraints

- NEVER optimize purely for AI citation at the expense of traditional ranking signals
- ALWAYS include a dedicated "Quick Answer" block at the top of every article (50–80 words, direct answer to H1 query)
- NEVER write paragraphs longer than 4 sentences in sections targeted for AI extraction
- ALWAYS use numbered lists for "how to" content and bulleted lists for "best of" content
- NEVER include opinion without a supporting fact or data point
- ALWAYS cite specific numbers (prices, ratings, review counts, dimensions) — AI models prefer quantified claims
- NEVER use ambiguous pronouns in AI-targeted sections — be explicit ("The Weber Genesis grill" not "it")

---

## GEO Content Structure Template

```markdown
## [H2: Question-format heading — e.g. "What Are the Best Tech Gifts for Dad Under $50?"]

**Quick Answer:** [50–80 word direct answer — this is what AI Overviews extract]

### Top Picks at a Glance
- **[Product Name]** — $[price] — [1-sentence value proposition]
- **[Product Name]** — $[price] — [1-sentence value proposition]
- **[Product Name]** — $[price] — [1-sentence value proposition]

### Why We Recommend These
[Paragraph 1: Specific criteria used — ratings, shipping, features]
[Paragraph 2: How these beat the alternatives]

### Key Facts
- Average price range: $X–$X
- Top-rated option: [Name] ([rating] stars, [count] reviews)
- Best for last-minute orders: [Name] — Prime-eligible, ships in [X] days
```

---

## Step-by-Step Execution Workflow

1. **Intent Classification** — Identify if the query is informational ("what are good gifts for dad?"), commercial-investigation ("best tech gifts for dad"), or transactional ("buy tech gifts for dad"). Apply GEO formatting primarily to informational and commercial-investigation content.

2. **Quick Answer Block** — Write a 50–80 word direct answer at the top of the article. Use the primary keyword in the first sentence. Include one specific fact (price, rating, feature).

3. **Structured List Formatting** — Convert all product recommendations and "reasons" into bulleted or numbered lists. AI models extract lists at significantly higher rates than prose paragraphs.

4. **Fact Density Pass** — Review the article. Every paragraph should contain at least one quantified claim: a price, a star rating, a dimension, a timeframe, a percentage. Remove any paragraph that is pure opinion without evidence.

5. **FAQ Section** — Add a minimum of 5 FAQ entries per page. Format them as `<details>` HTML or as H3+paragraph pairs. These directly feed Google's FAQPage featured snippets and AI Overview extractions.

6. **Entity Clarity** — Ensure every product name, brand, and specification is stated explicitly, not referred to by pronoun. AI extractors lose context when content uses "it" or "this product" excessively.

7. **Schema Alignment** — Coordinate with `schema-markup-architect` to ensure FAQPage and ItemList schema is applied to the same page.

---

## Output Format

**GEO-Optimized Content Block (Markdown):**
```markdown
**Quick Answer:** [Direct answer, 50–80 words, primary keyword in sentence 1]

### Best [Category] Gifts for Dad — At a Glance
- **[Product]** ($XX) — [specific benefit in one sentence]
- **[Product]** ($XX) — [specific benefit in one sentence]

### Frequently Asked Questions

**What is the best [category] gift for dad under $50?**
[40–80 word answer with at least one specific product name and price]

**What should I get my dad for Father's Day 2026?**
[40–80 word answer with specific recommendation]
```
