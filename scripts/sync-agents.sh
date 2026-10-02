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

Chame o agente adequado para cada tarefa:

- **AAS Specialist** (`agents/aas-specialist.md`) — modelagem, metamodelo, submodelos, APIs
- **BaSyx Integration** (`agents/basyx-integration.md`) — deploy, Docker, configuração de servidor
- **Submodel Validator** (`agents/submodel-validator.md`) — validação de conformidade IDTA

## Regras gerais

- Responder em PT-BR por padrão
- Sempre referenciar a versão da especificação IDTA ao citar uma norma
- Portal oficial das specs: https://industrialdigitaltwin.io/aas-specifications/index/home/index.html
- Versões vigentes: Part 1 v3.2, Part 2 v3.2, Part 3a v3.1.1, Part 3b v3.0, Part 4 v3.1, Part 5 v3.2
- Repositórios de referência (schemas, exemplos, ferramentas): https://github.com/admin-shell-io

## Skills e subagents (Claude Code)

- Skills: `aas-spec-lookup` (specs IDTA-01001…01005), `aas-submodel-templates` (templates IDTA-02xxx)
- Subagents: `aas-spec-auditor` (conformidade v3.2), `aas-modeler` (modelos a partir de templates)
- Dependem de `docs/AAS Specifications/` e `docs/AAS Submodel Templates/` na raiz do workspace. Para gerá-los: `scripts/setup-aas-docs.sh <workspace>/docs`

## Ativação por contexto

| Contexto | Agente preferencial |
|---|---|
| Arquivos `*.json`, `*.xml`, `*.aasx` | AAS Specialist + Submodel Validator |
| `docker-compose.yml`, `*.yml` de infra | BaSyx Integration |
| Scripts Python com `basyx.aas` | AAS Specialist + BaSyx Integration |
| Perguntas de validação/conformidade | Submodel Validator |
| Citar/consultar specs, constraints AASd | skill `aas-spec-lookup` |
| Submodel Templates IDTA-02xxx | skill `aas-submodel-templates` / subagent `aas-modeler` |
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
echo "    aider --read $ROOT/.claude/skills/aas-spec-lookup/SKILL.md"

echo ""
echo "✅ Sincronização concluída."
echo ""
echo "📋 Checklist manual:"
echo "   [ ] .kiro/steering/ — verificar frontmatter de ativação"
echo "   [ ] .github/copilot-instructions.md — verificar se conteúdo está atualizado"
echo "   [ ] .cursor/rules — verificar se conteúdo está atualizado"
