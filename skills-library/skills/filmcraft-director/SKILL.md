---
name: filmcraft-director
description: Dirección de edición de vídeo cinematográfica, montaje dinámico, transiciones y efectos en FilmCraft mediante MCP.
---

# FilmCraft Director Skill

Esta skill guía la edición profesional y dirección de montaje de vídeo en **FilmCraft** utilizando su protocolo MCP y motor nativo Rust.

## 1. Conexión y Modos de Trabajo

FilmCraft opera mediante el CLI oficial `/Users/musa/.local/bin/filmcraft-cli` y el servidor MCP `filmcraft-mcp`:

1. **Modo Bridge (En vivo en pantalla - Recomendado):**
   - Cuando FilmCraft está abierto con el puerto de control activo (`127.0.0.1:9876`), el servidor MCP se engancha automáticamente a la ventana viva.
   - Todo comando ejecutado se refleja visualmente en tiempo real en la línea de tiempo del usuario.
   - Herramientas visuales disponibles: `ui_screenshot`, `ui_inspect`, `ui_click`, `ui_drag`.

2. **Modo Headless (Segundo plano / Exportación):**
   - Si la aplicación de escritorio no está abierta, procesa proyectos `.fcproj` directamente sin interfaz gráfica.

## 2. Flujo de Trabajo Estándar de Montaje

### Paso 1: Inspeccionar el Proyecto y la Línea de Tiempo
- Ejecutar `doc_inspect` o `sequence_inspect` para conocer:
  - Pistas existentes (`V1`, `V2`, `A1`, `A2`...).
  - Clips presentes (IDs, `start`, `end`, `sourceIn`, `sourceOut`, duración en ticks o frames).
  - Tasa de refresco / FPS y resolución de la secuencia.
  *(Nota de tiempo: 254.016.000.000 ticks = 1 segundo).*

### Paso 2: Importar y Ubicar Material (`timeline.place`)
- Importar medios con `media_import`:
  `{"paths": ["/ruta/al/clip1.mp4", "/ruta/al/clip2.mp4"]}`
- Colocar múltiples clips consecutivos en la línea de tiempo de forma eficiente:
  `command_run {"id": "timeline.place", "params": {"items": [id1, id2, id3], "track": "V1", "time": 0, "insert": false}}`

### Paso 3: Pacing, Cortes y Recortes Dinámicos
- **Corte de cuchilla en punto específico:**
  `command_run {"id": "sequence.addEdit", "params": {"time": ticks}}`
- **Recorte ripple (eliminar huecos al recortar):**
  `command_run {"id": "timeline.trim", "params": {"clip": clipId, "edge": "out", "mode": "ripple", "deltaFrames": -24}}`
- **Eliminación con arrastre hacia atrás:**
  `command_run {"id": "edit.rippleDelete", "params": {"clips": [clipId]}}`
- **Ajuste de velocidad:**
  `command_run {"id": "clip.speedDuration", "params": {"clips": [clipId], "speed": 1.25}}`

### Paso 4: Transiciones Cinematográficas
- **Aplicar transición de vídeo (Cross Dissolve, Dip to Black, etc.):**
  `command_run {"id": "sequence.applyVideoTransition", "params": {"clip": clipId, "effect": "cross_dissolve", "frames": 15, "edge": "out"}}`
- **Transición entre dos clips adyacentes:** Aplicar en el borde `out` del primer clip o `in` del segundo clip.
- **Transiciones de audio suaves:**
  `command_run {"id": "sequence.applyAudioTransition", "params": {"clip": clipId, "effect": "constant_power", "frames": 10}}`

### Paso 5: Corrección de Color y Ajustes de Imagen
- Escalar y adaptar relación de aspecto al fotograma:
  `command_run {"id": "clip.fillFrame", "params": {"clips": [clipId]}}` o `clip.fitToFrame`.
- Normalización de audio:
  `command_run {"id": "clip.audioGain", "params": {"clips": [clipId], "mode": "normalizeMax", "db": -1.0}}`

### Paso 6: Verificación y Exportación
- Renderizar fotograma de prueba para control de calidad:
  `render_frame {"seconds": 2.5}` o `render_preview {}`.
- Exportar secuencia final:
  `command_run {"id": "file.exportMedia", "params": {"preset": "H.264 High Quality", "out": "/ruta/resultado.mp4", "wait": true}}`
