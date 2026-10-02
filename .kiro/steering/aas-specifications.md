---
inclusion: fileMatch
fileMatchPattern: ["docs/AAS Specifications/**", "faaster/faaster/aas_metamodel/**", "faaster/faaster/parser/**", "faaster/faaster/loader/**", "**/*.aasx", "**/*aas*.json"]
---
# Especificações AAS (IDTA v3.x): referência normativa

> **Documentos de referência:** os caminhos `docs/AAS Specifications/` e `docs/AAS Submodel Templates/` existem **dentro do repositório aas-agents** (`aas-agents/docs/`, versionados) e também na raiz de workspaces que os montem (ex.: `Mestrado/docs/`). Use o que estiver na raiz do projeto aberto. Para atualizar: `scripts/setup-aas-docs.sh docs`. As referências ao **Faaster** (`faaster/...`) só valem quando o workspace contém esse projeto.

Ficam em `docs/AAS Specifications/`. Comece pelo `README.md` (resumo por parte e impactos no Faaster) e pelo `constraints.md` (todas as constraints, com status na 3.2 e cobertura no Faaster).

**Versões:** Parte 1 Metamodel 3.2 · Parte 2 API 3.2 · Parte 3a IEC 61360 3.1.1 · Parte 3b Unidades 3.0 · Parte 4 Security 3.1 · Parte 5 AASX 3.2.

## Fatos que mais impactam o trabalho
- `Referable/category` está **descontinuado** desde a 3.1, e a AASd-090 (CONSTANT/PARAMETER/VARIABLE) foi removida. O Faaster ainda depende de `category: VARIABLE`.
- A Parte 1 deixou de conter o mapeamento OPC UA na 3.1. O mapeamento do Faaster é próprio.
- Parte 4: **Tipo 1** = AASX, **Tipo 2** = servidor acessado por API (o Faaster), **Tipo 3** = AAS ativos/agentes.
- A Parte 2 só normatiza HTTP/REST. Registry/Descriptor/Endpoint é o caminho para tornar um Faaster descobrível.
- A v3.2 define 34 constraints AASd ativas (`constraints.md`). No Faaster, 16 delas ainda não têm implementação (lista em `constraints.md`), entre elas AASd-077 (nome de Extension único, relevante para `faaster:hda:*`), 107–109/114/115 (SubmodelElementList), 134/137/138.

## Regras
- Em afirmações normativas, cite a parte, a versão e a constraint ou classe (ex.: "IDTA-01001 v3.2, AASd-122"). Confirme o texto com grep no `.txt` antes de citar.
- Os PDFs não têm numeração de seções: referencie pelo título da seção ou pelo nome da classe ou operação.
- Ao implementar validação no Faaster, siga a v3.2 e marque no código o ID da constraint.
