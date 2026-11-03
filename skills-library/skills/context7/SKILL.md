---
name: context7
description: Consulta la documentación oficial en tiempo real de cualquier librería, SDK o framework (Tailwind v4, Next.js 15, Supabase, React, Stripe, etc.) para evitar sintaxis obsoleta o deprecada.
---

# Context 7 - Live Documentation Lookup

Esta skill garantiza que cualquier código escrito para librerías de terceros refleje la sintaxis más reciente y oficial, evitando patrones deprecados o alucinaciones de versiones antiguas.

## Cuándo usar Context 7
- Antes de escribir o refactorizar código de librerías modernas (Tailwind CSS v4, Next.js 14/15 App Router, Supabase v2, Radix UI, Framer Motion/Motion).
- Cuando el usuario pregunte cómo se configura o usa una función de una librería específica.
- Cuando haya dudas sobre si una API cambió de nombre o de firma en su versión actual.

## Acciones que ejecuta
- Consulta el servidor MCP Context 7 con `resolve-library-id` y `query-docs`.
- Extrae fragmentos exactos de la documentación oficial al momento.
