# 🛠️ Inventario de MCPs — Google Antigravity

Inventario de los servidores MCP usados. **Aquí no hay tokens**: las claves viven solo en tu `mcp_config.json` local (nunca en Git). Plantilla: [`../mcps/mcp_config.template.json`](../mcps/mcp_config.template.json).

| MCP | Paquete / endpoint | Credencial necesaria |
|---|---|---|
| Google Stitch | `mcp-remote https://stitch.googleapis.com/mcp` | API key de Google (header `X-Goog-Api-Key`) |
| GitHub | `@modelcontextprotocol/server-github` | `GITHUB_PERSONAL_ACCESS_TOKEN` |
| Cloudflare | `@cloudflare/mcp-server-cloudflare` | `CLOUDFLARE_API_TOKEN` + Account ID |
| GitLab | `@modelcontextprotocol/server-gitlab` | `GITLAB_PERSONAL_ACCESS_TOKEN` |
| Supabase | `@supabase/mcp-server-supabase` | `--access-token` |
| REA | `rea-agents@latest --mcp` | ninguna |
| 21st | `https://21st.dev/api/mcp` | `x-api-key` |

## Restauración
1. `cp mcp_config.template.json ~/.gemini/antigravity/mcp_config.json`
2. Rellena tus credenciales en ese archivo (guárdalas en tu gestor de contraseñas).
3. Reinicia los MCP en Antigravity.

> [!IMPORTANT]
> Un MCP (Supabase/InsForge/Cloudflare) da acceso a **tu cuenta**, no al backend real de cada proyecto. Para eso el setup pregunta en la entrevista inicial.
