# Especificações AAS (IDTA): índice e guia de consulta

Os PDFs oficiais estão nesta pasta. Para cada um há um `.txt` extraído com `pdftotext -layout`, que pode ser pesquisado com grep. Os documentos foram gerados a partir de asciidoc/HTML, então **não têm numeração de seções**: busque pelo título da seção ou pelo nome da classe ou operação.

| Parte | PDF | Texto | Versão | Páginas | DOI/ID |
|---|---|---|---|---|---|
| 1 Metamodel | `IDTA-01001-3-2_…Part1_Metamodel.pdf` | `Part1_Metamodel.txt` | 3.2 (jul/2026) | 290 | 10.62628/IDTA.01001-3-2 |
| 2 API | `IDTA-01002-3-2_…Part2_API.pdf` | `Part2_API.txt` | 3.2 | 329 | IDTA-01002 |
| 3a Data Spec IEC 61360 | `IDTA-01003-a-3-1-1_….pdf` | `Part3a_DataSpec_IEC61360.txt` | 3.1.1 | 76 | IDTA-01003-a |
| 3b Data Spec Unidades | `IDTA-01003-b-3-0_….pdf` | `Part3b_DataSpec_UoM.txt` | 3.0 | 49 | IDTA-01003-b |
| 4 Security | `IDTA-01004-3-1_….pdf` | `Part4_Security.txt` | 3.1 | 169 | IDTA-01004 |
| 5 AASX | `IDTA-01005-3-2_….pdf` | `Part5_AASX.txt` | 3.2 | 25 | IDTA-01005 |

A lista completa de constraints, com status na v3.2 e cobertura no Faaster, está em **`constraints.md`**.

---

## Parte 1: Metamodel (IDTA-01001 v3.2)
O núcleo: as classes do AAS e as regras de validação.
- **Classes principais:** `AssetAdministrationShell`, `AssetInformation` (`AssetKind`: Type, Instance, Role, NotApplicable e, novo na 3.2, **Batch**), `SpecificAssetId`, `Submodel`, `ConceptDescription`, `Environment`
- **Atributos comuns (herança):** Referable (idShort, displayName, description, **category, descontinuado**), Identifiable (id, administration), HasSemantics (semanticId, supplementalSemanticId), Qualifiable, HasKind (Template/Instance), HasDataSpecification, HasExtensions (`Extension` name/value, onde o Faaster declara `faaster:hda:*`)
- **SubmodelElements:** Property, MultiLanguageProperty, Range, Blob, File, ReferenceElement, RelationshipElement, AnnotatedRelationshipElement, Entity, BasicEventElement, Operation (input, output e inoutput Variables), Capability, SubmodelElementCollection, SubmodelElementList
- **Referências:** `Reference` (ExternalReference / ModelReference) e `Key`. Enumerações lógicas: `GloballyIdentifiables`, `GenericGloballyIdentifiables`, `AasIdentifiables`, `FragmentKeys`. Constraints AASd-121 a 128 e 137
- **Tipos de dado:** tipos XSD (`xs:double`, `xs:dateTime`…), `DataTypeDefXsd`, `LangStringSet`, `NameType`, `Identifier` (até 2048 caracteres)
- **Serialização:** regras de mapeamento XML, JSON e RDF; formatos Metadata, Value-Only e Path (vieram da Parte 2 na versão 3.1)
- **Anexos:** boas práticas de URIs, Tipo × Instância, ciclo de vida, Digital Product Passport (EN 18223), **histórico de mudanças desde a V2.0** (seções "Changes V3.x vs. …")

**Mudanças que afetam o Faaster:**
| Mudança | Desde | Impacto |
|---|---|---|
| `Referable/category` **descontinuado**; AASd-090 (CONSTANT/PARAMETER/VARIABLE) removida | 3.1 | O Faaster usa `category: VARIABLE` para registrar no NodeRegistry e historizar. Funciona, mas se apoia num atributo descontinuado. Um mecanismo alternativo (Qualifier ou Extension `faaster:*`) é um bom tema de discussão na dissertação |
| Cláusulas de **mapeamento OPC UA removidas** da Parte 1 | 3.1 | O mapeamento AAS→OPC UA não é mais normatizado nas especificações IDTA desta pasta. A companion specification OPC UA for AAS (provavelmente OPC 30270, *verificar*) não está aqui. O mapeamento próprio do Faaster deve ser justificado ou comparado a ela |
| AASd-002: idShort aceita hífen e exige no mínimo 2 caracteres | 3.1 / 3.2 | Confira a regex do validador |
| AASd-137 (refs externas sem AasReferables) e AASd-138 (SML em OperationVariable) | 3.2 | Ainda não implementadas no Faaster |
| Range: removida a interpretação de min/max ausente como ±infinito | 3.2 | Afeta futuros eventos baseados em Range (roadmap) |
| Profundidade mínima de recursão de 32 para containers | 3.2 | O parser recursivo do Faaster deve suportá-la |

