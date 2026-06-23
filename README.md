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
├── .kiro/steering/                ← Kiro (ativação contextual por arquivo)
│   ├── aas-specialist.md
│   ├── basyx-integration.md
│   └── submodel-validator.md
│
├── .github/
│   └── copilot-instructions.md    ← GitHub Copilot
│
├── .cursor/
│   └── rules                      ← Cursor / Windsurf
│
├── scripts/
│   └── sync-agents.sh             ← sincroniza agents/ → todas as ferramentas
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

## Sincronizar alterações

Ao editar qualquer arquivo em `agents/`, execute:

```bash
./scripts/sync-agents.sh
```

Isso propaga as mudanças para todos os formatos de ferramentas.

---

## Referências

- Portal IDTA: https://industrialdigitaltwin.io/aas-specifications/index/home/index.html
- Release atual: 25-01
- Eclipse BaSyx: https://eclipse.dev/basyx/
