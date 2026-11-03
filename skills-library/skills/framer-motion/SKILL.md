---
name: framer-motion
description: Directrices expertas para crear animaciones fluidas, microinteracciones, transiciones de layout y gestos interactivos con Motion (antes Framer Motion) en React y Next.js.
---

# Framer Motion / Motion Animation Guidelines

Eres un experto en Motion (antes Framer Motion), React y Next.js. Aplica estas directrices para diseñar y codificar animaciones de alto nivel, rendimiento e interactividad en MYNEXT.

## Principios Fundamentales

### Importación Moderna
- Usa siempre `import { motion, AnimatePresence } from "motion/react"` para proyectos React/Next.js modernos (en lugar de `"framer-motion"` obsoleto).

### Enfoque de Rendimiento Primero (GPU Accelerated)
- Anima preferentemente propiedades de **transform** (`x`, `y`, `scale`, `rotate`) y `opacity`.
- Evita animar propiedades que causen recálculo de layout del navegador (`width`, `height`, `top`, `left`, `margin`, `padding`).

### Aceleración por Hardware (`willChange`)
```tsx
<motion.div
  style={{ willChange: "transform, opacity" }}
  animate={{ x: 0, opacity: 1 }}
  initial={{ x: -20, opacity: 0 }}
  transition={{ type: "spring", stiffness: 300, damping: 25 }}
/>
```

### Microinteracciones y Gestos Táctiles
Añade respuesta inmediata al cursor y toques en botones, tarjetas y enlaces:
```tsx
<motion.button
  whileHover={{ scale: 1.02, translateY: -2 }}
  whileTap={{ scale: 0.98 }}
  transition={{ type: "spring", stiffness: 400, damping: 17 }}
  className="btn-primary"
>
  Confirmar
</motion.button>
```

### Transiciones de Pestañas y Layout (`layout` & `layoutId`)
Para transiciones mágicas entre elementos compartidos (indicadores de tabs activos, modales):
```tsx
{isSelected && (
  <motion.div
    layoutId="active-pill"
    className="absolute inset-0 bg-primary rounded-full -z-10"
    transition={{ type: "spring", bounce: 0.2, duration: 0.6 }}
  />
)}
```

### Salidas Suaves con `AnimatePresence`
```tsx
import { AnimatePresence, motion } from "motion/react";

<AnimatePresence mode="wait">
  {isOpen && (
    <motion.div
      initial={{ opacity: 0, scale: 0.95 }}
      animate={{ opacity: 1, scale: 1 }}
      exit={{ opacity: 0, scale: 0.95 }}
      transition={{ duration: 0.2 }}
    />
  )}
</AnimatePresence>
```

### Accesibilidad Obligatoria (`prefers-reduced-motion`)
Respeta siempre las preferencias del sistema para no causar mareos o molestias:
```tsx
import { useReducedMotion } from "motion/react";

const shouldReduceMotion = useReducedMotion();
```
