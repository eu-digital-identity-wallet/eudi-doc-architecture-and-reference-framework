---
title: "European Digital Identity Wallet"
subtitle: "Architecture and Reference Framework"
...

# ANNEX 2 - High-Level Requirements <!-- omit from toc -->

## A.2 High-level requirements

### A.2.1 Introduction

#### A.2.1.1 Overview

This annex to the [ARF main document](../../architecture-and-reference-framework-main.md)
includes high-level requirements (HLRs) related to the EUDI Wallet ecosystem.
The requirements define the responsible actor that should implement each
requirement. There are no requirements imposed on the Users.

All requirements in this Annex only apply in the context of the EUDI Wallet
ecosystem. Attestations that are not bound to Wallet Units, as described in
[Section 6.6.3.8 of the ARF main document](../../architecture-and-reference-framework-main.md#6638-relying-party-instance-verifies-device-binding),
 are not included in the scope of this Annex.

#### A.2.1.2 Key words

This Annex uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119), i.e., to
indicate requirements, recommendations and options specified in this annex.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, i.e., a requirement that is not mandated by this document,
but, for instance, by an external standard or specification. The word
'can' indicates a capability, whereas other words, such as 'will', and
'is' or 'are', are intended as statements of fact.

### A.2.2 Structure and order of presentation of the HLRs

