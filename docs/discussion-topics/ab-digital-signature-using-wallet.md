Version 0.7, updated 5 June 2026


[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/661)


# Topic AB - Digital Signature using the EUDI Wallet (New)

### Legal notice: All legal information and excerpts documented in Chapter 2 are based on the European Digital Identity Regulation (EU) 2024/1183 and the current public consultation draft of the Commission Implementing Regulation for integrity and core functionalities. The latter is undergoing changes due to consultation process, and thus this document may need modification after the publication and approval of the final CIR.


## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is related to a new discussion topic at the European Digital Identity Cooperation Group, related to electronic signature and electronic seal with the EUDI Wallet.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_Electronic signing of documents or data, allowing Users to create legally recognized qualified electronic signatures and seals._

while the reason why Topic AB is addressed is​ as follows:

_Revisit Digital signature using wallet as ETSI and CSC have released new versions of rQES-related specifications._ 



### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document. In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements related to the topic.
- Chapter 3 summarises the current state of discussion and the ARF's concept, as well as lists related HLRs. The ARF version referenced in this discussion paper is 2.8.0. 
- Chapter 4 discusses open issues and questions.
- Chapter 5 will, after completion of the discussion, present additions and changes that will be made to HLRs as a result of the discussions.
- Chapter 6 will, after completion of the discussion, present additions and changes that will be made to ARF main text or Technical Specifications as a result of the discussions.

### 1.4 Abbreviations and definitions

The table below presents key abbreviations and definitions used in this document.

| **Acronym** |                **Meaning**                           | 
|-------------------------|------------------------------------------------------|
|     DA      | Driving Application, as defined by ETSI ESI         | 
|     DTBS    | Data To Be Signed, as defined by ETSI ESI | 
|     RSSP    | Remote Signing Server Provider, as defined by ETSI ESI  |  
|     SCA     | Signature Creation Application, as defined by ETSI ESI    |  
|     SIC     | Signer Interaction Component, as defined by CEN EN 419 241-2       | 
|     SAP     | Signature Activation Protocol, as defined by CEN EN 419 241-2 |
|     SAD     | Signature Activation Data, as defined by CEN EN 419 241-2 |
|     QES     | Qualified Electronic Signature |
|     rQES    | Remote Qualified Electronic Signature |
|     QSCD    | Qualified Signature Creation Device |
|     QTSP    | Qualified Trust Service Provider |

## 2 Legal Requirements Related to Electronic Signature with Wallet

