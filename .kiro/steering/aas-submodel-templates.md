---
inclusion: fileMatch
fileMatchPattern: ["docs/AAS Submodel Templates/**", "faaster/models/**", "faaster/sources/**", "faaster/tests/json-models/**", "**/*.aasx"]
---
# Submodel Templates IDTA

> **Pré-requisito (diretório de documentos):** os caminhos `docs/AAS Specifications/` e `docs/AAS Submodel Templates/` são relativos à raiz do workspace que usa este repositório (ex.: `Mestrado/docs/`). Para montá-los em outro workspace: `aas-agents/scripts/setup-aas-docs.sh <workspace>/docs` (veja o README do aas-agents). As referências ao **Faaster** (`faaster/...`) só valem quando o workspace contém esse projeto.

Os templates ficam em `docs/AAS Submodel Templates/`. Comece pelo `README.md` (estrutura, templates relevantes e compatibilidade com o Faaster) e pelo `CATALOG.md` (62 templates com versões e semanticId).

## Regras ao modelar um AAS para o Faaster
- **Antes de criar um submodelo do zero, procure um template IDTA** no `CATALOG.md`. Reutilize o `semanticId` oficial e a estrutura do `.json` em `repo/published/<Template>/<versão>/`.
- Use sempre a **versão mais recente** do template, salvo motivo explícito.
- Para dados históricos, prefira **Time Series Data (IDTA-02008)**. Para conexão com dispositivos, considere **Asset Interfaces Description (IDTA-02017)** e **Mapping Configuration (IDTA-02027)**.
- Templates com SubmodelElementList hoje **falham no Faaster** por causa do bug da AASd-117. Veja `faaster_compat.json` antes de prometer que um template funciona.
- Em textos acadêmicos, cite pelo número IDTA-02xxx e pela versão.
