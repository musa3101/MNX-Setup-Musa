# Setup de Musa — Protocolo de Operación

Este es el núcleo operativo de **MYNEXT**. Reglas y pasos para trabajar en proyectos web sin desastres con Cloudflare ni Git.

---

## 1. Inicio de Proyecto (Primera vez)
Cuando Musa pasa este repositorio a una carpeta nueva:
1. El agente ejecuta la **entrevista inicial** de [`interview.md`](./interview.md):
   - ¿Proyecto nuevo?
   - ¿Repositorio de GitHub? (si no hay, se trabaja local sin forzarlo).
   - ¿Backend real? (Supabase o InsForge: pide credenciales del proyecto real, ya que el MCP solo ve tu cuenta).
   - ¿Cloudflare creado?
   - ¿Falta alguna skill en el IDE o en el repo? (compara con `skills-library/sync-skills.sh` y pregunta la dirección).
2. Si el proyecto no tiene `.gitignore`, se inyecta [`templates/.gitignore`](./templates/.gitignore) para proteger `.env`.
3. Se ejecuta `scripts/session-start.sh` para pasar a `dev` y abrir sesión.

---

## 2. Trabajo en Sesión (Regla de Oro)
- **Siempre en rama `dev`**: `scripts/session-start.sh` garantiza `dev` y crea `.musa/session.json`.
- **Prohibido tocar `main`**.
- Todo se prueba en local. Si algo no gusta, se vuelve atrás sin haber tocado producción en Cloudflare.

---

## 3. Merge y Mini-Merge (Trabajando con 2 Ventanas)
> [!CAUTION]
> **REGLA ESTRICTA DE MERGE**:
> 1. Solo se ejecuta con la frase exacta: **"Tienes mi OK, haz el merge"**. Un "ok" simple no vale.
> 2. **Doble confirmación**: El agente avisa: *"Esto subirá cambios a main y desplegará la web en Cloudflare. ¿Estás seguro?"* y espera confirmación.
> 3. **Un merge NO cierra sesión**: Se vuelve a `dev` y se continúa trabajando.
> 4. **Mini-merge seguro con dos ventanas**: Si tienes 2 ventanas abiertas y en una necesitas subir algo puntual (ej. Microsoft Clarity o Google Analytics):
>    - Se ejecuta `scripts/mini-merge.sh "etiqueta clarity" index.html --confirmed --push`
>    - Este script usa un `git worktree` temporal: **no mueve de rama tu carpeta principal**, por lo que tu otra ventana sigue intacta trabajando en `dev`.

---

## 4. Fin de Sesión
- Solo se cierra cuando el usuario dice `@final`, `@end`, "cierra sesión" o "terminar".
- Se ejecuta `scripts/session-end.sh`.
- Se documenta en `docs/SESSION_LATEST_ES.md` y `docs/ROADMAP.md`:
  - Qué se ha hecho (incluyendo los mini-merges).
  - Archivos modificados.
  - Qué queda pendiente.
  - **Qué se recomienda hacer en la próxima sesión**.

