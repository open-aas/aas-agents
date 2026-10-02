# AAS Agents

Repositório de agent specs para **Asset Administration Shell (AAS)** — Industrie 4.0.

Compatível com Claude Code, Kiro, Cursor, Windsurf, GitHub Copilot e Aider.

---

## Estrutura

```
aas-agents/
├── agents/                        ← fonte da verdade (edite aqui)
│   ├── aas-specialist.md          ← especialista em metamodelo e submodelos
│   ├── basyx-integration.md       ← stack BaSyx, Docker, deploy
│   └── submodel-validator.md      ← validação IDTA e semântica
│
├── CLAUDE.md                      ← Claude Code (gerado por sync)
│
├── .claude/                       ← Claude Code: skills e subagents nativos
│   ├── skills/
│   │   ├── aas-spec-lookup/       ← consulta às specs IDTA-01001…01005
│   │   └── aas-submodel-templates/← uso dos Submodel Templates IDTA-02xxx
│   └── agents/
│       ├── aas-spec-auditor.md    ← auditoria de conformidade com a v3.2
│       └── aas-modeler.md         ← modelos AAS JSON a partir de templates
│
├── .kiro/steering/                ← Kiro (ativação contextual por arquivo)
│   ├── aas-specialist.md
│   ├── basyx-integration.md
│   ├── submodel-validator.md
│   ├── aas-specifications.md      ← specs IDTA locais (docs/AAS Specifications)
│   └── aas-submodel-templates.md  ← templates IDTA locais (docs/AAS Submodel Templates)
│
├── .github/
│   └── copilot-instructions.md    ← GitHub Copilot
│
├── .cursor/
│   └── rules                      ← Cursor / Windsurf
│
├── scripts/
│   ├── sync-agents.sh             ← sincroniza agents/ → todas as ferramentas
│   ├── setup-aas-docs.sh          ← prepara docs/ (specs + templates) num workspace
│   └── aas_docs.py                ← gera constraints.md e CATALOG.md
│
└── README.md
```

---

## Agentes disponíveis

| Agente | Arquivo | Especialidade |
|---|---|---|
| AAS Specialist | `agents/aas-specialist.md` | Metamodelo, submodelos, identificadores, APIs |
| BaSyx Integration | `agents/basyx-integration.md` | Stack BaSyx, Docker, OPC UA, deploy |
| Submodel Validator | `agents/submodel-validator.md` | Validação IDTA, semântica, IRDI/IRI |

### Claude Code: skills e subagents

| Tipo | Nome | Uso |
|---|---|---|
| Skill | `aas-spec-lookup` | Texto de constraints AASd/AASc, atributos de classes, operações/profiles da API, ABAC, AASX, mudanças entre versões |
| Skill | `aas-submodel-templates` | Achar o template IDTA-02xxx certo, semanticId oficial, montar modelo a partir do template |
| Subagent | `aas-spec-auditor` | Relatório de conformidade (código ou modelo) com a v3.2, com citação normativa |
| Subagent | `aas-modeler` | Gera `Environment` JSON a partir de templates (com suporte opcional ao framework Faaster) |

Skills e subagents dependem de uma pasta `docs/` no workspace (veja abaixo).

---

## Como usar

### Claude Code
```bash
# O CLAUDE.md já está na raiz — basta abrir o projeto
cd aas-agents
claude
```

### Kiro
Os arquivos em `.kiro/steering/` são carregados automaticamente pelo Kiro com ativação contextual.

### Cursor / Windsurf
As regras em `.cursor/rules` são carregadas automaticamente ao abrir o projeto.

### GitHub Copilot
O arquivo `.github/copilot-instructions.md` é lido automaticamente pelo Copilot no VS Code.

### Aider
```bash
aider --read agents/aas-specialist.md
```

---

## Documentos de referência (`docs/`)

As skills, os subagents e o steering `aas-specifications`/`aas-submodel-templates` consultam os documentos oficiais **localmente**: o texto extraído dos PDFs, os índices e os JSON dos templates. Esses arquivos não são versionados aqui por causa de tamanho e licença. Para gerá-los na raiz do workspace que usa este repositório:

```bash
# 1. coloque os PDFs IDTA-01001…01005 em <workspace>/docs/AAS Specifications/
# 2. rode:
./scripts/setup-aas-docs.sh <workspace>/docs
```

O script:
- extrai o texto dos PDFs das specs (`Part1_Metamodel.txt` … `Part5_AASX.txt`) e gera `constraints.md`;
- clona ou atualiza `admin-shell-io/submodel-templates` (`published/`), baixa os PDFs do content hub e gera `CATALOG.md`.

Requisitos: `git`, `curl`, `python3`, `pdftotext` (poppler-utils).

### Usando em outro repositório (symlinks)
```bash
cd <workspace>
mkdir -p .claude/skills .claude/agents .kiro/steering
ln -s ../../aas-agents/.claude/skills/aas-spec-lookup        .claude/skills/
ln -s ../../aas-agents/.claude/skills/aas-submodel-templates .claude/skills/
ln -s ../../aas-agents/.claude/agents/aas-spec-auditor.md    .claude/agents/
ln -s ../../aas-agents/.claude/agents/aas-modeler.md         .claude/agents/
ln -s ../../aas-agents/.kiro/steering/aas-specifications.md     .kiro/steering/
ln -s ../../aas-agents/.kiro/steering/aas-submodel-templates.md .kiro/steering/
```

---

## Sincronizar alterações

Ao editar qualquer arquivo em `agents/`, execute:

```bash
./scripts/sync-agents.sh
```

Isso propaga as mudanças para todos os formatos de ferramentas.

---

## Referências

- Portal IDTA: https://industrialdigitaltwin.io/aas-specifications/index/home/index.html
- Versões vigentes: Part 1 v3.2, Part 2 v3.2, Part 3a v3.1.1, Part 3b v3.0, Part 4 v3.1, Part 5 v3.2
- Eclipse BaSyx: https://eclipse.dev/basyx/
