---
name: high-end-visual-design
description: Pushes coding agents toward luxury, premium, high-end visual execution (Awwwards/Linear/Apple aesthetic). Enforces spatial macro-rhythms, multi-layered atmospheric shadows, tactile double-bezels, curated typography with calibrated tracking/leading, and banishes generic AI UI slop.
---

# High-End Visual Design & Digital Craft Skill

This skill enforces the visual standards of an elite design agency ($100k+ tier). It stops AI assistants from generating flat, predictable, repetitive UI patterns and mandates deliberate, high-craft aesthetics.

## 1. Absolute Bans (Anti-Slop Directives)
- **NO Generic Centered Gradients**: Never use saturated purple-to-blue linear gradients on dark cards or hero titles.
- **NO Default Drop Shadows**: Never use single-layer `box-shadow: 0 4px 6px rgba(0,0,0,0.1)`. Always build multi-tiered ambient occlusion shadows.
- **NO Symmetrical 3-Column AI Grids**: Break monotony with intentional asymmetry, featured hero cards, or asymmetric editorial spans.
- **NO Harsh High-Contrast Pure Borders**: Never use raw `#333` or `#e5e7eb` 1px solid borders without matching opacity tokens or inner highlights.

## 2. Spatial Rhythm & Macro Whitespace
- **Breathing Room**: Double default padding on desktop (`py-24` or `py-32` for sections; `p-8` to `p-12` for prominent containers).
- **Rhythmic Stacking**: Strict visual hierarchy where headlines command 3x–4x the visual weight of body copy, and subtitles use muted neutral tones with tighter leading.

## 3. Tactile Depth & Double Bezels
- **Atmospheric Lighting**: Combine a faint outer glow with a multi-step soft shadow:
  `box-shadow: 0 0 0 1px rgba(255,255,255,0.06), 0 2px 4px rgba(0,0,0,0.2), 0 12px 24px -4px rgba(0,0,0,0.4);`
- **Subtle Inner Rings**: Use `ring-1 ring-inset ring-white/10` or translucent borders (`border border-white/[0.08]`) to simulate milled glass/aluminum edges.

## 4. Typography & Micro-Refinements
- **Tracking & Leading**: Tighten display headlines (`tracking-[-0.03em]` or `tracking-tight`), relax uppercase metadata pills (`tracking-[0.1em] text-[10px] uppercase font-semibold`).
- **Color Temperature**: Use tinted neutrals (slate, zinc, or stone undertones) instead of pure black `#000000` or sterile gray `#888888`.
- **Contrast Ratios**: Keep body text crisp (`text-zinc-300` / `text-zinc-700`) and tertiary metadata gracefully subdued (`text-zinc-500`).

## 5. Intentional Interaction Polish
- **Subtle Transitions**: Keep duration crisp (150ms–250ms) using custom cubic-beziers: `transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1)`.
- **Layered Hover Physics**: Hover states should lift subtly (`translate-y-[-1px]`) and deepen depth rather than flashing loud colors.
