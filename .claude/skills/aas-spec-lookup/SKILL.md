---
name: aas-spec-lookup
description: Use para consultar as especificações oficiais do Asset Administration Shell (IDTA-01001 a 01005, v3.x) em docs/AAS Specifications. Cobre o texto de uma constraint AASd/AASc, atributos de uma classe do metamodelo, operações e profiles da API, regras ABAC de segurança, estrutura AASX e mudanças entre versões. Use também para validar se o código do Faaster ou um modelo JSON está conforme.
---
# Consultando as especificações AAS

> **Pré-requisito (diretório de documentos):** os caminhos `docs/AAS Specifications/` e `docs/AAS Submodel Templates/` são relativos à raiz do workspace que usa este repositório (ex.: `Mestrado/docs/`). Para montá-los em outro workspace: `aas-agents/scripts/setup-aas-docs.sh <workspace>/docs` (veja o README do aas-agents). As referências ao **Faaster** (`faaster/...`) só valem quando o workspace contém esse projeto.

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
| Operação da API / rota HTTP | `Part2_API.txt` | `grep -n "Operation InvokeOperationAsync"`, `grep -n "GET /submodels"` |
| Profiles (SSP) | `Part2_API.txt` | `grep -n "SSP-00"` |
| Query language | `Part2_API.txt` | a partir de `^Grammar` / `^Query Filter` |
| IEC 61360 / ConceptDescription | `Part3a_DataSpec_IEC61360.txt` | `AASc-3a-`, `preferredName`, `levelType` |
| Unidades de medida | `Part3b_DataSpec_UoM.txt` | `DataSpecificationPhysicalUnit`, `UNECE` |
| Controle de acesso | `Part4_Security.txt` | `^Access Permission Rules`, `^BNF grammar of Access Rules`, `Types of AAS` |
| Pacote AASX | `Part5_AASX.txt` | `aasx-origin`, `aas-suppl`, `^File Structure` |

4. O PDF, só para figuras e diagramas UML. A numeração de páginas do `.txt` não corresponde à do PDF: localize pelo título com Read e `pages`.

## Ao checar conformidade do Faaster
- Use `grep -rn "AASd-" faaster/faaster/aas_metamodel/` para ver o que está implementado e compare com as constraints ativas em `constraints.md`.
- Ao propor uma implementação, cite a constraint, mostre o texto normativo e indique onde no código (`aas_metamodel/validators.py` ou o modelo Pydantic) ela entra, com um teste em `faaster/tests/unit/`.
- `category` está descontinuado na 3.1+. Não proponha novas regras baseadas nele sem apontar isso.

## Citação (ABNT)
INDUSTRIAL DIGITAL TWIN ASSOCIATION (IDTA). *Specification of the Asset Administration Shell – Part 1: Metamodel*. IDTA-01001, versão 3.2. 2026. DOI: 10.62628/IDTA.01001-3-2.
(Para as outras partes, troque o título, o número e a versão conforme a tabela do README.)
