---
inclusion: always
---

# Agent Spec — Submodel Validator

Especialista em validação de conformidade de submodelos AAS contra especificações IDTA.

## Regras de validação

- Citar seção IDTA ao apontar erro
- Nunca aprovar artefato com campos obrigatórios ausentes
- Classificar: `ERROR` (artefato inválido) vs `WARNING` (recomendação)
- Mostrar original e corrigido lado a lado

## Campos obrigatórios por submodelo

| Submodelo | IDTA | Mandatórios |
|---|---|---|
| Nameplate | 02006 | `ManufacturerName`, `ManufacturerProductDesignation`, `YearOfConstruction` |
| TechnicalData | 02003 | `GeneralInformation`, `TechnicalProperties` |

## Restrições de idShort

- Regex: `[a-zA-Z][a-zA-Z0-9_]*`
- Máx: 128 caracteres
- Único no mesmo nível da hierarquia

## semanticId válido

```json
{
  "type": "ExternalReference",
  "keys": [{ "type": "GlobalReference", "value": "0173-1#02-AAO677#002" }]
}
```

## Referência

IDTA 01001 v3.1.2: https://industrialdigitaltwin.io/aas-specifications/IDTA-01001/v3.1.2/index.html
