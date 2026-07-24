---
name: setup-mynext
description: Inicializa y levanta el entorno de desarrollo local (setup.sh, rama dev, docs) al iniciar un nuevo proyecto o sesión.
---

# 🚀 Skill de Setup y Control de Flujo: setup-mynext

Esta skill automatiza el inicio seguro de proyectos y asegura que se cumplan las políticas de control de versiones locales y remotas de MYNEXT.

## 📋 Flujo de Inicialización (Al decir @setup, iniciar setup, o iniciar el entorno)
Cuando el usuario solicite iniciar el setup de un proyecto o levantar el entorno, sigue estrictamente estos pasos:

1. **Inicialización de Git**:
   - Comprueba si existe la carpeta `.git`.
   - Si no existe, ejecuta `git init` en el directorio de trabajo actual.

2. **Control de Ramas (Rama `dev` obligatoria)**:
   - Cambia a la rama `dev` ejecutando `git checkout -b dev` o `git checkout dev`.
   - **REGLA DE SEGURIDAD**: Todo el desarrollo y las pruebas se realizan exclusivamente en la rama `dev`. Está terminantemente prohibido hacer commit o push directo a `main` de manera automática.

3. **Estructura de Documentación Inicial**:
   - Comprueba si existen los archivos `docs/SESSION_LATEST_ES.md` y `docs/ROADMAP.md`.
   - Si no existen, crea la carpeta `docs/` y genera dichos archivos vacíos o con la plantilla estándar para cumplir con las reglas de sesión globales.

4. **Ejecución de `setup.sh`**:
   - Comprueba si existe `setup.sh` en la raíz del proyecto.
   - Si existe, ejecútalo (`bash setup.sh`).
   - Si no existe, y detectas que es un proyecto Node (p.ej., hay `package.json`), crea un `setup.sh` básico y ejecútalo. El script básico debe contener:
     ```bash
     #!/bin/bash
     git checkout -b dev || git checkout dev
     npm install
     npm run dev
     ```
   - Levanta el servidor local (`npm run dev` o el comando correspondiente) usando la ejecución de comandos de Antigravity (se ejecuta como tarea de fondo).

5. **Parada y Confirmación**:
   - Una vez levantado el entorno local, **DETENTE inmediatamente** y muestra un resumen al usuario indicando que el servidor de desarrollo está activo en localhost y que estás listo para trabajar en la rama `dev`.
   - Espera a que el usuario te dé confirmación antes de hacer cualquier modificación en los archivos del proyecto.

## 🛑 Flujo de Fin de Sesión (Al decir @final, @end, terminar, o similar)
Cuando el usuario pida finalizar la sesión o terminar:
1. Asegúrate de actualizar los archivos de documentación obligatorios:
   - `docs/SESSION_LATEST_ES.md` (resumen en español de cambios, archivos modificados, problemas resueltos y pendientes).
   - `docs/ROADMAP.md` (tareas completadas, en progreso y próximas).
2. Haz commit de todos los cambios de código realizados durante la sesión en la rama `dev` (p.ej. `git add .` y `git commit -m "update: ..."`).
3. **NUNCA hagas merge a `main` ni hagas push a GitHub a menos que el usuario te lo pida explícitamente usando palabras como "sincronizar", "merge", "push a main" u "ok para subir a producción".**
4. Deja el proyecto limpio y documentado. No realices más cambios de código tras actualizar la documentación.
