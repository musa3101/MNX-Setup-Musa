# Entrevista inicial

Solo se hace cuando Musa pasa este repositorio en un proyecto por primera vez. Una pregunta cada vez, respuestas sí/no. Si el setup ya está instalado, **no repetir**: solo abrir sesión (o hacer lo que pida, p. ej. "instálame esta skill").

1. **¿Es un proyecto nuevo?**
   - No → abrir sesión y terminar la entrevista.
2. **¿Ya tienes repositorio de GitHub para este proyecto?**
   - Sí → pedir la URL y analizarlo.
   - No → trabajar sin repositorio. No crear ni conectar nada. Solo se abre la sesión.
3. **¿Ya tienes backend?**
   - No → seguir.
   - Sí → ¿Supabase o InsForge? Pedir lo necesario para conectarse **al backend real de este proyecto** (URL del proyecto y claves). Recordar que el MCP solo ve la cuenta, no el proyecto.
4. **¿Hosting en Cloudflare ya creado?**
   - Sí → con permiso, revisar la cuenta vía MCP y decir qué está bien o mal.
5. **Skills**: ejecutar `skills-library/sync-skills.sh` (solo informa).
   - Si el IDE tiene skills que el repositorio no: preguntar *"Encontré la skill X en el IDE: ¿la subo al repositorio?"*
   - Si el repositorio tiene skills que el IDE no: preguntar *"¿Instalo X desde el repositorio?"* (equipo nuevo).
   - Si coinciden: no hacer nada.

Al terminar: `scripts/session-start.sh`.

