<img align="right" height="50" src="https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-srv-web-issuing-eudiw-py/34015dc3c6f52529a99e673df1d4fa69d50f7ff5/app/static/ic-logo.svg"/><br/>

# Specification of common formats and API for Relying Party Registration information

## Abstract

The present document specifies the data formats and application programming interface (API) for the machine-readable Relying Party Registration required by the [European Digital Identity Regulation (EU 910/2014)](https://eur-lex.europa.eu/eli/reg/2014/910/oj/eng).

### [GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/discussions/357)

## Licensing and Reuse

© European Union, 2025-2026.

This document is made available under the Creative Commons Attribution 4.0 International licence (CC BY 4.0), unless otherwise stated.

You may reuse this document provided that appropriate credit is given and any changes are indicated.

The full licence text is available at:
<https://creativecommons.org/licenses/by/4.0/>

## Versioning

| Version | Date        | Description                                               |
|---------|-------------|-----------------------------------------------------------|
| `0.1`   | 25.04.2025  | Initial version for first discussion                      |
| `0.2`   | 30.04.2025  | Initial version - fixed data model figure                 |
| `0.3`   | 13.05.2025  | Updated version based on first feedback round             |
| `0.4`   | 23.05.2025  | Updated version based on focus group meeting 2            |
| `1.0`   | 13.06.2025  | Published version after Coordination Group review period  |
| `1.1`   | 14.10.2025  | First maintenance release - JWS API fix, intendedUseIdentifier, registryURI, TS11-implied updates     |
| `1.2`   | 27.11.2025  | Added Intended use identifier to /wrp GET query parameters list in main specification, reference updates.       |
| `1.2.1` | 2026-01-30  | Editorial update (licensing and reuse clarification)      |
| `1.3`   | 13.02.2026  | Substantial updates to data class structures (new SupervisoryAuthority and ProvidedAttestation classes) and existing attribute naming and cardinality changes.     |
| `1.4`   | 15.07.2026  | Introducing new WalletRelyingPartyService data class and Relying Party Service Identifier, moving of some existing attributes to this class. API query response and methods changes adjusted to new WRP Service concept.  |
| `1.5`   | 20.08.2026  | Alignment with changes introduced in EU 2026/1730, cardinality and UML fixes to issues introduced in version 1.4.  |
| `1.6`   | 30.09.2026  | Interoperability-improving fixes based on feedback from EE implementation team, new ServiceReference class, mechanism to register a policy as an attestation provider  |
| `1.6.1` | 10.11.2026  | Fixing OpenAPI errata found in version 1.6, addition of new attributes to track WRP Service lifecycle  |

## 1. Introduction and Overview

The present document specifies the common data formats and the application programming interface (API) related to **Relying Party Registration** according to [European Digital Identity Regulation (EU 910/2014)](https://eur-lex.europa.eu/eli/reg/2014/910/oj/eng) - herein [Regulation] and the Commission Implementing Regulation
(CIR) [EU 2025/848](http://data.europa.eu/eli/reg_impl/2025/848/oj) of 6 May 2025 on laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the registration of wallet-relying parties - herein [CIR for Relying Party Registration].

Relying Party Registration is addressed in Article 5b (11) of the Regulation and the [CIR for Relying Party Registration] lays down further details, which are in scope of present technical document.

Specifically on [CIR for Relying Party Registration]:

In the recitals, recital (3) states:
*To ensure broad access to the registers and to achieve interoperability, Member States should set up both human and machine-readable interfaces that meet the technical specifications set out in this Regulation. Providers of wallet-relying party access certificates and wallet-relying party registration certificates, where available, should, for the purpose of issuing those certificates, also be able to rely upon these interfaces.*

For the purposes of defining the technical specification, the [CIR for Relying Party Registration] sets specific ruling for:

1. The minimum common data set: The registration of a Relying Party to a registry shall include at least the information set out in Annex I of the [CIR for Relying Party Registration] - see Art. 3(2) and the technical specification [\[Common Set of Relying Party Information to be Registered\]](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md).
2. Online access to the registry information: The data shall be made available online both in human-readable form and in a form suitable for automated processing - see Art. 3(4).
3. Information shall be available through a single common API - see Art. 3(5).
4. Common requirements of [CIR for Relying Party Registration] Annex II Section 2 shall be complied with - see Art 3(6).
5. Annex II Sections 1 and 2 define the data format, signing and API requirements:
    - a REST API published according to OpenAPI version 3,
    - serving data out in JSON format,
    - the output JSON data is signed according to IETF 7515 on JSON Web Signatures (JWS),
    - provide open access,
    - provide API methods for **search and request lists of wallet-relying parties** based on following query parameters: official or business registration number, company name, privacy policy URL, entitlements (including sub-entitlements if defined by a Member State), and wallet-relying party reliance on intermediary and by an associated intermediary where applicable.
    - where query results match at least one wallet-relying party, response shall provide statement information of these wallet relying parties, including information registered according to [CIR for Relying Party Registration] Annex I and full wallet-relying party access certificate (and registration certificate, if applicable) histories, but shall exclude physical address of the registration information of [CIR for Relying Party Registration] Annex I (4).

## 2. Data Model

The data model and common format for Relying Party Registration is derived from the [CIR for Relying Party Registration], the technical specification on [Common Set of Relying Party Information to be Registered](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md) and the [Provider information specification],
while keeping the [SEMIC Style Guide](https://semiceu.github.io/style-guide/1.0.0/index.html) in mind and aligning it with the [SEMIC Core Business Vocabulary](https://semiceu.github.io/Core-Business-Vocabulary/releases/2.2.0/) as much as reasonable.

> NOTE: The data model for Relying Party Registration data depends on the [Provider information specification] data model, to which it carries a few superclass dependencies as referenced in this section.

![WRP-Reg-DataModel](img/ts5-wrpreg-datamodel.svg)

As outlined in the figure, the data model contains the main class **WalletRelyingParty**, which has class dependencies to superclasses **LegalEntity** and **Provider** specified in [Provider information specification]. An auxiliary class **WalletRelyingPartyService** has main role in registration and identification of Wallet-Relying Party's individual services. The concept of a service, not separately mentioned in the guiding regulation, is added to assist the Wallet-Relying Parties to orchestrate and secure their operations and architecture that utilises Wallet-Relying Party Access Certificates ('RPAC') and Wallet-Relying Party Registration Certificates ('RPRC'), Relying Party Instances ('RPI') and services (with designated Intended uses).

The top-level class of the data model is **WalletRelyingParty**, which

- contains the Wallet-Relying Party layer attributes listed in Section 2.1
- as a class inherits attributes of **Provider** and **LegalEntity** superclasses from the [Provider information specification].
- defines its own **auxiliary classes**:
  - **WalletRelyingPartyService**
  - **Claim**
  - **Credential**
  - **IntendedUse**
  - **MultiLangString**
  - **SupervisoryAuthority**
  - **ProvidedAttestation**
  - **MetaType**
  - **ServiceReference**
  
- depends on following auxiliary classes of the [Provider information specification] and [Specification of interfaces and formats for the catalogue of attributes and the catalogue of attestations]:
  - **Identifier**
  - **Policy**
  - **LegalPerson**
  - **NaturalPerson**
  - **Law**
  - **TrustAuthority**

The information present in the issued Wallet-Relying Party Registration Certificates (issuance of RPRC is done separately for each Intended use of a Wallet-Relying Party Service), specified in \[ETSI 119 475\], is gathered from these classes.

### 2.1 WalletRelyingParty

The `WalletRelyingParty` main class inherits all attributes from the `Provider`
superclass specified in the [Provider information specification]. In addition to the attributes of the `Provider` class it contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description     |
|-----------|--------------|------|-----------------|
| `tradeName`  | [0..1] | *string* | may be present in order to specify the **trade name** (common name, service name) of the Wallet-Relying Party, if applicable. Note that the `serviceTradeName` in [*WalletRelyingPartyService*](#241-walletrelyingpartyservice) is mandatory and will be utilised in issued access and registration certificates. If the Wallet-Relying Party only has one service and trade name, this attribute could be (inherit) the same value registered therein. |
| `isPSB` | [1..1] | *boolean* | indicates whether the Wallet-Relying Party **is a public sector body** or not. The attribute SHALL be provided and be set to `FALSE` if registered entity is not a public sector body.  |
| `supervisoryAuthority` | [1..1] | [*SupervisoryAuthority*](#247-supervisoryauthority) | specifies the competent **data protection supervisory authority** according to Article 51 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) in charge of supervising the Wallet-Relying Party. It provides the necessary contact information towards the Data Protection Authority through its `email`, `phone` and/or `formURI` attributes, of which at least one SHALL be provided for an DPA registered into a Member State Registry. |
| `registryURI` | [1..1] | *string* | URI for the national registry API of the registered Wallet-Relying Party. The national Registrar SHALL provide this information upon registration. For other Registrar-provided data, see also `intendedUseIdentifier` in the [`IntendedUse`](#244-intendeduse) class. |
| `createdAt` | [1..1] | *string* | Validity start date for the registration data of the Wallet-Relying Party in [ISO8601‑1] YYYY-MM-DD format. |
| `revokedAt` | [0..1] | *string* | Revocation date of Wallet-Relying Party registration information in[ISO8601‑1] YYYY-MM-DD format. Registration MAY be revoked by the Wallet-Relying Party or by the Registrar for reasons defined in [Regulation] and [CIR for Relying Party Registration]. *Note that the [CIR for Relying Party Registration] requires a 10-year retention period for Wallet-Relying Party data by the applicable Registrar.* |
| `services` | [1..*] | Array of [*WalletRelyingPartyService*](#2414-servicereference) objects | contains list of all individually registered services (**Wallet-Relying Party Services**) of the Wallet-Relying Party in a Member State Registry. The registered services can be queried via the Registry API behind the`registryURI`, see to the [API query methods](#312-method-descriptions) and `serviceIdentifier` attribute in the [*WalletRelyingPartyService*](#2414-servicereference) class. |

> Note: [Specification of Common Interface for Data Deletion Requests] adds the contact information of intended-use responsible DPA to the set of data to be registered by the Wallet-Relying Party. This information is available as OneOf[supervisoryAuthority.email, supervisoryAuthority.phone, supervisoryAuthority.formURI] if the same DPA is valid for all intended uses of the Wallet-Relying Party.

### 2.2 Provider

The `Provider` superclass inherits all attributes from the more general `LegalEntity` superclass specified in the [Provider information specification]. WalletRelyingParty class inherits all attributes of this class.

### 2.3 LegalEntity

The `LegalEntity` superclass contains the attributes specified in [Provider information specification]. WalletRelyingParty class inherits all attributes of this class.

### 2.4 Auxiliary Classes

The WalletRelyingParty class has attributes that depend on a set of its own auxiliary classes (in addition to ones defined in [Provider information specification] as listed in Section 2 above) as follows:

#### 2.4.1 WalletRelyingPartyService

The `WalletRelyingPartyService` class is used within the [`WalletRelyingParty`](#21-walletrelyingparty) class to group all attributes that are specific to a registered service of the Wallet-Relying Party. It contains the following attributes and sub-classes:

| Attribute | Multiplicity | Type | Description     |
|-----------|--------------|------|-----------------|
| `serviceTradeName` | [1..1] | *string* | shall be present in order to specify the **trade name** (common name, service name) of the Wallet-Relying Party Service. This attribute will be presented to the Wallet User in the Wallet Unit UI upon a presentation request or attestation offer and used for value matching in access and registration certificate verification process. |
| `serviceIdentifier` | [1..1] | *string* | shall be present in order to specify the identifier of the Wallet-Relying Party Service. The Wallet Relying Party may register any meaningful identifier that helps it to identify the particular service from other services registered by the Wallet-Relying Party. A `serviceIdentifier` is used as a key on multiple API methods, and is required in order to update or delete a Wallet-Relying Party Service through the registry API.  |
| `supportURI` | [0..1] | *string* | specifies the **support URI** for the Wallet-Relying Party Service. Note that Annex I (7) of [CIR for Relying Party Registration] stipulates that the Wallet-Relying Party SHALL provide detailed contact information in form of (a) a website for helpdesk and support, (b) a phone number or (c) an e-mail address pertaining to its registration and intended use of the Wallet Units (**at least one of the the listed options**). Therefore, at least one of `supportURI`, `email`, or `phone` attributes SHALL be present. |
| `email` | [0..1] | *string* | may be present in order to specify **email address** of the Wallet-Relying Party Service according to [RFC5322](https://www.rfc-editor.org/rfc/rfc5322.html). |
| `phone` | [0..1] | *string* | may be present in order to specify **phone number** of the Wallet-Relying Party Service starting with the ‘+’ symbol as the international code prefix and the country code, followed by numbers only as specified in [RFC2806](https://www.rfc-editor.org/rfc/rfc2806.html). |
| `srvDescription` | [1..*] | Array of *[MultiLangString](#246-multilangstring) objects* | contains an array of **localised descriptions of the Wallet-Relying Party Service**. |
| `intendedUses` | [0..*] | Array of [*IntendedUse*](#244-intendeduse) objects | array of `IntendedUse` objects specifying the intended use cases in which the Wallet-Relying Party Service intends to rely on attestations of attributes of a Wallet User presented by a Wallet Unit. `IntendedUse` is **not required** for Wallet-Relying Party Services that are registered only to act as intermediaries. Note that attestation providers requesting attestations of attributes against their attestation provisioning service will need to register their intended use(s), as normal service providers do. |
| `entitlements` | [0..*] | Array of *strings* | specifies the **set of entitlements** of the Wallet-Relying Party Service in form of a URI according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html). Note that a Wallet-Relying Party may register a service for multiple entitlements. An attestation provider that requires presentation of another attestation during issuance of their own attestation SHALL register both as a Service_Provider and with their attestation provider entitlement in a single service registration. A pure intermediary service SHALL NOT be registered an entitlement. The following URIs are specified for the roles present in the [CIR for Relying Party Registration]: <ul><li> https://uri.etsi.org/19475/Entitlement/Service_Provider</li> <li> https://uri.etsi.org/19475/Entitlement/QEAA_Provider</li><li> https://uri.etsi.org/19475/Entitlement/Non_Q_EAA_Provider</li><li> https://uri.etsi.org/19475/Entitlement/PUB_EAA_Provider</li><li> https://uri.etsi.org/19475/Entitlement/PID_Provider</li><li> https://uri.etsi.org/19475/Entitlement/QCert_for_ESeal_Provider</li><li> https://uri.etsi.org/19475/Entitlement/QCert_for_ESig_Provider</li><li> https://uri.etsi.org/19475/Entitlement/rQSealCDs_Provider</li><li> https://uri.etsi.org/19475/Entitlement/rQSigCDs_Provider</li><li> https://uri.etsi.org/19475/Entitlement/ESig_ESeal_Creation_Provider</li></ul> |
| `subEntitlements` | [0..*] | Array of *strings* | specifies the **sub-entitlements** of the Wallet-Relying Party Service in form of a URI according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html). Member States may provide additional sub-entitlements to state which attestations a specific non-qualified issuer of electronic attestation of attributes shall issue. |
| `providesAttestations` | [0..*] | Array of [*ProvidedAttestation*](#248-providedattestation) objects | a list of referenced or self-declared attestation types the Wallet-Relying Party Service intends to issue for Wallet Units. Shall be non-empty only if any member of the `entitlements` array of the Wallet-Relying Party Service is of type QEAA_Provider, Non_Q_EAA_Provider, PUB_EAA_Provider or PID_Provider, listing the attestation type(s) (`ProvidedAttestation`) the Wallet-Relying Party Service intends to issue to Wallet Units. Referenceable attestation types are listed in a publicly available attestation catalogue, such as the one defined in [Specification of interfaces and formats for the catalogue of attributes and the catalogue of attestations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md). The attribute to be referenced for a catalogued attestation type is its catalogue-assigned attestation schema URI (`SchemaMeta.Schema.uri`). |
| `issuerPolicies` | [0..*] | Array of [*Policy*](#249-policy-external) objects | optional object that allows for registering the privacy (or other) policies applicable when an attestation provider registers a WalletRelyingPartyService without an Intended use (has no duty to register one, if it does not request a presentation of an attestation in exchange/as a prerequisite of issuance). The registered policies SHALL be possible to be displayed localised to the User's language (locale), and localisations SHALL be provided for all official languages of Member States where the attestation is provided. The localisation, if provided through listing individual URIs for each policy language version and if intended for rendering on the EUDI Wallet Instance, SHOULD be provided in accordance with Annex E of [ETSI TS119612 V2.3.1](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf).   *NOTES: - A registered [*Policy*] under the issuerPolicies object, when present, should be treated similar to the `IntendedUse.privacyPolicy` at issuance of the related WRP registration certificate following the [ETSI TS 119 475]. - In case of accidental duplicate registration of a privacy policy, the one within the [*IntendedUse*](#244-intendeduse) object takes always precedence.* |
| `usesIntermediaries` | [0..*] | Array of [*ServiceReference*](#241-servicereference) objects | if present, indicates **whether the Wallet-Relying Party Service depends on use of at least one intermediary** and lists these intermediaries via the `ServiceReference` objects present in the array. See [ARF Topic 52](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2330-topic-52-relying-party-intermediaries), high-level requirements RPI_01 and RPI_07. |
| `isIntermediary` | [1..1] | *boolean* | indicates whether the Wallet-Relying Party Service is registered to act on-behalf of other Relying Parties (is an intermediary or not). Attribute SHALL be set to FALSE if `usesIntermediaries` attribute is present. |
| `servedWRPServices` | [0..*] | Array of [*ServiceReference*](#2414-servicereference) objects | array of associated other Wallet-Relying Party Services that rely upon the intermediary service that is registered to act on behalf of the Wallet-Relying Parties. Each relying Wallet-Relying Party Service is identified by a listed `ServiceReference` object. | 1) Note, that this attribute may only be present and managed in case of an intermediary service, not in case of a regular Wallet-Relying Party Service.</br></br> 2)  The requirement for this attribute has been introduced in Annex I of CIR [(EU) 2026/1730](https://eur-lex.europa.eu/eli/reg_impl/2026/1730/oj). |
| `status` | [1..1] | *string* | status of the registration,  A string from the set of: `active`, `suspended` or `revoked`. |
| `createdAt` | [1..1] | *string* | validity start date for the registration data of the Wallet-Relying Party Service in [ISO8601‑1] YYYY-MM-DD format. |
| `suspendedAt` | [0..1] | *string* | suspension start date for the registration data of the Wallet-Relying Party Service in [ISO8601‑1] YYYY-MM-DD format. |
| `revokedAt` | [0..1] | *string* | revocation date of Wallet-Relying Party Service registration information in[ISO8601‑1] YYYY-MM-DD format.    |

#### 2.4.1.1 Scope and Resolution of Service Identifiers

The value assigned to a `serviceIdentifier` MUST be unique within the scope of its owning Wallet-Relying Party (WRP). The registry does not enforce global registry-wide uniqueness for these identifiers. Furthermore, an intermediary service may reference a service registered in a registry different of its own.  

Consequently, to reference or cross-link a service belonging to any WRP (such as within the `servedWRPServices` or `usesIntermediaries` attributes), implementations MUST qualify the reference by bundling the target WRP's unique identifier (`identifier`) alongside specific target `serviceIdentifier` and target registry's URI `registryURI`. This is done by utilising the [*ServiceReference*](#24-servicereference) class.

> Note: The `isIntermediary` attribute is not included into the access or registration certificate attributes mapped in [ETSI TS 119 475](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/287), thus making this attribute available for verification only via the Registrar's API. It should be included onto suitable certificate (access certificate) to help with verification of the parties involved in intermediated transactions.

#### 2.4.2 Claim

The `Claim` class is used within the definition of the [`Credential`](#245-credential) class to list required attributes within a requested attestation, and contains the following attribute:

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `path` | [1..*] | *Any* (String \| Integer \| Null) | path pointer that specifies the path to a claim within the `Credential` - a non-empty array constructing the OpenID4VP claims path pointer. See [OpenID4VP] Sections 6.3. and 7. Section 7.1 specifies use of path for Credentials in sd-jwt-vc format, and Section 7.2 for Credentials in mso_mdoc format. |

> Note: If the Wallet-Relying Party defines a set of expected claim/attribute values (see [OpenID4VP Section 6.3](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html#name-claims-query)) for a requested `Credential`, such are not informed as part of the Intended use registration to the Registrar.

#### 2.4.3 Identifier (external)

The `Identifier` class is used within the definition of the `LegalEntity` superclass and contains the attributes specified in the [Provider information specification].

##### 2.4.3.1 Unique Identifier for identification of Wallet-Relying Parties

The ARF Annex 2 high-level requirements on Relying Party registration and authentication - see [Topic 44](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2344-topic-44---relying-party-registration-certificates), [Topic 52](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2352-topic-52-relying-party-intermediaries), [Topic 6](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a236-topic-6---relying-party-authentication-and-user-approval) - require a Wallet Unit to be able to both identify the Wallet-Relying Party with an unique identifier and a trade name or service name of the said Relying Party, and to allow association between the Access Certificate and the Registration Certificate of a Relying Party (or between an intermediary and its End-Relying Party) based on this unique identifier.

The [CIR for Relying Party Registration] Annex I (2) lists seven alternative identifiers and a wild card option (3)(h) to be registrable for a Wallet-Relying Party, of which **at least one** should be provided when registering a Wallet-Relying Party to a Registrar.

For the purpose of standardising a single technical unique identifier available for use in the EUDI framework, when available in the national business register(s), an identifier of type **`http://data.europa.eu/eudi/id/EUID` - European unique identifier (EUID)** as defined in [\[CIR for BRIS\]](https://eur-lex.europa.eu/eli/reg_impl/2021/1042/oj) SHALL be used by default in registration of a Wallet-Relying Party to a Registrar.

If EUID identifier type is not available, the Member State SHALL define and publish the national unique identifier scheme used to identify the Wallet-Relying Parties in the respective national Registry(-ies).

Other alternate identifiers listed in [CIR for Relying Party Registration] Annex I (2) MAY be registered in addition to the default unique identifier.

> Note 1: The Annex I (3)(b) 'registration number as registered in national business register' is considered redundant with EUID (3)(g) - all Member State national business registries shall provide EUIDs for all registered legal entities in their registry for cross-border purposes.
>
> Note 2: The set of identifiers in [CIR for Relying Party Registration] Annex I indicates all Wallet-Relying Parties to be legal persons. Registration of natural persons as Wallet-Relying Parties - an option enabled in the [Regulation] - can be followed utilising the `LegalEntity` class of the [Provider information specification].

#### 2.4.4 IntendedUse

The `IntendedUse` class is used within the definition of the [`WalletRelyingPartyService`](#241-walletrelyingpartyservice) class to specify the required information when a Wallet-Relying Party Service with role of a Service Provider (see `WalletRelyingPartyService.entitlements`) is requesting data from a Wallet Unit. An Attestation or a PID Provider that does not intend to request any attestations from the Wallet Unit does not register an Intended use. For legal reference see [CIR for Relying Party Registration] Annex I paragraphs (8), (9) and (10). The class contains an identifier attribute assigned to the registered Intended use upon registration and is provided by the national Registrar. With regards to provisioning of Wallet-Relying Party Registration Certificates, the local unique identifier should be the same unique identifier used as the identifier of the certificate issued.

The class contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `purpose` | [1..*] | Array of [*MultiLangString*](#246-multilangstring) objects | specifies one or more **purposes** of the intended data processing according to Article 5 1. (b) of [(EU) 2016/679](https://eur-lex.europa.eu/eli/reg/2016/679/oj). The purpose SHALL be possible to be displayed localised to the User's language (`lang`), and localisations (`content`) SHALL be provided for all official languages of Member States where the intended use is provided. The localisation SHALL be provided in accordance with Annex E of [ETSI TS119612 V2.3.1](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf). |
| `privacyPolicy` | [1..*] | Array of [*Policy*](#249-policy-external) objects | specifies the privacy policy of the intended use. `Policy.type` SHALL be of type Privacy Statement. The privacy policy SHALL be possible to be displayed localised to the User's language (locale), and localisations SHALL be provided for all official languages of Member States where the intended use is provided. The localisation, if provided through listing individual URIs for each policy language version and if intended for rendering on the EUDI Wallet Instance, SHOULD be provided in accordance with Annex E of [ETSI TS119612 V2.3.1](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf).   *NOTE: Localisations can be arranged on the Wallet-Relying Parties with multiple approaches, using Content Management Systems (CMSs), individual web pages per language variant of the policy with User locale based redirection from the policy root page, or by using commonly available internationalisation libraries on the front-end implementation. Two last approaches would work with just one privacyPolicy URI registration.* |
| `intendedUseIdentifier` | [1..1] | *string* | Registrar-provided unique identifier of the registered intended use. With regards to Wallet-Relying Party Registration Certificate provided for the intended use, the local unique identifier SHOULD be the same unique identifier used as the identifier of the certificate issued. |
| `createdAt` | [1..1] | *string* | Validity start date for the intended use in [ISO8601‑1] YYYY-MM-DD format. |
| `revokedAt` | [0..1] | *string* | End date for the validity of the intended use in[ISO8601‑1] YYYY-MM-DD format. The intended use MAY be marked to expire at given date, or MAY be revoked by the Wallet-Relying Party as necessary.  Note that the [CIR for Relying Party Registration] requires expired or revoked intended use data be available beyond the validity lifespan of the intended use, during which it is used in validation of presentation requests. |
| `credentials` | [1..*] | Array of [*Credential*](#245-credential) objects | specifies the set of potentially **requestable attestations** which may be requested by the Wallet-Relying Party Service within the scope of the present intended use of data. |

#### 2.4.5 Credential

The `Credential` class is used within the definition of the [`IntendedUse`](#244-intendeduse) class to specify the attestation type specific information within a presentation request. Two complementary mechanisms to specify the attestation information: 1) linking to an URI that points to the requested attestation schema in a machine-readable catalogue (e.g., hosted in the European Commission hosted Catalogue of Attestations, see [Specification of interfaces and formats for the catalogue of attributes and the catalogue of attestations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md), or similar hosted by a member state or by private actor), or 2) in lack of a publicly accessible attestation schema and Attestation Rulebook, a self-declaration of the attestation schema via defining the attestation type and format. In both mechanisms, the Credential object SHALL always define the requested attributes of the attestation(s) included in the intended use.

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `format`  | [1..1]       | *string* | Specifies the format of the attestation. For valid values, see enumerations listed in [Specification of interfaces and formats for the catalogue of attributes and the catalogue of attestations] and [OpenID4VP] Appendix B.  |
| `meta`    | [1..1]       | [*MetaType*](#2413-metatype)  | An object defining additional properties requested by the Verifier (including the credential type) that apply to the metadata and validity data of the Credential. The properties of MetaType object are defined per Credential Format - see [OID4VP] Section 6.1 and annex [B.3.5](https://openid.net/specs/openid-4-verifiable-presentations-1_0-27.html#sd_jwt_vc_meta_parameter) for SD-JWT VC format with an "vct_values" (array of "vct" values), and annex [B2.3](https://openid.net/specs/openid-4-verifiable-presentations-1_0-27.html#mdocs_meta_parameter) for ISO mdoc format with a "doctype" string. |
| `claims`  | [1..*]       | [*Claim*](#242-claim) | A non-empty array of objects that specifies attributes in the requested attestation. See [OID4VP] Section 6.3. |

> Note: In line with the data minimisation principle according to Article 5 1. (c) of [(EU) 2016/679](https://eur-lex.europa.eu/eli/reg/2016/679/oj) the Wallet-Relying Party Service may only request the minimum set of attestations (`Credential`) and attributes (`Claim`) within those necessary for a specific intended use (described in `IntendedUse.purpose`).

#### 2.4.6 MultiLangString

The `MultiLangString` class is used within the definition of the [`IntendedUse`](#244-intendeduse) class to provide the country code  and string tuple in localisation of the intended use's `purpose` attribute array, and within the definition of the [`WalletRelyingPartyService`](#241-walletrelyingpartyservice) class to provide the country code and string tuple in localisation of the Wallet-Relying Party Service's `srvDescription` attribute array. The codes and strings shall be provided according to the rules set in Annex E of \[ETSI TS 119 612\].

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `lang` | [1..1] | *string* | Specifies the country code of the localised text. |
| `content` | [1..1] | *string* | The localised text as a string. |

#### 2.4.7 SupervisoryAuthority

The `SupervisoryAuthority` class is used within the definition of the [`WalletRelyingParty`](#21-walletrelyingparty) class to define the required set of attributes for a national Data Protection Authority (also known as Supervisory Authority) linked to the registered Wallet-Relying Party. Minimum set of attributes required are defined in the ARF requirement RPRC_12, which states that the registration certificate shall contain the name and country of the supervisory authority and (at least) one of the following: the URL of a web form, an e-mail address, or a telephone number.

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `name` | [1..1] | *string* | Official name of supervisory authority. |
| `country` | [1..1] | *string* | specifies the alpha-2 **country code** according to ISO 3166-1 of the country in which the supervisory authority is established. |
| `email` | [0..*] | *string* | may be present in order to specify one or more **email addresses** according to [RFC5322](https://www.rfc-editor.org/rfc/rfc5322.html) of the supervisory authority. |
| `phone` | [0..*] | *string* | may be present in order to specify one or more **phone numbers** of the legal entity starting with the ‘+’ symbol as the international code prefix and the country code, followed by numbers only as specified in [RFC2806](https://www.rfc-editor.org/rfc/rfc2806.html). |
| `formURI` | [0..*] | *string* | may be present in order to specify the **URL of web form** provided by the Data Protection Authority supervising the Relying Party, which Users can use to report suspicious attribute presentation requests. |

> Note: At least one of email, phone or formURI attribute arrays of the SupervisoryAuthority class should be populated and should contain at least one element, even though the multiplicity of the attributes is [0..*].

#### 2.4.8 ProvidedAttestation

The `ProvidedAttestation` class is used within the definition of the [`WalletRelyingPartyService`](#241-walletrelyingpartyservice) class to specify each attestation type to be provided when registered Wallet-Relying Party Service is an attestation provider. The class allows two complementary mechanisms to specify the attestation information: 1) linking to a URI that points to the attestation schema in a machine-readable catalogue (e.g., hosted in the European Commission hosted Catalogue of Attestations, see [Specification of interfaces and formats for the catalogue of attributes and the catalogue of attestations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md), or similar hosted by a member state or by private actor), or 2) in lack of a publicly accessible attestation schema and Attestation Rulebook, a self-declaration of the attestation schema via defining the attestation type and its trust anchors/authorities through using an attestation format specific type metadata.

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `format`  | [1..1] | *string* | Specifies the format of the attestation. For valid values, see enumerations listed in [Specification of interfaces and formats for the catalogue of attributes and the catalogue of attestations] and [OpenID4VP] Appendix B.  |
| `type`    | [1..1] | *string* | A string value for defining the unique attestation type. If the attestation type and full issuer metadata is available in an attestation catalogue or via the issuer service, the string value used SHALL be an URI pointing to the machine-readable attestation schema or issuer metadata. The properties of type attribute are defined per Credential Format, see [OID4VCI] Appendix [A.3.2](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html#appendix-A.3.2) for SD-JWT VC format "vct" attribute, and appendix [A2.2](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html#appendix-A.3.2) for ISO mdoc format "doctype" element.      |
| `trustedAuthorities` | [0..*]   | Array of [*TrustAuthority*](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md#433-trustauthority-sub-class) objects | optional array of objects that resolve to the applicable trust management scheme(s) (trust model) or trust anchor(s) of the attestation type. It SHALL be used according to the options available in [OpenID4VP Section 6.1.1](https://openid.net/specs/openid-4-verifiable-presentations-1_0-27.html#section-6.1.1). See [The European Commission Specification for interfaces and formats for the Catalogue of Attributes and the Catalogue of Attestations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md#433-trustauthority-sub-class) for complete object description. The `trustedAuthorities` SHOULD be used with any non-catalogued attestation type with a trust model/anchor, and MAY also be used with a catalogued attestation type in case the hosting attestation catalogue has no support for machine-readable trust anchors. In case `trustedAuthorities` is found present for an attestation type both on the catalogue and the registry, the version found in the catalogue SHALL always take precedence. |


> Note: `ProvidedAttestation` is a deduced version of the `Credential` class without the 'claims' attribute array. This allows clear separation between attestation type registrations required from registering attestation providers (just the particular attestation type they issue) and service providers (which may, e.g., list allowed "vct_values" values for the requested SD-JWT VC attestation type, including possible inherited types, and a list of claims (attributes) requested for the Intended use). Full set of claims of an provided attestation type are declared behind the attestation schema URI, referenced via the `ProvidedAttestation.type` attribute.

#### 2.4.9 Policy (external)

The `Policy` class is used within the definition of the  [`IntendedUse`](#244-intendeduse)class. It contains the attributes specified in the [Provider information specification].

#### 2.4.10 LegalPerson (external)

The `LegalPerson` class is used within the definition of the `LegalEntity` class and allows to specify the attributes of a legal person. It contains the attributes specified in the [Provider information specification].

#### 2.4.11 NaturalPerson (external)

The `NaturalPerson` class is used within the definition of the `LegalEntity` class and allows to specify the attributes of a natural person acting as a legal entity. It contains the attributes specified in the [Provider information specification]. If an identifier of a natural person needs to be registered upon registration of a Wallet-Relying Party, the `identifier` of the `Provider` class SHALL be used for this purpose, using the `serialNumber` type as defined in [ETSI EN 319 412-1].

#### 2.4.12 Law (external)

The `Law` class is used within the definition of the `LegalPerson` class and contains the attributes specified in the [Provider information specification].

#### 2.4.13 MetaType

The `MetaType` class is used in `Credential` class. It contains either an array of strings constructing the `vct_values` array(SD-JWT VC format) or a `doctype_value` string (mdoc format). 

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `vct_values` | [0..*] | Array of strings | Array of "vct" values constructing the requested type path for SD-JWT VC format. Exactly one of vct_values or doctype_value SHALL be present. |
| `doctype_value` | [0..1] | string | The doctype value string for ISO mdoc format. Exactly one of vct_values or doctype_value SHALL be present. |

#### 2.4.14 ServiceReference

The `ServiceReference` class is used in `WalletRelyingPartyService` class, in the context of either `usesIntermediaries` or `servedWRPServices` attribute. The object contains the WRP identifier chosen to identify the Wallet-Relying Party in its access and registration certificates (according to [ETSI TS 119 475](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/287), organization idenfifier is used for a legal person, and serial number for a natural person Wallet-Relying Party) value from `WalletRelyingParty.identifier`, `WalletRelyingPartyService.serviceIdentifier` and `WalletRelyingParty.registryURI`. This triple allows unique identification of a referenced Wallet-Relying Party Service across the registrars. See also section [2.4.1.1](#2411-scope-and-resolution-of-service-identifiers).

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|------|-------------|
| `identifier`| [1..1] | *string* | the identifier of the Wallet-Relying Party used to identify the Wallet-Relying Party in its registration and access certificates, which shall follow the semantics defined in [ETSI TS 119 475](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/287). The value SHALL be `subject organizationIdenfifier` for a legal person, or `serialNumber` for a natural person registered as a Wallet-Relying Party. |
| `serviceIdentifier` | [1..1] | *string* | the identifier of the Wallet-Relying Party Service. |
| `registryURI` | [1..1] | *string* | URI for the national registry API of the Wallet-Relying Party. |

## 3 Common Application Programming Interface

### 3.1 API methods for registrar queries (open API)

#### 3.1.1 Requirements

The Registry API's read methods SHALL be open for public access.

The public API SHALL provide methods for searching and querying complete data sets of registered Wallet-Relying Parties matching with provided query parameters, that can be any of:

- **official or business registration number** (see `WalletRelyingParty.Identifier`) - will return data of list of matching Wallet-Relying Parties.
- **official company name or trade name** (see `WalletRelyingParty.legalName` and `WalletRelyingParty.tradeName`) - will return data of list of matching Wallet-Relying Parties.
- **URL of the Wallet-Relying Party's privacy policy** (see `WalletRelyingParty.policy` and `IntendedUse.privacyPolicy`) - will return data of list of matching Wallet-Relying Parties.
- **type of entitlement** (see `WalletRelyingPartyService.entitlements` and `WalletRelyingPartyService.subEntitlements`) - will return data of list of Wallet-Relying Party Services matching with queried entitlement type.
- **type of attestations provided** (see `WalletRelyingPartyService.providesAttestations`) - - will return data of list of matching Wallet-Relying Party Services that provide the queried attestation type.
- **type of attestation requested** (see `WalletRelyingPartyService.intendedUse`) - - will return data of list of matching Wallet-Relying Party Services that request the queried attestation type within their registered intended uses.
- **reliance upon an Intermediary** (see `WalletRelyingPartyService.usesIntermediaries`) - will return data of list of matching Wallet-Relying Party Services that have the attribute `WalletRelyingPartyService.usesIntermediaries` present.
- **official company name or trade name of an Intermediary** (see `WalletRelyingPartyService.isIntermediary`) - will return all Wallet-Relying Parties associated with queried intermediary information through their `WalletRelyingPartyService.usesIntermediaries` information present in the Registry.

Where query results match at least one wallet-relying party, the JWS-signed method response SHALL provide:

- set of information registered to matching Wallet-Relying Party (the full contents of `WalletRelyingParty` class for given instance without the `WalletRelyingParty.physicalAddress` attribute).

#### 3.1.2 Method descriptions

paths:
`/wrp` (GET):

There is a single **GET** /wrp endpoint for making parametrised queries. For this purpose, the API specification has the `parameters` section, where:

- Each filterable field (`identifier`, `legalName`, `tradeName`, `serviceIdentifier`, `policy`, `entitlement`, `providedAttestation`, `usesIntermediary`, `isIntermediary`, `intendedUseIdentifier`, `claimPath`, `credentialMeta`, `credentialFormat`) is defined as a query parameter.
- `in: query`: Specifies that the parameter is a query parameter.
- `name`: The name of the query parameter.
- `schema`: Defines the data type of the query parameter (mostly `string`, with `boolean` for `isIntermediary`).
- `description`: Provides a brief explanation of what the query parameter filters by.

If no query parameters are included, the method returns the full list of registered Wallet-Relying Parties in the Registry.

In addition to the basic parameter set the endpoint includes also parameters for handling cursor-based pagination, and methods to query the Registry based on Intended use components - the seven `intendedUse` filters. Note that query strings with `+` character may be decoded erroneously (e.g. with `/wrp?credentialFormat=dc+sd-jwt` the format value would be decoded as `dc sd-jwt` in HTML form encoding) so implementers must use percent-encoding of the value.

The API clients can make requests such as:

`/wrp?identifier=someOrganisationIdentifier`

`/wrp?serviceIdentifier=exampleServiceIdentifier`

`/wrp?legalName=Example%20Corp`

`/wrp?policy=https://example.com/policy`

`/wrp?entitlement=http://data.europa.eu/eudi/entitlement/PUB_EAA_Provider`

`/wrp?isIntermediary=true`

`/wrp?identifier=someIdentifier&claimPath=IBAN&credentialFormat=dc%2Bsd-jwt`

And even combine multiple filters: `/wrp?legalName=Another%20Org&isIntermediary=false`

The JWS-signed response body for a successful GET `(200)` will be an array of matching `WalletRelyingParty` objects, each matching object including the `WalletRelyingPartyService` objects of this Wallet-Relying Party, if the used query parameter/parameters were related to service layer attributes.

In case a query is done using the `serviceIdentifier` filter, the response body for a successful GET `(200)` will be `WalletRelyingParty` object including only the matching, isolated `WalletRelyingPartyService` object.

The JWS-signed response body for a successful GET `(200)` with no query matches will be an empty array.

`/wrp/{identifier}` (GET):

A GET endpoint for requesting a singular `WalletRelyingParty` object for a registered Wallet-Relying Party that matches the `identifier` given in the API request. Response is a signed JWT.

The response body in case of no matching WRP will be a `(404)`.

`/wrp/check-intended-use` (GET):

A dedicated check endpoint for allowing a highly specialised endpoint for making narrowed-down `Intended use` related queries from the Registry with seven optional parameters (see the [API specification](api/ts5-openapi31-registrar-api.yml) for details). The query parameters of the basic `/wrp` endpoint can be used to have the same outcome, but this endpoint provides a JWS-signed boolean `200 TRUE` or `200 FALSE` response, based on if the queried parameter set can be found in `Intended use` information among the registered `WalletRelyingPartyService` in the Registry. The response SHALL take also into account the validity status of the intended use - in case a matching intended use is registered, but its `revokedAt` value reveals state of revocation at time of query the response SHALL be `200 FALSE`.

Endpoint provides an `(404)` in case the queried identifier is not registered in the registry.

`/wrp/{identifier}/services/{serviceIdentifier}` (GET):

An endpoint for requesting a Wallet Relying Party payload isolated to a specific serviceIdentifier of a registered `WalletRelyingPartyService`.  Retrieves the parent Wallet Relying Party record matching the '{identifier}', but slices the `walletRelyingPartyService` array down so it returns ONLY the  single service instance matching the provided `{serviceIdentifier}` value.

The response body in case of no matching WRP or Wallet-Relying Party Service will be a `(404)`.

The OpenAPI 3.1 compatible REST API methods for the above are provided in Annex A.2

#### 3.1.3 Protection against DDOS attacks and accidental overuse of the GET methods

The API implementation SHALL take into consideration the vulnerabilities that an open, comprehensive query interface enables for both malicious or non-malicious users of the interface. First well-known vulnerability is sensitivity for Distributed Denial-of-Service (DDoS) attacks, the other valid one especially for the GET/wrp endpoint is the server load that very complex query parameter combinations from badly planned or non-intended/accidental misuse of the query mechanism can cause at the Registrar's server-side solution.

##### DDoS attack protection guidelines

Following policy/recommendation SHOULD be implemented (with solution-fitted combinations) in the national Registry API implementations to protect the API from DDoS attacks:

- Use of **a Cloud-based DDoS Protection Service/CDN** as the best first line of defense for volumetric attacks.
- Use of an **API Gateway or Load Balancer with Rate Limiting** is crucial for fight against application-layer attacks targeting the API.
- Deploy a **Web Application Firewall (WAF)** to protect against other application-layer threats and to complement rate limiting.
- Ensure your infrastructure is scalable by using e.g. **Load Balancers** to handle legitimate bursts and some attack traffic.
- Utilise **Caching** heavily for the GET endpoints to reduce backend load - many responses might be static or change infrequently, and caching the responses at the CDN, load balancer or application level means the API logic and database will receive less requests.
- Have robust **API monitoring** for request rates, latency, error rates, server resource utilisation and source IP addresses with proper alerting in place.
- Utilise **network segmentation** - e.g., isolate the API servers in a private subnet behind the WAF, and from the actual Registrar database to improve robustness of your network architecture against hostile attacks.

##### Protection against unintentional misuse

The implementers SHOULD consider how to limit the load of the API from perfectly legal but unintentionally complex or frequent API calls to the query endpoints. Possible solutions for this are:

- The GET endpoints SHOULD be provided with e.g. rate limiter for calls coming in from an individual IP address.
- The GET/wrp endpoint is an example of an API method that allows throwing a lot of computational load for a server serving data from a potentially large database of Wallet-Relying Party information via requesting unnecessarily complex query parameter combinations. Best practices for limiting the number of query parameters in a valid API call SHOULD be tested with multiple Wallet Solutions - with an outcome as a documented guideline for proper use of the Registry API. Improperly configured API calls can be rejected at selected level of the backend architecture.

The Registrar SHALL publish in their respective API documentation what limits it has configured regarding rate limits for legal use, or use of the query parameters. E.g., it could be that the API allows only 3 calls per minute from each IP address, and/or queries with total of 4 parameters (both values are examples - actual limits must be tested during the API implementation and test phases).

## 4 References

| Reference                              | Description                                  |
|----------------------------------------|----------------------------------------------|
| [Regulation]                           | [European Digital Identity Regulation (EU 910/2014)](https://eur-lex.europa.eu/eli/reg/2014/910/oj/eng)  |
| [CIR for Relying Party Registration]   | [Commission Implementing Regulation (EU) 2025/848 of 6 May 2025 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the registration of wallet-relying parties](http://data.europa.eu/eli/reg_impl/2025/848/oj)  |
| [CIR 2026/1730] | [Commission Implementing Regulation (EU) 2026/1730 of 15 July 2026 amending Implementing Regulation (EU) 2025/848 as regards applicable standards and specifications](http://data.europa.eu/eli/reg_impl/2026/1730/oj) |
| [CIR for BRIS]                         | [Commission Implementing Regulation (EU) 2021/1042 on technical specifications and procedures for the system of interconnection of registers](https://eur-lex.europa.eu/eli/reg_impl/2021/1042/oj)      |
| [Common Set of Relying Party Information to be Registered]    |       [The European Commission Technical Specification on Common Set of Relying Party Information to be Registered](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md)         |
| [Provider information specification]                            | [The European Commission Technical Specification of systems enabling the notification and subsequent publication of Provider information](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts2-notification-publication-provider-information.md) |
| [Specification of Common Interface for Data Deletion Requests] |  [The European Commission Specification of Common Interface for Data Deletion Requests to Relying Parties](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts7-common-interface-for-data-deletion-request.md)   |
|  [Specification of interfaces and formats for the catalogue of attributes and the catalogue of attestations]   |  [The European Commission Specification for interfaces and formats for the Catalogue of Attributes and the Catalogue of Attestations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md) |
| [ETSI TS 119 475]                      | [ETSI TS 119 475 V1.2.1 Electronic Signatures and Trust Infrastructure (ESI); Relying Party attributes supporting EUDI Wallet user's authorisation decisions](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/287)                                     |
| [ETSI TS 119 612]                      | [ETSI TS 119 612 V2.4.1 Electronic Signatures and Trust Infrastructure (ESI); Trusted Lists](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/41)                                     |
| [ETSI EN 319 412-1]                    | [ETSI EN 319 412-1 V1.6.1 Electronic Signatures and Trust Infrastructure (ESI); Certificate Profiles; Part 1: Overview and common data structures](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/143)                                     |
| [ISO8601-1]                            | [ISO 8601-1:2019 Date and Time - Representations for information interchange - Part 1: Basic rules](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/405)   |

## Annex A

### A.1 JSON Schema (normative)

The file [`ts5-json-common-rp-data-model.json`](api/ts5-json-common-rp-data-model.json) contains the JSON schema definitions corresponding to the Data Model specified in [Section 2](#2-data-model) above. It is a Wallet-Relying Party Registration -specific subset of the full data model defined in [Provider information specification].

### A.2 OpenAPI Specification - read-only methods (normative)

The YAML file [`ts5-openapi31-registrar-api.yml`](api/ts5-openapi31-registrar-api.yml) contains the [OpenAPI](https://spec.openapis.org/oas/latest.html) specification of the JSON and REST based application programming interfaces described in [Section 3](#3-common-application-programming-interface). Since version 1.6 the API contains only open access (GET) methods. The API version numbering follows the TS5 version number on which it is based.

### A.3 OpenAPI Specification - write methods (informative)

The YAML file [`ts5-openapi31-write-api.yml`](api/ts5-openapi31-write-api.yml) contains the non-normative write-method (POST, PUT, DELETE) specific [OpenAPI](https://spec.openapis.org/oas/latest.html) specification of the JSON and REST based application programming interfaces described in specification [ts5-api-write-methods](./ts5-write-api-for-rp-registration-information.md). The write API version numbering follows the version number of [ts5-api-write-methods](./ts5-write-api-for-rp-registration-information.md).

### A.4 XML Schema (informative)

The file [`ts5-xsd-common-rp-data-model.xsd`](api/ts5-xsd-common-rp-data-model.xsd) contains the XML schema definitions corresponding to the Data Model specified in [Section 2](#2-data-model).
