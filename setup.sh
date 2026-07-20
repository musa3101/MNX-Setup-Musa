#!/bin/bash

# ==========================================
# MYNEXT - AUTOMATIZACIÓN DE ENTORNO LOCAL
# ==========================================
echo "🚀 Iniciando el entorno de desarrollo Pro de MYNEXT..."

# 1. Cambiar a rama de desarrollo para evitar despliegues accidentales en Cloudflare
echo "🌿 Cambiando a la rama de desarrollo (dev)..."
git checkout -b dev || git checkout dev

# 2. Instalar dependencias por si acaso
echo "📦 Instalando dependencias..."
npm install

# 3. Lanzar el servidor local automáticamente
echo "🔥 Levantando localhost..."
npm run dev
