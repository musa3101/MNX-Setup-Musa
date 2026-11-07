---
name: code-review
description: Revisión exhaustiva de código, estándares de calidad y refactorización antes de mergear.
---

# Code Review (Two-Axis Review)

Independent two-axis review of the diff between `HEAD` and a fixed point:

- **Standards**: Does the code conform to the repo's documented coding standards and clean code heuristics?
- **Spec**: Does the code faithfully implement the originating user request, spec, or issue?

Both axes are evaluated separately so they do not pollute each other's context, and the findings are reported side by side.

---

## Process

### 1. Pin the fixed point (Smart Git Detection)

1. If the user specifies a fixed point (a commit SHA, branch name, tag, `HEAD~N`, etc.), use it.
2. If the user does not specify a fixed point:
   - Check the current branch with `git branch --show-current`.
   - If on `dev` or any feature branch, default to comparing against `main`: `git diff main...HEAD`.
   - If on `main`, compare uncommitted changes (`git diff HEAD`) or the most recent commit (`git diff HEAD~1..HEAD`).
3. Always verify before proceeding:
   - Run `git rev-parse <fixed-point>` to ensure the ref resolves.
   - Run `git diff <fixed-point>...HEAD` (or `git diff HEAD`) and check `git log <fixed-point>..HEAD --oneline`.
   - If the diff is empty, stop and inform the user.

### 2. Identify the spec source

Determine what requirements the code was supposed to satisfy:

1. **Active conversation context**: What the user requested in the chat trajectory.
2. **Project documentation**: Active task in `docs/ROADMAP.md`, `docs/SESSION_LATEST_ES.md`, or spec files under `docs/` or `specs/`.
3. **Commit references**: Issue references in commit messages (`#123`, `Closes #45`, etc.).
4. **Fallback**: If no spec is found, ask the user or evaluate against the explicit intent of the change. If the user indicates there is no spec, skip the Spec axis and report "no spec available".

### 3. Identify the standards sources

1. **Repo-specific guidelines**: Look for `CODING_STANDARDS.md`, `CONTRIBUTING.md`, or architecture rules (e.g. Next.js App Router rules, Tailwind `@theme` conventions, Supabase client security).
2. **Fowler Code Smell baseline**: Apply these 12 heuristics (_Refactoring_, ch.3) as judgement calls:
   - **Mysterious Name**: Names that do not clearly reveal intent or function.
   - **Duplicated Code**: Identical or near-identical logic duplicated across files.
   - **Feature Envy**: A function or method that manipulates data of another module more than its own.
   - **Data Clumps**: Groups of variables/parameters that always travel together without a dedicated type.
   - **Primitive Obsession**: Using raw primitives (strings, numbers) instead of domain types or enums.
   - **Repeated Switches**: The same `switch` or `if/else` cascade repeated in multiple places.
   - **Shotgun Surgery**: A single logical change that required edits scattered across too many unrelated files.
   - **Divergent Change**: A single module modified for several unrelated reasons.
   - **Speculative Generality**: Over-engineered abstractions, parameters, or hooks not needed by the spec.
   - **Message Chains**: Long chaining (`a.b().c().d()`) violating the Law of Demeter.
   - **Middle Man**: Functions or classes that merely delegate work without adding value.
   - **Refused Bequest**: Subclasses or implementers that ignore most inherited behavior (prefer composition).

> [!IMPORTANT]
> **Priority rule:** Documented repo standards always take precedence over the smell baseline. Skip anything that automatic linters/compilers already enforce.

### 4. Evaluate both axes independently

- **Standards Axis**:
  - Compare the diff against repo standards and the smell baseline.
  - Distinguish hard violations from subjective judgement calls.
  - Keep under 400 words.

- **Spec Axis**:
  - Compare the diff against the identified requirements.
  - Flag: (a) missing or incomplete requirements, (b) scope creep (unrequested behavior), (c) requirements with flawed logic.
  - Keep under 400 words.

### 5. Aggregate and Report

Present the findings cleanly:

```markdown
## Standards Review
- [Hard Violation / Judgement Call] Description and file reference...

## Spec Review
- [Missing / Scope Creep / Logic Flaw] Description and reference to requirement...

## Summary
- Standards: X findings (Worst: ...)
- Spec: Y findings (Worst: ...)
```

Do not merge or rerank the two axes together—they intentionally evaluate independent qualities of the codebase.
