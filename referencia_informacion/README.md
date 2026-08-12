# 🚀 Setup de Musa — MYNEXT

Bienvenido al repositorio maestro de configuración personal para **Google Antigravity IDE** y el entorno de desarrollo de **MYNEXT**.

Este repositorio centraliza todos los servidores MCP, reglas de desarrollo, skills personalizadas, tipografías y documentación necesarias para trabajar de manera autónoma e inteligente.

---

## 🗂️ Estructura del Repositorio

```
setup-musa-mynext/
├── 🔌 mcps/                   # Servidores MCP (Google Stitch, GitHub, Cloudflare, GitLab, Supabase)
│   ├── mcp_config.json        # Configuración lista para copiar
│   └── README.md              # Documentación e instrucciones de restauración
├── 🎯 skills/                 # Skills personalizadas de Antigravity
│   ├── gpt-taste/             # Reglas visuales y diseño vanguardista
│   ├── i18nstack/             # Buenas prácticas para internacionalización
│   ├── motion-design/         # Animaciones avanzadas y microinteracciones
│   ├── skill-tailwind/        # Configuración de Tailwind CSS v4 (@theme)
│   ├── uipro-max/             # UI/UX pro y componentes Bento Grid
│   ├── setup-mynext/          # Inicialización local y control de flujo de sesión
│   └── README.md              # Guía de skills
├── 🎨 typography/             # Jerarquía tipográfica y emparejamiento de fuentes MYNEXT
│   └── README.md              # Guía de fuentes y estéticas
├── 📄 docs/                   # Documentación de sesiones y Roadmap
│   ├── SESSION_LATEST_ES.md
│   └── ROADMAP.md
├── ⚙️ AGENTS.md                # Reglas globales estrictas de desarrollo
├── ⚡ setup.sh                # Script de automatización para entorno local (dev branch + npm)
└── 📦 mcp_config.json         # JSON maestro de configuración MCP en raíz
```

---

## 🔌 Servidores MCP Incluidos

1. **Google Stitch MCP**: Integración con API Key privada para creación de páginas web autónoma.
2. **GitHub MCP**: Control total de repositorios, archivos y pull requests.
3. **Cloudflare MCP**: Gestión de Workers, KV, R2, D1 y despliegues.
4. **GitLab MCP**: Integración con repositorios GitLab.
5. **Supabase MCP**: Conexión directa a base de datos y backend.

---

## 🛠️ Restauración en una Nueva Sesión o Equipo

Para restaurar tu entorno de desarrollo en cualquier momento:

```bash
# Copiar configuración MCP a Antigravity IDE
cp mcps/mcp_config.json ~/.gemini/antigravity-ide/mcp_config.json
```

---

*Repositorio Privado de Musa — MYNEXT*
