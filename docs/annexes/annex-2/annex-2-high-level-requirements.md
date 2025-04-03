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
[Section 6.6.3.8 of the ARF main document](../../architecture-and-reference-framework-main.md#6638-relying-party-instance-verifies-device-binding), are not included in the scope of this Annex.

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

The primary purpose of the EUDI Wallet ecosystem is to enable Users to access
online services and to enable Relying Parties offering such services to identify
and authenticate Users with a high level of assurance. This essential
functionality ensures that Relying Parties can confidently verify that they are
interacting with the correct User.

In this use case, a User is using their Wallet Unit to present attributes
related to their identity. The User accesses online services that require
authentication. The User is concerned about sharing Person Identification Data
(PID) during online interactions. Their objectives include identifying
themselves with services requiring User identification and maintaining control
over personal data sharing.

This Topic contains high-level requirements related to online
identification and authentication of a User using their Wallet Unit.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
| -- | -- |
| OIA_01 | A Wallet Unit SHALL support technical specifications to respond to person identification data (PID) and attestation presentation requests by Relying Parties. |
| OIA_02 | A Wallet Unit SHALL support proving cryptographic binding between a WSCA included in the Wallet Unit and a PID or attestation, in accordance with [SD-JWT VC] or [ISO/IEC 18013-5]. *Note: Such a mechanism is called device binding in [ISO/IEC 18013-5] and key binding in [SD-JWT VC].* |
| OIA_03 | The Commission SHALL adopt the technical specifications for the PID or attestation presentation request-response protocol and for the device binding mechanism, according to the protocols and interfaces specified in [OpenID4VP] for remote flows, and [ISO 18013-5] for proximity flows. |
| OIA_03a | Wallet Providers SHALL ensure that their Wallet Solution supports the protocol specified in 'OpenID for Verifiable Presentations', see [OpenID4VP], with additions and changes as documented in this Annex and in future technical specifications created by or on behalf of the Commission. |
| OIA_03b | For remote presentation flows, when the format of the requested attestation complies with [ISO/IEC 18013-5], Relying Parties and Wallet Units SHALL comply with the requirements in the profile for OpenID4VP specified [ISO/IEC 18013-7] Annex B. |
| OIA_03c | For remote presentation flows, when the format of the requested attestation complies with [SD-JWT VC], Relying Parties and Wallet Units SHALL comply with the requirements in the OpenID4VP profile for [SD-JWT VC] specified in [HAIP]. |
| OIA_04 | A Wallet Unit SHALL verify and process PID or attestation presentation requests from Relying Parties in accordance with the protocols and interfaces specified in [OpenID4VP] for remote flows. |
| OIA_05 | After verifying and processing a PID or attestation request, the Wallet Unit SHALL display to the User the identity of the requesting Relying Party and the requested attributes. |
| OIA_06 | A Wallet Unit SHALL present the requested attributes only after having received the User's authorisation. See also OIA_07. |
| OIA_07 | A Wallet Unit SHALL support selective disclosure of attributes from PIDs and attestations to be released to the requesting Relying Parties. |
| OIA_08 | Wallet Units and Relying Party Instances SHALL support the [W3C Digital Credentials API]](<https://wicg.github.io/digital-credentials/>) for remote presentation flows, provided that a) this API is fully standardised, b) this API complies with the expectations outlined in [Chapter 3](../../discussion-topics/f-digital-credential-api.md#3) of the Topic F discussion paper, and c) this API is broadly supported by relevant browsers and operating systems. |
| OIA_08a | If Wallet Units and Relying Party Instances do not support the [W3C Digital Credentials API], they SHALL implement adequate mitigations for the challenges described in [Section 4.4.3.1](../../architecture-and-reference-framework-main.md#4431-introduction) of the ARF main document. |
| OIA_08b | If a Wallet Unit supports the [W3C Digital Credentials API], it SHALL disclose the presence of all stored attestations and attributes to the Digital Credentials API framework, but it SHALL NOT disclose the value of the attributes in these attestations. *Note: The latter restriction applies even if such disclosure would enhance the services provided by the operating system to the Wallet Unit, for example, attestation selection in the context of the Digital Credentials API.* |
| OIA_08c | If a Relying Party supports the [W3C Digital Credentials API], the Relying Party's presentation request MAY be processed by the browser for searching available attestations, for preventing fraud targeting the user, or for troubleshooting purposes. Moreover, the request SHOULD be processed by the browser for User security purposes. However, the request SHALL NOT be processed by the browser for market analysis purposes (including as a secondary purpose) or for the browser’s own purposes. |
| OIA_09 | For remote presentation flows the Wallet Unit SHALL ensure that the attributes included in the presented attestation are accessible only to the Relying Party Instance, by encrypting the presentation response. The technical specification meant in OIA_03a SHALL specify mechanisms preventing decryption of the presentation response via Man-in-the-Middle attacks by the browser, the operating system, or other components between the Wallet Unit and the Relying Party. |
| OIA_10 | For both proximity and remote presentation flows, if a Wallet Unit contains two PIDs having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and a Relying Party requests a PID, the Wallet Unit SHALL ask the User which of these PIDs they want to release, unless the Wallet Unit can decide from context. |
| OIA_11 | For both proximity and remote presentation flows, if a Wallet Unit contains two attestations having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and the same attestation type, and a Relying Party requests an attestation of that type and encoding, the Wallet Unit SHALL ask the User which of these attestations they want to release, unless the Wallet Unit can decide from context. *Note: Attestation types are explained in [[Topic 12](#a2312-topic-12---attestation-rulebooks)].* |
| OIA_12 | For both proximity and remote presentation flows, a Relying Party SHALL validate the signature of a PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. |
| OIA_13 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature of a QEAA in accordance with Art.32 of the [European Digital Identity Regulation]. For the verification, the Relying Party SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. |
| OIA_14 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature of a PuB-EAA in accordance with [Art.32](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2594-73-1) of the [European Digital Identity Regulation]. For that verification, the Relying Party SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature. The Relying Party SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. The Relying Party SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| OIA_15 | For both proximity and remote presentation flows, a Relying Party SHALL validate the signature of a (non-qualified) EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. *Notes: - OIA_12 – OIA_15 imply that a Relying Party Instance must know if the attestation it is requesting from a Wallet Instance is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. These requirements also imply that the Relying Party Instance must store trust anchors in such a way that, at the time of verification, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs. - PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, when it receives an non-qualified attestation, a Relying Party Instance may have to verify that the non-qualified EAA Provider is authorised or registered to issue this type of attestation, in addition to verifying the signature over the attestation using the EAA Provider's trust anchor. Mechanisms allowing to do this should be defined in the applicable Rulebook, see ARB_26.* |
| OIA_16 | When receiving a PID, attestation, or WUA, a Relying Party Instance SHALL discard the values of all unique elements, including at least the ones mentioned in requirement ISSU_35 in [Topic 10/23](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit), as well as any timestamps, as soon as they are no longer needed. The Relying Party Instance SHALL NOT communicate these values to the Relying Party or to any other party inside or outside the EUDI Wallet ecosystem. |

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

The PID Rulebook contains the following main topics:

1. The PID attribute schema: This describes the structure, the type, the entity
identifiers, and the logical organisation of the mandatory and optional
attributes and metadata of the PID, as specified in Commission Implementing
Regulation (EU) 2024/2977. It also describes how Member States can specify any
possible national attributes. Two encodings for these attributes are specified,
one compliant with [ISO/IEC 18013-5], the other compliant with [SD-JWT VC].
2.The trust infrastructure necessary for PIDs, for both ISO/IEC
18013-5-compliant and SD-JWT VC-compliant encodings.

For more information, see Annex 3 - [PID Rulebook].

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| PID_01 | PIDs and PID Providers SHALL comply with all requirements in [PID Rulebook]. |

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
High-level requirements for User approval are also included in this Topic. The
Wallet Unit also communicates the outcome of the verification of the Relying
Party registration certificate, see
[Topic 44](#a2344-topic-44---relying-party-registration-certificates), and the outcome
of the evaluation of an embedded disclosure policy, if present, see
[Topic 43](#a2343-topic-43---embedded-disclosure-policies).

##### HLRs <!-- omit from toc -->

A. Relying Party authentication

| **Index** | **Requirement specification** |
|-----------|--------------|
| RPA_01 | The Wallet Unit used by a User, as well as the Relying Party Instance used by the Relying Party, SHALL implement a mechanism for Relying Party authentication. This mechanism SHALL: - enable the Wallet Unit to identify and authenticate the Relying Party, - enable the Wallet Unit to verify that the request from the Relying Party was not copied and replayed, - use Relying Party Instance access certificates issued in accordance with [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. |
| RPA_01a | If a Wallet Unit supports the [W3C Digital Credentials API] for remote presentation flows, it SHALL retain full authority over the process meant in RPA_01. In particular, this process SHALL NOT be handled by a third party, including the browser and the operating system. |
| RPA_02 | The Commission SHALL ensure that technical specifications for the Relying Party authentication mechanism mentioned in RPA_01 are created both for Wallet Units complying with [ISO/IEC 18013-5] and for Wallet Units complying with [OpenID4VP]. These specifications SHALL comply with applicable requirements in these standards. |
| RPA_02a | The technical specifications mentioned in RPA_02 SHALL ensure that a Relying Party Instance includes its access certificates in the presentation request by value, not by reference. *Note: This ensures that no external requests are necessary to carry out Relying Party authentication, and that transactions are atomic and self-contained.* |
| RPA_03 | A Wallet Unit and a Relying Party Instance SHALL perform Relying Party authentication in all use cases, whether proximity or remote, using a Relying Party Instance access certificate. *Note: The actions both entities perform differ. For example, while the Relying Party creates a signature over some data in the request, the Wallet Unit validates that signature.* |
| RPA_04 | For the verification of Relying Party Instance access certificates, a Wallet Unit SHALL accept the trust anchors in the Trusted List(s) of Relying Party Access Certificate Authorities of all Member States. *Note: For more information about Relying Party Access Certificate Authorities, please see [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].* |
| RPA_05 | If Relying Party authentication fails for any reason, the Wallet Instance SHALL inform the User that the identity of the Relying Party could not be verified and that therefore the request is not trustworthy. |
| RPA_06 | If Relying Party authentication succeeds, the Wallet Instance SHALL display to the User the name of the Relying Party as included in the Relying Party registration certificate (see [Topic 44](#a2344-topic-44---relying-party-registration-certificates)), together with the attributes requested by the Relying Party. The Wallet Instance SHALL do so when asking the User for approval according to RPA_07. |
| RPA_06a | If the registration certificate indicates that the Relying Party is using the services of an intermediary, as described in [Topic 52](#a2352-topic-52-relying-party-intermediaries), the Wallet Unit SHALL verify that the name and the unique identifier of the intermediary included in the registration certificate are identical to the name and unique identifier included in the Relying Party Instance access certificate. If this verification fails, the Wallet Unit SHALL treat this as a Relying Party authentication failure. If this verification succeeds, the Wallet Instance SHALL display to the User the name of the intermediary. |
| RPA_06b | If Relying Party authentication fails for any reason, the Wallet Unit SHALL either not present the requested attributes to the Relying Party, or give the User the choice to present the requested attributes or not. *Note: It is up to the Wallet Provider to make a choice for one of the two options above.* |

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
(possible) revocation of PIDs, QEAAs, PuB-EAAs, non-qualified EAAs and WUAs by
their providers. It also contains HLRs relating to the (possible) checking of
the revocations status of a PID or attestation by a Relying Party.

Note: This Topic does not pertain to access certificates for Relying Parties,
PID Providers or Attestation Providers as discussed in
[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].
Neither does it apply to any intermediate certificates establishing trust
between these certificates and the respective trust anchors. These access
certificates are part of a Public Key Infrastructure, and rules for revoking
these certificates will be established within the respective PKI.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| VCR_01 | A PID Provider, QEAA Provider, PuB-EAA Provider, or Wallet Provider SHALL use one of the following methods for revocation of a PID, QEAA, PuB-EAA, or WUA: - Only issue short-lived attestations having a validity period of 24 hours or less, such that revocation will never be necessary, - Use an Attestation Status List mechanism specified per VCR_11, or - Use an Attestation Revocation List mechanism specified per VCR_11. *Note: The 24-hour period originates from ETSI EN 319 411-1 V1.4.1, requirement REV-6.2.4-03A. This requires that the process of revocation must take at most 24 hours. Consequently, revocation may make no sense if the attestation is valid for less than 24 hours, because it may reach the end of its validity period before it is revoked.* |
| VCR_02 | For non-qualified EAAs, the relevant Rulebook SHALL specify whether that type of EAA must be revocable. If a non-qualified EAA type must be revocable, the relevant Rulebook SHALL determine which of the methods mentioned in VCR_01 must be implemented by the relevant EAA Providers for the revocation of such an EAA. |
| VCR_03 | If a PID or attestation is revocable, the PID Provider of a given PID, or the Attestation Provider of a given attestation, SHALL be the only party in the EUDI Wallet ecosystem responsible for executing the revocation of that PID or attestation. Similarly, if a WUA is revocable, the Wallet Provider of a given WUA SHALL be the only party in the EUDI Wallet ecosystem responsible for executing the revocation of that WUA. *Note: A PID Provider, Attestation Provider or Wallet Provider MAY outsource the operation of the revocation process to a third party.* |
| VCR_04 | A PID Provider, Attestation Provider or Wallet Provider that revoked a PID or attestation SHALL NOT reverse the revocation. |
| VCR_05 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHALL have a policy specifying under which conditions a PID, attestation, or WUA it issued will be revoked. |
| VCR_06 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHALL revoke a PID, attestation, or WUA when its security has been compromised. |
| VCR_07 | If a WUA is revocable, the Wallet Provider SHALL revoke that WUA upon the explicit request of the User to revoke their Wallet Unit. |
| VCR_07a | If a PID or attestation is revocable, the PID Provider or Attestation Provider SHOULD revoke that PID or attestation upon the explicit request of the subject of the PID or the attestation. |
| VCR_07b | If a PID or attestation is revocable, the PID Provider or Attestation Provider SHOULD revoke that PID if the Wallet Unit on which it resides is revoked, in compliance with requirement WU_Revocation 18 in [Topic 38](#a2338-topic-38---wallet-unit-revocation). |
| VCR_08 | If a PID is revocable, the PID Provider SHALL revoke a PID upon the death of the natural person who is the subject of the PID, or the cease of activity of the legal person who is the subject of the PID. |
| VCR_09 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider or Wallet Provider SHALL revoke a PID, attestation, or WUA if the value of one or more attributes in the PID, attestation, or WUA was changed and it is still valid for at least 24 hours. Subsequently, if the User's contact details are known, the PID Provider SHOULD, via an out-of-band manner, notify the User about the revocation and ask the User to request re-issuance of the PID, attestation, or WUA using their Wallet Unit. *Note: If the value of the attributes is determined by a party different from the Provider, such as an Authentic Source, the Provider is responsible for ensuring that this third party notifies them about such changes.* |
| VCR_10 | Wallet Providers SHALL implement the attestation revocation mechanisms specified per VCR_11 in their Wallet Solutions. |
| VCR_11 | The Commission SHALL create or reference technical specifications providing all necessary details for PID Providers, Attestation Providers, and Wallet Providers to implement an Attestation Status List mechanism or an Attestation Revocation List mechanism for the PIDs, attestations, and WUAs they issue. These technical specifications SHALL also contain all details necessary for Relying Party Instances, Relying Parties and Wallet Units interacting with other Wallet Units to use these mechanisms to verify the revocation status of PIDs, attestations, and WUAs. *Note: 'Attestation Status List' and 'Attestation Revocation List' are specific mechanisms, defined in Annex 1. Attestation Revocation Lists are sometimes referred to as 'Identifier Lists'.* |
| VCR_12 | If a Relying Party decides it needs to verify the revocation status of a PID, attestation or WUA, it SHALL support both the Attestation Status List mechanism and the Attestation Revocation List mechanism specified per VCR_11. *Note: Per VCR_13, it is recommended but not mandatory for a Relying Party to verify whether a PID, attestation or WUA is revoked.* |
| VCR_13 | A Relying Party Instance SHOULD verify the revocation status of a PID, attestation, or WUA upon obtaining it from a Wallet Unit, following the steps specified per VCR_11. |
| VCR_14 | When no reliable information regarding the revocation status of a PID, attestation or WUA is available, a Relying Party SHOULD perform a risk analysis considering all relevant factors for the use case, before taking a decision to accept or refuse the PID, attestation or WUA. |
| VCR_15 | A Relying Party Instance SHOULD NOT request the relevant Attestation Status List or Attestation Revocation List each time an attestation is presented to it by a Wallet Unit. Rather, the Relying Party operating the Relying Party Instance SHOULD download each new version of the list once, at a time and from a location unrelated to the presentation of a PID or attestation by a User. The Relying Party SHOULD then distribute the list to all of its Relying Party Instances, using an Relying Party-internal distribution mechanism. |
| VCR_16 | A PID Provider, Attestation Provider or Wallet Provider SHALL NOT require the Relying Party or Relying Party Instance to authenticate itself before downloading an Attestation Status List or Attestation Revocation List. |
| VCR_17 | When using an Attestation Status List for revocation, the Attestation List Provider SHALL randomly assign the index for each PID or attestation, to prevent this index from becoming a correlator. *Note: Randomly assigning indices within a bitstring or byte array is more complicated than creating random identifiers (e.g. serial numbers) for attestations, as is needed for an Attestation Revocation List. This is because duplicate indices and unnecessarily long bitstrings or byte arrays must be prevented.* |
| VCR_18 | When using an Attestation Status List for revocation, the Attestation List Provider SHALL represent a sufficiently large number of PIDs, attestations, or WUAs on each Attestation Status List to ensure herd privacy. *Note: In this context, herd privacy means that if a Relying Party requests a particular status list, the Attestation List Provider is not able to deduce which PID or attestation (likely) was presented to that Relying Party. *Note: Complying with this requirement may be difficult in case the number of PIDs, attestations, or WUAs to be represented on the list is small. In such a case, decoy entries can be added to the list to obfuscate the real number of referenced PIDs, attestations, or WUAs.* |
| VCR_19 | A Wallet Unit SHOULD regularly check the revocation status of its PIDs, attestations, and WUAs, and notify the User if a PID or attestation, or a WUA (i.e, the Wallet Unit itself), is revoked. |

#### A.2.3.8 Topic 8 - Design Solutions on Data Sharing scenarios

There are no HLRs for this Topic.

#### A.2.3.9 Topic 9 - Wallet Unit Attestation

Note to this Topic: The Commission received many comments on
the ideas described in this Topic, particularly relating to revocation and
the differing needs of Relying Parties on one side and
PID Providers and Attestation Providers on the other.
Further details on these subjects will be provided in a technical specification
and the high level requirements in Topic 9 intentionally do not go into these technical details. To support the varying needs of the actors, the technical specification may specify two types of WUA, containing
different information, and having different validity periods and different formats.

##### Description <!-- omit from toc -->

When a User's Wallet Unit interacts with other actors
in the EUDI Wallet ecosystem, e.g., PID Providers, Attestation Providers
or Relying Parties, that actor may want to verify if the Wallet Unit is trustworthy,
i.e., the Wallet Unit is authentic and has not been revoked.
*This scenario will be referred to as Use Case 1*

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
*This scenario will be referred to as Use Case 2*

This Topic introduces an information object that contains the necessary
information to achieve the two use cases. This object is called the Wallet Unit
Attestation (WUA). The WUA also contains a public key. By including this public
key in the WUA, the Wallet Provider attests that the corresponding private key is
protected by a certified WSCA/WSCD that has the properties and security posture
described in the WUA.
Note that the information about the Wallet Unit and the WSCA(s) should only be
released in relation to Use Case 2, meaning that to accommodate both use cases, the Wallet Unit must be able to release a WUA either with or without this information.

The PID Provider or Attestation Provider then asks the Wallet Unit to create a key
pair for its new PID or attestation, and to prove that both this new private key and the
private key corresponding to public key in the WUA is in possession by the Wallet Unit.

A topic related to the WUA is the following. It would be useful if the Wallet Unit would be able provide a proof that the PID or attestation private key is protected by the same WSCA as the WUA private
key. Because if that is the case, the PID Provider or Attestation Provider can be sure that the
security level of the new PID or attestation key is the same as the security
level of the WUA key. Moreover, such a proof could also be useful if case of a combined presentation of attributes as discussed in [Topic 18](#a2318-topic-18---combined-presentations-of-attributes), to give assurance to the Relying Party that all of these attestations originate from the same WSCA/WSCD and thus are related to the same User.

However, at the moment of writing this version of the ARF, no commonly agreed technical specification of such a proof is available. Moreover, even if such a specification were available, it is
not fully clear how many WSCAs/WSCDs available to Wallet Units will support the cryptographic functionalities
necessary to generate such a proof. Therefore, creating such a proof is recommended (SHOULD), not required (SHALL). In this way, once a Wallet Unit includes a WSCD/WSCA that supports the required cryptographic functionalities, such a proof can be used as described in this Topic.

Notes:

- The Commission will ensure a technical specification for such a proof is created in the future.
- In earlier versions of the ARF, this proof was called a 'proof of association'. However, this is also the name commonly used for one of the proposals for implementing such a proof. To avoid confusion, this version of the ARF does not use this term.

Please note that the scope of this Topic is limited to the question
of how the WUA is issued during Wallet Unit activation and how it is
used during attestation issuance. The role played by the WUA during the
release of an attestation to a Relying Party is discussed in [[Topic 18](#a2318-topic-18---combined-presentations-of-attributes)]
(Combined presentation of attributes).

##### HLRs <!-- omit from toc -->

###### A.  Support for WUA Use Cases <!-- omit from toc -->

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WUA_01  | The WUA SHALL provide a PID Provider or Attestation Provider with information about the capabilities of the WSCA and WSCD of the Wallet Unit, such that they are able to take a well-grounded decision on whether to issue an attestation or PID to the Wallet Unit. |
| WUA_02  | The WUA SHALL enable Relying Parties, PID Providers, and Attestation Providers to verify the authenticity and revocation status of the Wallet Unit. |
| WUA_03  | Wallet Providers SHALL ensure that a non-revoked Wallet Unit at all times can present a WUA, when requested by a Relying Party, PID Provider, or Attestation Provider. |
| WUA_04  | During PID or attestation issuance, a Wallet Unit SHALL provide the PID Provider or Attestation Provider with information on all WSCAs it is able to use for private key management, so that the PID Provider or Attestation can make a choice about the WSCA it wants to use for its new PID or attestation. Notes: - This information is not in the form of a WUA. As specified in WUA_05, the Wallet Unit must provide only the WUA for the WSCA that is actually used, not for all WSCAs it can potentially use. - See also WUA_15.  |
| WUA_05  | During PID or attestation issuance, a Wallet Unit SHALL provide the PID Provider or Attestation Provider with the WUA describing the properties of the WSCA that generated the new PID or attestation private key and protects it. |
| WUA_06  | If a Wallet Unit contains multiple WSCAs, it SHALL, internally and securely, keep track of which PIDs and attestations are bound to each of these WSCAs. |
| WUA_07  | A Wallet Unit SHALL present a WUA only as part of either the issuance of a PID or attestation, or in conjunction with the presentation of a PID or another attestation to a Relying Party. *Note: the WUA presented during issuance has different information content and may have a different format than the WUA presented in conjunction with a PID or attestation.*  |
| WUA_08  | The WUA SHALL enable PID Providers to request a Wallet Provider to revoke a Wallet Unit, in accordance with requirement WURevocation_11. |

###### B.  WUA in relation Cryptographic Keys <!-- omit from toc -->

| **Index** | **Requirement specification**  |
|-----------|----------------------|
| WUA_09 | A WUA SHALL contain a public key, and the corresponding private key SHALL be generated by the WSCA described in the WUA presented by the Wallet Unit, if the WUA contains information about a WSCA. |
| WUA_10 | The WSCA SHOULD be able to prove that two or more private keys, paired with two or more public keys, are stored in it. *Note: these public keys may be included in WUAs, PIDs, attestations, or pseudonyms.* *Note: The proof may be transitive, so a proof that two keys are stored/managed in the same WSCA may be done by proving keys relate to each other via a third key (also stored in the WSCA)* |
| WUA_11 | During PID or attestation issuance, the PID Provider or Attestation Provider SHALL verify that the WSCA described in the WUA received from the Wallet Unit has proven possession of the private key corresponding to the public key in the WUA. The PID Provider or Attestation Provider SHALL also verify that the WSCA has proven possession of the new PID or attestation private key. Finally, the PID Provider or Attestation Provider SHOULD verify that the new PID or attestation private key corresponding to the public key being attested to, is stored in the same WSCA as described in the WUA private key. *Notes: - See also WUA_10. - These three proofs MAY be implemented as a single cryptographic proof.* |
| WUA_12 |  The Wallet Unit SHALL be able to prove that it possesses the private key corresponding to the public key in the WUA. |
| WUA_13 | A Relying Party requesting the creation of a pseudonym according to [WebAuthn] SHOULD verify that the private key belonging to the public key it receives as a pseudonym, is stored in the same WSCA as the WUA private key. |
| WUA_14 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to verify that the WUA private key and the PID or attestation private key are stored in the same WSCA. |
| WUA_15 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to indicate in the Token Response the WSCA to which the new PID or attestation key must be bound. |
| WUA_16 | If a WSCA is able to export a private key, the Wallet Provider SHALL specify this capability as an attribute in the WUA. |

###### C.  Requirements regarding privacy <!-- omit from toc -->

| **Index** | **Requirement specification**  |
|-----------|------|
| WUA_17   | A Wallet Provider SHALL consider all relevant factors, including offline usage, interoperability, and the risk of a WUA becoming a vector to track the User, when deciding on the validity period of a WUA. A Wallet Provider MAY use short-lived WUAs to mitigate such risks. *Note: The requirements for the validity period of WUAs presented to Relying Parties in the technical specification (see WUA_19) may be different from the validity period of WUAs presented to PID Providers and Attestation Providers.* |
| WUA_18   | A Wallet Unit SHALL release data related to the User device in a WUA only to a PID Provider or Attestation Provider, and not to a Relying Party or any other party. *Note: Use case 2 (data related to the User device), must not be supported for Relying Parties.* |

###### C.  Miscellaneous requirements <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------------|
| WUA_19  | The Commission SHALL create or reference technical specification for the WUA, compliant with the HLRs in this topic. |
| WUA_20  | The Wallet Provider SHALL ensure that Wallet Units conform to all requirements specified in the technical specification mentioned in WUA_19. |
| WUA_21  | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a WUA to a PID Provider or Attestation Provider.  |

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
| ISSU_01 | Wallet Providers SHALL ensure that their Wallet Solution supports the OpenID4VCI protocol specified in [OpenID4VCI], as profiled by the OpenID4VP profile for [OpenID4VCI] specified in [HAIP], and with additions and changes as documented in this Annex (see e.g. this Topic and [[Topic 9](#a239-topic-9---wallet-unit-attestation)]) and in future technical specifications created by or on behalf of the Commission. |
| ISSU_01a | PID Providers and Attestation Providers SHALL support the OpenID4VCI protocol specified in [OpenID4VCI], as profiled by the OpenID4VP profile for [OpenID4VCI] specified in [HAIP], and with additions and changes as documented in this Annex (see e.g. this Topic and [[Topic 9](#a239-topic-9---wallet-unit-attestation)]) and in future technical specifications created by or on behalf of the Commission. |
| ISSU_02 | Wallet Providers SHALL ensure that their Wallet Solution supports the attestation formats specified in ISO/IEC 18013-5, see [ISO18013-5], and in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC], with additions and changes as documented in this Annex and in future technical specifications created by or on behalf of the Commission. |
| ISSU_03 | Wallet Units, PID Providers, and Attestation Providers SHALL support the [W3C Digital Credentials API]](<https://wicg.github.io/digital-credentials/>) for issuance of PIDs and attestations, provided that a) this API is fully standardised, b) this API complies with the expectations outlined in [Chapter 3](../../discussion-topics/f-digital-credential-api.md#3) of the Topic F discussion paper, and c) this API is broadly supported by relevant browsers and operating systems. |
| ISSU_04 | The OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable PID Providers and Attestation Provider to issue to a Wallet Unit a batch of multiple PIDs or attestations that are simultaneously valid and contain the same attributes. |
| ISSU_05 | A Wallet Unit SHALL support a process to activate a newly issued PID, in accordance with [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) Section 2.2.2. The Wallet Unit SHALL NOT allow a User to use a non-activated PID. *Notes: - The goal of the activation process is to verify that the PID was delivered into the Wallet Unit and WSCA of the User who is the subject of the PID. - This requirement is not applicable for QEAAs, PuB-EAAs or non-qualified EAAs, since these are not identity means in the sense of Commission Implementing Regulation (EU) 2015/1502.* |
| ISSU_06 | After a Wallet Unit receives a PID or an attestation from a PID Provider or Attestation Provider, it SHALL verify that the PID or attestation it received matches the PID or attestation requested by the Wallet Unit. |
| ISSU_07 | After a Wallet Unit receives a PID from a PID Provider, it SHALL validate the signature of the PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. *Note: This signature validation may not be useful in architectures where the Wallet Provider is also the PID Provider and the validation of the PID signature would be done by the same component (namely, a remote HSM) that created the signature. However, in such a situation, additional measures SHALL be taken to ensure that any errors in the PID issuance process will be detected.* |
| ISSU_08 | After a Wallet Unit receives a QEAA from a QEAA Provider, it SHALL validate the qualified signature of the QEAA in accordance with Art.32 of the [European Digital Identity Regulation]. For the verification, the Wallet Unit SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. |
| ISSU_09 | After a Wallet Unit receives a PuB-EAA from a PUB-EAA Provider, it SHALL validate the qualified signature of the PuB-EAA in accordance with Art.32 of the [European Digital Identity Regulation]. For that verification, the Wallet Unit SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature. The Wallet Unit SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation]. Finally, the Wallet Unit SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| ISSU_10 | After a Wallet Unit receives a non-qualified EAA from an EAA Provider, it SHALL validate the signature of the EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. *Notes: - Requirements ISSU_07 to ISSU_10 are equivalent to requirements OIA_12 to OIA_15 in []. These requirements imply that a Wallet Instance must be aware whether the attestation it is requesting from an issuer is a PID, a QEAA, a PuB-EAA, or a non-qualified EA[Topic 1](#a231-topic-1---accessing-online-services-with-a-wallet-unit)A. These requirements also imply that the Wallet Unit must store trust anchors in such a way that, when it receives an issued attestation, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs. - PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, before requesting an non-qualified attestation, a Wallet Unit may need to verify that the non-qualified EAA Provider is authorised or registered to issue this type of attestation. Mechanisms allowing to do this may be defined in the applicable Rulebook, see ARB_26.* |
| ISSU_11 | A Wallet Unit SHALL request the User's approval before storing a PID or attestation obtained from a PID Provider or Attestation Provider. When requesting approval, the Wallet Instance SHALL display the contents of the PID or attestation to the User. The Wallet Instance SHALL also inform the User about the identity of the PID Provider or Attestation Provider, using the subject information in the PID Provider's or Attestation Provider's access certificate. |
| ISSU_11b | In case one or more of the verifications in ISSU_06 – ISSU_11 fail, the Wallet Unit SHALL immediately delete the PID or attestation it received. The Wallet Instance SHALL notify the User about the fact that issuance of the PID or attestation was not successful, including the reason for this failure. |
| ISSU_12 | A PID Provider or Attestation Provider SHALL offer its PIDs or attestations in all formats required in the PID Rulebook or the applicable Attestation Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. *Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT VC-format specified in [SD-JWT VC].* |
| ISSU_12a | A Wallet Provider SHALL ensure that, when a User instructs their Wallet Unit to request a PID or attestation from a PID Provider or Attestation Provider, the Wallet Unit requests that PID or attestation in all formats offered by the PID Provider or Attestation Provider. *Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT VC-format specified in [SD-JWT VC].* |
| ISSU_12b  | During PID or attestation issuance, a WSCA SHALL generate a new key pair for a new PID or attestation, on request of the PID Provider or Attestation Provider via the Wallet Instance. |
| ISSU_12c  | The expiration date of the issued PID or Attestation SHALL be no later than the expiration date of the WUA presented as part of the issuance process. |

###### B - HLRs for PID issuance <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_13 | A Wallet Provider SHALL ensure that at least one PID Provider is willing to issue a PID complying with [PID Rulebook] to Users of the Wallet Units it provides. |
| ISSU_14 | A PID Provider SHALL ensure that all PIDs it issues to Wallet Units comply with the requirements specified in [PID Rulebook]. |
| ISSU_15 | A PID Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing PIDs. |
| ISSU_16 | Empty |
| ISSU_17 | A PID Provider SHALL implement device binding for all PIDs it issues, meaning it SHALL ensure that a PID is cryptographically bound to a WSCA included in the Wallet Unit, as specified in requirement WUA_11 in [[Topic 09](#a239-topic-9---wallet-unit-attestation)]. *Note: Device binding is called 'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT-VC].* |
| ISSU_18 | A PID Provider SHALL verify the identity of the subject of the PID in compliance with Level of Assurance (LoA) High requirements. *Notes: - These requirements will be determined by the relevant eID scheme. - In most cases, the subject of the PID is the same person as the User. However, it has not yet been ruled out that a Wallet Unit may contain multiple PIDs, for example in the case of a parent having their children's PIDs in their Wallet Unit. Another example is a natural person representing a legal person, who may hold a legal-person PID in their Wallet Unit next to their own natural-person PID. These topics will be further discussed with Member States.* |
| ISSU_18a | A PID Provider SHALL ensure that the attributes attested in the PID issued are valid for the identified PID subject at any point of time of PID validity. |
| ISSU_19 | For the verification of a WUA, a PID Provider SHALL accept the trust anchors in the Wallet Provider Trusted List it needs. *Notes: - The Wallet Provider Trusted List is explained in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. - It is not mandatory for a PID Provider to accept all Wallet Provider Trusted Lists, if there are multiple. This is because it is not mandatory for a PID Provider to accept all certified Wallet Solutions in the EUDI Wallet ecosystem. Each PID Provider will choose which Trusted Lists they need to subscribe to.* |
| ISSU_19a | A PID Provider SHALL support at least one Wallet Solution, meaning that it is willing and able to issue a PID to a Wallet Unit on request of the User. |
| ISSU_20 | To inform its potential PID subjects about the Wallet Solution(s) they can use for requesting a PID, a PID Provider SHALL publish a list of supported Wallet Solutions in such a way that it can be easily found, for example on the PID Provider's website. |
| ISSU_21 | Before issuing a PID, a PID Provider SHALL verify that the Wallet Provider mentioned in the Wallet Unit's WUA is present in a Wallet Provider Trusted List. The PID Provider SHALL also authenticate and validate the WUA using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List. Moreover, it SHALL verify that the Wallet Units's WUA is not revoked. *Notes: - For the WUA, see [[Topic 9](#a239-topic-9---wallet-unit-attestation)] and [[Topic 38](#a2338-topic-38---wallet-unit-revocation)]. - [CIR 2024/2977](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32024R2977), Article 3 (9), also allows "another authentication mechanism in accordance with an electronic identity scheme notified at assurance level high." However, the ARF does not further specify such other authentication mechanisms, which means that in general they will not be interoperable.* |
| ISSU_22 | A PID Provider SHALL include its PID Provider access certificate in its Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01. |
| ISSU_22a | A PID Provider SHALL sign its metadata (as defined in OpenID4VCI) using the private key corresponding to its PID Provider access certificate. |
| ISSU_22b | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to include its access certificate in its Issuer metadata, according to requirement ISSU_22. |
| ISSU_23 | For the verification of PID Provider access certificates, a Wallet Unit SHALL accept the trust anchors in the Trusted List(s) of PID Provider Access Certificate Authorities it needs. *Notes: - PID Provider Access Certificate Authority Trusted Lists are explained in [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. -It is not mandatory for a Wallet Unit to accept all PID Provider Access Certificate Authority Trusted Lists, if there are multiple. Wallet Providers will choose which Trusted Lists they need to subscribe to, for example depending on the Member State(s) they are operating in.* |
| ISSU_23a | A Wallet Provider SHALL support at least one PID Provider, meaning that its Wallet Units SHALL be capable of requesting the issuance of a PID from these PID Provider(s), and that the Wallet Provider has agreed with the PID Provider(s) that the PID Provider(s) will process such a request according to the agreed rules and procedures. |
| ISSU_23b | Prior to or during installation of a Wallet Instance, the Wallet Provider SHALL notify the User about the PID Provider(s) that are supported by the Wallet Unit. |
| ISSU_24 | A Wallet Unit SHALL authenticate and validate the PID Provider access certificate before requesting the issuance of a PID. The Wallet Unit SHALL verify at least that the access certificate indicates that its subject is a PID Provider, that the access certificate is authentic and is valid at the time of validation, and that the issuer of the access certificate is a CA that is in a PID Provider Access Certificate Authority Trusted List. *Note: The PID Provider Access Certificate Authority Trusted List is not the same as the PID Provider Trusted List mentioned in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].* |

###### C - HLRs for Attestation Issuance <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_25 | An Attestation Provider SHALL ensure all attestations issued to Wallet Units comply with the requirements specified in the applicable Rulebook, as described in [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. |
| ISSU_26 | An Attestation Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing attestations. |
| ISSU_27 | An Attestation Provider SHALL implement device binding for all attestations it issues, meaning it SHALL ensure that an attestation is cryptographically bound to a WSCA included in the Wallet Unit, as specified in requirement WUA_11 in [[Topic 9](#a239-topic-9---wallet-unit-attestation)]. *Note: device binding is called mdoc authentication in [ISO/IEC 18013-5] and key binding in [SD-JWT-VC].* |
| ISSU_27a | If applicable, an Attestation Provider SHALL verify the identity of the subject of the attestation in compliance with applicable requirements, in accordance with relevant standards or Implementing Regulations. *Note: Not every attestation has a subject. For example, a holiday voucher may be valid for any User that can present it to a Relying Party. This is comparable to the concept of a 'bearer token'.* |
| ISSU_27b | If applicable, an Attestation Provider SHALL ensure that the attributes attested in the attestation issued are valid for the identified attestation subject. |
| ISSU_28 | For the verification of a WUA, an Attestation Provider SHALL accept the trust anchors in the Wallet Provider Trusted List. *Note: The Wallet Provider Trusted List is explained in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].* |
| ISSU_29 | An Attestation Provider SHALL support all Wallet Solutions, meaning that they SHALL NOT discriminate between Wallet Solutions when processing a request for the issuance of an attestation. |
| ISSU_30 | Before issuing an attestation, an Attestation Provider SHALL: - verify that the Wallet Provider mentioned in the Wallet Unit's WUA is present in the Wallet Provider Trusted List. - authenticate and validate the WUA using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List. - verify that the Wallet Unit's WUA is not revoked. *Note: For the WUA, see [[Topic 9](#a239-topic-9---wallet-unit-attestation)] and [[Topic 38](#a2338-topic-38---wallet-unit-revocation)].* |
| ISSU_31 | Empty |
| ISSU_32 | An Attestation Provider SHALL include its Attestation Provider access certificate in its Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01. |
| ISSU_32a | An Attestation Provider SHALL sign its metadata (as defined in OpenID4VCI) using the private key corresponding to its Attestation Provider access certificate. |
| ISSU_33 | For the verification of Attestation Provider access certificates, a Wallet Unit SHALL accept the trust anchors in all Attestation Provider Access Certificate Authority Trusted List(s). *Note: Attestation Provider Access Certificate Authority Trusted Lists are explained in [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. There may be separate Access Certificate Authority Trusted Lists for QEAA Providers, PuB-EAA Providers, and EAA Providers.* |
| ISSU_33a | A Wallet Provider SHALL support all Attestation Providers, meaning that its Wallet Units SHALL be capable of requesting the issuance of a QEAA, PuB-EAA, or non-qualified EAA from these Providers at the User's request. |
| ISSU_34 | A Wallet Unit SHALL authenticate and validate the Attestation Provider access certificate before requesting the issuance of an attestation. The Wallet Unit SHALL verify at least that the access certificate indicates that its subject is a QEAA Provider, PuB-EAA Provider, or EAA Provider, that the access certificate is authentic and is valid at the time of validation, and that the issuer of the access certificate is a CA that is in the Attestation Provider Access Certificate Authority Trusted List, as documented in [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. *Note: PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, before requesting an EAA from a non-qualified EAA Provider, a Wallet Unit may need to verify that that EAA Provider is authorised or registered to issue the type of EAA the Wallet Unit is requesting. Such verification requirements, as well as the mechanisms allowing to do this, may be defined in the applicable Rulebook.* |

###### D - HLRs for Privacy Risks and Mitigation <!-- omit from toc -->

These HLRs were added as a result of the discussions of Topic A,
Privacy risks and mitigation. For more background information on these
requirements, please refer to
[Section 7.4.3.5 of the ARF main document](../../architecture-and-reference-framework-main.md#7435-risks-and-mitigation-measures-related-to-user-privacy) and to the [Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md).

Note: These requirements mention the WUA and the Wallet Provider. This is
because it is assumed that the format of the WUA complies with either [ISO/IEC
18013-5] or [SD-JWT VC], like for PIDs and attestations. However, this
assumption will be further discussed with Member States. If it turns out to be
wrong, then these requirements will be adapted accordingly.*

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_35 | A PID Provider, Attestation Provider, or Wallet Provider SHALL ensure that all unique elements in a PID, attestation or WUA, including at least a) the salt used for hashing every attribute, b) the hash values of all attributes, c) the attestation identifier or index used for revocation purposes (if applicable), d) the attestation public key used for device binding and User binding, and e) the value of the Attestation Provider signature, have values that are unique across all PIDs, attestations, or WUAs issued by that Provider. *Note: This can be achieved, for example, by ensuring that salt values and attestation identifiers are pseudo-random numbers generated by a cryptographically secure pseudo-random number generator (CSPRNG).* |
| ISSU_35a | After issuing a PID, attestation, or WUA, a PID Provider, Attestation Provider or Wallet Provider SHALL discard the values of all unique elements, including at least the ones mentioned in requirement ISSU_35 above, as well as any timestamps, as soon as they are no longer needed. The Provider SHALL NOT communicate these values to any other party inside or outside the EUDI Wallet ecosystem. |
| ISSU_36 | When issuing PIDs, attestations, or WUAs in a batch to a Wallet Unit, a PID Provider, Attestation Provider, or Wallet Provider SHALL ensure that the timestamps in these PIDs, attestations, or WUAs do not enable Relying Parties to conclude that they are part of the same batch (and therefore belong to the same User). *Note: This can be done, for example, by ensuring that a sufficiently high number of batches, each issued to a different Wallet Unit, share the same timestamp values (herd privacy).* |
| ISSU_37 | A Wallet Provider SHALL ensure that its Wallet Solution supports the following methods for limiting the number of times a User can present the same attestation to Relying Parties: Method A (Once-only attestations, as specified in requirement ISSU_43 - ISSU_47) and Method B (Limited-time attestations, as specified in requirement ISSU_48 - ISSU_50). In addition, a Wallet Provider MAY ensure that its Wallet Solution supports Method C (Rotating-batch attestations, as specified in requirement ISSU_51 - ISSU_54) or Method D (Per-Relying Party attestations, as specified in requirement ISSU_55 - ISSU_57). *Note: Wallet Solutions, PID Providers, Attestation Providers, and Wallet Providers are free to define and use other methods as well. However, such other methods are out of scope of the ARF.* |
| ISSU_38 | A PID Provider, Attestation Provider or Wallet Provider SHALL have a policy describing which of the methods A, B, C, or D it will use to limit the number of times a Wallet Unit may present a single PID, attestation, or WUA to relying Parties. For each supported method, the policy SHALL also specify how the values for respective parameters for that method, such as validity period and batch size, will be chosen. The goal of the policy SHALL be to ensure that the risk of Relying Party linkability is mitigated to an acceptable level, given the (expected) usage of the PID, attestation, or WUA by the User. To determine what an acceptable level of risk is, the PID Provider, Attestation Provider, or Wallet Provider SHALL carry out a risk analysis regarding Relying Party linkability. *Note: If a PID Provider, Attestation Provider, or Wallet Provider issues multiple attestation types, these requirements apply for each type of attestation separately.* |
| ISSU_39 | The Commission SHALL create or reference a profile or extension of the OpenID4VCI specification enabling a PID Provider, Attestation Provider, or Wallet Provider to indicate in their OpenID4VCI Issuer metadata which of the methods A, B, C, or D the Wallet Unit must use for the PID, attestation, or WUA issued. Indicated methods SHALL be ordered by preference. This profile or extension SHALL also enable the PID Provider, Attestation Provider, or Wallet Provider to set the value of parameters to be used by the Wallet Unit for each method (if applicable). *Note: For example, the parameters to be set for method A include the lower limit for unused attestations and the batch size to be requested.* |
| ISSU_40 | PID Providers, Attestation Providers and Wallet Providers SHALL indicate in their OpenID4VCI Issuer metadata at least that either method A or method B must be used for a given type of PID, attestation, or WUA. PID Providers, Attestation Providers, and Wallet Providers MAY additionally indicate that it prefers using method C and/or method D over method A or method B. In such a case, a Wallet Unit supporting method C and/or method D SHALL use that method, while a Wallet Unit not supporting these methods SHALL use method A or method B, as applicable. *Example: An Attestation Provider indicates methods {D, C, A} in their metadata, in that order. A Wallet Unit that supports methods C and D (as well as A and B) then uses method D for this type of attestation. A Wallet Unit supporting methods A, B and C uses method C. A Wallet Unit supporting only methods A and B uses method A.* |
| ISSU_41 | To the maximum extent possible, Wallet Providers, PID Providers, and Attestation Providers SHALL ensure that Users do not notice which of the methods A, B, C, or D is used for their PIDs, attestations, or WUAs.|
| ISSU_42 | To the maximum extent possible, Wallet Providers, PID Providers, and Attestation Providers SHALL ensure that no User action is needed for the re-issuance of PIDs or attestations. *Note: For the topic of re-issuance, see also the [Discussion Paper for Topic B](../../discussion-topics/b-re-issuance-and-batch-issuance-of-pids-and-attestations.md).* |

###### Method A: Once-only attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method A for a given type of PID, attestation, or WUA. For more
information on this method, please refer to
[Section 3.2 of the Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md#32-method-a-once-only-attestations).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_43 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to issue PIDs, attestations, or WUAs in batches to the Wallet Unit. All PIDs, attestations, or WUAs in a batch SHALL have the same attribute values and the same validity period. |
| ISSU_44 | The Wallet Unit SHALL present each PID or, attestation, or WUA only once to a Relying Party, except when it has fallen back to Method B as specified below, or to another available method. |
| ISSU_45 | The Wallet Unit SHALL have a lower limit for the number of unused PIDs, attestations, or WUAs it holds, and SHALL request the issuance of a new batch when this limit is reached. During the first issuance of a new PID, attestation, or WUA, see requirement ISSU_39, the PID Provider, Attestation Provider or Wallet Provider SHALL inform the Wallet Unit about the value of the lower limit and the size of the batch to be requested. |
| ISSU_46 | If the Wallet Unit must request a new batch of PIDs, attestations, or WUAs, but is not able to do so because it is offline, the Wallet Unit SHALL warn the User that they are about to lose the possibility to present this PID or attestation to a Relying Party (or any PID or attestation, in case of the WUA) and request them to connect their device to the internet. |
| ISSU_47 | If the Wallet Unit has run out of unused PIDs, attestations, or WUAs, but is not able to request a new batch because it is offline, it SHALL fall back to method B (see requirement 6), or another available method. This means that, when requested by a Relying Party, the Wallet Unit SHALL again present one of the already used PIDs, attestations or WUAs. The Wallet Unit SHALL return to using method A as soon as it is able to go online and request a new batch of PIDs, attestations or WUAs. |

###### Method B: Limited-time attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method B for a given type of PID, attestation, or WUA.
[Section 3.2 of the Discussion Paper for Topic A](../../discussion-topics/a-privacy-risks-and-mitigations.md#32).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_48 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to issue a single PID, attestation, or WUA to the Wallet Unit.|
| ISSU_49 | The Wallet Unit SHALL present that PID, attestation or WUA multiple times to the same Relying Party, or to different Relying Parties, when requested to do so. |
| ISSU_50 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to re-issue a PID, attestation, or WUA some time before the one existing in the Wallet Unit expires. The PID Provider, Attestation Provider, or Wallet Provider SHALL inform the Wallet Unit about the moment at which the Wallet Unit must request the re-issuance of a PID, attestation, or WUA, relative to the expiration date of the existing one. *Note: It is the responsibility of Relying Parties to validate whether a presented PID, attestation, or WUA is temporally valid. A Wallet Unit is allowed to present a PID, attestation, or WUA even if its expiration date is in the past.* |

###### Method C: Rotating-batch attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method C for a given type of PID, attestation, or WUA.

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_51 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to issue PIDs, attestations, or WUAs in batches to the Wallet Unit. All PIDs, attestations, or WUAs in a batch SHALL have the same attribute values and the same validity period. |
| ISSU_52 | When a presentation of attributes is requested by multiple Relying Parties, the Wallet Unit SHALL present each PID, attestation, or WUA in a batch once, in a random order.|
| ISSU_53 | When all PIDs, attestations, or WUAs in a batch have been presented once, the Wallet Unit SHALL reset the batch, and start presenting each PID, attestation, or WUA in the batch again in a random order. |
| ISSU_54 | The Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet Provider to re-issue a batch of PIDs, attestations, or WUAs, some time before the batch in the Wallet Unit expires. The PID Provider, Attestation Provider, or Wallet Provider SHALL inform the Wallet Unit about the size of the batch and about the moment at which the Wallet Unit must request the re-issuance of a batch, relative to the expiration date of the existing one. |

###### Method D: Per-Relying Party attestations <!-- omit from toc -->

The requirements in this subsection specify the Wallet Unit's behaviour when it
is using Method D for a given type of PID, attestation, or WUA.

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_55 | The Wallet Unit SHALL present a different PID, attestation, or WUA to each different Relying Party upon their request. This means that it SHALL comply with Method A for such Relying Parties. |
| ISSU_56 | In case a given Relying Party requests attributes from a given type of PID, attestation, or WUA multiple times, the Wallet Unit MAY present the same PID, attestation or WUA to this Relying Party each time. If it does, it SHALL comply with Method B or Method C for such a Relying Party. |
| ISSU_57 | The Wallet Unit SHALL keep track of which PID, attestation, or WUA it has presented to which Relying Party, using the unique Relying Party identifier from the Relying Party access certificate. |

###### E - HLRs for re-issuance and batch issuance of PIDs, attestations and WUAs <!-- omit from toc -->

These HLRs were added as a result of the discussions of Topic B,
re-issuance and batch issuance of PIDs and attestations. For more background
information on these requirements, please refer to [Sections 6.6.2.7](../../architecture-and-reference-framework-main.md#6627-batch-issuance)
and
[6.6.5.2](../../architecture-and-reference-framework-main.md#6652-pid-or-attestation-re-issuance) of the ARF main document, and to the [Discussion Paper for Topic B](../../discussion-topics/b-re-issuance-and-batch-issuance-of-pids-and-attestations.md).

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_58 | A Wallet Unit SHALL give its User the option to manually initiate a re-issuance process for any of the PIDs or attestations in their Wallet Unit. |
| ISSU_59 | After a successful re-issuance, a Wallet Unit SHALL compare the attribute values of the re-issued PID or attestation with those of the existing PID or attestation, and SHALL notify the User in case of any differences. |
| ISSU_60 | A Wallet Unit SHALL gracefully handle situations in which re-issuance of a PID or attestation is refused by the PID Provider or Attestation Provider, for example by attempting a retry after an appropriate delay. |
| ISSU_61 | A Wallet Unit SHALL support PID or attestation first-time batch issuance with a single User authentication, regardless of the size of the batch. *Note: See also requirement WIAM_14.* |
| ISSU_61 | After a successful re-issuance of a PID or attestation, a Wallet Unit SHALL delete the correct pre-existing PID or attestation, meaning the one that the re-issued PID or attestation intends to replace. |
| ISSU_62 | PID Providers, Attestation Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the re-issuance of all PIDs and attestations. |
| ISSU_63 | PID Providers, Attestation Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the batch issuance of all PIDs and attestations. |
| ISSU_64 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to verify that a re-issued PID or attestation is bound to the same WSCD to which the existing PID or attestation is bound. *Note: This can be done, for instance, by requiring that OAuth 2.0 Demonstrating Proof of Possession (DPoP) [RFC 9449] is used for each Refresh Token, and that the public key in the DPoP proof is identical to the public key in the existing PID or attestation issued to the Wallet Unit previously.* |

#### A.2.3.11 Topic 11 - Pseudonyms

##### Description <!-- omit from toc -->

Wallet Units will support generating pseudonyms for Users in compliance with the
W3C WebAuthn API specification, [W3C WebAuthn](https://www.w3.org/TR/2021/REC-webauthn-2-20210408/). On a high level, this means that
the WSCD in the Wallet Unit will be able to create key pairs. The public keys of
these pairs function as pseudonyms for the User. Only the User can use these
pseudonyms, since the WSCD authenticates the User before allowing a pseudonym to
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

Note: As specified in requirement PA_21, the Commission will create or reference a technical specification containing a profile or extension of the [W3C WebAuthn] specification. The HLRs below are in fact requirements to be fulfilled by this technical specification.

##### HLRs <!-- omit from toc -->

###### A. Requirements related to Use Cases <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_01 | A Wallet Unit SHALL enable a User to generate a Pseudonym and register it at a Relying Party.|
| PA_02 | A Wallet Unit SHALL enable a User to authenticate with a Pseudonym towards a Relying Party if the Wallet Unit was used previously to register the Pseudonym for the same Relying Party. |
| PA_03 | A Wallet Unit SHALL be able to perform the actions specified in the above two requirements independently of whether the interaction with the Relying Party is initiated on the same device hosting the Wallet Instance or on a device different from the one hosting the Wallet Instance. |
| PA_04 | A Wallet Unit SHALL enable the User to use multiple different Pseudonyms at a given Relying Party. |
| PA_05 | A Wallet Unit SHOULD enable a User to freely choose a User alias for each Pseudonym registered at a Relying Party. Setting an alias SHOULD be optional for the User. The User SHOULD be able to change the alias for any Pseudonym. |
| PA_06 | A Wallet Unit SHALL enable a User to choose which Pseudonym to authenticate with towards a Relying Party, if multiple Pseudonyms are registered for this Relying Party. The Wallet Unit SHOULD present the User with the aliases of the applicable Pseudonyms, if assigned, when making this choice. |
| PA_07 | A Wallet Unit SHOULD enable a User to delete a Pseudonym. |
| PA_08 | A Wallet Unit SHOULD enable to the User to manage pseudonyms within the Wallet Unit in a user-friendly and transparent manner. Users SHOULD be informed about when and with which Relying Party their pseudonyms were used and be able to view a complete transaction log (including canceled or unsuccessful transactions). |
| PA_09 | A Wallet Unit SHOULD enable the User to see all existing pseudonyms, including the associated Relying Party. |

###### B. Requirements related to Relying Parties <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_10 | A Relying Party SHALL be able to verify that a User is registering a Pseudonym using a non-revoked Wallet Unit. |
| PA_11 | A Relying Party SHALL be able to verify that a User is authenticating with a Pseudonym using a non-revoked Wallet Unit. |
| PA_12 | If Wallet Unit is used to register a Pseudonym at a Relying Party in combination with a PID, attestation or WUA being presented to the same Relying Party, then this Relying Party SHALL be able to verify that the same User performed both actions. |
| PA_13 | The Relying Party SHALL be able to validate that the pseudonym presented to them belongs to the User presenting it. |

###### C. Requirements related to privacy <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_14 | A Wallet Unit SHALL store the information necessary for authenticating with a Pseudonym in its WSCA/WSCD. |
| PA_15 | A Relying Party SHALL NOT be able to derive the User’s true identity, or any data identifying the User, from the Pseudonym value received by the Relying Party. |
| PA_16 | A Wallet Unit SHALL NOT reveal the same Pseudonym to different Relying Parties unless the User explicitly chooses otherwise. |
| PA_17 | It SHALL NOT be possible to correlate Pseudonyms based on their values nor on other metadata sent by the Wallet Unit during registration and authentication, meaning that colluding Relying Parties SHALL NOT able to conclude that different Pseudonyms belong to the same User. |
| PA_18 | The Wallet Unit SHALL ensure that Pseudonyms contain sufficient entropy to make the chance of colliding Pseudonyms (meaning two Users having the same Pseudonym value for the same Relying Party) negligible. |
| PA_19 | A Wallet Unit MUST NOT share the user's optionally assigned Pseudonym aliases with any Relying Party. |
| PA_20 | The Wallet Unit SHOULD be able to verify the identity of a Relying Party when a User registers a Pseudonym or authenticates with a Pseudonym. |

###### D. Requirements related to interoperability <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|---------------------------------------|
| PA_21 | The Commission SHALL create or reference a technical specification containing a profile or extension of the [W3C WebAuthn] specification compliant with the HLRs specified in this Topic. |
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
| ARB_01a | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify that one or more of the following three common format(s) must be used for these attestations: - The format specified in ISO/IEC 18013-5, see [ISO18013-5]. - The format specified in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC]. - The format specified in “W3C Verifiable Credentials Data Model”, see [W3C VCDM v1.1] or [W3C VCDM v2.0].|
| ARB_02 | The Schema Provider for an Attestation Rulebook SHALL analyse whether it must be possible for a User to present that type of attestation when the Wallet Unit and the Relying Party are in proximity and attestations are presented without using the internet. If so, the Attestation Rulebook SHALL specify that the attestations must be issued in the ISO/IEC 18013-5-compliant mdoc format. *Note: In theory, it is possible to use SD-JWT VC-compliant attestations in proximity use cases. In practice, however, the only protocol available to request and release SD-JWT VC-compliant attestations between a Wallet Unit and a Relying Party Instance is OpenID4VP. That protocol cannot be used without internet connectivity.* |
| ARB_03 | The Schema Provider for an Attestation Rulebook MAY specify in the Attestation Rulebook that that type of attestation must be issued in the [SD-JWT VC]-compliant format, provided the [SD-JWT VC] specification has been approved by an EU standardisation body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the [European Digital Identity Regulation].|
| ARB_04 | If an Attestation Rulebook specifies that a type of attestation can be issued in a format compliant with [W3C VCDM v1.1] or [W3C VCDM v2.0], the Schema Provider for that Attestation Rulebook SHALL ensure the Rulebook references one or more documents specifying in detail how a Relying Party can request attributes from a such an attestation, and how a User can selectively disclose attributes from such an attestation. Moreover, these referenced documents SHALL be approved by an EU standardisation body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the [European Digital Identity Regulation]. |

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
| ARB_26 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is an non-qualified EAA SHOULD define in the Rulebook: - mechanisms allowing a Wallet Unit to verify that the EAA Provider is authorised or registered to issue this type of EAA. - mechanisms allowing a Relying Party to obtain, in a trustworthy manner, the trust anchor(s) of the EAA Providers issuing this type of EAA. |
| ARB_27 | The Schema Provider for an Attestation Rulebook describing a type of attestation that is a QEAA, PuB-EAA, or non-qualified EAA SHOULD specify in the Rulebook whether a Relying Party receiving the attestation must request and verify a PID. *Note: Relying Parties can only do so in a trustworthy manner if Wallet Units are able to provide a proof that the private keys of the attestation and the PID are stored in the same WSCD, in accordance with the requirements in Topic 18.* |

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
| QES_13 | Wallet Providers SHALL ensure that a Wallet Unit provides a log of transactions related to qualified electronic signatures generated by or through the Wallet Unit, allowing the User to view the history of previously signed data or documents, according to the requirements in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). *Note: If the signature is generated by a remote Signature Creation Application, the Wallet is at minimum used to authenticate the User to the remote QTSP and to obtain the User's consent for the usage of the private signing key. The logs then record information about these processes.* |
| QES_14 | Wallet Providers SHALL ensure that the User will be able to explicitly authorise the creation of a qualified electronic signature or seal through their Wallet Unit. |
| QES_15 | Wallet Providers SHALL ensure that a Wallet Unit can verify, in remote signature creation scenarios, that the a qualified electronic signature or seal creation device as is part of a qualified service, which is carried out by a qualified trust service provider.  |
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
| QES_23 | QTSPs providing the remote QES part of a Wallet Solution SHALL support: 1. ETSI TS 119 431-1 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev, 2. ETSI TS 119 431-2 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 2: TSP service components supporting AdES digital signature creation, 3. ETSI TS 119 432 - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation. Wallet Providers and QTSPs providing the remote QES part of a Wallet Solution SHALL comply with Sole Control Assurance Level (SCAL) 2 as defined in CEN EN 419 241-1 (Trustworthy Systems Supporting Server Signing - Part 1: General System Security Requirements). |
| QES_24 | QTSPs providing the Signature Creation Application as part of the remote QES part of a Wallet Solution SHALL support ETSI TS 119 101 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for applications for signature creation and signature validation. |

###### C. Requirements for Relying Parties <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------|
| QES_24a | Relying Parties providing the Signature Creation Application in a Relying Party-centric flow SHALL support ETSI TS 119 101 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for applications for signature creation and signature validation. |

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

This Topic discusses the combined presentation of attributes by a Wallet
Instance to a Relying Party. 'Combined presentation' here refers to a
transaction in which the Relying Party requests attributes of the same User from
multiple attestations (PID and/or (Q)EAAs) in a single request and receives
those attributes in a single response. These attestations can have been provided
to the Wallet Unit by one or by multiple PID Providers or Attestation Providers.

This Topic answers the following questions:

- How can a Relying Party request for a combined presentation of attributes?
- How can a Wallet Unit receiving such a request present the attributes in a
combined manner?
- How can the Relying Party verify the authenticity of all released attributes
in a combined response?
- How can the Relying Party verify whether all released attributes were issued
to the same User?

Regarding the last question:

- The subject may be either a natural person or a legal person.
- However, use cases such as delegation or legal representation, where
 the Relying Party may request attributes that are originally part of
 multiple distinct attestations that were not issued to the same User,
 are not combined presentations and are out of scope of this Topic.

##### HLRs <!-- omit from toc -->

###### A. Functional requirements for ecosystem components <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| ACP_01 | Wallet Units SHALL support the features in [ISO18013-5] and/or [OpenID4VP] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_02 | Relying Parties SHOULD support the features in [ISO18013-5] and/or [OpenID4VP] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_03 | Empty |
| ACP_04 | If a Wallet Unit determines it must release multiple attestations to a Relying Party in a combined presentation of attributes, it SHOULD request a proof from the WSCA that the WSCA manages all of the private keys of these attestations. |
| ACP_05 | If, as a result of ACP_04, the Wallet Unit receives such a proof from the WSCA, it SHALL include this proof in the response message containing the combined presentation of attributes and send it to the Relying Party. |
| ACP_06 | If a Relying Party receives a combined presentation of attributes including a proof as meant in ACP_04, it SHOULD verify this proof to validate that the attestations in this presentation were issued to the same User. |

###### B. Process requirements <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|----------------|
| ACP_07 | During issuance of an attestation, an Attestation Provider SHOULD be able to request that the private key for the new attestation is managed by the same WSCD as the private key of a PID or another attestation already existing on the Wallet Unit, provided that the Attestation Provider has verified during the issuance process that the new attestation indeed belongs to the User of that existing PID or attestation. *Note: Also see requirement WUA_10 in [Epic 09].* |
| ACP_08 | When receiving a combined presentation of attributes, a Relying Party SHOULD NOT refuse the attestations solely because a proof as meant in ACP_04 is absent. |

###### C. Miscellaneous <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| ACP_09 | The common [ISO18013-5] and [OpenID4VP] protocols, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a proof as meant in ACP_04 to a Relying Party. The Commission SHALL take measures to ensure that this is the case. |

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
| DASH_01 | A Wallet Provider SHALL enable a User to access a dashboard functionality in their Wallet Unit. |
| DASH_02 | The Wallet Unit SHALL log all transactions executed through the Wallet Unit, including any transactions that were not completed successfully. This log SHALL include all types of transaction executed through the Wallet Unit: issuance and re-issuance transactions, presentation transactions, signature creation transactions (see [Topic 16](#a2316-topic-16---signing-documents-with-a-wallet-unit)), attribute deletion requests sent to a Relying Party (see [Topic 48](#a2348-topic-48---blueprint-for-requesting-data-deletion-to-relying-parties)), and complaints lodged with a Data Protection Authority (see [Topic 50](#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data)). *Note: For the data to be logged for an attribute deletion request or a complaint, see Topic 48 and Topic 50, respectively.* |
| DASH_02a | The Wallet Unit SHALL retain transactions in the log at least for the time period specified in applicable legislation. If the Wallet Unit must delete transactions from the log, for instance because of size limitations, the Wallet Unit SHALL notify the User via the dashboard before doing so and SHALL instruct the User how to export the transactions that are about to be deleted; see DASH_07. |
| DASH_02b | The dashboard SHALL include a functionality to display to the User an overview of all transactions in the log. |
| DASH_03 | For a presentation transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: a) the date and time of the transaction, b) the name, contact details, and unique identifier of the corresponding Relying Party, and the Member State in which that Relying Party is established, or relevant information from the WUA of the Requestor Wallet Unit (see [Topic 30](#a2330-topic-30---interaction-between-wallet-units)), c) the name, contact details, and unique identifier of the intermediary, if an intermediary is involved in the transaction, d) the attestation type(s) and the identifier(s) of the attribute(s) that were requested, as well as those that were presented, e) in the case of non-completed transactions, the reason for such non-completion. |
| DASH_04 | For a signature creation transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: a) the date and time of the transaction, b) the document or data signed (where possible), c) in the case of non-completed transactions, the reason for such non-completion. |
| DASH_05 | For an issuance or re-issuance transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: a) the date and time of the transaction, b) the name, contact details, and unique identifier of the corresponding PID Provider or Attestation Provider, c) the attestation type requested, as well as the attestation type issued, d) the number of attestations requested and/or issued (i.e., the size of the batch in case of batch issuance). d) in the case of non-completed transactions, the reason for such non-completion. e) for a re-issuance transaction, whether it was triggered by the User or by the Wallet Unit without involvement of the User. |
| DASH_06 | The Wallet Provider SHALL ensure the confidentiality, integrity, and authenticity of all transactions included in the log. |
| DASH_06a | Via the dashboard, the Wallet Unit SHALL enable the User to delete any transaction in the log. The Wallet Unit SHALL ensure that no other entity can delete transactions from the log, except possibly for the reason mentioned in DASH_02a. |
| DASH_07 | The dashboard SHALL allow the User to export the details of one or more transactions in the log to a file, while ensuring their confidentiality, authenticity and integrity. |
| DASH_08 | For a natural-person User, a Wallet Instance SHALL provide a User interface. |
| DASH_09 | The User interface referred to in DASH_08 SHALL display an EU Digital Identity Wallet Trust Mark complying with technical specifications. *Note: The Commission will develop technical specifications for this Trust Mark.* |
| DASH_10 | The Wallet Unit SHALL make the logs accessible to the Wallet Provider if this is necessary for the provisioning of the Wallet Unit, and only after obtaining explicit consent from the User via the dashboard. |
| DASH_11 | A Wallet Unit issued to a legal person SHALL allow the legal person to interact with the Wallet Unit in the appropriate interface provided by the Wallet Provider. |
| DASH_12 | The User interface referred to in DASH_08 SHALL enable the User, for each presentation transaction in the dashboard, to easily request the Relying Party to delete any or all attributes presented to it in that transaction, or to lodge a complaint about that particular transaction to a DPA. |

#### A.2.3.20 Topic 20 - Strong User authentication for electronic payments

##### Description <!-- omit from toc -->

This topic deals with the requirement for Strong User (Customer) Authentication
(SCA) in the context of authenticating a User as part of electronic payments.  

Users would like to be able to authenticate themselves during online
payments securely and conveniently using their Wallet Units, so that
they can enjoy a seamless and protected shopping/ payment experience.  

The goal is to implement Strong Customer Authentication (SCA) for electronic
payments, ensuring a high level of security and compliance with
[Article 97 of the PSD2](https://eur-lex.europa.eu/eli/dir/2015/2366/oj#d1e5540-35-1)
(and with the future PSD3/PSR).

[Commission Delegated Regulation (EU) 2018/389](https://eur-lex.europa.eu/eli/reg_del/2018/389/oj)
lays down the requirements for strong customer authentication (SCA), which needs
to be complied with when accessing a payment account online and for initiating
electronic payments, or carrying out any action through a remote channel which
may imply a risk of payment fraud or other abuses. The use of the wallet for SCA
will be in full compliance with those requirements.  

In the future, a Wallet Unit could also be used for payments with Central Bank
Digital Currencies.  

##### HLRs <!-- omit from toc -->

There are no HLRs for this Topic.

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
| ProxId_01 | To enable identification using proximity flows, Wallet Units SHALL support device retrieval as specified in ISO/IEC 18013-5 for presenting PID, attestation, or WUA attributes. Wallet Units SHALL comply with the requirements for mDLs in clause 6 and for mdocs in clauses 8 and 9 of ISO/IEC 18013-5. *Note: Nominally, ISO/IEC 18013-5 is intended only for mDLs and mDL readers. The corresponding standard for mobile documents in general (including Wallet Units with the EUDI Wallet ecosystem) will be ISO/IEC 23220-4, which is based on ISO/IEC 18013-5. However, the latter standard is not finished yet and therefore cannot be referenced at the moment. To guarantee interoperability between Wallet Units and Relying Party Instances in proximity scenarios, it is necessary to make choices from among the possibilities specified in ISO/IEC 18013-5. Making the same choices as for mDLs ensure this.* |
| ProxId_01a | If a Relying Party supports using proximity flows, its Relying Party Instances SHALL support device retrieval as specified in ISO/IEC 18013-5 for presenting PID, attestation, or WUA attributes. Such Relying Party Instances SHALL comply with the requirements for mDL readers in clause 6 and for mdoc readers in clauses 8 and 9. *Note: See note to ProxId_01. Support for proximity flows by Relying Parties is not mandatory.* |
| ProxId_02 | Wallet Solutions, PID Providers, Attestation Providers, Wallet Providers, and Relying Parties SHALL NOT support server retrieval as specified in ISO/IEC 18013-5 for requesting and presenting PID, attestation, or WUA attributes. *Note: Using server retrieval, a Relying Party would request User attributes directly from a PID Provider or Attestation Provider, after having received an authentication and/or authorisation token from the User's Wallet Unit.* |
| ProxId_03 | A Wallet Unit SHALL present the presentation request and the identity of the Relying Party to the User when processing the request. |
| ProxId_04 | A Wallet Unit SHALL request its User to approve the presentation of attributes from their Wallet Unit for proximity identification before presenting them to the Relying Party. |
| ProxId_05 | A Wallet Unit SHALL transmit the requested User attributes to the requesting Relying Party Instance securely in accordance with ISO/IEC 18013-5 for proximity flows. |
| ProxId_06 | Empty |

#### A.2.3.25 Topic 25 - Unified definition and controlled vocabularies for attributes

##### Description <!-- omit from toc -->

[Topic 12](#a2312-topic-12---attestation-rulebooks) that describes the
high-level requirements (HLR) for the minimal requirements Rulebooks that will
specify the details of new types of attestations, including QEAAs, PuB-EAAs, and
non-qualified EAAs, has already touched and defined high-level requirements
regarding the attestation rulebook catalogue.

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
| CAT_03b | The Commission SHALL consider the following semantic artifacts for inclusion in the catalogue of attributes: - [Representation Powers and Mandates (RPaM) Ontology](https://joinup.ec.europa.eu/collection/isa-action-201612-semantic-interoperability-representation-powers-and-mandates-0/solution/representation-powers-and-mandates-ontology#:~:text=The%20ultimate%20objective%20of%20the,structured%20and%20machine%2Dreadable%20format) - [SEMPER \| DE4A](https://www.de4a.eu/semper) - [SEMIC Core Vocabularies](https://interoperable-europe.ec.europa.eu/collection/semic-support-centre/core-vocabularies#What%20are%20the%20Core%20Vocabularies) - [IANA Registry for JSON Web Token Claims](https://www.iana.org/assignments/jwt/jwt.xhtml) (for JSON-based attributes only) - [ISO/IEC 23220-2](https://www.iso.org/standard/86782.html) (for CBOR-based attributes only) |
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

#### A.2.3.27 Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and (non-qualified) EAAs, and Relying Parties

##### Description <!-- omit from toc -->

PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers
and Relying Parties SHALL register with a Registrar in their Member State. The
main goal of the registration process is for the entity to receive an access
certificate that Wallet Units can use to authenticate them.

This Topic specifies high-level requirements related to the registration of the
above mentioned entities.

##### HLRs <!-- omit from toc -->

A. *General requirements for Member State registration processes*

| **Index** | **Requirement specification** |
|-----------|----------------|
| Reg_01 | Member States SHALL provide processes and mechanisms for PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers, and Relying Parties to register in a registry. *Note: Member States may choose to implement a single registry for all these roles, or a separate registry for each of these roles.* |
| Reg_02 | Member States SHALL make publicly available all necessary details and documentation about the registration processes for their registry. |
| Reg_03 | Member States SHALL publish the registry entries online, in a sealed or signed machine-readable common format suitable for automated processing, according to the [European Digital Identity Regulation] Article 5b 5, for the purpose of transparency to Users and other stakeholders. |
| Reg_04 | Member States SHALL make the registry available online, in a common human-readable format. |
| Reg_05 | The Commission SHALL establish a technical specification for the common formats mentioned in Reg_03 and Reg_04. |
| Reg_06 | The Commission SHALL provide specifications for a common API for retrieving registry entries from the Member States registries per Reg_03, defining the minimum requirements for interoperability. *Note: Requirements for this API are defined in Reg_08 and Reg_09.* |
| Reg_07 | The Commission SHALL provide specifications for a common user interface for accessing the Member State registries per Reg_04. *Note: Requirements for this user interface are defined in Reg_08 and Reg_09.* |
| Reg_08 | The API mentioned in Reg_06 and the user interface mentioned in Reg_07 SHALL use a secure channel protecting the authenticity and integrity of the information in the registry during transport. |
| Reg_09 | The API mentioned in Reg_06 and the user interface mentioned in Reg_07 SHALL NOT require authentication or prior registration and authorisation of any entity wishing to retrieve the information in the registry. |

B. *General requirements for the issuance of access certificates*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| Reg_10 | A Member State SHALL ensure that an Access Certificate Authority notified according to [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)] issues an access certificate to all PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers, and Relying Parties registered in one of the Member State's registries. |
| Reg_11 | A Member State SHALL ensure that the issuance process of access certificates by their notified Access Certificate Authority(s) complies with a common Certificate Policy for Access Certificate Authority. |
| Reg_12 | The Commission SHALL provide technical specifications establishing the common Access Certificate Authority Certificate Policy mentioned in Reg_11. |
| Reg_13 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority logs all issued certificates for Certificate Transparency (CT). *Note: This requirement is still under discussion and might be changed or removed in a future version of this ARF.* |
| Reg_14 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority provides one or more method(s) to revoke the access certificates it issued. |
| Reg_15 | The common Certificate Policy mentioned in Reg_12 SHALL include a policy for revocation, which SHALL require that an Access Certificate Authority revokes an access certificate at least when: - the certificate subject which is a Relying Party is de-registered by the respective Registrar, - the certificate subject which is a PID Provider, QEAA Provider, PuB-EAA Provider, or (non-qualified) EAA Provider is withdrawn or suspended by the respective Registrar, - on request of the certificate subject, or - on request of a competent national authority. |
| Reg_16 | The common Certificate Policy mentioned in Reg_12 SHALL specify the profile of access certificates in detail. |
| Reg_17 | The common Certificate Policy mentioned in Reg_12 SHALL require that an access certificate indicates whether its subject is a PID Provider, a QEAA Provider, a PuB-EAA Provider, a (non-qualified) EAA Provider, or a Relying Party Instance. |
| Reg_18 | The common Certificate Policy mentioned in Reg_12 SHALL define the minimum change history information to be stored for resolving possible disputes regarding registration. |

C. *Requirements for the registration of PID Providers*

| **Index** | **Requirement specification** |
|-----------|---------------------|
| Reg_19 | A Member State SHALL approve a PID Provider according to a well-defined policy before including it in its PID Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of PID Providers in its Registry. |
| Reg_20 | A Member State SHALL identify PID Providers at a level of confidence proportionate to the risk arising from the potential harm a fraudulent PID Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |
| Reg_20a | A Registrar SHALL provide a method to suspend or withdraw a registered PID Provider. |
| Reg_20b | A Registrar SHALL have a policy for the suspension or withdrawal of a registered PID Provider, which SHALL specify that a PID Provider is suspended or withdrawn at least on request of the PID Provider or of a competent national authority. |

D. *Requirements for the registration of Attestation Providers*

| **Index** | **Requirement specification** |
|-----------|-------------------|
| Reg_21 | A Member State SHALL approve an Attestation Provider according to a well-defined policy before including it in its Attestation Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of Attestation Providers in its Registry. These processes and rules SHOULD consider any relevant differences between QEAA Providers, PuB-EAA Providers and (non-qualified) EAA Providers. |
| Reg_22 | A Member State SHALL identify Attestation Providers (i.e., QEAA Providers, PuB-EAA Providers and non-qualified EAA Providers) at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Attestation Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |
| Reg_22a | A Registrar SHALL provide a method to suspend or withdraw a registered Attestation Provider. |
| Reg_22b | A Registrar SHALL have a policy for the suspension or withdrawal of a registered Attestation Provider, which SHALL specify that an Attestation Provider is suspended or withdrawn at least on request of the PID Provider or of a competent national authority. |

E. *Requirements for the registration of Relying Parties*

| **Index** | **Requirement specification** |
|-----------|------------------|
| Reg_23 | The Commission SHALL establish a technical specification for a common set of Relying Party information to be registered in Member State registries. This set SHALL include at least the information defined in [European Digital Identity Regulation] [article 5b](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1776-1-1) 2 (c). |
| Reg_24 | A Member State SHALL enable a Relying Party to register remotely, using an API or user interface. |
| Reg_25 | A Member State SHALL identify a Relying Party at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Relying Party could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |
| Reg_26 | A Member State SHALL enable a Relying Party to update the information registered on it using a process comparable to the original registration process, and using the API or user interface mentioned in Reg_24. |
| Reg_27 | Relying Parties SHALL make any updates necessary to ensure the continued correctness of the registered information without undue delay. |
| Reg_28 | A Member State's Registry SHALL log all changes made on the information regarding a Relying Party, including at least initial registration, updates, deletion of information, and suspension or withdrawal. |
| Reg_29 | A Registrar SHALL have a policy for the withdrawal of a registered Relying Party, which SHALL specify that a Relying Party is withdrawn at least on request of the Relying Party or of a competent national authority. |
| Reg_30 | Empty |

F. *Requirements for the issuance of Relying Party Instance access certificates*

| **Index** | **Requirement specification** |
|-----------|---------------------|
| Reg_31 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains a name for the Relying Party, in a format suitable for presenting to a User. *Note: A Wallet Unit needs such a name when requesting User approval according to [[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)].* |
| Reg_32 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains an EU-wide unique identifier for the Relying Party, and SHALL specify a method for deriving such identifiers. *Notes: - The Wallet Instance needs such an identifier at least to lodge a complaint of suspicious Relying Party presentation requests to a data protection authority according to [Topic 50](#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data). - The EU-wide unique identifier could, for example, be a composition of a unique identifier of the registrar, defined in the policy, and a unique identifier for the Relying Party allocated by this registrar. - This Relying Party identifier is identical in all Relying Party Instance access certificates issued to a given Relying Party.* |

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

#### A.2.3.29 Topic 29 - Delegation paradigm

##### Description <!-- omit from toc -->

[Topic 3](#a233-topic-3---pid-rulebook) describes requirements for a rulebook of
natural-person PIDs. [Topic 28](#a2328-topic-28---wallet-unit-for-legal-persons)
does the same for legal-persons PIDs.

[Article 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1).5.(f)
of the [European Digital Identity Regulation] also mentions the possibility of
issuing eIDs that also could attest a natural person representing the natural or
legal person.  At current time, this Topic proposes to not describe any
requirements for such eID schemes without further Member State input for such
eID schemes. The main reason is that there is no cross-border legal framework
for mutual recognition of powers and mandates. Powers and mandates are generally
legal system-specific and administrative system-specific.

Another use case for delegation is where the recognition of the power
for a person to represent another person occurs on an *ad hoc* basis,
based on a decision by the represented User and in the context of a
specific Relying Party. The basis for such decisions is outside the
scope of eIDAS. Various scenarios can be considered:

1. Natural person to natural person, based on the will of the
 represented person: One individual authorises another individual to
 represent them, for example:
   - Picking up a prescription from the pharmacy or a package from
 the post office for a family member.
   - Empowering a person to vote on your behalf.
   - Empowering a notary to sell your house on your behalf to a
 certain party for a certain amount.
   - Empowering your employer to apply for a residence permit on your
 behalf.
2. Natural person to natural person, based on some decision by an
 authority, or also as a consequence of national, EU or international
 law.
3. Legal guardian being able to take decisions on behalf of child,
 disabled person, or elderly person.
4. Natural person to legal person: An individual authorising a legal
 entity to represent them.
5. A person empowering a law firm to be the executor of the trust upon their
 death.
6. A person empowering a bank to invest on their behalf.

##### HLRs <!-- omit from toc -->

There are no specific requirements in this Topic.

#### A.2.3.30 Topic 30 - Interaction between Wallet Units

##### Description <!-- omit from toc -->

A User can request another User to release an attestation of attributes, where
both Users use their Wallet Unit. This can be done when their devices are close
together (that is, in physical proximity) with internet connectivity for both
devices (online), or without internet connectivity for either or both devices
(offline).

This Topic lists the high-level requirements related to the interaction between
two Wallet Units. This topic will be further discussed with Member States.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| W2W_01 | A Wallet Unit SHALL support an interface and protocol for: - Establishing a connection with another Wallet Unit, - Receiving PID and (Q)EAA presentation requests from another Wallet Unit, - Validating such requests, - Responding to such requests in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5]. |
| W2W_01a | In addition to W2W_01, a Wallet Unit SHALL support an interface and protocol for: - Sending PID and (Q)EAA presentation requests to another Wallet Unit, - Receiving and validating the corresponding presentation response, in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5]. |
| W2W_02 | The Commission SHALL develop technical specifications for exchanging PIDs and attestations between two Wallet Units in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5]. |
| W2W_03 | The Requestor Wallet Unit SHALL authenticate its User prior to requesting attestations presentation from another Wallet Unit. |
| W2W_04 | The Requestee Wallet Unit SHALL request User approval, as specified in [[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)], before presenting requested attestations or attributes to another Wallet Unit. The Wallet Unit SHALL inform the User about the attributes that are being requested, and of the outcome of authentication and validation checks of the request and the requestor. |
| W2W_05 | The Requestor Wallet Unit SHOULD have pre-defined a list of attributes of PID or attestations that can be requested from the Requestee Wallet Unit. |
| W2W_06 | The Requestee Wallet Unit SHALL authenticate and validate the Requestor Wallet Unit, ensuring the validity of the Requestor Wallet Unit and the attribute request. |
| W2W_07 | The Requestor Wallet Unit SHALL display the received attributes to its User. |

#### A.2.3.31 Topic 31 - PID Provider, Wallet Provider, Attestation Provider, and Access Certificate Authority notification and publication

##### Description <!-- omit from toc -->

PID Providers, PuB-EAA Providers, Wallet Providers and Access Certificate
Authorities must be notified by a Member State to the Commission. As part of the
notification process, the trust anchors of these parties must be included in a
Trusted List. A trust anchor is the combination of a public key and an
identifier for the associated entity. Trust anchors are required for the
verification of the signatures of PIDs, attestations, WUAs, and access
certificates that are issued by these parties.

This Topic contains High-Level Requirements for the notification of these
parties by Member States, and for the publication of the notified information by
the Commission.

##### HLRs <!-- omit from toc -->

A. Generic requirements for notification

| **Index** | **Requirement specification** |
|-----------|-----------------|
| GenNot_01 | The European Commission SHALL establish technical specifications for a common system enabling the notification of PID Providers, PuB-EAA Providers, Wallet Providers, and Access Certificate Authorities by Member States to the Commission. *Note: Notification does not apply to QEAA Providers and (non-qualified) EAA Providers, as explained in Sections D and F below, respectively.* |
| GenNot_02 | As part of the specifications referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the notification of a PID Provider, PuB-EAA Provider, Wallet Provider or Access Certificate Authorities to the Commission. *Note: The outcome of the notification procedure is the publication of the information notified by the Member State according to [Article 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1) (18) in a machine and human readable manner using the common system mentioned in Section H, TLPub_01.* |
| GenNot_03 | The common system mentioned in GenNot_01 SHALL enable: - A secure notification channel between Member States and the Commission for all notifications. - A notification, verification, and publication process and associated validation steps (with follow-up and monitoring) at the Commission side. - Collected data to be processed, consolidated, signed or sealed, and published in both a machine-processable Trusted List and in a human-readable format, manually and/or automatically using e.g. a web service and/or API. |
| GenNot_04 | As regard to GenNot_03, second bullet, the Commission SHALL verify whether the notified data is complete and meets the technical specifications, while the Member States SHALL be responsible for the correctness of the notified information. |
| GenNot_05 | As part of the specifications referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the suspension or withdrawal of a PID Provider, PuB-EAA Provider, Wallet Provider, or Relying Party Access Certificate Authority. These operating procedures SHALL include unambiguous conditions for suspension or withdrawal. As an outcome of the suspension or withdrawal procedure, the status of the suspended or withdrawn PID Provider, PuB-EAA Provider, Wallet Provider, or Relying Party Access Certificate Authority in the Trusted List SHALL be changed to Invalid. |

B. Requirements for the notification of PID Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| PPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about PID Providers. |
| PPNot_02 | The common set of information to be notified about a PID Provider SHALL include: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. A business registration number from an official record, b. Identification data from that official record. 2. PID Provider trust anchors, i.e., public keys and name as per point 1) ii) above, supporting the authentication of PIDs issued by the PID Provider, 3. PID Provider Access Certificate Authority trust anchors, i.e., public keys and CA name, supporting the authentication of the PID Provider by Wallet Units at the service supply point(s) listed per point 4. below. 4. Service supply point(s), i.e., the URL(s) at which a Wallet Unit can start the process of requesting and obtaining a PID. *Notes: - Relating to point 3. above: PID Provider Access Certificate Authority trust anchors are notified separately from the Relying Party Access Certificate Authority (see Section G below), since PID Providers are -legally speaking- not Relying Parties. - For the concept of an Access Certificate Authority, see also [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)] and [Section 6.3.2 of the ARF main document](../../architecture-and-reference-framework-main.md#632-pid-provider-or-attestation-provider-registration-and-notification).* |
| PPNot_03 | PID Providers SHALL ensure that all PIDs they issue can be authenticated using the PID Provider trust anchors notified to the Commission. |
| PPNot_04 | PID Providers SHALL ensure that their PID Provider access certificates can be authenticated using the PID Provider Access Certificate Authority trust anchors notified to the Commission. *Note: [[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)] describes how access certificates will be used.*|
| PPNot_05 | PID Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider Trusted List which is sealed by the Commission. |
| PPNot_06 | PID Provider Access Certificate Authority trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider Access Certificate Authority Trusted List which is signed or sealed by the Commission. |
| PPNot_07 | The format of the PID Provider Trusted List SHALL comply with ETSI TS 119 612 v2.1.1 or with a suitable profile similarly derived from ETSI TS 102 231. |

C. Requirements for the notification of Wallet Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| WPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about Wallet Providers. |
| WPNot_02 | The common set of information to be notified about a Wallet Provider SHALL include: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. Business registration number from an official record, and b. Identification data from the official record. 2. Wallet Provider trust anchors, i.e., public keys and name as per point 1. b. above, supporting the authentication of Wallet Unit Attestations issued by the Wallet Provider. *Notes: - See [[Topic 9](#a239-topic-9---wallet-unit-attestation)] and [[Topic 38](#a2338-topic-38---wallet-unit-revocation)] for the definition of the WUA. - A Wallet Provider does not need an access certificate to interact with Wallet Units.* |
| WPNot_03 | Wallet Providers SHALL ensure that all WUAs they issue can be authenticated using the trust anchors notified to the Commission. |
| WPNot_04 | Wallet Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled Wallet Provider Trusted List which is sealed by the Commission. |
| WPNot_05 | The format of the Wallet Provider Trusted List SHALL comply with ETSI TS 119 612 v2.1.1 or with a suitable profile similarly derived from ETSI TS 102 231. |
| WPNot_06 | If a Wallet Provider is withdrawn (see requirement GenNot_05 above), that Wallet Provider SHALL immediately revoke all of its valid WUAs, in accordance with the requirements in [Topic 38](#a2338-topic-38---wallet-unit-revocation). If a Wallet Provider is suspended, that Wallet Provider and the Member State SHALL agree on the necessary precautionary measures that need to be taken, which MAY include the immediate revocation of all or some of its valid WUAs.|

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

F. Requirements for the notification of (non-qualified) EAA Providers

There is no notification of (non-qualified) EAA Providers foreseen by the
[European Digital Identity Regulation]. As stated in [[Topic 12](#a2312-topic-12---attestation-rulebooks)],
the Schema Provider for an Attestation Rulebook describing a type of attestation
that is an EAA defines in the Rulebook the mechanisms allowing a Relying Party
to obtain, in a trustworthy manner, the trust anchor(s) of EAA Providers issuing
this type of EAA.

G. Requirements for the notification of Access
 Certificate Authorities

Relying Party Access Certificate Authorities (CA) are TSPs responsible for
signing access certificates they issue to Relying Parties. Legally speaking,
Relying Parties in this context also include QEAA Providers, PuB-EAA Providers,
and (non-qualified) EAA Providers, but for clarity these roles are mentioned
separately in the requirements below. Where these requirements use the term
'Access Certificate Authorities' without further qualifications, this includes
Access Certificate Authorities for QEAA Providers, PuB-EAA Providers,
(non-qualified) EAA Providers, and Relying Parties.

For more information about Relying Party Access Certificate Authority,
see [[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)].

| **Index** | **Requirement specification** |
|------------|------------------|
| RPACANot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about Relying Party Access Certificate Authorities, QEAA Provider Access Certificate Authorities, PuB-EAA Provider Access Certificate Authorities, and (non-qualified) EAA Provider Access Certificate Authorities. |
| RPACANot_02 | The common set of information to be notified about an Access Certificate Authority SHALL include: 1. Identification data: i) MS/Country of establishment, ii) Name as registered in an official record, iii) Where applicable: - A business registration number from an official record, - Identification data from that official record. 2. Access Certificate Authority trust anchors, i.e., public keys and name as per point 1) ii), supporting the authentication of Relying Parties, QEAA Providers, PuB-EAA Providers, and (non-qualified) EAA Providers by Wallet Units. |
| RPACANot_03 | Relying Parties, QEAA Providers, PuB-EAA Providers, and (non-qualified) EAA Providers SHALL ensure that their access certificates can be authenticated using the Access Certificate Authority trust anchors notified to the Commission. |
| RPACANot_04 | Access Certificate Authority trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission--compiled Access Certificate Authority Trusted List which is signed or sealed by the Commission. |
| RPACANot_05 | The format of an Access Certificate Authority Trusted List SHALL comply with ETSI TS 119 612 v2.1.1 or with a suitable profile similarly derived from ETSI TS 102 231. |

H. Requirements for the publication of Trusted Lists compiled by the
 Commission

| **Index** | **Requirement specification** |
|------------|------------------|
| TLPub_01 | The European Commission SHALL establish technical specifications for the system enabling the publication by the Commission of the information notified by the Member States regarding PID Providers, Wallet Providers, PuB-EAA Providers, and Relying Party Access Certificate Authorities. |
| TLPub_02 | The European Commission SHALL establish technical specifications for the set of information to be published about: PID Providers, Wallet Providers,PuB-EAA Providers, andAccess Certificate Authorities based on the information notified by the Member States. *Note: The information to be published MAY be different from the information to be notified per requirements PPNot_01, WPNot_01, PuBPNot_01, and RPACANot_01 above, respectively.* |
| TLPub_03 | The publication of the information referred to in TLPub_01 SHALL take place over a secure channel protecting the authenticity and integrity of the published information. |
| TLPub_04 | The technical system mentioned in TLPub_01 SHALL NOT require authentication or prior registration and authorisation of any entity wishing to retrieve the published information. |
| TLPub_05 | The information referred to in TLPub_01 SHALL be published in an electronically signed or sealed form that is suitable for automated processing, and in a human-readable format, e.g., through introspection and display facilities, over an authenticated channel. |
| TLPub_06 | The Commission SHALL publish in the OJEU the locations of the Trusted Lists for PID Providers, Wallet Providers, PuB-EAA Providers, and Access Certificate Authorities. |
| TLPub_07 | The Commission SHALL publish in the OJEU the trust anchors to be used for verifying the signature or seal mentioned in TLPub_05. |
| TLPub_08 | As part of the specifications referred to in TLPub_01, the European Commission SHALL establish technical specifications for ensuring the availability and authenticity of the full history regarding the information notified about PID Providers, Wallet Providers, PuB-EAA Providers, and Access Certificate Authorities. |

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
that PID or attestation. Note that the Migration Object does not contain any
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
Provider(s) or Attestation Provider(s) to re-issue the PID(s) or attestation(s)
to the new Wallet Unit. The only function of the Migration Object is to simplify
this process by listing the PIDs and attestations present in the existing Wallet
Unit, together with the information needed by the new Wallet Unit to start the
re-issuance process.

The Migration Object does not contain attribute values or attribute identifiers,
as that data is considered sensitive and is not useful anyway because of the
limitations explained above. Instead, the object only contains a list of
attestation types and the related Attestation Providers. However, even this
limited information may be considered sensitive in some cases. Therefore, the
Migration Object is stored in such a way that its confidentiality is ensured and
that it can be used only by the User.

##### HLRs <!-- omit from toc -->

A. Back-up requirements

| **Index** | **Requirement specification** |
|-----------|------------------|
| Mig_01 | A Wallet Unit SHALL include and keep up-to-date a Migration Object, containing the following information: The contents of the log for all transactions executed through the Wallet Unit, as listed in requirement DASH_02.A list of PIDs and attestations present in the Wallet Unit, according to the requirements in this Topic. |
| Mig_02 | The Commission SHALL define a technical specification of the Migration Object. |
| Mig_03 | For each PID or attestation that is issued to it, a Wallet Unit SHALL add all data that is necessary to request re-issuance of that PID or attestation to the Migration Object. This SHALL include at least the attestation type and the PID Provider or Attestation Provider that issued the PID or attestation, as well as their service supply points. However, the Migration Object SHALL NOT contain attribute identifiers or attribute values, and SHALL NOT contain any private keys of the PID or attestation. |
| Mig_03b | If the User deletes a PID or attestation from their Wallet Unit, the Wallet Unit SHALL delete the corresponding entry from the Migration Object. |
| Mig_04 | The Wallet Unit SHALL store the Migration Object in an external storage or remote location of the User's choice, in such a way that the User can still retrieve the object from a new Wallet Unit in case the existing Wallet Unit becomes unavailable. *Note: The new Wallet Unit may be either an instance of the same Wallet Solution as the old one, or an instance of a different Wallet Unit.* |
| Mig_05 | The Wallet Unit SHALL store the Migration Object in such a way that its confidentiality is protected and that it is protected against use by others than the User. *Note: This could be done, for example, by using password-based cryptography to encrypt the object.* |

B. Restore Requirements

| **Index** | **Requirement specification** |
|-----------|-----------------|
| Mig_06 | Directly after installation of a new Wallet Instance, the Wallet Instance SHALL enable the User to import a Migration Object from an external storage or remote location indicated by the User. |
| Mig_07 | For each PID and attestation listed in the Migration Object, the Wallet Unit SHALL enable the User to select that PID or attestation. When selected, the Wallet Unit SHALL request the respective PID Provider or Attestation Provider to re-issue that PID or attestation. If the Migration Object lists a PID, the PID SHALL be the first to be restored. |
| Mig_07a | The Wallet Unit SHALL ask the User whether they want to restore the log from the Migration Object. When the User agrees, the Wallet Unit SHALL restore the log, and SHALL append future transactions to this log according to the requirements in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency). |
| Mig_08 | Empty |
| Mig_09 | Empty |
| Mig_10 | Empty |
| Mig_11 | The processes and interfaces used for re-issuance of a PID or attestation (as part of a migration process) SHALL be the same as those used for their issuance, as specified in [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit). |
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
| WURevocation_01 | To enable a Relying Party or an Attestation Provider to verify the authenticity and (if necessary, see requirement VCR_01) the revocation status of a Wallet Unit it is interacting with, a Wallet Provider SHALL issue one or more Wallet Unit Attestations to the Wallet Unit, as specified in Topic 9. *Note: The first of these WUAs will be issued during the activation phase of a Wallet Unit. During the lifetime of the Wallet Unit, the Wallet Provider will re-issue WUAs as needed.* |
| WURevocation_02 | During the lifetime of the Wallet Unit, the Wallet Provider SHALL ensure that the Wallet Unit at all times is able to respond with a valid WUA to a presentation request from a Relying Party. |
| WURevocation_03 | Empty |
| WURevocation_04 | Empty |
| WURevocation_05 | Empty |

A. Revoking a Wallet Unit

| **Index** | **Requirement specification** |
|------------|------------------|
| WURevocation_06 | Empty |
| WURevocation_07 | A Wallet Provider SHALL be able to revoke a Wallet Unit by revoking its WUA(s), as specified in [[Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking)]. *Note: Topic 7 also allows the use of short-lived (i.e., valid for less than 24 hours) WUAs that do no need to be revoked. In that case, the Wallet Provider revokes the Wallet Unit by no longer issuing WUAs to it.*|
| WURevocation_08 | Empty |
| WURevocation_09 | During the lifetime of a Wallet Unit, the Wallet Provider SHALL regularly verify that the security of the Wallet Unit is not breached or compromised. If the Wallet Provider detects a security breach or compromise, the Wallet Provider SHALL analyse its cause(s) and impact(s). If the breach or compromise affects the trustworthiness or reliability of the Wallet Unit, the Wallet Provider SHALL administratively revoke or suspend the Wallet Unit and SHALL immediately revoke the corresponding WUA(s) if they have a remaining validity period of 24 hours or longer. The Wallet Provider SHALL do so at least in the following circumstances: - If the security of the Wallet Unit, or the security of the mobile device and OS on which the corresponding Wallet Instance is installed, or the security of a WSCA it uses for managing cryptographic keys and sensitive data, is breached or compromised in a manner that affects its trustworthiness or reliability. - If the security of the Wallet Solution is breached or compromised in a manner that affects the trustworthiness or reliability of all corresponding Wallet Units. - If the security of the common authentication and data protection mechanisms used by the Wallet Unit is breached or compromised in a manner that affects their trustworthiness or reliability. - If the security of the electronic identification scheme under which the Wallet Unit is provided is breached or compromised in a manner that affects its trustworthiness or reliability. |
| WURevocation_9b | If within three months from an administrative suspension of a Wallet Unit the security breach or compromise is remedied, the Wallet Provider SHALL issue one or more WUAs to the Wallet Unit, such that the User can again use it. |
| WURevocation_10 | A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of the User registered during the Wallet Unit activation process, see [Topic 40](#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management). To do so, the Wallet Provider SHALL revoke all valid WUA(s) for that Wallet Unit, if they have a remaining validity period of 24 hours or longer. The Wallet Provider SHALL authenticate the User before accepting a request to revoke the Wallet Unit. |
| WURevocation_11 | A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of a PID Provider, in case the natural person using the Wallet Unit has died or the legal person using the Wallet Unit has ceased operations. To do so, the Wallet Provider SHALL revoke all valid WUA(s) for that Wallet Unit, if they have a remaining validity period of 24 hours or longer. To identify the Wallet Unit that is to be revoked, the PID Provider SHALL use the Wallet Unit identifier provided by the Wallet Provider in the WUA during PID issuance. |
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
| WURevocation_18 | A PID Provider or Attestation Provider SHOULD, for each of its valid PIDs or attestations, regularly verify whether the Wallet Provider revoked the Wallet Unit on which that PID or attestation is residing. If it turns out that the Wallet Unit is revoked, the PID Provider or Attestation Provider SHOULD immediately revoke the respective PID or attestation in accordance with all requirements in [[Topic 7](#a237-topic-7---attestation-revocation-and-revocation-checking)]. *Notes: - How the PID Provider or Attestation Provider can do this verification depends on the details of the WUA and on WUA management. This is a topic that will be further discussed. - The reverse is not true: When a PID is revoked, this does not imply that the Wallet Unit on which it is residing should also be revoked. Instead, the Wallet Unit moves to the Operational state. See [ARF main document Section 4.6.3](../../architecture-and-reference-framework-main.md#463-wallet-unit).* |
| WURevocation_19 | A Relying Party SHOULD verify the revocation status of the Wallet Unit by requesting and verifying a WUA and subsequently verifying the revocation status of the WUA following the steps specified per VCR_11. |
| WURevocation_19a | To safeguard User privacy, a Relying Party Instance SHOULD request only the data from the WUA that is necessary for carrying out a revocation check for the Wallet Unit. *Note: The format of the WUA will be further discussed with Member States. However, the WUA contains information about the Wallet Instance and the related WSCD(s) that are only relevant for PID Providers and Attestation Providers, and that a Relying Party should not know.* |
| WURevocation_19b | To safeguard User privacy, a Wallet Unit SHALL present to a Relying Party only the data in the WUA that is necessary for carrying out a revocation check for the Wallet Unit. *Note: See note to requirement WURevocation_19a. In addition, this requirement implies that the format of the WUA must enable the selective disclosure of attributes.* |
| WURevocation_20 | For the verification of WUAs, a Relying Party SHALL accept the trust anchors in the Wallet Provider Trusted List. *Note: The Wallet Provider Trusted List is explained in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].* |
| WURevocation_21 | When no reliable information regarding the revocation status of a WUA is available, a Relying Party SHOULD perform a risk analysis considering all relevant factors for the use case, before taking a decision to accept or refuse the Wallet Unit. |

#### A.2.3.39 Topic 39 - Wallet to wallet technical Topic

See [Topic 30](#a2330-topic-30---interaction-between-wallet-units).

#### A.2.3.40 Topic 40 - Wallet Instance installation and Wallet Unit activation and management

##### Description <!-- omit from toc -->

This Topic discusses requirements related to the installation of a Wallet
Instance by the User, the subsequent activation of the Wallet Unit by the User
and the Wallet Provider, and the management of the Wallet Unit throughout its
lifetime.

##### HLRs <!-- omit from toc -->

*Wallet Instance installation* <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_01 | To ensure that the User can trust the Wallet Solution, a Wallet Provider SHOULD make its certified Wallet Solution available for installation only via the official app store of the relevant operating system (e.g., Android, iOS). *Note: This allows the operating system of the device to perform relevant checks regarding the authenticity of the Wallet Unit.* |
| WIAM_02 | If a Wallet Provider makes its certified Wallet Solution available for installation through other means than the official OS app store, it SHALL implement a mechanism allowing the User to verify the authenticity of the Wallet Unit. Moreover, it SHALL provide clear instructions to the User on how to install the Wallet Instance, including at least: - instructions on the verification of the authenticity of the Wallet Instance to be installed, - instructions on bypassing of any operating system limitations on side-loading of apps, if applicable, and ensuring that these limitations are restored after the Wallet Instance has been installed. *Note: This requirement also applies for the installation of a Wallet Instance on a User device that is not a mobile device, and for which no official operating system app store may exist.* |

*Wallet Unit activation* <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_03 | A Wallet Provider SHALL ensure that a Wallet Instance starts a process to activate the new Wallet Unit with the Wallet Provider immediately after installation or when the User first opens the Wallet Instance. The Wallet Provider SHALL ensure that the Wallet Instance starts this process only with a secure backend of the Wallet Provider. |
| WIAM_04 | During the activation process of a new Wallet Unit, the Wallet Provider SHALL verify that the new Wallet Instance is a genuine instance of its Wallet Solution. |
| WIAM_05 | During the activation process of a new Wallet Unit, the Wallet Provider SHALL process information about the User device and the available WSCAs and WSCDs, as far as necessary to issue a Wallet Unit Attestation to the Wallet Unit conform all requirements in [Topic 9](#a239-topic-9---wallet-unit-attestation) section A. The Wallet Provider MAY process additional information necessary for managing the Wallet Unit, but it SHALL NOT process more information than it reasonably needs for legitimate purposes. The Wallet Provider SHALL request User consent (through the Wallet Instance) for all information and data it will process, both during activation and throughout the lifetime of the Wallet Unit. The Wallet Provider SHALL inform the User about the purposes of data processing, in accordance with the General Data Protection Regulation. |
| WIAM_06 | The Wallet Provider SHALL request the User, through the new Wallet Instance, to set up a User account at the Wallet Provider. The Wallet Provider SHALL explain to the User that this is necessary to enable the User to request revocation of the Wallet Unit in case of theft or loss. The Wallet Provider SHALL register one or more User authentication methods that the Wallet Provider will use to authenticate the User in the future. These methods SHALL be independent of the Wallet Unit and the User device. The Wallet Provider SHALL allow the User to register using an alias instead of true identity data. The Wallet Provider SHALL NOT use any registered User data for purposes other than User authentication, unless the User gives explicit consent to do so. The Wallet Provider SHALL register the relationship between the Wallet Unit and the corresponding User account. |
| WIAM_07 | A Wallet Provider SHALL activate a new Wallet Unit before a User can use it to have issued an PID or attestation. *Note: The WUA is issued as part of the activation.* |
| WIAM_08 | A Wallet Provider SHALL only activate a new Wallet Unit if it has verified that: - The Wallet Unit includes at least one WSCA that is certified to be compliant with applicable requirements in this Topic, for level of assurance "high" in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. In addition, the Wallet Unit MAY include one or more other WSCAs. - The private key corresponding to the public key in the WUA (see WUA_07) is protected by the respective WSCA under control of the user. |
| WIAM_09 | If a WSCA/WSCD contains cryptographic keys related to multiple Wallet Units, the Wallet Provider SHALL ensure that a Wallet Unit can only access keys that are related to that Wallet Unit. |
| WIAM_10 | During the activation of a new Wallet Unit, a Wallet Provider SHALL create and sign at least one Wallet Unit Attestation, and issue them to the Wallet Unit. |

*Wallet Unit management* <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_11 | During the lifetime of the Wallet Unit, the Wallet Provider SHALL update the Wallet Unit as necessary to ensure its continued security and functionality. |
| WIAM_12 | All communication between the Wallet Provider and the Wallet Unit SHALL be mutually authenticated and SHOULD be encrypted. |
| WIAM_13 | If the User uninstalls the Wallet Unit, the Wallet Unit SHALL ensure that all cryptographic key material in the WSCA(s) related to the Wallet Unit is securely destroyed. This includes all keys of the WUAs, PIDs and attestations stored in the Wallet Unit. *Note: Key deletion is a cryptographic key operation and requires User authentication, as specified in requirement WIAM_14.* |
| WIAM_13a | If a Wallet Unit supports the [W3C Digital Credentials API] and the User uninstalls the Wallet Unit, the Wallet Unit SHALL disclose the fact that it no longer stores any PID(s) or attestation(s) to the Digital Credentials API framework. |
| WIAM_14 | A WSCA SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or of a PID or an attestation stored in a Wallet Unit. For a PID key (which is part of the EUDI Wallet eID means), this WSCA SHALL be certified to be compliant with applicable requirements for level of assurance "high" in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. *Note: Many actions of the Wallet Unit, such as processing a Relying Party request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and message encryption. This requirement does not imply that separate User authentication is necessary before each of these. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.* |
| WIAM_15 | A Wallet Unit SHALL authenticate the User before performing any operation excluding cryptographic operations. The Wallet Unit SHOULD rely on a WSCA to do so, per WIAM_14. If this is infeasible, the Wallet Unit SHOULD use a User authentication mechanism implemented on OS level, such as a lock screen, but it MAY also use a separate User authentication mechanism implemented in the Wallet Instance. *Notes: - The goal of this requirement is to prevent any User interaction without User authentication, including, for example, using the user interface to see which attestations are present in the Wallet Unit or what are the values of specific User attributes. - Cryptographic operations are excluded in this requirement because they can only be performed after User authentication by the WSCA, according to WIAM_14. - An example where using a WSCA for User authentication is not feasible is a Wallet Unit using a remote HSM as its WSCA and being without internet connection. - In general, using an OS-level User authentication mechanism instead of a separate mechanism implemented in the Wallet Instance is beneficial for security and User experience. Please note that this ARF assumes that a User device is a personal device, meaning that the User will not share it with other people. - An example where using an OS-level User authentication mechanism is not feasible is where the User has disabled such mechanisms (i.e., no lock screen is used). In that case, a Wallet Unit that is not able to use a WSCA for authentication must use a separate User authentication mechanism implemented in the Wallet Instance as a fallback.* |
| WIAM_16 | For User authentication according to WIAM_15, a Wallet Unit SHALL implement an idle timeout, after which User authentication SHALL again be required. The Wallet Unit SHOULD provide the User with the option to set the idle timeout to a duration shorter than the default timeout. |
| WIAM_17 | A WSCA SHALL be able to authenticate a User, in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. |
| WIAM_18 | A WSCA SHALL be able to generate a new key pair on request of the Wallet Provider via the Wallet Instance. |
| WIAM_19 | A WSCA SHALL be able to prove possession of the private key corresponding to a public key on request of a Wallet Instance, for example by signing a challenge with that private key. |
| WIAM_20 | A WSCA SHALL protect a private key it generated during the entire lifetime of the key. This protection SHALL at least imply that the WSCA prevents the private key from being extracted in the clear. If a WSCA is able to export a private key in encrypted format, the resulting level of protection SHALL be equivalent to the protection level of the private key when stored in the WSCA. |

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

Note that embedded disclosure policies do not apply to Wallet-to-Wallet interactions as described in [Topic 30](#a2330-topic-30---interaction-between-wallet-units).

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| EDP_01 | A Wallet Unit SHALL enable an Attestation Provider to optionally express an embedded disclosure policies for a QEAA, PuB-EAA, or non-qualified EAA. *Note: The [European Digital Identity Regulation] does not contain a requirement for PIDs to be able to contain an embedded disclosure policy.* |
| EDP_02 | A Wallet Unit SHALL support embedded disclosure policies implementing the 'Authorised relying parties only policy' described in Annex III of Implementing Regulation (EU) 2024/2979. Such an embedded disclosure policy SHALL contain a list of EU-wide unique identifiers of Relying Parties as specified in Reg_32. The Wallet Unit SHALL retrieve the identifier from the Relying Party registration certificate presented by the Relying Party, and compare it to the list of authorised identifiers in the policy. |
| EDP_03 | A Wallet Unit SHALL support embedded disclosure policies implementing the 'Specific root of trust' policy described in Annex III of Implementing Regulation (EU) 2024/2979. Such an embedded disclosure policy SHALL contain a list of root or intermediate certificates used for signing Relying Party access certificates. The Wallet Unit SHALL compare the certificate chain that was used to sign the access certificate provided by the Relying Party to the list of authorised root or intermediate certificates in the policy. |
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
2024/2982 [2024/2982]. A registration certificate is issued by a Relying Party
registrar to a Relying Party during the registration process described in
[Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties).
It contains mainly the list of attributes registered by the Relying Party
according to Article 5b 2 (c) of the [European Digital Identity Regulation]. A
registration certificate is signed by the Registrar.

Commission Implementing Regulation 2024/2982 requires a Wallet Unit to
authenticate and validate the registration certificate, and to display the
information in the certificate to the User, where applicable. This enables Users
to verify that the attributes being requested by the Relying Party are within
the scope of their registered attributes, providing assurance that the request
is legitimate and trustworthy.

##### HLRs <!-- omit from toc -->

A. Issuance of Relying Party registration certificates

| **Index** | **Requirement specification** |
|-----------|-----------------|
| RPRC_01 | During the registration process for Relying Parties, as specified in [Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties), the Member State Registrar SHALL create and sign a registration certificate and issue it to the Relying Party. The registration certificate SHALL comply with the applicable requirements in the technical specification mentioned in RPRC_02. *Note: These requirements do not apply in case the Relying Party acts only as an intermediary, see [Topic 52](#a2352-topic-52-relying-party-intermediaries).* |
| RPRC_02 | The Commission SHALL ensure that a technical specification is created, describing at least 1. the contents and format of registration certificates, 2. the signing method(s) used to ensure the authenticity of the registration certificates. 3. the trust infrastructure necessary for signing registration certificates and for verifying these signatures, including, if necessary, the use of Trusted Lists to establish trust in Member States Registrars and to distribute their trust anchors to Wallet Units. 4. the method used for binding each registration certificate to the Relying Party Instance access certificate that will be used during the same transaction. This binding method SHALL enable a Wallet Unit to verify that the registration certificate was in fact issued to the Relying Party that authenticated itself using the access certificate. The binding method SHALL consider situations in which the Relying Party uses the services of an intermediary (see [Topic 52](#a2352-topic-52-relying-party-intermediaries)) to connect to the Wallet Unit. 5. whether or not a registration certificate must have a validity period. 6. whether or not a registration certificate must be revocable, and if so, the method to be used for revocation. Moreover, if a registration certificate must be revocable, the technical specification SHALL describe the impact of revocation, especially compared to the impact of revocation of the Relying Party Instance access certificates. |
| RPRC_03 | The contents of a registration certificate SHALL include at least 1. the list of attributes registered by the Relying Party, where each attribute is identified by the identifier specified for it in the applicable Attestation Rulebook, as specified in ARB_06a or ARB_06b. 2. the name of the Relying Party, which SHALL be identical to the name meant in Reg_31. 3. the EU-wide unique identifier of the Relying Party, as meant in Reg_32. 4. if the Relying Party uses the services of an intermediary (see [Topic 52](#a2352-topic-52-relying-party-intermediaries)): the fact that this is the case, plus the name and unique identifier (as meant in Reg_32) of this intermediary. 5. contact details for the Relying Party. *Note: The Wallet Unit needs this information at least to be able to send a data deletion request to the Relying Party, see [Topic 48].* |

B. Presentation and verification of Relying Party registration certificates

| **Index** | **Requirement specification** |
|-----------|-----------------|
| RPRC_04 | In both proximity and remote presentation flows, the Relying Party Instance SHALL transfer a Relying Party registration certificate to the Wallet Unit in the presentation request, according to the applicable standard's extension mentioned in RPRC_05. The registration certificate SHALL be included in the request by value, not by reference. *Note: This ensures that no external requests are necessary to validate the request, and that transactions are atomic and self-contained.* |
| RPRC_05 | The Commission SHALL ensure that extensions are specified for [ISO/IEC 18013-5] and for [OpenID4VP], allowing a Relying Party to transfer a Relying Party registration certificate to a Wallet Unit. These extensions SHALL comply with applicable requirements in these standards. |
| RPRC_06 | The Wallet Unit SHALL verify the authenticity and validity of the registration certificate according to the technical specification meant in RPRC_02. If the outcome of the verification is negative, the Wallet Unit SHALL, when asking for User approval according to RPA_07 and subject to the User preference set according to RPRC_08, notify the User that it could not verify whether the Relying Party registered the requested attributes with the competent authorities. |
| RPRC_07 | The Wallet Unit SHALL verify that all attributes requested in the presentation request are included in the list of attributes in the registration certificate. If the outcome of the verification is negative, the Wallet Unit SHALL, when asking for User approval according to RPA_07 and subject to the User preference set according to RPRC_08, notify the User about the requested attributes that the Relying Party did not register. |
| RPRC_08 | A Wallet Unit SHOULD enable its User to set their preference for showing or hiding the notifications meant in RPRC_06 and RPRC_07. By default, the Wallet Unit SHALL show the notifications. |

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
| DATA_DLT_01 | A Wallet Provider SHALL ensure that its Wallet Units support the technical specifications mentioned in DATA_DLT_02, allowing a User to request from a Relying Party the erasure of their attributes that were presented by that Wallet Unit to that Relying Party, in accordance with Regulation (EU) 2016/679. |
| DATA_DLT_02 | The Commission SHALL, in cooperation with the Member States, develop technical specifications for a Wallet Unit interface allowing a Wallet Unit to send attribute deletion requests to Relying Parties with whom it has interacted in the past. |
| DATA_DLT_03 | A Wallet Instance SHALL provide a function where the User may select one Relying Party or multiple Relying Parties for which an attribute deletion request must be submitted. |
| DATA_DLT_04 | A Wallet Instance SHALL be able to display the attribute deletion requests previously submitted through the Wallet Unit. |
| DATA_DLT_05 | A Wallet Unit SHALL include attribute deletion requests in a log so they can be presented to the User via the dashboard (as specified in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency)). |
| DATA_DLT_06 | The log SHALL include as a minimum: - Date of attribute deletion request, - Relying Party to which the request was made, - Attributes requested to be removed. |

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
| RPT_DPA_01 | A Wallet Unit SHALL provide an interface to lodge a complaint of suspicious Relying Party presentation requests to the DPA of the Member State that provided the Wallet Unit. |
| RPT_DPA_02 | The User interface enabling a User to start the process of lodging a complaint SHALL be accessible via the Wallet Instance. |
| RPT_DPA_03 | A Wallet Provider SHALL implement the interface in compliance with national procedural law and administrative practices. |
| RPT_DPA_04 | A Wallet Unit SHALL enable the lodged complaint to be substantiated, including information to identify the Relying Party, their presentation request, and the User's allegation. |
| RPT_DPA_05 | A Wallet Unit SHALL keep reports sent to the DPA in a log file so that it can be presented to the User in the dashboard (as specified in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency)). |

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
| PAD_04 | If the Wallet Unit deletes a PID or attestation on the User's request, the Wallet Unit SHALL ensure that all cryptographic key material in the WSCA related to this PID or attestation is securely destroyed. *Note: Key deletion is a cryptographic key operation and requires User authentication, as specified in requirement WIAM_14.* |
| PAD_05 | If a Wallet Unit supports the [W3C Digital Credentials API] and it deletes a PID or attestation on the User's request, the Wallet Instance SHALL disclose the fact that it no longer stores this PID or attestation to the Digital Credentials API framework. |

#### A.2.3.52 Topic 52 Relying Party intermediaries

##### Description <!-- omit from toc -->

This topic lists high-level requirements regarding so-called intermediaries,
which form a special class of Relying Party. Article 5b (10) of the [European
Digital Identity Regulation] states "Intermediaries acting on behalf of relying
parties shall be deemed to be relying parties and shall not store data about the
content of the transaction.". Such an intermediary is a party that offers
services to Relying Parties to, on their behalf, connect to Wallet Units and
request the User attributes that these Relying Parties need. The intermediary
then performs all necessary verifications, and, if successful, sends the
presented attributes to the 'end' Relying Party. This implies that an
intermediary performs all tasks assigned to a Relying Party in this ARF on
behalf of the 'end' Relying Party.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------------|
| RPI_01 | An intermediary SHALL register as a Relying Party, in accordance with all requirements in [Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties). *Note: This implies that an intermediary obtains an access certificate containing its own name and unique Relying Party identifier.* |
| RPI_02 | An intermediary which is acting only as an intermediary for other Relying Parties, and not as a Relying Party in its own right, SHALL NOT obtain a registration certificate according to [Topic 44](#a2344-topic-44---relying-party-registration-certificates), containing its own name and Relying Party identifier. |
| RPI_03 | For each of the Relying Parties that uses its services, an intermediary SHALL obtain a registration certificate from a Registrar, according to the requirements in [Topic 44](#a2344-topic-44---relying-party-registration-certificates). This registration certificate SHALL contain that Relying Party's name and unique identifier, as well as the list of attributes registered for that Relying Party. |
| RPI_04 | When issuing a registration certificate for a Relying Party to an intermediary, the Registrar SHALL verify, in a manner to be decided by a Member State, that the Relying Party will indeed use the services of the intermediary to interact with Wallet Units. |
| RPI_05 | When issuing a registration certificate for a Relying Party to an intermediary, the Registrar SHALL include in the registration certificate the attribute meant in requirement RPRC_03, point 4, containing the name and identifier of the intermediary. |
| RPI_06 | When requested by a Relying Party, an intermediary SHALL request the presentation of attributes from a specific Wallet Unit, using their own access certificate meant in requirement RPI_01, and the registration certificate of the Relying Party meant in RPI_03. |
| RPI_07 | In case a Wallet Unit receives a presentation request from an intermediary, on behalf of a Relying Party, it SHALL verify the name of the intermediary during Relying Party authentication and display this name to the User when asking for User approval, as described in requirement RPA_06a. |
| RPI_08 | When a Wallet Unit presents any User attributes to an intermediary in a PID or attestation, the intermediary SHALL, after successfully carrying out the verifications in RPI_09, forward these attributes only to the Relying Party that requested the intermediary to request these attributes from the Wallet Unit. If any of the verifications in RPI_09 fail, the intermediary SHALL NOT forward any attributes to the Relying Party. |
| RPI_09 | When a Wallet Unit presents any User attributes to an intermediary in a PID or attestation, the intermediary SHALL verify the authenticity of the PID or attestation, its revocation status, device binding, and User binding, as well as any combined presentation of attributes, if applicable, as specified in this ARF and if agreed with the Relying Party. Also, the intermediary SHALL verify the authenticity of the Wallet Unit and its revocation status, as specified in this ARF and if agreed with the Relying Party. *Note: This ARF does not mandate that a Relying Party must carry out all of these verifications. Therefore, the intermediary and any Relying Party using its services must agree on what verifications the intermediary will carry out.* |
| RPI_10 | The intermediary SHALL delete any PIDs, attestations, or WUAs it obtained from the Wallet Unit, including any User attributes, completely and immediately after it has sent the User attributes to the Relying Party. If the intermediary does not send any User attributes to the Relying Party, for example because one of the verifications in the previous step failed, the intermediary SHALL delete the PIDs, attestations, or WUAs completely and immediately as soon as it has completed all necessary verifications. |

#### A.2.3.53 Topic 53 Zero-Knowledge Proofs

##### Description <!-- omit from toc -->

This topic lists high-level requirements for a Zero-Knowledge Proof scheme to be used within the EUDI Wallet ecosystem as a proof mechanism for PIDs and attestations. A Zero-Knowledge Proof (ZKP) is a cryptographic protocol that allows one party
(the prover) to convince another party (the verifier) that a given statement is
true without revealing any additional information beyond the validity of the
statement itself. This ensures that the verifier gains no knowledge about how
the prover knows the statement to be true, preserving privacy while enabling trust.

The topic of ZKPs for the EUDI Wallet ecosystem was introduced in the [Discussion Paper for Topic G](../../discussion-topics/g-zero-knowledge-proof.md). The high-level requirements in this Topic were taken from that discussion paper.

##### HLRs <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|--------------------|
| ZKP_01 | A ZKP scheme SHALL provide support for the following generic functions, while hiding all attributes of PIDs or attestations: (i) generation of a proof that an (some) attribute(s) having a specific value is (are) included in a PID or attestation, (ii) generation of a proof that a PID or attestation is within its validity period, (iii) generation of a proof that a PID or attestation has not been revoked, and (iv) generation of a proof that a PID or attestation is bound to a key stored in the WSCD of the Wallet User. Additionally, a ZKP scheme SHOULD provide support for the following function, which SHOULD  be used only when hiding the PID Provider or Attestation Provider is necessary: (v) generation of a proof that a PID or attestation has been issued by a trusted PID Provider or Attestation Provider, without revealing the PID Provider or Attestation Provider. *Notes: - See section 4.1.1 of the Discussion Paper for Topic G.* |
| ZKP_02 | A ZKP scheme SHALL support proving possession of attestation of a given type. *Note: See section 4.1.2 and 4.1.3 of the Discussion Paper for Topic G.* |
| ZKP_03 | A ZKP scheme SHOULD support the privacy-preserving binding of an attestation to a PID. In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme SHALL provide support for the following functions: (i) generation of a proof that the Wallet Unit stores an attestation and a PID and that the attestation includes a specific attribute, having a specific value, which is also present in the PID. *Note: See section 4.1.4 of the Discussion Paper for Topic G.* |
| ZKP_04 | A ZKP scheme SHOULD support the derivation of a verifiable User pseudonym, by combining an attribute value that is unique for the User with Relying Party-specific context (e.g., the Relying Party identifier) In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme SHALL provide support for the following functions: (i) generation of a request for the issuance of an attestation that includes a secret attribute unique to the User, without revealing this attribute to the Attestation Provider, (ii) generation of an attestation presentation that includes a verifiable pseudonym derived from the secret attribute, a Relying Party identifier, and context-related information. *Note: See section 4.1.5 of the Discussion Paper for Topic G.* |
| ZKP_05 | A ZKP scheme SHALL be usable in both remote and proximity presentation flows. While the inclusion of ZKP will introduce computational and verification delays, these delays SHALL NOT degrade the User experience of the Wallet Unit. |
| ZKP_06 | A ZKP scheme SHOULD be able to generate proofs for already issued PIDs and attestations in the formats specified in [ISO/IEC 18013-5] or [SD-JWT VC]. |
| ZKP_07 | A ZKP scheme SHALL NOT introduce any additional communication or information that could be used to track or link User activity during, before, or after proof generation. |
| ZKP_08 | A ZKP scheme SHALL rely solely on algorithms standardised by a standardisation organisation recognised by the Commission or in a standard recognised by the Commission. |
| ZKP_09 | Use of a ZKP scheme SHALL NOT prevent the Wallet Unit's ability to provide User authentication with Level of Assurance  "high". |