# 🚀 MYNEXT Setup 2.0 — Repositorio Maestro

Estructura modular y limpia para los proyectos de desarrollo web de **Musa / MYNEXT**.

---

## 🗂️ Organización en 2 Módulos Independientes

```text
setup 2.0/
├── 🎯 setup-musa/                 # MÓDULO 1: NÚCLEO OPERATIVO (Prioridad)
│   ├── AGENTS.md                  # Reglas del agente (rama dev, merge protegido, anti-slop)
│   ├── SETUP_MUSA.md              # Protocolo completo de trabajo
│   ├── interview.md               # Entrevista inicial para nuevos proyectos
│   ├── templates/                 # Plantilla protegida de .gitignore (para blindar .env)
│   └── scripts/
│       ├── session-start.sh       # Abre sesión, pasa a dev, registra .musa/session.json
│       ├── mini-merge.sh          # Mini-merge seguro con worktree (ideal para 2 ventanas)
│       └── session-end.sh         # Cierra sesión y prepara resumen para docs/
│
├── 🧠 skills-library/             # MÓDULO 2: BIBLIOTECA DE SKILLS (Independiente)
│   ├── README.md                  # Inventario de skills curadas
│   ├── sync-skills.sh             # Compara repo ↔ IDE y pregunta antes de copiar
│   └── skills/                    # 19 skills de diseño luxury, motion, backend y seguridad
│
└── 🗄️ config-backups/             # RESPALDOS SEGUROS
    ├── docs/
    │   └── MCP_CONFIG_SETUP.md    # Inventario MCP (sin tokens en texto plano)
    ├── mcps/
    │   ├── mcp_config.template.json # Plantilla para restaurar en IDEs limpios
    │   └── README.md
    └── chrome-cdp/
        └── CONNECT_CHROME_CDP.md  # Conexión Chrome DevTools CDP
```

---

## 💡 Puntos Clave

1. **Setup y Skills son totalmente independientes**: El setup no te obliga a instalar skills si ya las tienes en tu IDE. Solo se sincronizan si tú lo pides.
2. **Cero Keep-Alive**: Se eliminaron workflows automáticos innecesarios.
3. **Cero Secretos Expuestos**: Ningún token personal vive en este repositorio.
4. **Protección Real contra Merges**:
   - Frase obligatoria: **"Tienes mi OK, haz el merge"**.
   - Doble confirmación antes de subir a Cloudflare o GitHub.
   - **El merge NO cierra la sesión**: se sigue en `dev`.
   - Soporte para **dos ventanas abiertas**: `mini-merge.sh` no toca la rama de tu otra ventana.

