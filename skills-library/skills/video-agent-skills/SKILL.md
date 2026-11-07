---
name: video-agent-skills
description: Flujo de trabajo automatizado para edición de vídeo con agentes de IA, corte de clips, sincronización, transiciones, audio y renderizado.
---

# Video Agent Skills

Esta skill dota al agente de IA de una metodología estructurada para planificar, ejecutar y supervisar tareas de edición de vídeo de forma autónoma o asistida por herramientas (como FilmCraft MCP, FFmpeg o motores de render).

---

## 1. Pipeline de Edición en 5 Fases

```
[1. Ingesta & Análisis] ➔ [2. Plan de Corte (Cut Plan)] ➔ [3. Montaje en Timeline] ➔ [4. Postproducción] ➔ [5. Exportación & QA]
```

### Fase 1: Ingesta y Análisis de Metraje
Antes de colocar cualquier clip en la línea de tiempo:
1. **Inspección de metadatos:** Obtener resolución nativa, ratio de aspecto, framerate (FPS), códec y duración exacta en segundos/ticks.
2. **Catalogación visual:** Clasificar cada clip por tipo de plano (Drone / Aéreo, Detalle / Macro, Movimiento / Acción, Paisaje / Arquitectura) y condiciones de luz (Día pleno, Atardecer / Golden hour, Noche).
3. **Descarte de tomas inestables:** Identificar los tramos utilizables (*usable in/out segments*) descartando arranques o paradas bruscas de cámara.

---

### Fase 2: Plan de Corte (Cut Plan Estructurado)
El agente debe formular y validar el plan de montaje antes de la ejecución:
- **Estructura del Cut Plan:**
  - `ID_Clip`: Archivo de origen.
  - `Source_In` y `Source_Out`: Puntos exactos de entrada y salida (evitar usar clips enteros sin recortar).
  - `Timeline_Start`: Tiempo en el que inicia en la pista.
  - `Track`: Pista destino (`V1` para metraje base, `V2` para overlays o B-roll).
  - `Transition_In / Out`: Tipo y duración de transición (ej. *Cross Dissolve 15 frames*).

---

### Fase 3: Montaje en Timeline
1. **Construcción en pista V1:** Posicionar los clips en orden narrativo o rítmico según el Cut Plan.
2. **Corte a la acción (*Cut on Action*):** Realizar el corte en el punto donde un movimiento continúa de forma natural en el siguiente plano.
3. **Ajuste de duración Ripple:** Reducir o alargar planos manteniendo el pegado automático sin dejar huecos negros (*black gaps*).

---

### Fase 4: Transiciones y Postproducción
- **Transición por defecto:** *Cross Dissolve* suave (0.5s a 0.8s) para transmitir lujo y tranquilidad.
- **Transiciones dinámicas:** *Whip pan* o *Match cut* en vídeos de ritmo ágil.
- **Gradación y consistencia:** Normalizar temperatura de color para que los clips consecutivos compartan atmósfera visual similar.
- **Tratamiento para Web Hero:** Aplicar viñeta o degradado oscuro sutil (25-30%) para garantizar contraste con títulos tipográficos superpuestos.

---

### Fase 5: Exportación y Control de Calidad
1. **Comprobación de fotogramas clave:** Inspeccionar el primer frame, el punto medio y el último frame.
2. **Verificación de bucle:** Si es un fondo web en `loop`, confirmar que el corte entre el final y el inicio es imperceptible.
3. **Perfiles de exportación estándar:**
   - **Hero Web Loop:** MP4 (H.264), 1080p a 30fps, sin pista de audio, peso optimizado `< 5MB`.
   - **Promo Completo:** MP4 (H.264), 1080p o 4K, audio normalizado a -1.0 dB con música envolvente.
