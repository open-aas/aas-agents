---
name: aas-submodel-templates
description: Use quando a tarefa envolver Submodel Templates oficiais da IDTA (IDTA-02xxx), por exemplo Digital Nameplate, Technical Data, Time Series Data, Asset Interfaces Description, Carbon Footprint ou Digital Product Passport. Serve para achar o template certo para um caso de uso, obter o semanticId e a estrutura oficial, montar um modelo AAS JSON para o Faaster a partir de templates, ou checar se o Faaster carrega um template.
---
# Usando os Submodel Templates IDTA

> **Pré-requisito (diretório de documentos):** os caminhos `docs/AAS Specifications/` e `docs/AAS Submodel Templates/` são relativos à raiz do workspace que usa este repositório (ex.: `Mestrado/docs/`). Para montá-los em outro workspace: `aas-agents/scripts/setup-aas-docs.sh <workspace>/docs` (veja o README do aas-agents). As referências ao **Faaster** (`faaster/...`) só valem quando o workspace contém esse projeto.

Pasta: `docs/AAS Submodel Templates/` (há espaço no nome, então use aspas no shell).

## Achar o template
1. `CATALOG.md`: nome, versões e semanticId. `grep -i "nameplate\|time series" "docs/AAS Submodel Templates/CATALOG.md"`
2. `README.md`: lista curada dos templates relevantes para o Faaster e o mestrado.
3. A especificação está em `repo/published/<Template>/<ver>/*.pdf`, ou em `pdf/IDTA-02xxx*.pdf`, que é a versão linkada no site.

## Montar um modelo para o Faaster
1. Copie o `.json` do template de `repo/published/<Template>/<maior versão>/`. Prefira o arquivo de exemplo (nome com "example" ou "Sample") quando existir.
2. Converta de Template para Instance: `kind: "Instance"`, ids próprios, remoção de qualifiers de template (`SMT/Cardinality` etc.), valores preenchidos.
3. Mantenha os `semanticId` oficiais. São eles que garantem a interoperabilidade.
4. Variáveis dinâmicas que precisam de HDA: hoje é preciso usar `category: "VARIABLE"` mais as extensions `faaster:hda:*` (ver a skill `faaster-hda-policy`). Lembre que `category` está descontinuado na v3.1+.
5. Teste o carregamento:
   ```bash
   cd faaster && PYTHONPATH=. poetry run python -c "import json,sys; from faaster.aas_metamodel.models.environment import Environment; Environment(**json.load(open(sys.argv[1],encoding='utf-8-sig'))); print('ok')" ../models/x.json
   ```
6. Se falhar com idShort ausente em um filho de SubmodelElementList, é o bug conhecido da AASd-117 no Faaster, não um erro do modelo.

## Compatibilidade
`faaster_compat.json` guarda o resultado por arquivo (`ok` / `fail` com motivo). Para regenerar depois de corrigir o Faaster, rode novamente o script descrito no README.

## Citação (ABNT)
INDUSTRIAL DIGITAL TWIN ASSOCIATION (IDTA). *<Título do template>*. IDTA-02xxx, versão x.y. Disponível em: https://industrialdigitaltwin.org/en/content-hub/submodels.
