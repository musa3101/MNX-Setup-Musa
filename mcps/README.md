# 🔌 Servidores MCP — MYNEXT Setup

En esta carpeta se encuentra la configuración completa y detallada de todos los servidores **MCP (Model Context Protocol)** utilizados en Google Antigravity para automatizar las tareas con GitHub, GitLab, Cloudflare, Supabase y Google Stitch.

---

## ⚡ Inventario de MCPs

| MCP | Propósito | Autenticación |
|---|---|---|
| 🧵 **Google Stitch** | Creación y edición autónoma de webs en Stitch | `X-Goog-Api-Key` |
| 🐙 **GitHub** | Gestión de repositorios, commits, ramas e issues | `GITHUB_PERSONAL_ACCESS_TOKEN` |
| ☁️ **Cloudflare** | Despliegues, Workers, KV, R2 y D1 | `CLOUDFLARE_API_TOKEN` + Account ID |
| 🦊 **GitLab** | Integración con proyectos de GitLab | `GITLAB_PERSONAL_ACCESS_TOKEN` |
| ⚡ **Supabase** | Gestión de base de datos y backend Supabase | `--access-token` |

---

## 🚀 Restauración en un Nuevo Entorno

Para restaurar todos los MCPs en Antigravity IDE:
1. Copia `mcp_config.json` a `~/.gemini/antigravity-ide/mcp_config.json`
2. Reinicia o recarga el panel MCP en Antigravity.
