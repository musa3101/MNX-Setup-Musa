# 🛠️ Configuración Maestra de MCPs — Google Antigravity Setup

Este documento contiene el inventario completo y la configuración de todos los servidores MCP (Model Context Protocol) del usuario para restaurar en cualquier equipo o sesión de Google Antigravity.

---

## 📋 Lista de MCPs Configurados

### 1. 🧵 Google Stitch MCP
- **Propósito**: Creación y modificación autónoma de páginas web en Google Stitch.
- **URL**: `https://stitch.googleapis.com/mcp`
- **Header**: `X-Goog-Api-Key: AQ.Ab8RN6Ix-EmWxUOtKWDeNDAl1Gv9XFH7jVaMeZVbLinr8g5wvQ`
- **Comando**: `npx -y mcp-remote https://stitch.googleapis.com/mcp --header "X-Goog-Api-Key: AQ.Ab8RN6Ix-EmWxUOtKWDeNDAl1Gv9XFH7jVaMeZVbLinr8g5wvQ"`
- **Instrucción para el Agente**: Cuando el usuario solicite crear o editar webs en Google Stitch, Antigravity debe realizar todo el trabajo de manera directa a través de este MCP sin solicitar credenciales.

### 2. 🐙 GitHub MCP
- **Paquete**: `@modelcontextprotocol/server-github`
- **Token**: `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`
- **Variable de Entorno**: `GITHUB_PERSONAL_ACCESS_TOKEN`

### 3. ☁️ Cloudflare MCP
- **Paquete**: `@cloudflare/mcp-server-cloudflare`
- **Token**: `cfut_0IE8eL2O2MuCK5TlR7Zo9CwhKXUP9b1yaRuREu4h45895f9d`
- **Account ID**: `88059fc16ce7af95af8a73c203ea5f8a`
- **Comando**: `/usr/local/bin/npx --yes @cloudflare/mcp-server-cloudflare run 88059fc16ce7af95af8a73c203ea5f8a`

### 4. 🦊 GitLab MCP
- **Paquete**: `@modelcontextprotocol/server-gitlab`
- **Token**: `glpat-rSgnRsJ69SV1ELc7DyX8IGM6MQpvOjEKdTpuYnZzdQ8.01.170i4bm3u`
- **API URL**: `https://gitlab.com/api/v4`
- **Cuenta**: `Mynextbymusa@gmail.com`

### 5. ⚡ Supabase MCP
- **Paquete**: `@supabase/mcp-server-supabase@latest`
- **Access Token**: `sbp_576e9fa63e5f7ac0bf1b1f0588b3a758e76d683b`

### 6. 🔍 REA MCP (Reverse Engineer Anything)
- **Paquete**: `rea-agents@latest`
- **Comando**: `npx -y rea-agents@latest --mcp`
- **Propósito**: Suite universal de ingeniería inversa local con más de 200 herramientas.
- **Capacidades**: Descompilación e inspección de ejecutables nativos (Mach-O, ELF, PE), extracción y análisis de paquetes Electron (`app.asar`, bundles V8), módulos `.node`, depuración dinámica con LLDB, puentes con Hopper y Ghidra, y análisis de aplicaciones Android y .NET.
- **Habilidades (Skills) asociadas**: `reverse-engineer-anything`.
- **Instrucción para el Agente**: Cuando el usuario solicite *"usa el mcp de rea para..."*, *"analiza este binario..."* o tareas de ingeniería inversa, invocar directamente las herramientas del servidor MCP de REA o sus comandos de terminal.

---

## 🚀 Instrucciones de Restauración Rápidas

Para aplicar esta configuración en una nueva instalación o sesión de Antigravity:

1. Copia el archivo `mcp_config.json` a las siguientes rutas del sistema:
   - `~/.gemini/antigravity-ide/mcp_config.json`
   - `~/.gemini/config/mcp_config.json`
   - `~/.gemini/antigravity/mcp_config.json`
2. Reinicia o recarga el panel de MCPs en Antigravity IDE.
