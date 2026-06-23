#!/bin/bash
# sync-agents.sh
# Sincroniza agents/ (fonte da verdade) para todos os formatos de ferramentas.
# Execute após editar qualquer arquivo em agents/

set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGENTS="$ROOT/agents"

echo "🔄 Sincronizando agents para todas as ferramentas..."

# ── Claude Code ──────────────────────────────────────────────────────────────
echo "  → CLAUDE.md"
cat > "$ROOT/CLAUDE.md" << 'EOF'
# AAS Agents — Claude Code

Este projeto contém agent specs para Asset Administration Shell (AAS) / Industrie 4.0.

## Agentes disponíveis

- **AAS Specialist** (`agents/aas-specialist.md`) — modelagem, metamodelo, submodelos, APIs
- **BaSyx Integration** (`agents/basyx-integration.md`) — deploy, Docker, configuração de servidor
- **Submodel Validator** (`agents/submodel-validator.md`) — validação de conformidade IDTA

## Regras gerais

- Responder em PT-BR por padrão
- Sempre referenciar a versão da especificação IDTA ao citar uma norma
- Portal oficial: https://industrialdigitaltwin.io/aas-specifications/index/home/index.html
- Release atual: IDTA 25-01

## Ativação por contexto

| Contexto | Agente preferencial |
|---|---|
| Arquivos `*.json`, `*.xml`, `*.aasx` | AAS Specialist + Submodel Validator |
| `docker-compose.yml`, infra | BaSyx Integration |
| Scripts Python `basyx.aas` | AAS Specialist + BaSyx Integration |
| Perguntas de validação | Submodel Validator |
EOF

# ── Kiro steering ─────────────────────────────────────────────────────────────
echo "  → .kiro/steering/ (preserva frontmatter)"
# Os arquivos Kiro têm frontmatter próprio — não sobrescrever automaticamente.
# Apenas avisar se estiverem desatualizados em relação ao conteúdo base.
echo "     (Kiro: edite .kiro/steering/ manualmente para ajustar frontmatter de ativação)"

# ── GitHub Copilot ────────────────────────────────────────────────────────────
echo "  → .github/copilot-instructions.md"
# Copilot tem limite de contexto — mantém versão compacta manualmente.
echo "     (Copilot: arquivo compacto — edite .github/copilot-instructions.md manualmente)"

# ── Cursor / Windsurf ─────────────────────────────────────────────────────────
echo "  → .cursor/rules"
echo "     (Cursor: edite .cursor/rules manualmente)"

# ── Aider ─────────────────────────────────────────────────────────────────────
echo ""
echo "  Aider — uso manual:"
echo "    aider --read $AGENTS/aas-specialist.md"
echo "    aider --read $AGENTS/basyx-integration.md"
echo "    aider --read $AGENTS/submodel-validator.md"

echo ""
echo "✅ Sincronização concluída."
echo ""
echo "📋 Checklist manual:"
echo "   [ ] .kiro/steering/ — verificar frontmatter de ativação"
echo "   [ ] .github/copilot-instructions.md — verificar se conteúdo está atualizado"
echo "   [ ] .cursor/rules — verificar se conteúdo está atualizado"
