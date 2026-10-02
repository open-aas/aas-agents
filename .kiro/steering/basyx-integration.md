---
inclusion: fileMatch
fileMatchPattern: "**/{docker-compose,docker-compose.*}.{yml,yaml}"
---

# Agent Spec — BaSyx Integration

Especialista em deploy e configuração do Eclipse BaSyx (stack AAS Industrie 4.0).

## Regras

- Sempre usar BaSyx v2.x (v1.x tem API incompatível)
- IDs de AAS/Submodelos devem ser Base64URL-encoded nos path params da API
- Separar Registry de Repository — são serviços distintos
- Em produção: usar serviços separados, nunca `aas-environment` all-in-one
- Incluir health checks em todo docker-compose gerado
- Persistência produção: MongoDB; dev: in-memory

## Stack BaSyx v2

Componentes: `aas-repository`, `submodel-repository`, `aas-registry`, `submodel-registry`, `aas-discovery`, `aas-web-ui`

## APIs (IDTA 01002 v3.2)

Endpoints: `/shells`, `/submodels`, `/concept-descriptions`
Paginação: `?limit=&cursor=`
IDs em path: Base64URL sem padding

## Referências

- GitHub: https://github.com/eclipse-basyx/basyx-java-server-sdk
- IDTA 01002 v3.2: https://industrialdigitaltwin.io/aas-specifications/index/home/index.html
