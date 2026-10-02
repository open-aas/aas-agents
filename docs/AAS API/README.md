# AAS API — IDTA-01002 v3.2 (OpenAPI)

Especificação OpenAPI oficial da **Parte 2 (API)** do AAS, na tag **v3.2.0** de [admin-shell-io/aas-specs-api](https://github.com/admin-shell-io/aas-specs-api). Navegador oficial: https://industrialdigitaltwin.io/aas-specs-api/docs/index.html?version=v3.2.0

```
AAS API/
├── README.md        este guia (perfis e uso)
├── source/          cópia do repositório na tag v3.2.0, sem .git. Os YAMLs referenciam ../Part1-MetaModel-Schemas e ../Part2-API-Schemas
└── bundled/         um YAML autocontido por perfil, gerado com `redocly bundle`
                     nome: <ServiceSpecification>__V3.2_SSP-00N.yaml, mais Entire-API-Collection__V3.2.yaml (146 rotas)
```

Para **gerar tipos**, **validar respostas** ou rodar **testes de contrato** (schemathesis, openapi-core), use `bundled/`. Para ler ou citar a especificação, use `source/` ou o navegador oficial.

## Perfis (Service Specification Profiles) v3.2
Os nomes vêm da Parte 2 (`../AAS Specifications/Part2_API.txt`), conferidos com o número de rotas de cada YAML. Identificador completo: `https://admin-shell.io/aas/API/3/2/<Serviço>/SSP-00N`, anunciado em `GET /description`.

| Serviço | SSP | Perfil | Rotas |
|---|---|---|---:|
| AssetAdministrationShellRegistry | 001 | Full | 5 |
| | 002 | Read | 5 |
| | 003 | Bulk | 4 |
| | 004 | Query ¹ | 2 |
| | 005 | Minimal Read | 3 |
| SubmodelRegistry | 001 | Full | 3 |
| | 002 | Read | 3 |
| | 003 | Bulk | 4 |
| | 004 | Query ¹ | 2 |
| Discovery | 001 | Full | 4 |
| | 002 | Read ¹ | 3 |
| AssetAdministrationShellRepository | 001 | Full | 34 |
| | 002 | Read | 26 |
| | 003 | Query | 2 |
| | 004 | Signature | 2 |
| | 005 | Identifiable | 8 |
| | 006 | History | 2 |
| SubmodelRepository | 001 | Full | 31 |
| | 002 | Read | 24 |
| | 003 | Template | 16 |
| | 004 | Template Read | 16 |
| | 005 | Query | 2 |
| | 006 | Signature | 2 |
| | 007 | History | 2 |
| AssetAdministrationShell (um AAS, `/aas`) | 001 / 002 | Full / Read | 31 / 23 |
| Submodel (um submodelo, `/submodel`) | 001 / 002 / 003 | Full / Read / Value | 25 / 18 / 5 |
| ConceptDescriptionRepository | 001 / 002 / 003 | Full / Query / Signature | 5 / 2 / 2 |
| AasxFileServer | 001 / 002 | Full / Async | 3 / 4 |

¹ O texto da Parte 2 v3.2 repete nomes por erro de cópia: o Registry SSP-004 aparece como "Bulk" e o Discovery SSP-002 como "Full". A classificação acima segue o conteúdo do YAML e o changelog da Parte 2 ("new: Profile for Discovery Service: Read Only SSP-002"). Em caso de dúvida, o YAML é o contrato.

## Perfis-alvo do Faaster Twin Manager (proposta de dissertação)
| Serviço | Perfil | Fonte dos dados |
|---|---|---|
| AAS Repository | SSP-002 Read (+ SSP-006 History, opcional) | pacote AASX implantado; versões = artefatos |
| Submodel Repository | SSP-002 Read (SSP-001 parcial depois: `$value` PATCH e `invoke` mapeados para OPC UA) | pacote; valores ao vivo via OPC UA do Faaster |
| AAS Registry / Submodel Registry | SSP-001 Full | ciclo de vida do FTM |
| Discovery | SSP-001 Full | `assetId` → AAS |
| AASX File Server | SSP-001 Full | repositório de artefatos |

## Atualizar
`scripts/setup-aas-docs.sh docs` baixa a tag definida em `AAS_API_TAG` (padrão `v3.2.0`) e gera `bundled/` de novo (requer `npx`).

Licença: CC BY 4.0 (`source/LICENSE.txt`); ver `../NOTICE.md`.