The following legal texts impose requirements related to electronic signature and electronic seal with the EUDI Wallet: 
- [European Digital Identity Regulation](https://eur-lex.europa.eu/eli/reg/2024/1183/oj),
- [CIR for integrity and core functionalities](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng)
- [CIR amendment draft](https://ec.europa.eu/info/law/better-regulation/have-your-say/initiatives/16112-European-Digital-Identity-Wallet-standards-and-technical-specifications-update-_en)

Below sections recap the respective legal requirements from these sources.

### 2.1 The European Digital Identity Regulation about Electronic Signature with Wallet

The following requirements in the [European Digital Identity Regulation] are related to electronic signature and electronic seal using the Wallets:

1. A Wallet Solution **shall** "enable" the User to sign and seal with a qualified signature or seal.
2. A Wallet Solution **shall** support common specifications of protocols and interfaces for certificate issuance and signature/seal creation.
3. Technical specifications of (above mentioned) protocols and interfaces for certificate issuance and signature/seal creation with the Wallet Solutions **shall** be made available.
4. A Wallet Solution **shall** enable natural persons to sign free-of-charge.
5. A Wallet Solution **may** limit use of signing functionality to "non-professional purposes", with "proportionate measures".
6. Wallet Solutions **shall** enable authorisation of signature creation (as an act of "strong user authentication").

Below are the actual excerpts, including the recitals and the articles that establish these requirements.

_Recital (19)_ 

_European Digital Identity Wallets should also allow users to create and use qualified electronic signatures and seals which are accepted across the Union. Once on-boarded to a European Digital Identity Wallet, natural persons should be able to use it to sign with qualified electronic signatures, by default and free of charge, without having to go through any additional administrative procedures._


_Article 5a(4)(e)_

_European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, transparent, and traceable by the user, to [...] sign by means of qualified electronic signatures or seal by means of qualified electronic seals;_ 

_Article 5a(5)(a)(i)_ 

_European Digital Identity Wallets shall [...] support common protocols and interfaces [...] for issuance of [...] qualified and non-qualified certificates to the European Digital Identity Wallet;_ 

_Article 5a(5)(a)(xi)_

_European Digital Identity Wallets shall [...] support common protocols and interfaces [...] for the creation of qualified electronic signatures or electronic seals by means of qualified electronic signature or electronic seal creation devices;_

_Article 5a(5)(g)_

_European Digital Identity Wallets shall [...] offer all natural persons the ability to sign by means of qualified electronic signatures by default and free of charge._

_Article 5a(5)_

_[...] Notwithstanding point (g) of the first subparagraph, Member States may provide for proportionate measures to ensure that the use of qualified electronic signatures free-of-charge by natural persons is limited to non-professional purposes._

_Article 5f(2)_
_Where private relying parties that provide services [...] are required by Union or national law to use strong user authentication for online identification or where strong user authentication for online identification is required by contractual obligation, including in the areas of transport, energy, banking, financial services, social security, health, drinking water, postal services, digital infrastructure, education or telecommunications, those private relying parties shall [...] upon the voluntary request of the user, also accept European Digital Identity Wallets that are provided in accordance with this Regulation._

### 2.2 CIRs about Electronic Signature

The following requirements from the Commission's Implementing Regulations ([CIR for integrity and core functionalities] and [CIR amendment draft]) are applicable to electronic signature and seals using the Wallet:

1. QSCD may be local (embedded in a Wallet Solution), external (eg. as an external smart card) or remote (eg. as a remote HSM). A Wallet Solution **shall** support at least one option; the Wallet Solution  provider **may** choose wchich options to support.
2. SCA may be provided either by Wallet Providers, by a QTSP or by a Relying Party. A Wallet Solution **shall** support at least one option; the Wallet Provider **may** choose wchich options to support.
3. SCA may be integrated into the Wallet Solution or external to the Wallet. A Wallet Solution **shall** support at least one option; the Wallet Provider **may** choose wchich options to support.
4. SCA **shall** enable provision of "data to be signed" by both: a (Wallet Unit) User and a Relying Party. If SCA is integrated into a Wallet Solution, the Wallet Solution **shall** support requesting a signature creation directly to the Wallet Unit by both again: the User ("user-provided data") and a Relying Party ("relying party-provided data"). This entails a requirement to **make available "common protocols and interfaces" for this purpose, and support them by Wallet Solutions**.
5. A Wallet Solution **shall** support at least PAdES signature format. Other formats may be supported optionally.
6. When an SCA is integrated in a Wallet Solution, and the Wallet Solution uses a remote signature service (RSSP) to provide signing/sealing, it **shall** support CSC API (**this requirement is removed from by the [IA amendment proposal]**).
7. A Wallet Solution **shall** enable natural persons to sign free-of-charge.
8. A Wallet Solution **may** limit use of signing functionality to "non-professional purposes", with "proportionate measures".

Below are the actual excerpts, including the recitals and the articles that establish these requirements.

_Recital (12)_ 

_For a wallet user to be able to sign electronically, a qualified certificate, which is bound to a qualified electronic signature creation device, should be issued to the wallet user. The wallet user should have access to a signature creation application. While the issuance of qualified certificates is a service of qualified trust service providers, wallet providers or other entities should be able to provide the other components. For instance, qualified electronic signature creation devices may be managed by qualified trust service providers as a service or they may be local to the wallet user’s device, for example, as a smartcard. Similarly, signature creation applications may be integrated in the wallet instance, be a separate app on the wallet user’s device or be provided remotely._

_Article 11(1)_

_Wallet providers shall ensure that wallet users are able to receive, qualified certificates for qualified electronic signatures or seals which are linked to qualified signature or seal creation devices that are either local, external, or remote in relation to the wallet instances._ 

_Article 11(2)_

_Wallet providers shall ensure that wallet solutions are able to securely interface with one of the following types of qualified signature or seal creation devices: local, external, or remotely managed qualified signature or seal creation devices for the purposes of using the qualified certificates [...]._

_Article 11(3)_
_Wallet providers shall ensure that wallet users who are natural persons have, at least for non-professional purposes, free-of-charge access to signature creation applications which allow the creation of free-of-charge qualified electronic signatures using the certificates referred to in paragraph 1._

_Article 12(1)_

_The signature creation applications used by wallet units may be provided either by wallet providers, by providers of trust services or by wallet-relying parties._

_Article 12(2)_

_Signature creation applications shall have the following functions:_
_(a) signing or sealing wallet user-provided data;_
_(b) signing or sealing relying party-provided data;_
_(c) creating signatures or seals in accordance with at least the mandatory formats referred to in Annex IV;_
_(d) informing wallet users about the result of the signature or seal creation process._

_Article 12(3)_ _(Editor's note: IA amdendment draft modifies this clause.)_

_The signature creation applications may either be integrated into or be external to wallet instances. Where signature creation applications rely on remote qualified signature creation devices and where they are integrated into wallet instances, they shall support the application programming interface referred to in Annex IV._

For the legal requirement above (Article 12(3)), there is a **pending proposal** ([CIR amendment draft]) to change the text to as below:

_The signature creation applications may either be integrated into or be external to wallet instances._

_Annex IV_ _(Editor's note: [CIR amendment draft] modifies this clause.)_

_1.Mandatory signature or seal format:_
_PAdES (PDF Advanced Electronic Signature) as specified in ETSI EN 319 142-1 V1.1.1 (2016-04); Electronic Signatures and Infrastructures (ESI); PAdES digital signatures; Part 1: Building blocks and PAdES baseline signatures._

_2. List of optional signature or seal formats:_
 
 _(a) XAdES as specified in ‘ETSI EN 319 132-1 V1.2.1 (2022-02) Electronic Signatures and Infrastructures (ESI); XAdES digital signatures; Part 1: Building blocks and XAdES baseline signatures (XAdES)’ for signing of XML format;_
 
 _(b) JAdES as specified in ‘ETSI TS 119 182-1 V1.2.1 (2024-07) Electronic Signatures and Infrastructures (ESI); JAdES digital signatures; Part 1: Building blocks and JAdES baseline signatures’ for signing of JSON format;_
 
 _(c) CAdES (CMS Advanced Electronic Signature) as specified in ‘ETSI EN 3191 22-1 V1.3.1 (2023-06) Electronic Signatures and Infrastructures (ESI); CAdES digital signatures; Part 1: Building blocks and CAdES baseline signatures’ for the signing of CMS format;_
 
 _(d) ASiC (Associated Signature Container) as specified in ‘ETSI EN 319 162-1 V1.1.1 (2016-04) Electronic Signatures and Infrastructures (ESI); Associated Signature Containers (ASiC); Part 1: Building blocks and ASiC baseline containers and ETSI EN 319 162-2 V1.1.1 (2016-04) Electronic Signatures and Infrastructures (ESI); Associated Signature Containers (ASiC); Part 2: Additional ASiC containers’ for the signing of containers._

_3. Application programming interface:_

_— Cloud Signature Consortium (CSC) specification v2.0 (20 April 2023)._

 For the legal requirement above (Annex IV), there is a pending proposal ([CIR amendment draft]) to change to the text as below:

_1. Mandatory signature or seal format:_

_(a) PAdES (PDF Advanced Electronic Signature) as specified in ETSI EN 319 142-1 V1.2.1 (2024-01); Electronic Signatures and Infrastructures (ESI); PAdES digital signatures; Part 1: Building blocks and PAdES baseline signatures._



## 3 State of Discussion and Current Concept  

### 3.1 Use Cases and Wallet Functionality

Summarising the legal requirements, there are two general use cases for the Wallet in the context of electronic signature, mandated by eIDAS: 
- (1) "enabling" the QES, as in Article 5a(4)(3) and other, 
- (2) as a means of strong user authentication for QES, as in Article 5f(2). 

These requirements can be translated to the following Wallet Solution's (possible) functions:  
- the Wallet Unit is used to initiate and drive the signing process,
- the Wallet Unit stores locally (local QSCD) or provides access to (control over) an externally stored signing/sealing certificate and a key-pair (remote QSCD),
- the Wallet Unit is used to generate signature/seal locally or interacts with a RSSP / QTSP,
- the Wallet Unit provides with an embedded SCA or interacts with an external SCA (provided by the Wallet Provider or a QTSP or a RP),
- (for remote signatures) the Wallet Unit is used to authorise signature creation (plays a role of SIC) or interacts with a RSSP / QTSP that carries out the authorisation process.

It does not mean that all the above functions shall be supported mandatorily by Wallet Solutions - it defines the scope for discussion and potential need for standardisation works.

### 3.2 Architectural Options

The following architectural models are at stake:
- **Wallet-centric model**, where the Wallet Unit drives the signing process and is a central point of interactions with other actors or components,
- **QTSP-centric model**, where the QTSP drives the signing process and and is a central point of interactions with other actors or components,
- **RP-centric model**, where the RP drives the signing process and and is a central point of interactions with other actors and components.

The above models can be varied taking into account various aspects, such as:
- SCA provider (a Wallet Provider, a RSSP/QTSP, a Relying Party),
- SCA placement (embedded in a Wallet Unit or a Wallet Instance, external same-device, external remote),
- Driving Application placement (at a RSSP/QTSP, at a Relying Party, in a Wallet Solution),
- Signing initiator (a Wallet User, a Relying Party),
- QSCD type and placement (local, external, remote),
- Signature authorisation process and implementation, including SIC type and placement (with or w/o use of the Wallet Unit, with or w/o use of presentation protocol),
- Certificate's life-time and life-cycle (long-term certificates vs one-time certificates and "on-the-fly" signatures).

### 3.3 Signing Process

There are three main steps in the signing/sealing process:
- certificate (signing/sealing credentials) issuance,
- signing/sealing initiation (signature/seal creation request),
- signature/seal creation, including signature/seal creation authorisation.

Certificate issuance requesting (by a Wallet User) options:
- in/via the Wallet Unit,
- by sending a request to a RSSP/QTSP (directly or via a DA).

Signing initiation options:
- by a Wallet User
  - in a Wallet Unit ("Wallet-channelled"),
  - by sending a signature creation request to a RSSP/QTSP directly, eg. from a RSSP's/QTSP's service on-line or application ("QTSP-channelled"),
  - by sending a request via a RP, eg. from RP's service on-line or application ("RP-channelled"), 
- by an RP, by sending a signature creation request to a Wallet Unit ("Wallet-channelled") or directly to a RSSP/QTSP ("QTSP-channelled").

Signature authorisation options (in case of remote signature):
- with a Wallet Unit acting as SIC (in case of remote signature creation),
- with other means, as per QTSP policy and solution.

### 3.4 Certificate Lifetime

The solution architecture and implementation details may differ, depending on the certificate lifetime. There are two main scenarios relevant in the discussion: 
- with use of a long-term certificate - where the user requests certificate issuance that will be next used to perform multiple signatures over longer time (such as one or two-year period),
- with use of a short-term / one-time certificate ("on-the-fly" signature) - where in a single process / session, all steps related to signature are carried out - requesting and issuing a certificate (a one-time certificate), signature authorisation, signature creation, certificate revocation.

### 3.5 Wallet Interfaces

Following the legal requirements and all architectural and process options (presented in Sections 3.1 - 3.4), various interfaces may be distinguished, such as:
- (1) Wallet <-> RSSP/QTSP  (for certificate issuance and management, requesting signature creation, signature creation authorisation) 
- (2) Wallet <-> RP (for requesting signature creation by a RP to a Wallet) 
- (3) Wallet <-> SCA interface (in case an SCA is not integrated in the Wallet Solution) 
- (4) Wallet <-> QSCD (in case QSCD is local) 
- (5) Wallet <-> SAM (for signature authorisation in case a Wallet is used as SIC in a remote signature scenario)

Support of given interfaces is Wallet Provider's implementation choice, that depends on various aspects such as national signature scheme (using the Wallets), actors, modes of operations, architecture, technical components, etc.

It means that not all the interfaces shall be mandatorily supported by a Wallet Solution. However, to enable all necessary implementation options, it is desired that Wallet Providers are   made available related technical specifications for these interfaces. 

At the same time, following the legal requirements, to ensure minimal required interoperability level, **all Wallet Solutions shall support (at minimum) a common specification for wallet <-> RP interface (2)**. 
In addition, it is strongly desired to standardise and support by all Wallet Solutions an interoperable interface for signature authorisation with the wallet too - wallet <-> SAM (5) or as a part of wallet <-> RSSP/QTSP (1). 

### 3.6 Protocols and Technical Specifications

The related technical specifications for Wallet Solutions to support electronic signature and sealing are generally delivered by SDOs (ETSI ESI and CSC). The key specifications are:

- [ETSI TS 119 432] (will turn to EN 319 432 in the future)
- [CSC API]
- [CSC DM]
- [CSC Bindings]

As a general rule, the interfaces (mentioned in section 3.5) should, where applicable, rely on or follow already defined mechanisms envisioned for EUDI wallets - especially related to issuance and presentation of verifiable credentials. This means that wallet <-> RP and wallet's interface for signature authorisation (wallet <-> SAM or wallet <-> RSSP/QTSP for SAP handling), may (and should preferably) use the presentation protocols envisioned in ARF, with dedicated "transactional data" parameters (in OID4VP specification, this parameter is named 'transaction_data') and dedicated Attestations ("QES Attestation"). For these Attestations, dedicated rulebooks shall be made available too.
This is worth to clarify, that PID cannot be used for these purposes, as it is not envisioned to handle transactional data.

For other interfaces, although it is useful to have them specified and supported by Wallet Units to improve interoperability, their implementation and technical specifications are at discretion of Wallet Providers eventually and their agreements with involved RSSPs/QTSPs or other actors.

In any case, the related specifications are still under development (in particular ETSI TS 119 432 / EN 319 432), and **may provide more than one implementation options for each the interfaces** at stake, with or w/o use of the presentation protocols or "transactional data" parameter.

The goal for the development of the specifications is to: enable all mandatory and desired options,​ give the choice to Wallet Providers to choose suitable options to build preferred architectures, and **standardise and mandate selected options** to ensure **interoperability where necessary** (wallet <-> RP interface for signature requesting and wallet's
interface for signature authorisation at minimum)​.

### 3.7 List of  HLRs

This section recaps all applicable HLRs, basing on ARF 2.8.0.

#### 3.4.1 Topic 16 - Signing documents with a Wallet Unit

| **Index** |                **Requirement specification**                 | 
|-----------|--------------------------------------------------------------|
| QES_01 | Wallet Providers SHALL ensure that each User has the possibility to receive a qualified certificate for Qualified Electronic Signatures, bound to a QSCD, that is either local, external, or remotely managed in relation to the Wallet Instance. |
| QES_02 | Wallet Providers SHALL ensure that each User who is a natural person has, at least for non-professional purposes, free-of-charge access to a Signature Creation Application which allows the creation of free-of-charge Qualified Electronic Signatures using the certificates referred to in QES_01. Wallet Providers SHALL ensure that: - The Signature Creation Application SHALL, as a minimum, be capable of signing or sealing User-provided data and Relying Party-provided data. - The Signature Creation Application SHALL be implemented as part of a Wallet Solution or external to it (by providers of trust services or by Relying Parties). - The Signature Creation Application SHALL be able to generate signatures or seals in formats compliant with at least the mandatory formats referred to in QES_08. *Note: a) Signature Creation Application (SCA): see definition in [ETSI TS 119 432]. 2) If the SCA is external to the Wallet Solution, it may be for example a separate mobile application, or be hosted remotely, for instance by the QTSP or by a Relying Party.* |
| QES_03 | For the use of the qualified certificate referred to in QES_01, Wallet Providers SHALL ensure that a Wallet Unit implements secure authentication of the User, as well as signature or seal invocation capabilities, as a part of a local, external or remote QSCD.|
| QES_04 | Wallet Providers SHALL enable their Wallet Units to interface with QSCDs using protocols and interfaces necessary for the implementation of secure User authentication and signature or seal functionality. *Note: In a Relying Party-centric flow, the remote QTSP will likely be selected by the Relying Party, which implies the QSCD is managed by the remote QTSP. In a Wallet Unit-driven flow, the User should be able to choose the QSCD.* |
| QES_05 | Wallet Providers SHALL enable their Wallet Units to be used for User enrolment to a remote QES Provider (i.e., a QTSP offering remote QES), except where the Wallet Unit interfaces with local or external QSCDs. |
| QES_06 | Wallet Providers SHALL ensure that their Wallet Solution supports at least one of the following options for remote QES signature creation: - remote QES creation through secure authentication to a QTSP signature web portal, - remote QES creation channelled by the Wallet Unit, - remote QES creation channelled by a Relying Party. |
| QES_07 | Wallet Providers SHALL ensure that, where a Signature Creation Application relies on a remote Qualified Signature Creation Device and where it is integrated into a Wallet Unit, it supports the Cloud Signature Consortium API Specification 2.0 [CSC API]. |
| QES_08 | Wallet Providers SHALL ensure that their Wallet Units are able to create signatures or seals in accordance with the mandatory PAdES format as specified in [ETSI EN 319 142-1[ V1.1.1 (2016-04). In addition, Wallet Providers SHOULD ensure that their Wallet Units are able to create signatures or seals in accordance with the following formats: - XAdES as specified in [ETSI EN 319 132-1] V1.2.1 (2022-02), - JAdES as specified in [ETSI TS 119 182-1] V1.2.1 (2024-07), - CAdES as specified in [ETSI EN 319 122-1] V1.3.1 (2023-06), and - ASiC as specified in [ETSI EN 319 162-1] V1.1.1 (2016-04) and [ETSI EN 319 162-2] V1.1.1 (2016-04). |
| QES_09 | Empty |
| QES_10 | Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit and is used to generate signatures or seals of the representation of the document or data to be signed or sealed, the Wallet Unit presents the representation of the document or data to be signed or sealed to the User. |
| QES_11 | Where the Signature Creation Application is implemented as part of the Wallet Unit, a Wallet Unit SHALL compute the hash or digest of the document or data to be signed through its Signature Create Application component. |
| QES_12 | A Wallet Unit SHALL be able to create a signature over a document or data to be signed, either by using a local QSCD or by interfacing with a remote QES Provider. *Note: a local signing application is on-device. It may either be embedded in the Wallet Unit or be an external application.* |
| QES_13 | A Wallet Unit SHALL provide a log of transactions related to qualified electronic signatures or seals generated by or through the Wallet Unit, allowing the User to view the history of previously signed data or documents, according to requirement DASH_04 in [Topic 19](../annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2312-topic-19-user-navigation-requirements-dashboard-logs-for-transparency). *Note: If the signature is generated by a remote Signature Creation Application, the Wallet is at minimum used to authenticate the User to the remote QTSP and to obtain the User's consent for the usage of the private signing key. The logs then record information about these processes.* |
| QES_14 | A Wallet Unit SHALL enable the User to explicitly authorise the creation of a qualified electronic signature or seal through their Wallet Unit. |
| QES_15 | In remote signature creation scenarios, a Wallet Unit SHALL verify that the qualified electronic signature or seal creation device is part of a qualified service, which is carried out by a qualified trust service provider. |
| QES_16 | A Wallet Unit SHOULD support multiple-signing scenarios, where multiple signatories are required to sign the same document or data. |
| QES_17 | A Wallet Unit SHALL provide a signature creation confirmation upon the creation of a qualified electronic signature, informing the User about the outcome of the signature creation process. *Note: See also QES_17a.* |
| QES_17a | If the Signature Creation Application is external to the Wallet Unit, after the User authorises the usage of the private signing key, the Signature Creation Application SHALL return the outcome of the signature creation process to the Wallet Unit. |
| QES_18 | Wallet Providers SHALL configure at least one default qualified signing service in the Wallet Unit. |
| QES_19 | Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit, a Wallet Unit supports [ETSI TS 119 101] when using signing keys managed by the QSCD, whether locally, externally, or remotely in relation to the Wallet Instance. |
| QES_20 | Empty |
| QES_21 | Empty |
| QES_22 | Empty |

#### 3.4.2 Other Topics

At this stage, no HLRs from other topics were identified as applicable. 

## 4 Discussion 

### 4.1 RP-driven flow and Wallet <-> RP Interface

Following the legal requirements (presented in Section 3), the conclusion is that it is necessary to provide a "common protocol and interface" for Relying Parties to request signature creation to the Wallet Units. Such a standardised interface is currently being developed by ETSI ESI ([ETSI TS 119 432] and underpinning CSC specification).

One of the possible technical approach is that this interface uses OID4VP presentation protocols (with "transactional data" parameter) as a transport mechanism to provide signature request data to a Wallet Unit. However other options are possible too, and may defined by SDOs. **In any case, the intention is to indicate a specification and mandate support by all Wallet Solutions (a new HLR will be proposed).** 

### 4.2 Signature Creation Authorisation Interface

Authorisation (aka "activation") of a signature creation is considered as an act of strong user authentication. Therefore, the Wallet Solutions shall support such functionality, as mandated by Article 5f(2) of [European Digital Identity Regulation]. **This requirement imposes a need for a dedicated specification for an appropraiate Wallet Unit interface for this purpose.**

If a Wallet Provider chooses to provide the signature functionality basing on a remote service (a remote QSCD), it will entail compliance with CEN EN 419 241-2. This specification defines SAP protocol, that is used to authorise (activate) remote signature creation by the signatory (a Wallet User in this context), ensuring sole control of the User. 

There are two general options for signature creation authorisation:
- directly with a Wallet Unit (Wallet Unit acting as SIC, communicating with a QTSP/SAM),
- with other means (other SIC, suitable for QTSP).

Although the liability on signature creation compliance is on the QTSP, the Wallet Unit shall follow applicable requirements to enable compliance of the involved QTSP. Therefore, it seems to be desired to make available (eg. in ETSI TS 119 432) the specification of wallet<->SAM interface (or more generally wallet<->RSSP/QTSP for SAP handling), where SAD is handled with OID4VP presentation request and with the use of a dedicated "transaction_data" parameter. 

### 4.3 Rendering of Display Messages  

As outlined in Sections 4.1 and 4.2, a presentation protocol with "transactional data" parameter may be used in two scenarios:
- signature creation requesting,
- signature creation authorisation (activation).

It entails a need of specification of rendering, to define the way the messages displayed to the Wallet Unit User are rendered (eg. display of the reference to the document, signing session or an involved RSSP/QTSP) - analogically to ARF's [TS12] in relation to SCA for payments. Such a specification should be provided by ETSI (and CSC possibly) - the currently available documents already contain partial specifications (i.a. in Annex A and B of [ETSI TS 119 432] and in [CSC Bindings]), but needs completion possibly.

Therefore a question arises, **what would be (high-level) requirements for rendering and display of user messages, for instance what information items would be necessary.**

### 4.4 Signature Attestations and Rulebooks

As outlined in Sections 4.1 and 4.2, a presentation protocol with "transactional data" parameter may be used in two scenarios:
- signature creation requesting,
- signature creation authorisation (activation).

To realise these scenarios, a dedicated Attestations should be used, and therefore appropriate rulebooks shall be delivered (by the market).

### 4.5 On-The-Fly Signatures

One of the scenarios desired by the market is related to use of short-term / one-time certificates and "on-the-fly" signatures. This refers to the situation, where all steps related to certificate issuance and signature creation are carried out in a single flow: requesting and issuing a certificate (a one-time certificate), signature requesting, signature authorisation, signature creation, certificate revocation.

However, realisation of this scenario with the EUDI Wallet might be challenging. As PID is not envisioned to handle transactional data, the full process should always involve use of PID for user identification and authentication (at least) for certificate issuance, as well as a dedicated Attestation ("QES Attestation") for signature creation requesting or authorisation (with use of "transactional data" parameter). The QES Attestation needs to be issued prior to signature requesting. 

Therefore a question arises, **how this scenario is important for Wallet Providers, and if it should be further explored and supported by a specification.**

### 4.6 Non-professional Use

[European Digital Identity Regulation] allows Wallet Providers to limit use of signing functionality of their Wallet Solutions to "non-professional purposes" only, with "proportionate measures". At the same time, it leaves this aspect fully to the Member States, including development of the concepts and technical specifications for implementation if needed. 

Although this is a vital aspect, it is out of the scope of ARF and there is no intention (nor mandate) to provide/mandate provision of any technical specification here. At the same time, it is still possible to develop standards by SDOs at their own discretion too.   


## 5 Proposals of Changes of HLRs

| **Index** |                **Requirement specification**                 |   Proposal      |
|-----------|--------------------------------------------------------------|-----------------|
| QES_01 | Wallet Providers SHALL ensure that each User has the possibility to receive a qualified certificate for Qualified Electronic Signatures, bound to a QSCD, that is either local, external, or remotely managed in relation to the Wallet Instance. | Keep as-is |
| QES_02 | Wallet Providers SHALL ensure that each User who is a natural person has, at least for non-professional purposes, free-of-charge access to a Signature Creation Application which allows the creation of free-of-charge Qualified Electronic Signatures using the certificates referred to in QES_01. Wallet Providers SHALL ensure that: - The Signature Creation Application SHALL, as a minimum, be capable of signing ~~or~~ **and** sealing User-provided data and Relying Party-provided data. - The Signature Creation Application SHALL be implemented as part of a Wallet Solution or external to it (by providers of trust services or by Relying Parties). - The Signature Creation Application SHALL be able to generate signatures or seals in formats compliant with at least the mandatory formats referred to in QES_08. *Note: a) Signature Creation Application (SCA): see definition in [ETSI TS 119 432]. 2) If the SCA is external to the Wallet Solution, it may be for example a separate mobile application, or be hosted remotely, for instance by the QTSP or by a Relying Party.* | Keep with proposed changes |
| QES_03 | For the use of the qualified certificate referred to in QES_01, ~~Wallet Providers SHALL ensure that a~~ Wallet Unit **SHALL** implement~~s~~ secure authentication of the User, as well as signature ~~or~~ **/** seal  ~~invocation~~ **creation requesting and authorisation**  capabilities ~~, as a part of a local, external or remote QSCD~~. | Keep with proposed changes |
| **QES_03a** | **A Wallet Unit SHALL enable Relying Parties to request signature creation directly to the Wallet Unit. The interface of the Wallet Unit for this SHOULD be based on [OID4VP] for remote mode and [ISO/IEC 18013-5] for proximity mode, and comply with [ETSI TS 119 432].** | New requirement |
| QES_04 | Wallet Providers SHALL enable their Wallet Units to interface with QSCDs using protocols and interfaces necessary for the implementation of secure User authentication and signature or seal functionality. *Note: In a Relying Party-centric flow, the remote QTSP will likely be selected by the Relying Party, which implies the QSCD is managed by the remote QTSP. In a Wallet Unit-driven flow, the User should be able to choose the QSCD.* | Remove |
| **QES_04a** | **When a Wallet Unit uses a remote QSCD for signature or seal creation, it SHALL ensure signature creation authorisation and User's sole control of the signing keys. The interface SHOULD use [OID4VP], in compliance with [ETSI TS 119 432] and [CEN EN 419 241-2]. The Wallet Provider SHOULD ensure compliance with [CEN EN 419 241-1] where applicable.** | New requirement |
| QES_05 | Wallet Providers SHALL enable their Wallet Units to be used for User enrolment to a remote QES Provider (i.e., a QTSP offering remote QES), except where the Wallet Unit interfaces with local or external QSCDs. |  Remove |
| QES_05 | ~~Wallet Providers SHALL enable their Wallet Units~~ **A Wallet Unit SHALL enable** ~~to be used for~~ User enrolment to a remote QES Provider (i.e., a QTSP offering remote QES), except where the Wallet Unit interfaces with local or external QSCDs. | Keep with proposed changes |
| QES_06 | Wallet Providers SHALL ensure that their Wallet Solution supports at least one of the following options for remote QES signature creation: - remote QES creation through secure authentication to a QTSP signature web portal, - remote QES creation channelled by the Wallet Unit, - remote QES creation channelled by a Relying Party. | Remove |
| QES_07 | ~~Wallet Providers SHALL ensure that, where a Signature Creation Application relies on a remote Qualified Signature Creation Device and where it is integrated into a Wallet Unit, it supports the Cloud Signature Consortium API Specification 2.0 [CSC API].~~ | Remove |
| **QES_07a** | **When a Wallet Unit interacts with a QTSP or a remote QES Provider to issue certificates, it SHOULD use [CSC-API], in compliance with [ETSI TS 119 432].** | New requirement |
| **QES_07b** | **When a Wallet Unit interacts with a QTSP or a remote QES Provider to create signatures or seals, it SHOULD use [CSC-API], in compliance with [ETSI TS 119 432] and [CEN EN 419 241-2]. The Wallet Provider SHOULD ensure compliance with [CEN EN 419 241-1] where applicable.** | New requirement |
| QES_08 | Wallet Providers SHALL ensure that their Wallet Units are able to create signatures ~~or~~ **and** seals in accordance with the mandatory PAdES format as specified in [ETSI EN 319 142-1[ V1.1.1 (2016-04). In addition, Wallet Providers SHOULD ensure that their Wallet Units are able to create signatures or seals in accordance with the following formats: - XAdES as specified in [ETSI EN 319 132-1] V1.2.1 (2022-02), - JAdES as specified in [ETSI TS 119 182-1] V1.2.1 (2024-07), - CAdES as specified in [ETSI EN 319 122-1] V1.3.1 (2023-06), and - ASiC as specified in [ETSI EN 319 162-1] V1.1.1 (2016-04) and [ETSI EN 319 162-2] V1.1.1 (2016-04). | Keep with proposed changes |
| QES_09 | Empty |
| QES_10 | Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit and is used to generate signatures or seals of the representation of the document or data to be signed or sealed, the Wallet Unit presents the representation of the document or data to be signed or sealed to the User. | Remove |
| **QES_10a** | **When a Relying Party sends a signature or seal creation request to a Wallet Unit, and the Wallet Solution uses a remote QES creation service, the Wallet Unit SHALL display an appropriate message to the User and ensure that User gives consent for proceeding such a request, in compliance with [ETSI TS 119 432].**  | New requirement |
| QES_11 | ~~Where the Signature Creation Application is implemented as part of the Wallet Unit, a Wallet Unit SHALL compute the hash or digest of the document or data to be signed through its Signature Create Application component.~~ | Remove |
| QES_12 | ~~A Wallet Unit SHALL be able to create a signature over a document or data to be signed, either by using a local QSCD or by interfacing with a remote QES Provider. *Note: a local signing application is on-device. It may either be embedded in the Wallet Unit or be an external application.*~~ | Remove |
| QES_13 | A Wallet Unit SHALL provide a log of transactions related to **certificate issuance**, qualified electronic signatures ~~or~~ **and** seals generated by or through the Wallet Unit, allowing the User to view the history of previously **issued certificates,** signed data or documents, according to requirement DASH_04 in [Topic 19](../annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2312-topic-19-user-navigation-requirements-dashboard-logs-for-transparency). ~~*Note: If the signature is generated by a remote Signature Creation Application, the Wallet is at minimum used to authenticate the User to the remote QTSP and to obtain the User's consent for the usage of the private signing key. The logs then record information about these processes.*~~ |  Keep with proposed changes |
| QES_14 | A Wallet Unit SHALL enable the User to explicitly authorise the creation of a qualified electronic signature or seal through their Wallet Unit. | Remove | 
| **QES_14a** | **When a Wallet Unit is used to authorise a signature or seal creation, it SHALL display an appropriate message to the User and ensure that User gives consent for signature or seal creation, in compliance with [ETSI TS 119 432].**  | New requirement |
| QES_15 | In remote signature creation scenarios, a Wallet Unit SHALL verify that the qualified electronic signature or seal creation device is part of a qualified **trust** service, which is carried out by a qualified trust service provider. **_Note: This verification entails i.a. checking presence at Trusted Lists, validation authenticity and integrity of a Trusted List._** | Keep with proposed changes |
| QES_16 | A Wallet Unit SHOULD support multiple-signing scenarios, where multiple signatories are required to sign the same document or data. | Remove |
| QES_17 | A Wallet Unit SHALL provide a signature creation confirmation upon the creation of a qualified electronic signature, informing the User about the outcome of the signature creation process. *Note: See also QES_17a.* | Keep as-is |
| QES_17a | If the Signature Creation Application is external to the Wallet Unit, after the User authorises the usage of the private signing key, the Signature Creation Application SHALL return the outcome of the signature creation process to the Wallet Unit. | Remove |
| QES_18 | Wallet Providers SHALL configure at least one default qualified signing service in the Wallet Unit. | Keep as-is |
| QES_19 | Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet ~~Unit~~ **Solution**, ~~a Wallet Unit supports~~ **it complies and is operated in compliance with** [ETSI TS 119 101] ~~when using signing keys managed by the QSCD, whether locally, externally, or remotely in relation to the Wallet Instance~~. | Keep with proposed changes |
| QES_20 | Empty | Keep as-is |
| QES_21 | Empty | Keep as-is |
| QES_22 | Empty | Keep as-is |


## 6 Additions and Changes to ARF 

A new content will be added to the ARF's main document, aiming to explain key terminology, specifications, architectures and implementation options, as discussed in this document.


## 7 References

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [European Digital Identity Regulation] | [Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework](https://eur-lex.europa.eu/eli/reg/2024/1183/oj) |
| [CIR for integrity and core functionalities] | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng) |
| [CIR amendment draft] | [Commission Implementing Regulation (EU) .../... of XXX amending Implementing Regulation (EU) 2024/2977, (EU) 2024/2979, (EU) 2024/2980 and (EU) 2024/2982 as regards applicable standards and specifications and correcting Implementing Regulation (EU) 2024/2980](https://ec.europa.eu/info/law/better-regulation/have-your-say/initiatives/16112-European-Digital-Identity-Wallet-standards-and-technical-specifications-update-_en) |
| [ISO/IEC 18013-5] | [ISO/IEC 18013-5:2021 Personal identification - ISO-compliant driving licence - Part 5: Mobile driving licence (mDL) application](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84),  |
| [OpenID4VP] | [OpenID for Verifiable Presentations 1.0](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) |
| [ETSI TS 119 432] | [Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation, v1.3.1](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/68) |
| [CEN EN 419 241-1] | [CEN EN 419 241-1: Trustworthy Systems Supporting Server Signing - Part 1: General System Security Requirements](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/101) |
| [CEN EN 419 241-2] | [CEN EN 419 241-2:2019 - Protection profile for QSCD for Server Signing](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/100) |
| [CSC API] | [Architectures and protocols for remotesignature applications, version 2.2.0.0](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/29) |
| [CSC DM] | [Data model for remote signature applications, version 1.0.0](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/403) |
| [CSC Bindings] | [CSC data model bindings, version 1.0.0](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/450) |
| [TS12] | [Specification of Strong Customer Authentication (SCA) Implementation with the Wallet](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
