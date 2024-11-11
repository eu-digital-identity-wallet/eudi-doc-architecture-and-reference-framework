
# ANNEX 2 - High Level Requirements <!-- omit from toc -->


## A.2 High level requirements

### A.2.1 Introduction 

#### A.2.1.1 Overview 

This annex to the [ARF 1.4.0](../../arf.md) includes high-level requirements (HLRs)
related to the EUDI Wallet ecosystem. The requirements define the
responsible actor that should implement each requirement. There are no
requirements imposed on the Users.

All requirements in this Annex only apply in the context of the EUDI
Wallet ecosystem. Attestations that are not bound to or used by Wallet Units are not included in the scope of this Annex.

#### A.2.1.2 Key words 

This annex uses the capitalized key words 'SHALL', 'SHOULD' and 'MAY' as
specified in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119), i.e., to indicate requirements, recommendations
and options specified in this annex.

In addition, 'must' (non-capitalized) is used to indicate an external
constraint, i.e., a requirement that is not mandated by this document,
but, for instance, by an external standard or specification. The word
'can' indicates a capability, whereas other words, such as 'will', and
'is' or 'are', are intended as statements of fact.

### A.2.2 Structure and order of presentation of the HLRs 

Topics presented in [Section A.2.3](##a23-high-level-requirements) are ordered by a Topic number.

Each Topic includes a short description, followed by the High-Level
Requirements (HLRs), identified by a unique identifier. The identifier
includes a prefix which signifies the context of the HLRs (e.g. - ISSU
for issuance), an underscore and a numerator, e.g. - ISSU_10.

Note: If required, a reference will be made from a topic to a white
paper or to a technical report, which elaborates on the background or
content of the subject matter. 

### A.2.3 High-Level Requirements  

#### A.2.3.1 Topic 1 - Accessing Public and Private Online Services with a Wallet Unit

*Short description*

The primary purpose of the EUDI Wallet ecosystem is to offer secure identification
and authentication of Users at a high Level of Assurance (LoA) for both
public and private online services. This essential functionality ensures
that Relying Parties can confidently verify that they are interacting
with the correct User.

In this use case, a User is utilizing their Wallet Unit to confirm their
identity. The User frequently access online services that demand
authentication and currently employ multiple methods for identity
verification while accessing these services. The User is also
concerned about sharing Person Identification Data (PID) during online
interactions. Their objectives include identifying themselves with
services requiring User identification and maintaining control over
personal data sharing.

This Topic contains high-level requirements related to online
identification and authentication of a User utilizing their Wallet Unit.

*High level requirements*

| **Index** | **High Level Requirement** |
| -- | -- |
| OIA_01 | A Wallet Unit SHALL support technical specifications to respond to person identification data (PID) and attestation presentation requests by Relying Parties. |
| OIA_02 | A Wallet Unit SHALL support proving binding between a WSCA included in the Wallet Unit and a PID or attestation, in accordance with technical specifications. |
| OIA_03 | The Commission SHALL adopt the technical specifications for PID or attestation presentation request-response protocol and device binding, according to the protocols and interfaces specified in \[OpenID4VP\] for remote flows. |
| OIA_04 | A Wallet Unit SHALL verify and process PID or attestation presentation requests from Relying Parties in accordance with the protocols and interfaces specified in \[OpenID4VP\] for remote flows. |
| OIA_05 | After verifying and processing a PID or attestation request, the Wallet Unit SHALL inform the User about the identity of the requesting Relying Party and the requested attributes. |
| OIA_06 | A Wallet Unit SHALL transmit the requested attributes only after having received the User's authorization. See also OIA_07. |
| OIA_07 | A Wallet Unit SHALL support selective disclosure of attributes from PIDs and attestations to be released to the requesting Relying Parties. |
| OIA_08 | Empty |
| OIA_09 | Empty |
| OIA_10 | For both proximity and remote presentation flows, if a Wallet Unit contains two PIDs having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and a Relying Party requests a PID, the Wallet Unit SHALL ask the User which of these PIDs they want to release, unless the Wallet Unit can decide from context. |
| OIA_11 | For both proximity and remote presentation flows, if a Wallet Unit contains two attestations having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and the same attestation type, and a Relying Party requests an attestation of that type and encoding, the Wallet Unit SHALL ask the User which of these attestations they want to release, unless the Wallet Unit can decide from context.<p><br>Note: Attestation types are explained in \[[Topic 12](#a2312-topic-12---attestation-rulebooks)\]. |
| OIA_12 | For both proximity and remote presentation flows, a Relying Party SHALL validate the signature or seal of a PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\]. |
| OIA_13 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature or seal of a QEAA in accordance with Art.32 of the eIDAS Regulation. For the verification, the Relying Party SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. |
| OIA_14 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature or seal of a PuB-EAA in accordance with [Art.32](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2594-73-1) of the eIDAS Regulation. For that verification, the Relying Party SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature or seal. The Relying Party SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. The Relying Party SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| OIA_15 | For both proximity and remote presentation flows, a Relying Party SHALL validate the signature or seal of a (non-qualified) EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see \[[Topic 12](#a2312-topic-12---attestation-rulebooks)\].<br><br>Notes:<ul><li>OIA_12 – OIA_15 imply that a Relying Party Instance must know if the attestation it is requesting from a Wallet Instance is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. These requirements also imply that the Relying Party Instance must store trust anchors in such a way that, at the time of verification, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs.</li><li>PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, when it receives an unqualified attestation, a Relying Party Instance may have to verify that the unqualified EAA Provider is authorized or registered to issue this type of attestation, in addition to verifying the signature over the attestation using the EAA Provider's trust anchor. Mechanisms allowing to do this may be defined in the applicable Rulebook.</li> |

#### A.2.3.2 Topic 2 - Mobile Driving Licence within the EUDI Wallet ecoystem 

*Short description*

A User can obtain their mobile Driver's Licence (mDL) from an mDL Provider and
store it in an Wallet Unit. The User can then present the
mDL to a Relying Party upon request to prove their driving rights
conveniently, securely, and in compliance with the regulations of all
Member States.

This Topic contains high-level requirements related to a User presenting
a mobile Driver's Licence (mDL) to a Relying Party in a
supervised or unsupervised scenario, and also in an unsupervised scenario, in proximity mode.

*High level requirements*

No high-level requirements are identified for this Topic, as the mDL is
an attestation that must comply with all relevant requirements in other
Topics.

#### A.2.3.3 Topic 3 - PID Rulebook 

*Short description*

The Person Identification Data (PID) Rulebook contains requirements
specific to the PID use case within the EUDI Wallet ecosystem.

The PID Rule Book contains the following main topics:

1.  The PID attribute schema: This describes the structure, the type,
    the entity identifiers, and the logical organization of the
    mandatory and optional attributes of the PID. It also describes how
    Member States can specify any possible national attributes. Two
    encodings for these attributes are specified, one compliant with
    \[ISO18013-5\], the other compliant with \[SD-JWT\].

2.  The trust infrastructure necessary for PIDs, for both ISO/IEC
    18013-5-compliant and SD-JWT-compliant encodings.

For more information, see Annex 3 - \[PID Rulebook\].

*High level requirements*

| **Index** | **High Level Requirement** |
|-----------|--------------|
| PID_01 | PIDs and PID Providers SHALL comply with all requirements in \[PID Rulebook\]. |

#### A.2.3.4 Topic 4 - mDL Rulebook 

*Short description*

The mobile driving licence (mDL) Rulebook contains requirements specific
to the mDL use case within the EUDI Wallet ecosystem.

Mobile driving licences are legally specified in the proposed EC
Regulation 2023_127 (4th Driving Licence Regulation). This Regulation
specifies that mDLs shall comply with the ISO/IEC 18013-5 standard. It
does not mention any other standards, in particular not \[SD-JWT\].
Consequently, mDLs issued to a Wallet Unit will not be implemented
as \[SD JWT\]- compliant documents. The mDL Rulebook therefore specifies
only an ISO/IEC 18013-5 compliant encoding

For more information, see Annex 3 - \[mDL Rulebook\].

*High level requirements*

| **Index** | **High Level Requirement** |
|-----------|--------------|
| mDL_01 | mDLs and mDL Providers SHALL comply with all requirements in \[mDL Rulebook\]. |

#### A.2.3.5 Topic 5 - Wallet Unit Design Guide 
There are no HLRs for this Topic.

#### A.2.3.6 Topic 6 - Relying Party authentication and User Approval  

*Short description*

Relying Party authentication is a process whereby a Relying Party proves
its identity to a Wallet Unit, in the context of a transaction in
which the Relying Party requests the Wallet Unit to release some
attributes.

To perform Relying Party authentication, the Wallet Unit verifies a
Relying Party access certificate offered by the entity with which it
communicates, which is called a "Relying Party Instance". Note that
there could be multiple Relying Party Instances for each Relying Party.

*High level requirements*

A.  Relying Party authentication:

| **Index** | **Requirement specification** |
|-----------|--------------|
| RPA_01 | The Wallet Unit used by a User, as well as the Relying Party Instance used by the Relying Party, SHALL implement a mechanism for Relying Party authentication. This mechanism SHALL: <ul><li>enable the Wallet Unit to identify and authenticate the Relying Party,</li><li>enable the Wallet Unit to verify that the request from the Relying Party was not copied and replayed,</li><li>use Relying Party access certificates issued in accordance with \[[Topic 27](#a2327-topic-27---relying-party-registration)\].</li></ul> |
| RPA_02 | The Commission SHALL ensure that technical specifications for the Relying Party authentication mechanism mentioned in RPA_01 are created both for Wallet Units complying with \[ISO/IEC 18013-5\] and for Wallet Units complying with \[OpenID4VP\]. These specifications SHALL comply with applicable requirements in these standards. |
| RPA_03 | A Wallet Unit and a Relying Party Instance SHALL perform Relying Party authentication in all use cases, whether proximity or remote. <p><br>Note: The actions both entities perform differ. For example, while the Relying Party creates a signature over some data in the request, the Wallet Unit validates that signature. |
| RPA_04 | For the verification of Relying Party access certificates, a Wallet Unit SHALL accept the trust anchors in the Trusted List(s) of Relying Party Access CAs of all Member States. <p><br>Note: For more information about Relying Party Access Certificate Authorities, please see \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\]. |
| RPA_05 | If Relying Party authentication fails for any reason, the Wallet Instance SHALL inform the User that the identity of the Relying Party could not be verified and that therefore the request is not trustworthy. Moreover, the Wallet Unit SHALL either: <ul><li>not release the requested attributes to the Relying Party, or</li><li>give the User the choice to release the requested attributes or not.</li></ul>Note: It is up to the Wallet Provider to make a choice for one of the two options above. |
| RPA_06 | If Relying Party authentication succeeds, the Wallet Instance SHALL display to the User the name of the Relying Party as included in the Relying Party Instance access certificate, together with the attributes requested by the Relying Party. The Wallet Instance SHALL do so when asking the User for approval according to RPA_08. |


B.  User approval:

| **Index** | **Requirement specification** |
|-----------|--------------|
| RPA_07 | A Wallet Unit SHALL ensure the User approved the release of any attribute(s) in the Wallet Unit to a Relying Party, prior to releasing the attribute. A Wallet Unit SHALL always allow the User to refuse releasing an attribute requested by the Relying Party. |
| RPA_08 | A Wallet Unit SHALL ensure that (one of) its WSCA(s) has authenticated the User before allowing the User to give or refuse approval for releasing any attributes. <p><br>Note: See \[[Topic 09](#a239-topic-9---wallet-trust-evidence)\] for information about the WSCA. |
| RPA_09 | A Relying Party SHOULD communicate in the request which attributes are needed for which use case, service, or purpose, if this is supported by the protocol used for communication with the Wallet Unit. <br><br>Notes: <ul><li>This could be done, for instance, by grouping the attributes and describing the use case, service, or purpose of each group.</li><li>The purpose of this recommendation is that a Relying Party (RP) makes clear to the User what the intended use, the service being accessed, or the specific purpose is of each requested attribute. For example, a service may legally require attributes for age verification (e.g., birthdate), but the Relying Party may also want a User address (e.g., street, location, PObox, country) in order to offer added-value services. Age verification attributes and address attributes should be grouped separately, and the purposes should be clearly distinguished. This allows the User to be better informed about the request, and also allows them to approve one purpose but deny the other; see RPA_10. |
| RPA_10 | If a Wallet Unit receives a request indicating one or more use cases, services, or purposes for requesting attributes, the Wallet Instance SHOULD show these to the User when asking for User approval. Moreover, the Wallet Unit SHOULD ensure that for each use case, service, or purpose, the User gives approval either to release all attributes requested for that purpose, or none of them. <br><br>Note: This means that a User should either approve the release of all attributes in a given group or to deny the entire group. The Wallet Unit should not allow partial approval within a group. Partial approval would mean that the Relying Party cannot deliver the service, but nevertheless receives some User attributes. This would be a violation of the User's privacy.  |

#### A.2.3.7 Topic 7 - Attestation revocation and revocation checking

*Short description*

This Topic contains the high-level requirements (HLRs) relating to the (possible) revocation of PIDs, QEAAs, PuB-EAAs, non-qualified EEAs and WUAs by their providers. It also contains HLRs relating to the (possible) checking of the revocations status of a PID or attestation by a Relying Party.

Note: This Topic does not pertain to access certificates for Relying
Parties, PID Providers or Attestation Providers as discussed in [Topic
31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication). Neither does it apply to any intermediate certificates establishing
trust between these certificates and the respective trust anchors. These
certificates are part of a Public Key Infrastructure (or an OpenID
Federation, or a similar trust framework), and rules for revoking these
certificates will be established within the respective PKI or trust
framework.

*High level requirements*

| **Index** | **High Level Requirement** |
|-----------|--------------|
| VCR_01 | A PID Provider, QEAA Provider, PuB-EAA Provider, or Wallet Provider SHALL use one of the following methods for revocation of a PID, QEAA, PuB-EAA, or WUA: <ul><li>Only issue short-lived attestations having a validity period of 24 hours or less, such that revocation will never be necessary,</li><li>Use an Attestation Status List mechanism specified per VCR_11, or</li><li>Use an Attestation Revocation List mechanism specified per VCR_11.</li></ul> <br>Note: The 24-hour period originates from the relevant ETSI specifications. These require that the process of revocation must take at most 24 hours. Consequently, revocation makes no sense if the attestation is valid for less than 24 hours, because it will reach the end of its validity period before it is revoked. |
| VCR_02 | For non-qualified EAAs, the relevant Rulebook SHALL determine whether that type of EAA must be revocable. If a non-qualified EAA type must be revocable, the relevant Rulebook SHALL determine which of the methods mentioned in VCR_01 must be implemented by the relevant EAA Providers for the revocation of such an EAA. |
| VCR_03 | If a PID or attestation is revocable, the PID Provider of a given PID, or the Attestation Provider of a given attestation, SHALL be the only party in the EUDI Wallet ecosystem capable of executing the revocation of that PID or attestation. Similarly, if a WUA is revocable, the Wallet Provider of a given WUA SHALL be the only party in the EUDI Wallet ecosystem capable of executing the revocation of that WUA. <p><br>Note: A PID Provider, Attestation Provider or Wallet Provider MAY outsource the operation of the revocation process to a third party. |
| VCR_04 | A PID Provider, Attestation Provider or Wallet Provider that revoked a PID or attestation SHALL NOT reverse the revocation. |
| VCR_05 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHALL have a policy specifying under which conditions a PID, attestation, or WUA it issued will be revoked or suspended. |
| VCR_06 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHALL revoke a PID, attestation, or WUA when its security has been compromised. |
| VCR_07 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHOULD revoke a PID, attestation, or WUA upon the explicit request of the User. |
| VCR_08 | If a PID is revocable, the PID Provider SHALL revoke a PID upon the death of the User or cease of activity of the legal person who is the subject of the PID. |
| VCR_09 | If a PID, attestation, or WUA is revocable, the PID Provider, Attestation Provider or Wallet Provider SHALL revoke a PID, attestation, or WUA if the value of one or more attributes in the PID, attestation, or WUA was changed and it is still valid for at least 24 hours. In this situation, the PID Provider, Attestation Provider, or Wallet Provider SHALL issue a new PID, attestation, or WUA with the correct value for the changed attribute. |
| VCR_10 | Wallet Providers SHALL implement the attestation revocation mechanisms specified per VCR_11 in their Wallet Solution(s). |
| VCR_11 | The Commission SHALL create or reference technical specifications providing all necessary details for PID Providers, Attestation Providers, and Wallet Providers to implement an Attestation Status List mechanism or an Attestation Revocation List mechanism for the PIDs, attestations, and WUAs they issue. These technical specifications SHALL also contain all details necessary for Relying Party Instances, Relying Parties and Wallet Units interacting with other Wallet Units to use these mechanisms to verify the revocation status of PIDs, attestations, and WUAs. <p><br>Note: 'Attestation Status List' and 'Attestation Revocation List' are specific mechanisms, defined in Annex 1. Attestation Revocation Lists are sometimes referred to as 'Identifier Lists'. |
| VCR_12 | If a Relying Party decides it needs to verify the revocation status of a PID, or attestation, it SHALL support both the Attestation Status List mechanism and the Attestation Revocation List mechanism specified per VCR_11. <p><br>Note: Per VCR_13, it is not mandatory for a Relying Party to verify whether a PID, or attestation is revoked. |
| VCR_13 | A Relying Party SHOULD verify the revocation status of a PID, attestation, or WUA upon obtaining it from a Wallet Unit, following the steps specified per VCR_11. |
| VCR_14 | When no reliable information regarding the revocation status of a PID, attestation or WUA is available, a Relying Party SHOULD perform a risk analysis considering all relevant factors for the use case, before taking a decision to accept or refuse the PID, attestation or WUA. |

#### A.2.3.8 Topic 8 - Design Solutions on Data Sharing scenarios 

There are no HLRs for this Topic.

#### A.2.3.9 Topic 9 - Wallet Unit Attestation

<b>Note to this Topic in version 1.5.0: The Commission received many comments on the ideas described in this topic, particularly relating to key association. In reponse, the Commission decided to add the Wallet Unit Attestation to the list of open topics that need further discussion before publication of ARF 2.0. In these discussions, also the topic of key association will be discussed. In anticipation of the outcome of these discussions, nothing was changed in this Topic apart from some clarifications. In addition, changes were made to align the text with the Implemented Acts. In particular, the terms 'WTE' and 'WIA' were replaced by 'WUA'. Some further changes were needed to avoid creating contradictions, for instance, in places where 'WTE' and 'WIA' were both mentioned in a single sentence. Also, some changes were made to explain that the WUA fulfills two separate roles, namely the old WTE role and the old WIA role.</b>

*Short description*

When a PID Provider or Attestation Provider receives a request from a
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
information. This object is called the Wallet Unit Attestation (WUA). The
WUA also contains a public key. By including this public key in the WUA, the
Wallet Provider attests that the corresponding private key is protected
by a certified WSCA/WSCD that has the properties and security posture
described in the WUA. Note that the information about the Wallet Unit and the WSCA(s) is selectively disclosable, meaning that the Wallet Unit can release the WUA either with or without this information.

The PID Provider or Attestation Provider then asks
that WSCA to create a key pair for its new PID or attestation, and to
prove that this new key is associated with the key in the WUA.
Key association primarily means that the PID or attestation private key is
protected by the same WSCA as the WUA private key. A full description of
the concept of key association is given in a forthcoming White Paper. Therefore, the PID Provider or Attestation
Provider can be sure that the security level of the new PID or
attestation key is the same as the security level of the WUA key. At the
moment of writing this version of the ARF, it is not fully clear how
many WSCDs will support the cryptographic functionalities necessary to
generate a proof of association. Therefore, the creation of a proof of
association in a WSCA is recommended (SHOULD), not required (SHALL). In
this way, once a Wallet Unit includes a WSCD/WSCA that supports
the required cryptographic functionalities, proofs of association can be
used as described in this Topic.

Please note that the scope of this Topic is limited to the question
of how the WUA is issued during Wallet Unit activation and how it is
used during attestation issuance. The role played by the WUA during the
release of an attestation to a Relying Party is discussed in [Topic 18](#a2318-topic-18---relying-party-handling-eudi-wallet-attribute-combined-presentation)
(Combined presentation of attributes).
.
For more information, see the White Paper that
will be published in the same repository as the ARF

*High level requirements*

A.  Creating the WUA during Wallet Unit activation

| **Index** | **Requirement** |
|-----------|--------------|
| WUA_01 | A Wallet Provider SHALL have to activate a new Wallet Unit before a User can use it to obtain an attestation. |
| WUA_02 | A WSCA SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or of a PID or an attestation in a Wallet Unit. For a PID key (which is part of the EUDI Wallet eID means), this WSCA SHALL be certified to be compliant with applicable requirements for level of assurance "high" in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. |
| WUA_03 | A Wallet Unit SHALL authenticate the User before performing any operation excluding cryptographic operations. The Wallet Unit MAY rely on a WSCA to do so, but MAY also rely on other components, in particular the Wallet Instance. <br>Note: Cryptographic operations can only be performed by the WSCA after User authentication according to WUA_02. |
| WUA_04 | For a Wallet Unit containing a natural-person PID, the User mentioned in WUA_02 and WUA_03 SHALL be the natural person who is the subject of that PID. |
| WUA_05 | For a Wallet Unit containing a legal-person PID, the User mentioned in WUA_02 and WUA_03 SHALL be a natural person appointed by the legal person who is the subject of that PID. <br><br>Note: This requirement does not imply that the actions of a legal-person Wallet Unit cannot be automated, or that the person(s) controlling the Wallet Unit must authenticate every time the Wallet Unit presents an attestation or creates a seal. The intent is that every operation performed by the legal-person Wallet Unit is performed under the responsibility of a natural person. |
| WUA_06 | A Wallet Provider SHALL only activate a new Wallet Unit if it has verified that: <ul><li>The Wallet Unit includes at least one WSCA that is certified to be compliant with applicable requirements in this Topic, for level of assurance "high". In addition, the Wallet Unit MAY include one or more other WSCAs.</li><li>The private key corresponding to the public key in the WUA (see WUA_07) is protected by the respective WSCA.</li></ul> |
| WUA_07 | During the activation of a new Wallet Unit, a Wallet Provider SHALL sign at least one Wallet Unit Attestation and issue it to the Wallet Unit. |
| WUA_08 | The Commission SHALL take measures to ensure that the contents, format and encoding of the Wallet Unit Attestation is specified in a technical specification. This technical specification SHALL be a Rulebook complying with all requirements in [Topic 12](#a2312-topic-12---attestation-rulebooks). Each WUA SHALL describe the Wallet Unit and a certified WSCA included in that Wallet Unit, in such a way that a PID Provider or Attestation Provider processing the WUA is able to take a well-grounded decision on whether to issue an attestation to that Wallet Unit. <br><br>Note: In general, a PID Provider or Attestation Provider will also need information about the User. Such information is not contained in the WUA. |
| WUA_09 | A Wallet Provider SHALL consider all relevant factors, including the risk of a WUA public key becoming a vector to track the User, when deciding on the validity period of a WUA. A Wallet Provider MAY use short-lived WUAs to mitigate such risks. |
| WUA_10 | A WSCA SHALL generate a new key pair for a new WUA on request of the Wallet Provider via the Wallet Instance. The WSCA SHALL register the new key as a WUA key in an internal registry. The WSCA SHALL register the WUA key as an independent (i.e., non-associated) key in an internal registry. <p><br>Note: A WUA key can be associated later with a PID or attestation key when that PID or attestation key is created, see WUA_13. |
| WUA_11 | A WUA SHALL contain a public key, and the corresponding private key SHALL be generated by the WSCA described in the WUA. <p><br>Note: A WUA key pair is generated as per WUA_10. |
| WUA_12 | In case the Wallet Provider must update the WUA because the information in the WUA is outdated, the Wallet Provider SHALL ensure that the Wallet Unit only releases the latest version of a WUA to an Attestation Provider. |


B.  Using the WUA during issuance of an attestation

| **Index** | **Requirement** |
|-----------|--------------|
| WUA_13 | During PID or attestation issuance, a WSCA SHALL generate a new key pair for a new PID or attestation, on request of the PID Provider or Attestation Provider via the Wallet Instance. The PID Provider or Attestation Provider SHALL indicate a single WUA public key (see WUA_10) with which the new PID or attestation key must be associated. This indication can either be direct, by providing the WUA public key value, or indirect, by providing a public key value that has been associated with the WUA key previously. In the latter case, the WSCA SHALL look up the associated WUA key in its internal registry. <br><br>The WSCA SHALL register the new key in an internal registry as an attestation key. The WSCA SHALL register the association between the new private key and the WUA private key in an internal registry. <br><br>Notes: <ul><li>Direct indication of the WUA is used in case a PID Provider or Attestation Provider indicates during issuing that the new PID or attestation must be associated with a WUA public key, see WUA_15 and WUA_16.</li><li>Indirect indication of the WUA key is used in case an Attestation Provider indicates during issuing that the new attestation must be associated with an existing PID or attestation, see WUA_16.</li><li>In case of re-issuance of an existing (short-lived) PID or attestation, or in case of synchronous issuing in a remote HSM architecture, re-use of an existing key pair for the new PID or attestation may be acceptable and it may not be necessary to generate a new key pair for each new PID or attestation. Requirements regarding re-issuance processes will be added in a future version of this document.</li></ul> |
| WUA_14 | During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to the new PID or attestation public key, on request of the PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key. |
| WUA_15 | A PID Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new PID must be associated. This SHALL be a WUA public key. |
| WUA_16 | An Attestation Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new attestation must be associated. This SHALL be either a WUA public key or the public key of a PID or attestation that already exists in the Wallet Unit. <p><br>Note: if the Attestation Provider indicates a PID or attestation public key, this is an indirect indication of a WUA key, see WUA_13. |
| WUA_17 | During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to a WUA public key on request of a PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key. |
| WUA_18 | During PID or attestation issuance, a WSCA SHOULD generate a proof of association for two or more public keys on request of the PID Provider or Attestation Provider.  The WSCA SHALL generate this proof only if the corresponding private keys are protected by the same WSCA and the WSCA has internally registered an association between these private keys. <br><br>Notes: <ul><li>It is possible that some private keys in a WSCA are not associated with each other, even though they are managed within the same WSCA.</li><li>If two keys are associated, this implies that they are both associated with the same WUA key. The concept of associated keys is explained in the forthcoming White Paper.</li></ul> |
| WUA_19 | During PID or attestation issuance, the PID Provider or Attestation Provider SHALL verify that: <ul><li>The WSCA described in the WUA received from the Wallet Unit has proven possession of the private key corresponding to the public key in the WUA (see WUA_17),</li><li>The WSCA has proven possession of the new PID or attestation private key (see WUA_14)</li></ul> In addition, the PID Provider or Attestation Provider SHOULD verify that: <ul><li>The WSCA has proven association (see WUA_18) between the new PID or attestation public key and the public key requested by the PID Provider or Attestation Provider according to WUA_15 or WUA_16.</li></ul> <br>Notes: <ul><li>See also WUA_13.</li><li>These three proofs MAY be implemented as a single cryptographic proof.</li></ul> |
| WUA_20 | During PID or attestation issuance, a Wallet Unit SHALL provide the PID Provider or Attestation Provider with information on all WSCAs it is able to use for private key management and that comply with the PID Provider's or Attestation Provider's requirements. |
| WUA_21 | During PID or attestation issuance, a Wallet Unit SHALL provide the PID Provider or Attestation Provider with the WUA describing the properties of the WSCA that generated the new PID or attestation private key and protects it. |
| WUA_22 | If a Wallet Unit contains multiple WSCAs, it SHALL register which PIDs and attestations are bound to each of these WSCAs. |

C.  Miscellaneous 

| **Index** | **Requirement** |
|-----------|--------------|
| WUA_23 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a WUA to a PID Provider or Attestation Provider. |
| WUA_24 | A Wallet Unit SHALL release data related to the User device in a WUA only to a PID Provider or Attestation Provider, and not to a Relying Party or any other party. <br><br>Note: The reason for this requirement is that the Relying Party does not need to know anything about the User's device. This is explained in the last bullet point in section 6.6.3.5 of the main ARF document. Therefore, such data must not be released to Relying Parties, as doing so might violate User privacy|
| WUA_25 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer the proofs of association and possession mentioned in WUA_19 to a PID Provider or Attestation Provider. <p><br>Note: These three proofs MAY be implemented as a single cryptographic proof. |
| WUA_26 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a public key to a PID Provider or Attestation Provider, to be included in the new PID or attestation. |
| WUA_27 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to indicate in the Token Response: <ul><li>the WSCA to which the new PID or attestation key must be bound, for example by referring to a WSCA identifier listed in the WUA</li><li>or, alternatively, the existing PID or attestation public key with which the new credential key must be associated.</li></ul> |

D.  Overview: Requirements for a WSCA

The technical requirements above imply the following requirements for a
WSCA.

| **Index** | **Requirement** |
|-----------|--------------|
| WUA_28 | A WSCA SHALL be able to verify the authentication factors of a User, in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. |
| WUA_29 | A WSCA SHALL be able to generate a new key pair on request of the Wallet Instance. |
| WUA_30 | A WSCA SHALL be able to prove possession of the private key corresponding to a public key on request of a Wallet Instance, for example by signing a challenge with that private key. |
| WUA_31 | A WSCA SHALL register each newly generated key pair as either a WUA key or an attestation key, depending on information provided by the Wallet Instance in the key generation request. The internal registry used by the WSCA for this purpose SHALL be protected against modification by external parties. |
| WUA_32 | A WSCA SHALL protect a private key it generated during the entire lifetime of the key. This protection SHALL at least imply that the WSCA prevents the private key from being extracted in the clear. If a WSCA is able to export a private key in encrypted format, the key used for key encryption SHALL be properly protected, for example as multiple key shares controlled by multiple key custodians. |
| WUA_33 | A WSCA SHALL associate each newly generated attestation key with a WUA key indicated by the Wallet Instance. The WSCA SHALL record the association between these keys in an internal registry, which SHALL be protected against modification by external parties. |
| WUA_34 | For the purposes of WUA_33, a Wallet Instance SHALL indicate the WUA key either directly, by WUA public key value, or indirectly, by value of a public key that is already associated to the intended WUA key. In the latter case, the WSCA SHALL look up the intended WUA key in its registry. |
| WUA_35 | A WSCA SHALL consider two keys to be associated if they are associated to a common WUA key. |
| WUA_36 | A WSCA SHOULD be able to generate a proof of association for two or more public keys. The WSCA SHALL generate such a proof if and only if the corresponding private keys are protected by that WSCA, and the WSCA has internally registered an association between these private keys. |

#### A.2.3.10 Topic 10 - Issuing a PID or Attestation to a Wallet Unit 

**Also containing Topic 23 - PID issuance and Attestation issuance**

*Short description*

PID Providers and Attestation Providers issue PIDs and attestations to
Wallet Units. This Topic lists the high-level technical
requirements related to PID and attestation issuance.

*High level requirements*

A - Generic HLRs

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_01 | Wallet Providers SHALL ensure that their Wallet Solution supports the OpenID4VCI protocol specified in [OpenID4VCI], with additions and changes as documented in this Annex (see e.g. this Topic and [[Topic 9](#a239-topic-9---wallet-trust-evidence)]) and in future technical specifications created by or on behalf of the Commission. |
| ISSU_02 | Wallet Providers SHALL ensure that their Wallet Solution supports the attestation formats specified in: <ul><li>ISO/IEC 18013-5, see [ISO18013-5].</li><li>"SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC].</li></ul> with additions and changes as documented in this Annex and in future technical specifications created by or on behalf of the Commission. |
| ISSU_03 | Wallet Providers SHALL ensure that their Wallet Solution supports the presentation protocols specified in: <ul><li>ISO/IEC 18013-5, see [ISO18013-5].</li><li>OpenID for Verifiable Presentations, see [OpenID4VP].</li></ul> with additions and changes as documented in this Annex and in future technical specifications created by or on behalf of the Commission. |
| ISSU_04 | The OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable PID Providers and Attestation Provider to issue to a Wallet Unit a batch of multiple PIDs or attestations that are simultaneously valid and contain the same attributes. |
| ISSU_05 | A Wallet Unit SHALL support a process to activate a newly issued PID, in accordance with [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) Section 2.2.2. The goal of the activation process is to verify that the PID was delivered into the Wallet Unit and WSCA of the User to whom it belongs. The Wallet Unit SHALL NOT allow a User to use a non-activated PID. <br><br>Note: This requirement is not applicable for QEAAs, PuB-EAAs or non-qualified EAAs, since these are not identity means in the sense of Commission Implementing Regulation (EU) 2015/1502.|
| ISSU_06 | After a Wallet Unit receives a PID or an attestation from a PID Provider or Attestation Provider, it SHALL verify that the PID or attestation it received matches the request. |
| ISSU_07 | After a Wallet Unit receives a PID from a PID Provider, it SHALL validate the signature or seal of the PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. <br><br>Note: This signature validation may not be useful in architectures where the Wallet Provider is also the PID Provider and the validation of the PID signature would be done by the same component (namely, a remote HSM) that created the signature. However, in such a situation, additional measures SHALL be taken to ensure that any errors in the PID issuance process will be detected.|
| ISSU_08 | After a Wallet Unit receives a QEAA from a QEAA Provider, it SHALL validate the qualified signature or seal of the QEAA in accordance with Art.32 of the eIDAS Regulation. For the verification, the Wallet Unit SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. |
| ISSU_09 | After a Wallet Unit receives a PuB-EAA from a PUB-EAA Provider, it SHALL validate the qualified signature or seal of the PuB-EAA in accordance with Art.32 of the eIDAS Regulation. For that verification, the Wallet Unit SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature or seal. The Wallet Unit SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. Finally, the Wallet Unit SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| ISSU_10 | After a Wallet Unit receives a non-qualified EAA from an EAA Provider, it SHALL validate the signature or seal of the EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. <br><br>Notes: <ul><li>Requirements ISSU_07 to ISSU_10 are equivalent to requirements OIA_12 to OIA_15 in [[Topic 1](#a231-topic-1---accessing-public-and-private-online-services-with-eudi-wallet)]. These requirements imply that a Wallet Instance must be aware whether the attestation it is requesting from an issuer is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. These requirements also imply that the Wallet Unit must store trust anchors in such a way that, when it receives an issued attestation, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs.</li><li>PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, before requesting an unqualified attestation, a Wallet Unit may need to verify that the unqualified EAA Provider is authorized or registered to issue this type of attestation. Mechanisms allowing to do this may be defined in the applicable Rulebook.</li>|
| ISSU_11 | A Wallet Unit SHALL request the User's approval before storing a PID or attestation obtained from a PID Provider or Attestation Provider. When requesting approval, the Wallet Instance SHALL show the contents of the PID or attestation to the User. The Wallet Instance SHALL also inform the User about the identity of the PID Provider or Attestation Provider, using the subject information in the PID Provider's or Attestation Provider's access certificate. |
| ISSU_11b | In case one or more of the verifications in ISSU_06 – ISSU_11 fail, the Wallet Unit SHALL immediately delete the attestation it received. The Wallet Instance SHALL notify the User about the fact that issuance of the attestation was not successful, including the reason for this failure. | 
| ISSU_12 | When a User instructs their Wallet Unit to request a PID or attestation from a PID Provider or Attestation Provider, the Wallet Unit SHALL request that PID or attestation in all formats supported by the PID Provider or Attestation Provider in accordance with the PID Rulebook or the applicable Attestation Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. <p><br>Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT format specified in [SD-JWT VC]. |

B - HLRs for PID issuance

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_13 | A Wallet Provider SHALL ensure that at least one PID Provider is willing to issue a PID complying with [PID Rulebook] to Users of the Wallet Units it provides. |
| ISSU_14 | A PID Provider SHALL ensure that all PIDs it issues to Wallet Units comply with the requirements specified in [PID Rulebook]. |
| ISSU_15 | A PID Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing PIDs. |
| ISSU_16 | A PID Provider SHALL NOT provide the same set of values for mandatory PID attributes for more than one User. <p><br>Note: With the contents of the PID as currently described in [PID Rulebook], complying with this requirement may not be possible. If this turns out to be so, [PID Rulebook] will be changed. |
| ISSU_17 | A PID Provider SHALL implement device binding for all PIDs it issues, meaning it SHALL ensure that a PID is cryptographically bound to a WSCA included in the Wallet Unit, as specified in requirement WUA_13 in [[Topic 09](#a239-topic-9---wallet-trust-evidence)]. <p><br>Note that device binding is called mdoc authentication in [ISO/IEC 18013-5] and key binding in [SD-JWT-VC]. |
| ISSU_18 | A PID Provider SHALL verify the identity of the User in compliance with Level of Assurance (LoA) High requirements. |
| ISSU_19 | For the verification of a WUA, a PID Provider SHALL accept the trust anchors in the Wallet Provider Trusted List(s) it needs. <br>Notes: <ul><li>Wallet Provider Trusted Lists are explained in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].</li><li>It is not mandatory for a PID Provider to accept all Wallet Provider Trusted Lists, if there are multiple. This is because it is not mandatory for a PID Provider to accept all certified Wallet Solutions in the EUDI Wallet ecosystem. Each PID Provider will choose which Trusted Lists they need to subscribe to.</li></ul> |
| ISSU_19b | A PID Provider SHALL support at least one Wallet Solution, meaning that it is willing and able to issue a PID to a Wallet Unit on request of the User. 
| ISSU_20 | To inform its potential PID Users about the Wallet Solution(s) they can use for requesting a PID, a PID Provider SHALL publish a list of supported Wallet Solutions in such a way that Users can easily find it, for example on the PID Provider's website. |
| ISSU_21 | Before issuing a PID, a PID Provider SHALL: <ul><li>verify that the Wallet Provider mentioned in the Wallet Unit's WUA is present in a Wallet Provider Trusted List.</li><li>authenticate and validate the WUA using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List.</li><li>Verify that the Wallet Units's WUA is not revoked.</li></ul> <br>Note: For the WUA, see [[Topic 9](#a239-topic-9---wallet-trust-evidence)] and [[Topic 38](#a2338-topic-38---wallet-instance-revocation)]. |
| ISSU_22 | A PID Provider SHALL include its PID Provider access certificate in its Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01. |
| ISSU_23 | For the verification of PID Provider access certificates, a Wallet Unit SHALL accept the trust anchors in the Trusted List(s) of PID Provider Access CAs it needs. <br>Notes: <ul><li>PID Provider Access CA Trusted Lists are explained in [[Topic 27](#a2327-topic-27---relying-party-registration)].</li><li>It is not mandatory for a Wallet Unit to accept all PID Provider Access CA Trusted Lists, if there are multiple. Wallet Providers will choose which Trusted Lists they need to subscribe to, for example depending on the Member State(s) they are operating in.</li></ul> |
| ISSU_23b | A Wallet Provider SHALL support at least one PID Provider, meaning that its Wallet Units SHALL be capable of requesting the issuance of a PID from these PID Provider(s), and that the Wallet Provider has agreed with the PID Provider(s) that the PID Provider(s) will process such a request according to the agreed rules and procedures. |
| ISSU_23c | Prior to or during installation of a Wallet Unit, the Wallet Provider SHALL notify the User about the PID Provider(s) that are supported by the Wallet Unit. |
| ISSU_24 | A Wallet Unit SHALL authenticate and validate the PID Provider access certificate before requesting the issuance of a PID. The Wallet Unit SHALL verify at least that: <ul><li>The access certificate indicates that its subject is a PID Provider,</li><li>The access certificate is authentic and is valid at the time of validation, and</li><li>The Issuer of the access certificate is a CA that is in a PID Provider Access CA Trusted List.</li></ul> <br>Note: The PID Provider Access CA Trusted List is not the same as the PID Provider Trusted List mentioned in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. |

C - HLRs for Attestation Issuance

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_25 | An Attestation Provider SHALL ensure all attestations issued to Wallet Units comply with the requirements specified in the applicable Rulebook, as described in [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. |
| ISSU_26 | An Attestation Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing attestations. |
| ISSU_27 | An Attestation Provider SHALL implement device binding for all attestations it issues, meaning it SHALL ensure that an attestation is cryptographically bound to a WSCA included in the Wallet Unit, as specified in requirement WUA_13 in [[Topic 9](#a239-topic-9---wallet-trust-evidence)]. <p><br>Note that device binding is called mdoc authentication in [ISO/IEC 18013-5] and key binding in [SD-JWT-VC]. |
| ISSU_28 | For the verification of a WUA, an Attestation Provider SHALL accept the trust anchors in all Wallet Provider Trusted Lists.<br><br>Note: Wallet Provider Trusted Lists are explained in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. |
| ISSU_29 | A QEAA Provider or Pub-EAA Provider SHALL support all Wallet Solutions, meaning that they SHALL NOT discriminate between Wallet Solutions when processing a request for the issuance of an attestation. |
| ISSU_30 | Before issuing an attestation, a QEAA Provider or Pub-EAA Provider SHALL: <ul><li>verify that the Wallet Provider mentioned in the Wallet Unit's WUA is present in a Wallet Provider Trusted List.</li><li>authenticate and validate the WUA using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List.</li><li>Verify that the Wallet Unit's WUA is not revoked.</li></ul> <br>Note: For the WUA, see [[Topic 9](#a239-topic-9---wallet-trust-evidence)] and [[Topic 38](#a2338-topic-38---wallet-instance-revocation)]. |
| ISSU_31 | Before issuing an attestation, an EAA Provider SHOULD: <ul><li>verify that the Wallet Provider mentioned in the Wallet Unit's WUA is present in a Wallet Provider Trusted List.</li><li>authenticate and validate the WUA using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List.</li><li>Verify that the Wallet Unit's WUA is not revoked.</li></ul> |
| ISSU_32 | An Attestation Provider SHALL include its Attestation Provider access certificate in its Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01. |
| ISSU_33 | For the verification of Attestation Provider access certificates, a Wallet Unit SHALL accept the trust anchors in all Attestation Provider Access CA Trusted List(s). <br><br>Note: Attestation Provider Access CA Trusted Lists are explained in [[Topic 27](#a2327-topic-27---relying-party-registration)]. There may be separate Access CA Trusted Lists for QEAA Providers, PuB-EAA Providers, and EAA Providers. |
| ISSU_33b | A Wallet Provider SHALL support all QEAA Providers and Pub-EAA Providers, meaning that its Wallet Units SHALL be capable of requesting the issuance of a QEAA or PuB-EAA from these Providers at the User's request. | 
| ISSU_34 | A Wallet Unit SHALL authenticate and validate the Attestation Provider access certificate before requesting the issuance of an attestation. The Wallet Unit SHALL verify at least that: <ul><li>The access certificate indicates that its subject is a QEAA Provider, Pub-EAA Provider, or EAA Provider.</li><li>The access certificate is authentic and is valid at the time of validation.</li><li>The Issuer of the access certificate is a CA that is in the Attestation Provider CA Trusted List, as documented in [[Topic 27](#a2327-topic-27---relying-party-registration)].</li></ul> <br>Note: PID Providers, QEAA Providers, and PuB-EAA Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations (or PIDs) that they are not legally allowed to issue. This trust is warranted since these kinds of providers operate within a regulated framework and are regularly audited. However, non-qualified EAA Providers are unregulated and may not be completely trustworthy. Therefore, before requesting an EAA from a non-qualified EAA Provider, a Wallet Unit may need to verify that that EAA Provider is authorized or registered to issue the type of EAA the Wallet Unit is requesting. Such verification requirements, as well as the mechanisms allowing to do this, may be defined in the applicable Rulebook. |

>  

#### A.2.3.11 Topic 11 - Pseudonyms  

*Short description*

<b>Note to this Topic in version 1.5.0: The Commission received many comments on the Pseudonym Rulebook. In response, it decided to not publish the latest version of this Rulebook on the public GitHub repository for ARF 1.4.0. For ARF version 1.5.0, the Commission decided to drop the Pseudonym Rulebook and remove all references to it. Instead, Wallet Units will support generating pseudonyms for Users in compliance with the W3C WebAuthn API specification, [W3C WebAuthn]. 

Moreover, pseudonyms were added to the list of topics to be discussed for ARF 2.0. These discussions will include the use cases for which Wallet Units must support pseudonyms and the way in which this support will be technically implemented. This Topic will be updated in ARF 2.0.</b>

*High level requirements*

| **Index** | **Requirement specification** |
|-----------|--------------|
| PA_01 | A Wallet Unit SHALL be able to generate pseudonyms for its User, in compliance with the W3C WebAuthn API specification [W3C WebAuthn]. |

#### A.2.3.12 Topic 12 - Attestation Rulebooks  

*Short description*

This Topic describes the high-level requirements (HLR) for the
Attestation Rulebooks that will specify the details of new types of
attestations, including QEAAs, PuB-EAAs, and non-qualified EAAs. The
goal of this Topic is to ensure that all Rulebooks that will be written
in the future will contain the same type of information and the same
level of detail, such that all attestations are interoperable.

*High level requirements*

A.  Requirements regarding attestation formats

| **Index** | **Requirement specification** |
|-----------|--------------|
| ARB_01 | The body responsible for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL specify that one or more of the following common format(s) must be used for these attestations: <ul><li>The format specified in ISO/IEC 18013-5, see [ISO18013-5].</li><li>The format specified in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC].</li></ul> |
| ARB_01a |The body responsible for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify that one or more of the following common format(s) must be used for these attestations:<ul><li>The format specified in ISO/IEC 18013-5, see [ISO18013-5].</li><li>The format specified in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC].</li><li>The format specified in “W3C Verifiable Credentials Data Model”, see [W3C VCDM v1.1] or [W3C VCDM v2.0].</li></ul>|
| ARB_02 | The body responsible for an Attestation Rulebook SHALL analyse whether it must be possible for a User to present that type of attestation when the Wallet Unit and the Relying Party are in proximity and attestations are presented without using the internet. If so, the Attestation Rulebook SHALL specify that the attestations must be issued in the ISO/IEC 18013-5-compliant mdoc format. <br><br>Note: In theory, it is possible to use SD-JWT VC-compliant attestations in proximity use cases. In practice, however, the only protocol available to request and release SD-JWT VC-compliant attestations between a Wallet Unit and a Relying Party Instance is OpenID4VP. That protocol cannot be used without internet connectivity. |
| ARB_03 | The body responsible for an Attestation Rulebook MAY specify in the Attestation Rulebook that that type of attestation must be issued in the [SD-JWT VC]-compliant format, provided the [SD-JWT VC] specification has been approved by an EU standardization body or by the European Digital Identity Cooperation Group established pursuant to Article 46e(1) of the Regulation.|
| ARB_04 | The body responsible for an Attestation Rulebook MAY specify in the Attestation Rulebook that that type of attestation must be issued in a format compliant with [W3C VCDM v1.1] or [W3C VCDM v2.0], provided it references a document specifying in detail how a Relying Party can request attributes from a such an attestation, and how a User can selectively disclose attributes from such an attestation. This is provided these documents have been approved by an EU standardization body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the Regulation |

B.  Requirements regarding attestation types

| **Index** | **Requirement specification** |
|-----------|--------------|
| ARB_05 | The body responsible for an Attestation Rulebook SHALL specify a value for the attestation type, which SHALL be unique within the scope of the EUDI Wallet ecosystem. <br><br>Notes:<ul><li>In ISO/IEC 18013-5, the attestation type is called ‘document type’ and is included as a “docType” key-value pair in both the mdoc request and the mdoc response. Also, a method for generating unique attestation type values is recommended.</li></li><li>In OpenID4VP, the attestation type is included in the “id” property of an Input Descriptor in a Presentation Request.</li><li>In SD-JWT VC, the attestation type is called ‘SD-JWT VC type’ and is included as a ‘vct’ claim in the SD-JWT.</li></ul>|

C.  Requirements regarding attestation namespaces


| **Index** | **Requirement specification** |
| -----| --------|
| ARB_06 |The body responsible for an Attestation Rulebook SHALL define all attributes that an attestation of that type may contain. This definition SHALL first describe the semantics of each attribute in an encoding-independent manner, and SHALL subsequently specify whether this attestation must be encoded in an ISO/IEC-compliant format, an SD-JWT VC-compliant format, or both: <ul><li>For ISO/IEC 1803-5-compliant attestations, each attribute SHALL be defined within an attribute namespace. An attribute namespace SHALL fully define the identifier, the syntax, and the semantics of each attribute within that namespace. An attribute namespace SHALL have an identifier that is unique within the scope of the EUDI Wallet ecosystem, and each attribute identifier SHALL be unique within that namespace.</li><li>For [SD-JWT VC]-compliant attestations, all claim names SHALL either be included in the IANA registry for JWT claims or be a Public Name as defined in RFC 7519.</li></ul> Notes:<ul><li>In ISO/IEC 18013-5, namespaces are discussed and a method for generating unique namespace identifiers is recommended.</li><li>[SD-JWT VC] does not discuss how to avoid conflicting claim names. Since SD-JWTs are a special kind of JWTs, the methods specified in RFC 7519 are applicable.</li><li>The different treatment of namespaces in both standards is reflected in the examples in the OpenID4VP specification, where an explicit namespace is used for the examples where an ISO/IEC 1803-5-compliant attestation is requested, but no namespace is used when a SD-JWT VC-compliant attestation is requested.</li></ul>|
| ARB_07 | When determining the attributes to be included in a new attestation type, the party responsible for the applicable Attestation Rulebook SHOULD consider referring to attributes that are already included in the catalogue as specified in [Topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabulary-for-attestation-attributes) + [26](#a2326-topic-26---attestations-catalogue), rather than unnecessarily re-defining all attributes within a new namespace.|
| ARB_08 | The body responsible for an Attestation Rulebook SHOULD, when specifying a new attribute, take into consideration existing conventions for attribute identifier values and attribute syntaxes. These conventions MAY depend on the format of the attestation, i.e., CBOR for ISO/IEC 18013-5 compliant attestations or JSON for [SD-JWT VC]-compliant attestations.|
| ARB_09 | Empty |
| ARB_10 | The body responsible for an Attestation Rulebook for an ISO/IEC 18013-5 compliant attestation MAY define a domestic namespace to specify attributes that are specific to that Rulebook and are not included in the applicable EU-wide or sectoral namespace. All requirements for namespaces in this Topic also apply for domestic namespaces |
| ARB_11 | The body responsible for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook an attribute as meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point a) and [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point a) of the Regulation. This  attribute SHALL reference the technical specification meant in ARB_25. |
| ARB_12 | The body responsible for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include an attribute in the Rulebook indicating that the attestation in an EAA. This attribute SHALL reference the technical specification meant in ARB_25. |
| ARB_13 | The body responsible for an Attestation Rulebook describing a type of attestation that is a QEAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point b) of the Regulation. |
| ARB_14 | The body responsible for an attestation Rulebook describing a type of attestation that is a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point b) of the Regulation. |
| ARB_15 | The body responsible for an Attestation Rulebook describing  a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point b) of the Regulation. |
| ARB_16 | The body responsible for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL  include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point c) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e46-55-1) point c) of the Regulation.|
| ARB_17 | The body responsible for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point c) of the Regulation. |
| ARB_18 | The body responsible for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL  include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point e) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point e) of the Regulation.|
| ARB_19 | The body responsible for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point e) of the Regulation. |
| ARB_20 | The body responsible for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata  representing the location meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point h) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point h) of the Regulation. This location SHALL indicate at least the URL at which or via which a machine-readable version of the contents of a Trusted List of QEAA or PuB-EAA Providers can be found or looked up. |
| ARB_21 | The body responsible for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes representing the location meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point h) of the Regulation. If  present, this location SHALL indicate at least the URL at  which or via which a machine-readable version of the  contents of a Trusted List of EAA Providers can be found or looked up. |

D.  Miscellaneous requirements

| **Index** | **Requirement specification** |
|-----------|--------------------|
| ARB_22 | The body responsible for an Attestation Rulebook SHALL specify all technical details necessary to ensure interoperability, security, and privacy (including, possibly, an embedded disclosure policy as defined in [Topic 43](#a2343-topic-43---embedded-disclosure-policy)), of that attestation. |
| ARB_23 | The body responsible for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL specify which of the revocation mechanisms specified in [Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation) SHALL be supported by that attestation. |
| ARB_24 | The body responsible for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify whether that type of EAA must be revocable. If an EAA type must be revocable, the relevant Rulebook SHALL determine which of the revocation mechanisms specified in [Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation) SHALL be supported by that attestation. |
| ARB_25 | The Commission SHALL take measures to ensure that the following information is included in a technical specification:                                                           <ul><li>The identifier of the attribute containing the indication meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point a) and [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point a).</li><li>The syntax and semantics of this attribute in case the attestation is a QEAA, in case it is PuB-EAA, and in case it is a non-qualified EAA. </li></ul>   Note: for the reason why a value for non-qualified EAAs must be specified, see ARB_12. |
| ARB_26 | The body responsible for an Attestation Rulebook describing a type of attestation that is an EAA SHOULD define in the Rulebook:  <ul><li>mechanisms allowing a Wallet Unit to verify that the EAA Provider is authorized or registered to issue this type of EAA.</li><li>mechanisms allowing a Relying Party to obtain, in a trustworthy manner, the trust anchor(s) of EAA Providers issuing this type of EAA.</li></ul> |


#### A.2.3.13 Topic 13 - Developing a Wallet Unit architecture based on Secure Element

There are no HLRs for this Topic.

#### A.2.3.14 Topic 14 - Developing a Wallet Unit architecture based on External Token

There are no HLRs for this Topic.

#### A.2.3.15 Topic 15 - Developing a Wallet Unit architecture based on Remote HSM

There are no HLRs for this Topic.

#### A.2.3.16 Topic 16 - Signing documents with a Wallet Unit

*Short description*

A Wallet Unit SHALL enable its User to create qualified electronic
signatures or seals. This goal can be reached by using signature or seal
creation capabilities of the Wallet Unit as a part of a local QSCD,
or by using a remote QSCD managed by a QTSP.

This Topic contains high-level requirements related to the creation of
Qualified Electronic Signatures using a Wallet Unit.

*High level requirements*

A.  Requirement for Wallet Providers

| **Index** | **Requirement specification** |
|-----------|------------|
| QES_01 | Wallet Providers SHALL ensure that each User has the possibility to receive a Qualified Certificate for Qualified Electronic Signature bound to a QSCD. |
| QES_02 | Wallet Providers SHALL ensure that each User has free-of-charge access to a Signature Creation Application which allows the creation of free-of-charge Qualified Electronic Signatures over any data.  Wallet Providers SHALL ensure that: <ul><li>The Signature Creation Application SHALL as a minimum be capable of signing User-provided data.</li><li>The Signature Creation Application SHALL be implemented as part of a Wallet Solution or external to it.</li><li>The Signature Creation Application SHALL be able to generate signatures in formats compliant with QES_08 and QES_12.</li></ul>  Notes: <ul><li>Signature Creation Application (SCA): see definition in the ETSI TS 119 432 standard.</li><li>if the SCA is external to the Wallet Solution, it may be for example a separate mobile application, be hosted remotely, for instance by the QTSP or by a Relying Party.</li></ul>|
| QES_03 | For the use of the qualified certificate referred to in QES_01, Wallet Providers SHALL implement secure authentication and signature/seal invocation capabilities in the Wallet Solution, either as a part of a local QSCD external to the Wallet Solution, or as part of a remote QSCD managed by a QTSP. |
| QES_04 | Wallet Providers SHALL enable their Wallet Units to interface with QSCDs using protocols and interfaces necessary for the implementation of secure authentication and signature or seal functionality. |
| QES_05 | Wallet Providers SHALL enable their Wallet Units to be used for User enrolment to a Remote QES Provider (i.e., a QTSP offering remote QES). |
| QES_06 | Wallet Providers SHALL ensure that their Wallet Solution supports at least one of the following options for remote QES signature creation: <ul><li>remote QES creation through secure authentication to a QTSP signature web portal.</li><li>remote QES creation channelled by the Walle Instance.</li><li>remote QES creation channelled by a Relying Party.</li></ul> |
| QES_07 | Wallet Providers SHALL ensure that a Signature Creation Application embedded in their Wallet Solution supports the Cloud Signature Consortium API Specification v.2.|
| QES_08 | Wallet Providers SHALL ensure that their Wallet Units are able to sign documents based on the following signature formats, either using an internal or an external Signature Creation Application component (SCA):  <ul><li>PAdES (PDF Advanced Electronic Signature) as specified in ETSI EN 319 142-1,</li><li>XAdES (XML Advanced Electronic Signature) as specified in ETSI EN 319 132-1,</li><li>JAdES (JSON Advanced Electronic Signature) as specified in ETSI TS 119 182-1,</li><li>CAdES (CMS Advanced Electronic Signature) as specified in ETSI EN 319 122-1,</li><li>ASiC (Associated Signature Container) as specified in ETSI EN 319 162-1.</li></ul> |
| QES_09 | Wallet Providers SHALL ensure that if a Wallet Unit acts as the signature creation application, it supports at least one of the signature formats mentioned in QES_08. |
| QES_10 | Wallet Providers SHOULD ensure that a Wallet Unit presents the document or data to be signed to the User.|
| QES_11 | Wallet Providers SHALL ensure that a Wallet Unit is able to compute the hash or digest of the document or data to be signed through a Signature Create Application component either internal or external to the Wallet Unit, using relevant standards. |
| QES_12 | Wallet Providers SHALL ensure that a Wallet Unit is able to create the signature value of the document or data to be signed either using a local or a remote signing application. <p><br> Note: a local signing application is on-device. It may either be embedded in the Wallet Unit or be an external application. |
| QES_13 | Wallet Providers SHALL ensure that a Wallet Unit provides a log of transactions of qualified electronic signatures generated by the Wallet Unit, allowing the User to view the history of previously signed data or documents, according to Topic 19. |
| QES_14 | Wallet Providers SHALL ensure that Users will be able to give or refuse consent to the creation of a qualified electronic signature through their Wallet Instance. |
| QES_15 | Wallet Providers SHALL ensure that a Wallet Unit can verify the registration of Qualified Trust Service Providers providing signatures services (in remote signature creation scenarios). |
| QES_16 | Wallet Providers SHOULD ensure that a Wallet Unit supports multiple-signing scenarios where multiple signatories are required to sign the same document or data. |
| QES_17 | Wallet Providers SHALL ensure that Wallet Units provide a signature creation confirmation upon the creation of a qualified electronic signature, informing the User about the outcome of the signature creation process. |
| QES_18 | Wallet Providers SHALL provide at least one default qualified signing service to Users, supported by a Qualified Trust Service Provider (QTSP) offering qualified signature service. |
>  

B.  Requirements for QTSPs

| **Index** | **Requirement specification** |
|-----------|--------------|
| QES_23 | QTSPs providing the remote QES part of a Wallet Solution SHALL support:   <ul><li>ETSI TS 119 431-1 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev.</li><li>ETSI TS 119 431-2 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 2: TSP service components supporting AdES digital signature creation.</li><li>ETSI TS 119 432 - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation, and complies with the remote signing services with Sole Control Assurance Level (SCAL) 2 .</li></ul> |
| QES_24 | Wallet Providers SHALL ensure that a Wallet Solution supporting remote signing supports SCAL2 as defined in CEN EN 419 241-1 (Trustworthy Systems Supporting Server Signing - Part 1: General System Security Requirements), and communicates with the remote signing QTSP as defined in Cloud Signature Consortium API Specification v.2. |

C.  Requirements for the Commission

| **Index** | **Requirement specification** |
|-----------|------------|
| QES_25 | Empty |
| QES_26 | Empty |


#### A.2.3.17 Topic 17 - Identity matching

*Short description*

Users would like to use their PID in their Wallet Unit to access their existing online
account(s), even if their PID attribute values are not
exactly the same as those in their account(s). Users regularly need to log in to cross-border services offered by public sector bodies. Identity matching
enables them to use their Wallet Unit to do so.

*High level requirements*

There are no HLRs for this Topic.

#### A.2.3.18 Topic 18 - Combined presentations of attributes

*Short description*

This Topic discusses the combined presentation of attributes by a Wallet
Instance to a Relying Party. 'Combined presentation' here refers to a
transaction in which the Relying Party requests attributes of the same
User from multiple attestations (PID and/or (Q)EAAs) in a single request
and receives those attributes in a single response. These attestations
can be provided by one or by multiple issuers.

This Topic answers the following questions:

-   How can a Relying Party request for a combined presentation of
    attributes?

-   How can a Wallet Unit receiving such a request present the
    attributes in a combined manner?

-   How can the Relying Party verify the authenticity of all released
    attributes in a combined response?

-   How can the Relying Party verify whether all released attributes
    belong to the same User?

Regarding the last question:

-   The User may be either a natural person or a legal person.

-   However, use cases such as delegation or legal representation, where
    the Relying Party may request attributes that are originally part of
    multiple distinct attributes that do not belong to the same User,
    are not combined presentations and are out of scope of this Topic.

*HLRs*

A.  Functional requirements for ecosystem components

| **Index** | **Requirement** |
|-----------|-----------------|
|  ACP_01 | Wallet Units SHALL support the features in \[ISO18013-5\] and/or \[OpenID4VP\] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_02 | Relying Parties SHOULD support the features in \[ISO18013-5\] and/or \[OpenID4VP\] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_03 | If a Wallet Unit receives a message requesting a combined presentation of attributes, it SHALL process each request in that message separately, according to all relevant specifications, except for possible optimizations. |
| ACP_04 | If (as a result of ACP_03) a Wallet Unit determines it must release multiple attestations to a Relying Party in a combined presentation of attributes, it SHALL request a proof of association between the public keys of these attestations from the WSC. |
| ACP_05 | If (as a result of ACP_04), the Wallet Unit receives a proof of association from the WSCA, it SHALL include this proof in the response message containing the combined presentation of attributes and send it to the Relying Party. |
| ACP_06 | If a Relying Party receives a combined presentation of attributes including a proof of association, it SHOULD verify this proof to validate that the attestations in this presentation belong to the same User. |


B.  Process requirements

| **Index** | **Requirement specification** |
|-----------|----------------|
| ACP_07 | During issuance of a (Q)EAA, an Attestation Provider SHALL be able to request the association of the new (Q)EAA to a PID or another (Q)EAA already existing on the Wallet Unit, provided that the Attestation Provider has verified during the issuance process that the new (Q)EAA indeed belongs to the User of that existing PID or (Q)EAA. <p><br>Note: Also see requirement WUA_13 in \[Epic 09\] |
| ACP_08 | When receiving a combined presentation of attributes, a Relying Party SHOULD NOT refuse any attestation solely because a proof of association between these attestations is absent. |

C.  Miscellaneous

| **Index** | **Requirement specification** |
|-----------|-----------------|
| ACP_09 | The common \[ISO18013-5\] and \[OpenID4VP\] protocols, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a proof of association to a Relying Party. The Commission SHALL take measures to ensure that this is the case. |

#### A.2.3.19 Topic 19 - User navigation requirements (Dashboard logs for transparency) 

*Short description*

In this use case, the User is accessing a dashboard of the
Wallet Unit, which provides a record of all transactions executed through the
Wallet Unit. The User is concerned about data privacy, and thus the
function of a dashboard ensures a higher degree of transparency, privacy
and control of the User over their personal data. 

This Topic lists high-level requirements related to the functions
of such a dashboard.  

*HLRs*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| DASH_01 | A Wallet Provider SHALL enable the User to access a dashboard functionality, either via the Wallet Instance or external to the Wallet Unit. |
| DASH_02 | The Wallet Unit SHALL log all transactions executed through the Wallet Unit, including any transactions that were not completed successfully. This log SHALL include: <ul><li>presentation transactions,</li><li>signature creation transactions (see Topic 16),</li><li>attribute deletion requests sent to a Relying Party (see Topic 48),</li><li>complaints lodged with a Data Protection Authority (see Topic 50).</li></ul> <br>Note: For the data to be logged for an attribute deletion request or a complaint, see Topic 48 and Topic 50, respectively. |
| DASH_02a | The Wallet Unit SHALL retain transactions in the log at least for the time period specified in applicable legislation. If the Wallet Unit must remove transactions from the log, for instance because of size limitations, the Wallet Unit SHALL notify the User via the dashboard before doing so and SHALL instruct the User how to export the transactions that are about to be deleted; see DASH_07.
| DASH_02b | The dashboard SHALL include a functionality to display to the User an overview of all transactions in the log. |
| DASH_03 | For a presentation transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: <ul><li>the date and time of the transaction,</li><li>the corresponding Relying Party or requesting Wallet Unit,</li><li>the document type(s) requested and/or presented</li><li> the identifier of the attribute(s) requested and/or presented.</li></ul>|
| DASH_04 | For a signature creation transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: <ul><li>the date and time of the transaction, </li><li>the document or data signed (where possible)</li></ul> |
| DASH_05 | Empty  |
| DASH_06 | A Wallet Provider SHALL ensure that no transactions included in the log can be altered or deleted. |
| DASH_07 | The dashboard SHALL allow the User to export to a file the details of one or more transactions in the log. |
| DASH_08 | For a natural-person User, a Wallet Instance SHALL provide a User interface. |
| DASH_09 | The User Interface referred to in DASH_08 SHALL display an EU Digital Identity Wallet Trust Mark complying with technical specifications. |
| DASH_10 | The Commission SHALL develop technical specifications for an EUDI Trust Mark referred to in DASH_09. |
| DASH_11 | A Wallet Unit issued to a legal person SHALL allow the legal person to interact with the Wallet Unit in the appropriate interface provided by the Wallet Provider. |

#### A.2.3.20 Topic 20 - Strong User (Customer) Authentication in the context of electronic payments 

*Short description*

This topic deals with the requirement for Strong User (Customer)
Authentication (SCA) in the context of authenticating a User as part of electronic payments.  

Users would like to be able to authenticate themselves during online
payments securely and conveniently using their Wallet Units, so that
they can enjoy a seamless and protected shopping/ payment experience.  

The goal is to implement Strong Customer Authentication (SCA) for
electronic payments, ensuring a high level of security and compliance
with [Article 97 of the PSD2](https://eur-lex.europa.eu/eli/dir/2015/2366/oj#d1e5540-35-1) (and with the future PSD3/PSR).

[Commission Delegated Regulation (EU) 2018/389](https://eur-lex.europa.eu/eli/reg_del/2018/389/oj) lays down the requirements
for strong customer authentication (SCA), which needs to be complied
with when accessing a payment account online and for initiating
electronic payments, or carrying out any action through a remote channel
which may imply a risk of payment fraud or other abuses. The use of the
wallet for SCA will be in full compliance with those requirements.  

In the future, a Wallet Unit could also be used for payments with
Central Bank Digital Currencies.  

*HLRs*

There are no HLRs for this Topic.

#### A.2.3.21 Topic 21 - [Diplomas](https://ec.europa.eu/digital-building-blocks/wikis/display/EDIWCS/EPIC-21-Diplomas+with+EUDI+Wallet) with the EUDI Wallet ecosystem

There are no HLRs for this Topic.

#### A.2.3.22 Topic 22 - Digital Travel Credentials with the EUDI Wallet ecosystem

There are no HLRs for this Topic.

#### A.2.3.23 Topic 23 - PID issuance and (Q)EAA issuance  

*Short description*

See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet).

*HLRs*

*See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet).*

#### A.2.3.24 Topic 24 - User identification in proximity scenarios

*Short description*

In this use case, the User is utilizing the Wallet Unit for
identification purposes in proximity scenarios. The User is concerned
about sharing personal data in proximity, while the User's objectives
include identifying themselves to services requiring User identification
and maintaining control over their personal data sharing. 

This topic lists high-level requirements related to User
identification in proximity use cases where Users utilize their Wallet Units. 

*HLRs*

| **Index** | **Requirement specification** |
|-----------|----------------|
| ProxId_01 | For proximity identification purposes, a Wallet Unit SHALL be able to establish a connection with Relying Party Instances and process their presentation requests in accordance with ISO/IEC 18013-5. |
| ProxId_02 | Empty |
| ProxId_03 | A Wallet Unit SHALL present the corresponding presentation request and the identity of the Relying Party to the User after processing the proximity identification request. |
| ProxId_04 | A Wallet Unit SHALL request its User to approve the disclosure of attributes from their Wallet Unit for proximity identification before disclosing any data. |
| ProxId_05 | A Wallet Unit SHALL transmit the requested User attributes to the requesting Relying Party Instance securely in accordance with technical specifications, according to the agreed common protocols and interfaces, as specified in ISO/IEC 18013-5 for proximity flow. |
| ProxId_06 | Empty |

#### A.2.3.25 Topic 25 - Unified definition and controlled vocabulary for attestation attributes 

*Short description*

[Topic 12](#a2312-topic-12---attestation-rulebooks) that describes the high-level requirements (HLR) for the
minimal requirements Rulebooks that will specify the details of new
types of attestations, including QEAAs, PuB-EAAs, and non-qualified
EAAs, has already touched and defined high-level requirements regarding
the attestation rulebook catalogue.

The following main concepts were defined in [Topic 12](#a2312-topic-12---attestation-rulebooks) and developed in
the current version of [Topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabulary-for-attestation-attributes): 

-   Attestation Rulebooks for QEAAs and PuB-EAAs used within the EUDI
    Wallet ecosystem MAY be registered and published in a publicly
    accessible catalogue.  

-   The Attestation Rulebook catalogue MAY also include Attestation
    Rulebooks for non-qualified EAAs.  

-   The Commission SHALL take measures to establish and maintain the
    Attestation Rulebooks catalogue.  

-   The Attestation Rulebooks catalogue will enable Attestation
    Providers, Relying Parties, and other actors in the EUDI Wallet
    ecosystem to know which attestation types exist, and what are the
    identifiers, syntax and semantics of all attributes are part of the
    attestation, that they may issue, request and receive from a Wallet
    Instance, according to their role in the ecosystem.  

The following points are emphasized: 

-   Registration in the attestation catalogue is not mandatory.  

-   Registration in the attestation catalogue does not create any
    obligation or automatic acceptance by any third party, or
    automatically mean cross-border recognition. 

-   The Attestation Rulebooks catalogue can be the in the same
    environment as for the catalogue of attributes.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|-------------------|
| CAT_01 | The Commission SHALL enable the registration by any entity of all types of attributes used within the EUDI Wallet ecosystem in QEAAs and PuB-EAAs, in a catalogue of attributes. <p><br>Note: The catalogue of attributes MAY contain also attributes used in non-qualified EEAs. <p><br>Note: The catalogue of attributes does need not be a separate catalogue, but rather it could be combined with the Attestation Rulebooks catalogue mentioned in CAT_01. |
| CAT_02 | The Commission will enable self-registration process of attributes in the catalogue of attributes, without pre-approval of the registry, for both public and private entities. |
| CAT_03 | The Commission SHALL make the catalogue of attributes publicly available and machine-readable. <p><br>Note 1: The requirement for availability means setting up the required means for high availability and avoiding a single point of failure. This requirement is applicable also to the Attestation Rulebooks catalogue mentioned in CAT_01. <p>Note 2: See for example the following semantic artifacts, which can be part of the catalogue of attributes: <ul><li>[The ultimate objective of the](https://joinup.ec.europa.eu/collection/isa-action-201612-semantic-interoperability-representation-powers-and-mandates-0/solution/representation-powers-and-mandates-ontology#:~:text=The%20ultimate%20objective%20of%20the,structured%20and%20machine%2Dreadable%20format)</li><li>[SEMPER \| DE4A](https://www.de4a.eu/semper)</li></ul> |
| CAT_04 | The Commission SHALL make publicly available the existence and maintenance of the catalogue of attributes mentioned in CAT_09, including processes to propose the registration to public and private parties, allowing to register attributes, and conditions for updating and/or removing attributes. These processes SHALL include archiving and logging changes of the history of the catalogue of attributes in an appropriate way, including versioning. <p><br>Note: There are layers on top of the attributes that need maintenance as well. So, maintenance in this case is more generic and encompasses more than just the attribute itself. |

#### A.2.3.26 Topic 26 - Attestations' Catalogue 

*Short description*

See [topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabulary-for-attestation-attributes).

*HLRs*

| **Index** | **Requirement specification** |
|-----------|---------------|
| CAT_05 | The Commission SHALL enable registration by any entity, of Attestation Rulebooks for QEAAs and PuB-EAAAs, used within the EUDI Wallet ecosystem, in a catalogue. <p><br>Note: The catalogue MAY also contain Rulebooks for non-qualified EEAs. |
| CAT_06 | The Commission SHALL make the catalogue publicly available and machine-readable, by hosting the catalogue, or parts of it, including an e-discovery mechanism and/or by referencing to other catalogues. |
| CAT_07 | The Commission will enable self-registration process without pre-approval of the registry, of Attestation Rulebooks, for both public and private entities. |
| CAT_08 | The Commission SHALL specify and make publicly available three (3) Rulebooks for the following generic types of Attestations -- QEAA, PuB-EAA, and non-qualified EAA. |
| CAT_09 | The Commission SHALL make publicly available the existence and maintenance of the Attestation Rulebooks catalogue mentioned in CAT_01, including processes to propose the registration to public and private parties, allowing to register an Attestation Rulebook, and conditions for updating and/or removing Attestation Rulebooks. These processes SHALL include archiving and logging changes of the history of the Attestation Rulebooks catalogue in an appropriate way, including versioning. |
| CAT_10 | The body responsible for the Attestation rulebook SHALL include a unique reference to this body and the way to contact it, or how to find information for doing so. <p><br>Note: There is an option also for Member States own extensions for rulebooks, in a hierarchical way, derived and elaborated from a Union rulebook. <p><br> Note: Rulebooks MAY be shared between interested parties in an out-of-band manner. |
| CAT_11 | When determining the attributes to be included in a new attestation type, the party specifying the applicable Attestation Rulebook SHOULD consider using attributes that have been defined already in a namespace included in the Attestation Rulebooks catalogue mentioned in CAT_01, rather than unnecessarily re-defining all attributes within a new namespace. |

#### A.2.3.27 Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and (non-qualified) EAAs, and Relying Parties

*Short description*

PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA
Providers and Relying Parties SHALL register with a Registrar in their
Member State. The main goal of the registration process is for the
entity to receive an access certificate that Wallet Units can use to
authenticate them.

This Topic specifies high-level requirements related to the registration
of the above mentioned entities. 

*HLRs*

A.  *General requirements for Member State registration processes*

| **Index** | **Requirement specification** |
|-----------|----------------|
| Reg_01 | Member States SHALL provide processes and mechanisms for PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers and Relying Parties to register in a registry. <p><br>Note: Member States may choose to implement a single registry for all these roles, or a separate registry for each of these roles. |
| Reg_02 | Member States SHALL make publicly available all necessary details and documentation about the registration processes for their registry. |
| Reg_03 | Member States SHALL publish the registry entries online, in a sealed or signed machine-readable common format suitable for automated processing, according to the revised eIDAS Regulation Article 5b 5, for the purpose of transparency to Users and other stakeholders. |
| Reg_04 | Member States SHALL make the registry available online, in a common human-readable format. |
| Reg_05 | The Commission SHALL establish a technical specification for the common formats mentioned in Reg_03 and Reg_04. |
| Reg_06 | The Commission SHALL provide specifications for a common API for retrieving registry entries from the Member States registries per Reg_04, defining the minimum requirements for interoperability.<br><br>Note: Requirements for this API are defined in Reg_08 and Reg_09. |
| Reg_07 | The Commission SHALL provide specifications for a common user interface for accessing the Member State registries per Reg_05.<br><br>Note: Requirements for this user interface are defined in Reg_08 and Reg_09.  |
| Reg_08 | The API mentioned in Reg_06 and the User interface mentioned in Reg_07 SHALL make use of a secure channel protecting the authenticity and integrity of the information in the registry during transport. |
| Reg_09 | The API mentioned in Reg_06 and the User interface mentioned in Reg_07 SHALL NOT require authentication or prior registration and authorization of any entity wishing to retrieve the information in the registry. |


B.  *General requirements for the issuance of access certificates*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| Reg_10 | A Member State SHALL ensure that an Access CA notified according to \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\] issues an access certificate to all PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers and Relying Parties registered in one of the Member State's registries. |
| Reg_11 | A Member State SHALL ensure that the issuance process of access certificates by their notified Access CA(s) complies with a common Certificate Policy for Access CAs. |
| Reg_12 | The Commission SHALL provide technical specifications establishing the common Access CA Certificate Policy mentioned in Reg_11. |
| Reg_13 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority logs all issued certificates for Certificate Transparency (CT).<br><br>Note added to ARF 1.5.0: This requirement is still under discussion and might be changed or removed in a future version of this ARF. |
| Reg_14 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority provides one or more method(s) to revoke the access certificates it issued. |
| Reg_15 | The common Certificate Policy mentioned in Reg_12 SHALL include a policy for revocation, which SHALL require that an Access Certificate Authority revokes an access certificate at least when: <ul><li>the certificate subject is withdrawn or suspended from the respective Registry,</li><li>on request of the certificate subject, or</li><li>on request of a competent national authority.</li></ul> |
| Reg_16 | The common Certificate Policy mentioned in Reg_12 SHALL specify the profile of access certificates in detail. |
| Reg_17 | The common Certificate Policy mentioned in Reg_12 SHALL require that an access certificate indicates whether its subject is a PID Provider, a QEAA Provider, a PuB-EAA Provider, a (non-qualified) EAA Provider, or a Relying Party Instance. |
| Reg_18 | The common Certificate Policy mentioned in Reg_12 SHALL define the minimum change history information to be stored for resolving possible disputes regarding registration. |


C.  *Requirements for the registration of PID Providers*

| **Index** | **Requirement specification** |
|-----------|---------------------|
| Reg_19 | A Member State SHALL approve a PID Provider according to a well-defined policy before including it in its PID Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of PID Providers in its Registry. |
| Reg_20 | A Member State SHALL identify PID Providers at a level of confidence proportionate to the risk arising from the potential harm a fraudulent PID Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |

D.  *Requirements for the registration of Attestation Providers*

| **Index** | **Requirement specification** |
|-----------|-------------------|
| Reg_21 | A Member State SHALL approve an Attestation Provider according to a well-defined policy before including it in its Attestation Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of Attestation Providers in its Registry. These processes and rules SHOULD consider any relevant differences between QEAA Providers, PuB-EAA Providers and (non-qualified) EAA Providers. |
| Reg_22 | A Member State SHALL identify Attestation Providers (i.e., QEAA Providers, PuB-EAA Providers and non-qualified EAA Providers) at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Attestation Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |

E.  *Requirements for the registration of Relying Parties*

| **Index** | **Requirement specification** |
|-----------|------------------|
| Reg_23 | The Commission SHALL establish a technical specification for a common set of Relying Party information to be registered in Member State registries. This set SHALL include at least the information defined in eIDAS Regulation [article 5b](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1776-1-1) 2 (c). |
| Reg_24 | A Member State SHALL enable a Relying Party to register remotely, using an API or User interface. |
| Reg_25 | A Member State SHALL identify Relying Parties remotely, at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Relying Party could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |
| Reg_26 | A Member State SHALL enable a Relying Party to update the information registered on it remotely, using a process comparable to the original registration process, and using the API or User interface mentioned in Reg_24. |
| Reg_27 | Relying Parties SHALL make any updates necessary to ensure the continued correctness of the registered information without undue delay. |
| Reg_28 | A Member State's Registry SHALL log all changes made on the information regarding a Relying Party, including at least initial registration, updates, deletion of information, and suspension or withdrawal. |
| Reg_29 | A Registrar SHALL provide a method to suspend or withdraw a registered Relying Party. |
| Reg_30 | A Registrar SHALL have a policy for suspension or withdrawal of registered Relying Parties, which SHALL specify that a Relying Party is suspended or withdrawn at least on request of the Relying Party or of a competent national authority. |

F.  *Requirements for the issuance of Relying Party access certificates*

| **Index** | **Requirement specification** |
|-----------|---------------------|
| Reg_31 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains a name for the Relying Party, in a format suitable for presenting to a User. <p><br>Note: A Wallet Unit needs such a name when requesting User approval according to \[[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)\]. |
| Reg_32 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains an EU-wide unique identifier for the Relying Party. <p><br>Note: The Wallet Unit needs such an identifier at least to determine which value to present for a User pseudonym; see \[[Topic 11](#a2311-topic-11---pseudonym-attestation)\]. |

#### A.2.3.28 Topic 28 - Wallet Unit for legal persons

*Short description*

This topic is focused on identifying high-level requirements for a
legal-person Wallet Unit. All core capabilities of a Wallet Unit
for a natural person are available for a legal person. There are some
differences between a natural and legal person that accordingly leads to
different requirements for issuing legal-person PIDs and the Wallet Units containing legal-person PIDs. 

-   A legal-person PID is issued under an eID scheme.

-   A legal-person PID is described in a legal-person PID Rulebook,
    which is different from the natural-person PID Rulebook in \[PID
    Rulebook\]. A legal-person PID has a different attestation type than
    a natural-person PID, and also contains different attributes. For
    example, date of birth or age are not relevant information for legal
    persons. Specifying a different Rulebook for legal-person PIDs
    allows Relying Parties and other Wallet Units to request
    these attributes.  

-   A legal-person Wallet Solution may be implemented in the same
    manner as a natural-person Wallet Solution, meaning chiefly that it
    is implemented on a mobile device operated by a single User, who is
    a natural person. However, a legal-person Wallet Solution may
    also be implemented as a server-based (web-based) application. In
    the latter case, a Wallet Unit can be used either by one or more
    natural persons appointed by the legal person, or by information
    systems of the legal persons that give an Wallet Unit
    commands in accordance with rules defined by the legal person.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|------------------|
| LP_01 | The Commission SHALL develop a Legal-person PID Rulebook to specify the attribute scheme and other technical details applicable for legal-person PIDs. |
| LP_02 | The attestation type of a legal-person PID SHALL be different from the attestation type of a natural person PID. <p><br>Note: See \[[Topic 12](#a2312-topic-12---attestation-rulebooks)\] for an explanation of the concept of attestation type. |
| LP_03 | A legal-person PID SHALL comply with all requirements in the Legal-person PID Rulebook mentioned in LP_02. |

#### A.2.3.29 Topic 29 - Delegation paradigm 

*Short description*

[Topic 3](#a233-topic-3---pid-rulebook) describes requirements for a rulebook of natural-person PIDs. 
[Topic 28](#a2328-topic-28---eudi-wallet-for-legal-person) does the same for legal-persons PIDs.

[Article 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1).5.(f) of eIDAS Regulation also mentions the possibility of
issuing eIDs that also could attest a natural person representing the
natural or legal person.  At current time, this Topic proposes to not
describe any requirements for such eID schemes without further Member
State input for such eID schemes. The main reason is that there is no
cross-border legal framework for mutual recognition of powers and
mandates. Powers and mandates are generally legal system-specific and
administrative system-specific.  

Another use case for delegation is where the recognition of the power
for a person to represent another person occurs on an *ad hoc* basis,
based on a decision by the represented User and in the context of a
specific Relying Party. The basis for such decisions is outside of the
scope of eIDAS. Various scenarios can be considered:

1.  Natural person to natural person, based on the will of the
    represented person: One individual authorizes another individual to
    represent them: 

    1.  Picking up a prescription from the pharmacy or a package from
        the post office for a family member. 

    2.  Empowering a person to vote on your behalf. 

    3.  Empowering a notary to sell your house on your behalf to a
        certain party for a certain amount. 

    4.  Empowering your employer to apply for a residence permit on your
        behalf. 

2.  Natural person to natural person, based on some decision by an
    authority, or also as a consequence of national, EU or international
    law: 

3.  Legal guardian being able to take decisions on behalf of child,
    disabled person, or elderly person. 

4.  Natural person to legal person: An individual authorizing a legal
    entity to represent them. 

    1.  A person empowering a law firm to be the executor of the trust upon their death. 

    2.  A person empowering a bank to invest on their behalf. 

*HLRs*

There are no specific requirements in this Topic. 

#### A.2.3.30 Topic 30 - Interaction between Wallet Units

*Short description*

A User can request another User to release
an attestation of attributes, where both Users use their Wallet Unit. This can be done when
their devices are close together (that is, in physical
proximity) with internet connectivity for both devices (online), or
without internet connectivity for either or both devices (offline). 

This Topic lists the high-level requirements related to the
interaction between two Wallet Units in proximity offline mode
and in proximity online mode.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| W2W_01 | A Wallet Unit SHALL support an interface and protocol for: <ul><li>Establishing a connection with another Wallet Unit</li><li>Receiving PID and (Q)EAA requests from another Wallet Unit</li><li>Validating such requests</li><li>Responding to such requests in accordance with the technical specifications as defined by \[OpenID4VP\] and \[ISO/IEC 18013-5\]</li></ul> |
| W2W_02 | The Commission SHALL develop technical specifications for exchanging PIDs and attestations between two Wallet Units in accordance with the technical specifications as defined by \[OpenID4VP\] and \[ISO/IEC 18013-5\]. |
| W2W_03 | The Requestor Wallet Unit SHALL authenticate its User prior to requesting attestations presentation from another Wallet Unit. |
| W2W_04 | The Requestee Wallet Unit SHALL request User approval, as specified in \[[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)\], before presenting requested attestations or attributes to another Wallet Unit. The Wallet Unit SHALL inform the User about the attributes that are being requested, and of the outcome of authentication and validation checks of the request and the requestor. |
| W2W_05 | The Requestor Wallet Unit SHOULD have pre-defined a list of attributes of PID or attestations that can be requested from the Requestee Wallet Unit. |
| W2W_06 | The Requestee Wallet Unit SHALL authenticate and validate the Requestor Wallet Unit, ensuring the validity of the Requestor Wallet Unit and the attribute request. |
| W2W_07 | The Requestor Wallet Unit SHALL display the received attributes to its User. |

#### A.2.3.31 Topic 31 - PID Provider, Wallet Provider, Attestation Provider and Access Certificate Authority notification and publication 

*Short description*

PID Providers, PuB-EAA Providers, Wallet Providers and Relying Party
Access Certificate Authorities must be notified by a Member State to the
Commission. As part of the notification process, the trust anchors of
these parties must be included in a Trusted List. A trust anchor is the
combination of a public key and an identifier for the associated entity.
Trust anchors are required for the verification of the signatures of
PIDs, attestations, WUAs, and access certificates that are
issued by these parties.

This Topic contains High-Level Requirements for the notification of
these parties by Member States, and for the publication of the notified
information by the Commission.

*HLRs*

A.  Generic requirements for notification

| **Index** | **Requirement specification** |
|-----------|-----------------|
| GenNot_01 | The European Commission SHALL establish technical specifications for a common system enabling the notification of PID Providers, PuB-EAA Providers, Wallet Providers, and Relying Party Access Certificate Authorities by Member States to the Commission. <p><br> Note: Notification does not apply to QEAA Providers and (non-qualified) EAA Providers, as explained in Sections D and F below, respectively. |
| GenNot_02 | As part of the specifications referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the notification of a PID Provider, PuB-EAA Provider, Wallet Provider or Relying Party Access Certificate Authorities to the Commission. <p><br> Note: The outcome of the notification procedure is the publication of the information notified by the Member State according to [Article 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1) (18) in a machine and human readable manner using the common system mentioned in Section H, TLPub_01. |
| GenNot_03 | The common system mentioned in GenNot_01 SHALL enable: <ol type="a"><li>A secure notification channel between MS & COM for all notifications.</li><li>A notification, verification, and publication process and associated validation steps (with follow-up and monitoring) at the Commission side.</li><li>Collected data to be processed, consolidated, signed/sealed and published in both a machine-processable Trusted List and in a human-readable format, manually and/or automatically using e.g. a web service and/or API.</li></ol> |
| GenNot_04 | As regard to GenNot_03, point b), the Commission SHALL verify whether the notified data is complete and meets the technical specifications, while the Member States SHALL be responsible for the correctness of the notified information. |
| GenNot_05 | As part of the specifications referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the withdrawal of a PID Provider, PuB-EAA Provider, Wallet Provider, or Relying Party Access Certificate Authority. These operating procedures SHALL include unambiguous conditions for withdrawal. As an outcome of the withdrawal procedure, the status of the withdrawn PID Provider, PuB-EAA Provider, Wallet Provider, or Relying Party Access Certificate Authority in the Trusted List SHALL be changed to Invalid. |

B.  Requirements for the notification of PID Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| PPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about PID Providers. |
| PPNot_02 | The common set of information to be notified about a PID Provider SHALL include: <ol><li>Identification data:<ol><li>MS/Country of establishment,</li><li>Name as registered in an official record,</li><li>Where applicable:<ol><li>A business registration number from an official record,</li><li>Identification data from that official record.</li></ol></li></ol></li><li>PID Provider trust anchors, i.e., public keys and name as per point 1) ii) above, supporting the authentication of PIDs issued by the PID Provider,</li><li>PID Provider Access CA trust anchors, i.e., public keys and CA name, supporting the authentication of the PID Provider by Wallet Units at the service supply point(s) listed per point 4) below.</li><li>Service supply point(s), i.e., the URL(s) at which a Wallet Unit can start the process of requesting and obtaining a PID.</li></ol><p>Notes: <ul><li>Relating to point 3) above: PID Provider Access CA trust anchors are notified separately from the Relying Party Access CA (see Section G below), since PID Providers are -legally speaking- not Relying Parties.</li><li>For the concept of an Access CA, see also \[[Topic 27](#a2327-topic-27---relying-party-registration)\] and Section 6.3.2 of \[ARF\]. </li></ul> |
| PPNot_03 | PID Providers SHALL ensure that all PIDs they issue can be authenticated using the PID Provider trust anchors notified to the Commission. |
| PPNot_04 | PID Providers SHALL ensure that their PID Provider access certificates can be authenticated using the PID Provider Access CA trust anchors notified to the Commission. <p><br>Note: \[[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)\] describes how access certificates will be used. |
| PPNot_05 | PID Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider Trusted List which is sealed by the Commission. |
| PPNot_06 | PID Provider Access CA trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider Access CA Trusted List which is signed or sealed by the Commission. |
| PPNot_07 | The format of the PID Provider Trusted List SHALL be aligned with ETSI TS 119 612 v2.1.1 or comply with a suitable profile similarly derived from ETSI TS 102 231. |


C.  Requirements for the notification of Wallet Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| WPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about Wallet Providers. |
| WPNot_02 | The common set of information to be notified about a Wallet Provider SHALL include: <ol><li>Identification data:<ol><li>MS/Country of establishment</li><li>Name as registered in an official record</li><li>Where applicable:<ol><li>Business registration number from an official record, and</li><li>Identification data from the official record.</li></ol></li></ol></li><li> Wallet Provider trust anchors, i.e., public keys and name as per point 1) b. above, supporting the authentication of Wallet Unit Attestations issued by the Wallet Provider.</li></ol><p>Notes:<ul><li>See \[[Topic 9](#a239-topic-9---wallet-trust-evidence)\] and \[[Topic 38](#a2338-topic-38---wallet-instance-revocation)\] for the definition of the WUA.</li><li>A Wallet Provider does not need an access certificate to interact with Wallet Units.</li></ul> |
| WPNot_03 | Wallet Providers SHALL ensure that all WUAs they issue can be authenticated using the trust anchors notified to the Commission. |
| WPNot_04 | Wallet Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled Wallet Provider Trusted List which is sealed by the Commission. |
| WPNot_05 | The format of the Wallet Provider Trusted List SHALL be aligned with ETSI TS 119 612 v2.1.1 or comply with a suitable profile similarly derived from ETSI TS 102 231. |

D.  Requirements for the notification of QEAA Providers

There is no notification of QEAA Provider foreseen by the Regulation,
except for establishing the [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) Trusted List once a qualified status
is granted. QTSPs issuing QEAAs to Wallet Units SHALL abide by the
Implementing Act to be adopted under [Art. 45d](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3849-1-1)(5).

E.  Requirements for the notification of PuB-EAA Providers

This notification is pursuant to [Art.45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1)(3) and to the implementing acts
to be adopted pursuant to [Art.45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1)(7). It should be noted that the
purpose of this notification is mainly to the attention of QTSPs issuing
qualified certificates for electronic signatures/seals to those public
sector bodies referred to in [Article 3](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e739-1-1), point (46), and identified as
the issuer in the PuB-EAA (cf. point (b), of Annex VII - INEXISTENT ANNEX -). The (trusted)
list compiled by the Commission shall be deemed to be a constitutive
list of such [Art.3](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e739-1-1)(46) bodies recognized for issuing PUB-EAAs.
Consequently, QTSPs are expected to verify such lists prior to issuing a
qualified certificate to any entity claiming to be [Art.3](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e739-1-1)(46) body.

| **Index** | **Requirement specification** |
|------------|-----------------|
| PuBPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about PuB-EAA Providers. |
| PuBPNot_02 | The common set of information to be notified by Member States about PuB-EAA Providers SHALL include at least: <ol><li>Identification data:<ol><li>MS/Country of establishment</li><li>Name as registered in an official record</li><li> Where applicable: <ol><li>Registration number as in official record, and </li><li>Official record identification data</li></ol></li><li>Identification data of the Union or national law under which <ol><li>Either the PuB-EAA Provider is established as the responsible body for the authentic source based on which the electronic attestation of attributes is issued, or </li><li>The PuB-EAA Provider is the body designated to act on behalf of the responsible body referred to in point 1) iv) a).</li></ol></li><li>The conformity assessment report issued by a conformity assessment body, confirming that the requirements set out in paragraphs 1, 2 and 6 of [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1) are met.</li></ol></li><li>Service supply point(s), i.e., the URL(s) at which a Wallet Unit can start the process of requesting and obtaining a PuB-EAA from the PuB-EAA Provider.</li></ol> |
| PuBPNot_03 | The format of the PuB-EAA Provider Trusted List SHALL be aligned with ETSI TS 119 612 v2.1.1 or comply with a suitable profile similarly derived from ETSI TS 102 231. |

F.  Requirements for the notification of (non-qualified) EAA Providers

There is no notification of (non-qualified) EAA Providers foreseen by
the Regulation. As stated in \[[Topic 12](#a2312-topic-12---attestation-rulebooks)\], the body responsible for an
Attestation Rulebook describing a type of attestation that is an EAA
SHOULD define in the Rulebook the mechanisms allowing a Relying Party to
obtain, in a trustworthy manner, the trust anchor(s) of EAA Providers
issuing this type of EAA.

G.  Requirements for the notification of Relying Party Access
    Certificate Authorities

Relying Party Access Certificate Authorities (CA) are TSPs responsible
for signing access certificates they issue to Relying Parties. Legally
speaking, Relying Parties in this context also include QEAA Providers,
PuB-EAA Providers, and (non-qualified) EAA Providers, but for clarity
these roles are mentioned separately in the requirements below.

For more information about Relying Party Access CAs, see \[[Topic 27](#a2327-topic-27---relying-party-registration)\].

| **Index** | **Requirement specification** |
|------------|------------------|
| RPACANot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about: <ul><li>Relying Party Access Certificate Authorities,</li><li>QEAA Provider Access Certificate Authorities,</li><li>PuB-EAA Provider Access Certificate Authorities,</li><li>(non-qualified) EAA Provider Access Certificate Authorities.</li></ul> |
| RPACANot_02 | The common set of information to be notified about an Access Certificate Authority SHALL include: <ol><li>Identification data:<ol><li>MS/Country of establishment,</li><li>Name as registered in an official record,</li><li> Where applicable:<ol><li>A business registration number from an official record,</li><li>Identification data from that official record.</li></ol></li></ol></li><li>Access CA trust anchors, i.e., public keys and name as per point 1) ii), supporting the authentication of Relying Parties, QEAA Providers, PuB-EAA Providers, and (non-qualified) EAA Providers by Wallet Units.</li></ol> |
| RPACANot_03 | Relying Parties, QEAA Providers, PuB-EAA Providers, and (non-qualified) EAA Providers SHALL ensure that their access certificates can be authenticated using the Access CA trust anchors notified to the Commission. |
| RPACANot_04 | Access CA trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission--compiled Access CA Trusted List which is signed or sealed by the Commission. |
| RPACANot_05 | The format of an Access CA Trusted List SHALL be aligned with ETSI TS 119 612 v2.1.1 or comply with a suitable profile similarly derived from ETSI TS 102 231. |

H.  Requirements for the publication of Trusted Lists compiled by the
    Commission
    
| **Index** | **Requirement specification** |
|------------|------------------|
| TLPub_01 | The European Commission SHALL establish technical specifications for the system enabling the publication by the Commission of the information notified by the Member States regarding PID Providers, Wallet Providers, PuB-EAA Providers, and Relying Party Access Certificate Authorities. |
| TLPub_02 | The European Commission SHALL establish technical specifications for the set of information to be published about: <ul><li>PID Providers,</li><li> Wallet Providers,</li><li>PuB-EAA Providers, and</li><li>Relying Party Access Certificate Authorities based on the information notified by the Member States.</li></ul><p>  Note: The information to be published MAY be different from the information to be notified per requirements PPNot_01, WPNot_01, PuBPNot_01, and RPACANot_01 above, respectively. |
| TLPub_03 | The publication of the information referred to in TLPub_01 SHALL take place over a secure channel protecting the authenticity and integrity of the published information. |
| TLPub_04 | The technical system mentioned in TLPub_01 SHALL NOT require authentication or prior registration and authorization of any entity wishing to retrieve the published information. |
| TLPub_05 | The information referred to in TLPub_01 SHALL be published:<ul><li>in an electronically signed or sealed form that is suitable for automated processing, and </li><li>in a human-readable format, e.g., through introspection and display facilities, over an authenticated channel.</li></ul> |
| TLPub_06 | The Commission SHALL publish in the OJEU the locations of the Trusted Lists for PID Providers, Wallet Providers, PuB-EAA Providers, and Relying Party Access Certificate Authorities. |
| TLPub_07 | The Commission SHALL publish in the OJEU the trust anchors to be used for verifying the signature or seal mentioned in TLPub_05. |
| TLPub_08 | As part of the specifications referred to in TLPub_01, the European Commission SHALL establish technical specifications for ensuring the availability and authenticity of the full history regarding the information notified about PID Providers, Wallet Providers, PuB-EAA Providers, and Relying Party Access Certificate Authorities. |

#### A.2.3.32 Topic 32 - PID interoperability 

See [topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.33 Topic 33 - Wallet Unit backup and restore 

*Short description*

The relevant scenario for the backup and restore functionality, is when
the User can no longer access the data, the electronic attestations of
attributes and the configurations, that were stored on the mobile device
on which the Wallet Unit was installed, including its accessories. The
situations may include the mobile device has either been lost, stolen,
broken or hacked (e.g., a result of unauthorized access to the device)
or it malfunctions. 

The topic deals with situations when a User replaces an existing
installation of an Wallet Solution with a new installation of the
same Wallet Solution, when setting up a new mobile device, or after a
factory reset of the same device.  

The requirements are divided between two situations: 

A - Functional requirements for Backup and Restore where a private key
cannot be exported. 

B - Functional requirements for Backup and Restore where private key can
be exported or there is no device binding. 

> *[<u>Privacy note</u>]: The Backup and Restore Object is
> considered sensitive as the mere existence of certain attributes can
> be sensitive, e.g., a prescription from a fertility Clinique. Also,
> very sensitive attribute information may even not be stored in the
> rich environment of the mobile device but secured through e.g., a
> hardware chip, such that it will never leave that chip in an
> unencrypted way. In that case the Backup and Restore object should
> have similar precautions in that the encryption mechanism must be
> fully performed securely on the secure component of the original
> Wallet solution and the target Wallet solution.*

*HLRs*

A.  Back-up requirements

| **Index** | **Requirement specification** |
|-----------|------------------|
| BR_01 | A Wallet Unit SHALL include a Backup and Restore Object. |
| BR_02 | The Commission SHALL define a technical specification of the Backup and Restore Object. |
| BR_03 | The Wallet Unit SHALL log all attestations that are issued to it, by adding an entry to the Backup and Restore Object. |
| BR_04 | A Wallet Unit SHALL enable the User to export the Backup and Restore Object to external storage. |
| BR_05 | A Wallet Solution Provider SHALL store and transfer the Backup and Restore Object in a way that it is protected against use of it by others than the User. |

B.  Restore Requirements 

| **Index** | **Requirement specification** |
|-----------|-----------------|
| BR_06 | A Wallet Unit SHALL support a procedure that will perform the following restore steps from BR_07 up to BR_16. |
| BR_07 | A Wallet Unit SHALL enable the User to request from the PID Provider to re-issue the PID in the Backup and Restore Object. The PID SHALL be the first Attestation to be restored from the Backup and Restore Object. |
| BR_08 | A Wallet solution SHALL enable the User to initiate the Restoration function, following a successful re-issuance of the PID. |
| BR_09 | The Wallet Unit SHALL present an error message to the User, if an error is detected in the Backup and Restore Object intended to be restored. |
| BR_10 | The Wallet Unit SHALL retrieve the Backup and Restore Object, if the activities in BR_09 were successful. |
| BR_11 | Attestation Providers SHALL enable the initiation by a Wallet Unit of a secured session for re-issuance of attestations issued by them. |
| BR_12 | The Wallet Unit SHALL initiate a secured session with the relevant Attestation Provider for each attestation recorded in the Backup and Restore Object. |
| BR_13 | The Wallet Unit SHALL initiate an issuance request for any attestation recorded in the Backup and Restore Object, that is selected by the User. |
| BR_14 | The Wallet Unit SHALL continue the procedure described in BR_12 to BR_13 for all attestations recorded in the Backup and Restore Object. |
| BR_15 | The Wallet Unit SHALL present to the User the results of the restoration process for every attestation, indicating whether it was successful or not. |
| BR_16 | The new Wallet Unit SHALL log all the restored attestation in its Backup and Restore Object (as described in BR_01). |

#### A.2.3.34 Topic 34 - Migrate to a different Wallet Solution 

*Short description*

The most relevant scenario for this functionality is when a User would
like to migrate from one Wallet Solution to a different Wallet Solution.
Another scenario would be when the Wallet Provider ceases to
support the Wallet Solution, or even ceases to exist as a legal person,
and thus the User is forced to abandon the current Wallet Solution and
migrate to a different Wallet Solution.

To migrate to a different Wallet Solution, there is a need to transfer
the data, the electronic attestations of attributes and the
configurations, that were stored on the mobile device on which the
original Wallet Unit was installed, including its accessories, to the
different Wallet solution.  

This topic is similar in some characteristics to [Topic 33](#a2333-topic-33---eudi-wallet-backup-and-restore) that deals
with backup and restore to the **same** Wallet solution, but in [Topic 34](#a2334-topic-34---migrate-to-a-different-wallet-solution)
the migration is to a **different** Wallet solution. A main difference
is that the current mobile device that the User would like to migrate
from is still under the control of the User and in the User\'s
possession, and the relevant data that exists on the current Wallet
solution is not lost and is accessible.

*HLRs*

There are no specific requirements in this Topic.

#### A.2.3.35 Topic 35 - PID issuance service blueprint

*Short description*

This Topic analyses the meaningful User
journeys for PID issuance to a Wallet Unit. This Topic focuses on natural persons only and lists high-level requirements related to the PID
issuance user journey, covering both remote and proximity use cases.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|------------------|
| PID_ISS_01 | A Wallet Unit SHALL support at least the protocol defined in the technical specifications for PID issuance. A Wallet Unit MAY support additional protocols for PID issuance. The following requirements apply only to the protocol defined in the technical specifications. |
| PID_ISS_02 | A  Wallet Unit SHALL authenticate and validate the identity of the PID Provider it is communicating with. |
| PID_ISS_03 | A PID Provider SHALL verify the authenticity of Wallet Unit's WUA. |
| PID_ISS_04 | A Wallet Unit SHALL present the corresponding data request to the User, informing the User about the attributes to be issued by the PID Provider. |
| PID_ISS_05 | A Wallet Unit SHALL inform the PID Provider of successful issuance only after having confirmed the User's authorization to approve the PID issuance. |
| PID_ISS_06 | A Wallet Unit SHALL support device binding for PID, enabling the User to prove possession of the bound device. |
| PID_ISS_07 | A Unit SHALL support an activation procedure for PID Providers to verify that PID is only delivered to its subject. |
| PID_ISS_08 | A Wallet Unit SHALL support technical specifications for securely delivering the PID from the PID provider to the device controlled by the User. |
| PID_ISS_09 | A Wallet Unit SHALL support technical specifications to notify the PID Provider of the outcome of the PID issuance process, that is -- whether it was successful or not (e.g., PID issued to the Wallet Unit or PID not issued to the Wallet Unit and User is informed accordingly). |

#### A.2.3.36 Topic 36 - Risk Analysis of the Wallet usage

There are no HLRs for this Topic.

#### A.2.3.37 Topic 37 - QES -- Remote Signing - Technical Requirements

See [Topic 16](#a2316-topic-16---signing-documents-with-eudi-wallet).

#### A.2.3.38 Topic 38 - Wallet Unit Revocation  

*Short description*

This Topic discusses Wallet Unit revocation. In particular, it
answers the following questions: 

-   How can a Wallet Provider revoke a Wallet Unit? 

-   During issuance of an attestation, how can an Attestation Provider
    verify whether a Wallet Unit has been revoked? 

-   When requesting attributes from an attestation, how can a Relying
    Party verify whether a Wallet Unit has been revoked? 

For more information, see the White Paper on Wallet Unit Revocation
that will be published in the same repository as the ARF.

HLRs

A.  Issuing a Wallet Unit Attestation 

| **Index** | **Requirement specification** |
|------------|-------------------|
| WIRevocation_01 | To enable a Relying Party or an Attestation Provider to verify the authenticity and (if necessary, see requirement VCR_01) the revocation status of a Wallet Unit it is interacting with, a Wallet Provider SHALL issue one or more WUAs to the Wallet Unit during the activation phase of a Wallet Unit, according to requirement WUA_07. |
| WIRevocation_02 | During the lifetime of the Wallet Unit, the Wallet Provider SHALL ensure that the Wallet Unit at all times contains at least one valid WUA. |
| WIRevocation_03 | Empty |
| WIRevocation_04 | The Wallet Provider SHALL manage the issuance processes for WUAs in such a way that the WUAs cannot be misused by colluding Relying Parties (and Attestation Providers) to track a User. |
| WIRevocation_05 | During the activation process of a Wallet Unit, the Wallet Provider SHALL do the following to ensure that a User can request revocation of their Wallet Unit as mentioned in WIRevocation_10: <ul><li>Register the relationship between this Wallet Unit and its User in a User account;</li><li>Enable secure authentication of the User towards the Wallet Provider is possible, by providing one or more suitable authentication mechanisms. These authentication mechanisms SHALL NOT depend on the mobile device containing the Wallet Unit.</li></ul><p>  Note: <ul><li>The Wallet Provider does not need to know the true identity of the User. Instead, an alias such as an e-mail address can be used.</li><li>The reason for requiring authentication mechanisms that are independent of the Wallet Unit is that the User must be able to authenticate to the Wallet Provider even in case the mobile device containing the Wallet Unit is lost or stolen.</li></ul> |

A.  Revoking a Wallet Unit 

| **Index** | **Requirement specification** |
|------------|------------------|
| WIRevocation_06 | A Wallet Provider SHALL be able to suspend a Wallet Unit, by suspending its WUA(s) as specified in \[[Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation)\]. |
| WIRevocation_07 | A Wallet Provider SHALL be able to revoke a Wallet Unit, by revoking its WUA(s) as specified in \[[Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation)\]. |
| WIRevocation_08 | A Wallet Provider SHALL be able to unsuspend a Wallet Unit, by unsuspending its WUA(s). |
| WIRevocation_09 | During the lifetime of a Wallet Unit, the Wallet Provider SHALL regularly verify that the security of the Wallet Unit is not breached or compromised. If the Wallet Provider detects a security breach or compromise, the Wallet Provider SHALL analyse its cause(s) and impact(s). If the breach or compromise affects the trustworthiness or reliability of the Wallet Unit, the Wallet Provider SHALL suspend the corresponding WUA(s) if they have a validity period of 24 hours or more. The Wallet Provider SHALL do so at least in the following circumstances: <ul><li>If the security of the Wallet Unit, or the security of the mobile device and OS on which it is installed, or the security of a WSCA it uses for managing cryptographic keys and sensitive data, is breached or compromised in a manner that affects its trustworthiness or reliability.</li><li>If the security of the Wallet Solution is breached or compromised in a manner that affects the trustworthiness or reliability of all corresponding Wallet Units.</li><li>If the security of the common authentication and data protection mechanisms used by the Wallet Unit is breached or compromised in a manner that affects their trustworthiness or reliability.</li><li>If the security of the electronic identification scheme under which the Wallet Unit is provided is breached or compromised in a manner that affects its trustworthiness or reliability.</li></ul>|
| WIRevocation_10 | A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of the User registered during the Wallet Unit activation process, see WIRevocation_05. To do so, the Wallet Provider SHALL revoke all valid WUA(s) for that Wallet Unit, if they have a remaining validity period of 24 hours or longer. The Wallet Provider SHALL authenticate the User before revoking the Wallet Unit. |
| WIRevocation_11 | A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of a PID Provider, in case the natural person using the Wallet Unit has died or the legal person using the Wallet Unit has ceased operations. To do so, the Wallet Provider SHALL revoke all valid WUA(s) for that Wallet Unit, if they have a remaining validity period of 24 hours or longer. To identify the Wallet Unit that is to be revoked, the PID Provider SHALL use the Wallet Unit identifier provided by the Wallet Provider in the WUA during PID issuance. |
| WIRevocation_12 | Before revoking a WUA per WIRevocation_11, the Wallet Provider SHALL verify that the party requesting revocation is indeed a valid PID Provider listed in the Trusted List of PID Providers. |
| WIRevocation_13 | Before requesting a Wallet Provider to revoke a Wallet Unit per WIRevocation_11, the PID Provider SHALL ensure that the revocation does not harm the interests of any of the stakeholders. The PID Provider SHALL have (and follow) a documented policy to ensure that this is the case. |

A.  Informing the User

| **Index** | **Requirement specification** |
|-----------|-------------------|
| WIRevocation_14 | A Wallet Provider SHALL inform a User without delay in case the Wallet Provider decided to suspend or revoke the User's Wallet Unit. The Wallet Provider SHALL also inform the User about the reason(s) for the suspension or revocation. This information SHALL be understandable for the general public. It SHALL include (a reference to) technical details about any security breach if applicable. |
| WIRevocation_15 | A Wallet Provider SHALL inform a User without delay in case the Wallet Provider decided to unsuspend the User's Wallet Unit. |
| WIRevocation_16 | To inform a User about the (un)suspension or revocation of their Wallet Unit, the Wallet Provider SHALL use a communication channel that is independent of the Wallet Unit. In addition, the Wallet Provider MAY use the Wallet Unit itself to inform the User. |

B.  Verifying the revocation status of a Wallet Unit 

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIRevocation_17 | Empty |
| WIRevocation_18 | A PID Provider or Attestation Provider SHOULD, for each of its valid PIDs or attestations, regularly verify whether the Wallet Provider suspended or revoked the Wallet Unit on which that PID or attestation is residing. If it turns out that the Wallet Unit is suspended or revoked, the PID Provider or Attestation Provider SHOULD immediately revoke the respective PID or attestation in accordance with all requirements in \[[Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation)\]. |
| WIRevocation_19 | A Relying Party SHOULD verify the revocation status of the Wallet Unit by requesting and verifying a WUA and subsequently verifying the revocation status of the WUA following the steps specified per VCR_11. |
| WIRevocation_20 | For the verification of WUAs, a Relying Party SHALL accept the trust anchors in the Wallet Provider Trusted List(s) of all Member States. <p><br>Note: Wallet Provider Trusted Lists are explained in \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\]. |
| WIRevocation_21 | When no reliable information regarding the revocation status of a WUA is available, a Relying Party SHOULD perform a risk analysis considering all relevant factors for the use case, before taking a decision to accept or refuse the Wallet Unit. |

#### A.2.3.39 Topic 39 - Wallet to wallet technical Topic 

There are no HLRs for this Topic.

#### A.2.3.40 Topic 40 - Reserved 

#### A.2.3.41 Topic 41 - Minimum requirements on PuB-EAAs rulebooks 

See [topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.42 Topic 42 - Requirements for QTSPs to access authentic sources 

*Short description*

This topic discusses the ability of QTSPs of electronic attestations of
attributes to verify those attributes by electronic means at the request
of the User, wherever those attributes rely on Authentic Sources within
the public sector.  

*HLRs*

| **Index** | **Requirement specification** |
|-----------|------------------|
| QTSPAS_01 | Member States SHALL define:  <ul><li>discovery mechanisms that enable QTSPs to request information about the Authentic Sources or designated intermediaries recognized at national level (including the attributes about a natural or legal person that the Authentic source or designated intermediary is considered to be a primary source or recognised as authentic in accordance with Union law or national law, including administrative practice);</li><li>procedures for QTSPs to request the verification of attributes from Authentic Sources,</li><li>in accordance with technical specifications referred to in QTSPAS_07, and that comply with QTSPAS_02.</li></ul> |
| QTSPAS_02 | Authentic Sources or designated intermediaries SHALL make available an interface that:  <ul><li>determines whether a verification request for attributes comes from a QTSP of electronic attestation of attributes (so a lookup in the QTSP Trusted List);</li><li>determine whether the QTSP issues the requested attributes, and those attributes rely on an Authentic Source within the public sector;</li><li>if both requirements are met: determine the identity of the User (presumably via a Wallet Unit or any other eIDAS identity scheme to determine the request);</li><li>determine whether the User has given consent;</li><li>after authentication of the User: verify whether the claimed attributes match the info in the authentic source; and finally</li><li>respond with a 'match' or 'no match' for each attribute.</li></ul>   <p>The Commission SHALL take measures to ensure that this interface is specified.<p>  Note: Every QTSP will be able to verify against every authentic source. |
| QTSPAS_03 | Authentic source or designated intermediary SHALL define and implement QTSPAS_001 in a secure and privacy-preserving channel in accordance with technical specifications referred to in QTSPAS_007. |
| QTSPAS_04 | Authentic source or designated intermediary SHALL define and implement QTSPAS_001 so that the QTSP will receive the result of the verification of the requested attributes, as described in QTSPAS_002. If the verification is deferred, the response to the QTSP SHALL include the maximum time that it will take to verify the requested attributes, and a unique identifier that the QTSP SHALL use to obtain the result of the verification. |
| QTSPAS_05 | Member States SHALL define QTSPAS_001 so that the request can be sent by the QTSP directly to the Authentic Source or to a designated intermediary recognized at national level. |
| QTSPAS_06 | Member States SHALL specify the process and mechanisms to designate the authentic sources or intermediaries recognized at national level in accordance with Union or national law, allowing the QTSPs to request the verification of attributes stored in authentic sources. |
| QTSPAS_07 | The Commission SHALL publish, in agreement with the European Digital Identity Cooperation Group, a technical specification, referring to applicable standards, specifications and procedures, that will cover at least the attributes specified in Annex VI, wherever those attributes rely on authentic sources within the public sector, for which Member States should ensure that measures are taken to allow qualified providers of electronic attestations of attributes to verify by electronic means, at the request of the User, their authenticity against the relevant authentic source. <p><br> Note: These standards and procedures should be, whenever possible, aligned and compatible with those used for the platforms implementing the Once Only Principle (OOTS). There is a clear synergy of both data exchange approaches. In fact, the national OOP node would be a candidate for acting as an intermediary between QTSPs issuing QEEAs and the Authentic Sources. |
| QTSPAS_08 | QTSP SHALL obtain consent of the User to verify the authenticity of the attributes, before requesting the verification of those attributes to the authentic source or designated intermediary. |

#### A.2.3.43 Topic 43 - Embedded disclosure policy 

*Short description*

This topic is focused on identifying high-level requirements for disclosure policies which may be embedded in attestations. 

*HLRs*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| EDP_01 | A PID Provider or Attestation Provider SHALL be able to include an embedded disclosure policy in a PID or attestation, as defined in the applicable rulebook. |
| EDP_02 | The Provider of a PID or attestation that includes an embedded disclosure policy as in EDP_01 SHALL comply with the applicable rulebook when including an embedded disclosure policy in the PID or attestation. |
| EDP_03 | A Wallet Unit holding a PID or attestation with an embedded disclosure policy SHALL request required information from the Relying Party or from the requesting User, in order to receive information relevant to the disclosure policy. |
| EDP_04 | The Relying Party or the requesting User SHALL provide information required by a disclosure policy to the Wallet Unit in the Relying Party access certificate. |
| EDP_05 | The Wallet Unit SHALL provide to the User information on an embedded disclosure policy and any information provided by the Relying Party or by the requesting User, in order for the User to decide regarding the disclosure of the attributes requested by the Relying Party. |
| EDP_06 | The Wallet Unit SHALL be capable of evaluating an embedded disclosure policy in conjunction with the information received from the requesting Relying Party or the requesting User, in order to determine if the Relying Party or the requesting User has permission from the Attestation Provider to access the requested attributes. |
| EDP_07 | The Wallet Unit SHALL enable the User, based on the outcome of the evaluation of the embedded disclosure policy, to deny or allow the presentation of the requested electronic attestation of attributes to the requesting Relying Party or the requesting User. |
| EDP_08 | The Commission SHALL establish non-mandatory rulebooks, in agreement with the EDICG for electronic attestation of attributes for a common and interoperable set of rules for including an embedded disclosure policy in an attestation, protocols between a Wallet Unit and a Relying Party and the presentation of the response from a Relying Party (or the requesting Wallet Unit) by a Wallet Unit to a Wallet User. |

#### A.2.3.44 Topic 44 - QEAA evaluation requirements 

Deleted

#### A.2.3.45 Topic 45 - QEAA Rulebook 

See [Topic 12](#a2312-topic-12---attestation-rulebooks)

#### A.2.3.46 Topic 46 - Protocols and interfaces for Presentation of PID and (Q)EAA with relying parties 

See [Topic 1](#a231-topic-1---accessing-public-and-private-online-services-with-eudi-wallet) and [Topic 12](#a2312-topic-12---attestation-rulebooks)

#### A.2.3.47 Topic 47 - Protocols and interfaces for PID and (Q)EAA issuance, and (non-)qualified certificates issuance 

See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet)/[23](#a2323---pid-issuance-and-qeaa-issuance)

#### A.2.3.48 Topic 48 - Blueprint for requesting data deletion to Relying Parties 

*Short description*

In this use case, Users are requesting the deletion of their personal
data from Relying Parties with which they have interacted.

Users are concerned about having control over their personal data, thus
the function of requesting data deletion ensures a higher degree of
transparency, privacy and control of the Users over their personal
data. 

This Topic lists high-level requirements related to the function
of Users requesting the deletion of their personal data from Relying
Parties through their Wallet Unit.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|------------------|
| DATA_DLT_01 | A Wallet Instance SHALL provide a User interface where Users can request from Relying Parties the deletion of attributes, in accordance with technical specification. |
| DATA_DLT_02 | The Commission SHALL, in cooperation with the Member States, develop  technical specifications for Relying Parties interface to allow reception and processing of attribute deletion requests. |
| DATA_DLT_03 | A Wallet Instance interface SHALL provide a function where the User may select one Relying Party or multiple Relying Parties for which an attribute deletion request shall be submitted. |
| DATA_DLT_04 | A Wallet Instance interface SHALL display the attribute deletion requests previously submitted through the Wallet Unit. |
| DATA_DLT_05 | A Wallet Unit SHALL include attribute deletion requests in a log so they can be presented to the User via the dashboard (as specified in [Topic 19](#a2319-topic-19---eudi-wallet-user-navigation-requirements-dashboard-logs-for-transparency)). |
| DATA_DLT_06 | The log SHALL include as a minimum: <ul><li>Date of attribute deletion request</li><li>Relying Party to which the request was made</li><li>Attributes requested to be removed.</li></ul> |


#### A.2.3.49 Topic 49 - Protocol and interfaces for requesting data deletion to relying parties 

Deleted.

#### A.2.3.50 Topic 50 - Blueprint to report unlawful or suspicious request of data 

*Short description*

In this use case, Users may need to report a Relying Party to the
competent national data protection authority where an unlawful or
inappropriate request for attribute is received through the Wallet
Instance. Users are concerned about having control over their personal
data, and specifically about a Relying Party over-asking for personal
information, thus the function of reporting suspicious or inappropriate
requests ensures a higher degree of transparency, privacy and control of
the Users over their personal data.

This is important specifically since there are no automatic processes
that are able to check if the request is consistent with the information
that is registered in the Relying Party registry, and so the
presentation of attributes following a request from a Relying Party
relies mostly on the approval of the User. It may happen that a User
will not be able to correctly understand the request, that the Relying
Party was confused with another one due to a similar name or a phishing
attempt, and so forth. The User may realize only after presenting the
attributes that it was taken from them unlawfully by over-asking, or even
by fraud.

This topic lists high-level requirements related to the function of
Users reporting unlawful or inappropriate attribute requests from
Relying Parties.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|--------------------|
| RPT_DPA_01 | A Wallet Unit SHALL provide an interface to lodge a complaint of suspicious Relying Party presentation requests to the DPA of the Member State that provided the Wallet Unit. |
| RPT_DPA_02 | The interface to lodge a complaint SHALL be accessible via the Wallet Instance. |
| RPT_DPA_03 | A Wallet Provider SHALL implement the interface in compliance with national procedural law and administrative practices. |
| RPT_DPA_04 | A Wallet Unit SHALL enable the lodged complaint to be substantiated, including information to identify the Relying Party, their presentation request, and the User's allegation. |
| RPT_DPA_05 | A Wallet Unit SHALL keep reports sent to the DPA in a log file so that it can be presented to the User in the dashboard (as specified in [Topic 19](#a2319-topic-19---eudi-wallet-user-navigation-requirements-dashboard-logs-for-transparency)). |
