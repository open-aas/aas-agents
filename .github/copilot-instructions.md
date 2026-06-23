# Copilot Instructions — AAS Agents

Este projeto trabalha com **Asset Administration Shell (AAS)** — Industrie 4.0 / IDTA.

## Contexto técnico

- Metamodelo: IDTA 01001 v3.1.2
- APIs: IDTA 01002 v3.1.2
- AASX: IDTA 01005 v3.1
- Portal specs: https://industrialdigitaltwin.io/aas-specifications/index/home/index.html
- Stack de referência: Eclipse BaSyx v2.x

## Regras para sugestões de código

- Usar terminologia exata do metamodelo AAS: `idShort`, `semanticId`, `modelType`, `valueType`
- `idShort` deve seguir `[a-zA-Z][a-zA-Z0-9_]*`, máx 128 chars
- `semanticId` é sempre um objeto `Reference` com `type` e `keys[]`
- IDs de AAS e Submodelos em path params da API devem ser Base64URL-encoded
- Em Python, usar `basyx.aas` (pacote `python-aas`) para instanciar objetos AAS
- Docker Compose para BaSyx deve separar registry, repository e discovery como serviços distintos

## Submodelos padronizados preferidos

Antes de criar submodelos customizados, verificar se existe um padrão IDTA:
Nameplate (02006), TechnicalData (02003), Documentation (02004), PCF (02023), ContactInformation (02002)

## Idioma

Comentários e mensagens em PT-BR por padrão neste projeto.
