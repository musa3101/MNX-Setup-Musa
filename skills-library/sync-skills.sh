#!/bin/bash
# Compara la biblioteca (este repo) con las skills del IDE. Por defecto SOLO informa.
#   sync-skills.sh                    -> informe
#   sync-skills.sh --to-repo NOMBRE   -> copia skill del IDE al repo
#   sync-skills.sh --to-ide NOMBRE    -> copia skill del repo al IDE (equipo nuevo)
# Siempre preguntar al usuario la dirección antes de usar --to-*.
set -e
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="$HERE/skills"
IDE="${MUSA_IDE_SKILLS:-$HOME/.gemini/config/skills}"

case "$1" in
  --to-repo) cp -R "$IDE/$2" "$REPO/" && echo "Copiada $2 -> repositorio"; exit 0 ;;
  --to-ide)  mkdir -p "$IDE" && cp -R "$REPO/$2" "$IDE/" && echo "Copiada $2 -> IDE"; exit 0 ;;
esac

names() { ls -1 "$1" 2>/dev/null | grep -v '^\.' | sort; }
echo "== Solo en el repositorio (¿instalar en el IDE?) =="
comm -23 <(names "$REPO") <(names "$IDE") | sed 's/^/  /'
echo "== Solo en el IDE (¿subir al repositorio?) =="
comm -13 <(names "$REPO") <(names "$IDE") | sed 's/^/  /'
echo "== En ambos pero con contenido distinto =="
for s in $(comm -12 <(names "$REPO") <(names "$IDE")); do
  diff -rq "$REPO/$s" "$IDE/$s" >/dev/null 2>&1 || echo "  $s"
done