## Parte 2: API (IDTA-01002 v3.2)
Interfaces neutras de tecnologia mapeadas para HTTP/REST. A especificação cita OPC UA e MQTT como tecnologias possíveis, mas só normatiza HTTP.
- **Interfaces:** AAS (`/aas`), Submodel (`/submodel`, com `InvokeOperationSync/Async` e `GetOperationAsyncStatus/Result`), Serialization, AASX File Server (`/packages`), AAS Registry e Submodel Registry (descritores com `Endpoint` e `ProtocolInformation`), AAS/Submodel/ConceptDescription Repository (`/shells`, `/submodels`, `/concept-descriptions`), Basic Discovery (AssetLinks), Self Description (`/description`)
- **Service Specifications e Profiles:** um profile é identificado por `https://admin-shell.io/aas/API/3/2/<Nome>ServiceSpecification/SSP-00x` (ex.: Submodel SSP-001 a 004; Submodel Repository Full SSP-001, Template SSP-003, Template Read SSP-004; Discovery Read-only SSP-002). Ele é anunciado em `/description`
- **AAS Query Language:** gramática BNF e JSON Schema para filtros (`$sm#semanticId`, comparações, casting), combinável com regras de acesso
- **HTTP:** versionamento na URL (`…/v3.2`), IDs codificados em base64url, paginação por cursor, SerializationModifiers (`level=deep|core`, `content=normal|value|path|metadata|reference`, `extent`), tabela de status genérico→HTTP (200/201/202/204/400/401/403/404/405/409/500/501/502)
- **Anexos:** Digital Product Passport (ciclo de vida, registry, discovery), exemplos de PATCH e de modifiers

**Para o Faaster:** o Faaster expõe o AAS via OPC UA, não via API REST da Parte 2. Os conceitos de Registry/Descriptor (`Endpoint.interface`, `ProtocolInformation`) são o caminho para tornar uma instância Faaster descobrível num ecossistema AAS, o que é relevante para o gerenciador multi-Shell (branch `digital-twin-manages`). `InvokeOperationAsync` e `ExecutionState` servem de modelo para Operations longas.

## Parte 3a: Data Specification IEC 61360 (v3.1.1)
Template para descrever semanticamente uma ConceptDescription: preferredName (obrigatório em inglês, AASc-3a-002), shortName, unit/unitId, dataType (STRING, INTEGER_MEASURE, REAL_MEASURE…), definition, valueFormat, valueList (ValueReferencePair), levelType (min/nom/typ/max). Constraints `AASc-3a-002…010, 050`. Também cobre as categorias de ConceptDescription.

## Parte 3b: Data Specification Unidades de Medida (v3.0)
`DataSpecificationPhysicalUnit` (unitName, unitSymbol, definition, siNotation, dinSpecification, ecceCode, nistName, conversionFactor…). Tem exemplos de mapeamento para ECLASS, IEC CDD, UNECE Rec 20 e BIPM SI Digital Framework, e de modelagens não recomendadas. É útil para tensão, corrente e energia no caso ADE9000/ISO 50001.

## Parte 4: Security (IDTA-01004 v3.1)
- **Tipos de troca de informação via AAS:** **Tipo 1** = arquivo AASX (Parte 5); **Tipo 2** = acesso via API a um servidor, que aplica regras ABAC (*é o Faaster*); **Tipo 3** = "I4.0 Language", AAS ativos semelhantes a agentes (fora do escopo)
- Modelo de serviço I4.0 em níveis: neutro de tecnologia → específico de tecnologia (HTTP, OPC UA, MQTT) → implementação → runtime
- **ABAC (Attribute Based Access Control):** gramática BNF e JSON das Access Rules (ACL, ATTRIBUTES CLAIM/GLOBAL/REFERENCE, RIGHTS CREATE/READ/UPDATE/DELETE/EXECUTE/VIEW, FORMULA, FILTER, ROUTE), mapeamento de operações da API para direitos
- **Identidade:** Identity Providers (único, federado, token exchange), fluxos de autenticação, access tokens
- **Requisitos de segurança:** integridade, confidencialidade, disponibilidade, PKI, eventos auditáveis, validação de entrada, proteção contra DoS, *secure asset binding*, dataspaces
- **Para o Faaster:** a segurança atual é de transporte e de aplicação OPC UA (X.509, políticas, GDS). Falta controle de acesso ABAC em nível de elemento. Tanto a proteção EXECUTE em Operations quanto o Security Model como Submodel são candidatos naturais a trabalho futuro

## Parte 5: AASX Package File Format (IDTA-01005 v3.2)
Pacote ZIP baseado em OPC (Open Packaging Conventions, ECMA-376 / ISO 29500-2). Relationships: `aasx-origin` → `aas-spec` (data.xml/.json) → `aas-suppl` (arquivos referenciados por `File` com URI relativa; Blobs ficam dentro do modelo). Convenção de pastas: `aasx/aasx-origin`, `aasx/data.xml`, `aasx/suppl/`; thumbnail via `metadata/thumbnail`; `[Content_Types].xml` obrigatório. Também trata de assinaturas digitais, criptografia e filtragem na exportação. O `faaster/loader/aasx/` deve seguir esse layout.