Topics presented in [Section A.2.3](#a23-high-level-requirements) are ordered by
a Topic number.

Each Topic includes a short description, followed by the High-Level
Requirements (HLRs), identified by a unique identifier. The identifier
includes a prefix which signifies the context of the HLRs (e.g. ISSU
for issuance), an underscore and a numerator, e.g. ISSU_10.

### A.2.3 High-Level Requirements

#### A.2.3.1 Topic 1 - Accessing Online Services with a Wallet Unit

##### Description <!-- omit from toc -->

One of the main use cases of the EUDI Wallet ecosystem is to enable Users to access
online services and to enable Relying Parties offering such services to, where needed, identify
and authenticate Users with a high level of assurance. This essential
functionality ensures that Relying Parties can confidently verify that they are
interacting with the correct User.

Note: As specified in the [European Digital Identity Regulation], legally speaking, the term 'Relying Party' also include QEAA Providers, PuB-EAA Providers,
and non-qualified EAA Providers. However, for clarity this Annex uses the term 'Relying Party' exclusively in the meaning of a service provider interacting with a Wallet Unit to request and receive attributes from an attestation.

In this use case, a User is using their Wallet Unit to present attributes in order to access online services offered by Relying Parties. The User is concerned about presenting such attributes during online interactions. Their objectives include maintaining control
over the presentation of personal attributes from PIDs and attestations.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
| -- | -- |
| OIA_01 | A Wallet Unit SHALL support [SD-JWT VC] for remote presentation flows and [ISO/IEC 18013-5] for proximity presentation flows, to receive and respond to presentation requests for person identification data (PID) and attestations by Relying Parties. |
| OIA_02 | A Wallet Unit SHALL support proving cryptographic device binding between a WSCA/WSCD included in the Wallet Unit and a PID or attestation, in accordance with [SD-JWT VC] or [ISO/IEC 18013-5]. *Notes: Such a mechanism is called 'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT VC]. - Discussions on device binding are ongoing, in particular regarding whether non-device-bound PIDs or attestations should be supported by a Wallet Unit, and if so, what the requirements for this support should be.* |
| OIA_03 | Empty |
| OIA_03a | Wallet Providers SHALL ensure that their Wallet Solution supports the protocol specified in 'OpenID for Verifiable Presentations', see [OpenID4VP], with additions and changes as documented in this Annex and in technical specifications referenced in this Annex. |
| OIA_03b | For remote presentation flows, when the format of the requested attestation complies with [ISO/IEC 18013-5], Relying Parties and Wallet Units SHALL comply with the requirements in the profile for OpenID4VP specified in [ISO/IEC 18013-7] Annex B. |
| OIA_03c | For remote presentation flows, when the format of the requested attestation complies with [SD-JWT VC], Relying Parties and Wallet Units SHALL comply with the requirements in the 'OpenID for Verifiable Presentations for IETF SD-JWT VC' profile specified in [HAIP]. |
| OIA_04 | A Wallet Unit SHALL verify and process PID or attestation presentation requests from Relying Parties in accordance with the protocols and interfaces specified in [OpenID4VP] for remote flows. |
| OIA_05 | After verifying and processing a PID or attestation request, the Wallet Unit SHALL display to the User the identity of the requesting Relying Party and the requested attributes. |
| OIA_06 | A Wallet Unit SHALL present the requested attributes only after having received the User's authorisation. *Note: See also OIA_07*. |
| OIA_07 | A Wallet Unit SHALL support selective disclosure of attributes from PIDs and attestations to be released to the requesting Relying Parties. |
| OIA_08 | Wallet Units and Relying Party Instances SHOULD support the [W3C Digital Credentials API]](<https://wicg.github.io/digital-credentials/>) for remote presentation flows, provided that a) this API is fully standardised, b) this API complies with the expectations outlined in [Chapter 3](../../discussion-topics/f-digital-credential-api.md#3) of the Topic F discussion paper, and c) this API is broadly supported by relevant browsers and operating systems. |
| OIA_08a | If Wallet Units and Relying Party Instances do not support the [W3C Digital Credentials API], they SHALL implement adequate mitigations for the challenges described in [Section 4.4.3.1](../../architecture-and-reference-framework-main.md#4431-introduction) of the ARF main document. |
| OIA_08b | If a Wallet Unit supports the [W3C Digital Credentials API], it SHALL disclose the presence of all stored attestations and attributes to the Digital Credentials API framework, but it SHALL NOT disclose the value of the attributes in these attestations. *Note: The latter restriction applies even if such disclosure would enhance the services provided by the operating system to the Wallet Unit, for example, attestation selection in the context of the Digital Credentials API.* |
| OIA_08c | If a Relying Party supports the [W3C Digital Credentials API], the Relying Party's presentation request MAY be processed by the browser for searching available attestations, for preventing fraud targeting the user, or for troubleshooting purposes. Moreover, the request SHOULD be processed by the browser for User security purposes. However, the request SHALL NOT be processed by the browser for market analysis purposes (including as a secondary purpose) or for the browser's own purposes. |
| OIA_09 | For remote presentation flows the Wallet Unit SHALL ensure that the attributes included in the presented attestation are accessible only to the Relying Party Instance, by encrypting the presentation response. The technical specification meant in OIA_03a SHALL specify mechanisms preventing decryption of the presentation response via Man-in-the-Middle attacks by the browser, the operating system, or other components between the Wallet Unit and the Relying Party. |
| OIA_10 | For both proximity and remote presentation flows, if a Wallet Unit contains two PIDs having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and a Relying Party requests a PID, the Wallet Unit SHALL ask the User which of these PIDs they want to release, unless the Wallet Unit can decide from context. |
| OIA_11 | For both proximity and remote presentation flows, if a Wallet Unit contains two attestations having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and the same attestation type, and a Relying Party requests an attestation of that type and encoding, the Wallet Unit SHALL ask the User which of these attestations they want to release, unless the Wallet Unit can decide from context. *Note: Attestation types are explained in [[Topic 12](#a2312-topic-12---attestation-rulebooks)].* |
| OIA_12 | For both proximity and remote presentation flows, a Relying Party SHALL validate the signature of a PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with [[Topic 31](#a2331-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)]. |
| OIA_13 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature of a QEAA in accordance with Art.32 of the [European Digital Identity Regulation]. For the verification, the Relying Party SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. |
| OIA_14 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature of a PuB-EAA in accordance with [Art.32](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2594-73-1) of the [European Digital Identity Regulation]. For that verification, the Relying Party SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature. The Relying Party SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. The Relying Party SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| OIA_15 | For both proximity and remote presentation flows, a Relying Party SHALL validate the signature of a non-qualified EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. *Notes: - OIA_12 - OIA_15 imply that a Relying Party Instance must know if the attestation it is requesting from a Wallet Instance is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. These requirements also imply that the Relying Party Instance must store trust anchors in such a way that, at the time of verification, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs. - PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, when it receives an non-qualified attestation, a Relying Party Instance may have to verify that the non-qualified EAA Provider is authorised or registered to issue this type of attestation, in addition to verifying the signature over the attestation using the EAA Provider's trust anchor. Mechanisms allowing to do this should be defined in the applicable Rulebook, see ARB_26.* |
| OIA_16 | When receiving a PID or attestation, a Relying Party Instance SHALL discard the values of all unique elements, including at least the ones mentioned in requirement ISSU_35 in [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit), as well as any timestamps, as soon as they are no longer needed. The Relying Party Instance SHALL NOT communicate these values to the Relying Party or to any other party inside or outside the EUDI Wallet ecosystem. |

#### A.2.3.2 Topic 2 - Mobile Driving Licence within the EUDI Wallet ecosystem

##### Description <!-- omit from toc -->

A User can obtain their mobile Driving Licence (mDL) from an mDL Provider and
store it in an Wallet Unit. The User can then present the mDL to a Relying Party
upon request to prove their driving rights conveniently, securely, and in
compliance with the Driving Licences Directive, once it is adopted.

This Topic contains high-level requirements related to a User presenting a
mobile Driving Licence (mDL) to a Relying Party in a supervised or unsupervised
scenario, and also in an unsupervised scenario, in proximity mode.

##### HLRs <!-- omit from toc -->

No high-level requirements are identified for this Topic, as the mDL is an
attestation that must comply with all relevant requirements in other Topics.

#### A.2.3.3 Topic 3 - PID Rulebook

##### Description <!-- omit from toc -->

The Person Identification Data (PID) Rulebook contains requirements specific to
the PID within the EUDI Wallet ecosystem.

The PID Rule Book contains the PID attribute schema, which describes the structure, the type, the identifiers, and the logical organisation of the mandatory and optional
attributes and metadata of the PID, as specified in Commission Implementing
Regulation (EU) 2024/2977. It also describes how Member States can specify any
possible national attributes. Two encodings for these attributes are specified,
one compliant with [ISO/IEC 18013-5], the other compliant with [SD-JWT VC].

For more information, see Annex 3 - [PID Rulebook].

##### A. Generic HLRs <!-- omit from toc -->

The requirements in the table below are valid for all PIDs in the EUDI Wallet
ecosystem, regardless of the encoding used.

| **Index** | **Requirement specification** |
|-----------|--------------|
| PID_01 | PIDs and PID Providers SHALL comply with all requirements in [PID Rulebook]. |
| PID_02 | A PID Provider SHALL issue any PID in both the format specified in ISO/IEC 18013-5 [ISO/IEC 18013-5] and the format specified in [SD-JWT VC]. *Note: [CIR 2024/2977] mentions the W3C Verifiable Credentials Data Model v1.1 instead of [SD-JWT VC]. The latest stable version of this standard is [W3C VCDM 2.0].  However, W3C VCDM is not a complete specification of an attestation format. In particular, it does not specify a specific proof method to be used. Without additional specification, such as those in [W3C VC-JOSE-COSE] or [W3C VC Data Integrity], and making further choices, it is impossible to implement a PID based on W3C VCDM. This Rulebook considers [SD-JWT VC] to essentially be such an additional specification. See also [Section 5.3.4](../../architecture-and-reference-framework-main.md#534-w3c-verifiable-credentials) of the ARF main document.* |
| PID_03 | The portrait in a PID SHALL consist of a single portrait image in JPEG format. The portrait image SHALL comply with the quality requirements for a Full Frontal Image Type in ISO/IEC 19794-5 clauses 8.2, 8.3, and 8.4. However, the attribute portrait SHALL NOT comply with the format requirements in ISO/IEC 19794-5 clauses 8.1 and 8.5, meaning it SHALL NOT contain any of the headers or blocks specified in clause 5 except for the image data itself (a JPEG). |

##### B. HLRs for ISO/IEC 18013-5-compliant PIDs <!-- omit from toc -->

The requirements in the table below are valid for PIDs in the EUDI Wallet
ecosystem that are compliant with [ISO/IEC 18013-5].

| **Index** | **Requirement specification** |
|-----------|--------------|
| PID_04 | PID Providers SHALL use "eu.europa.ec.eudi.pid.1" as the attestation type for ISO/IEC 18013-5-compliant PIDs. *Notes: - This identifier uses the general format [Reverse Domain].[Domain Specific Extension]. Since the European Commission controls the domain ec.europa.eu, this attestation type identifier will not collide with any attestation type identifiers defined by other organisations in other Attestation Rulebooks. - The Commission may use the version number "1" in this identifier to distinguish between the first version of the PID, defined in the [PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md), and any future version, which will then have an incremented version number.* |
| PID_05 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL use the value "eu.europa.ec.eudi.pid.1" for the identifier of the namespace for the PID attributes specified in [Section 4.2 of the PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md#42-encoding-of-pid-attributes-and-metadata). *Notes: - The version number "1" allows for future extension(s) or change(s) of the ISO/IEC 18013-5-compliant PID attributes. - This namespace has the same value as the attestation type specified in requirement PID_04. This is allowed according to ISO/IEC 18013-5.* |
| PID_06 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider MAY include attributes that are not defined in the [PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md). If so, these attributes SHALL be defined within a domestic PID namespace as meant in requirement ARB_10 in [Topic 12](#a2312-topic-12---attestation-rulebooks). The PID Provider SHALL generate the identifier for this domestic PID namespace by appending the applicable ISO 3166-1 alpha-2 country code or the ISO 3166-2 region code, separated by a period, to the PID namespace identifier specified in PID_05, excluding the version number. The PID Provider MAY include a version number in the domestic PID namespace identifier. *Note: For example, the identifier of the first domestic PID namespace for Germany could be "eu.europa.ec.eudi.pid.de.1".* |
| PID_07 | A PID Provider that defines a domestic namespace SHALL publish the namespace, including all attribute identifiers, their definition, presence and encoding format, in an Attestation Rulebook complying with all applicable requirements in [Topic 12](#a2312-topic-12---attestation-rulebooks). |
| PID_08 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL include both the attributes and the metadata specified in [CIR 2024/2977] in the PID as (issuer-signed or device-signed) data elements. *Note: This implies that technically speaking, there is no difference between these attributes and metadata.* |
| PID_09 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL encode each attribute or metadata in the PID as specified in the third column of the tables in [Section 4.2.1 of the PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md#421-overview). |
| PID_10 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL encode each attribute or metadata in the PID in Concise Binary Object Representation (CBOR) according to [RFC 8949]. |
| PID_11 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that each PID contains at most one attribute with the same attribute identifier. |
| PID_12 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that the value of all attributes and metadata in the PID is valid at the value of the timestamp in the validFrom element in the MSO, see [ISO/IEC 18013-5] clause 9.1.2.4. *Note: The value of the age_over_18, age_over_NN, or age_in_years attributes, if present, changes whenever the User to whom the person identification data relates has a relevant birthday. The value of many other attributes will also change over time.* |
| PID_13 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that the issuance_date attribute, if present, is not later than the validFrom element in the MSO, see [ISO/IEC 18013-5] clause 9.1.2.4. |

##### C. HLRs for SD-JWT VC-compliant PIDs <!-- omit from toc -->

The requirements in the table below are valid for PIDs in the EUDI Wallet
ecosystem that are compliant with [SD-JWT VC].

| **Index** | **Requirement specification** |
|-----------|-------------------------------|
| PID_14 | A PID Provider issuing [SD-JWT VC]-compliant PIDs SHALL include the vct claim in their PIDs, where the vct claim SHALL be a URN within the `urn:eudi:pid:` namespace. The type indicated by the vct claim SHALL be `urn:eudi:pid:1` for the type defined in this document or a domestic type that extends it. |
| PID_15 | A catalog linked in the PID Rulebook SHALL associate all SD-JWT VC types for PIDs with SD-JWT VC type metadata which will include the same information as the PID Rulebook applicable to the type.  |
| PID_16 | A PID Provider that defines a domestic type SHALL publish information about the type, including all claim identifiers, their definition, presence and encoding format, in an Attestation Rulebook complying with all applicable requirements in [Topic 12](#a2312-topic-12---attestation-rulebooks). |
| PID_17 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL include both the attributes and the metadata specified in [CIR 2024/2977] in the PID as claims. *Note: This implies that technically speaking, there is no difference between these attributes and metadata.* |
| PID_18 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL encode each attribute or metadata in the PID as specified in the tables in [Section 5.2 of the PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md#52-encoding-of-pid-attributes). |
| PID_19 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL ensure that the value of all attributes and metadata in the PID is valid at the value of the timestamp in the nbf claim, if present. *Note: The value of the age-related claims, if present, changes whenever the User to whom the person identification data relates has a relevant birthday. The value of many other attributes will also change over time.* |
| PID_20 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL ensure that the date_of_issuance claim, if present, is not later than the value of the timestamp in the nbf claim, if present. |
| PID_21 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL make all claims (i.e., all top-level properties, all nested properties, and all array entries) selectively disclosable individually, except those claims defined as non-selectively disclosable in [SD-JWT VC]. |

#### A.2.3.4 Topic 4 - mDL Rulebook

##### Description <!-- omit from toc -->

The mobile driving licence (mDL) Rulebook contains requirements specific
to the mDL use case within the EUDI Wallet ecosystem.

Mobile driving licences are legally specified in the proposed EC
Regulation 2023_127 (4th Driving Licence Regulation). This Regulation
specifies that mDLs must comply with the ISO/IEC 18013-5 standard. It
does not mention any other standards, in particular not [SD-JWT VC].
Consequently, mDLs issued to a Wallet Unit will not be implemented
as [SD JWT VC]- compliant documents. The mDL Rulebook therefore specifies
only an ISO/IEC 18013-5 compliant encoding.

For more information, see Annex 3 - [mDL Rulebook].

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| mDL_01 | mDLs and mDL Providers SHALL comply with all requirements in [mDL Rulebook]. |

#### A.2.3.5 Topic 5 - Wallet Unit Design Guide

There are no HLRs for this Topic.

#### A.2.3.6 Topic 6 - Relying Party authentication and User approval

##### Description <!-- omit from toc -->

Relying Party authentication is a process whereby a Relying Party proves
its identity to a Wallet Unit, in the context of a transaction in
which the Relying Party requests the Wallet Unit to release some
attributes.

To perform Relying Party authentication, the Wallet Unit verifies a
Relying Party Instance access certificate offered by the entity with which it
communicates, which is called a "Relying Party Instance". Note that
there could be multiple Relying Party Instances for each Relying Party.

The Wallet Unit communicates the outcome of Relying Party authentication to the
User when it requests the User for approval to present the requested attributes.
High-level requirements for User approval are also included in this Topic. If requested by the User, the Wallet Unit also communicates the outcome of the verification of the information in the Relying Party registration certificate or obtained from the Registrar, see
[Topic 44](#a2344-topic-44---relying-party-registration-certificates). The Wallet Unit also informs the User about the outcome
of the evaluation of an embedded disclosure policy, if present, see
[Topic 43](#a2343-topic-43---embedded-disclosure-policies).

##### HLRs <!-- omit from toc -->

A. Relying Party authentication

| **Index** | **Requirement specification** |
|-----------|--------------|
| RPA_01 | The Wallet Unit used by a User, as well as the Relying Party Instance used by the Relying Party, SHALL implement a mechanism for Relying Party authentication in PID or attestation presentation transactions. This mechanism SHALL: - enable the Wallet Unit to identify and authenticate the Relying Party, - enable the Wallet Unit to verify that the request from the Relying Party was not copied and replayed, - use Relying Party Instance access certificates issued in accordance with [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. |
| RPA_01a | If a Wallet Unit supports the [W3C Digital Credentials API] for remote presentation flows, it SHALL retain full authority over the process meant in RPA_01. In particular, this process SHALL NOT be handled by a third party, including the browser and the operating system. |
| RPA_02 | The Commission SHALL ensure that technical specifications for the Relying Party authentication mechanism mentioned in RPA_01 are created both for Wallet Units complying with [ISO/IEC 18013-5] and for Wallet Units complying with [OpenID4VP]. These specifications SHALL comply with applicable requirements in these standards. |
| RPA_02a | The technical specifications mentioned in RPA_02 SHALL ensure that a Relying Party Instance includes its access certificates in the presentation request by value, not by reference. *Note: This ensures that no external requests are necessary to carry out Relying Party authentication, and that transactions are atomic and self-contained.* |
| RPA_03 | A Wallet Unit and a Relying Party Instance SHALL perform Relying Party authentication in all PID or attestation presentation transactions to Relying Parties, whether proximity or remote, using a Relying Party Instance access certificate. *Note: The actions both entities perform differ. For example, while the Relying Party creates a signature over some data in the request, the Wallet Unit validates that signature.* |
| RPA_04 | For the verification of Relying Party Instance access certificates, a Wallet Unit SHALL accept the trust anchors in the Trusted List(s) of Relying Party Access Certificate Authorities of all Member States. *Note: For more information about Relying Party Access Certificate Authorities, please see [[Topic 31](#a2331-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)].* |
| RPA_05 | If Relying Party authentication fails for any reason, the Wallet Instance SHALL inform the User that the identity of the Relying Party could not be verified and that therefore the request is not trustworthy. |
| RPA_06 | If Relying Party authentication succeeds, the Wallet Instance SHALL display to the User the name of the Relying Party as included in the Relying Party access certificate, together with the attributes requested by the Relying Party. The Wallet Instance SHALL do so when asking the User for approval according to RPA_07. *Note: If the Relying Party is an intermediary acting on behalf of an intermediated Relying Party, the Wallet Instance displays the names of both the intermediary and the intermediated Relying Party to the User, see RPI_07.* |
| RPA_06a | If Relying Party authentication fails for any reason, the Wallet Unit SHALL notify the User. In addition, the Wallet Unit SHALL either not present the requested attributes to the Relying Party, or give the User the choice to present the requested attributes or not. *Note: It is up to the Wallet Provider to make a choice for one of these two options.* |

B. User approval

| **Index** | **Requirement specification** |
|-----------|--------------|
| RPA_07 | A Wallet Unit SHALL ensure the User approved the release of any attribute(s) in the Wallet Unit to a Relying Party, prior to releasing these attributes. A Wallet Unit SHALL always allow the User to refuse releasing an attribute requested by the Relying Party. |
| RPA_07a | If a Wallet Unit supports the [W3C Digital Credentials API] for remote presentation flows, it SHALL retain full authority over the process meant in RPA_07. In particular, this process SHALL NOT be handled by a third party, including the browser and the operating system. |
| RPA_08 | A Wallet Unit SHALL ensure that (one of) its WSCA(s) has authenticated the User before allowing the User to give or refuse approval for releasing any attributes. *Note: See [[Topic 09](#a239-topic-9---wallet-unit-attestation)] for information about the WSCA.* |
| RPA_09 | A Relying Party SHOULD communicate in the request which attributes are needed for which purpose (use case, service), if this is supported by the protocol used for communication with the Wallet Unit. *Notes: - This could be done, for instance, by grouping the attributes and describing the use case, service, or purpose of each group. - The purpose of this recommendation is that a Relying Party makes clear to the User what the intended use, the service being accessed, or the specific purpose is of each requested attribute. For example, a service may legally require attributes for age verification (e.g., birthdate), but the Relying Party may additionally want a User address (e.g., street, location, PObox, country) in order to offer added-value services. Age verification attributes and address attributes should be grouped separately, and the purposes should be clearly distinguished. This allows the User to be better informed about the request, and also allows them to approve one purpose but deny the other; see RPA_10.* |
| RPA_10 | If a Wallet Unit receives a request indicating one or more purposes (use cases, services) for requesting attributes, the Wallet Instance SHOULD show these to the User when asking for User approval. Moreover, the Wallet Unit SHOULD ensure that for each purpose, the User gives approval either to release all attributes requested for that purpose, or none of them. *Note: This means that a User should either approve the release of all attributes in a given group or to deny the entire group. The Wallet Unit should not allow partial approval within a group. Partial approval would mean that the Relying Party cannot deliver the service, but nevertheless receives some User attributes. This would be a violation of the User's privacy.* |
| RPA_11 | When the presentation of an attestation is denied by the User, the Wallet Unit SHALL behave towards the Relying Party as if the attestation did not exist. |

#### A.2.3.7 Topic 7 - Attestation revocation and revocation checking

##### Description <!-- omit from toc -->

This Topic contains the high-level requirements (HLRs) relating to the
(possible) revocation of PIDs, QEAAs, PuB-EAAs, non-qualified EAAs, and WUAs by
their providers. It also contains HLRs relating to the (possible) checking of
the revocations status of a PID or attestation by a Relying Party.

Note: This Topic does not pertain to access certificates for Relying Parties,
PID Providers, or Attestation Providers as discussed in
[[Topic 31](#a2331-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)].
Neither does it apply to any intermediate certificates establishing trust
between these certificates and the respective trust anchors. These access
certificates are part of a Public Key Infrastructure, and rules for revoking
these certificates will be established within the respective PKI.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| VCR_01 | A PID Provider, QEAA Provider, or PuB-EAA Provider SHALL use one of the following methods for revocation of a PID, QEAA, or PuB-EAA: - Only issue short-lived attestations having a validity period of 24 hours or less, such that revocation will never be necessary, - Use an Attestation Status List mechanism specified per VCR_11, or - Use an Attestation Revocation List mechanism specified per VCR_11. *Note: The 24-hour period originates from ETSI EN 319 411-1 V1.4.1, requirement REV-6.2.4-03A. This requires that the process of revocation must take at most 24 hours. Consequently, revocation may make no sense if the attestation is valid for less than 24 hours, because it may reach the end of its validity period before it is revoked.* |
| VCR_01a | A Wallet Provider SHALL use either the second or the third of the methods specified in VCR_01 for revocation of a WUA. *Note: Due to requirement WUA_08 in [Topic 9](#a239-topic-9---wallet-unit-attestation), it is not possible to issue short-lived WUAs. This implies that all WUAs are revocable.* |
| VCR_02 | For non-qualified EAAs, the relevant Rulebook SHALL specify whether that type of EAA must be revocable. If a non-qualified EAA type must be revocable, the relevant Rulebook SHALL determine which of the methods mentioned in VCR_01 must be implemented by the relevant EAA Providers for the revocation of such an EAA. |
| VCR_03 | If a PID or attestation is revocable, the PID Provider of a given PID, or the Attestation Provider of a given attestation, SHALL be the only party in the EUDI Wallet ecosystem responsible for executing the revocation of that PID or attestation. *Note: A PID Provider, Attestation Provider MAY outsource the operation of the revocation process to a third party. |
| VCR_03a | The Wallet Provider of a given WUA SHALL be the only party in the EUDI Wallet ecosystem responsible for executing the revocation of that WUA. *Note: A Wallet Provider MAY outsource the operation of the revocation process to a third party.* |
| VCR_04 | A PID Provider, Attestation Provider or Wallet Provider that revoked a PID, attestation, or WUA SHALL NOT reverse the revocation. |
| VCR_05 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHALL have a policy specifying under which conditions a PID, attestation, or WUA it issued will be revoked. |
| VCR_06 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHALL revoke a PID, attestation, or WUA when its security has been compromised. |
| VCR_07 | A Wallet Provider SHALL revoke all valid WUAs issued to a Wallet Unit upon the explicit request of the User to revoke their Wallet Unit. |
| VCR_07a | If a PID or attestation is revocable, the PID Provider or Attestation Provider SHOULD revoke that PID or attestation upon the explicit request of the User to whom the PID or the attestation was issued. |
| VCR_07b | If a PID or attestation is revocable, the PID Provider or Attestation Provider SHOULD revoke that PID if the Wallet Unit on which it resides is revoked, in compliance with requirement WURevocation_18 in [Topic 38](#a2338-topic-38---wallet-unit-revocation). |
| VCR_08 | If a PID is revocable, the PID Provider SHALL revoke a PID upon the death of the natural person who is the subject of the PID, or the cease of activity of the legal person who is the subject of the PID. |
| VCR_09 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider or Wallet Provider SHALL revoke a PID, attestation, or WUA if the value of one or more attributes in the PID, attestation, or WUA was changed (including attributes being added or deleted) and it is still valid for at least 24 hours. Subsequently, if the User's contact details are known, the PID Provider, Attestation Provider, or Wallet Provider SHOULD, via an out-of-band manner, notify the User about the revocation and ask the User to request re-issuance of the PID, attestation, or WUA using their Wallet Unit. *Note: If the value of the attributes is determined by a party different from the Provider, such as an Authentic Source, the Provider is responsible for ensuring that this third party notifies them about such changes.* |
| VCR_10 | Wallet Providers SHALL implement the attestation revocation mechanisms specified per VCR_11 in their Wallet Solutions. |
| VCR_11 | The Commission SHALL create or reference technical specifications providing all necessary details for PID Providers, Attestation Providers, and Wallet Providers to implement an Attestation Status List mechanism or an Attestation Revocation List mechanism for the PIDs, attestations, and WUAs they issue. These technical specifications SHALL also contain all details necessary for Relying Party Instances, Relying Parties, and Wallet Units interacting with other Wallet Units to use these mechanisms to verify the revocation status of PIDs, attestations, and WUAs. *Note: 'Attestation Status List' and 'Attestation Revocation List' are specific mechanisms, defined in Annex 1. Attestation Revocation Lists are sometimes referred to as 'Identifier Lists'.* |
| VCR_12 | If a Relying Party decides it needs to be able to verify the revocation status of PIDs or attestations, it SHALL support both the Attestation Status List mechanism and the Attestation Revocation List mechanism specified per VCR_11. *Note: Per VCR_13, it is recommended but not mandatory for a Relying Party to verify whether a PID or attestation is revoked.* |
| VCR_12a | A PID Provider or Attestation Provider SHALL support both the Attestation Status List mechanism and the Attestation Revocation List mechanism specified per VCR_11 for verifying the revocation status of a WUA. |
| VCR_13 | A Relying Party Instance SHOULD verify the revocation status of a PID or attestation upon obtaining it from a Wallet Unit, following the steps specified per VCR_11. |
| VCR_14 | When no reliable information regarding the revocation status of a PID or attestation is available, a Relying Party SHOULD perform a risk analysis considering all relevant factors for the use case, before taking a decision to accept or refuse the PID or attestation. |
| VCR_15 | A Relying Party Instance SHOULD NOT request the relevant Attestation Status List or Attestation Revocation List each time an attestation is presented to it by a Wallet Unit. Rather, the Relying Party operating the Relying Party Instance SHOULD download each new version of the list once, at a time and from a location unrelated to the presentation of a PID or attestation by a User. The Relying Party SHOULD then distribute the list to all of its Relying Party Instances, using an Relying Party-internal distribution mechanism. |
| VCR_16 | A PID Provider, Attestation Provider or Wallet Provider SHALL NOT require the Relying Party or Relying Party Instance to authenticate itself before downloading an Attestation Status List or Attestation Revocation List. |
| VCR_17 | When using an Attestation Status List for revocation, the PID Provider, Attestation Provider or Wallet Provider SHALL randomly assign the index for each PID or attestation, to prevent this index from becoming a correlator. *Note: Randomly assigning indices within a bitstring or byte array is more complicated than creating random identifiers (e.g. serial numbers) for attestations, as is needed for an Attestation Revocation List. This is because duplicate indices and unnecessarily long bitstrings or byte arrays must be prevented.* |
| VCR_18 | When using an Attestation Status List for revocation, the PID Provider, Attestation Provider, or Wallet Provider SHALL represent a sufficiently large number of PIDs, attestations, or WUAs on each Attestation Status List to ensure herd privacy. *Note: In this context, herd privacy means that if an entity requests a particular status list, the PID Provider, Attestation Provider, or Wallet Provider is not able to deduce which PID, attestation or WUA (likely) was presented to that entity. *Note: Complying with this requirement may be difficult in case the number of PIDs, attestations, or WUAs to be represented on the list is small. In such a case, decoy entries can be added to the list to obfuscate the real number of referenced PIDs, attestations, or WUAs.* |
| VCR_19 | A Wallet Unit SHOULD regularly check the revocation status of its PIDs, attestations, and WUAs, and notify the User if a PID, attestation, or WUA (i.e, the Wallet Unit itself), is revoked. |

#### A.2.3.8 Topic 8 - Design Solutions on Data Sharing scenarios

There are no HLRs for this Topic.

#### A.2.3.9 Topic 9 - Wallet Unit Attestation

Note to this Topic: The Commission received many comments on
the ideas described in this Topic, particularly relating to revocation and
the differing needs of Relying Parties on one side and
PID Providers and Attestation Providers on the other.
Further details on these subjects will be provided in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md)
and the high level requirements in Topic 9 intentionally do not go into these technical details.

**NOTE: [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md) is not finalised yet. Discussions on the WUA are ongoing. In particular, no final decision has been taken yet regarding the use of a WUA on the Relying Party interface. Nevertheless, it seems likely that this will not be a possibility, and that a Wallet Unit will send a WUA only to a PID Provider or Attestation Provider during issuance.**

##### Description <!-- omit from toc -->

When a User's Wallet Unit interacts with other actors
in the EUDI Wallet ecosystem, in particular PID Providers, Attestation Providers,
or Relying Parties, these actors may want to verify if the Wallet Unit is  authentic and has not been revoked.

Furthermore, when a PID Provider or Attestation Provider receives a request from a
User to issue a PID or attestation to the User's Wallet Unit,
the PID Provider or Attestation Provider needs to decide whether it can
comply with this request. To determine this, the PID Provider or
Attestation Provider needs to know (among other things) if the Wallet
Unit offers the functional capabilities required by the PID Provider
or Attestation Provider in its PID or attestation issuing policy. In
addition, the PID Provider or Attestation Provider needs to know if the
Wallet Secure Cryptographic Application(s) (WSCA) and the corresponding
Wallet Secure Cryptographic Device(s) (WSCD) that are part of the Wallet Unit
offer the required level of security. Therefore, the PID Provider or
Attestation Provider needs to receive trustworthy information about
these capabilities and security posture.

This Topic introduces an information object that contains the necessary
information to allow PID Providers and Attestation Provider to verify if he Wallet Unit is  authentic and has not been revoked, and that also contains the information needed by the Provider to take a decision on issuance. This object is called the Wallet Unit
Attestation (WUA). The WUA also contains a public key. By including this public
key in the WUA, the Wallet Provider attests that the corresponding private key is
protected by a certified WSCA/WSCD that has the properties and security posture
described in the WUA. The PID Provider or Attestation Provider then asks the Wallet Unit to create a key
pair for its new PID or attestation, and to prove that both this new private key and the
private key corresponding to public key in the WUA are in possession of the Wallet Unit.

A topic related to the WUA is the following. It would be useful for the Wallet Unit to be able to provide a proof that the PID or attestation private key is protected by the same WSCA/WSCD as the WUA private
key. Because if that is the case, the PID Provider or Attestation Provider can be sure that the security level of the new PID or attestation key is the same as the security level of the WUA key. A mechanism for providing such a proof is discussed in [Topic 18](#a2318-topic-18---combined-presentations-of-attributes), where it is used to give assurance to a Relying Party that multiple attestations originate from the same WSCA/WSCD and thus are related to the same User. The same mechanism could also be used here.

##### HLRs <!-- omit from toc -->

###### A.  Support for WUA Use Cases <!-- omit from toc -->

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WUA_01  | The WUA SHALL provide a PID Provider or Attestation Provider with information about the capabilities of the WSCA and WSCD of the Wallet Unit, such that they are able to take a well-grounded decision on whether to issue a PID or attestation to the Wallet Unit. |
| WUA_02  | The WUA SHALL enable PID Providers and Attestation Providers to verify the authenticity and revocation status of the Wallet Unit. |
| WUA_03  | A Wallet Provider SHALL ensure that a non-revoked Wallet Unit at all times can present a WUA, when requested by a PID Provider or Attestation Provider. |
| WUA_04  | Empty |
| WUA_05  | During PID or attestation issuance, a Wallet Unit SHALL retrieve the requirements of the PID Provider or Attestation Provider regarding User authentication and key storage by the WSCA/WSCD from the Issuer metadata (as specified in [OpenID4VCI]). The Wallet Unit SHALL determine which of its WSCA/WSCD(s), if any, comply with these requirements. If a compliant WSCA/WSCD is available to the Wallet Unit, the Wallet Unit SHALL request it to generate a new key pair for the new PID or attestation. The Wallet Unit SHALL provide the PID Provider or Attestation Provider with the WUA describing the properties of the WSCA/WSCD that generated the new PID or attestation private key. |
| WUA_06  | If a Wallet Unit contains multiple WSCAs, it SHALL, internally and securely, keep track of which PIDs and attestations are bound to which WSCA. |
| WUA_07  | A Wallet Unit SHALL present a WUA only as part of the issuance of a PID or an attestation. |
| WUA_08  | The WUA SHALL enable PID Providers to request a Wallet Provider to revoke a Wallet Unit, in accordance with requirement WURevocation_11, by including an identifier for the Wallet Unit in the WUA. The Wallet Provider SHALL ensure that this Wallet Unit identifier does not enable tracking of the User. *Notes: - This is a legal requirement from [CIR 2024/2977]. See also [Section 6.5.3.4 of the ARF main document](../../architecture-and-reference-framework-main.md#6534-wallet-provider-issues-one-or-more-wallet-unit-attestations-to-the-wallet-unit). - The Wallet Unit identifier meant here can be the same as the one used for revoking the WUA, for instance a URI and index to an Attestation Status List (see [Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking)).* |

###### B.  WUA in relation Cryptographic Keys <!-- omit from toc -->

| **Index** | **Requirement specification**  |
|-----------|----------------------|
| WUA_09 | A WUA SHALL contain a public key, and the corresponding private key SHALL be generated by the WSCA/WSCD described in the WUA. |
| WUA_10 | Empty (moved to [Topic 18](#a2318-topic-18---combined-presentations-of-attributes)) |
| WUA_11 | During PID or attestation issuance, the PID Provider or Attestation Provider SHALL verify that the WSCA/WSCD described in the WUA received from the Wallet Unit has proven possession of the private key corresponding to the public key in the WUA. |
| WUA_11a | During PID or attestation issuance, the PID Provider or Attestation Provider SHALL verify that a WSCA/WSCD has proven possession of the new PID or attestation private key.|
| WUA_11b | During PID or attestation issuance, the PID Provider or Attestation Provider SHOULD verify a proof of cryptographic binding generated by the WSCA/WSCD per requirement ACP_01, if present, to verify that the new PID or attestation private key is managed by the same WSCA/WSCD as the WUA private key. *Note: The three proofs mentioned in WUA_11, WUA_11a and WUA_11b MAY be implemented as a single cryptographic proof.* |
| WUA_12 |  The Wallet Unit SHALL be able to prove that it possesses the private key corresponding to the public key in the WUA. |
| WUA_13 | Empty |
| WUA_14 | Empty (moved to [Topic 18](#a2318-topic-18---combined-presentations-of-attributes)) |
| WUA_15 | Empty |
| WUA_16 | If a WSCA/WSCD is able to export a private key, the Wallet Provider SHALL specify this capability as an attribute in the WUA. |

###### C.  Requirements regarding privacy <!-- omit from toc -->

| **Index** | **Requirement specification**  |
|-----------|------|
| WUA_17   | A Wallet Provider SHALL consider all relevant factors, including offline usage, interoperability, and the risk of a WUA becoming a vector to track the User, when deciding on the validity period of a WUA. *Regarding interoperability, see ISSU_12c, which limits the validity period of PIDs issued based on the validity period of the WUA.*  |
| WUA_18   | A Wallet Unit SHALL release a WUA only to a PID Provider or Attestation Provider, and not to a Relying Party or any other entity. |

###### D.  Miscellaneous requirements <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------------|
| WUA_19  | Empty |
| WUA_20  | A Wallet Provider SHALL ensure that its Wallet Units comply with all relevant requirements specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md). |
| WUA_20a  | A PID Provider or Attestation Provider SHALL comply with all relevant requirements specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md). |
| WUA_21  | Empty |

#### A.2.3.10 Topic 10 - Issuing a PID or attestation to a Wallet Unit

##### Description <!-- omit from toc -->

PID Providers and Attestation Providers issue PIDs and attestations to
Wallet Units. This Topic lists the high-level technical
requirements related to PID and attestation issuance.

This Topic also contains the high-level requirements for [Topic 23](#a2323-topic-23---pid-issuance-and-qeaa-issuance).

##### HLRs <!-- omit from toc -->

###### A - Generic HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_01 | Wallet Providers SHALL ensure that their Wallet Solution supports the OpenID4VCI protocol specified in [OpenID4VCI], as profiled by the 'OpenID for Verifiable Credential Issuance' profile specified in [HAIP], and with additions and changes as documented in this Annex (see e.g. this Topic and [[Topic 9](#a239-topic-9---wallet-unit-attestation)]) and in future technical specifications created by or on behalf of the Commission. |
| ISSU_01a | PID Providers and Attestation Providers SHALL support the OpenID4VCI protocol specified in [OpenID4VCI], as profiled by the 'OpenID for Verifiable Credential Issuance' profile specified in [HAIP], and with additions and changes as documented in this Annex (see e.g. this Topic and [[Topic 9](#a239-topic-9---wallet-unit-attestation)]) and in future technical specifications created by or on behalf of the Commission. |
| ISSU_02 | Wallet Providers SHALL ensure that their Wallet Solution supports the attestation formats specified in ISO/IEC 18013-5, see [ISO18013-5], and in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC], with additions and changes as documented in this Annex and in future technical specifications created by or on behalf of the Commission. |
| ISSU_03 | Wallet Units, PID Providers, and Attestation Providers SHALL support the [W3C Digital Credentials API]](<https://wicg.github.io/digital-credentials/>) for issuance of PIDs and attestations, provided that a) this API is fully standardised, b) this API complies with the expectations outlined in [Chapter 3](../../discussion-topics/f-digital-credential-api.md#3) of the Topic F discussion paper, and c) this API is broadly supported by relevant browsers and operating systems. |
| ISSU_04 | The OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable PID Providers and Attestation Provider to issue to a Wallet Unit a batch of multiple PIDs or attestations that are simultaneously valid and contain the same attributes. |
| ISSU_05 | A Wallet Unit SHALL support a process to activate a newly issued PID, in accordance with the requirements for LoA High in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) Section 2.2.2. The Wallet Unit SHALL NOT allow a User to use a non-activated PID. *Notes: - The goal of the activation process is to verify that the PID was delivered into the Wallet Unit and WSCA/WSCD of the User who is the subject of the PID. - This requirement is not applicable for QEAAs, PuB-EAAs or non-qualified EAAs, since these are not identity means in the sense of Commission Implementing Regulation (EU) 2015/1502.* |
| ISSU_06 | After a Wallet Unit receives a PID or an attestation from a PID Provider or Attestation Provider, it SHALL verify that the PID or attestation it received matches the PID or attestation requested by the Wallet Unit. |
| ISSU_07 | After a Wallet Unit receives a PID from a PID Provider, it SHALL validate the signature of the PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with [Topic 31](#a2331-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates). *Note: This signature validation may not be useful in architectures where the Wallet Provider is also the PID Provider and the validation of the PID signature would be done by the same component (namely, a remote HSM) that created the signature. However, in such a situation, additional measures SHALL be taken to ensure that any errors in the PID issuance process will be detected.* |
| ISSU_08 | After a Wallet Unit receives a QEAA from a QEAA Provider, it SHALL validate the qualified signature of the QEAA in accordance with Art.32 of the [European Digital Identity Regulation]. For the verification, the Wallet Unit SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. |
| ISSU_09 | After a Wallet Unit receives a PuB-EAA from a PUB-EAA Provider, it SHALL validate the qualified signature of the PuB-EAA in accordance with Art.32 of the [European Digital Identity Regulation]. For that verification, the Wallet Unit SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature. The Wallet Unit SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. Finally, the Wallet Unit SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| ISSU_10 | After a Wallet Unit receives a non-qualified EAA from an EAA Provider, it SHALL validate the signature of the EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. *Notes: - Requirements ISSU_07 to ISSU_10 are equivalent to requirements OIA_12 to OIA_15 in [Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit). These requirements imply that a Wallet Instance must be aware whether the attestation it is requesting from an issuer is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. These requirements also imply that the Wallet Unit must store trust anchors in such a way that, when it receives an issued attestation, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs. - PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, before requesting an non-qualified attestation, a Wallet Unit may need to verify that the non-qualified EAA Provider is authorised or registered to issue this type of attestation. Mechanisms allowing to do this may be defined in the applicable Rulebook, see ARB_26.* |
| ISSU_11 | A Wallet Unit SHALL request the User's approval before storing a PID or attestation obtained from a PID Provider or Attestation Provider. When requesting approval, the Wallet Instance SHALL display the contents of the PID or attestation to the User. The Wallet Instance SHALL also inform the User about the identity of the PID Provider or Attestation Provider, using the subject information in the PID Provider's or Attestation Provider's access certificate. |
| ISSU_11b | In case one or more of the verifications in ISSU_06 - ISSU_11 fail, the Wallet Unit SHALL immediately delete the PID or attestation it received. The Wallet Instance SHALL notify the User about the fact that issuance of the PID or attestation was not successful, including the reason for this failure. |
| ISSU_12 | A PID Provider or Attestation Provider SHALL offer its PIDs or attestations in all formats required in the PID Rulebook or the applicable Attestation Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. *Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT VC-format specified in [SD-JWT VC].* |
| ISSU_12a | A Wallet Provider SHALL ensure that, when a User instructs their Wallet Unit to request a PID or attestation from a PID Provider or Attestation Provider, the Wallet Unit requests that PID or attestation in all formats offered by the PID Provider or Attestation Provider. *Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT VC-format specified in [SD-JWT VC].* |
| ISSU_12b  | During PID or attestation issuance, a WSCA/WSCD SHALL generate a new key pair for a new PID or attestation, on request of the PID Provider or Attestation Provider via the Wallet Instance. *Note: In case of synchronous issuing in a remote HSM architecture, re-use of an existing key pair for the new PID or attestation may be acceptable and it may not be necessary to generate a new key pair for each new PID or attestation.* |
| ISSU_12c  | The expiration date of a PID SHALL be no later than the expiration date of the WUA presented as part of the PID issuance process. *Note: This requirement is an implication of WURevocation_18 in [Topic 38](#a2338-topic-38---wallet-unit-revocation). If the PID would be valid for longer than the WUA, the PID Provider would not be able to use the revocation information in the WUA to verify the revocation status of the Wallet Unit.* |
| ISSU_12d  | If an Attestation Provider supports revocation chaining for its attestations per WURevocation_19 in [Topic 38](#a2338-topic-38---wallet-unit-revocation), the expiration date of an attestation SHALL be no later than the expiration date of the WUA presented as part of the attestation issuance process. *Note: See note in ISSU_12c.* |

###### B - HLRs for PID issuance <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_13 | A Wallet Provider SHALL ensure that at least one PID Provider is willing to issue a PID complying with [PID Rulebook] to Users of the Wallet Units it provides. |
| ISSU_14 | A PID Provider SHALL ensure that all PIDs it issues to Wallet Units comply with the requirements specified in [PID Rulebook]. |
| ISSU_15 | A PID Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing PIDs. |
| ISSU_16 | Empty |
| ISSU_17 | A PID Provider SHALL implement device binding for all PIDs it issues, meaning it SHALL ensure that a PID is cryptographically bound to a WSCA/WSCD included in the Wallet Unit, as specified in requirement WUA_11 in [[Topic 9](#a239-topic-9---wallet-unit-attestation)]. *Notes: - Device binding is called 'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT-VC]. - Discussions on device binding are ongoing, in particular regarding whether non-device-bound PIDs or attestations should be supported by a Wallet Unit, and if so, what the requirements for this support should be.* |
| ISSU_18 | A PID Provider SHALL verify the identity of the subject of the PID in compliance with Level of Assurance (LoA) High requirements. *Note: These requirements will be determined by the relevant eID scheme.* |
| ISSU_18a | A PID Provider SHALL ensure that the attributes attested in the PID issued are valid for the identified PID subject at any point of time of PID validity. |
| ISSU_19 | For the verification of a WUA, a PID Provider SHALL accept the trust anchors in the Wallet Provider Trusted List it needs. *Notes: - The Wallet Provider Trusted List is explained in [[Topic 31](#a2331-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)]. - It is not mandatory for a PID Provider to accept all Wallet Provider Trusted Lists, if there are multiple. This is because it is not mandatory for a PID Provider to accept all certified Wallet Solutions in the EUDI Wallet ecosystem. Each PID Provider will choose which Trusted Lists they need to subscribe to.* |
| ISSU_19a | A PID Provider SHALL support at least one Wallet Solution, meaning that it is willing and able to issue a PID to a Wallet Unit on request of the User. |
| ISSU_20 | To inform its potential PID subjects about the Wallet Solution(s) they can use for requesting a PID, a PID Provider SHALL publish a list of supported Wallet Solutions in such a way that it can be easily found, for example on the PID Provider's website. |
| ISSU_21 | Before issuing a PID, a PID Provider SHALL verify that the Wallet Provider mentioned in the Wallet Unit's WUA is present in a Wallet Provider Trusted List. The PID Provider SHALL also authenticate and validate the WUA using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List. Moreover, it SHALL verify that the Wallet Units's WUA is not revoked. *Notes: - For the WUA, see [[Topic 9](#a239-topic-9---wallet-unit-attestation)] and [[Topic 38](#a2338-topic-38---wallet-unit-revocation)]. - [CIR 2024/2977](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R2977), Article 3 (9), also allows "another authentication mechanism in accordance with an electronic identity scheme notified at assurance level high." However, the ARF does not further specify such other authentication mechanisms, which means that in general they will not be interoperable.* |
| ISSU_22 | A PID Provider SHALL include its PID Provider access certificate in its Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01. |
| ISSU_22a | A PID Provider SHALL sign its metadata (as defined in OpenID4VCI) using the private key corresponding to its PID Provider access certificate. |
| ISSU_22b | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to include its access certificate in its Issuer metadata, according to requirement ISSU_22. |
| ISSU_23 | For the verification of PID Provider access certificates, a Wallet Unit SHALL accept the trust anchors in the Trusted List(s) of Access Certificate Authorities it needs. *Notes: - Access Certificate Authority Trusted Lists are explained in [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. -It is not mandatory for a Wallet Unit to accept all Access Certificate Authority Trusted Lists, if there are multiple. Wallet Providers will choose which Trusted Lists they need to subscribe to, for example depending on the Member State(s) they are operating in.* |
| ISSU_23a | A Wallet Provider SHALL support at least one PID Provider, meaning that its Wallet Units SHALL be capable of requesting the issuance of a PID from these PID Provider(s), and that the Wallet Provider has agreed with the PID Provider(s) that the PID Provider(s) will process such a request according to the agreed rules and procedures. |
| ISSU_23b | Prior to or during installation of a Wallet Instance, the Wallet Provider SHALL notify the User about the PID Provider(s) that are supported by the Wallet Unit. |
| ISSU_24 | A Wallet Unit SHALL authenticate and validate the PID Provider access certificate before requesting the issuance of a PID. The Wallet Unit SHALL verify that the access certificate is authentic and is valid at the time of validation, and that the issuer of the access certificate is a CA that is in a Access Certificate Authority Trusted List. |
| ISSU_24a | Before requesting the issuance of a PID, the Wallet Unit SHALL verify that the PID Provider is indeed a registered PID Provider. The Wallet Unit SHALL do so using information contained in the PID Provider registration certificate, if available. If the registration certificate is not available, the Wallet Unit SHALL use the URL of the Registrar's online service, contained in the PID Provider access certificate, to obtain the necessary information from the Registrar. If the registered information does not confirm that the PID Provider is indeed properly registered as a PID Provider, the Wallet Unit SHALL display a warning to the User, and SHALL NOT request the issuance of a PID.  |

###### C - HLRs for Attestation Issuance <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_25 | An Attestation Provider SHALL ensure all attestations issued to Wallet Units comply with the requirements specified in the applicable Rulebook, as described in [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. |
| ISSU_26 | An Attestation Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing attestations. |
| ISSU_27 | An Attestation Provider SHALL implement device binding for all attestations it issues, meaning it SHALL ensure that an attestation is cryptographically bound to a WSCA/WSCD included in the Wallet Unit, as specified in requirement WUA_11 in [[Topic 9](#a239-topic-9---wallet-unit-attestation)]. *Notes: -Device binding is called 'mdoc authentication'  in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT-VC]. - Discussions on device binding are ongoing, in particular regarding whether non-device-bound PIDs or attestations should be supported by a Wallet Unit, and if so, what the requirements for this support should be.* |
| ISSU_27a | If the subject of the attestation is a natural person, an Attestation Provider SHALL verify the identity of the subject of the attestation, in compliance with applicable requirements and in accordance with relevant standards or Implementing Regulations. *Note: Not every attestation has a natural person as its subject. For example, a holiday voucher may be valid for any User that can present it to a Relying Party and therefore has no subject. This is comparable to the concept of a 'bearer token'.* |
| ISSU_27b | If applicable, an Attestation Provider SHALL ensure that the attributes attested in the attestation issued are valid for the identified attestation subject. |
| ISSU_27c | The Attestation Provider SHALL verify that the User requesting the attestation has the right to receive it. |
| ISSU_28 | For the verification of a WUA, an Attestation Provider SHALL accept the trust anchors in the Wallet Provider Trusted List. *Note: The Wallet Provider Trusted List is explained in [[Topic 31](#a2331-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)].* |
| ISSU_29 | An Attestation Provider SHALL support all Wallet Solutions, except in case the attestation in question is a Strong User Authentication (SUA) attestation as meant in [Topic 20](#a2320-topic-20---strong-user-authentication-for-electronic-payments) and the Wallet Provider does not support processing of the transactional data associated with the SUA attestation. Except for such cases, an Attestation Provider SHALL NOT discriminate between Wallet Solutions when processing a request for the issuance of an attestation.  |
| ISSU_30 | Before issuing an attestation, an Attestation Provider SHALL: - verify that the Wallet Provider mentioned in the Wallet Unit's WUA is present in the Wallet Provider Trusted List. - authenticate and validate the WUA using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List. - verify that the Wallet Unit's WUA is not revoked. *Note: For the WUA, see [[Topic 9](#a239-topic-9---wallet-unit-attestation)] and [[Topic 38](#a2338-topic-38---wallet-unit-revocation)].* |
| ISSU_31 | Empty |
| ISSU_32 | An Attestation Provider SHALL include its Attestation Provider access certificate and registration certificate(s) in its Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01. |
| ISSU_32a | An Attestation Provider SHALL sign its metadata (as defined in OpenID4VCI) using the private key corresponding to its Attestation Provider access certificate. |
| ISSU_33 | For the verification of Attestation Provider access certificates, a Wallet Unit SHALL accept the trust anchors in all applicable Access Certificate Authority Trusted List(s). *Note: Access Certificate Authority Trusted Lists are explained in [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. There may be separate Access Certificate Authority Trusted Lists for QEAA Providers, PuB-EAA Providers, and EAA Providers.* |
| ISSU_33a | For the verification of Attestation Provider registration certificates, a Wallet Unit SHALL accept the trust anchors in all Trusted List(s) for Providers of registration certificates. |
| ISSU_33b | A Wallet Provider SHALL support all Attestation Providers, except possibly if the attestation in question is a Strong User Authentication (SUA) attestation as meant in [Topic 20](#a2320-topic-20---strong-user-authentication-for-electronic-payments) and the Wallet Provider chooses to not support processing of the transactional data associated with that attestation. Except for such cases, Wallet Units SHALL be capable of requesting the issuance of a QEAA, PuB-EAA, or non-qualified EAA from all Attestation Providers at the User's request. |
| ISSU_34 | A Wallet Unit SHALL authenticate and validate the Attestation Provider access certificate before requesting the issuance of an attestation. The Wallet Unit SHALL verify that the access certificate is authentic and is valid at the time of validation, and that the issuer of the access certificate is a CA that is in an Access Certificate Authority Trusted List, as documented in [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. |
| ISSU_34a | Before requesting the issuance of an attestation, the Wallet Unit SHALL verify that the Attestation Provider is a registered QEAA Provider, PuB-EAA Provider, or EAA Provider. The Wallet Unit SHALL also verify the Provider's entitlements, i.e., whether the Provider properly registered for the issuance of the type of attestation that the User wants to obtain. The Wallet Unit SHALL do these checks using information contained in the Attestation Provider registration certificate, if available. If the registration certificate is not available, the Wallet Unit SHALL use the URL of the Registrar's online service, contained in the Attestation Provider access certificate, to obtain such information. If the registered information does not confirm that the Provider is registered as a QEAA Provider, PuB-EAA Provider, or EAA Provider, or if the registered information does not confirm that the Provider registered for the relevant type of attestation, the Wallet Unit SHALL display a warning to the User, and SHALL NOT request the issuance of an attestation.  |

###### D - HLRs for Privacy Risks and Mitigation <!-- omit from toc -->

These HLRs were added as a result of the discussions of Topic A,
Privacy risks and mitigation. For more background information on these
requirements, please refer to
[Section 7.4.3.5 of the ARF main document](../../architecture-and-reference-framework-main.md#7435-risks-and-mitigation-measures-related-to-user-privacy) and to the [Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_35 | A PID Provider or Attestation Provider SHALL ensure that all unique elements in a PID or attestation have values that are unique across all PIDs or attestations issued by that Provider. This SHALL include at least a) the salt used for hashing every attribute, b) the hash values of all attributes, c) the attestation identifier or index used for revocation purposes (if applicable), d) the attestation public key used for device binding, and e) the value of the Attestation Provider signature.  *Notes: - The list of unique elements is based on [ISO/IEC 18013-5] and [SD-JWT VC]. - This requirement can be achieved, for example, by ensuring that salt values, indexes and attestation identifiers are pseudo-random numbers generated by a cryptographically secure pseudo-random number generator (CSPRNG).* |
| ISSU_35a | A Wallet Provider SHALL ensure that all unique elements in a WUA have values that are unique across all WUAs issued by that Wallet Provider. This SHALL include at least a) the attestation identifier or index used for revocation purposes, b) the WUA public key used for device binding, and c) the value of the Wallet Provider signature.  *Note: The list of unique elements is based on [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).* |
| ISSU_35b | After issuing a PID, attestation, or WUA, a PID Provider, Attestation Provider or Wallet Provider SHALL discard the values of all unique elements, including at least the ones mentioned in requirement ISSU_35 or ISSU_35a (as applicable) above, as well as any timestamps, as soon as they are no longer needed. The Provider SHALL NOT communicate these values to any other party inside or outside the EUDI Wallet ecosystem. |
| ISSU_36 | When issuing PIDs, attestations, or WUAs in a batch to a Wallet Unit, a PID Provider, Attestation Provider, or Wallet Provider SHALL ensure that the timestamps in these PIDs, attestations, or WUAs do not enable Relying Parties to conclude that they are part of the same batch (and therefore belong to the same User). *Note: This can be done, for example, by making timestamps sufficiently imprecise that a high number of batches, each issued to a different Wallet Unit, share the same timestamp values (herd privacy).* |
| ISSU_37 | A Wallet Provider SHALL ensure that its Wallet Solution supports the following methods for limiting the number of times a User can present the same PID or attestation to Relying Parties: Method A (Once-only attestations, as specified in requirement ISSU_43 - ISSU_47) and Method B (Limited-time attestations, as specified in requirement ISSU_48 - ISSU_50). In addition, a Wallet Provider MAY ensure that its Wallet Solution supports Method C (Rotating-batch attestations, as specified in requirement ISSU_51 - ISSU_54) or Method D (Per-Relying Party attestations, as specified in requirement ISSU_55 - ISSU_57). *Note: Wallet Solutions, PID Providers, Attestation Providers, and Wallet Providers are free to define and use other methods as well. However, such other methods are out of scope of the ARF.* |
| ISSU_38 | A PID Provider, Attestation Provider, or Wallet Provider SHALL have a policy describing which of the methods A, B, C, or D, it will use to limit the number of times a Wallet Unit may present a single PID, attestation, or WUA. For each supported method, the policy SHALL also specify how the values for respective parameters for that method, such as technical validity period and batch size, will be chosen. The goal of the policy SHALL be to ensure that the risk of linkability is mitigated to an acceptable level, given the (expected) usage of the PID, attestation, or WUA by the User. To determine what an acceptable level of risk is, the PID Provider, Attestation Provider, or Wallet Provider SHALL carry out a risk analysis regarding linkability. *Notes: If an Attestation Provider issues multiple attestation types, these requirements apply for each type of attestation separately.* |
| ISSU_39 | The Commission SHALL create or reference a profile or extension of the OpenID4VCI specification enabling a PID Provider, Attestation Provider, or Wallet Provider to indicate in their OpenID4VCI Issuer metadata which of the methods A, B, C, or D the Wallet Unit must use for the PID, attestation, or WUA issued. Indicated methods SHALL be ordered by preference. This profile or extension SHALL also enable the PID Provider, Attestation Provider, or Wallet Provider to set the value of parameters to be used by the Wallet Unit for each method (if applicable). *Note: For example, the parameters to be set for method A include the lower limit for unused attestations and the batch size to be requested.* |
| ISSU_40 | PID Providers, Attestation Providers, and Wallet Providers SHALL indicate in their OpenID4VCI Issuer metadata at least that either method A or method B must be used for a given type of PID, attestation, or WUA. PID Providers, Attestation Providers, and Wallet Providers MAY additionally indicate that it prefers using method C and/or method D over method A or method B. In such a case, a Wallet Unit supporting method C and/or method D SHALL use that method, while a Wallet Unit not supporting these methods SHALL use method A or method B, as applicable. *Example: An Attestation Provider indicates methods {D, C, A} in their metadata, in that order. A Wallet Unit that supports methods C and D (as well as A and B) then uses method D for this type of attestation. A Wallet Unit supporting methods A, B and C uses method C. A Wallet Unit supporting only methods A and B uses method A.* |
| ISSU_41 | To the maximum extent possible, Wallet Providers, PID Providers, and Attestation Providers SHALL ensure that Users do not notice which of the methods A, B, C, or D is used for their PIDs, attestations, or WUAs.|
| ISSU_42 | To the maximum extent possible, Wallet Providers, PID Providers, and Attestation Providers SHALL ensure that no User action is needed for the re-issuance of WUAs, PIDs, or attestations. *Note: For the topic of re-issuance, see also the [Discussion Paper for Topic B](../../discussion-topics/b-re-issuance-and-batch-issuance-of-pids-and-attestations.md).* |

###### Method A: Once-only attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method A for a given type of PID, attestation, or WUA. For more
information on this method, please refer to
[Section 3.2 of the Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md#32-method-a-once-only-attestations).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_43 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to issue PIDs, attestations, or WUAs in batches to the Wallet Unit. All PIDs, attestations, or WUAs in a batch SHALL have the same attribute values and the same technical validity period. |
| ISSU_44 | The Wallet Unit SHALL present each PID, attestation, or WUA only once to a Relying Party, except when it has fallen back to Method B as specified below, or to another available method. |
| ISSU_45 | The Wallet Unit SHALL have a lower limit for the number of unused PIDs, attestations, or WUAs it holds, and SHALL request the issuance of a new batch when this limit is reached. During the first issuance of a new PID, attestation, or WUA, see requirement ISSU_39, the PID Provider, Attestation Provider or Wallet Provider SHALL inform the Wallet Unit about the value of the lower limit and the size of the batch to be requested. |
| ISSU_46 | If the Wallet Unit must request a new batch of PIDs, attestations, or WUAs, but is not able to do so because it is offline, the Wallet Unit SHALL warn the User that they are about to lose the possibility to present this PID or attestation to a Relying Party (or request (re-)issuance of a PID or attestation, in case of the WUA) and request them to connect their device to the internet. |
| ISSU_47 | If the Wallet Unit has run out of unused PIDs, attestations, or WUAs, but is not able to request a new batch because it is offline, it SHALL fall back to method B (see requirement 6), or another available method. This means that, when requested by a Relying Party or Attestation Provider, the Wallet Unit SHALL again present one of the already used PIDs, attestations or WUAs. The Wallet Unit SHALL return to using method A as soon as it is able to go online and request a new batch of PIDs, attestations, or WUAs. |

###### Method B: Limited-time attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method B for a given type of PID, attestation, or WUA. See also
[Section 3.3 of the Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md#33-method-b-limited-time-attestations).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_48 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to issue a single PID, attestation, or WUA to the Wallet Unit.|
| ISSU_49 | The Wallet Unit SHALL present that PID, attestation, or WUA multiple times to the same Relying Party or Attestation Provider, or to different Relying Parties or Attestation Providers, when requested to do so. |
| ISSU_50 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to re-issue a PID, attestation, or WUA some time before the one existing in the Wallet Unit expires. The PID Provider, Attestation Provider, or Wallet Provider SHALL inform the Wallet Unit about the moment at which the Wallet Unit must request the re-issuance of a PID, attestation, or WUA, relative to the expiration date of the existing one. *Note: It is the responsibility of the Relying Party receiving a PID or attestation (or the Attestation Provider receiving a WUA) to validate whether a presented PID, attestation, or WUA is temporally valid. A Wallet Unit is allowed to present a PID, attestation, or WUA even if its expiration date is in the past.* |

###### Method C: Rotating-batch attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method C for a given type of PID, attestation, or WUA. See also
[Section 3.4 of the Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md#34-method-c-rotating-batch-attestations).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_51 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to issue PIDs, attestations, or WUAs in batches to the Wallet Unit. All PIDs, attestations, or WUAs in a batch SHALL have the same attribute values and the same technical validity period. |
| ISSU_52 | When a presentation of attributes is requested by multiple Relying Parties, the Wallet Unit SHALL present each PID or attestation in a batch once, in a random order. Similarly, when a WUA is requested by multiple Attestation Providers, the Wallet Unit SHALL present each WUA in a batch once, in a random order. |
| ISSU_53 | When all PIDs, attestations, or WUAs in a batch have been presented once, the Wallet Unit SHALL reset the batch, and start presenting each PID, attestation, or WUA in the batch again in a random order. |
| ISSU_54 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to re-issue a batch of PIDs, attestations, or WUAs, some time before the batch in the Wallet Unit expires. The PID Provider, Attestation Provider, or Wallet Provider SHALL inform the Wallet Unit about the size of the batch and about the moment at which the Wallet Unit must request the re-issuance of a batch, relative to the expiration date of the existing one. |

###### Method D: Per-Relying Party attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method D for a given type of PID, attestation, or WUA. See also
[Section 3.5 of the Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md#35-method-d-per-relying-party-attestations).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_55 | The Wallet Unit SHALL present a different PID, attestation, or WUA to each different Relying Party or Attestation Provider upon their request. This means that it SHALL comply with Method A for such Relying Parties or Attestation Providers. |
| ISSU_56 | In case a given Relying Party requests attributes from a given type of PID or attestation multiple times, the Wallet Unit MAY present the same PID or attestation to this Relying Party each time. If it does, it SHALL comply with Method B or Method C for such a Relying Party. |
| ISSU_56a | In case a given Attestation Provider requests a WUA multiple times, the Wallet Unit MAY present the same WUA to this Attestation Provider each time. If it does, it SHALL comply with Method B or Method C for such an Attestation Provider. |
| ISSU_57 | The Wallet Unit SHALL keep track of which PID or attestation it has presented to which Relying Party, using the unique identifier from the respective access certificate, unless the Relying Party is an intermediary. If the Relying Party is an intermediary, the Wallet Unit SHALL use the unique identifier obtained from the registration certificate or from the extension of the presentation request meant in RPI_06. *Note: The Wallet Unit can see that a presentation request is from an intermediary either because this is indicated in the registration certificate or because the extension meant in RPI_06 and RPI_06a is present.* |
| ISSU_57a | The Wallet Unit SHALL keep track of which WUA it has presented to which Attestation Provider, using the unique identifier obtained from the respective access certificate. |

###### E - HLRs for re-issuance and batch issuance of PIDs, attestations and WUAs <!-- omit from toc -->

These HLRs were added as a result of the discussions of Topic B,
re-issuance and batch issuance of PIDs, attestations and WUAs. For more background
information on these requirements, please refer to [Sections 6.6.2.7](../../architecture-and-reference-framework-main.md#6627-batch-issuance)
and
[6.6.5.2](../../architecture-and-reference-framework-main.md#6652-pid-or-attestation-re-issuance) of the ARF main document, and to the [Discussion Paper for Topic B](../../discussion-topics/b-re-issuance-and-batch-issuance-of-pids-and-attestations.md).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_58 | A Wallet Unit SHALL give its User the option to manually initiate a re-issuance process for any of the PIDs or attestations in their Wallet Unit. *Note: This requirement does not apply for WUAs, since Users must not be involved in the management of WUAs.* |
| ISSU_59 | After a successful re-issuance, a Wallet Unit SHALL compare the attribute values of the re-issued PID or attestation with those of the existing PID or attestation, and SHALL notify the User in case of any differences. *Note: This requirement does not apply for WUAs, since Users must not be involved in the management of WUAs.* |
| ISSU_60 | A Wallet Unit SHALL gracefully handle situations in which re-issuance of a PID,  attestation, or WUA is refused by the PID Provider, Attestation Provider, or Wallet Provider,for example by attempting a retry after an appropriate delay. |
| ISSU_61 | A Wallet Unit SHALL support PID or attestation first-time batch issuance with a single User authentication, regardless of the size of the batch. *Notes: - See also requirement WIAM_14. - This requirement does not apply for WUAs, since Users must not be involved in the management of WUAs.* |
| ISSU_62 | If a PID, attestation, or WUA was successfully re-issued because the value of one or more of its attributes was changed (including attributes being added or deleted), a Wallet Unit SHOULD delete the correct pre-existing PID, attestation, or WUA. *Notes: - It is up to the Wallet Unit, possibly using metadata provided by the PID Provider, Attestation Provider, or Wallet Provider using the [OpenID4VCI] protocol, to determine the PID, attestation, or WUA to be deleted. - Additionally, per requirement VCR_09, the PID Provider, Attestation Provider, or Wallet Provider revokes the pre-existing PID, attestation, or WUA.* |
| ISSU_63 | PID Providers, Attestation Providers, Wallet Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the re-issuance of PIDs, attestations, and WUAs. |
| ISSU_64 | PID Providers, Attestation Providers, Wallet Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the batch issuance of PIDs, attestations, and WUAs. |
| ISSU_65 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider, Attestation Provider or Wallet Provider to verify that a re-issued PID, attestation, or WUA is bound to the same WSCA/WSCD to which the existing PID, attestation, or WUA is bound. *Note: This can be done, for instance, by requiring that OAuth 2.0 Demonstrating Proof of Possession (DPoP) [RFC 9449] is used for each Refresh Token, and that the public key in the DPoP proof is identical to the public key in the existing PID, attestation, or WUA issued to the Wallet Unit previously.* |

#### A.2.3.11 Topic 11 - Pseudonyms

##### Description <!-- omit from toc -->

Wallet Units will support generating pseudonyms for Users in compliance with the
W3C WebAuthn API specification, [W3C WebAuthn](https://www.w3.org/TR/2021/REC-webauthn-2-20210408/). On a high level, this means that
the WSCA/WSCD in the Wallet Unit will be able to create key pairs. The public keys of
these pairs function as pseudonyms for the User. Only the User can use these
pseudonyms, since the WSCA/WSCD authenticates the User before allowing a pseudonym to
be used, see requirement WIAM_14. The Wallet Unit will keep an internal structure
to associate each pseudonym (public key) with a specific Relying Party, based on
the Relying Party unique identifier in the Relying Party Instance access
certificate mentioned in requirement Reg_32.

Pseudonyms were discussed with Member States in Topic E. These
discussions included the use cases for which Wallet Units must support
pseudonyms and the HLRs for the technical specification of how it must be
implemented. The below HRLs are the result of this discussion. For more
background information on these requirements, please refer to the [Discussion
Paper for Topic E](../../discussion-topics/e-pseudonyms-including-user-authentication-mechanism.md).

**NOTE: As specified in requirement PA_21, the Commission will create or reference a technical specification containing a profile or extension of the [W3C WebAuthn] specification. The HLRs below are in fact requirements to be fulfilled by this technical specification. Discussions on the pseudonyms are ongoing.**

###### A. HLRs related to Use Cases <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_01 | A Wallet Unit SHALL enable a User to generate a Pseudonym and register it at a Relying Party.|
| PA_02 | A Wallet Unit SHALL enable a User to authenticate with a Pseudonym towards a Relying Party if the Wallet Unit was used previously to register the Pseudonym for the same Relying Party. |
| PA_03 | A Wallet Unit SHALL be able to perform the actions specified in the above two requirements independently of whether the interaction with the Relying Party is initiated on the same device hosting the Wallet Instance or on a device different from the one hosting the Wallet Instance. |
| PA_04 | A Wallet Unit SHALL enable the User to use multiple different Pseudonyms at a given Relying Party. |
| PA_05 | A Wallet Unit SHOULD enable a User to freely choose a User alias for each Pseudonym registered at a Relying Party. Setting an alias SHOULD be optional for the User. The User SHOULD be able to change the alias for any Pseudonym. |
| PA_06 | A Wallet Unit SHALL enable a User to choose which Pseudonym to authenticate with towards a Relying Party, if multiple Pseudonyms are registered for this Relying Party. The Wallet Unit SHOULD present the User with the aliases of the applicable Pseudonyms, if assigned, when making this choice. |
| PA_07 | A Wallet Unit SHALL enable a User to delete a Pseudonym. |
| PA_08 | A Wallet Unit SHALL enable the User to manage Pseudonyms within the Wallet Unit in a user-friendly and transparent manner. |
| PA_08a | A Wallet Unit SHALL log Pseudonym registration and presentation transactions as specified in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). |
| PA_09 | A Wallet Unit SHALL enable the User to see all existing pseudonyms, including the associated Relying Party. |

###### B. HLRs related to Relying Parties <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_10 | A Relying Party SHALL be able to verify that a User is registering a Pseudonym using a non-revoked Wallet Unit. |
| PA_11 | A Relying Party SHALL be able to verify that a User is authenticating with a Pseudonym using a non-revoked Wallet Unit. |
| PA_12 | If Wallet Unit is used to register a Pseudonym at a Relying Party in combination with a PID, attestation or WUA being presented to the same Relying Party, then this Relying Party SHALL be able to verify that the same User performed both actions. |
| PA_13 | The Relying Party SHALL be able to validate that the pseudonym presented to them belongs to the User presenting it. |

###### C. HLRs related to privacy <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_14 | A Wallet Unit SHALL store the information necessary for authenticating with a Pseudonym in its WSCA/WSCD. |
| PA_15 | A Relying Party SHALL NOT be able to derive the User's true identity, or any data identifying the User, from the Pseudonym value received by the Relying Party. |
| PA_16 | A Wallet Unit SHALL NOT reveal the same Pseudonym to different Relying Parties unless the User explicitly chooses otherwise. |
| PA_17 | It SHALL NOT be possible to correlate Pseudonyms based on their values nor on other metadata sent by the Wallet Unit during registration and authentication, meaning that colluding Relying Parties SHALL NOT able to conclude that different Pseudonyms belong to the same User. |
| PA_18 | The Wallet Unit SHALL ensure that Pseudonyms contain sufficient entropy to make the chance of colliding Pseudonyms (meaning two Users having the same Pseudonym value for the same Relying Party) negligible. |
| PA_19 | A Wallet Unit SHALL NOT share the User's optionally assigned Pseudonym aliases with any Relying Party. |
| PA_20 | The Wallet Unit SHALL verify the identity of a Relying Party when a User registers a Pseudonym or authenticates with a Pseudonym, provided the profile or extension of [W3C WebAuthn] meant in PA_21 enables the Wallet Unit to do this. In case the profile or extension does not enable this, the Wallet Unit SHALL trust the WebAuthn Client (i.e., the browser) to verify the Relying Party identity. *Notes: - [W3C WebAuthn] currently does not offer a way for an Authenticator (i.e., the Wallet Unit) to authenticate a Relying Party. Instead, the Client (i.e., the browser) will authenticate the Relying Party, using TLS.*|

###### D. HLRs related to interoperability <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_21 | The Commission SHALL create or reference a technical specification containing a profile or extension of the [W3C WebAuthn] specification compliant with the HLRs specified in this Topic. This specification SHALL contain all details necessary for Wallet Units and Relying Parties to generate, register, and use Pseudonyms. |
| PA_22 | Wallet Providers SHALL ensure that their Wallet Solution supports the [W3C WebAuthn] specification and the technical specification meant in requirement PA_21. |

#### A.2.3.12 Topic 12 - Attestation Rulebooks

##### Description <!-- omit from toc -->

Article 45e of the [European Digital Identity Regulation] sets up the legal
basis for the Commission to "where necessary, establish specifications and
procedures for the catalogue of attributes and schemes for the attestation of
attributes and verification procedures for qualified electronic attestations of
attributes". As described in [Section 5.6 of the ARF main document](../../architecture-and-reference-framework-main.md#56-catalogues), these 'schemes for the
attestation of attributes' will be described in so-called Attestation Rulebooks.
A separate Rulebook will be created for each type of attestation. This Topic
describes the high-level requirements for the Attestation Rulebooks that will
specify the details of new types of attestations.

Attestation Rulebooks will be written by Attribute Schema Providers, a role
which can be assumed by different types of organisation. The goal of this Topic
is to ensure that all Rulebooks that will be written in the future will contain
the same type of information and the same level of detail, such that all
attestations are interoperable.

Attestation Rulebooks may be registered and published in a publicly accessible
catalogue, as described in [Topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabularies-for-attributes).

##### HLRs <!-- omit from toc -->

###### A. Requirements regarding attestation formats <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| ARB_01 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL specify that one or more of the following two common format(s) must be used for these attestations: - The format specified in ISO/IEC 18013-5, see [ISO18013-5]. - The format specified in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC]. |
| ARB_01a | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify that one or more of the following three common format(s) must be used for these attestations: - The format specified in ISO/IEC 18013-5, see [ISO18013-5]. - The format specified in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC]. - The format specified in "W3C Verifiable Credentials Data Model", see [W3C VCDM v2.0]. |
| ARB_01b | The Schema Provider for an Attestation Rulebook describing attestations using the format specified in [SD-JWT VC] SHALL ensure that these attestations comply with the 'SD-JWT VCs' profile specified in [HAIP]. |
| ARB_02 | The Schema Provider for an Attestation Rulebook SHALL analyse whether it must be possible for a User to present that type of attestation when the Wallet Unit and the Relying Party are in proximity and attestations are presented without using the internet. If so, the Attestation Rulebook SHALL specify that the attestations must be issued in the ISO/IEC 18013-5-compliant mdoc format. *Note: In theory, it is possible to use SD-JWT VC-compliant attestations in proximity use cases. In practice, however, the only protocol available to request and release SD-JWT VC-compliant attestations between a Wallet Unit and a Relying Party Instance is OpenID4VP. That protocol cannot be used without internet connectivity.* |
| ARB_03 | The Schema Provider for an Attestation Rulebook MAY specify in the Attestation Rulebook that that type of attestation must be issued in the [SD-JWT VC]-compliant format, provided the [SD-JWT VC] specification has been approved by an EU standardisation body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the [European Digital Identity Regulation].|
| ARB_04 | If an Attestation Rulebook specifies that a type of attestation can be issued in a format compliant with [W3C VCDM v2.0], the Schema Provider for that Attestation Rulebook SHALL ensure the Rulebook references one or more documents specifying in detail how a Relying Party can request attributes from a such an attestation, and how a User can selectively disclose attributes from such an attestation. Moreover, these referenced documents SHALL be approved by an EU standardisation body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the [European Digital Identity Regulation]. |

###### B. Requirements regarding attestation types <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| ARB_05 | The Schema Provider for an Attestation Rulebook SHALL specify a value for the attestation type, which SHALL be unique within the scope of the EUDI Wallet ecosystem. *Notes: - In ISO/IEC 18013-5, the attestation type is called 'document type' and is included as a "docType" key-value pair in both the mdoc request and the mdoc response. Also, a method for generating unique attestation type values is recommended. - In OpenID4VP, the attestation type is included in the "id" property of an Input Descriptor in a Presentation Request. - In [SD-JWT VC], the attestation type is called 'SD-JWT VC type' and is included as a 'vct' claim in the SD-JWT VC.* |

###### C. Requirements regarding attestation attribute schemas <!-- omit from toc -->

| **Index** | **Requirement specification** |
| -----| --------|
| ARB_06 | The Schema Provider for an Attestation Rulebook SHALL define all attributes that an attestation of that type may contain. This definition SHALL first describe the semantics of each attribute in an encoding-independent manner and SHALL subsequently for each attribute specify an ISO/IEC 18013-5-compliant format, an SD-JWT VC-compliant format, or both, as needed given the choices made according to ARB_01 - ARB_04. |
| ARB_06a | For ISO/IEC 1803-5-compliant attestations, the Attestation Rulebook SHALL define each attribute within an attribute namespace. An attribute namespace SHALL fully define the identifier, the syntax, and the semantics of each attribute within that namespace. An attribute namespace SHALL have an identifier that is unique within the scope of the EUDI Wallet ecosystem, and each attribute identifier SHALL be unique within that namespace. *Note: In ISO/IEC 18013-5, namespaces are discussed and a method for generating unique namespace identifiers is recommended.*|
| ARB_06b | For [SD-JWT VC]-compliant attestations, the Schema Provider for the Attestation Rulebook SHALL ensure that each claim name is either included in the IANA registry for JWT claims, or is a Public Name as defined in [RFC 7519]. *Note: [SD-JWT VC] does not discuss how to avoid conflicting claim names. Since SD-JWTs are a special kind of JWTs, the methods specified in RFC 7519 are applicable.*|
| ARB_07 | When determining the attributes to be included in a new attestation type, the Schema Provider for the applicable Attestation Rulebook SHOULD consider referring to attributes that are already included in the catalogue specified in [Topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabularies-for-attributes) + [26](#a2326-topic-26---catalogue-of-attestations), rather than unnecessarily re-defining all attributes within a new namespace.|
| ARB_08 | The Schema Provider for an Attestation Rulebook SHOULD, when specifying a new attribute, take into consideration existing conventions for attribute identifier values and attribute syntaxes. *Note: These conventions may depend on the format of the attestation, i.e., CBOR for ISO/IEC 18013-5-compliant attestations or JSON for SD-JWT VC-compliant attestations.* |
| ARB_09 | The Schema Provider for an Attestation Rulebook SHALL specify, for each attribute in the attestation, whether the presence of that attribute is mandatory, optional, or conditional. |
| ARB_10 | The Schema Provider for an Attestation Rulebook for an ISO/IEC 18013-5 compliant attestation MAY define a domestic namespace to specify attributes that are specific to that Rulebook and are not included in the applicable EU-wide or sectoral namespace. All requirements for namespaces in this Topic also apply for domestic namespaces. |
| ARB_11 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook an attribute as meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point a) and [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point a) of the [European Digital Identity Regulation]. This attribute SHALL reference the technical specification meant in ARB_25. |
| ARB_12 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include an attribute in the Rulebook indicating that the attestation is an EAA. This attribute SHALL reference the technical specification meant in ARB_25. |
| ARB_13 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point b) of the [European Digital Identity Regulation]. |
| ARB_14 | The Schema Provider for an attestation Rulebook describing a type of attestation that is a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point b) of the [European Digital Identity Regulation]. |
| ARB_15 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point b) of the [European Digital Identity Regulation]. |
| ARB_16 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point c) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e46-55-1) point c) of the [European Digital Identity Regulation]. |
| ARB_17 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point c) of the [European Digital Identity Regulation]. |
| ARB_18 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point e) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point e) of the [European Digital Identity Regulation]. |
| ARB_19 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point e) of the [European Digital Identity Regulation]. |
| ARB_20 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata representing the location meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point h) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point h) of the [European Digital Identity Regulation]. For a QEAA, this location SHALL indicate at least the URL at which a machine-readable version of the trust anchor to be used for verifying the QEAA can be found or looked up. For a PuB-EAA, this location SHALL indicate at least the URL at which a machine-readable version of the qualified certificate that signed the PuB-EAA can be found or looked up. |
| ARB_21 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes or metadata representing the location at which a machine-readable version of the trust anchor to be used for verifying the EAA can be found or looked up.*Note: What this location indicates precisely is dependent on the nature of the mechanism used for distributing trust anchors; see requirement ARB_26.* |

###### D. Miscellaneous requirements <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------------|
| ARB_22 | The Schema Provider for an Attestation Rulebook SHALL specify all technical details necessary to ensure interoperability, security, and privacy of that attestation. *Note: An Attestation Rulebook may also specify requirements regarding how the Wallet Unit must display the attestation and the attributes in it to the User.* |
| ARB_23 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL specify which of the revocation mechanisms specified in [Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking) SHALL be supported by that attestation. |
| ARB_24 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify whether that type of EAA must be revocable. If an EAA type must be revocable, the relevant Rulebook SHALL determine which of the revocation mechanisms specified in [Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking) SHALL be supported by that attestation. |
| ARB_25 | The Commission SHALL take measures to ensure that the following information is included in a technical specification: - The identifier of the attribute containing the indication meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point a) and [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point a). - The syntax and semantics of this attribute in case the attestation is a QEAA, in case it is PuB-EAA, and in case it is a non-qualified EAA. |
| ARB_26 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD define in the Rulebook: - mechanisms allowing a Wallet Unit to verify that the EAA Provider is authorised or registered to issue this type of EAA. - mechanisms allowing a Relying Party to obtain, in a trustworthy manner, the trust anchor(s) of the EAA Providers issuing this type of EAA. |
| ARB_27 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA, PuB-EAA, or non-qualified EAA SHOULD specify in the Rulebook whether a Relying Party receiving the attestation must request and verify a PID and verify the cryptographic binding between the PID and the attestation. *Note: Relying Parties can only do so in a trustworthy manner if Wallet Units are able to provide a proof of cryptographic binding showing that the private keys of the attestation and the PID are stored in the same WSCD, in accordance with the requirements in [Topic 18](#a2318-topic-18---combined-presentations-of-attributes).* |
| ARB_28 |  An Attribute Schema Provider SHOULD specify an attribute in an Attestation Rulebook that indicates whether the Attestation Provider during attestation issuance requested a cryptographic binding (as specified in [Topic 18](#a2318-topic-18---combined-presentations-of-attributes)) between the new attestation and an existing PID or attestation. If present in a Rulebook, the identifier for this attribute SHALL be "cryptographically_bound_to", and its contents SHALL be an attestation type or vct (see ARB_05). *Note: The meaning of this attribute, if present, is "This attestation is cryptographically bound to one or more attestations of the given attestation type or vct on this Wallet Unit." If a Relying Party receives this attribute from a Wallet Unit, it can subsequently request the Wallet Unit to send a proof of cryptographic binding between the attestation and an attestation indicated in the "cryptographically_bound_to" attribute.* |
| ARB_29 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA, PuB-EAA, or non-qualified EAA SHOULD ensure that the structure and contents of the Attestation Rulebook follow the descriptions in the [Attestation Rulebook template](https://github.com/eu-digital-identity-wallet/eudi-doc-attestation-rulebooks-catalog/blob/main/template/attestation-rulebook-template.md). |

#### A.2.3.13 Topic 13 - Developing a Wallet Unit architecture based on Secure Element

There are no HLRs for this Topic.

#### A.2.3.14 Topic 14 - Developing a Wallet Unit architecture based on External Token

There are no HLRs for this Topic.

#### A.2.3.15 Topic 15 - Developing a Wallet Unit architecture based on Remote HSM

There are no HLRs for this Topic.

#### A.2.3.16 Topic 16 - Signing documents with a Wallet Unit

##### Description <!-- omit from toc -->

A Wallet Unit SHALL enable its User to create qualified electronic
signatures or seals. This goal can be reached by using signature or seal
creation capabilities of the Wallet Unit as a part of a local QSCD,
or by using a remote QSCD managed by a QTSP.

This Topic contains high-level requirements related to the creation of
Qualified Electronic Signatures using a Wallet Unit.

##### HLRs <!-- omit from toc -->

###### A. Requirement for Wallet Providers <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------|
| QES_01 | Wallet Providers SHALL ensure that each User has the possibility to receive a qualified certificate for Qualified Electronic Signatures, bound to a QSCD, that is either local, external, or remotely managed in relation to the Wallet Instance. |
| QES_02 | Wallet Providers SHALL ensure that each User who is a natural person has, at least for non-professional purposes, free-of-charge access to a Signature Creation Application which allows the creation of free-of-charge Qualified Electronic Signatures using the certificates referred to in QES_01. Wallet Providers SHALL ensure that: - The Signature Creation Application SHALL, as a minimum, be capable of signing or sealing User-provided data and Relying Party-provided data. - The Signature Creation Application SHALL be implemented as part of a Wallet Solution or external to it (by providers of trust services or by Relying Parties). - The Signature Creation Application SHALL be able to generate signatures or seals in formats compliant with at least the mandatory formats referred to in QES_08. *Notes: - Signature Creation Application (SCA): see definition in the ETSI TS 119 432 standard. - If the SCA is external to the Wallet Solution, it may be for example a separate mobile application, or be hosted remotely, for instance by the QTSP or by a Relying Party.* |
| QES_03 | For the use of the qualified certificate referred to in QES_01, Wallet Providers SHALL ensure that a Wallet Unit implements secure authentication of the User, as well as signature or seal invocation capabilities, as a part of a local, external or remote QSCD. |
| QES_04 | Wallet Providers SHALL enable their Wallet Units to interface with QSCDs using protocols and interfaces necessary for the implementation of secure User authentication and signature or seal functionality. *Note: In a Relying Party-centric flow, the remote QTSP will likely be selected by the Relying Party, which implies the QSCD is managed by the remote QTSP. In a Wallet Unit-driven flow, the User should be able to choose the QSCD.* |
| QES_05 | Wallet Providers SHALL enable their Wallet Units to be used for User enrolment to a remote QES Provider (i.e., a QTSP offering remote QES), except where the Wallet Unit interfaces with local or external QSCDs. |
| QES_06 | Wallet Providers SHALL ensure that their Wallet Solution supports at least one of the following options for remote QES signature creation: - remote QES creation through secure authentication to a QTSP signature web portal, - remote QES creation channelled by the Wallet Unit, - remote QES creation channelled by a Relying Party. |
| QES_07 | Wallet Providers SHALL ensure that, where a Signature Creation Application relies on a remote Qualified Signature Creation Device and where it is integrated into a Wallet Instance, it supports the Cloud Signature Consortium API Specification 2.0 [CSC API]. |
| QES_08 | Wallet Providers SHALL ensure that their Wallet Units are able to create signatures or seals in accordance with the mandatory PAdES format as specified in ETSI EN 319 142-1 V1.1.1 (2016-04). In addition, Wallet Providers SHOULD ensure that their Wallet Units are able to create signatures or seals in accordance with the following formats: - XAdES as specified in ETSI EN 319 132-1 V1.2.1 (2022-02), - JAdES as specified in ETSI TS 119 182-1 V1.2.1 (2024-07), - CAdES as specified in ETSI EN 3191 22-1 V1.3.1 (2023-06), and - ASiC as specified in ETSI EN 319 162-1 V1.1.1 (2016-04) and ETSI EN 319 162-2 V1.1.1 (2016-04). |
| QES_09 | Empty |
| QES_10 | Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit and is used to generate signatures or seals of the representation of the document or data to be signed or sealed, the Wallet Unit presents the representation of the document or data to be signed or sealed to the User. |
| QES_11 | Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit, a Wallet Unit computes the hash or digest of the document or data to be signed through a Signature Create Application component. |
| QES_12 | Wallet Providers SHALL ensure that a Wallet Unit is able to create the signature value of the document or data to be signed either using a local or a remote signing application. *Note: a local signing application is on-device. It may either be embedded in the Wallet Unit or be an external application.* |
| QES_13 | Wallet Providers SHALL ensure that a Wallet Unit provides a log of transactions related to qualified electronic signatures or seals generated by or through the Wallet Unit, allowing the User to view the history of previously signed data or documents, according to requirement DASH_04 in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). *Note: If the signature is generated by a remote Signature Creation Application, the Wallet is at minimum used to authenticate the User to the remote QTSP and to obtain the User's consent for the usage of the private signing key. The logs then record information about these processes.* |
| QES_14 | Wallet Providers SHALL ensure that the User will be able to explicitly authorise the creation of a qualified electronic signature or seal through their Wallet Unit. |
| QES_15 | Wallet Providers SHALL ensure that a Wallet Unit can verify, in remote signature creation scenarios, that the qualified electronic signature or seal creation device is part of a qualified service, which is carried out by a qualified trust service provider.  |
| QES_16 | Wallet Providers SHOULD ensure that a Wallet Unit supports multiple-signing scenarios where multiple signatories are required to sign the same document or data. |
| QES_17 | Wallet Providers SHALL ensure that Wallet Units provide a signature creation confirmation upon the creation of a qualified electronic signature, informing the User about the outcome of the signature creation process. *Note: See also QES_17a.* |
| QES_17a | If the Signature Creation Application is external to the Wallet Unit, after the User authorises the usage of the private signing key, the Signature Creation Application SHALL return the outcome of the signature creation process to the Wallet Unit. |
| QES_18 | Wallet Providers SHALL configure at least one default qualified signing service in the Wallet Unit. |
| QES_19 | Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit, a Wallet Unit supports ETSI TS 119 101 (Electronic Signatures and Infrastructures (ESI); Policy and security requirements for applications for signature creation and signature validation) when using signing keys managed by the QSCD, whether locally, externally, or remotely in relation to the Wallet Instance. |
| QES_20 | Empty |
| QES_21 | Empty |
| QES_22 | Empty |

###### B. Requirements for QTSPs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| QES_23 | QTSPs providing the remote QES part of a Wallet Solution SHALL support: 1. ETSI TS 119 431-1 (Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev), 2. ETSI TS 119 431-2 (Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 2: TSP service components supporting AdES digital signature creation), 3. ETSI TS 119 432 (Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation). Wallet Providers and QTSPs providing the remote QES part of a Wallet Solution SHALL comply with Sole Control Assurance Level (SCAL) 2 as defined in CEN EN 419 241-1 (Trustworthy Systems Supporting Server Signing - Part 1: General System Security Requirements). |
| QES_24 | QTSPs providing the Signature Creation Application as part of the remote QES part of a Wallet Solution SHALL support ETSI TS 119 101 (Electronic Signatures and Infrastructures (ESI); Policy and security requirements for applications for signature creation and signature validation). |

###### C. Requirements for Relying Parties <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| QES_24a | Relying Parties providing the Signature Creation Application in a Relying Party-centric flow SHALL support ETSI TS 119 101 (Electronic Signatures and Infrastructures (ESI); Policy and security requirements for applications for signature creation and signature validation). |

###### D. Requirements for the Commission <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------|
| QES_25 | Empty |
| QES_26 | Empty |

#### A.2.3.17 Topic 17 - Identity matching

##### Description <!-- omit from toc -->

Users would like to use their PID in their Wallet Unit to access their existing
online account(s), even if their PID attribute values are not exactly the same
as those in their account(s). Users regularly need to log in to cross-border
services offered by public sector bodies. Identity matching enables them to use
their Wallet Unit to do so.

##### HLRs <!-- omit from toc -->

There are no HLRs for this Topic.

#### A.2.3.18 Topic 18 - Combined presentations of attributes

##### Description <!-- omit from toc -->

**Note: The text in this section and the high-level requirements in the next section were adapted from the [Discussion Paper for Topic K](../../discussion-topics/k-combined-presentation-of-attestations.md). All high-level requirements were changed compared to the situation prior to integration of Topic K.**

The concept of *combined presentation* refers to a process where a Relying Party
requests multiple attributes concerning a single User, drawn from separate
attestations (e.g., PID and/or (Q)EAAs), and receives a consolidated response.
The key functional goal is to enable the Relying Party to verify that all
presented attributes pertain to the same User, without compromising trust,
privacy, or data integrity.

A combined presentation of attributes, when designed with privacy in mind,
becomes a powerful tool for protecting individuals from unnecessary exposure.
Rather than relying on full identification for every transaction, we can instead
implement solutions that enable Users to prove only what is strictly necessary —
without revealing who they are.  This aligns directly with the commitments laid
out in the [European Digital Identity Regulation]: access to digital services
must be privacy-protective by design (recital 4), supported by privacy-enhancing
technologies (recital 14), and uphold the principle of unobservability (recital
32).

In this light, Article 5a(16)(b) provides a clear obligation: when attributes
are presented together, this must be done in a way that avoids unnecessary
identification of the User.  Instead, a privacy-preserving combined presentation
of attributes opens the door to new possibilities. It enables the transition of
many real-world processes — currently performed under full identification — into
more private digital equivalents.

Consider, for example, eligibility checks for educational programs. A student
should be able to prove they reside in a particular city and have qualifying
grades *without revealing their name, gender, or exact address*. The same logic
applies more broadly: renting a car or a bicycle, or purchasing restricted goods
like alcohol, often requires only proof of eligibility — but not a proof of
identity. With the right cryptographic mechanisms in place, we can minimize data
exposure while maintaining trust in the presented attributes

This Topic describes high-level requirements for such a Cryptographic Binding of Attestations scheme. For more information, also see [Section 6.6.3.10](../../architecture-and-reference-framework-main.md#66310-relying-party-instance-verifies-combined-presentation-of-attributes).

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| ACP_01 | A Cryptographic Binding of Attestations scheme SHALL enable a WSCA/WSCD to prove that it manages two or more private keys, paired with two or more public keys provided to it by the Wallet Unit. *Notes: -These public keys may be included in WUAs, PIDs, attestations, or pseudonyms. - The proof may be transitive, so a proof that two keys are stored/managed in the same WSCA/WSCD may be done by proving these keys relate to each other via a third key (also stored in the WSCA/WSCD).* |
| ACP_02 | A Cryptographic Binding of Attestations scheme SHALL rely solely on algorithms standardised by a standardisation organisation recognised by the Commission or in a standard recognised by the Commission. |
| ACP_03 | A Cryptographic Binding of Attestations scheme SHOULD be implemented using a Zero-Knowledge Proof mechanism that satisfies the requirements specified in [Topic 53](#a2353-topic-53-zero-knowledge-proofs). |
| ACP_04 | A Cryptographic Binding of Attestations scheme SHALL be compatible with the requirements for attestation issuance in this document, in particular [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit), as well as with requirements for both remote and proximity presentation flows in this document, in particular [Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit) and [Topic 24](#a2324-topic-24---user-identification-in-proximity-scenarios). |
| ACP_05 | A Cryptographic Binding of Attestations scheme SHALL enable an Attestation Provider, during the issuance of an attestation, to request and obtain proof that the private key for the new attestation is managed by the same WSCA/WSCD as the private key of a PID or another attestation already existing on the Wallet Unit. *Note: ACP_05 and ACP_06 may require an addition to the common OpenID4VCI protocol referenced in requirement ISSU_01, or an extension or profile thereof.* |
| ACP_06 | A Cryptographic Binding of Attestations scheme SHALL enable a PID Provider or Attestation Provider, during the issuance of a PID or attestation, to request and obtain proof that the private key for the new PID or attestation is managed by the same WSCA/WSCD as the private key of the WUA received. |
| ACP_07 | Before making a request according to ACP_05, an Attestation Provider SHALL verify that the new attestation indeed belongs to the User of the existing PID or attestation. |

Also see requirements ARB_27 and ARB_28 in [Topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.19 Topic 19 - User navigation requirements (Dashboard logs for transparency)

##### Description <!-- omit from toc -->

In this use case, the User is accessing a dashboard of the
Wallet Unit, which provides a record of all transactions executed through the
Wallet Unit. The User is concerned about data privacy, and thus the
function of a dashboard ensures a higher degree of transparency, privacy
and control of the User over their personal data.

This Topic lists high-level requirements related to the functions
of such a dashboard.  

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| DASH_01 | A Wallet Provider SHALL enable a User to access a user-friendly dashboard functionality in their Wallet Unit. |
| DASH_02 | The Wallet Unit SHALL log all transactions executed through the Wallet Unit, including any transactions that were not completed successfully. This log SHALL include all types of transaction executed through the Wallet Unit: a) PID or attestation issuance and re-issuance transactions, b) PID or attestation presentation transactions , c) Wallet-to-Wallet transactions, (see [Topic 30](#a2330-topic-30---interaction-between-wallet-units), d) pseudonym registration or presentation transactions, e) signature or seal creation transactions (see [Topic 16](#a2316-topic-16---signing-documents-with-a-wallet-unit)), f) data deletion requests sent to a Relying Party (see [Topic 48](#a2348-topic-48---blueprint-for-requesting-data-deletion-to-relying-parties)), g) reports sent to a Data Protection Authority (see [Topic 50](#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data)), h) PID or attestation deletions by the User. *Note: For the data to be logged for a data deletion request to a Relying Party or a report sent to a DPA, see Topic 48 and Topic 50, respectively. For other types of transaction, the data to be logged is specified in the requirements in this Topic.* |
| DASH_02a | The Wallet Unit SHALL retain transactions in the log at least for the minimum retention period specified in applicable legislation. If the Wallet Unit must delete transactions from the log, for instance because of size limitations, the Wallet Unit SHALL notify the User via the dashboard before doing so, indicating the potential consequences for the User's data protection rights, and SHALL instruct the User how to export the transactions that are about to be deleted; see DASH_07. |
| DASH_02b | The dashboard SHALL include a functionality to display to the User an overview of all transactions in the log. |
| DASH_02c | The Commission SHALL establish a technical specification for the common format of the transaction log, including measures to ensure and/or verify its confidentiality, integrity, and authenticity. |
| DASH_03 | For a PID or attestation presentation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the name and unique identifier of the corresponding Relying Party, and the Member State in which that Relying Party is established, c) the name, contact details (if available), and unique identifier of the intermediary, if an intermediary is involved in the transaction, d) the attestation type(s) and the identifier(s) of the attribute(s) that were requested, as well as those that were presented, e) in the case of non-completed transactions, the reason for such non-completion, f) the URL of the associated Registrar's online service,  *Note: this URL can be retrieved from the access certificate.* g) the  web form URL (if available), e-mail address (if available), and telephone number (if available) provided by the Relying Party for sending data deletion requests, see requirement RPRC_03d in [Topic 44](#a2344-topic-44---relying-party-registration-certificates), h) the web form URL (if available), e-mail address (if available), and telephone number (if available) provided by the Data Protection Authority supervising the Relying Party for reporting suspicious attribute presentation requests, see requirement RPRC_03e in [Topic 44](#a2344-topic-44---relying-party-registration-certificates). i) information on the intended use and/or URL to the privacy policy, as registered by the Relying Party at the competent Registrar (if available). *Note: The information in points g), h), and i) may be retrieved from the registration certificate or from the Registrar's online service (see [Topic 44](../annex-2/annex-2-high-level-requirements.md#a2344-topic-44---relying-party-registration-certificates)).* |
| DASH_03a | For a PID or attestation presentation transaction or a Wallet-to-Wallet transaction executed through the Wallet Unit, the log SHALL NOT contain the value of any attributes presented or the value of any transactional data included in the presentation request. |
| DASH_03b | For a Wallet-to-Wallet transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the role of the Wallet Unit (Holder Wallet Unit or Verifier Wallet Unit), c) the attestation type(s) and the identifier(s) of the attribute(s) that were requested, as well as those that were presented, d) in the case of non-completed transactions, the reason for such non-completion. |
| DASH_03c | For a pseudonym registration or presentation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) identifying information about the Relying Party, if known to the Wallet Unit, c) whether it is a pseudonym registration or pseudonym presentation transaction, d) in the case of non-completed transactions, the reason for such non-completion. *Note: Regarding point b), see PA_20 in [Topic 11](#a2311-topic-11---pseudonyms).*|
| DASH_04 | For a signature or seal creation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the document or data signed or sealed (if available to the Wallet Unit), c) in the case of non-completed transactions, the reason for such non-completion. |
| DASH_05 | For a PID or attestation issuance or re-issuance transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the name, contact details (if available), and unique identifier of the corresponding PID Provider or Attestation Provider, c) the attestation type requested, as well as the attestation type issued, d) the number of attestations requested and issued (i.e., the size of the batch in case of batch issuance). d) in the case of non-completed transactions, the reason for such non-completion. e) for a re-issuance transaction, whether it was triggered by the User or by the Wallet Unit without involvement of the User, f) the URL of the associated Registrar's online service. *Note: this URL can be retrieved from the access certificate.* |
| DASH_05a | For the deletion of a PID or attestation by the User, the log SHALL contain at least: a) the date and time of the deletion event, b) the attestation type of the deleted PID or attestation. c) The name and unique identifier of the corresponding PID Provider or Attestation Provider. *Note: This requirement is not about deletion of transactions from the log, as per DASH_06a.* |
| DASH_06 | The Wallet Provider SHALL ensure the confidentiality, integrity, and authenticity of all transactions included in the log. |
| DASH_06a | Via the dashboard, the Wallet Unit SHALL enable the User to delete any transaction in the log. Before deleting any transactions, the Wallet Unit SHALL indicate to the User the potential consequences for the User's data protection rights. *Note: This requirement applies even in case the minimum retention period specified in applicable legislation (see DASH_02a) is not yet over.* |
| DASH_06b | The Wallet Unit SHALL ensure that no entity other than the User can delete transactions from the log, except possibly for the reason mentioned in DASH_02a. |
| DASH_07 | The dashboard SHALL allow the User to export the details of one or more transactions in the log to a file, using the common format specified according to DASH_02c, while ensuring their confidentiality, authenticity and integrity. The file SHALL be stored in an external storage or remote storage location of the User's choice, from among the storage options supported by the Wallet Unit and SHALL use the common format and security measures specified according to DASH_02c. |
| DASH_08 | For a natural-person User, a Wallet Instance SHALL provide a User interface. |
| DASH_09 | The User interface referred to in DASH_08 SHALL provide a view with -  the EU Digital Identity Wallet Trust Mark, - accompanying general information on the certification of Wallet Solutions, - links to the certification status information as defined in the [Technical Specification 1](../../technical-specifications/ts1-eudi-wallet-trust-mark.md). |
| DASH_09a | Positioning of the view meant in DASH_09 in the Wallet UI navigation SHALL follow design guidelines provided by the European Commission. |
| DASH_09b | Wallet Providers and Wallet Units SHALL comply with all relevant requirements in [Technical Specification 1](../../technical-specifications/ts1-eudi-wallet-trust-mark.md) for the EUDI Wallet Trust Mark. |
| DASH_10 | Empty. *Note: See requirement WIAM_12a in [Topic 40](#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management).* |
| DASH_11 | A Wallet Unit issued to a legal person SHALL allow the legal person to interact with the Wallet Unit in the appropriate interface provided by the Wallet Provider. |
| DASH_12 | The User interface referred to in DASH_08 SHALL enable the User, for each presentation transaction in the dashboard, to easily request the Relying Party to delete any or all attributes presented to it in that transaction, or to send a report about that particular transaction to a DPA. |

#### A.2.3.20 Topic 20 - Strong User authentication for electronic payments

##### Description <!-- omit from toc -->

Note: The description in this section was adapted from the
[Discussion Paper for Topic W](../../discussion-topics/w-transactional-data-for-payments-and-other-use-cases.md).
The high-level requirements in the next section were taken from this paper as
well.

The [European Digital Identity Regulation] requires Wallet Units to provide a
functionality of strong User authentication (SUA), among others in the context
of payments.

In general, the life cycle of a Wallet Unit in the role of an authenticator for
strong User authentication comprises the following phases:

- **Registration**: The User registers the Wallet Unit as an authenticator for a
service. This process includes:
    - User identification and authentication, for example by presenting a PID,
    - User consent for the registration,
    - Linking a Wallet Unit with the service and a User account in that service.
      This happens by issuing a dedicated SUA attestation to the Wallet Unit,
      containing User attributes relevant for the service. The issuance process
      for this SUA attestation complies with all requirements for attestation
      issuance in this ARF. Like any other attestation, the SUA attestation
      contains a public key, and the associated private key is stored in a WSCA.
- **Strong User Authentication**: A Relying Party sends a presentation request
to the Wallet Unit to request relevant attributes from the SUA attestation. This
presentation request includes transactional data. In the context of electronic
payments, the transactional data will include at least the payment amount and
the payee. After presenting the data to the User and obtaining the User's
consent, the Wallet Unit signs the transactional data. It does so by including
(a representation of) the transactional data in the signature creation process
used for device binding. Note that the syntax and semantics of the transactional
data, as well as rules for how the data must be presented to the User and how
the data will be prepared for inclusion in the device binding signature, will be
defined in the Attestation Rulebook for the SUA attestation.
- **De-registration**: Unlinking the Wallet Unit from the service and/or the
User's account in that service. This will involve deletion or revocation of the
SUA attestation.

Note transactional data must be processed in a way that in general might be
different for each service.


##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| SUA_01 | The Wallet Units SHALL be able to process the transactional data included in a presentation request for that an attestation, according to all requirements in the associated Attestation Rulebook. |
| SUA_02 | The Attestation Rulebook (see [Topic 12](#a2312-topic-12---attestation-rulebooks) of a SUA attestation SHALL specify the syntax and semantics of the transactional data associated with that attestation, as well as all necessary requirements for Wallet Units to process that transactional data, at least regarding a) displaying the data to the User when obtaining consent for signing the data, b) processing (e.g., hashing) the data for inclusion in the device binding signature, and c) the scope of information to be logged about a SUA attestation presentation transaction by a Wallet Unit. |
| SUA_03 | The Attestation Provider of a SUA attestation SHALL NOT issue such an attestation to a Wallet Unit that does not comply with all relevant requirements in the Attestation Rulebook for that attestation. |
| SUA_04 | In the response to a presentation request that includes transactional data, a Wallet Unit SHALL include (a representation of) that data, according to requirements included in the Attestation Rulebook or in information provided to the Wallet Unit in the presentation request. In the latter case, the rules to interpret such information SHALL be included in the Attestation Rulebook. *Note: This requirement, as well as SUA_05, only applies if the requested SUA attestation is present on the Wallet Unit and if the User consents to signing the transactional data and presenting the requested attributes.* |
| SUA_05 | The Wallet Unit SHALL include (a representation of) the transactional data received in a presentation request in the signature creation process used for device binding, using the private key of the requested SUA attestation, using the mechanisms provided for key binding in [SD-JWT-VC] and mdoc authentication in [ISO/IEC 18013-5], and complying with the applicable requirements in the Attestation Rulebook, see SUA_02 b). *Notes: - The resulting signature value constitutes a proof of transaction and fulfils the requirement of the authentication code required in [PSD2]. - See also requirement OIA_02 in [Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit).* |
| SUA_06 | The Wallet Unit SHALL be able to adapt the dialogue message(s) displayed to the User (like font size and colour, background colour, text position, labels in the buttons to 'approve' or 'reject' a transaction), according to requirements in an Attestation Rulebook or in information provided to the Wallet Unit in the presentation request. In the latter case, the rules to interpret such information SHALL be included in the Attestation Rulebook. |

#### A.2.3.21 Topic 21 - Diplomas within the EUDI Wallet ecosystem

There are no HLRs for this Topic.

#### A.2.3.22 Topic 22 - Digital Travel Credentials within the EUDI Wallet ecosystem

There are no HLRs for this Topic.

#### A.2.3.23 Topic 23 - PID issuance and (Q)EAA issuance

##### Description <!-- omit from toc -->

See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit).

##### HLRs <!-- omit from toc -->

See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit).

#### A.2.3.24 Topic 24 - User identification in proximity scenarios

##### Description <!-- omit from toc -->

In this use case, the User is using their Wallet Unit for identification
purposes in proximity scenarios. As explained in [Section 4.4.2 of the ARF main document](../../architecture-and-reference-framework-main.md#442-proximity-presentation-flows), in a
proximity flow, the User and their Wallet Instance are physically near the
Relying Part Instance. PIDs and attestations are exchanged using proximity
technology (e.g., NFC, Bluetooth) between the Wallet Unit and the Relying Party
Instance. Note that this definition does not imply that a Wallet Unit and a
Relying Party have to use proximity technologies if they are close together.
They are free to use a remote flow (according to [Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit)).
However, there may be situations where either the Wallet Unit or the Relying
Party Instance does not have an internet connection. In such cases, they must be
able to use a proximity flow, if they are close together.

The User is concerned
about sharing personal data in proximity, while the User's objectives
include identifying themselves to services requiring User identification
and maintaining control over their personal data sharing.

This topic lists high-level requirements related to User
identification in proximity use cases where Users utilise their Wallet Units.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|----------------|
| ProxId_01 | To enable identification using proximity flows, Wallet Units SHALL support device retrieval as specified in ISO/IEC 18013-5 for presenting PID or attestation attributes. Wallet Units SHALL comply with the requirements for mDLs and mdocs ISO/IEC 18013-5. *Note: Nominally, ISO/IEC 18013-5 is intended only for mDLs and mDL readers. The corresponding standard for mobile documents in general (including Wallet Units with the EUDI Wallet ecosystem) will be ISO/IEC 23220-4, which is based on ISO/IEC 18013-5. However, the latter standard is not finished yet and therefore cannot be referenced at the moment. To guarantee interoperability between Wallet Units and Relying Party Instances in proximity scenarios, it is necessary to make choices from among the possibilities specified in ISO/IEC 18013-5. Making the same choices as for mDLs ensure this.* |
| ProxId_01a | If a Relying Party supports using proximity flows, its Relying Party Instances SHALL support device retrieval as specified in ISO/IEC 18013-5 for requesting PID or attestation attributes. Such Relying Party Instances SHALL comply with the requirements for mDL readers and mdoc readers in ISO/IEC 18013-5. *Note: See note to ProxId_01. Support for proximity flows by Relying Parties is not mandatory.* |
| ProxId_02 | Wallet Units, PID Providers, Attestation Providers, Wallet Providers, and Relying Parties SHALL NOT support server retrieval as specified in ISO/IEC 18013-5 for requesting and presenting PID or attestation attributes. *Note: Using server retrieval, a Relying Party would request User attributes directly from a PID Provider or Attestation Provider, after having received an authentication and/or authorisation token from the User's Wallet Unit.* |
| ProxId_03 | A Wallet Unit SHALL present the presentation request and the identity of the Relying Party to the User when processing the request. |
| ProxId_04 | A Wallet Unit SHALL request its User to approve the presentation of attributes from their Wallet Unit for proximity identification before presenting them to the Relying Party. |
| ProxId_05 | A Wallet Unit SHALL transmit the requested User attributes to the requesting Relying Party Instance securely in accordance with ISO/IEC 18013-5 for proximity flows. |
| ProxId_06 | Empty |

#### A.2.3.25 Topic 25 - Unified definition and controlled vocabularies for attributes

##### Description <!-- omit from toc -->

[Topic 12](#a2312-topic-12---attestation-rulebooks) describes the
high-level requirements (HLR) for the Rulebooks that will
specify the details of new types of attestations, including QEAAs, PuB-EAAs, and
non-qualified EAAs. This Topic already touched and defined high-level requirements
regarding the catalogue for Attestation Rulebooks.

The following main concepts were defined in
[Topic 12](#a2312-topic-12---attestation-rulebooks)
and developed in the current version of this Topic:

- Attestation Rulebooks for QEAAs and PuB-EAAs used within the EUDI Wallet
ecosystem may be registered and published in a publicly accessible catalogue.
- The Attestation Rulebook catalogue may also include Attestation Rulebooks for
non-qualified EAAs.
- The Commission will take measures to establish and maintain the Attestation
Rulebooks catalogue.
- The Attestation Rulebooks catalogue will enable mainly Relying Parties, but
also other actors in the EUDI Wallet ecosystem, to know which attestation types
exist, and what is the identifier, syntax, and semantics of each attribute in a
type of attestation.

The following points are emphasised:

- Registration of an Attestation Rulebook in the attestation catalogue is not mandatory.
- Registration in the Attestation Rulebook catalogue does not create any
obligation of acceptance of the attestation by any Relying Party, nor does it
necessarily imply cross-border recognition of that attestation.
- The Attestation Rulebooks catalogue can be hosted in the same environment as
the catalogue of attributes.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-------------------|
| CAT_01 | The Commission SHALL establish a catalogue of attributes used within the EUDI Wallet ecosystem. *Note: The catalogue of attributes does not need to be a separate catalogue, but could be combined with the Attestation Rulebooks catalogue mentioned in CAT_05.* |
| CAT_01a | The Commission SHALL enable any entity to request the registration in the catalogue of one or more attribute(s) of an attestation used within the EUDI Wallet ecosystem. |
| CAT_01b | The Schema Provider for an Attestation Rulebook that is a QEAA or PuB-EAA SHOULD request the registration of all attributes in that QEAA or PuB-EAA in the catalogue of attributes. The Schema Provider for an Attestation Rulebook that is a non-qualified EAA MAY request the registration of the attributes in that EAA in the catalogue. |
| CAT_02 | Empty |
| CAT_03 | The Commission SHALL make the catalogue of attributes publicly available and machine-readable. *Note: The requirement for availability implies setting up the required means for high availability and avoiding a single point of failure.* |
| CAT_03b | The Commission SHALL consider the following semantic artifacts for inclusion in the catalogue of attributes: - [Representation Powers and Mandates (RPaM) Ontology](https://interoperable-europe.ec.europa.eu/collection/isa-action-201612-semantic-interoperability-representation-powers-and-mandates-0/solution/representation-powers-and-mandates-ontology), - [SEMPER \| DE4A](https://www.de4a.eu/semper), - [SEMIC Core Vocabularies](https://interoperable-europe.ec.europa.eu/collection/semic-support-centre/core-vocabularies#What%20are%20the%20Core%20Vocabularies), - [IANA Registry for JSON Web Token Claims](https://www.iana.org/assignments/jwt/jwt.xhtml) (for JSON-based attributes only), - [ISO/IEC 23220-2](https://www.iso.org/standard/86782.html) (for CBOR-based attributes only). |
| CAT_04 | The Commission SHALL make publicly available the existence and maintenance of the catalogue of attributes mentioned in CAT_01, including processes to propose the registration to public and private parties, allowing to register attributes, and conditions for updating and/or removing attributes. These processes SHALL include archiving and logging changes of the history of the catalogue of attributes in an appropriate way, including versioning. *Note: There are layers on top of the attributes that need maintenance as well. So, maintenance in this case is more generic and encompasses more than just the attribute itself.* |

#### A.2.3.26 Topic 26 - Catalogue of attestations

##### Description <!-- omit from toc -->

See [Topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabularies-for-attributes).

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------|
| CAT_05 | The Commission SHALL establish a catalogue of Attestation Rulebooks used within the EUDI Wallet ecosystem. *Note: For Attestation Rulebooks, see Topic 12.* |
| CAT_05a | The Commission SHALL enable any entity to register an Attestation Rulebook used within the EUDI Wallet ecosystem. |
| CAT_05b | The Schema Provider for an Attestation Rulebook that is a QEAA or PuB-EAA SHOULD register its Rulebook in the catalogue of Attestation Rulebooks. The Schema Provider for an Attestation Rulebook that is a non-qualified EAA MAY register its Rulebook. |
| CAT_06 | The Commission SHALL make the catalogue publicly available and machine-readable, by hosting the catalogue, or parts of it, including an e-discovery mechanism and/or by referencing to other catalogues. *Note: The requirement for availability implies setting up the required means for high availability and avoiding a single point of failure.* |
| CAT_07 | The Commission SHALL enable a self-registration process of Attestation Rulebooks, without pre-approval by the registry, for both public and private entities. |
| CAT_08 | Empty |
| CAT_09 | The Commission SHALL make publicly available the existence and maintenance of the Attestation Rulebooks catalogue mentioned in CAT_01, including processes to propose the registration to public and private parties, allowing to register an Attestation Rulebook, and conditions for updating and/or removing Attestation Rulebooks. These processes SHALL include archiving and logging changes of the history of the Attestation Rulebooks catalogue in an appropriate way, including versioning. |
| CAT_10 | The body registering an Attestation Rulebook SHALL include a unique reference to this body and the way to contact it, or how to find information for doing so. *Notes: - Topic 12 describes an option for Member State-specific (i.e., domestic) Rulebooks, extending a EU-wide Rulebook. - Rulebooks may also be shared between interested parties in an out-of-band manner.* |
| CAT_11 | Empty |

#### A.2.3.27 Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and non-qualified EAAs, and Relying Parties

##### Description <!-- omit from toc -->

PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers
and Relying Parties register with a Registrar in their Member State. The
main goal of the registration process is for the Registrar registering relevant information about the entity, and make this information available online to interested parties. In addition, the entity will receive an access
certificate that Wallet Units can use to authenticate them. Finally, the entity receives a registration certificate containing the registered information, if the Registrar has a policy of issuing registration certificates.

This Topic specifies high-level requirements related to the registration of the
above mentioned entities.

##### HLRs <!-- omit from toc -->

A. *General requirements for Member State registration processes*

| **Index** | **Requirement specification** |
|-----------|----------------|
| Reg_01 | Member States SHALL provide processes and mechanisms for PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers, and Relying Parties to register in a registry. *Note: Member States may choose to implement a single registry for all these roles, or a separate registry for each of these roles.* |
| Reg_01a | Member States SHALL register a common set of data about a) PID Providers, b) QEAA Providers, c) PuB-EAA Providers, d) non-qualified EAA Providers. and e) Relying Parties, according to the relevant requirements in [Technical Specification 6](../../technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md). *Note: For PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers, the common set of data specified in [Technical Specification 6] include the attestation type(s) that the provider intends to issue to Wallet Units.* |
| Reg_01b | Empty |
| Reg_02 | Member States SHALL make publicly available all necessary details and documentation about the registration processes for their registry. |
| Reg_03 | Member States SHALL publish the registry entries online, in a sealed or signed machine-readable common format suitable for automated processing, according to the relevant requirements in [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md), for the purpose of transparency to Users and other stakeholders. |
| Reg_04 | Member States SHALL make the registry entries available online, in a human-readable format. The website used for this purpose SHALL use a secure channel protecting the authenticity and integrity of the information in the registry during transport. Member States SHALL NOT require authentication or prior registration and authorisation of any person wishing to retrieve the information in the registry. |
| Reg_05 | Empty |
| Reg_06 | Member States SHALL support the common API specified in [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) for to enable automated retrieval of registry entries from the Member States' registries. *Note: [Technical Specification 5] specifies the use of a secure channel protecting the authenticity and integrity of the information in the registry during transport, and does not require authentication or prior registration and authorisation of any entity wishing to retrieve the information in the registry.* |
| Reg_07 | Empty |
| Reg_08 | Empty |
| Reg_09 | Empty |

B. *General requirements for the issuance of access certificates*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| Reg_10 | A Member State SHALL ensure that an Access Certificate Authority notified according to [[Topic 31](#a2331-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)] issues an access certificate to all PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers, and Relying Parties registered in one of the Member State's registries. |
| Reg_11 | A Member State SHALL ensure that the issuance process of access certificates by their notified Access Certificate Authority(s) complies with a common Certificate Policy for Access Certificate Authority. |
| Reg_12 | The Commission SHALL provide technical specifications establishing the common Access Certificate Authority Certificate Policy mentioned in Reg_11. |
| Reg_13 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority logs all issued certificates for Certificate Transparency (CT). *Note: This requirement is still under discussion and might be changed or removed in a future version of this ARF.* |
| Reg_14 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority provides one or more method(s) to revoke the access certificates it issued. |
| Reg_15 | The common Certificate Policy mentioned in Reg_12 SHALL include a policy for revocation, which SHALL require that an Access Certificate Authority revokes an access certificate at least when: - the certificate subject which is a Relying Party is suspended or cancelled by the respective Registrar, - the certificate subject which is a PID Provider, QEAA Provider, PuB-EAA Provider, or non-qualified EAA Provider is suspended or cancelled by the respective Registrar, - on request of the certificate subject, or - on request of a competent national authority. |
| Reg_16 | The common Certificate Policy mentioned in Reg_12 SHALL specify the profile of access certificates in detail. |
| Reg_17 | The common Certificate Policy mentioned in Reg_12 SHALL require that an access certificate indicates whether its subject is a PID Provider, a QEAA Provider, a PuB-EAA Provider, a non-qualified EAA Provider, or a Relying Party Instance. |
| Reg_18 | The common Certificate Policy mentioned in Reg_12 SHALL define the minimum change history information to be stored for resolving possible disputes regarding registration. |

C. *Requirements for the registration of PID Providers*

| **Index** | **Requirement specification** |
|-----------|---------------------|
| Reg_19 | A Member State SHALL approve a PID Provider according to a well-defined policy before including it in its PID Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of PID Providers in its Registry. |
| Reg_20 | A Member State SHALL identify PID Providers at a level of confidence proportionate to the risk arising from the potential harm a fraudulent PID Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |
| Reg_20a | A Registrar SHALL provide a method to suspend or cancel a registered PID Provider. |
| Reg_20b | A Registrar SHALL have a policy for the suspension or cancellation of a registered PID Provider, which SHALL specify that a PID Provider is suspended or cancelled at least on request of the PID Provider or of a competent national authority. |

D. *Requirements for the registration of Attestation Providers*

| **Index** | **Requirement specification** |
|-----------|-------------------|
| Reg_21 | A Member State SHALL approve an Attestation Provider according to a well-defined policy before including it in its Attestation Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of Attestation Providers in its Registry. These processes and rules SHOULD consider any relevant differences between QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers. |
| Reg_22 | A Member State SHALL identify Attestation Providers (i.e., QEAA Providers, PuB-EAA Providers and non-qualified EAA Providers) at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Attestation Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |
| Reg_22a | A Registrar SHALL provide a method to suspend or cancel a registered Attestation Provider. |
| Reg_22b | A Registrar SHALL have a policy for the suspension or cancellation of a registered Attestation Provider, which SHALL specify that an Attestation Provider is suspended or cancelled at least on request of the PID Provider or of a competent national authority. |

E. *Requirements for the registration of Relying Parties*

| **Index** | **Requirement specification** |
|-----------|------------------|
| Reg_23 | The Commission SHALL establish a technical specification for a common set of Relying Party information to be registered in Member State registries. This set SHALL include at least the information defined in [European Digital Identity Regulation] [article 5b](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1776-1-1) 2 (c). |
| Reg_24 | A Member State SHALL enable a Relying Party to register remotely, using an API or user interface. |
| Reg_25 | A Member State SHALL identify a Relying Party at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Relying Party could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |
| Reg_26 | A Member State SHALL enable a Relying Party to update the information registered on it using a process comparable to the original registration process, and using the API or user interface mentioned in Reg_24. |
| Reg_27 | Relying Parties SHALL make any updates necessary to ensure the continued correctness of the registered information without undue delay. |
| Reg_28 | A Member State's Registry SHALL log all changes made on the information regarding a Relying Party, including at least initial registration, updates, deletion of information, and suspension or cancellation. |
| Reg_29 | A Registrar SHALL have a policy for the cancellation of a registered Relying Party, which SHALL specify that a Relying Party is cancelled at least on request of the Relying Party or of a competent national authority. |
| Reg_30 | Empty |

F. *Requirements for the issuance of Relying Party Instance access certificates*

| **Index** | **Requirement specification** |
|-----------|---------------------|
| Reg_31 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains a name for the Relying Party, in a format suitable for presenting to a User. *Note: A Wallet Unit needs such a name when requesting User approval according to [[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)].* |
| Reg_32 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains an EU-wide unique identifier for the Relying Party, and SHALL specify a method for deriving such identifiers. *Notes: - The Wallet Instance needs such an identifier at least to send a report of suspicious Relying Party presentation requests to a data protection authority according to [Topic 50](#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data). - The EU-wide unique identifier could, for example, be a composition of a unique identifier of the Registrar, defined in the policy, and a unique identifier for the Relying Party allocated by this Registrar. - This Relying Party identifier is identical in all Relying Party Instance access certificates issued to a given Relying Party.* |

#### A.2.3.28 Topic 28 - Wallet Unit for legal persons

Note to this Topic: Legal-person PIDs and Wallet Units for legal persons were
added to the list of topics to be discussed with Member States in the future.

##### Description <!-- omit from toc -->

This topic is focused on identifying high-level requirements for a legal-person
Wallet Unit. All core capabilities of a Wallet Unit for a natural person are
available for a legal person. There are some differences between a natural and
legal person that accordingly leads to different requirements for issuing
legal-person PIDs and the Wallet Units containing legal-person PIDs.

Notes:

- A legal-person PID is issued under an eID scheme.
- A legal-person PID is described in a legal-person PID Rulebook,
 which is different from the natural-person PID Rulebook in [PID
 Rulebook]. A legal-person PID has a different attestation type than
 a natural-person PID, and also contains different attributes. For
 example, date of birth or age are not relevant information for legal
 persons. Specifying a different Rulebook for legal-person PIDs
 allows Relying Parties and other Wallet Units to request
 these attributes.  
- A legal-person Wallet Solution may be implemented in the same
 manner as a natural-person Wallet Solution, meaning chiefly that it
 is implemented on a mobile device operated by a single User, who is
 a natural person. However, a legal-person Wallet Solution may
 also be implemented as a server-based (web-based) application. In
 the latter case, a Wallet Unit can be used either by one or more
 natural persons appointed by the legal person, or by information
 systems of the legal persons that give an Wallet Unit
 commands in accordance with rules defined by the legal person.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| LP_01 | The Commission SHALL develop a Legal-person PID Rulebook to specify the attribute scheme and other technical details applicable for legal-person PIDs. |
| LP_02 | The attestation type of a legal-person PID SHALL be different from the attestation type of a natural person PID. *Note: See [[Topic 12](#a2312-topic-12---attestation-rulebooks)] for an explanation of the concept of attestation type.* |
| LP_03 | A legal-person PID SHALL comply with all requirements in the Legal-person PID Rulebook mentioned in LP_02. |

#### A.2.3.29 Topic 29 - Representation paradigm

##### Description <!-- omit from toc -->

**Note: The description of this Topic, as well as the High-Level Requirements in it, were developed in the [Discussion Paper for Topic I](../../discussion-topics/i-natural-person-representing-another-natural-person.md). Please see that paper for more information.**

Based on the [European Digital Identity Regulation], it should be possible to issue a dedicated representation attestation for a natural person to a representative, in accordance with applicable national and European legislation. For certain use cases (e.g., parent-child relationships), the Attestation Provider of such attestations will be able to retrieve the relevant information from authentic sources at the national level. In other cases (e.g., power of attorney), the represented natural person may be required to explicitly authorize the representative.

Representation attestations for a natural person issued to a representative have a distinct attestation type. The Attestation Rulebook describing this attestation type shall specify the nature of the representation and shall clearly define the operations that the representative is authorized to perform, thereby restricting the scope of their authority.

Furthermore, this representation attestation type (like any other attestation type, see [Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking)) is either short-lived or revocable. In the case of revocable attestations, all entities that, according to applicable law, are entitled to revoke them have the capability to request the Attestation Provider to do so. It is emphasized that the high-level requirements concerning attestation revocation, as defined in [Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking), also apply to this attestation type.

A User holding a representation attestation is able to represent another natural person when interacting with a Relying Party. The Relying Party is always aware that it is interacting with a legal representative or agent. This is ensured by the fact that the corresponding Wallet Unit presents an attestation having a distinct type, specifically for representation attestations.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| RP_01 | The Commission SHALL create an Attestation Rulebook for representation attestations issued to a natural person representing another natural person. The Rulebook SHALL specify the unique attestation type of these representation attestations. The Rulebook SHALL also specify attributes used for defining a validity period, the nature of the representation, and the operations the representative is authorised to perform, thereby limiting the scope of its authorisation. |
| RP_02 | An Attestation Provider issuing representation attestations to a natural person representing another natural person SHALL ensure that either the attestations are short-lived or that all entities which, according to applicable law, must have the ability to request revocation of such attestations, are able to do so. |

#### A.2.3.30 Topic 30 - Interaction between Wallet Units

##### Description <!-- omit from toc -->

A User can request another User to present an attestation, where
both Users use their Wallet Unit. This can be done only when their devices are close
together (that is, in physical proximity). In this context, the requesting Wallet Unit is called the Verifier Wallet Unit, and the presenting Wallet Unit is called the Holder Wallet Unit. The User of a Holder Wallet Unit is called a Holder, and the User of a Verifier Wallet Unit is called a Verifier.

This Topic lists the high-level requirements related to the interaction between
two Wallet Units. These are based on the [Discussion Paper for Topic J](../../discussion-topics/j-wallet-to-wallet-interactions.md) and on subsequent discussions in the context of [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md). For a generic discussion of this topic, please refer to [Section 6.4](../../architecture-and-reference-framework-main.md#664-pid-or-attestation-presentation-to-another-wallet-unit) of the ARF main document.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| W2W_01 | A Wallet Unit SHALL be able to act as a Holder Wallet Unit, in accordance with all requirements in this Topic. |
| W2W_02 | When acting as a Holder Wallet Unit, if there is a contradiction between a requirement for Holder Wallet Units in this Topic and any requirement for Wallet Units in other Topics in this document, the requirement in this Topic SHALL take precedence. However, when acting as a Holder Wallet Unit, a Wallet Unit SHALL comply with all requirements for Wallet Units in other Topics in this document that do not contradict any requirement in this Topic. |
| W2W_03 | A Wallet Unit SHALL be able to act as a Verifier Wallet Unit, in accordance with all requirements in this Topic. |
| W2W_04 | When acting as a Verifier Wallet Unit, a Wallet Unit SHALL NOT comply with any requirement for Wallet Units in other Topics in this document. |
| W2W_05 | A Wallet Unit SHALL act as a Holder Wallet Unit only if the User selects a 'Holder Wallet Unit mode'. If the User closes the Wallet Unit, or after a period of non-activity, the Wallet Unit SHALL return to 'normal' mode. |
| W2W_06 | When entering the Holder Wallet Unit mode, a Wallet Unit SHALL inform its User that this mode should only be used for interactions with natural persons using a Wallet Unit, and that the User should not proceed if they are in fact interacting with a Relying Party. |
| W2W_07 | A Wallet Unit SHALL act as a Verifier Wallet Unit only if the User selects a 'Verifier Wallet Unit mode'. If the User closes the Wallet Unit, or after a period of non-activity, the Wallet Unit SHALL return to 'normal' mode. |
| W2W_08 | A Verifier Wallet Unit and a Holder Wallet Unit SHALL support attestation presentation only in proximity, meaning they SHALL support only [ISO/IEC 18013-5] to communicate. |
| W2W_09 | Holder Wallet Units SHALL comply with the requirements for mDLs and for mdocs in ISO/IEC 18013-5, unless specified differently in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md). |
| W2W_10 | Verifier Wallet Units SHALL comply with the requirements for mDL readers and for mdoc readers in ISO/IEC 18013-5, unless specified differently in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md). |
| W2W_11 | A Holder Wallet Unit SHOULD provide the Holder, through a user-friendly UI, with the option to inform the Verifier Wallet Unit about the attributes which the Verifier should include in the presentation request, by sending a presentation offer. If the Holder creates a presentation offer, the Holder Wallet Unit SHALL transfer it to the Verifier Wallet Unit as specified in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md). *Note: This will use an extension of the device engagement structure specified in ISO/IEC 18013-5.* |
| W2W_12 | A Holder Wallet Unit SHALL recommend the Holder to create a presentation offer, as this will increase the chance of success of the use case. |
| W2W_13 | A Verifier Wallet Unit SHALL provide the Verifier, through a user-friendly UI, with the possibility to select the attributes that will be included in the presentation request. |
| W2W_14 | For the purposes of W2W_07, if the Verifier Wallet Unit received a presentation offer, it SHALL present this offer to the Verifier, and enable the Verifier to include one or more of the attributes in the offer into the presentation request. However, the Verifier Wallet Unit SHALL NOT allow the Verifier to include any attribute not present in the offer. |
| W2W_15 | For the purposes of W2W_07, if the Verifier Wallet Unit did not receive a presentation offer, it SHALL present the Verifier with a list of attributes that can be included in the presentation request. The Verifier Wallet Unit MAY ask the Verifier some questions about the purpose of the use case to narrow down the list. |
| W2W_16 | A Verifier Wallet Unit SHALL authenticate the Verifier according to WIAM_15 and SHALL obtain the User's approval prior to sending a presentation request to a Holder Wallet Unit. |
| W2W_17 | A Verifier Wallet Unit SHALL implement measures to limit the number of presentation requests it can send per unit of time, to prevent abuse of the Wallet-to-Wallet functionality by Relying Parties. The limitation strategy, for instance exponential backoff time between subsequent presentation requests or hard limits for the number of requests, SHALL be decided by the Wallet Provider, based on applicable requirements in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md). |
| W2W_18 | When receiving a presentation request, a Holder Wallet Unit SHOULD verify the validity of the Verifier Wallet Unit before presenting a received request to the Holder, provided [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md) specifies a suitable mechanism for doing so. |
| W2W_19 | When receiving a presentation response, a Verifier Wallet SHALL verify the received attestation according to requirements OIA_12 - OIA_15 in [Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit). |
| W2W_20 | A Verifier Wallet Unit SHALL display all verified attributes to the Verifier. |
| W2W_21 | A Verifier Wallet Unit SHALL NOT persistently store any attestations or attributes received. A Verifier Wallet Unit SHOULD minimize the time the received presentation is stored in memory. A Verifier Wallet Unit SHALL comply with OIA_16 in [Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit). |
| W2W_22 | Wallet Providers SHOULD take measures to prevent a User from taking screenshots while their Wallet Unit is acting as a Verifier Wallet Unit. |

#### A.2.3.31 Topic 31 -  Notification and publication of PID Provider, Wallet Provider, Attestation Provider, Access Certificate Authority, and Provider of registration certificates

##### Description <!-- omit from toc -->

PID Providers, PuB-EAA Providers, Wallet Providers, Access Certificate
Authorities, and Providers of registration certificates must be notified by a Member State to the Commission. As part of the
notification process, the trust anchors of these parties must be included in a Trusted List. A trust anchor is the combination of a public key and an
identifier for the associated entity. Trust anchors are required for the
verification of the signatures of PIDs, attestations, WUAs, access
certificates and registration certificates that are issued by these parties.

Note: Notification does not apply to QEAA Providers and (non-qualified) EAA Providers, as explained in Sections D and F below, respectively.

This Topic contains High-Level Requirements for the notification of these
parties by Member States, and for the publication of the notified information by the Commission.

##### HLRs <!-- omit from toc -->

A. Generic requirements for notification

| **Index** | **Requirement specification** |
|-----------|-----------------|
| GenNot_01 | Member States SHALL notify all PID Providers, PuB-EAA Providers, Wallet Providers, Access Certificate Authorities, and Providers of registration certificates to the European Commission, according all relevant requirements in [Technical Specification 2](../../technical-specifications/ts2-notification-publication-provider-information.md). |
| GenNot_02 | As part of [Technical Specification 2] referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the notification of a PID Provider, PuB-EAA Provider, Wallet Provider, Access Certificate Authority, or Provider of registration certificates to the Commission. *Note: The outcome of the notification procedure is the publication of the information notified by the Member State according to [Article 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1) (18) in a machine and human readable manner using the common system mentioned in Section H, TLPub_01.* |
| GenNot_03 | The common system mentioned in GenNot_01 SHALL enable: - A secure notification channel between Member States and the Commission for all notifications. - A notification, verification, and publication process and associated validation steps (with follow-up and monitoring) at the Commission side. - Collected data to be processed, consolidated, signed or sealed, and published in both a machine-processable Trusted List and in a human-readable format, manually and/or automatically using e.g. a web service and/or API. |
| GenNot_04 | As regard to GenNot_03, second bullet, the Commission SHALL verify whether the notified data is complete and meets the technical specifications, while the Member States SHALL be responsible for the correctness of the notified information. |
| GenNot_05 | As part of the specifications referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the suspension or cancellation of a PID Provider, PuB-EAA Provider, Wallet Provider, Access Certificate Authority, or Provider of registration certificates. These operating procedures SHALL include unambiguous conditions for suspension or cancellation. As an outcome of the suspension or cancellation procedure, the status of the suspended or cancelled PID Provider, PuB-EAA Provider, Wallet Provider, Access Certificate Authority or Provider of registration certificates in the Trusted List SHALL be changed to Invalid. |

B. Requirements for the notification of PID Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| PPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about PID Providers. |
| PPNot_02 | The common set of information to be notified about a PID Provider SHALL include at least: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. A business registration number from an official record, b. Identification data from that official record. 2. PID Provider trust anchors, i.e., public keys and name as per point 1) ii) above, supporting the authentication of PIDs issued by the PID Provider, 3. Trust anchors of Access Certificate Authorities for PID Providers, i.e., public keys and CA name, supporting the authentication of the PID Provider by Wallet Units at the service supply point(s) listed per point 4. below. 4. Service supply point(s), i.e., the URL(s) at which a Wallet Unit can start the process of requesting and obtaining a PID. *Notes: - Relating to point 3. above: PID Provider Access Certificate Authority trust anchors are notified separately from the Access Certificate Authority for Relying Parties (see Section G below), since PID Providers are -legally speaking- not Relying Parties. - For the concept of an Access Certificate Authority, see also [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)] and [Section 6.3.2 of the ARF main document](../../architecture-and-reference-framework-main.md#632-pid-provider-or-attestation-provider-registration-and-notification).* |
| PPNot_03 | PID Providers SHALL ensure that all PIDs they issue can be authenticated using the PID Provider trust anchors notified to the Commission. |
| PPNot_04 | PID Providers SHALL ensure that their PID Provider access certificates can be authenticated using the applicable Access Certificate Authority trust anchors notified to the Commission. *Note: [[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)] describes how access certificates will be used.*|
| PPNot_05 | PID Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider Trusted List which is sealed by the Commission. |
| PPNot_06 | Access Certificate Authority trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled Access Certificate Authority Trusted List which is signed or sealed by the Commission. |
| PPNot_07 | The format of the PID Provider Trusted List SHALL comply with ETSI TS 119 612 v2.1.1 or with a suitable profile similarly derived from ETSI TS 102 231. |

C. Requirements for the notification of Wallet Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| WPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about Wallet Providers. |
| WPNot_02 | The common set of information to be notified about a Wallet Provider SHALL include: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. Business registration number from an official record, and b. Identification data from the official record. 2. Wallet Provider trust anchors, i.e., public keys and name as per point 1. b. above, supporting the authentication of Wallet Unit Attestations issued by the Wallet Provider. *Notes: - See [[Topic 9](#a239-topic-9---wallet-unit-attestation)] and [[Topic 38](#a2338-topic-38---wallet-unit-revocation)] for the definition of the WUA. - A Wallet Provider does not need an access certificate to interact with Wallet Units.* |
| WPNot_03 | Wallet Providers SHALL ensure that all WUAs they issue can be authenticated using the trust anchors notified to the Commission. |
| WPNot_04 | Wallet Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled Wallet Provider Trusted List which is sealed by the Commission. |
| WPNot_05 | The format of the Wallet Provider Trusted List SHALL comply with ETSI TS 119 612 v2.1.1 or with a suitable profile similarly derived from ETSI TS 102 231. |
| WPNot_06 | If a Wallet Provider is cancelled (see requirement GenNot_05 above), that Wallet Provider SHALL immediately revoke all of its valid WUAs, in accordance with the requirements in [Topic 38](#a2338-topic-38---wallet-unit-revocation). If a Wallet Provider is suspended, that Wallet Provider and the Member State SHALL agree on the necessary precautionary measures that need to be taken, which MAY include the immediate revocation of all or some of its valid WUAs.|

D. Requirements for the notification of QEAA Providers

There is no notification of QEAA Provider foreseen by the [European Digital
Identity Regulation], except for establishing the [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1)
Trusted List once a qualified status is granted. QTSPs issuing QEAAs to Wallet
Units SHALL abide by the Implementing Act to be adopted under [Art. 45d](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3849-1-1)(5).

E. Requirements for the notification of PuB-EAA Providers

This notification is pursuant to
[Art.45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1)(3)
and to the implementing acts to be adopted pursuant to
[Art.45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1)(7).
It should be noted that the purpose of this notification is mainly to the
attention of QTSPs issuing qualified certificates for electronic signatures or
seals to those public sector bodies referred to in [Article
3](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e739-1-1),
point (46), and identified as the issuer in the PuB-EAA. The Trusted List
compiled by the Commission is deemed to be a constitutive list of such
[Art.3](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e739-1-1)(46)
bodies recognised for issuing PUB-EAAs. Consequently, QTSPs are expected to
verify such lists prior to issuing a qualified certificate to any entity
claiming to be a
[Art.3](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e739-1-1)(46)
body.

| **Index** | **Requirement specification** |
|------------|-----------------|
| PuBPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about PuB-EAA Providers. |
| PuBPNot_02 | The common set of information to be notified by Member States about PuB-EAA Providers SHALL include at least: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. Registration number as in official record, and b. Official record identification data. iv. Identification data of the Union or national law under which a. Either the PuB-EAA Provider is established as the responsible body for the Authentic Source based on which the electronic attestation of attributes is issued, or b. The PuB-EAA Provider is the body designated to act on behalf of the responsible body referred to in point 1. iv. a. v.The conformity assessment report issued by a conformity assessment body, confirming that the requirements set out in paragraphs 1, 2 and 6 of [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1) are met. 2. Service supply point(s), i.e., the URL(s) at which a Wallet Unit can start the process of requesting and obtaining a PuB-EAA from the PuB-EAA Provider. |
| PuBPNot_03 | The format of the PuB-EAA Provider Trusted List SHALL comply with ETSI TS 119 612 v2.1.1 or with a suitable profile similarly derived from ETSI TS 102 231. |

F. Requirements for the notification of non-qualified EAA Providers

There is no notification of non-qualified EAA Providers foreseen by the
[European Digital Identity Regulation]. As stated in [[Topic 12](#a2312-topic-12---attestation-rulebooks)],
the Schema Provider for an Attestation Rulebook describing a type of attestation
that is an EAA defines in the Rulebook the mechanisms allowing a Relying Party
to obtain, in a trustworthy manner, the trust anchor(s) of EAA Providers issuing
this type of EAA.

G. Requirements for the notification of Access Certificate Authorities and Providers of registration certificates

Access Certificate Authorities (CA) are responsible for
signing access certificates they issue to PID Providers, QEAA Providers, PuB-EAA Providers,
and non-qualified EAA Providers, as well as to Relying Parties. For more information about Access Certificate Authorities, see [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)].

Providers of registration certificates are responsible for signing registration certificates they issue to PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers, as well as to Relying Parties. For more information about Access Certificate Authorities, see [[Topic 44](#a2344-topic-44---relying-party-registration-certificates)].

| **Index** | **Requirement specification** |
|------------|------------------|
| RPACANot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about Access Certificate Authorities and Providers of registration certificates. |
| RPACANot_02 | The common set of information to be notified about an Access Certificate Authority or a Provider of registration certificates SHALL include: 1. Identification data: i) Member State or country of establishment, ii) Name as registered in an official record, iii) Where applicable: - A business registration number from an official record, - Identification data from that official record. 2. Trust anchors of the Access Certificate Authority or Provider of registration certificates, i.e., public keys and name as per point 1) ii), supporting the authentication of Relying Parties, PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers by Wallet Units. |
| RPACANot_03 | Relying Parties, PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers SHALL ensure that their access certificates can be authenticated using the trust anchors of an Access Certificate Authority notified to the Commission. |
| RPACANot_03a | Relying Parties, PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers SHALL ensure that their registration certificates, if issued to them, can be authenticated using the trust anchors of a Provider of registration certificates notified to the Commission. |
| RPACANot_04 | The trust anchors of Access Certificate Authorities and Providers of registration certificates SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled Trusted Lists, which are signed or sealed by the Commission. |
| RPACANot_05 | The format of the Trusted Lists mentioned in RPACANot_04 SHALL comply with ETSI TS 119 612 v2.1.1 or with a suitable profile similarly derived from ETSI TS 102 231. |
| RPACANot_06 | If an Access Certificate Authority is suspended or cancelled (see requirement GenNot_05 above), that Access Certificate Authority SHALL immediately revoke all of its temporally valid access certificates. *Note: This implies that if an intermediary obtained its access certificates from an Access Certificate Authority that is suspended or cancelled, any intermediated Relying Parties depending on that intermediary will not be able to request attributes from Wallet Units, even though it has valid registration certificates. Such an intermediated Relying Party will either have to transit to another intermediary (which has access certificates issued by an active Access Certification Authority) or wait until the original intermediary obtains new access certificates either from another Access CA or from the original one, once that CA can continue its operations.* |
| RPACANot_07 | If a Provider of registration certificates is suspended or cancelled (see requirement GenNot_05 above), that Provider SHALL immediately revoke all of its valid registration certificates (if any). Moreover, the corresponding Registrar SHALL prohibit all access to the registry entries published online per Reg_03 and Reg_04. |

H. Requirements for the publication of Trusted Lists compiled by the
 Commission

| **Index** | **Requirement specification** |
|------------|------------------|
| TLPub_01 | The European Commission SHALL establish technical specifications for the system enabling the publication by the Commission of the information notified by the Member States regarding PID Providers, Wallet Providers, PuB-EAA Providers, Access Certificate Authorities, and Providers of registration certificates. |
| TLPub_02 | The European Commission SHALL establish technical specifications for the set of information to be published about PID Providers, Wallet Providers, PuB-EAA Providers, Access Certificate Authorities and Providers of registration certificates, based on the information notified by the Member States. *Note: The information to be published MAY be different from the information to be notified per requirements PPNot_01, WPNot_01, PuBPNot_01, and RPACANot_01 above, respectively.* |
| TLPub_03 | The publication of the information referred to in TLPub_01 SHALL take place over a secure channel protecting the authenticity and integrity of the published information. |
| TLPub_04 | The technical system mentioned in TLPub_01 SHALL NOT require authentication or prior registration and authorisation of any entity wishing to retrieve the published information. |
| TLPub_05 | The information referred to in TLPub_01 SHALL be published in an electronically signed or sealed form that is suitable for automated processing, and in a human-readable format, e.g., through introspection and display facilities, over an authenticated channel. |
| TLPub_06 | The Commission SHALL publish in the OJEU the locations of the Trusted Lists for PID Providers, Wallet Providers, PuB-EAA Providers, Access Certificate Authorities, and Providers of registration certificates. |
| TLPub_07 | The Commission SHALL publish in the OJEU the trust anchors to be used for verifying the signature or seal mentioned in TLPub_05. |
| TLPub_08 | As part of the specifications referred to in TLPub_01, the European Commission SHALL establish technical specifications for ensuring the availability and authenticity of the full history regarding the information notified about PID Providers, Wallet Providers, PuB-EAA Providers, Access Certificate Authorities, and Providers of registration certificates. |

#### A.2.3.32 Topic 32 - PID interoperability

See [Topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.33 Topic 33 - Wallet Unit backup and restore

##### Description <!-- omit from toc -->

Backup and restore functionality is needed in case the User has lost access to
their current Wallet Unit, for example in case of loss, theft, or breakdown. It
is also needed if the User wants to start using another Wallet Unit, for example
because they have bought a new device, need to factory-reset their existing
device, or want to migrate to another Wallet Solution. In all of these cases,
the User wants to restore the PIDs and attestations in their existing Wallet
Unit on their new Wallet Unit, with as minimal an effort as possible.

The [European Digital Identity Regulation] does not contain a requirement
mandating backup and restore functionality in the Wallet. However, Wallet
Providers should implement backup and restore functionality nevertheless,
because it will be expected by Users. In fact, the requirements in [Topic 34](#a2334-topic-34---migrate-to-a-different-wallet-solution)
also ensure the possibility of backup and restore.

##### HLRs <!-- omit from toc -->

There are no specific requirements in this Topic.

#### A.2.3.34 Topic 34 - Migrate to a different Wallet Solution

##### Description <!-- omit from toc -->

Article 5a 4 (g) of the [European Digital Identity Regulation] ensures the
User's rights to data portability. Data portability means that a User can
migrate to a different Wallet Solution. The User installs an instance of the new
Wallet Solution, and then wants to restore the PIDs and attestations in their
existing Wallet Unit to their new Wallet Unit. This should be possible with as
minimal an effort as possible, and independent of whether the User still has
access to their existing Wallet Unit.

The solution described in this Topic is to introduce a Migration Object in each
Wallet Unit. This object is a list of PIDs and attestations contained in the
Wallet Unit, together with the information needed to request (re-)issuance of
that PID or attestation. In addition, the Migration Object also contains the transaction log kept by the Wallet Unit, see [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). Note that the Migration Object does not contain any
private keys of PIDs or attestations. In most security
architectures for a Wallet Solution described in [Section 4.5 of the ARF main document](../../architecture-and-reference-framework-main.md#45-wscd-architecture-types), this is
impossible, since the WSCA/WSCD that contains these private keys does not allow
their extraction under any circumstances. An exception may be architectures in
which attestation private keys are managed in a remote HSM and the migration is
to a new Wallet Unit of the same Wallet Provider. However, in such cases,
restoring functionality of the PIDs and attestations in a new Wallet Unit does
not necessitate that private keys must be exported to another HSM. Rather, it
implies the User must be able to authenticate towards the existing HSM from the
new Wallet Unit, and be recognised as an existing User.

The fact that the Migration Object does not contain private keys means that PIDs
and attestations cannot be backed up and restored from the object in such a way
that they are usable in a new Wallet Unit without involvement of the PID
Provider or Attestation Provider. Instead, the User must ask the respective PID
Provider(s) or Attestation Provider(s) to issue the PID(s) or attestation(s) existing on the User's old Wallet Unit once again to the new Wallet Unit. The only function of the Migration Object is to simplify
this process by listing the PIDs and attestations present in the existing Wallet
Unit, together with the information needed by the new Wallet Unit to start the
issuance process.

The Migration Object does not contain attribute values or attribute identifiers,
as that data is considered sensitive and is not useful anyway because of the
limitations explained above. Instead, the object contains a list of
attestation types and the related Attestation Providers. However, even this
limited information may be considered sensitive in some cases. Therefore, the
Migration Object is stored in such a way that its confidentiality is ensured and
that it can be used only by the User.

##### HLRs <!-- omit from toc -->

A. Back-up requirements

| **Index** | **Requirement specification** |
|-----------|------------------|
| Mig_01 | A Wallet Unit SHALL include and keep up-to-date a Migration Object, containing the following information: - The contents of the log for all transactions executed through the Wallet Unit, as listed in requirement DASH_02. - A list of PIDs and attestations, except Wallet Unit Attestations, present in the Wallet Unit, according to the requirements in this Topic. |
| Mig_02 | The Commission SHALL define a technical specification of the Migration Object. |
| Mig_03 | For each PID or attestation that is issued to it, a Wallet Unit SHALL add to the Migration Object all data necessary to request issuance of that PID or attestation once again. This SHALL include at least the attestation type and the PID Provider or Attestation Provider that issued the PID or attestation, as well as their service supply points. However, the Migration Object SHALL NOT contain attribute identifiers or attribute values, and SHALL NOT contain any private keys of the PID or attestation. |
| Mig_03a | If the User deletes a PID or attestation from their Wallet Unit, the Wallet Unit SHALL delete the corresponding entry from the Migration Object. |
| Mig_04 | The Wallet Unit SHALL store the Migration Object in an external storage or remote storage location of the User's choice, from among the storage options supported by the Wallet Unit, in such a way that the User can still retrieve the object from a new Wallet Unit in case the existing Wallet Unit becomes unavailable. *Notes: - It is up to the Wallet Provider to decide which external storage options or remote storage locations the Wallet Unit supports for storing the Migration Object. - The new Wallet Unit may be either an instance of the same Wallet Solution as the old one, or an instance of a different Wallet Solution.* |
| Mig_05 | The Wallet Unit SHALL store the Migration Object in such a way that its confidentiality, integrity, and authenticity is protected and that it is protected against use by others than the User. *Note: This could be done, for example, by using password-based cryptography to encrypt the object.* |

B. Restore Requirements

| **Index** | **Requirement specification** |
|-----------|-----------------|
| Mig_06 | Directly after installation of a new Wallet Instance, the Wallet Instance SHALL enable the User to import a Migration Object from an external storage or remote storage location indicated by the User, from among the storage options supported by the Wallet Unit. |
| Mig_07 | When importing a Migration Object, for each PID and attestation listed in the Migration Object, the Wallet Unit SHALL enable the User to select that PID or attestation. When selected, the Wallet Unit SHALL request the respective PID Provider or Attestation Provider to re-issue that PID or attestation. If the Migration Object lists a PID, the PID SHALL be the first to be restored. |
| Mig_07a | When importing a Migration Object, the Wallet Unit SHALL ask the User whether they want to restore the log from the Migration Object. When the User agrees, the Wallet Unit SHALL restore the log, and SHALL append future transactions to this log according to the requirements in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). |
| Mig_08 | Empty |
| Mig_09 | Empty |
| Mig_10 | Empty |
| Mig_11 | The processes and interfaces used for issuance of a PID or attestation as part of a migration process SHALL be the same as those used for a 'normal' issuance process, as specified in [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit). |
| Mig_12 | Empty |
| Mig_13 | Empty |
| Mig_14 | Empty |
| Mig_15 | Empty |
| Mig_16 | Empty |

#### A.2.3.35 Topic 35 - PID issuance service blueprint

##### Description <!-- omit from toc -->

This Topic analyses the User journeys for PID issuance to a Wallet
Unit. This Topic focuses on natural persons only.

##### HLRs <!-- omit from toc -->

No HLRs are present for this Topic. Note that issuance of PID is discussed in [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit); relevant HLRs can be found there.

#### A.2.3.36 Topic 36 - Risk Analysis of the Wallet usage

There are no HLRs for this Topic.

#### A.2.3.37 Topic 37 - QES -- Remote Signing - Technical Requirements

See [Topic 16](#a2316-topic-16---signing-documents-with-a-wallet-unit).

#### A.2.3.38 Topic 38 - Wallet Unit revocation

##### Description <!-- omit from toc -->

This Topic discusses Wallet Unit revocation. In particular, it answers the
following questions: - How can a Wallet Provider revoke a Wallet Unit? - During
issuance of an attestation, how can an Attestation Provider verify whether a
Wallet Unit has been revoked? - When requesting attributes from an attestation, how
can a Relying Party verify whether a Wallet Unit has been revoked?

Related to the last question, [CIR 2024/2977], Article 5, 4.(b) says "Where
providers of person identification data revoke person identification data issued
to wallet units, they shall do so (...) where the wallet unit attestation to
which the person identification data was issued to has been revoked". This
implies that if a Relying Party verifies that a PID it obtained from a Wallet
Unit is valid (i.e., not revoked), it can trust that the Wallet Unit is also
valid. Consequently, there is no need for a separate mechanism that would allow
the Relying Party to verify the revocation status of a Wallet Unit directly with
the Wallet Provider. Although the CIR requires this mechanism only for PIDs,
other Attestation Providers may similarly revoke an attestation if the Wallet
Unit on which it resides is revoked. Note that if an Attestation Provider does
not support this, a Relying Party obtaining an attestation from a Wallet Unit
has no way of knowing whether the Wallet Unit is revoked. Depending on the value
of the attestation, this risk may be acceptable for the Relying Party.

In case of a security issue, Article 5e of the [European Digital Identity
Regulation] requires Wallet Providers to first suspend a Wallet Unit and to
revoke it only if the issue cannot be solved within three months. However, the
suspension of a Wallet Unit is an administrative process, which does not imply
that the WUAs of that Wallet Unit need to be suspended, as opposed to being
revoked. Instead, if the Wallet Provider administratively suspends a Wallet
Unit, it will immediate revoke all corresponding WUAs. If (within three months)
the situation is remedied and the Wallet Unit can be re-instated, the Wallet
Provider will issue one or more new WUAs to the Wallet Unit.

##### HLRs <!-- omit from toc -->

A. Issuing a Wallet Unit Attestation

| **Index** | **Requirement specification** |
|------------|-------------------|
| WURevocation_01 | To enable a PID Provider or an Attestation Provider to verify the authenticity and the revocation status of a Wallet Unit it is interacting with, a Wallet Provider SHALL issue one or more Wallet Unit Attestations to the Wallet Unit, as specified in Topic 9. *Note: The first of these WUAs will be issued during the activation phase of a Wallet Unit. During the lifetime of the Wallet Unit, the Wallet Provider will re-issue WUAs as needed.* |
| WURevocation_02 | During the lifetime of the Wallet Unit, the Wallet Provider SHALL ensure that the Wallet Unit at all times is in possession of at least one valid WUA. |
| WURevocation_03 | Empty |
| WURevocation_04 | Empty |
| WURevocation_05 | Empty |

A. Revoking a Wallet Unit

| **Index** | **Requirement specification** |
|------------|------------------|
| WURevocation_06 | Empty |
| WURevocation_07 | A Wallet Provider SHALL be able to revoke a Wallet Unit by revoking its WUA(s), as specified in [[Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking)].*|
| WURevocation_08 | Empty |
| WURevocation_09 | During the lifetime of a Wallet Unit, the Wallet Provider SHALL regularly verify that the security of the Wallet Unit is not breached or compromised. If the Wallet Provider detects a security breach or compromise, the Wallet Provider SHALL analyse its cause(s) and impact(s). If the breach or compromise affects the trustworthiness or reliability of the Wallet Unit, the Wallet Provider SHALL administratively revoke or suspend the Wallet Unit and SHALL immediately revoke the corresponding WUA(s). The Wallet Provider SHALL do so at least in the following circumstances: - If the security of the Wallet Unit, or the security of the mobile device and OS on which the corresponding Wallet Instance is installed, or the security of a WSCA/WSCD it uses for managing cryptographic keys and sensitive data, is breached or compromised in a manner that affects its trustworthiness or reliability. - If the security of the Wallet Solution is breached or compromised in a manner that affects the trustworthiness or reliability of all corresponding Wallet Units. - If the security of the common authentication and data protection mechanisms used by the Wallet Unit is breached or compromised in a manner that affects their trustworthiness or reliability. - If the security of the electronic identification scheme under which the Wallet Unit is provided is breached or compromised in a manner that affects its trustworthiness or reliability. |
| WURevocation_9b | If within three months from an administrative suspension of a Wallet Unit the security breach or compromise is remedied, the Wallet Provider SHALL issue one or more WUAs to the Wallet Unit, such that the User can again use it. |
| WURevocation_10 | A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of the User registered during the Wallet Unit activation process, see [Topic 40](#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management). To do so, the Wallet Provider SHALL revoke all valid WUA(s) for that Wallet Unit. The Wallet Provider SHALL authenticate the User before accepting a request to revoke the Wallet Unit. |
| WURevocation_11 | A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of a PID Provider, in case the natural person using the Wallet Unit has died or the legal person using the Wallet Unit has ceased operations. To do so, the Wallet Provider SHALL revoke all valid WUA(s) for that Wallet Unit. To identify the Wallet Unit that is to be revoked, the PID Provider SHALL use a Wallet Unit identifier provided by the Wallet Provider in the WUA during PID issuance. *Note: See the notes to WUA_08.* |
| WURevocation_12 | Before revoking a Wallet Unit per WURevocation_11, the Wallet Provider SHALL verify that the party requesting revocation is indeed a valid PID Provider listed in the Trusted List of PID Providers. |
| WURevocation_13 | Before requesting a Wallet Provider to revoke a Wallet Unit per WURevocation_11, the PID Provider SHALL ensure that the revocation does not harm the interests of any of the stakeholders. The PID Provider SHALL have (and follow) a documented policy to ensure that this is the case. |

B. Informing the User

| **Index** | **Requirement specification** |
|-----------|-------------------|
| WURevocation_14 | A Wallet Provider SHALL inform a User without delay, and within 24 hours at most, in case the Wallet Provider decided to revoke the User's Wallet Unit. The Wallet Provider SHALL also inform the User about the reason(s) for the revocation. This information SHALL be understandable for the general public. It SHALL include (a reference to) technical details about any security breach if applicable. |
| WURevocation_15 | Empty |
| WURevocation_16 | To inform a User about the revocation of their Wallet Unit, the Wallet Provider SHALL use a communication channel that is independent of the Wallet Unit. In addition, the Wallet Provider MAY use the Wallet Unit itself to inform the User. |

C. Verifying the revocation status of a Wallet Unit

| **Index** | **Requirement specification** |
|-----------|------------------|
| WURevocation_17 | Empty |
| WURevocation_18 | A PID Provider issuing revocable PIDs SHALL, for each of its valid PIDs, regularly verify whether the Wallet Provider revoked the Wallet Unit on which that PID is residing, using the revocation information in the WUA it received during issuance of that PID. If it turns out that the Wallet Unit is revoked, the PID Provider SHALL immediately revoke the respective PID in accordance with all requirements in [[Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking)]. *Notes: - This is a consequence of the legal requirement in [CIR 2024/2977], Article 5, 4.(b). - See [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md) for how the PID Provider can do this verification. - The reverse is not true: When a PID is revoked, this does not imply that the Wallet Unit on which it is residing should also be revoked. Instead, the Wallet Unit moves to the Operational state. See [ARF main document Section 4.6.3](../../architecture-and-reference-framework-main.md#463-wallet-unit).* |
| WURevocation_19 | An Attestation Provider issuing revocable attestations MAY decide to  revoke an attestation if the Wallet Provider revoked the Wallet Unit on which that attestation is residing, in the same manner as described in WURevocation_18. An Attestation Provider SHALL publish its policy in this regard. *Note: Publishing its policy regarding revocation allows a Relying Party to decide if it can put sufficient trust in the attestations issued by that Attestation Provider.* |
| WURevocation_19a | Empty |
| WURevocation_19b | Empty |
| WURevocation_20 | Empty |
| WURevocation_21 | Empty |

#### A.2.3.39 Topic 39 - Wallet to wallet technical Topic

See [Topic 30](#a2330-topic-30---interaction-between-wallet-units).

#### A.2.3.40 Topic 40 - Wallet Instance installation and Wallet Unit activation and management

##### Description <!-- omit from toc -->

This Topic discusses requirements related to the installation of a Wallet
Instance by the User, the subsequent activation of the Wallet Unit by the User
and the Wallet Provider, and the management of the Wallet Unit throughout its
lifetime.

##### A - HLRs for Wallet Instance installation <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_01 | To ensure that the User can trust the Wallet Solution, a Wallet Provider SHOULD make its certified Wallet Solution available for installation only via the official app store of the relevant operating system (e.g., Android, iOS). *Note: This allows the operating system of the device to perform relevant checks regarding the authenticity of the Wallet Unit.* |
| WIAM_02 | If a Wallet Provider makes its certified Wallet Solution available for installation through other means than the official OS app store, it SHALL implement a mechanism allowing the User to verify the authenticity of the Wallet Unit. Moreover, it SHALL provide clear instructions to the User on how to install the Wallet Instance, including at least: - instructions on the verification of the authenticity of the Wallet Instance to be installed, - instructions on bypassing of any operating system limitations on side-loading of apps, if applicable, and ensuring that these limitations are restored after the Wallet Instance has been installed. *Note: This requirement also applies for the installation of a Wallet Instance on a User device that is not a mobile device, and for which no official operating system app store may exist.* |

##### B - HLRs for Wallet Unit activation <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_03 | A Wallet Provider SHALL ensure that a Wallet Instance starts a process to activate the new Wallet Unit with the Wallet Provider immediately after installation or when the User first opens the Wallet Instance. The Wallet Provider SHALL ensure that the Wallet Instance starts this process only with a secure backend of the Wallet Provider. |
| WIAM_04 | During the activation process of a new Wallet Unit, the Wallet Provider SHALL verify that the new Wallet Instance is a genuine instance of its Wallet Solution. |
| WIAM_05 | During the activation process of a new Wallet Unit, the Wallet Provider SHALL process information about the User device and the available WSCAs and WSCDs, as far as necessary to issue a Wallet Unit Attestation to the Wallet Unit conform all requirements in [Topic 9](#a239-topic-9---wallet-unit-attestation) section A. The Wallet Provider MAY process additional information necessary for managing the Wallet Unit, but it SHALL NOT process more information than it reasonably needs for legitimate purposes. The Wallet Provider SHALL request User consent (through the Wallet Instance) for all information and data it will process, both during activation and throughout the lifetime of the Wallet Unit. The Wallet Provider SHALL inform the User about the purposes of data processing, in accordance with the General Data Protection Regulation. |
| WIAM_06 | The Wallet Provider SHALL request the User, through the new Wallet Instance, to set up a User account at the Wallet Provider. The Wallet Provider SHALL explain to the User that this is necessary to enable the User to request revocation of the Wallet Unit in case of theft or loss. The Wallet Provider SHALL register one or more User authentication methods that the Wallet Provider will use to authenticate the User in the future. These methods SHALL be independent of the Wallet Unit and the User device. The Wallet Provider SHALL allow the User to register using an alias instead of true identity data. The Wallet Provider SHALL NOT use any registered User data for purposes other than User authentication, unless the User gives explicit consent to do so. The Wallet Provider SHALL register the relationship between the Wallet Unit and the corresponding User account. |
| WIAM_07 | A Wallet Provider SHALL activate a new Wallet Unit before a User can use it to have issued an PID or attestation. *Note: The WUA is issued as part of the activation.* |
| WIAM_08 | A Wallet Provider SHALL only activate a new Wallet Unit if it has verified that: - The Wallet Unit includes at least one WSCA/WSCD that is certified to be compliant with applicable requirements in this Topic, for Level of Assurance High in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. In addition, the Wallet Unit MAY include one or more other WSCAs, which SHALL be certified to be compliant with applicable requirements for Level of Assurance Substantial or High. - The private key corresponding to the public key in the WUA (see WUA_09) is protected by the respective WSCA/WSCD under control of the User. |
| WIAM_09 | If a WSCA/WSCD contains cryptographic keys related to multiple Wallet Units, the Wallet Provider SHALL ensure that a Wallet Unit can only access keys that are related to that Wallet Unit. |
| WIAM_10 | During the activation process of a new Wallet Unit, a Wallet Provider SHALL create and sign at least one Wallet Unit Attestation, and issue them to the Wallet Unit. |
| WIAM_10a | During the activation process of a new Wallet Unit, the Wallet Provider SHALL offer the User a means to verify the formal certification information of their Wallet Solution. |

##### C - HLRs for Wallet Unit management <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_11 | During the lifetime of the Wallet Unit, the Wallet Provider SHALL update the Wallet Unit as necessary to ensure its continued security and functionality. |
| WIAM_12 | All communication between the Wallet Provider and the Wallet Unit SHALL be mutually authenticated and SHOULD be encrypted. |
| WIAM_12a | The Wallet Unit SHALL ensure that the Wallet Provider cannot access the contents of the Wallet Unit, in particular to learn a) which attestations are present on the Wallet Unit, b) the status of these attestations, c) the value of attributes in these attestations, and d) the contents of the Wallet Unit log meant in DASH_02. |
| WIAM_13 | If the User uninstalls the Wallet Unit, the Wallet Unit SHALL ensure that all cryptographic key material in the WSCA(s) related to the Wallet Unit is securely destroyed. This includes all keys of the WUAs, PIDs and attestations stored in the Wallet Unit. *Note: Key deletion is a cryptographic key operation and requires User authentication, as specified in requirement WIAM_14.* |
| WIAM_13a | If a Wallet Unit supports the [W3C Digital Credentials API] and the User uninstalls the Wallet Unit, the Wallet Unit SHALL disclose the fact that it no longer stores any PID(s) or attestation(s) to the Digital Credentials API framework. |
| WIAM_14 | A WSCA/WSCD SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or a private or secret key of a PID or an attestation stored in a Wallet Unit. For a PID key (which is part of the EUDI Wallet eID means), this WSCA/WSCD SHALL be certified to be compliant with applicable requirements for Level of Assurance High in Commission Implementing Regulation (EU) 2015/1502 section 2.2.1. *Note: Many actions of the Wallet Unit, such as processing a Relying Party presentation request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and presentation signing and encryption. This requirement does not imply that a separate User authentication is necessary before each of these operations. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.* |
| WIAM_15 | Before performing any operation, a Wallet Unit SHALL authenticate the User. The Wallet Unit SHALL use the OS-level authentication mechanism according to WIAM_15a, unless this is technically impossible (for instance on some legacy devices), or the User prefers to use a Wallet Unit-specific PIN implemented by the Wallet Unit itself, as specified in WIAM_15b. |
| WIAM_15a | In order to ensure that operating system-level authentication can be used and is sufficiently secure, during installation of the Wallet Unit, the Wallet Unit SHALL enforce the activation of an OS-level User authentication mechanism with adequate security policies. |
| WIAM_15b | During installation of the Wallet Unit, the Wallet Unit SHALL enable the User to indicate if they want to use a Wallet Unit-specific PIN for User authentication, or use the OS-level User authentication mechanism. The Wallet Unit SHALL enable the User to change this preference during the lifetime of the Wallet Unit. |
| WIAM_16 | For User authentication according to WIAM_15, a Wallet Unit SHALL implement an idle timeout, after which User authentication SHALL again be required. The Wallet Unit SHOULD provide the User with the option to set the idle timeout to a duration shorter than the default timeout. |
| WIAM_17 | A WSCA/WSCD SHALL be able to authenticate a User in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. |
| WIAM_18 | A WSCA/WSCD SHALL be able to generate a new key pair on request of the Wallet Provider via the Wallet Instance. |
| WIAM_19 | A WSCA/WSCD SHALL be able to prove possession of the private key corresponding to a public key on request of a Wallet Instance, for example by signing a challenge with that private key. |
| WIAM_20 | A WSCA/WSCD SHALL protect a private key it generated during the entire lifetime of the key. This protection SHALL at least imply that the WSCA/WSCD prevents the private key from being extracted in the clear. If a WSCA/WSCD is able to export a private key in encrypted format, the resulting level of protection SHALL be equivalent to the protection level of the private key when stored in the WSCA. |
| WIAM_21 | Whenever the WSCA/WSCD successfully authenticated the User according to WIAM_14, the Wallet Unit SHOULD check if there are any PIDs or attestations on the Wallet Unit that cannot be presented any longer to Relying Parties, for example because they have expired or because a once-only attestation (see [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit), section D, method A) was presented to a Relying Party already. The Wallet Unit SHOULD then request the WSCA/WSCD to destroy all cryptographic key material related to these PIDs or attestations. *Note: The reason for this recommendation is that probably, Wallet Providers will want to prevent an accumulation of unused private keys in the WSCA/WSCD, given that such devices typically do not have much storage space. However, deletion of private keys (and potentially other key material) is a cryptographic key operation and cannot be done without User authentication; see WIAM_14. At the same time, for usability reasons the User must not be involved in such 'cleaning up' processes, see also ISSU_42. The recommended solution is to take advantage of a User authentication event to also carry out any necessary cleaning operations.* |

##### D - HLRs for Wallet Unit accessibility <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_21 | Wallet Providers SHALL ensure that their Wallet Units comply with requirements and standards outlined in [Directive 2016/2012 on the accessibility of websites and mobile applications of public sector bodies](http://data.europa.eu/eli/dir/2016/2102/oj), including European Standard EN 301 549 V1.1.2 (2015-04). |
| WIAM_22 | Wallet Providers SHALL ensure that their Wallet Units comply with accessibility requirements for products and services established under [Directive (EU) 2019/882](http://data.europa.eu/eli/dir/2019/882/oj). |

#### A.2.3.41 Topic 41 - Minimum requirements on PuB-EAAs rulebooks

See [Topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.42 Topic 42 - Requirements for QTSPs to access Authentic Sources

##### Description <!-- omit from toc -->

This Topic discusses the ability of QTSPs issuing electronic attestations of
attributes to verify those attributes by electronic means at the request
of the User, wherever those attributes rely on Authentic Sources within
the public sector.  

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| QTSPAS_01 | In accordance with technical specifications referred to in QTSPAS_07, Member States SHALL define: - discovery mechanisms that enable QTSPs to request information about Authentic Sources or designated intermediaries recognised at the national level. This includes information regarding the attributes of a natural or legal person for which the Authentic Source or designated intermediary is considered a primary source, or for which it is recognised as authentic in accordance with Union law or national law, including administrative practices. - procedures for QTSPs to request the verification of attributes from Authentic Sources. |
| QTSPAS_02 | An Authentic Source in the public sector, or its designated intermediary, SHALL implement an interface complying with the technical specification mentioned in QTSPAS_07 for receiving verification requests and sending responses. For each received request, the Authentic Source SHALL - identify and authenticate the requestor in such a way that it can subsequently determine whether the requestor is a QTSP issuing qualified electronic attestation of attributes, for example by means of a lookup in the QTSP Trusted List. - authenticate the User and obtain their approval, if it is legally obliged to do so, in addition to the User authentication and approval already performed by the QTSP according to QTSPAS_08. - verify whether the attribute values claimed by the QTSP match the values held by the Authentic Source; and, finally, - respond with one of the following for each attribute: +'match', if the attribute value held for this User by the Authentic Source is identical to the value claimed by the QTSP, + 'no match', if the attribute value held for this User by the Authentic Source is not identical to the value claimed by the QTSP, including if the Authentic Source is the authentic source for this attribute but does not hold a value for this User, +'unknown', if the Authentic Source is not the authentic source for this attribute. |
| QTSPAS_03 | An Authentic Source or designated intermediary SHALL respond to a verification request for attributes by any QTSP issuing qualified electronic attestation of attributes.|
| QTSPAS_04 | An Authentic Source or designated intermediary SHALL implement the technical specifications mentioned in QTSPAS_01, so that the QTSP will receive the result of the verification of the requested attributes as described in QTSPAS_02. If the verification is deferred, the response to the QTSP SHALL include the maximum time that it will take to verify the requested attributes, and a unique identifier that the QTSP SHALL use to obtain the result of the verification. |
| QTSPAS_05 | A QTSP SHALL send an attribute verification request directly to the Authentic Source or designated intermediary recognised at national level, after discovering it using the mechanisms mentioned in QTSPAS_01. |
| QTSPAS_06 | Member States SHALL specify the processes and mechanisms to designate the Authentic Sources or intermediaries recognised at national level in accordance with Union or national law, allowing these Authentic Sources or intermediaries to verify the attributes presented to them by QTSPs. |
| QTSPAS_07 | The Commission SHALL publish, in cooperation with the European Digital Identity Cooperation Group, a technical specification, referring to applicable standards, specifications and procedures, that will cover at least the attributes specified in Annex VI, wherever those attributes rely on Authentic Sources within the public sector, for which Member States must ensure that measures are taken to allow qualified providers of electronic attestations of attributes to verify by electronic means, at the request of the User, their authenticity against the relevant authentic source. |
| QTSPAS_07a | The standards and procedures mentioned in QTSPAS_07 SHOULD, whenever possible, be aligned and compatible with those used for the platforms implementing the Once Only Technical System (OOTS). *Note: There is a clear synergy of both of these data exchange approaches. In fact, the national OOTS node would be a candidate for acting as an intermediary between QTSPs issuing QEAAs and the Authentic Sources.* |
| QTSPAS_08 | A QTSP SHALL obtain approval from the User to verify the authenticity of the attributes, before requesting the verification of those attributes by the relevant Authentic Source or designated intermediary. |

#### A.2.3.43 Topic 43 - Embedded disclosure policies

##### Description <!-- omit from toc -->

This topic is focused on identifying high-level requirements for disclosure
policies which may be embedded in an attestation. Such a policy may be created
by the Attestation Provider, and allows the Wallet Unit, using data obtained
from the Relying Party, to determine whether the Attestation Provider agrees
with releasing attributes from the attestation to the Relying Party. Note that
an embedded disclosure policy, if present, is applicable for any attribute in
the attestation.

Note that embedded disclosure policies do not apply to Wallet-to-Wallet interactions as described in [Topic 30](#a2330-topic-30---interaction-between-wallet-units), because a requesting Wallet Unit is not registered and therefore no authenticated information is available to evaluate an embedded disclosure policy.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| EDP_01 | A Wallet Unit SHALL enable an Attestation Provider to optionally express an embedded disclosure policy for a QEAA, PuB-EAA, or non-qualified EAA. *Note: The [European Digital Identity Regulation] does not contain a requirement for PIDs to be able to contain an embedded disclosure policy.* |
| EDP_02 | A Wallet Unit SHALL support embedded disclosure policies implementing the 'Authorised relying parties only policy' described in Annex III of Implementing Regulation (EU) 2024/2979. If present, such an embedded disclosure policy SHALL contain a list of EU-wide unique identifiers of Relying Parties, as specified in Reg_32. The Wallet Unit SHALL retrieve the Relying Party identifier from the access certificate presented by the Relying Party, and compare it to the list of authorised identifiers in the policy, unless the Relying Party is an intermediary. If the Relying Party is an intermediary, the Wallet Unit SHALL retrieve the unique identifier of the intermediated Relying Party from the presentation request or from the Registrar's online service (as applicable) and compare this identifier to the list of authorised identifiers in the policy. *Note: See RPI_07 for how the Wallet Unit can see if the Relying Party is an intermediary.* |
| EDP_03 | A Wallet Unit SHALL support embedded disclosure policies implementing the 'Specific root of trust' policy described in Annex III of Implementing Regulation (EU) 2024/2979. If present, such an embedded disclosure policy SHALL contain a list of root or intermediate certificates used for signing Relying Party access certificates. The Wallet Unit SHALL compare the certificate chain that was used to sign the access certificate provided by the Relying Party to the list of authorised root or intermediate certificates in the policy, unless the Relying Party is an intermediary. If the Relying Party is an intermediary, the Wallet Unit SHALL retrieve the root certificate of the Provider of registration certificates of the intermediated Relying Party from the presentation request or from the Registrar's online service (as applicable) and compare this certificate to the list of authorised certificates in the policy. *Note: See RPI_07 for how the Wallet Unit can see if the Relying Party is an intermediary.* |
| EDP_04 | Empty |
| EDP_05 | An embedded disclosure policy SHOULD contain a link to a website of the Attestation Provider explaining the disclosure policy in layman's terms. If this is the case, the Wallet Unit SHALL display the link to the User and allow them to navigate to that website. |
| EDP_06 | The Wallet Unit SHALL evaluate an embedded disclosure policy in conjunction with the information received from the requesting Relying Party, in order to determine if the Relying Party has permission from the Attestation Provider to access the requested attestation. |
| EDP_07 | The Wallet Unit SHALL enable the User, based on the outcome of the evaluation of the applicable embedded disclosure policy(s), to deny or allow the presentation of the requested attestation to the Relying Party. |
| EDP_08 | The Commission SHALL take measures to ensure a technical specification is created establishing common mechanisms for the specification of embedded disclosure policies by Attestation Providers, and for the evaluation of such policies by Wallet Units. |
| EDP_09 | An Attestation Provider SHALL include an embedded disclosure policy (if any) by value in the Issuer metadata related to the attestation, in compliance with the [OpenID4VCI] issuance protocol or an extension thereof specified in the technical specification mentioned in EDP_08. |
| EDP_10 | During attestation issuance, a Wallet Unit SHALL retrieve and store locally the corresponding embedded disclosure policy, if any. |
| EDP_11 | An Attestation Provider SHALL revoke an attestation if a corresponding embedded disclosure policy is added, changed, or deleted. |

#### A.2.3.44 Topic 44 - Relying Party registration certificates

##### Description <!-- omit from toc -->

This topic identifies high-level requirements for Relying Party registration
certificates, which were introduced in Commission Implementing Regulation
2024/2982 [2024/2982]. A registration certificate may be issued by a
Provider of registration certificates to a Relying Party during the registration process described in
[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties).
If present, it contains mainly the list of attributes registered by the Relying Party
according to Article 5b 2 (c) of the [European Digital Identity Regulation], as well as information about the intermediary used by this Relying Party, if applicable. A
registration certificate is signed by the Provider of registration certificates.
As a Relying Party is obliged to register for each purpose ("intended use") separately, multiple registration certificates may be issued to a single Relying Party.

Commission Implementing Regulation 2024/2982 requires a Wallet Unit to
authenticate and validate the registration certificate (if available), and to display to the User the information on the Relying Party as registered by the Registrar. The information in the registration certificate can also be retrieved from the Registrar's online service. This enables Users
to verify that the attributes being requested by the Relying Party are within
the scope of their registered attributes ("intended use"), providing assurance that the request is legitimate and trustworthy.

##### HLRs <!-- omit from toc -->

A. Issuance of Relying Party registration certificates

| **Index** | **Requirement specification** |
|-----------|-----------------|
| RPRC_01 | During the registration process for Relying Parties, as specified in [Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties), a Provider of registration certificates associated to the Member State Registrar MAY create and sign or seal a separate registration certificate for each intended use requested to be registered by the Relying Party, and issue it to the Relying Party. If present, the registration certificate SHALL comply with the applicable requirements in the technical specification mentioned in RPRC_02. *Note: See also [Topic 52](#a2352-topic-52-relying-party-intermediaries).* |
| RPRC_01b | If, during registration, a Relying Party received one or more registration certificates, it SHALL distribute these to all its Relying Party Instances. |
| RPRC_02 | The Commission SHALL ensure that a technical specification is created, describing at least 1. the contents and format of registration certificates. 2. the signing method(s) used to ensure the authenticity of the registration certificates. 3. the trust infrastructure necessary for signing registration certificates and for verifying these signatures, including the use of Trusted Lists to establish trust in Providers of registration certificates and to distribute their trust anchors to Wallet Units. 4. the method used for binding each registration certificate to the Relying Party Instance access certificate that will be used during the same transaction. This binding method SHALL enable a Wallet Unit to verify that the registration certificate is bound to the Relying Party that authenticated itself using the access certificate. The binding method SHALL consider situations in which the Relying Party uses the services of an intermediary (see [Topic 52](#a2352-topic-52-relying-party-intermediaries)) to connect to the Wallet Unit. 5. whether or not a registration certificate must have a validity period. 6. the method to be used for revocation of registration certificates. Moreover, the technical specification SHALL describe the impact of revocation, especially compared to the impact of revocation of the Relying Party Instance access certificates. |
| RPRC_03 | The contents of a registration certificate SHALL include at least the information required in Annex V of the [CIR 2025/848](https://data.europa.eu/eli/reg_impl/2025/848/oj) regarding registration of wallet-relying parties. If the Relying Party uses the services of an intermediary (see [Topic 52](#a2352-topic-52-relying-party-intermediaries)), the 'association to the intermediary' mentioned in Annex I (15) of [CIR 2025/848] SHALL consist of the user-friendly name and unique identifier of this intermediary, as meant in requirements Reg_31 and Reg_32. *Note: this name and identifier are identical to those in the access certificate of the intermediary.* |
| RPRC_03a | The common Relying Party Registration Certificate Policy SHALL require that a Relying Party registration certificate contains a name for the Relying Party, in a format suitable for presenting to a User. *Note: A Wallet Unit needs such a name when requesting User approval according to [[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)]* |
| RPRC_03b | The common Relying Party Registration Certificate Policy SHALL require that a Relying Party registration certificate contains an EU-wide unique identifier for the Relying Party, and SHALL specify a method for deriving such identifiers. *Notes: - The Wallet Instance needs such an identifier at least to allow the User to send a report of suspicious Relying Party presentation requests to a data protection authority according to [Topic 50](#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data). - The EU-wide unique identifier could, for example, be a concatenated list of one or more registered official Relying Party identifiers listed in Annex I(3) of the [CIR 2025/848](https://data.europa.eu/eli/reg_impl/2025/848/oj) regarding registration of Wallet Relying Parties, expressed in the semantic form defined in [ETSI EN 319 412-1] sections 5.1.4 or 5.1.5. The exact specification is left for the technical specifications to be developed by the European Commission.* |
| RPRC_03c | The EU-wide unique identifier meant in RPRC_03b SHALL be identical in all registration certificates issued for a given Relying Party. *Note: In case the registration certificates issued to an intermediated Relying Party are held and presented by an intermediary, the Relying Party meant in this requirement is the intermediated Relying Party. An intermediary may obtain and hold registration certificates with a different unique identifier.* |
| RPRC_03d | The common Relying Party Registration Certificate Policy SHALL require that a Relying Party registration certificate contains at least one of the following: a) the URL of a web form provided by the Relying Party, which Users can use to send attribute erasure requests, b) an e-mail address of the Relying Party, on which the Relying Party is prepared to receive attribute erasure requests from Users, c) a telephone number of the Relying Party, on which the Relying Party is prepared to receive attribute erasure requests from Users. *Note: See [Topic 48](#a2348-topic-48---blueprint-for-requesting-data-deletion-to-relying-parties) for more information about attribute erasure requests.* |
| RPRC_03e | The common Relying Party Registration Certificate Policy SHALL require that a Relying Party registration certificate contains at least one of the following: a) the URL of web form provided by the Data Protection Authority supervising the Relying Party, which Users can use to report suspicious attribute presentation requests. b) an e-mail address of that DPA, on which the DPA is prepared to receive reports about suspicious attribute presentation requests from Users, c) a telephone number of that DPA, on which the DPA is prepared to receive reports about suspicious attribute presentation requests from Users. *Note: See [Topic 50](#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data) for more information about reporting suspicious attribute presentation requests.* |

B. Presentation and verification of Relying Party registration certificates

| **Index** | **Requirement specification** |
|-----------|-----------------|
| RPRC_04 | If a Relying Party Instance received one or more registration certificates (see RPRC_01b), it SHALL include a single registration certificate applicable for its current intended use in each presentation request to a Wallet Unit, according to the applicable standard's extension mentioned in RPRC_05. The registration certificate SHALL be included in the request by value, not by reference. The Wallet Unit SHALL do so both in proximity and remote presentation flows. *Note: This ensures that no external requests are necessary to validate the request, and that transactions are atomic and self-contained.* |
| RPRC_05 | The Commission SHALL ensure that extensions are specified for [ISO/IEC 18013-5] and for [OpenID4VP], allowing a Relying Party to transfer a single Relying Party registration certificate to a Wallet Unit in a presentation request. These extensions SHALL comply with applicable requirements in these standards. *Note that it must not be possible to include multiple registration certificates in a single presentation request.* |
| RPRC_06 | Either during a presentation transaction or as a general User setting, a Wallet Unit SHALL offer the User the possibility to indicate whether the User wants to verify the information registered by the competent Registrar about the Relying Party. |
| RPRC_06a | If the User indicated that they want to verify the information registered about the Relying Party and a registration certificate is available in the request, the Wallet Unit SHALL verify the authenticity and validity of the registration certificate according to the technical specification meant in RPRC_02. If the outcome of the verification is negative, the Wallet Unit SHALL, when asking for User approval according to RPA_07, notify the User that it could not obtain the information registered about the Relying Party. |
| RPRC_06b | If the User indicated that they want to verify the information registered about the Relying Party but no registration certificate is available in the request, the Wallet Unit SHALL connect to the URL of the online service of the Registrar (as included in the access certificate) to obtain this information. If the Wallet Unit cannot connect to this URL or if it cannot verify the authenticity and validity of the registered information, it SHALL, when asking for User approval according to RPA_07, notify the User that it could not obtain the information registered about the Relying Party. |
| RPRC_07 | If the User indicated that they want to verify the information registered about the Relying Party and the Wallet Unit retrieved this information either from the registration certificate or from the online service of the Registrar, it SHALL verify that all attributes requested in the presentation request are included in the list of attributes registered by the Registrar. If the outcome of the verification is negative, the Wallet Unit SHALL, when asking for User approval according to RPA_07, notify the User about the requested attributes that the Relying Party did not register. |
| RPRC_08 | Empty. |
| RPRC_09 | Empty. |
| RPRC_10 | The Commission SHALL provide a technical specification establishing a common Certificate Policy for registration certificates, covering at least management and selection of signing keys, revocation and lifecycle management of registration certificates on individual intended use level. *Note: The technical specification may require the Provider of registration certificates to follow applicable parts of technical standards such as EN 319 401 (for General Policy Requirements for TSPs) and TS 119 461 (for identity proofing of Relying Party representatives).* |
| RPRC_11 | A Relying Party Instance SHALL include at most one registration certificate in a presentation request for a given intended use of a Relying Party. |
| RPRC_12 | Empty. |

#### A.2.3.45 Topic 45 - QEAA Rulebook

See [Topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.46 Topic 46 - Protocols and interfaces for Presentation of PID and (Q)EAA with Relying Parties

See [Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit)
and [Topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.47 Topic 47 - Protocols and interfaces for PID and (Q)EAA issuance, and (non-)qualified certificates issuance

See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit)/[23](#a2323-topic-23---pid-issuance-and-qeaa-issuance).

#### A.2.3.48 Topic 48 - Blueprint for requesting data deletion to Relying Parties

##### Description <!-- omit from toc -->

In this use case, a User requests the deletion of their personal attributes from
Relying Parties with which they have interacted through their Wallet Unit.

Users are concerned about having control over their personal data, thus
the function of requesting data deletion ensures a higher degree of
transparency, privacy and control of the Users over their personal
data.

This Topic lists high-level requirements related to the function
of Users requesting the deletion of their personal data from Relying
Parties through their Wallet Unit.

Note: A Relying Party may use the services of an intermediary to request data
from a Wallet Unit, see [Topic 52](#a2352-topic-52-relying-party-intermediaries).
However, such intermediaries are required to delete any data they obtain from a
Wallet Unit immediately after sending it to the Relying Party. Data deletion
requests are therefore always sent to the Relying Party, not the intermediary.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| DATA_DLT_01 | A Wallet Provider SHALL ensure that its Wallet Units support the possibilities mentioned in DATA_DLT_02, allowing a User to request from a Relying Party the erasure of their attributes that were presented by that Wallet Unit to that Relying Party, in accordance with Article 17 of Regulation (EU) 2016/679. |
| DATA_DLT_02 | A Wallet Unit SHALL support at least the following possibilities to send a data erasure request to a Relying Party: a) Open a URL in an external browser to ask for the deletion of data in a web form provided by the Relying Party, b) Open an external mail client and start a draft e-mail to the Relying Party, with a suitable template text, c) open an external phone client and start a phone call. Depending on whether a Relying Party URL, e-mail address, and/or phone number was logged for the relevant attestation presentation transaction (see requirement DASH_03 in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency)), the Wallet Unit SHALL offer the User to use one or more of these possibilities. |
| DATA_DLT_02a | If the User initiates sending a data erasure request for a particular attestation presentation transaction, but no Relying Party URL, e-mail address, or telephone number is available in the log for that transaction, the Wallet Unit SHALL connect to the URL of the online service of the Registrar indicated in the log to obtain this information. The Wallet Unit SHALL inform the User that it must connect to the Registrar to look up the contact information it needs to send a data deletion request. *Note: this situation may occur if there was no registration certificate in the presentation request and the User did not request the Wallet Unit to obtain the information registered about the Relying Party from the Registrar. See RPRC_04 - RPRC_06b in [Topic 44](#a2344-topic-44---relying-party-registration-certificates).* |
| DATA_DLT_03 | A Wallet Instance SHALL provide a function where the User may select one Relying Party to which a data deletion request must be submitted. |
| DATA_DLT_04 | Empty |
| DATA_DLT_05 | A Wallet Unit SHALL include the initiation of a data deletion request in a log, so it can be displayed to the User via the dashboard as specified in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). *Note: Because the request is sent by an external web browser, e-mail client, or phone client (see DATA_DLT_02), the Wallet Unit can only log the initiation of the request.*  |
| DATA_DLT_06 | For the initiation of a data deletion request, the log SHALL contain at least: - Date and time of the initiation of the request, - Name and unique identifier of the Relying Party to which the request was made, - Attributes requested to be deleted. |
| DATA_DLT_07 | Before executing a data deletion request, a Relying Party SHALL authenticate the requesting User (or the request itself), using appropriate authentication mechanisms of its own choosing. The Relying Party SHOULD use the authentication or signature facilities offered by the User's Wallet Unit for this purpose. |
| DATA_DLT_08 | Wallet Units, Relying Parties, and Registrars SHALL comply with the relevant requirements in [Technical Specification 7](../../technical-specifications/ts7-common-interface-for-data-deletion-request.md). |

#### A.2.3.49 Topic 49 - Protocol and interfaces for requesting data deletion to relying parties

Deleted.

#### A.2.3.50 Topic 50 - Blueprint to report unlawful or suspicious request of data

##### Description <!-- omit from toc -->

In this use case, a User reports a Relying Party to the competent national data
protection authority, because the User claims that this Relying Party sent an
unlawful or inappropriate request for attribute to the Wallet Unit. Users are
concerned about having control over their personal data, and specifically about
a Relying Party over-asking for personal information, thus the function of
reporting suspicious or inappropriate requests ensures a higher degree of
transparency, privacy and control of the Users over their personal data.

This topic lists high-level requirements related to the function of Users
reporting unlawful or inappropriate attribute requests from Relying Parties.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------------|
| RPT_DPA_01 | A Wallet Unit SHALL enable the User to start the process of reporting a suspicious presentation request to a DPA. When prompted by the User, a Wallet Unit SHALL provide the contact details of the DPA which supervises the Relying Party that made the suspicious request, if available in the log for that request (see DASH_03). If the contact details of the supervising DPA are not available in the log, the Wallet Unit SHALL provide the contact details of the DPA of the region in which the Wallet Provider is residing. In addition, the Wallet Unit MAY also provide the contact details of other DPAs, taken from the "European Data Protection Board" website (<https://www.edpb.europa.eu/about-edpb/about-edpb/members_en>). *Note: The DPA contact details may be unavailable in the log if there was no registration certificate in the presentation request and the User did not request the Wallet Unit to obtain the information registered about the Relying Party from the Registrar. See RPRC_04 - RPRC_06b in [Topic 44](#a2344-topic-44---relying-party-registration-certificates).* |
| RPT_DPA_02 | The Wallet Unit SHALL offer the User the option to report a suspicious request to a DPA via the transaction log presented in the dashboard, see [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). |
| RPT_DPA_02a | A Wallet Unit SHALL support at least the following possibilities to report a suspicious presentation request to a DPA, depending on what contact details are available for the DPA: a) Open a URL in an external browser to report the request in a web form provided by the DPA. b) Open an external e-mail client and start a draft e-mail to the DPA, with a suitable template text, c) open an external phone client and start a phone call. |
| RPT_DPA_03 | Empty |
| RPT_DPA_04 | A Wallet Provider SHALL ensure that a Wallet Unit allows its User to substantiate a report sent to a DPA, including by attaching relevant information to identify the Relying Party and the Users' claims in a machine-readable format. *Note: The log kept by the Wallet Unit will be standardized and is machine-readable in order to enable data portability. An excerpt from this log therefore can be used to substantiate the report.* |
| RPT_DPA_05 | A Wallet Unit SHALL keep reports sent to the DPA in a log so that it can be presented to the User in the dashboard (as specified in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency)). |
| RPT_DPA_06 | Wallet Units, Data Protection Authorities, and Registrars SHALL comply with the relevant requirements in [Technical Specification 8](../../technical-specifications/ts8-common-interface-for-reporting-of-wrp-to-dpa.md). |

#### A.2.3.51 Topic 51 - PID or attestation deletion

##### Description <!-- omit from toc -->

This topic lists high-level requirements related to a User deleting a PID or
attestation from their Wallet Unit.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------------|
| PAD_01 | A Wallet Unit SHALL at any time enable the User to delete any PID or attestation from their Wallet Unit. |
| PAD_02 | If the User indicates that a PID or attestation must be deleted, and the Wallet Unit contains multiple PIDs or attestation having the corresponding attestation type and Provider, a Wallet Unit SHALL delete all of these PIDs and attestations simultaneously. *Note: This situation may occur if the PID Provider or Attestation Provider issued a batch of attestations to the Wallet Unit, rather than a single one.* |
| PAD_03 | If the Wallet Unit deletes a PID or attestation on the User's request, the Wallet Unit SHALL NOT notify the respective PID Provider or Attestation Provider. *Note: This is a matter of User privacy.* |
| PAD_04 | If the Wallet Unit deletes a PID or attestation on the User's request, the Wallet Unit SHALL ensure that all cryptographic key material in the WSCA/WSCD related to this PID or attestation is securely destroyed. *Note: Key deletion is a cryptographic key operation and requires User authentication, as specified in requirement WIAM_14.* |
| PAD_05 | If a Wallet Unit supports the [W3C Digital Credentials API] and it deletes a PID or attestation on the User's request, the Wallet Instance SHALL disclose the fact that it no longer stores this PID or attestation to the Digital Credentials API framework. |
| PAD_06 | If the User uninstalls the Wallet Instance, the Wallet Instance SHALL request the associated WSCA(s) to delete all sensitive data and cryptographic keys related to the Wallet Unit and to all PIDs and attestations on the Wallet Unit, if the WSCA(s) are connected to the User device at the moment the Wallet Instance is uninstalled. *Note: It may happen there is no connection to the WSCA at the moment the User uninstalls the Wallet Instance; for instance, in case the WSCD is an external smart card and the User does not present that card to the User device. Another example occurs when the WSCD is a remote HSM and the User device is offline at the moment the User uninstalls the Wallet Instance. In such cases, the cryptographic keys will probably remain present on the WSCD, even though they will never be used again. If needed, it is up to the Wallet Provider to define how the Wallet Unit should handle such situations. For example, an HSM manager could address such cases by deciding to delete cryptographic keys in the HSM that are too old or haven't been used for too long, while being aware of the risks in doing so.* |

#### A.2.3.52 Topic 52 Relying Party intermediaries

##### Description <!-- omit from toc -->

This topic lists high-level requirements regarding so-called intermediaries,
which form a special class of Relying Party. Article 5b (10) of the [European
Digital Identity Regulation] states "Intermediaries acting on behalf of relying
parties shall be deemed to be relying parties and shall not store data about the
content of the transaction". Such an intermediary is a party that offers
services to Relying Parties to, on their behalf, connect to Wallet Units and
request the User attributes that these Relying Parties need. The intermediary
then performs all necessary verifications, and, if successful, sends the
presented attributes to the intermediated Relying Party. This implies that an
intermediary performs all tasks assigned to a Relying Party in this ARF on
behalf of the intermediated Relying Party.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------------|
| RPI_01 | An intermediary SHALL register as a Relying Party, in accordance with all requirements in [Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties), while indicating it intends to act as an intermediary. *Notes: - This implies that an intermediary obtains an access certificate containing its own name and unique Relying Party identifier. - An intermediary may also obtain a registration certificate according to [Topic 44](#a2344-topic-44---relying-party-registration-certificates), but this certificate will not be used for intermediated transactions. - An entity that registered as an intermediary may also register as a Relying Party in its own capacity. In such a case, it will receive one or more registration certificates for its intended use(s), and will use one of these certificates when interacting with a Wallet Unit.* |
| RPI_02 | Empty |
| RPI_03 | An intermediary SHALL register at the Registrar each intermediated Relying Party it is acting on behalf of, as well as each intended use separately related to a given intermediated Relying Party. If a Provider of registration certificates associated with the Registrar issues registration certificates, the intermediary SHALL receive one or more registration certificates for the intermediated Relying Party, according to the requirements in [Topic 44](#a2344-topic-44---relying-party-registration-certificates). The registration certificate SHALL contain the intermediated Relying Party's name and unique identifier, as well as the list of attributes registered for that Relying Party's intended use. |
| RPI_04 | When registering information for a Relying Party via an intermediary, the Registrar SHALL verify, in a manner to be decided by Registrar's Member State, that the Relying Party will indeed use the services of the intermediary to interact with Wallet Units. |
| RPI_05 | Empty |
| RPI_06 | When requested by an intermediated Relying Party, an intermediary SHALL request a presentation of attributes from a specific Wallet Unit, using the intermediary's access certificate meant in requirement RPI_01 and a registration certificate of the Relying Party, as meant in RPI_03, if available. If no registration certificate is available, the intermediary SHALL include the user-friendly name and unique identifier of the intermediated Relying Party in an extension of the presentation request, according to RPI_06a. |
| RPI_06a | The Commission SHALL ensure that extensions are specified for [ISO/IEC 18013-5] and for [OpenID4VP], allowing an intermediary to transfer the user-friendly name and unique identifier of an intermediated Relying Party to a Wallet Unit. These extensions SHALL comply with applicable requirements in these standards. |
| RPI_07 | In case a Wallet Unit receives a presentation request from an intermediary on behalf of an intermediated Relying Party, during the Relying Party authentication process it SHALL display the names and identifiers of both the intermediary and the intermediated Relying Party to the User when asking for User consent, as described in RPA_07. *Note: The Wallet Unit can see that a presentation request is from an intermediary either because this is indicated in the registration certificate or because the extension meant in RPI_06 and RPI_06a is present.* |
| RPI_07a | In case a Wallet Unit receives a presentation request from an intermediary on behalf of an intermediated Relying Party, and if the User indicated that they want to verify the information registered about this Relying Party (according to RPRC_06), and if a registration certificate is available, the Wallet Unit SHALL verify that the name and the unique identifier of the intermediary, as included in the registration certificate of the intermediated Relying Party, are identical to the name and unique identifier in the access certificate. If this verification fails, the Wallet Unit SHALL notify the User when asking for User consent. |
| RPI_07b | In case a Wallet Unit receives a presentation request from an intermediary on behalf of an intermediated Relying Party, and if the User indicated that they want to verify the information registered about this Relying Party (according to RPRC_06), and if no registration certificate is available, the Wallet Unit SHALL connect to the URL of the online service of the Registrar indicated in the access certificate to obtain this information, using the unique identifier of the intermediated Relying Party. The Wallet Unit SHALL verify that the name and the unique identifier of the intermediary for this intermediated Relying Party, as registered by the Registrar, are identical to the name and unique identifier included in the access certificate. If this verification fails, the Wallet Unit SHALL notify the User when asking for User consent. |
| RPI_08 | When a Wallet Unit presents to an intermediary any User attributes from a PID or attestation, the intermediary SHALL, after successfully carrying out the verifications in RPI_09, forward these attributes (only) to the Relying Party on behalf of which the presentation request was made. If any of the verifications in RPI_09 fail, the intermediary SHALL NOT forward any attributes to the Relying Party. |
| RPI_09 | When a Wallet Unit presents to an intermediary any attributes from a PID or attestation, the intermediary SHALL verify the authenticity of the PID or attestation, its revocation status, device binding, and User binding, as well as any combined presentation of attributes, if applicable, as specified in this ARF and if agreed with the Relying Party. Furthermore, the intermediary SHALL verify the authenticity of the Wallet Unit and its revocation status, as specified in this ARF, if agreed with the Relying Party. *Note: This ARF does not mandate that a Relying Party must carry out all of these verifications. Therefore, the intermediary and any Relying Party using its services must agree on what verifications the intermediary will carry out.* |
| RPI_10 | The intermediary SHALL delete any PIDs or attestations it obtained from the Wallet Unit, including any User attributes, completely and immediately after it has sent the User attributes to the intermediated Relying Party. If the intermediary does not send any User attributes to the intermediated Relying Party, for example because one of the verifications in the previous step failed, the intermediary SHALL delete the PIDs, attestations, or WUAs completely and immediately as soon as it has completed all necessary verifications. |

#### A.2.3.53 Topic 53 Zero-Knowledge Proofs

##### Description <!-- omit from toc -->

**NOTE: Discussions on Zero-Knowledge Proofs are ongoing. No specific ZKP has been selected to be supported by components in the EUDI Wallet ecosystem. For an up-to-date discussion, see [Technical Specification 4](../../technical-specifications/ts4-zkp.md).**

This topic lists high-level requirements for a Zero-Knowledge Proof scheme to be used within the EUDI Wallet ecosystem as a proof mechanism for PIDs and attestations. A Zero-Knowledge Proof (ZKP) is a cryptographic protocol that allows one party
(the prover) to convince another party (the verifier) that a given statement is
true without revealing any additional information beyond the validity of the
statement itself. This ensures that the verifier gains no knowledge about how
the prover knows the statement to be true, preserving privacy while enabling trust.

The topic of ZKPs for the EUDI Wallet ecosystem was introduced in the [Discussion Paper for Topic G](../../discussion-topics/g-zero-knowledge-proof.md). The high-level requirements in this Topic were taken from that discussion paper.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------------|
| ZKP_01 | A ZKP scheme SHALL provide support for the following generic functions, while hiding all attributes of PIDs or attestations: (i) generation of a proof that an (some) attribute(s) having a specific value is (are) included in a PID or attestation, (ii) generation of a proof that a PID or attestation is within its validity period, (iii) generation of a proof that a PID or attestation has not been revoked, and (iv) generation of a proof that a PID or attestation is bound to a key stored in the WSCA/WSCD of the Wallet Unit. Additionally, a ZKP scheme SHOULD provide support for the following function, which SHOULD  be used only when hiding the PID Provider or Attestation Provider is necessary: (v) generation of a proof that a PID or attestation has been issued by a trusted PID Provider or Attestation Provider, without revealing the PID Provider or Attestation Provider. *Notes: - See section 4.1.1 of the Discussion Paper for Topic G.* |
| ZKP_02 | A ZKP scheme SHALL support proving possession of attestation of a given type. *Note: See section 4.1.2 and 4.1.3 of the Discussion Paper for Topic G.* |
| ZKP_03 | A ZKP scheme SHOULD support the privacy-preserving binding of an attestation to a PID. In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme SHALL provide support for the following functions: (i) generation of a proof that the Wallet Unit stores an attestation and a PID and that the attestation includes a specific attribute, having a specific value, which is also present in the PID. *Note: See section 4.1.4 of the Discussion Paper for Topic G.* |
| ZKP_04 | A ZKP scheme SHOULD support the derivation of a verifiable User pseudonym, by combining an attribute value that is unique for the User with Relying Party-specific context (e.g., the Relying Party identifier) In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme SHALL provide support for the following functions: (i) generation of a request for the issuance of an attestation that includes a secret attribute unique to the User, without revealing this attribute to the Attestation Provider, (ii) generation of an attestation presentation that includes a verifiable pseudonym derived from the secret attribute, a Relying Party identifier, and context-related information. *Note: See section 4.1.5 of the Discussion Paper for Topic G.* |
| ZKP_05 | A ZKP scheme SHALL be usable in both remote and proximity presentation flows. While the inclusion of ZKP will introduce computational and verification delays, these delays SHALL NOT critically undermine or defeat the purpose of the Relying Party service (e.g. because of a critical impact on the User experience of the Wallet Unit). |
| ZKP_06 | A ZKP scheme SHOULD be able to generate proofs for already issued PIDs and attestations in the formats specified in [ISO/IEC 18013-5] or [SD-JWT VC]. |
| ZKP_07 | A ZKP scheme SHALL NOT introduce any additional communication or information that could be used to track or link User activity during, before, or after proof generation. |
| ZKP_08 | A ZKP scheme SHALL rely solely on algorithms standardised by a standardisation organisation recognised by the Commission or in a standard recognised by the Commission. |
| ZKP_09 | Use of a ZKP scheme SHALL NOT prevent the Wallet Unit's ability to provide User authentication with Level of Assurance High. |
