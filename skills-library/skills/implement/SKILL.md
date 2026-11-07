---
name: implement
description: Implementación estructurada de funcionalidades siguiendo requerimientos técnicos.
---

# Implement Workflow (MYNEXT Edition)

Implement work described by the user in a spec, ticket, or prompt while enforcing MYNEXT quality and safety gates.

## 🌿 1. Git Branch Pre-flight
- Confirm you are working on the **`dev`** branch (`git branch --show-current`).
- **`PRODUCTION = LOCKED`**: Never work, commit, or push directly to `main`.
- If on `main` or detached HEAD, switch to `dev` or create a feature branch off `dev`.

## 🛠️ 2. Execution & Seam Discipline
- Follow the deep-module architecture from `codebase-design`: keep interfaces minimal, place logic behind clean seams.
- Implement tests at seams using TDD where possible.
- Run typechecking regularly (`tsc --noEmit` / `npm run typecheck`).
- Run targeted unit tests regularly (`vitest run <file>` or `npm test`).

## 🧪 3. Verification & Testing
- Run full test suite before concluding work (`npm test` / `vitest run`).
- Run E2E verification (`e2e-testing-patterns` / Playwright) when touching critical customer journeys (Landing $\to$ Form/Booking $\to$ Supabase $\to$ Confirmation $\to$ Admin).

## 🔍 4. Review & Security Gate
- Run `code-review` to evaluate changes along both axes: **Standards** and **Spec**.
- Verify frontend and backend security (`frontend-security-coder`, `backend-security-coder`, `secrets-management`).
- Ensure no real credentials or `.env` files are staged for commit.

## 💾 5. Commit to Dev
- Once tests pass and review is clean, commit changes exclusively to `dev`.
- Update session tracking in `.mynext/` (`SESSION.md`, `CHANGELOG.md`, `PENDING.md`).
