---
name: editing-videos
description: Criterio de montaje y juicio editorial profesional para agentes, ritmo, duración matemática de tomas, transiciones invisibles y loops continuos.
---

# Editing Videos (Professional Editor Judgment)

Esta skill codifica el juicio y la toma de decisiones de un montador cinematográfico profesional para agentes de IA, garantizando ritmo matemático, coherencia narrativa y transiciones limpias.

---

## 1. Reglas Matemáticas de Pacing (Ritmo de Montaje)

1. **Ritmo "Slow Cinema" (Lujo, Hostelería, Destinos Exclusivos):**
   - **Duración por plano:** Entre **2.5 y 4.0 segundos**.
   - Menos de 2 segundos genera estrés y pérdida de sofisticación; más de 5 segundos arriesga aburrimiento.
2. **Ritmo "High Energy" (Promo Dinámica, Redes Sociales):**
   - **Duración por plano:** Entre **1.0 y 2.0 segundos**.
   - Cortes secos sincronizados con la percusión del audio (*beat-matching*).
3. **Alternancia de Escalas:**
   - Nunca colocar dos planos seguidos de la misma escala exacta y ángulo similar (*Jump Cut* involuntario).
   - Secuencia recomendada: **Plano General (Aéreo) ➔ Plano Medio (Yate / Sujeto) ➔ Plano Detalle (Brindis / Agua) ➔ Plano General (Puesta de sol)**.

---

## 2. Guía de Transiciones Cinematográficas

1. **Cross Dissolve (Disolución Cruzada Suave):**
   - Duración ideal: **12 a 24 fotogramas** (aprox. 0.4s a 0.8s a 30fps).
   - Uso: Transiciones entre entornos espaciales diferentes o cambio de hora del día.
2. **Cut on Action (Corte en el Movimiento):**
   - El corte ocurre durante el instante de mayor movimiento (ej. la proa levantando la ola, una copa brindando).
   - Hace que el ojo del espectador no note el cambio de plano.
3. **Dip to Black / Dip to White:**
   - Solo para conclusiones solemnes o transiciones de capítulo en vídeos largos (nunca en loops de fondo web).

---

## 3. La Técnica del Seamless Loop (Bucle Infinito Web)

Para lograr que un vídeo web se reproduzca en bucle indefinido sin que el usuario note el salto:
1. **Fusión de Cabecera y Cola (*Head-to-Tail Dissolve*):**
   - El plano final debe compartir composición o dirección de movimiento con el plano inicial.
   - Se aplica una disolución cruzada suave de 15–20 fotogramas entre el último plano y el primer plano.
2. **Dirección de Movimiento Constante:**
   - Si la cámara viaja de izquierda a derecha o avanza hacia adelante en el plano de entrada, el plano de salida debe acompañar esa misma inercia visual.
3. **Cero Caídas de Audio en Bucle:**
   - En fondos web silenciosos (`muted`), eliminar cualquier canal de audio para optimizar peso y evitar ruidos parásitos.
