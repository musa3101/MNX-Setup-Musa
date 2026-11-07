---
name: write-a-skill
description: Guía para crear y documentar nuevas habilidades personalizadas para el agente.
---

# Write a Skill (MYNEXT Methodology)

Use this guide when the user explicitly requests creating or refactoring a skill for Antigravity IDE and MYNEXT.

> [!IMPORTANT]
> **No Automated Auto-Creation**: Never create new skills automatically or unprompted. Use this skill strictly as an engineering methodology when directed by the user.

---

## 🏗️ 1. Skill Anatomy

Every skill resides in its own directory `skills/<skill-name>/` and must include a primary `SKILL.md` file:

```
skills/<skill-name>/
├── SKILL.md              # Main entry point with YAML frontmatter
├── references/           # (Optional) Detailed guides loaded on demand
└── resources/            # (Optional) Templates, checklists, or scripts
```

---

## 📝 2. YAML Frontmatter Specification

The frontmatter is the only part indexed in the initial context window. Every word counts against context budget:

```yaml
---
name: skill-name-kebab-case
description: >-
  Concise summary stating exactly what the skill does and unambiguous triggers for when to reach for it.
---
```

### Description Levers:
- **Front-load trigger words**: Put the primary actions and technologies at the start of the description.
- **One trigger per distinct branch**: Avoid redundant synonyms that re-trigger the same path.
- **No internal exposition**: Save explanations for the markdown body.

---

## 🪜 3. Information Hierarchy

Structure the content based on urgency and necessity:

1. **In-file Steps (Primary)**: The ordered actions the agent performs to achieve the goal.
2. **In-file Reference**: Specific tables, rules, or checklists consulted during execution.
3. **Disclosed Reference (`references/*.md`)**: Heavy technical specs or cheat sheets pushed to sibling files and reached via clickable file links.

---

## 🎯 4. Completion Criteria & Guardrails

- **Exhaustive & Checkable Bounds**: Provide explicit, testable completion criteria (e.g., "all typecheck errors resolved and unit test passes").
- **Positive Guidance**: State the target behavior explicitly rather than relying only on prohibitions (*"write typed Zod schemas"* instead of *"don't write loose objects"*).
- **Pruning & No-Ops**: Remove text that reiterates general model knowledge without adding MYNEXT-specific constraints.

---

## 🛡️ 5. Quality Checklist before Saving
- [ ] Directory placed directly at `BASE/skills/<skill-name>/` (flat, no nested category folders).
- [ ] Valid YAML frontmatter with `name` matching folder name.
- [ ] Zero hardcoded secrets, tokens, or live credentials.
- [ ] Git-safe: respects `dev` branch workflow and `PRODUCTION = LOCKED`.
