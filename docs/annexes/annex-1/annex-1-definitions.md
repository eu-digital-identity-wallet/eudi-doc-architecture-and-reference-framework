---
title: "European Digital Identity Wallet"
subtitle: "ARF Annex 1 - Definitions"
...

# ANNEX 1 - Definitions

## A.1 Introduction

In the Architecture Reference Framework (ARF) many terms are used that need a
precise definition. This Annex contains the definitions of these terms.

In fact, there are three sources for these definitions:

- In the first place, the [European Digital Identity Regulation] defines several
of these terms. For convenience, these definitions are listed in [Section A.2](#a2-definitions-from-the-european-digital-identity-regulation).
- Secondly, the adopted Commission Implementing Regulations [CIR
2024/2977](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R2977),
[CIR 2024/2979](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:L_202402979),
[CIR 2024/2980](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:L_202402980),
[CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:L_202402981),
and [CIR 2024/2982](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:L_202402982)
also contain a list of definitions. Again for convenience, these definitions are
included in [Section A.3](#a3-definitions-from-the-adopted-commission-implementing-regulations)
- Thirdly, in writing the ARF, additional technical terms and corresponding
definitions are used. These are listed in [Section A.4](#a4-additional-definitions-used-in-the-arf).

## A.2 Definitions from the [European Digital Identity Regulation]

The following terms are defined in the [European Digital Identity Regulation]
and used in the ARF.

| **Term** | **Definition in [European Digital Identity Regulation]** |
|-----------|-----------|
| **Electronic attestation of attributes (EAA)** | An attestation in electronic form that allows attributes to be authenticated. |
| **Attribute** | A characteristic, quality, right or permission of a natural or legal person or of an object. |
| **Authentic Source** | A repository or system, held under the responsibility of a public sector body or private entity, that contains and provides attributes about a natural or legal person or object and that is considered to be a primary source of that information or recognised as authentic in accordance with Union law or national law, including administrative practice. |
| **Authentication** | An electronic process that enables the confirmation of the electronic identification of a natural or legal person or the confirmation of the origin and integrity of data in electronic form. |
| **Conformity Assessment Body (CAB)** | A conformity assessment body as defined in [Article 2, point 13, of Regulation (EC) No 765/2008](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:32008R0765#d1e497-30-1), which is accredited in accordance with that Regulation as competent to carry out conformity assessment of a qualified trust service provider and the qualified trust services it provides, or as competent to carry out certification of European Digital Identity Wallets or electronic identification means. |
| **Electronic attestation of attributes issued by or on behalf of a public sector body (PuB-EAA)** | An electronic attestation of attributes issued by a public sector body that is responsible for an authentic source or by a public sector body that is designated by the Member State to issue such attestations of attributes on behalf of the public sector bodies responsible for authentic sources in accordance with [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1) and with [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1). |
| **Electronic identification scheme** | A system for electronic identification under which electronic identification means are issued to natural or legal persons or natural persons representing other natural persons or legal persons. |
| **(Electronic) signature** | Data in electronic form which is attached to or logically associated with other data in electronic form and which is used by the signatory to sign. |
| **(Electronic) seal** | Data in electronic form which is attached to or logically associated with other data in electronic form to ensure the latter’s origin and integrity |
| **User** | A natural or legal person, or a natural person representing another natural person or a legal person, that uses trust services or electronic identification means provided in accordance with the [European Digital Identity Regulation]. |
| **Person Identification Data (PID)** | A set of data that is issued in accordance with Union or national law and that enables the establishment of the identity of a natural or legal person, or of a natural person representing another natural person or a legal person. |
| **Qualified Electronic Attestation of Attributes (QEAA)** | An electronic attestation of attributes which is issued by a qualified trust service provider and meets the requirements laid down in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e46-54-1). |
| **Qualified Electronic Signature (QES)** | An advanced electronic signature that is created by a qualified electronic signature creation device, and which is based on a qualified certificate for electronic signatures. |
| **Qualified Electronic Signature Creation Device (QSCD)** | Configured software or hardware used to create an electronic signature that meets the requirements laid down in [Annex II](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e38-51-1) of the [European Digital Identity Regulation]. |
| **Qualified Trust Service Provider (QTSP)** | Qualified Trust Service Provider means a trust service provider who provides one or more qualified trust services and is granted the qualified status by the supervisory body. |
|**Relying Party** | A natural or legal person that relies upon electronic identification, European Digital Identity Wallets or other electronic identification means, or upon a trust service |
| **Public Sector Body** | A state, regional or local authority, a body governed by public law or an association formed by one or several such authorities or one or several such bodies governed by public law, or a private entity mandated by at least one of those authorities, bodies or associations to provide public services, when acting under such a mandate. |

**Table 1: Definition of terms used in the ARF originating from
the [European Digital Identity Regulation]**

## A.3 Definitions from the adopted Commission Implementing Regulations

The following terms are defined in the adopted Commission Implementing
Regulations and used in the ARF. Note that small differences exist in the way in
which terms are written, for example regarding capitalisation. The table
contains the term as used in the ARF.

| **Term** | **Definition** |
|-----------|-----------|
| (Wallet) User | A user who is in control of the Wallet Unit |
| Wallet Unit | A unique configuration of a Wallet Solution that includes Wallet instances, Wallet Secure Cryptographic Applications and Wallet Secure Cryptographic Devices provided by a Wallet Provider to an individual Wallet User |
| Wallet Solution | A combination of software, hardware, services, settings, and configurations, including Wallet Instances, one or more Wallet Secure Cryptographic Applications and one or more Wallet Secure Cryptographic Devices |
| Provider of person identification data (PID Provider) | A natural or legal person responsible for issuing and revoking the person identification data and ensuring that the person identification data of a user is cryptographically bound to a Wallet Unit |
| Wallet Unit Attestation (WUA) | A data object that describes the components of the Wallet Unit or allows authentication and validation of those components; |
| Embedded disclosure policy | A set of rules, embedded in an electronic attestation of attributes by its provider, that indicates the conditions that a wallet-relying party has to meet to access the electronic attestation of attributes |
| Registrar (of wallet-relying parties) | The body responsible for establishing and maintaining the list of registered wallet-relying parties established in their territory who has been designated by a Member State |
| Wallet Instance | The application installed and configured on a Wallet User’s device or environment, which is part of a Wallet Unit, and that the Wallet User uses to interact with the Wallet Unit |
| Wallet Secure Cryptographic Application (WSCA) | An application that manages critical assets by being linked to and using the cryptographic and non-cryptographic functions provided by the Wallet Secure Cryptographic Device |
| Wallet Secure Cryptographic Device (WSCD) | A tamper-resistant device that provides an environment that is linked to and used by the Wallet Secure Cryptographic Application to protect critical assets and provide cryptographic functions for the secure execution of critical operations |
| Wallet Provider | A natural or legal person who provides Wallet Solutions |
| critical assets | Assets within or in relation to a Wallet Unit of such extraordinary importance that where their availability, confidentiality or integrity are compromised, this would have a very serious, debilitating effect on the ability to rely on the Wallet Unit |
| (Wallet-) Relying Party | A Relying Party that intends to rely upon Wallet Units for the provision of public or private services by means of digital interaction |
| (Wallet-relying party) access certificate | A certificate for electronic seals or signatures authenticating and validating the (Wallet-) Relying Party, issued by a provider of wallet-relying party access certificates |
| Provider of wallet-relying party access certificates (Access Certificate Authority, Access CA) | A natural or legal person mandated by a Member State to issue Relying Party access certificates to (Wallet-) Relying Parties registered in that Member State. |
| (Wallet-relying party) registration certificate | A data object that indicates the attributes the Relying Party has registered to intend to request from Users |

## A.4 Additional definitions used in the ARF

Note: The technical terms and definitions in Table 3 below are intended to be
defined in such a way that they are aligned with the definitions used in the
[European Digital Identity Regulation] and the Commission Implementing
Regulations in Tables 1 and 2, and should be interpreted as such. In case any
definition in Table 3 contradicts a definition from the [European Digital
Identity Regulation] or the Commission Implementing Regulations, the latter take
precedence.

In some cases, a term has its origin in the context of
a specific Topic in [Annex 2](../annex-2/annex-2-high-level-requirements.md). In
such a case, the topic number appears in brackets following the definition. If
the definition relies on an external source, such as a
standard or a formal publication, that source is mentioned.

| **Term** | **Definition** |
|-----------|-----------|
| Administrative validity period (of a PID or attestation) | The date(s) from and/or up to which the attributes in the attestation are valid, which are represented as attribute(s) in the attestation. *Note: Some attestations, for instance diplomas, do not have an administrative validity period* |
| Attestation | When not further qualified, a collective term for a QEAA, PuB-EAA, or (non-qualified) EAA. |
| Attestation Provider | When not further qualified, a collective term for QEAA Provider, PuB-EAA Provider, or (non-qualified) EAA Provider. |
| Attestation Revocation List | A mechanism provided by a PID Provider or an Attestation Provider (or a trusted party acting on its behalf) for communicating the revocation status of PIDs and attestations, by publishing a list of identifiers of revoked PIDs or attestations. [Topic 7] |
| Attestation Rulebook | A document describing the attestation type, namespace(s), and other features for a specific attestation type. [Topic 12] |
| Attestation Status List | A mechanism provided by a PID Provider or an Attestation Provider (or a trusted party acting on its behalf) for communicating the revocation status of PIDs and attestations, by publishing status information (Valid or Invalid) for all relevant PIDs or attestations. [Topic 7] *Note: Which PIDs or attestations are relevant is determined by the entity publishing the status list. For example, a status list may contain all PIDs or attestations whose validity period is not over yet at the time of publication of the list.* |
| Attestation type | An identifier for a type of attestation, unique within the context of the EUDI Wallet ecosystem [Topic 12] |
| Certificate Authority (CA) | An entity which is trusted by one or more parties in the EUDI Wallet ecosystem to create and seal certificates. |
| Certificate Policy (CP) | A named set of rules that indicates the applicability of a certificate to a particular community and/or class of application with common security requirements. |
| Namespace | A specification of the attribute identifier, syntax and semantics of attributes that can be used in an attestation, having an identifier that is unique within the context of the EUDI Wallet ecosystem. [Topic 12] |
| National Accreditation Bodies (NAB) | A body that performs accreditation with authority derived from a Member State under [Regulation (EC) No 765/2008](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:32008R0765). |
| Notification | The act of transferring information to the European Commission. [Topics 31] |
| Pseudonym | Data uniquely representing a user which in itself does not allow to infer any user's attribute or person identification data, without the use of additional information that is kept separately by the issuer of the data uniquely representing the user. |
| Public Key Infrastructure (PKI) | Systems, software, and communication protocols that are used by EUDI Wallet ecosystem components to distribute, manage, and control public keys. A PKI publishes public keys and establishes trust within an environment by validating and verifying the public keys mapping to an entity. |
| Qualified Electronic Signature Remote Creation Service Provider | A natural or a legal person that offers services related to the remote creation, validation, and management of qualified electronic signatures that meet eIDAS regulation legal requirements and standards to be considered as legally equivalent to handwritten signatures. |
| Relying Party Instance | A software and/or hardware module with the capability to interact with a Wallet Unit and to perform Relying Party authentication, that is controlled by a Relying Party. |
| Selective Disclosure | The capability enabling the User to present a subset of the attributes included in a PID or attestation. |
| Technical validity period (of a PID or attestation) | The dates (and possibly times) from and up to which the attestation is valid, which are represented as metadata of the attestation. *Note: All PIDs and attestations have a technical validity period, which is typically much shorter than its administrative validity period (if existent). The technical validity period is chosen based on a risk analysis, e.g. with regard to User privacy.* |
| Trust Anchor | An authoritative entity represented by a public key and associated data. *Note: based on RFC 5914.* |
| Trusted List | Repository of information about authoritative entities in a particular legal or contractual context which provides information about their current and historical status. |
