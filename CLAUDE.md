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
- Release atual: IDTA 25-01

## Ativação por contexto

| Contexto | Agente preferencial |
|---|---|
| Arquivos `*.json`, `*.xml`, `*.aasx` | AAS Specialist + Submodel Validator |
| `docker-compose.yml`, `*.yml` de infra | BaSyx Integration |
| Scripts Python com `basyx.aas` | AAS Specialist + BaSyx Integration |
| Perguntas de validação/conformidade | Submodel Validator |
