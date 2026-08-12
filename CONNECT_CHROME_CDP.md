# 🌐 Guía de Conexión a Google Chrome mediante CDP (Depuración Remota)

Este documento sirve de guía e instrucción para cualquier agente de IA que trabaje en este entorno. Léelo atentamente si el subagente de navegación nativo (`browser_subagent`) falla al iniciar debido a errores de red o descargas de drivers de Playwright bloqueadas (como el error 404 de la versión 1.57.0).

---

## 🛑 1. Diagnóstico del Problema
Cuando el subagente de navegación arroja un error al conectar o descargar componentes, la alternativa es controlar el navegador Google Chrome local del usuario. 
* **NOTA IMPORTANTE PARA EL AGENTE:** Playwright suele arrojar un error de protocolo (`Browser.setDownloadBehavior: Browser context management is not supported`) al conectarse mediante CDP a una instancia física de Chrome en macOS. Por ello, **se debe utilizar Puppeteer** para establecer la conexión.

---

## ⚡ 2. Pasos para Activar Google Chrome en Modo Depuración

### Paso A: Cerrar instancias previas
Para que el puerto `9222` se abra correctamente, no debe haber procesos de Chrome huérfanos o en segundo plano. El agente puede ejecutar este comando en la terminal:
```bash
killall "Google Chrome" || true
```

### Paso B: Lanzar Chrome con perfil temporal aislado
El agente debe abrir Chrome forzando un puerto de depuración y un directorio de datos de usuario aislado para evitar que se comparta la sesión principal. Ejecuta el siguiente comando en segundo plano:
```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir="/Users/musa/.gemini/antigravity-ide/brain/chrome-profile-temp" > /dev/null 2>&1 &
```

---

## 🛠️ 3. Código de Automatización con Puppeteer (Plantilla de Control)

El agente debe crear un archivo script en la carpeta de pruebas/scratch (ej. `live_control_puppeteer.js`) con la siguiente plantilla para controlar y testear la página:

```javascript
const puppeteer = require('puppeteer');

(async () => {
  console.log('Conectando a Google Chrome en el puerto 9222...');
  let browser;
  try {
    browser = await puppeteer.connect({
      browserURL: 'http://127.0.0.1:9222',
      defaultViewport: null
    });
    console.log('¡Conexión establecida con éxito!');
  } catch (err) {
    console.error('Error al conectar:', err.message);
    process.exit(1);
  }

  // Obtener la pestaña activa o abrir una nueva
  const pages = await browser.pages();
  const page = pages.length > 0 ? pages[0] : await browser.newPage();

  // URL del proyecto en desarrollo (por ejemplo: localhost o mynextbymusa.com)
  const targetUrl = 'https://mynextbymusa.com'; 
  console.log(`Navegando a ${targetUrl}...`);
  
  try {
    await page.goto(targetUrl, { waitUntil: 'load', timeout: 45000 });
  } catch (e) {
    console.log('Aviso durante la carga:', e.message);
  }
  
  // Espera a que termine cualquier redirección o carga inicial
  await new Promise(resolve => setTimeout(resolve, 3000));

  // --- EJEMPLO DE NAVEGACIÓN Y AUDITORÍA VISUAL ---
  
  // 1. Scroll hacia abajo
  console.log('Haciendo scroll hacia abajo...');
  for (let i = 0; i < 6; i++) {
    try {
      await page.evaluate(() => window.scrollBy({ top: 350, behavior: 'smooth' }));
    } catch (err) {
      console.log('Reconectando contexto...');
    }
    await new Promise(resolve => setTimeout(resolve, 1200));
  }

  await new Promise(resolve => setTimeout(resolve, 2000));

  // 2. Scroll de vuelta hacia arriba
  console.log('Volviendo arriba...');
  for (let i = 0; i < 6; i++) {
    try {
      await page.evaluate(() => window.scrollBy({ top: -350, behavior: 'smooth' }));
    } catch (err) {
      console.log('Reconectando contexto...');
    }
    await new Promise(resolve => setTimeout(resolve, 1000));
  }

  // 3. Tomar captura de pantalla para el reporte de auditoría
  const screenshotPath = './screenshot_audit.png';
  await page.screenshot({ path: screenshotPath, fullPage: true });
  console.log(`Captura guardada en: ${screenshotPath}`);

  // Desconectar sin cerrar la ventana del usuario
  await browser.disconnect();
  console.log('Control finalizado.');
  process.exit(0);
})();
```

---

## 📋 4. Instrucción Directa para el Agente de IA:
1. Lee este archivo.
2. Si el usuario te pide navegar o analizar visualmente un sitio web y el subagente nativo falla, **no inventes el reporte**.
3. Sigue los pasos anteriores de lanzamiento de puerto y conexión por Puppeteer.
4. Toma las capturas de pantalla necesarias y analízalas visualmente para entregar un reporte verídico e interactivo.
