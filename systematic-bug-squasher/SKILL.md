# systematic-bug-squasher

**Domain:** Debugging | Next.js App Router | Prisma | Production Incident Response
**Agent Type:** CTO Agent (Engineering Reliability)
**Applies To:** Smart Gift Finder Next.js application, Prisma database layer, Vercel deployment

---

## Description & Objective

This skill enforces a methodical, evidence-based debugging process for Smart Gift Finder. It prevents the most common agent failure mode: hallucinating a fix without reading actual error output. Every debugging session must start with log collection, proceed through root cause isolation, and end with a verified fix — not an assumed one. Guessing is not a valid debugging strategy.

---

## Triggers

- When any API route returns 500 Internal Server Error in production
- When Prisma throws a runtime exception
- When a Next.js page returns a 404 that should not exist
- When an agent reports an auth failure (401/403)
- When Vercel deployment fails with a build error
- When a new feature causes a regression in an existing feature

---

## Strict Constraints

- NEVER apply a fix before reading the actual error message — no guessing
- NEVER modify more than one system at a time when debugging — isolate variables
- ALWAYS reproduce the issue locally or via a test request before deploying a fix
- NEVER run `prisma migrate` in production — only `prisma migrate deploy`
- ALWAYS read Vercel function logs before making any code changes for production 500 errors
- NEVER restart PM2 without first checking `pm2 logs` — the error is almost always in the last 50 lines
- ALWAYS verify the fix by re-triggering the original failure condition

---

## Debugging Decision Tree

```
Error reported
     │
     ▼
Is it a build error? ─── YES → Read Vercel build logs → Fix type/import error → Redeploy
     │ NO
     ▼
Is it a 500 at runtime? ─── YES → Read Vercel function logs → Go to "Runtime 500 Protocol"
     │ NO
     ▼
Is it a 401/403? ─── YES → Go to "Auth Debugging Protocol"
     │ NO
     ▼
Is it a 404? ─── YES → Check route file exists → Check `page.tsx` vs `route.ts` naming
     │ NO
     ▼
Is it a Prisma error? ─── YES → Go to "Prisma Debugging Protocol"
     │ NO
     ▼
Check browser console → Check network tab → Isolate the failing request
```

---

## Step-by-Step Execution Workflow

### Runtime 500 Protocol

1. Open Vercel Dashboard → Functions → select failing function → View Logs
2. Find the most recent error with a full stack trace
3. Copy the exact error message — do not paraphrase
4. Identify the error type:
   - `PrismaClientKnownRequestError` → Database issue (see Prisma Protocol)
   - `TypeError: Cannot read properties of null` → Null safety issue — add optional chaining (`?.`)
   - `NEXT_NOT_FOUND` → `notFound()` called — check the data fetch returning null
   - `Error: PAPERCLIP_AGENT_SECRET is not defined` → Missing env var — check Vercel dashboard

5. Apply the minimum fix targeting the root cause
6. Deploy and verify by re-hitting the failing endpoint

### Auth Debugging Protocol

1. Run the debug endpoint:
```bash
curl -H "X-Agent-Secret: YOUR_SECRET" \
  https://smartgiftfinder.xyz/api/admin/debug
```
2. Check `match` field — if `false`, the secrets differ
3. Check `stored_length` — if `"UNDEFINED"`, the env var is missing in Vercel
4. Fix: update Vercel env var → trigger redeploy → re-run curl
5. If VPS agents still fail after Vercel fix: run nuclear restart on VPS (see `smartgiftfinder-devops`)

### Prisma Debugging Protocol

1. Check the error code:
   - `P2002` — Unique constraint violation → duplicate slug/email/URL being inserted
   - `P2025` — Record not found for update/delete → check `where` clause
   - `P1001` — Database unreachable → check `DATABASE_URL` env var; ensure pooler URL (port 6543)
   - `P2003` — Foreign key constraint failed → referencing non-existent parent record

2. For `P1001` specifically:
```bash
# Test database connection
curl https://smartgiftfinder.xyz/api/health
# Should return: { "status": "ready" }
```

3. For schema-related errors: run `npx prisma generate` locally to confirm client is in sync with schema

### Build Error Protocol

1. Read the full Vercel build log — never assume the error is in the last changed file
2. Common build errors on this project:
   - TypeScript type errors from Prisma model changes → run `npx prisma generate` then fix types
   - Missing environment variable at build time → check `src/lib/env.ts` for any build-time validation
   - Import resolution error → check the `@/` alias resolves correctly in `tsconfig.json`

---

## Output Format

**Bug Report (Markdown):**
```markdown
## Bug Report — [Date]

**Issue:** POST /api/admin/blog/publish returning 500
**Severity:** High — blocks content pipeline

**Root Cause Found:**
`BlogPost.excerpt` field is required in schema but was not provided in the request body.
Prisma threw: `PrismaClientValidationError: Argument 'excerpt' is missing.`

**Fix Applied:**
Added excerpt fallback in route handler:
`excerpt: metaDescription || content.substring(0, 150)`

**Commit:** def5678
**Verified:** Yes — re-ran POST request, received 200 OK with post object

**Time to Resolution:** 18 minutes
```
