# 🚀 Reglas Globales de MYNEXT

Estas reglas rigen automáticamente todo el comportamiento de desarrollo web en este entorno.
Si estás construyendo una web, asume que estas reglas están activas y combínalas con las *skills* de este repositorio.

## 1. Diseño y Tipografía (Premium)
- **NO uses estéticas genéricas**.
- Sigue la **jerarquía tipográfica estricta**:
  - `H1`: Gigante, bold, tracking muy ajustado.
  - `H2`: Grande, semibold o regular.
  - `H3 (Eyebrow)`: Pequeño, encima del H1.
  - `H4`: Cuerpo del texto, límite de 65 caracteres de ancho.
  - `CTA (Call To Action)`: Texto muy pequeño, MAYÚSCULAS, tracking (espaciado de letras) muy amplio.
- **Emparejamientos de Fuentes MYNEXT**: Prioriza pares modernos como MUSERO x ERTINAS, ELEGIST x MARLINO, RIVAGE x ERTINAS, CLEAN FRAGILE x MIRAVA, o GRANITY x INTER.

## 2. Motion Design & UI
- Usa estructuras limpias como **Bento Grids**.
- Las animaciones deben ser avanzadas: usa `GSAP` si hay mucho movimiento, implementa apariciones escalonadas (*stagger*), *blur-reveal* para títulos, y usa siempre curvas *cubic-bezier* (nunca transiciones lineales).
- Asegúrate de que las microinteracciones en botones y enlaces se sientan orgánicas.

## 3. Código y Estructura
- Mantén el HTML modular y limpio.
- Si usas Tailwind CSS v4, centraliza colores personalizados, fuentes y radios en la directiva `@theme`.
- Protege los diseños al internacionalizarlos (i18n), evitando traducciones literales y validando que las palabras más largas (como en español) no rompan los contenedores.

## 4. Flujo de Trabajo (Git & Cloudflare) - REGLA ESTRICTA
- **NUNCA** hagas `git commit` y `git push` a la rama `main` de forma automática.
- Todo el trabajo, pruebas locales y cambios en vivo se deben hacer en una rama secundaria llamada `dev`.
- Si el usuario te pide levantar el entorno, ejecuta el archivo `setup.sh` (si existe) para automatizar la creación de la rama `dev`, el `npm install` y el `npm run dev`.
- **Solo** fusionarás `dev` con `main` y harás push cuando el usuario te dé el "OK" explícito y diga que los cambios están listos para producción (Cloudflare).
