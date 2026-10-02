#!/bin/bash
# setup-aas-docs.sh
# Prepara a pasta de documentos usada pelas skills/agents aas-spec-* e aas-submodel-*.
#
# Uso: ./scripts/setup-aas-docs.sh <workspace>/docs
#
#   <docs>/AAS Specifications/      coloque aqui os PDFs IDTA-0100x (Partes 1–5);
#                                   o script extrai o texto e gera constraints.md
#   <docs>/AAS API/                 OpenAPI da Parte 2 (admin-shell-io/aas-specs-api, tag $AAS_API_TAG)
#                                   em source/ + um YAML autocontido por perfil em bundled/
#   <docs>/AAS Submodel Templates/  clonado/atualizado de admin-shell-io/submodel-templates
#                                   (published/) + PDFs do content hub + CATALOG.md
#
# Requisitos: git, curl, python3, pdftotext (poppler-utils)

set -e

DOCS="${1:?uso: $0 <workspace>/docs}"
SCRIPTS="$(cd "$(dirname "$0")" && pwd)"
SPECS="$DOCS/AAS Specifications"
SMT="$DOCS/AAS Submodel Templates"
API="$DOCS/AAS API"
AAS_API_TAG="${AAS_API_TAG:-v3.2.0}"
HUB="https://industrialdigitaltwin.org/en/content-hub/submodels"

mkdir -p "$SPECS" "$SMT/pdf"

# ── Especificações ───────────────────────────────────────────────────────────
echo "🔄 Especificações em: $SPECS"
shopt -s nullglob
for pdf in "$SPECS"/IDTA-0100*.pdf; do
  base=$(basename "$pdf")
  case "$base" in
    IDTA-01001*) txt=Part1_Metamodel.txt ;;
    IDTA-01002*) txt=Part2_API.txt ;;
    IDTA-01003-a*) txt=Part3a_DataSpec_IEC61360.txt ;;
    IDTA-01003-b*) txt=Part3b_DataSpec_UoM.txt ;;
    IDTA-01004*) txt=Part4_Security.txt ;;
    IDTA-01005*) txt=Part5_AASX.txt ;;
    *) continue ;;
  esac
  echo "  → $base → $txt"
  pdftotext -layout "$pdf" "$SPECS/$txt" 2>/dev/null || true
done
if [ -f "$SPECS/Part1_Metamodel.txt" ]; then
  python3 "$SCRIPTS/aas_docs.py" constraints "$SPECS"
else
  echo "  ⚠️  Nenhum IDTA-01001*.pdf encontrado — baixe as specs em"
  echo "     https://industrialdigitaltwin.io/aas-specifications/index/home/index.html"
fi

# ── AAS API (OpenAPI, Parte 2) ──────────────────────────────────────────────
echo "🔄 AAS API ($AAS_API_TAG) em: $API"
TMPAPI="$(mktemp -d)"
git clone -q --depth 1 --branch "$AAS_API_TAG" \
  https://github.com/admin-shell-io/aas-specs-api.git "$TMPAPI/repo"
mkdir -p "$API/source" "$API/bundled"
rsync -a --delete --exclude='.git' --exclude='.github' --exclude='.qodana' "$TMPAPI/repo/" "$API/source/"
rm -rf "$TMPAPI"
if command -v npx >/dev/null 2>&1; then
  ( cd "$API/source" && for y in */V*_SSP-*.yaml Entire-API-Collection/V*.yaml; do
      npx -y @redocly/cli@1 bundle "$y" -o "../bundled/$(dirname "$y")__$(basename "$y")" >/dev/null \
        || echo "     falhou bundle: $y"
    done )
else
  echo "  ⚠️  npx não encontrado — bundled/ não foi gerado"
fi

# ── Submodel Templates ───────────────────────────────────────────────────────
echo "🔄 Submodel Templates em: $SMT"
if [ -d "$SMT/repo/.git" ]; then
  git -C "$SMT/repo" pull -q --depth 1
else
  # Sem .git (ex.: cópia versionada em aas-agents/docs): clona num diretório
  # temporário e sincroniza só os arquivos, sem aninhar outro repositório git.
  TMP="$(mktemp -d)"
  git clone -q --depth 1 --filter=blob:none --sparse \
    https://github.com/admin-shell-io/submodel-templates.git "$TMP/repo"
  git -C "$TMP/repo" sparse-checkout set published
  mkdir -p "$SMT/repo"
  rsync -a --delete --exclude='.git' "$TMP/repo/" "$SMT/repo/"
  rm -rf "$TMP"
fi
python3 "$SCRIPTS/aas_docs.py" catalog "$SMT"

echo "  → PDFs do content hub"
curl -sL -A "Mozilla/5.0" "$HUB" \
  | grep -oE 'href="[^"]+\.pdf"' | sed 's/^href="//;s/"$//' | sort -u \
  | while read -r url; do
      f="$SMT/pdf/$(basename "$url")"
      [ -s "$f" ] && continue
      curl -sfL -A "Mozilla/5.0" --max-time 90 -o "$f" "$url" || { rm -f "$f"; echo "     falhou: $url"; }
    done

echo "✅ Pronto. Leia $SPECS/constraints.md e $SMT/CATALOG.md"
