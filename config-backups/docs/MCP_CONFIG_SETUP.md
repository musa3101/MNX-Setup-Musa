# 🛠️ Inventario de MCPs — Google Antigravity

Inventario de los servidores MCP usados en el ecosistema **MYNEXT**. **Aquí no hay tokens**: las claves viven solo en tu `mcp_config.json` local (nunca en Git). Plantilla maestra: [`../mcps/mcp_config.template.json`](../mcps/mcp_config.template.json).

| MCP | Paquete / endpoint | Credencial necesaria | Propósito |
|---|---|---|---|
| **Google Stitch** | `mcp-remote https://stitch.googleapis.com/mcp` | API key de Google (`X-Goog-Api-Key`) | Generación y edición UI en Stitch |
| **GitHub** | `@modelcontextprotocol/server-github` | `GITHUB_PERSONAL_ACCESS_TOKEN` | Repos, PRs, ramas e issues |
| **Cloudflare** | `@cloudflare/mcp-server-cloudflare` | `CLOUDFLARE_API_TOKEN` + Account ID | Workers, KV, D1 y R2 |
| **GitLab** | `@modelcontextprotocol/server-gitlab` | `GITLAB_PERSONAL_ACCESS_TOKEN` | Repositorios y pipelines GitLab |
| **Supabase** | `@supabase/mcp-server-supabase` | `--access-token` | Base de datos Postgres, Auth, Storage, Edge Functions |
| **REA** | `rea-agents@latest --mcp` | Ninguna | Ingeniería inversa universal y análisis binario/web |
| **21st** | `https://21st.dev/api/mcp` | `x-api-key` | Catálogo de componentes y snippets de UI |
| **Context7** | `@context7/mcp-server` | Ninguna / API Key opcional | Documentación técnica oficial en tiempo real |
| **Canva** | `@canva/mcp-server` | `CANVA_API_KEY` | Creación y edición automatizada en Canva |
| **TestSprite** | `@testsprite/mcp-server` | `TESTSPRITE_API_KEY` | Generación y ejecución de test suites automatizadas |
| **FilmCraft** | `filmcraft-mcp` | Ninguna | Automatización de edición y montaje de vídeo |
| **Photon** | `photon-mcp` | Ninguna | Edición y composición gráfica multicapa |

## 🚀 Restauración

1. `cp config-backups/mcps/mcp_config.template.json ~/.gemini/antigravity/mcp_config.json`
2. Rellena tus credenciales en ese archivo (guárdalas en tu gestor de contraseñas).
3. Reinicia los MCP en Antigravity.

> [!IMPORTANT]
> Un MCP (Supabase/InsForge/Cloudflare) da acceso a **tu cuenta**, no al backend real de cada proyecto. Para eso el setup pregunta en la entrevista inicial.
