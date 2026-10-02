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
- Dependem de `docs/AAS Specifications/`, `docs/AAS API/` (OpenAPI v3.2, perfis SSP) e `docs/AAS Submodel Templates/`, versionados neste repositório (CC BY 4.0, ver `docs/NOTICE.md`). Para atualizar: `scripts/setup-aas-docs.sh docs`

## Ativação por contexto

| Contexto | Agente preferencial |
|---|---|
| Arquivos `*.json`, `*.xml`, `*.aasx` | AAS Specialist + Submodel Validator |
| `docker-compose.yml`, `*.yml` de infra | BaSyx Integration |
| Scripts Python com `basyx.aas` | AAS Specialist + BaSyx Integration |
| Perguntas de validação/conformidade | Submodel Validator |
| Citar/consultar specs, constraints AASd | skill `aas-spec-lookup` |
| Submodel Templates IDTA-02xxx | skill `aas-submodel-templates` / subagent `aas-modeler` |
