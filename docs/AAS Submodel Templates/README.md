# AAS Submodel Templates (IDTA)

Templates oficiais de submodelo publicados pela IDTA, baixados em 02/10/2026.

- **Fonte do catálogo:** https://industrialdigitaltwin.org/en/content-hub/submodels
- **Fonte dos arquivos:** https://github.com/admin-shell-io/submodel-templates (pasta `published/`)

## Estrutura
```
AAS Submodel Templates/
├── README.md             este guia
├── CATALOG.md            62 templates, com versões e semanticId
├── faaster_compat.json   resultado do parser do Faaster em cada .json (lista ok e lista fail com o motivo)
├── pdf/                  73 PDFs de especificação linkados no content hub (IDTA-02xxx)
└── repo/                 clone esparso do GitHub (sparse checkout de published/)
    └── published/<Template>/<major>/<minor>[/<patch>]/
        ├── *.aasx        pacote do template (e às vezes um exemplo)
        ├── *.json        mesmo conteúdo serializado em JSON (pode ser usado direto pelo Faaster)
        └── *.pdf         especificação daquela versão (110 no total)
```
Para atualizar: `cd repo && git pull`. O `repo/` é um clone git (shallow), mas a pasta `Mestrado/` não é versionada.

## Templates mais relevantes para a pesquisa
| Template | Uso no Faaster / mestrado |
|---|---|
| **Time Series Data** (IDTA-02008) | Modelo padrão para expor séries históricas (segmentos Internal, Linked, External). É o candidato natural para padronizar o HDA do Faaster no lugar de `faaster:hda:*` puro |
| **Asset Interfaces Description** (IDTA-02017) e **Mapping Configuration** (IDTA-02027) | Descrevem as interfaces do ativo (MQTT, Modbus, HTTP) e o mapeamento interface→variável AAS. É a alternativa padronizada ao código manual em `sources/` (roadmap: "Sensor driver SDK") |
| **Digital Nameplate** (IDTA-02006) | Placa de identificação, presente em quase todo AAS |
| **Technical Data** (IDTA-02003) | Dados técnicos |
| **OPC UA Server Datasheet** (IDTA-02009) | Descreve o próprio servidor OPC UA, ou seja, uma instância Faaster |
| **Software Nameplate** (IDTA-02007) | Versão e identificação do software (Faaster) |
| **Predictive Maintenance**, **Process Variables for Manufacturing KPIs**, **Reliability** | Casos de uso analíticos (ML na borda, roadmap) |
| **Carbon Footprint**, **Energy Flexibility Data Model** | Eficiência energética (caso ISO 50001 / ADE9000 do TCC e do Faaster) |
| **Digital Product Passport**, **Digital Battery Passport** | Usados com o anexo DPP das especificações v3.2 |
| **Capability Description**, **Control Component Type/Instance** | AAS ativos (Tipo 3) e skills |
| **Sensor 4.0** (IDTA-02029) | Valores de medição de sensores |

## Compatibilidade com o Faaster
O teste roda `Environment(**json)` do Faaster em cada `.json` de `published/`. O detalhe por arquivo está em `faaster_compat.json`.

| Data | Faaster | Carregam | Falham |
|---|---|---|---|
| 02/10/2026 | `main` | 140 | 110 (82 pelo bug da AASd-117) |
| 02/10/2026 | `fix/aas-v3.2-conformance` (AASd-117, 002 e 130 corrigidas) | **217** | 33 |

As 33 falhas restantes são, em grande parte, **não-conformidades dos próprios templates IDTA** com a v3.2:
- idShort de 1 caractere (`"X"`) em *Data Model for Asset Location* e *Provision of 3D Models*, violando a AASd-002
- idShort vazio (Technical Data 2.0 sample) e idShort duplicado (Maintenance Instructions)
- valueType inválido (6), AASd-014 (5), AASc-002 (2), caminho de File relativo ou vazio que o Faaster exige no formato RFC 8089 (3). Esse último ponto merece revisão no Faaster, porque a Parte 5 permite caminhos relativos para arquivos suplementares
- casos isolados: AASd-118, 121, 123, 131 e 020

Ver também `../AAS Specifications/constraints.md`.
