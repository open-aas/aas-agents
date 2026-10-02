# Constraints do metamodelo AAS (IDTA-01001 v3.2)

Extraídas automaticamente de `Part1_Metamodel.txt`. **Ativa** significa que a constraint é *definida* (`Constraint AASd-xxx:`) no corpo normativo da v3.2 — 34 no total (antes do anexo de mudanças). **Removida/histórica** significa que ela só aparece no histórico de versões. As constraints AASc (Data Specification IEC 61360) são definidas na Parte 3a, onde aparecem como `AASc-3a-xxx`. A coluna Faaster indica se o código cita o ID, não se a validação está correta. Antes de citar o texto de uma constraint, confirme no PDF.

| ID | Status v3.2 | Faaster | Texto (resumido) |
|---|---|---|---|
| AASc-002 | Parte 3a | ✅ | Data¬Specification¬IEC61360-/preferredName shall be provided at least in English |
| AASc-003 | Parte 3a |  | For a ConceptDescription with category VALUE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) DataSpecificationIEC61360/value shall be set. |
| AASc-004 | Parte 3a |  | For a ConceptDescription with category PROPERTY or VALUE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType is mandator |
| AASc-005 | Parte 3a |  | For a ConceptDescription with category REFERENCE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType is STRING by defaul |
| AASc-006 | Parte 3a |  | For a ConceptDescription with category DOCUMENT using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType shall be one of the  |
| AASc-007 | Parte 3a |  | For a ConceptDescription with category QUALIFIER_TYPE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType is mandatory a |
| AASc-008 | Parte 3a |  | For a ConceptDescriptions except for a ConceptDescription of category VALUE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/d |
| AASc-009 | Parte 3a |  | If DataSpecificationIEC61360/dataType one of: INTEGER_MEASURE, REAL_MEASURE, RATIONAL_MEASURE, INTEGER_CURRENCY, REAL_CURRENCY, then DataSpecificationIEC61360/unit or DataSpecificationIEC61360/unitId shall be defined. |
| AASc-010 | Parte 3a |  | If DataSpecificationIEC61360/value is not empty then DataSpecificationIEC61360/valueList shall be empty and vice versa |
| AASd-001 | removida/histórica |  | In case of a referable element not being an identifiable element this ID is mandatory and used for referring to the element in its name space. |
| AASd-002 | ativa | ✅ | idShort of Referables shall consist of at least two characters and shall only feature letters, digits, hyphen ("-") and underscore ("\_"); starting mandatory with a letter, and not ending with a hyphen, i.e. ^[a-zA-Z][a-zA-Z0-9_-] |
| AASd-003 | removida/histórica |  | idShort of Referables within the same name space shall be unique (case-sensitive). |
| AASd-005 | ativa | ✅ | If AdministrativeInformation/version is not specified, AdministrativeInformation/revision shall also be unspecified. This means that a revision requires a version. If there is no version, there is no revision either. Revision is o |
| AASd-006 | ativa |  | If both, the _value_ and the _valueId_ of a Qualifier are present, the value shall be identical to the value of the referenced coded value in Qualifier/valueId. |
| AASd-007 | ativa |  | If both the Property/value and the Property/valueId are present, the value of Property/value needs to be identical to the value of the referenced coded value in Property/valueId. |
| AASd-008 | removida/histórica |  | The submodel element value of an operation variable shall be of kind=Template. |
| AASd-010 | removida/histórica |  | The property referenced in Permission/permission shall have the category "CONSTANT". |
| AASd-011 | removida/histórica |  | The property referenced in Permission/permission shall be part of the submodel that is referenced within the "selectablePermissions" attribute of "AccessControl". |
| AASd-012 | ativa |  | If both, the MultiLanguageProperty/value and the MultiLanguageProperty/valueId are present then for each string in a specific language the meaning must be the same as specified in MultiLanguageProperty/valueId |
| AASd-013 | removida/histórica |  | In case of a range with kind=Instance either the min or the max value or both need to be defined. |
| AASd-014 | ativa | ✅ | Either the attribute globalAssetId or specificAssetId of an Entity must be set if Entity/entityType is set to "SelfManagedEntity". They are not existing otherwise. |
| AASd-015 | removida/histórica |  | The data element SubjectAttributes/subjectAttribute shall be part of the submodel that is referenced within the "selectableSubjectAttributes" attribute of "AccessControl". |
| AASd-020 | ativa | ✅ | The value of Qualifier/value shall be consistent with the data type as defined in Qualifier/valueType. |
| AASd-021 | ativa |  | Every qualifiable shall only have one qualifier with the same Qualifier/valueType. |
| AASd-022 | ativa | ✅ | idShort of non-identifiable referables within the same name space shall be unique (case- sensitive). |
| AASd-023 | removida/histórica |  | AssetInformation/globalAssetId either is a reference to an Asset object or a global reference. |
| AASd-025 | removida/histórica |  | The data element shall be part of the submodel that is referenced within the "selectableSubjectAttributes" attribute of "AccessControl". |
| AASd-026 | removida/histórica |  | If allowDuplicates==false then it is not allowed that the collection contains several elements with the same semantics (i.e. the same semanticId). |
| AASd-027 | removida/histórica |  | idShort of Referables shall have a maximum length of characters. |
| AASd-050 | removida/histórica |  | If the DataSpecificationContent DataSpecificationIEC61360 is used for an element then the value of HasDataSpecification/dataSpecification shall contain the global reference to the IRI of the corresponding data specification templa |
| AASd-050b | removida/histórica |  | If the DataSpecificationContent DataSpecificationPhysicalUnit is used for an element then the value of HasDataSpecification/dataSpecification shall contain the global reference to the IRI of the corresponding data specification te |
| AASd-051 | removida/histórica |  | A ConceptDescription shall have one of the following categories: VALUE, PROPERTY, REFERENCE, DOCUMENT, CAPABILITY, RELATIONSHIP, COLLECTION, FUNCTION, EVENT, ENTITY, APPLICATION_CLASS, QUALIFIER, VIEW. Default: PROPERTY. |
| AASd-052a | removida/histórica |  | If the semanticId of a Property references a ConceptDescription then the ConceptDescription/category shall be one of following values: VALUE, PROPERTY. |
| AASd-052b | removida/histórica |  | If the semanticId of a MultiLanguageProperty references a ConceptDescription then the ConceptDescription/category shall be one of following values: PROPERTY. |
| AASd-053 | removida/histórica |  | If the semanticId of a Range submodel element references a ConceptDescription then the ConceptDescription/category shall be one of following values: PROPERTY. |
| AASd-054 | removida/histórica |  | If the semanticId of a ReferenceElement submodel element references a ConceptDescription then the ConceptDescription/category shall be one of following values: REFERENCE. |
| AASd-055 | removida/histórica |  | If the semanticId of a RelationshipElement or an AnnotatedRelationshipElement submodel element references a ConceptDescription then the ConceptDescription/category shall be one of following values: RELATIONSHIP. |
| AASd-056 | removida/histórica |  | If the semanticId of an Entity submodel element references a ConceptDescription then the ConceptDescription/category shall be one of following values: ENTITY. The ConceptDescription describes the elements assigned to the entity vi |
| AASd-057 | removida/histórica |  | The semanticId of a File or Blob submodel element shall only reference a ConceptDescription with the category DOCUMENT. |
| AASd-058 | removida/histórica |  | The semanticId of a Capability submodel element shall only reference a ConceptDescription with the category CAPABILITY. |
| AASd-059 | removida/histórica |  | If the semanticId of a SubmodelElementCollection references a ConceptDescription then the category of the ConceptDescription shall be COLLECTION or ENTITY. |
| AASd-060 | removida/histórica |  | If the semanticId of an Operation submodel element references a ConceptDescription then the category of the ConceptDescription shall be one of the following values: FUNCTION. |
| AASd-061 | removida/histórica |  | If the semanticId of an Event submodel element references a ConceptDescription then the category of the ConceptDescription shall be one of the following values: EVENT. |
| AASd-062 | removida/histórica |  | If the semanticId of a Property references a ConceptDescription then the ConceptDescription/category shall be one of following values: APPLICATION_CLASS. |
| AASd-063 | removida/histórica |  | If the semanticId of a Qualifier references a ConceptDescription then the ConceptDescription/category shall be one of following values: QUALIFIER. |
| AASd-064 | removida/histórica |  | If the semanticId of a View references a ConceptDescription then the category of the ConceptDescription shall be VIEW. |
| AASd-065 | removida/histórica |  | If the semanticId of a Property or MultiLanguageProperty references a ConceptDescription with the category VALUE then the value of the property is identical to DataSpecificationIEC61360/value and the valueId of the property is ide |
| AASd-066 | removida/histórica |  | If the semanticId of a Property or MultiLanguageProperty references a ConceptDescription with the category PROPERTY and DataSpecificationIEC61360/valueList is defined the value and valueId of the property is identical to one of th |
| AASd-067 | removida/histórica |  | If the semanticId of a MultiLanguageProperty references a ConceptDescription then DataSpecificationIEC61360/dataType shall be STRING_TRANSLATABLE. |
| AASd-068 | removida/histórica |  | If the semanticId of a Range submodel element references a ConceptDescription then DataSpecificationIEC61360/dataType shall be a numerical one, i.e. REAL_* or RATIONAL_*. |
| AASd-069 | removida/histórica |  | If the semanticId of a Range references a ConceptDescription then DataSpecificationIEC61360/levelType shall be identical to the set \{Min, Max}. |
| AASd-070 | removida/histórica |  | For a ConceptDescription with category PROPERTY or VALUE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType is mandator |
| AASd-071 | removida/histórica |  | For a ConceptDescription with category REFERENCE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType is STRING by defaul |
| AASd-072 | removida/histórica |  | For a ConceptDescription with category DOCUMENT using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType shall be one of the  |
| AASd-073 | removida/histórica |  | For a ConceptDescription with category QUALIFIER using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/dataType is mandatory and sh |
| AASd-074 | removida/histórica |  | For all ConceptDescriptions except for ConceptDescriptions of category VALUE using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) - DataSpecificationIEC61360/ |
| AASd-075 | removida/histórica |  | For all ConceptDescriptions using data specification template IEC61360 (http://admin- shell.io/DataSpecificationTemplates/DataSpecificationIEC61360/2/0) values for the attributes not being marked as mandatory or optional in tables |
| AASd-077 | ativa |  | The name of an extension (Extension/name) within HasExtensions needs to be unique. |
| AASd-080 | removida/histórica |  | In case Key/type == GlobalReference idType shall not be any LocalKeyType (IdShort, FragmentId). |
| AASd-081 | removida/histórica |  | In case Key/type==AssetAdministrationShell Key/idType shall not be any LocalKeyType (IdShort, FragmentId). |
| AASd-090 | removida/histórica | ✅ | For data elements, category (inherited by Referable) shall be one of the following values: CONSTANT, PARAMETER or VARIABLE. Default: VARIABLE |
| AASd-092 | removida/histórica |  | If the semanticId of a SubmodelElementCollection with SubmodelElementCollection/allowDuplicates == false references a ConceptDescription then the ConceptDescription/category shall be ENTITY. |
| AASd-093 | removida/histórica |  | If the semanticId of a SubmodelElementCollection with SubmodelElementCollection/allowDuplicates == true references a ConceptDescription then the ConceptDescription/category shall be COLLECTION. |
| AASd-100 | removida/histórica |  | An attribute with data type "string" is not allowed to be empty. |
| AASd-107 | ativa |  | If a first level child element in a SubmodelElementList has a semanticId, it shall be identical to SubmodelElementList/semanticIdListElement. |
| AASd-108 | ativa |  | All first level child elements in a SubmodelElementList shall have the same submodel element type as specified in SubmodelElementList/typeValueListElement. |
| AASd-109 | ativa |  | If _SubmodelElementList/typeValueListElement_ is equal to AasSubmodelElements/Property or AasSubmodelElements/Range, SubmodelElementList/valueTypeListElement shall be set and all first level child elements in the SubmodelElementLi |
| AASd-114 | ativa |  | If two first level child elements in a SubmodelElementList have a semanticId then they shall be identical. |
| AASd-115 | ativa |  | If a first level child element in a SubmodelElementList does not specify a semanticId then the value is assumed to be identical to SubmodelElementList/semanticIdListElement. |
| AASd-116 | ativa |  | "globalAssetId" (case-insensitive) is a reserved key for SpecificAssetId/name with the semantics as defined in https://admin- shell.io/aas/3/x/AssetInformation/globalAssetId, x being the minor version of the used specification. |
| AASd-117 | ativa |  | idShort of non-identifiable Referables not equal to SubmodelElementList shall be specified (i.e. idShort is mandatory for all Referables except for SubmodelElementLists and all Identifiables). |
| AASd-118 | ativa | ✅ | If there is a supplemental semantic ID (HasSemantics/supplementalSemanticId) defined then there shall be also a main semantic ID (HasSemantics/semanticId). |
| AASd-119 | ativa |  | If any Qualifier/kind value of a Qualifiable/qualifier is equal to TemplateQualifier and the qualified element inherits from "hasKind" then the qualified element shall be of kind Template (HasKind/kind = "Template"). |
| AASd-120 | removida/histórica |  | idShort of submodel elements being a direct child of a SubmodelElementList shall not be specified. |
| AASd-121 | ativa | ✅ | For References, the value of Key/type of the first _key_ of _Reference/keys_ shall be one of GloballyIdentifiables. |
| AASd-122 | ativa | ✅ | For external references, i.e. References with _Reference/type_ = ExternalReference, the value of Key/type of the first key of _Reference/keys_ shall be one of GenericGloballyIdentifiables. |
| AASd-123 | ativa | ✅ | For model references, i.e. References with _Reference/type_ = ModelReference, the value of Key/type of the first _key_ of _Reference/keys_ shall be one of AasIdentifiables. |
| AASd-124 | ativa | ✅ | For external references, i.e. References with _Reference/type_ = ExternalReference, the last _key_ of _Reference/keys_ shall be either one of GenericGloballyIdentifiables or one of GenericFragmentKeys. |
| AASd-125 | ativa | ✅ | For model references, i.e. References with Reference/type = ModelReference with more than one key in _Reference/keys_, the value of Key/type of each of the keys following the first key of _Reference/keys_ shall be one of FragmentK |
| AASd-126 | ativa | ✅ | For model references, i.e. References with _Reference/type_ = ModelReference with more than one key in _Reference/keys,_ the value of Key/type of the last Key in the reference key chain may be one of GenericFragmentKeys or no key  |
| AASd-127 | ativa | ✅ | For model references, i.e. References with _Reference/type_ = ModelReference with more than one key in _Reference/keys,_ a key with Key/type _FragmentReference_ shall be preceded by a key with Key/type _File_ or _Blob_. All other  |
| AASd-128 | ativa | ✅ | For model references, i.e. References with _Reference/type_ = ModelReference, the Key/value of a Key preceded by a Key with Key/type = SubmodelElementList is an integer number denoting the position in the array of the SubmodelElem |
| AASd-129 | ativa |  | If any Qualifier/kind value of a SubmodelElement/qualifier (attribute _qualifier_ inherited via Qualifiable) is equal to TemplateQualifier, the SubmodelElement shall be part of a Submodel template, i.e. a _Submodel_ with Submodel/ |
| AASd-130 | ativa | ✅ | An attribute with data type "string" shall be restricted to the characters as defined in XML Schema 1.0, i.e. the string shall consist of these characters only: ^[\x09\x0A\x0D\x20-\uD7FF\uE000- \uFFFD\u00010000-\u0010FFFF]*$. |
| AASd-131 | ativa | ✅ | The globalAssetId or at least one specificAssetId shall be defined for AssetInformation. |
| AASd-133 | ativa | ✅ | SpecificAssetId/externalSubjectId shall be a global reference, i.e. Reference/type = ExternalReference. |
| AASd-134 | ativa | ✅ | For an Operation, the idShort of all inputVariable/value, outputVariable/value, and inoutputVariable/value shall be unique. |
| AASd-135 | substituída na v3.2 (limite via VersionType/RevisionType) | ✅ | AdministrativeInformation/version shall have a length of maximum 4 characters. |
| AASd-136 | substituída na v3.2 (limite via VersionType/RevisionType) | ✅ | AdministrativeInformation/revision shall have a length of maximum 4 characters. |
| AASd-137 | ativa |  | For external references, i.e. Reference the value of any Key/type contained in the Reference shall not be one of AasReferables. |
| AASd-138 | ativa |  | A SubmodelElementList within a Submodel of kind=Template or as part of an OperationVariable shall have exactly one element. |
| AASs-009 | Parte 4 |  | either there is an external policy administration point endpoint defined (PolicyAdministrationPoint/externalPolicyDecisionPoints=true) or the AAS has its own access control |
| AASs-010 | Parte 4 |  | the property referenced in Permission/permission shall have the category "CONSTANT". |
| AASs-011 | Parte 4 |  | the property referenced in Permission/permission shall be part of the submodel that is referenced within the "selectablePermissions" attribute of "AccessControl". |
| AASs-015 | Parte 4 |  | every data element in SubjectAttributes/subjectAttributes shall be part of the submodel that is referenced within the "selectableSubjectAttributes" attribute of "AccessControl". |

## Ativas na v3.2 sem referência no Faaster (16)

AASd-006, AASd-007, AASd-012, AASd-021, AASd-077, AASd-107, AASd-108, AASd-109, AASd-114, AASd-115, AASd-116, AASd-117, AASd-119, AASd-129, AASd-137, AASd-138

## Citadas no Faaster mas removidas ou descontinuadas na v3.2

AASd-090
