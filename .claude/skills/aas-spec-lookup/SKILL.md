---
name: aas-spec-lookup
description: Use para consultar as especificações oficiais do Asset Administration Shell (IDTA-01001 a 01005, v3.x) em docs/AAS Specifications e a OpenAPI oficial da Parte 2 (docs/AAS API, perfis SSP v3.2). Cobre o texto de uma constraint AASd/AASc, atributos de uma classe do metamodelo, operações, rotas, schemas e perfis SSP da API (incluindo testes de contrato contra os YAMLs oficiais), regras ABAC de segurança, estrutura AASX e mudanças entre versões. Use também para validar se o código do Faaster ou um modelo JSON está conforme.
---
# Consultando as especificações AAS

> **Documentos de referência:** os caminhos `docs/AAS Specifications/` e `docs/AAS Submodel Templates/` existem **dentro do repositório aas-agents** (`aas-agents/docs/`, versionados) e também na raiz de workspaces que os montem (ex.: `Mestrado/docs/`). Use o que estiver na raiz do projeto aberto. Para atualizar: `scripts/setup-aas-docs.sh docs`. As referências ao **Faaster** (`faaster/...`) só valem quando o workspace contém esse projeto.

Pasta: `docs/AAS Specifications/` (há espaço no nome, então use aspas no shell).

## Ordem de consulta
1. `README.md`: o que cada parte cobre e o impacto no Faaster
2. `constraints.md`: a tabela de constraints (ativa ou removida na 3.2, citada ou não no Faaster)
3. Os `.txt`, com grep. Não há numeração de seções, então busque por títulos e nomes de classes:

| Pergunta | Arquivo | Busca |
|---|---|---|
| Texto exato de uma constraint | `Part1_Metamodel.txt` | `grep -n "Constraint AASd-122" …` |
| Atributos de uma classe | `Part1_Metamodel.txt` | `grep -n "^Operation Attributes\|^Range Attributes" …` e ler cerca de 60 linhas |
| O que mudou entre versões | `Part1_Metamodel.txt` | `grep -n "^Changes V3" …` |
| Operação da API (semântica, texto normativo) | `Part2_API.txt` | `grep -n "Operation InvokeOperationAsync"` |
| Rota HTTP exata, parâmetros, status, schema de resposta | `../AAS API/bundled/<Serviço>__V3.2_SSP-00N.yaml` | `grep -n "operationId: GetSubmodelElementByPath"`; ou carregar com `yaml.safe_load` e ler `paths` |
| Quais perfis existem / quantas rotas | `../AAS API/README.md` | tabela de perfis |
| Profiles (SSP) — texto normativo | `Part2_API.txt` | `grep -n "SSP-00"` |
| Query language | `Part2_API.txt` | a partir de `^Grammar` / `^Query Filter` |
| IEC 61360 / ConceptDescription | `Part3a_DataSpec_IEC61360.txt` | `AASc-3a-`, `preferredName`, `levelType` |
| Unidades de medida | `Part3b_DataSpec_UoM.txt` | `DataSpecificationPhysicalUnit`, `UNECE` |
| Controle de acesso | `Part4_Security.txt` | `^Access Permission Rules`, `^BNF grammar of Access Rules`, `Types of AAS` |
| Pacote AASX | `Part5_AASX.txt` | `aasx-origin`, `aas-suppl`, `^File Structure` |

4. O PDF, só para figuras e diagramas UML. A numeração de páginas do `.txt` não corresponde à do PDF: localize pelo título com Read e `pages`.

## Testes de contrato contra a OpenAPI oficial
Use os YAMLs autocontidos de `docs/AAS API/bundled/`, um por perfil, como oráculo:
- **Por teste:** valide cada resposta com `openapi-core` (ou `jsonschema` sobre `components/schemas`), usando o `operationId` da rota.
- **Gerados:** rode `schemathesis run "docs/AAS API/bundled/SubmodelRepositoryServiceSpecification__V3.2_SSP-002.yaml" --base-url <url>`.
- O schema garante forma, status e campos, mas **não** semântica (valor correto, ordem da paginação, decodificação base64url). Os testes de comportamento continuam necessários.
- Os nomes de perfil no texto da Parte 2 têm erros de cópia (Registry SSP-004 = Query; Discovery SSP-002 = Read). O YAML é o contrato.

## Ao checar conformidade do Faaster
- Use `grep -rn "AASd-" faaster/faaster/aas_metamodel/` para ver o que está implementado e compare com as constraints ativas em `constraints.md`.
- Ao propor uma implementação, cite a constraint, mostre o texto normativo e indique onde no código (`aas_metamodel/validators.py` ou o modelo Pydantic) ela entra, com um teste em `faaster/tests/unit/`.
- `category` está descontinuado na 3.1+. Não proponha novas regras baseadas nele sem apontar isso.

## Citação (ABNT)
INDUSTRIAL DIGITAL TWIN ASSOCIATION (IDTA). *Specification of the Asset Administration Shell – Part 1: Metamodel*. IDTA-01001, versão 3.2. 2026. DOI: 10.62628/IDTA.01001-3-2.
(Para as outras partes, troque o título, o número e a versão conforme a tabela do README.)
