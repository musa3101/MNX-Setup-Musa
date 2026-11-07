---
name: lighthouse
description: Auditoría oficial de Google Lighthouse para medir Rendimiento, Accesibilidad, Buenas Prácticas y SEO en webs locales o remotas.
---

# Google Lighthouse - Auditoría Web Oficial de Google

Esta skill permite ejecutar auditorías automatizadas de **Google Lighthouse** (versión CLI instalada globalmente) para obtener la puntuación oficial (0-100) en:
- **Performance (Rendimiento):** LCP, Speed Index, Total Blocking Time (TBT), Cumulative Layout Shift (CLS).
- **Accessibility (Accesibilidad):** Cumplimiento de estándares de contraste, etiquetas semánticas y ARIA.
- **Best Practices (Buenas Prácticas):** Seguridad HTTPS, APIs modernas, optimización de recursos y ausencia de errores de consola.
- **SEO (Posicionamiento Técnico):** Metadatos, etiquetas OpenGraph, legibilidad para rastreadores de Google y robots.txt.

## Instrucciones de Ejecución (/lighthouse)
Cuando el usuario escriba `/lighthouse` o pida auditar la web con Lighthouse:
1. Identificar la URL objetivo (por defecto la web en desarrollo local: `http://localhost:5173`, `http://localhost:3000` o la URL que indique el usuario).
2. Ejecutar la auditoría en modo headless generando informe JSON o HTML:
   ```bash
   lighthouse "http://localhost:5173" --chrome-flags="--headless --no-sandbox" --output=json --output-path="/tmp/lighthouse-report.json" --quiet
   ```
3. Extraer y presentar al usuario las 4 puntuaciones en un formato visual limpio:
   - 🟢 **Performance:** XX / 100
   - 🟢 **Accessibility:** XX / 100
   - 🟢 **Best Practices:** XX / 100
   - 🟢 **SEO:** XX / 100
4. Listar las 3 oportunidades de mejora más críticas detectadas (p. ej. compresión de imágenes, recursos que bloquean el renderizado, o atributos `alt` faltantes).

