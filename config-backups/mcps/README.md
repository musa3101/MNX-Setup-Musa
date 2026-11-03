# 🔌 Servidores MCP — MYNEXT Setup 2.0

En esta carpeta se encuentra la plantilla maestra de configuración para los servidores **MCP (Model Context Protocol)** utilizados en Google Antigravity IDE.

---

## ⚡ Inventario de MCPs Integrados

| MCP | Propósito | Configuración / Protocolo |
|---|---|---|
| 🧵 **Google Stitch** | Creación y edición autónoma de webs en Stitch | `mcp-remote` + `X-Goog-Api-Key` |
| 🐙 **GitHub** | Repositorios, commits, ramas, PRs e issues | `@modelcontextprotocol/server-github` + PAT |
| ☁️ **Cloudflare** | Despliegues, Workers, KV, R2 y D1 | `@cloudflare/mcp-server-cloudflare` + Account ID |
| 🦊 **GitLab** | Proyectos y repositorios GitLab | `@modelcontextprotocol/server-gitlab` + PAT |
| ⚡ **Supabase** | Base de datos Postgres, Auth, Storage y RLS | `@supabase/mcp-server-supabase` + Access Token |
| 🔍 **REA** | Suite de ingeniería inversa universal | `npx -y rea-agents@latest --mcp` |
| 🪄 **21st** | Componentes y snippets de diseño reactivo | API endpoint `https://21st.dev/api/mcp` |

---

## 🚀 Restauración Segura

1. Copia `mcp_config.template.json` como `mcp_config.json`:
   ```bash
   cp mcp_config.template.json ~/.gemini/antigravity/mcp_config.json
   ```
2. Rellena tus tokens y credenciales en `~/.gemini/antigravity/mcp_config.json`.
3. Reinicia o recarga los servidores MCP en el panel de Antigravity IDE.

