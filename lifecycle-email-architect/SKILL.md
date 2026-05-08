# lifecycle-email-architect

**Domain:** Email Marketing | Drip Campaigns | Holiday Countdowns
**Agent Type:** Email Agent
**Applies To:** Smart Gift Finder subscriber list and Father's Day 2026 campaign

---

## Description & Objective

This skill builds and manages lifecycle email sequences that drive returning traffic to Smart Gift Finder's gift guides. The primary goal for the Father's Day 2026 campaign is a countdown drip sequence that moves subscribers from awareness through urgency — maximizing affiliate clicks from email traffic. Email is not a vanity channel here; every email must link to a gift guide page and be measurable by affiliate CTR.

---

## Triggers

- When a subscriber joins the email list (welcome sequence trigger)
- When a campaign milestone date is reached (Father's Day countdown)
- When the Analytics Agent reports a traffic dip that email can supplement
- When a new gift guide page is published (announcement email)
- When a subscriber hasn't engaged for 30 days (re-engagement trigger)

---

## Strict Constraints

- NEVER send more than 3 emails per week — subscriber fatigue kills the list
- NEVER send an email without a direct link to a gift guide page — every email earns affiliate clicks
- ALWAYS include an unsubscribe link (Resend handles this automatically)
- NEVER use spam trigger words: "FREE!!!", "ACT NOW", "LIMITED TIME OFFER", "CLICK HERE"
- ALWAYS personalize subject lines with either the occasion or the sender's first name if available
- NEVER send campaigns using the `test` API key — always use production Resend API
- ALWAYS track email click UTM params: `?utm_source=email&utm_campaign=fathers-day-2026&utm_medium=email`

---

## Father's Day 2026 Countdown Sequence

| Email # | Send Date | Subject Line | Content Focus | Primary CTA |
|---------|-----------|-------------|---------------|-------------|
| 1 | June 1 | "Father's Day is 3 weeks away — here's where to start" | Top 5 gift categories overview | → Browse Gift Guides |
| 2 | June 8 | "The gifts dads actually want this year" | Curated top picks by personality type | → Find His Gift |
| 3 | June 12 | "Under $50 and still impressive" | Budget gift guide spotlight | → See Picks Under $50 |
| 4 | June 15 | "Last chance for standard shipping" | Urgency — shipping deadline | → Order Before It's Too Late |
| 5 | June 18 | "Last minute? These ship in 2 days" | Prime-eligible, fast-shipping picks | → Last Minute Gifts |

---

## Step-by-Step Execution Workflow

### Welcome Sequence (Triggered on Signup)

1. **Immediate (0 min after signup):** Send welcome email
   - Subject: "Welcome — your personalized gift guide is ready"
   - Body: Brief intro to Smart Gift Finder, link to the gift finder quiz
   - CTA: "Take the 60-Second Gift Quiz →" → `/gift-finder?utm_source=email&utm_campaign=welcome`

2. **Day 3:** Send first curated guide
   - Subject: "The [Season] gift guide your dad actually wants"
   - Body: 3 featured products from the current campaign
   - CTA: "See Full Gift Guide →" → `/fathers-day-gifts?utm_source=email&utm_campaign=welcome-d3`

3. **Day 7:** Social proof email
   - Subject: "What other dads are getting this year"
   - Body: Top 3 most-clicked products from affiliate data (pull from `/api/admin/analytics` → `topProducts`)
   - CTA: "Shop the Top Picks →"

### Campaign Broadcast (Manual or Scheduled)

1. Write email content following the countdown sequence above
2. Use Resend API:

```typescript
// POST to Resend via server action or API route
await resend.emails.send({
  from: "Smart Gift Finder <gifts@smartgiftfinder.xyz>",
  to: [subscriber.email],
  subject: emailSubject,
  html: emailHtmlContent,
});
```

3. Add UTM params to all links: `?utm_source=email&utm_campaign=fathers-day-2026`
4. After send: monitor PostHog for `email_click` events and affiliate CTR spike

### Re-Engagement Sequence (30-Day Inactive)

1. Day 30 inactive: "We miss you" email
   - Subject: "Still looking for the perfect gift?"
   - Body: Link to quiz + 3 new picks since last email
   - CTA: "Come Back and Find a Gift →"

2. Day 37 inactive (final): Sunset email
   - Subject: "Should we keep sending you gift ideas?"
   - Body: Simple choice — "Yes, keep them coming" or "Unsubscribe"
   - If no click within 7 days: tag subscriber as `inactive`, suppress from future campaigns

---

## Output Format

**Email Brief (for each campaign email):**
```markdown
## Email Brief — [Campaign Name] — Email #[N]

**Send Date:** [Date]
**Segment:** All active subscribers / [specific segment]
**Subject Line:** "[Subject]"
**Preview Text:** "[60-char preview]"

**Body Outline:**
- Opening hook (1 sentence)
- Main content: [gift picks / urgency message / curated list]
- Primary CTA: "[Button text]" → [URL with UTM params]
- Secondary CTA (optional): "[Link text]" → [URL]

**Resend Template ID:** [if applicable]
**UTM Campaign:** fathers-day-2026
**Expected CTR Target:** ≥ 3% (email industry avg for affiliate content)
```
