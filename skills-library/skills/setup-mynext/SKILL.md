---
name: setup-mynext
description: Inicialización y arranque del entorno local de desarrollo para proyectos MYNEXT (Setup 2.0 de Musa).
---

# 🚀 Skill de Setup y Control de Flujo: setup-mynext (Setup 2.0)

Esta skill automatiza el inicio seguro de proyectos y asegura que se cumplan las políticas de control de versiones locales y remotas de MYNEXT Setup 2.0.

## 📋 Flujo de Inicialización (Al decir "setup de Musa", "prepárame el setup de Musa", "@setup", "abre el setup de Musa", etc.)

1. **Garantía Inmediata de Rama `dev` (DESDE EL SEGUNDO 0 - OBLIGATORIO)**:
   - Cambia o crea inmediatamente la rama `dev` ejecutando `git checkout dev || git checkout -b dev`.
   - **REGLA DE SEGURIDAD ABSOLUTA**: Todo el desarrollo y las pruebas se realizan exclusivamente en la rama `dev`. Está **terminantemente prohibido** trabajar en `main`.

2. **Apertura de Sesión**:
   - Comprueba si existe `scripts/session-start.sh`. Si no existe, cópialo desde `/Users/musa/.gemini/config/setup-musa/scripts/session-start.sh` a la carpeta `scripts/` del proyecto y dale permisos de ejecución (`chmod +x scripts/*.sh`).
   - Ejecuta `bash scripts/session-start.sh`.
   - Este script genera `.musa/session.json` (`session: open`), crea `.musa/merges.log` y agrega `.musa/` a `.git/info/exclude` para que el estado no ensucie Git.

3. **Cero Keep-Alive y Respeto Operativo**:
   - No se crean workflows automáticos de Keep-Alive.
   - No se instalan dependencias ni se levantan servidores salvo que el usuario lo solicite expresamente (ej. "dame el localhost").
   - No se instalan skills de forma automática. Setup y Skills son independientes.

4. **Entrevista Inicial (Solo en proyectos nuevos)**:
   - Si es la primera vez que se trabaja en el proyecto, realiza las preguntas clave de `interview.md` de una en una.

## 🛡️ Protocolo Estricto de Merge y Deploy (Cloudflare & Git)
1. Solo se autoriza merge con la frase exacta: **"Tienes mi OK, haz el merge"**. Un "ok" simple no es válido.
2. **Doble confirmación**: Advertir al usuario: *"Esto subirá cambios a main y desplegará la web en Cloudflare. ¿Estás seguro?"* y esperar respuesta.
3. Usar `scripts/mini-merge.sh`:
   - Utiliza `git worktree` temporal para hacer cherry-pick o merge sin cambiar la rama de trabajo de la carpeta principal.
   - Permite que 2 ventanas de Antigravity trabajen a la vez sin interferirse.
4. **Un merge NO cierra la sesión**: se sigue en `dev` y se anota el merge en `.musa/merges.log`.

## 🛑 Fin de Sesión (Al decir @final, @end, cierra sesión o terminar)
1. Ejecuta `bash scripts/session-end.sh` para marcar la sesión como cerrada en `.musa/session.json`.
2. Actualiza `docs/SESSION_LATEST_ES.md` y `docs/ROADMAP.md` (resumen en español, qué se hizo incluyendo mini-merges, archivos modificados, problemas resueltos, qué queda pendiente y qué recomiendas para la próxima sesión).
3. No realices cambios de código adicionales.
