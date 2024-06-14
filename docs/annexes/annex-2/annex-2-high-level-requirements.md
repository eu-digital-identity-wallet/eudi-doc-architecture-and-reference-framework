
# ANNEX 2 - High Level Requirements <!-- omit from toc -->


## A.2 High level requirements

### A.2.1 Introduction 

#### A.2.1.1 Overview 

This annex to the [ARF 1.4.0](../../arf.md) includes high-level requirements (HLRs)
related to the EUDI Wallet ecosystem. The requirements define the
responsible actor that should implement each requirement. There are no
requirements imposed on the Users.

All requirements in this Annex only apply in the context of the EUDI
Wallet ecosystem. Attestations that are not bound to or used by Wallet
Instances are not included in the scope of this Annex.

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

Topics presented in [section A.2.3](##a23-high-level-requirements) are ordered by a Topic number.

Each Topic includes a short description, followed by the High-Level
Requirements (HLRs), identified by a unique identifier. The identifier
includes a prefix which signifies the context of the HLRs (e.g. - ISSU
for issuance), an underscore and a numerator, e.g. - ISSU_10.

Note: If required, a reference will be made from a topic to a white
paper or to a technical report, which elaborates on the background or
content of the subject matter. 

### A.2.3 High-Level Requirements  

#### A.2.3.1 Topic 1 - Accessing Public and Private Online Services with EUDI Wallet 

*Short description*

The primary purpose of the EUDI Wallet is to offer secure identification
and authentication of users at a high Level of Assurance (LoA) for both
public and private online services. This essential functionality ensures
that Relying Parties can confidently verify that they are interacting
with the correct users.

In this use case, users are utilizing the EUDI Wallet to confirm their
identity. The users frequently access online services that demand
authentication and currently employ multiple methods for identity
verification while accessing these services. The users are also
concerned about sharing Person Identification Data (PID) during online
interactions. Their objectives include identifying themselves with
services requiring User identification and maintaining control over
personal data sharing.

This Topic contains high-level requirements related to online
identification and authentication of users utilizing their EUDI Wallets.

*High level requirements*

| **Index** | **High Level Requirement** |
| -- | -- |
| OIA_01 | An EUDI Wallet Instance SHALL support technical specifications to respond to person identification data (PID) and attestation presentation requests by Relying Parties. |
| OIA_02 | An EUDI Wallet Instance SHALL support proving binding between a WSCA used by the EUDI Wallet Instance and the PID or attestation in accordance with technical specifications. |
| OIA_03 | The Commission SHALL adopt the technical specifications for PID or attestation presentation request-response protocol and device binding, according to the protocols and interfaces specified in \[OpenID4VP\] for remote flows. |
| OIA_04 | An EUDI Wallet Instance SHALL verify and process PID or attestation presentation requests from Relying Parties in accordance with the protocols and interfaces specified in \[OpenID4VP\] for remote flows. |
| OIA_05 | After verifying and processing a PID or attestation request, the EUDI Wallet Instance SHALL inform the EUDI Wallet User about the identity of the requesting Relying Party and the requested attributes. |
| OIA_06 | An EUDI Wallet Instance SHALL transmit the requested attributes only after having received the EUDI Wallet User's authorization. See also OIA_07. |
| OIA_07 | An EUDI Wallet Instance SHALL support selective disclosure of attributes from PIDs and attestation to be released to the requesting Relying Parties. |
| OIA_08 | The EUDI Wallet Instance SHALL verify the authenticity of the Relying Party's presentation request in accordance with the protocols and interfaces specified in \[OpenID4VP\] for remote flows. |
| OIA_09 | For online identification and authentication scenarios, the EUDI Wallet Instance SHALL validate the authenticity and validity of the identity of the requesting Relying Party in accordance with technical specifications (based on the details included in the Relying Party's access certificate). |
| OIA_10 | For both proximity and remote presentation flows, if a Wallet Instance contains two PIDs and a Relying Party requests a PID, the Wallet Instance SHALL ask the User which of these PIDs they want to release. |
| OIA_11 | For both proximity and remote presentation flows, if a Wallet Instance contains two attestations having the same attestation type, and a Relying Party requests an attestation of that type, the Wallet Instance SHALL ask the User which of these attestations they want to release. <p><br>Note: Attestation types are explained in \[[Topic 12](#a2312-topic-12---attestation-rulebooks)\]. |
| OIA_12 | For both proximity and remote presentation flows, a Relying Party SHALL validate the signature or seal of a PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\]. |
| OIA_13 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature or seal of a QEAA in accordance with Art.32 of the eIDAS Regulation. For the verification, the Relying Party SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. |
| OIA_14 | For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature or seal of a PuB-EAA in accordance with [Art.32](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2594-73-1) of the eIDAS Regulation. For that verification, the Relying Party SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature or seal. The Relying Party SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. The Relying Party SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| OIA_15 | For both proximity and remote presentation flows, Relying Parties SHALL validate the signature or seal of a (non-qualified) EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see \[[Topic 12](#a2312-topic-12---attestation-rulebooks)\]. |

#### A.2.3.2 Topic 2 - Mobile Driving License with EUDI Wallet 

*Short description*

A User can obtain from a mobile Driver's License (mDL) Provider and
store in an EUDI Wallet Instance, their mDL. A User can then present the
mDL to a Relying Party upon request to prove their driving rights
conveniently, securely, and in compliance with the regulations of all
Member States.

This Topic contains high-level requirements related to a User presenting
a mobile Driver's License (mDL) to a Relying Party officer in a
supervised scenario, and also in an unsupervised scenario, in proximity
offline mode.

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

The mobile driving license (mDL) Rulebook contains requirements specific
to the mDL use case within the EUDI Wallet ecosystem.

Mobile driving licenses are legally specified in the proposed EC
Regulation 2023_127 (4th Driving License Regulation). This Regulation
specifies that mDLs shall comply with the ISO/IEC 18013-5 standard. It
does not mention any other standards, in particular not \[SD-JWT\].
Consequently, mDLs issued to a Wallet instance will not be implemented
as \[SD JWT\]- compliant documents. The mDL Rulebook therefore specifies
only an ISO/IEC 18013-5 compliant encoding

For more information, see Annex 3 - \[mDL Rulebook\].

*High level requirements*

| **Index** | **High Level Requirement** |
|-----------|--------------|
| mDL_01 | mDLs and mDL Providers SHALL comply with all requirements in \[mDL Rulebook\]. |

#### A.2.3.5 Topic 5 - EUDI Wallet Design Guide 
There are no HLRs for this Topic.

#### A.2.3.6 Topic 6 - Relying Party authentication and User Approval  

*Short description*

Relying Party authentication is a process whereby a Relying Party proves
its identity to a Wallet Instance, in the context of a transaction in
which the Relying Party requests the Wallet Instance to release some
attributes.

To perform Relying Party authentication, the Wallet Instance verifies a
Relying Party access certificate offered by the entity with which it
communicates, which is called a "Relying Party Instance". Note that
there could be multiple Relying Party Instances for each Relying Party.

*High level requirements*

A.  Relying Party authentication:

| **Index** | **Requirement specification** |
|-----------|--------------|
| RPA_01 | The Wallet Instance used by a User, as well as the Relying Party Instance used by the Relying Party, SHALL implement a mechanism for Relying Party authentication. This mechanism SHALL: <ul><li>enable the Wallet Instance to identify and authenticate the Relying Party,</li><li>enable the Wallet Instance to verify that the request from the Relying Party was not copied and replayed,</li><li>use Relying Party access certificates issued in accordance with \[[Topic 27](#a2327-topic-27---relying-party-registration)\].</li></ul> |
| RPA_02 | The Commission SHALL ensure that technical specifications for the Relying Party authentication mechanism mentioned in RPA_01 are created both for Wallet Instances complying with \[ISO/IEC 18013-5\] and for Wallet Instances complying with \[OpenID4VP\]. These specifications SHALL comply with applicable requirements in these standards. |
| RPA_03 | A Wallet Instance and a Relying Party Instance SHALL perform Relying Party authentication in all use cases, whether proximity or remote. <p><br>Note: The actions both entities perform differ. For example, while the Relying Party creates a signature over some data in the request, the Wallet Instance validates that signature. |
| RPA_04 | For the verification of Relying Party access certificates, a Wallet Instance SHALL accept the trust anchors in the Trusted List(s) of Relying Party Access CAs of all Member States. <p><br>Note: For more information about Relying Party Access Certificate Authorities, please see \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\]. |
| RPA_05 | If Relying Party authentication fails for any reason, the Wallet Instance SHALL NOT allow the User to release the requested attributes to the Relying Party. |
| RPA_06 | If Relying Party authentication succeeds, the Wallet Instance SHALL display to the User the name of the Relying Party as included in the Relying Party Instance access certificate, together with the attributes requested by the Relying Party. The Wallet Instance SHALL do so when asking the User for approval according to RPA_08. |


B.  User approval:

| **Index** | **Requirement specification** |
|-----------|--------------|
| RBA_09 | A Wallet Instance SHALL ensure the User approved the release of any attribute(s) in the Wallet Instance to a Relying Party, prior to releasing the attribute. A Wallet Instance SHALL always allow the User to refuse releasing an attribute requested by the Relying Party. |
| RBA_10 | A Wallet Instance SHALL ensure that the WSCA has authenticated the User, before allowing the User to give or refuse approval for releasing any attributes. <p><br>Note: See \[[Topic 09](#a239-topic-9---wallet-trust-evidence)\] for information about the WSCA. |
| RBA_11 | A Relying Party SHOULD group the attributes they request based on the use case, service, or purpose for which it requests these attributes. A Wallet Instance SHOULD ensure that for each group the User gives approval either to release all requested attributes, or none of them. |

#### A.2.3.7 Topic 7 - Attestation validity checks and revocation 

*Short description*

This Topic contains the high-level requirements (HLRs) which relate to
validity checks and revocation of PIDs, attestations (i.e., QEAAs,
PuB-EAAs and EEAs).

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
| VCR_01 | The PID Provider of a given PID, or the Attestation Provider of a given attestation, SHALL be the only party in the EUDI Wallet ecosystem capable of executing the revocation or suspension of that PID or attestation. Similarly, the Wallet Provider of a given WIA SHALL be the only party in the EUDI Wallet ecosystem capable of executing the revocation or suspension of that WIA. <p><br>Note: A PID Provider, Attestation Provider or Wallet Provider MAY outsource the operation of the revocation process to a third party. |
| VCR_02 | A PID Provider or Attestation Provider that revoked a PID or attestation SHALL NOT reverse the revocation. |
| VCR_03 | A PID Provider or Attestation Provider SHALL have a policy specifying under which conditions a PID or attestation it issued will be revoked or suspended. |
| VCR_04 | A PID Provider or Attestation Provider SHALL revoke a PID or attestation at least: <ul><li>upon the explicit request of the User,</li><li>when its security has been compromised,</li><li>upon the death of the User or cease of activity of the legal person who is the subject of the attestation.</li></ul> |
| VCR_05 | A PID Provider or Attestation Provider SHOULD revoke a PID or attestation, if necessary, rather than suspending it. |
| VCR_06 | If a PID Provider or Attestation Provider has suspended a PID or attestation, it SHALL either unsuspend or revoke that PID or attestation within a period of time specified in the policy mentioned in VCR_03. That policy SHALL also determine the conditions under which the PID or attestation will be unsuspended or revoked. |
| VCR_07 | A PID Provider or Attestation Provider SHALL revoke a PID or attestation if the value of one or more attributes in the PID or attestation has changed and the attestation is still valid for at least 24 hours. In this situation, the PID Provider or Attestation Provider SHALL issue a new PID or attestation with the correct value for the changed attribute. |
| VCR_08 | Wallet Providers SHALL implement the attestation revocation mechanisms specified per VCR_09 in their Wallet Solution(s). |
| VCR_09 | The Commission SHALL create or reference technical specifications providing all necessary details for PID Providers, Attestation Providers, and Wallet Providers to implement an Attestation Status List mechanism and/or an Attestation Revocation List mechanism for the PIDs, attestations and WIAs they issue. These technical specifications SHALL also contain all details necessary for Relying Party Instances and Relying Parties to use these mechanisms to verify the revocation status of PIDs, attestations, and WIAs. <p><br>Note: 'Attestation Status List' and 'Attestation Revocation List' are specific mechanisms, defined in Annex 1. |
| VCR_10 | If a Relying Party decides it needs to verify the revocation status of a PID, or attestation, it SHALL support both the Attestation Status List mechanism and the Attestation Revocation List mechanism specified per VCR_09. <p><br>Note: Per VCR_14, it is not mandatory for a Relying Party to verify whether a PID, or attestation is revoked. |
| VCR_11 | Wallet Providers SHALL support the Attestation Status List mechanism and the Attestation Revocation List mechanism specified per VCR_09 in their Wallet Solution(s). |
| VCR_12 | A PID Provider, QEAA Provider, or PuB-EAA Provider SHALL use one of the following methods for revocation of a PID, QEAA, or PuB-EAA: <ul><li>Only issue short-lived attestations having a validity period of 24 hours or less, such that revocation will never be necessary,</li><li>Use the Attestation Status List mechanism specified per VCR_09, or</li><li>Use the Attestation Revocation List mechanism specified per VCR_09.</li></ul> <br>Note: The 24-hour period originates from the relevant ETSI specifications. These require that the process of revocation must take at most 24 hours. Consequently, revocation makes no sense if the attestation is valid for less than 24 hours, because it will reach the end of its validity period before it is revoked. |
| VCR_13 | For non-qualified EAAs, the relevant Rulebook SHALL determine whether that type of EAA must be revocable. If an EAA type must be revocable, the relevant Rulebook SHALL determine which of the methods mentioned in VCR_12 must be implemented by the relevant EAA Providers for the revocation of an EAA. |
| VCR_14 | A Relying Party SHOULD verify the revocation status of a PID or attestation upon obtaining it from a Wallet Instance, following the steps specified per VCR_09. |
| VCR_15 | When no reliable information regarding the revocation status of a PID, or attestation is available, a Relying Party SHOULD perform a risk analysis considering all relevant factors for the use case, before taking a decision to accept or refuse the PID or attestation. |

#### A.2.3.8 Topic 8 - Design Solutions on Data Sharing scenarios 

There are no HLRs for this Topic.

#### A.2.3.9 Topic 9 - Wallet Trust Evidence  

*Short description*

When a PID Provider or Attestation Provider receives a request from a
User to issue a PID or attestation to the User's EUDI Wallet Instance,
the PID Provider or Attestation Provider needs to decide whether it can
comply with this request. To determine this, the PID Provider or
Attestation Provider needs to know (among other things) if the Wallet
Instance offers the functional capabilities required by the PID Provider
or Attestation Provider in its PID or attestation issuing policy. In
addition, the PID Provider or Attestation Provider needs to know if the
Wallet Secure Cryptographic Application(s) (WSCA) and the corresponding
Wallet Secure Cryptographic Device(s) (WSCD) used by the Wallet Instance
offer the required level of security. Therefore, the PID Provider or
Attestation Provider needs to receive trustworthy information about
these capabilities and security posture. 

This Topic introduces an information object that contains the necessary
information. This object is called the Wallet Trust Evidence (WTE). The
WTE contains a public key. By including this public key in the WTE, the
Wallet Provider attests that the corresponding private key is protected
by a certified WSCA/WSCD that has the properties and security posture
described in the WTE. The PID Provider or Attestation Provider then asks
that WSCA to create a key pair for its new PID or attestation, and to
prove that this new key is associated with the key in the WTE.
Association primarily means that the PID or attestation private key is
protected by the same WSCA as the WTE private key. A full description of
the concept of key association is given in the forthcoming White Paper
on Wallet Trust Evidence. Therefore, the PID Provider or Attestation
Provider can be sure that the security level of the new PID or
attestation key is the same as the security level of the WTE key. At the
moment of writing this version of the ARF, it is not fully clear how
many WSCDs will support the cryptographic functionalities necessary to
generate a proof of association. Therefore, the creation of a proof of
association in a WSCA is recommended (SHOULD), not required (SHALL). In
this way, once a Wallet Instance has access to a WSCD/WSCA that supports
the required cryptographic functionalities, proofs of association can be
used as described in this Topic.

Please note that the scope of this document is limited to the question
of how the WTE is issued during Wallet Instance activation and how it is
used during attestation issuance. The role played by the WTE during the
release of an attestation to a Relying Party is discussed in [Topic 18](#a2318-topic-18---relying-party-handling-eudi-wallet-attribute-combined-presentation)
(Combined presentation of attributes).

For more information, see the White Paper on Wallet Trust Evidence that
will be published in the same repository as the ARF.

*High level requirements*

A.  Creating the WTE during Wallet Instance activation

| **Index** | **Requirement** |
|-----------|--------------|
| WTE_01 | A Wallet Provider SHALL have to activate a new Wallet Instance before a User can use it to obtain an attestation. |
| WTE_02 | A WSCA SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Instance (i.e., a WTE key) or of an attestation in a Wallet Instance. |
| WTE_03 | A Wallet Instance SHALL authenticate the User before performing any operation excluding cryptographic operations. The Wallet Instance MAY rely on a WSCA certified to be compliant with applicable requirements for level of assurance "high" to do so, but MAY also rely on other components. <p><br>Note: Cryptographic operations can only be performed by the WSCA after User authentication according to WTE_02. |
| WTE_04 | For a Wallet Instance containing a natural-person PID, the User mentioned in WTE_02 and WTE_03 SHALL be the natural person who is the subject of that PID. |
| WTE_05 | For a Wallet Instance containing a legal-person PID, the User mentioned in WTE_02 and WTE_03 SHALL be a natural person appointed by the legal person who is the subject of that PID. <p><br>Note: This requirement does not imply that the actions of a legal-person Wallet Instance cannot be automated, or that the person(s) controlling the Wallet Instance must authenticate every time the Wallet Instance presents an attestation or creates a seal. The intent is that every operation performed by the legal-person Wallet Instance is performed under the responsibility of a natural person. |
| WTE_06 | A Wallet Provider SHALL only activate a new Wallet Instance if it has verified that: <ul><li>The Wallet Instance has access to at least one WSCA that is certified to be compliant with applicable requirements in this Topic, for level of assurance "high". In addition, the Wallet Instance MAY have access to one or more other WSCAs.</li><li>The private key corresponding to the public key in the WTE (see WTE_07) is protected by the respective WSCA.</li></ul> |
| WTE_07 | During the activation of a new Wallet Instance, a Wallet Provider SHALL sign at least one Wallet Trust Evidence (WTE) and issue it to the Wallet Instance. |
| WTE_08 | The Commission SHALL take measures to ensure that the contents, format and encoding of the Wallet Trust Evidence is specified in a technical specification. Each WTE SHALL describe the Wallet Instance and a certified WSCA available to that Wallet Instance, in such a way that a PID Provider or Attestation Provider processing the WTE is able to take a well-grounded decision on whether to issue an attestation to that Wallet Instance and WSCA. <br>Notes: <ul><li>In general, a PID Provider or Attestation Provider will also need information about the User. Such information is not contained in the WTE.</li><li>The WTE does not contain information allowing a PID Provider or Attestation Provider to verify whether the WTE (and by extension the Wallet Instance) is revoked. Revocation information for the Wallet Instance is instead included in the WIA defined in \[[Topic 38](#a2338-topic-38---wallet-instance-revocation)\].</li></ul> |
| WTE_09 | A Wallet Provider SHALL consider all relevant factors, including the risk of a WTE public key becoming a vector to track the User, when deciding on the validity period of a WTE. A Wallet Provider MAY use short-lived WTEs to mitigate such risks. |
| WTE_10 | A WSCA SHALL generate a new key pair for a new WTE on request of the Wallet Provider via the Wallet Instance. The WSCA SHALL register the new key as a WTE key in an internal registry. The WSCA SHALL register the WTE key as an independent (i.e., non-associated) key in an internal registry. <p><br>Note: A WTE key can be associated later with a PID or attestation key when that PID or attestation key is created, see WTE_13. |
| WTE_11 | A WTE SHALL contain a public key, and the corresponding private key SHALL be generated by the WSC described in the WTE. <p><br>Note: A WTE key pair is generated as per WTE_10. |
| WTE_12 | In case the Wallet Provider must update the WTE because the information in the WTE is outdated, the Wallet Provider SHALL ensure that the Wallet Instance only releases the latest version of a WTE to an Attestation Provider. |


B.  Using the WTE during issuance of an attestation

| **Index** | **Requirement** |
|-----------|--------------|
| WTE_13 | During PID or attestation issuance, a WSCA SHALL generate a new key pair for a new PID or attestation, on request of the PID Provider or Attestation Provider via the Wallet Instance. The PID Provider or Attestation Provider SHALL indicate a single WTE public key (see WTE_10) with which the new PID or attestation key must be associated. This indication can either be direct, by providing the WTE public key value, or indirect, by providing a public key value that has been associated with the WTE key previously. In the latter case, the WSCA SHALL look up the associated WTE key in its internal registry. <br>The WSCA SHALL register the new key in an internal registry as an attestation key. The WSCA SHALL register the association between the new private key and the WTE private key in an internal registry. <br>Notes: <ul><li>Direct indication of the WTE is used in case a PID Provider or Attestation Provider indicates during issuing that the new PID or attestation must be associated with a WTE public key, see WTE_15 and WTE_16.</li><li>Indirect indication of the WTE key is used in case an Attestation Provider indicates during issuing that the new attestation must be associated with an existing PID or attestation, see WTE_16.</li></ul> |
| WTE_14 | During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to the new PID or attestation public key, on request of the PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key. |
| WTE_15 | A PID Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new PID must be associated. This SHALL be a WTE public key. |
| WTE_16 | An Attestation Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new attestation must be associated. This SHALL be either a WTE public key or the public key of a PID or attestation that already exists in the Wallet Instance. <p><br>Note: if the Attestation Provider indicates a PID or attestation public key, this is an indirect indication of a WTE key, see WTE_13. |
| WTE_17 | During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to a WTE public key on request of a PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key. |
| WTE_18 | During PID or attestation issuance, a WSCA SHOULD generate a proof of association for two or more public keys, if and only if the corresponding private keys are protected by the same WSCA and the WSCA has internally registered an association between these private keys. <br>Notes: <ul><li>It is possible that some private keys in a WSCA are not associated with each other, even though they are managed within the same WSCA.</li><li>If two keys are associated, this implies that they are both associated with the same WTE key. The concept of associated keys is explained in the forthcoming White Paper on Wallet Trust Evidence.</li></ul> |
| WTE_19 | During PID or attestation issuance, the PID Provider or Attestation Provider SHALL verify that: <ul><li>The WSCA described in the WTE received from the Wallet Instance has proven possession of the private key corresponding to the public key in the WTE (see WTE_17),</li><li>The WSCA has proven possession of the new PID or attestation private key (see WTE_14)</li></ul> In addition, the PID Provider or Attestation Provider SHOULD verify that: <ul><li>The WSCA has proven association (see WTE_18) between the new PID or attestation public key and the public key requested by the PID Provider or Attestation Provider according to WTE_15 or WTE_16.</li></ul> <br>Notes: <ul><li>See also WTE_13.</li><li>These three proofs MAY be implemented as a single cryptographic proof.</li></ul> |
| WTE_20 | During PID or attestation issuance, a Wallet Instance SHALL provide the PID Provider or Attestation Provider with information on all WSCAs it is able to use for private key management and that comply with the PID Provider's or Attestation Provider's requirements. |
| WTE_21 | During PID or attestation issuance, a Wallet Instance SHALL provide the PID Provider or Attestation Provider with the WTE describing the properties of the WSCA that generated the new PID or attestation private key and protects it. |
| WTE_22 | If a Wallet Instance has access to multiple WSCAs, it SHALL register which PIDs and attestations are bound to each of these WSCAs. |

C.  Miscellaneous 

| **Index** | **Requirement** |
|-----------|--------------|
| WTE_23 | The common OpenID4VCI protocol defined in requirement ISSU_01 SHALL enable a Wallet Instance to transfer a WTE to a PID Provider or Attestation Provider. |
| WTE_24 | A Wallet Instance SHALL release a WTE only to a PID Provider or Attestation Provider, and not to a Relying Party or any other party. |
| WTE_25 | The common OpenID4VCI protocol SHALL enable a Wallet Instance to transfer the proofs of association and possession mentioned in WTE_19 to a PID Provider or Attestation Provider. <p><br>Note: These three proofs MAY be implemented as a single cryptographic proof. |
| WTE_26 | The common OpenID4VCI protocol SHALL enable a Wallet Instance to transfer a public key to a PID Provider or Attestation Provider, to be included in the new PID or attestation. |
| WTE_27 | The common OpenID4VCI protocol SHALL enable a PID Provider or Attestation Provider to indicate in the Token Response: <ul><li>the WSCA to which the new PID or attestation key must be bound, for example by referring to a WSCA identifier listed in the WTE</li><li>or, alternatively, the existing PID or attestation public key with which the new credential key must be associated.</li></ul> |

D.  Overview: Requirements for a WSCA

The technical requirements above imply the following requirements for a
WSCA.

| **Index** | **Requirement** |
|-----------|--------------|
| WTE_28 | A WSCA SHALL be able to verify the authentication factors of a User, in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. |
| WTE_29 | A WSCA SHALL be able to generate a new key pair on request of the Wallet Instance. |
| WTE_30 | A WSCA SHALL be able to prove possession of the private key corresponding to a public key on request of a Wallet Instance, for example by signing a challenge with that private key. |
| WTE_31 | A WSCA SHALL register each newly generated key pair as either a WTE key or an attestation key, depending on information provided by the Wallet Instance in the key generation request. The internal registry used by the WSCA for this purpose SHALL be protected against modification by external parties. |
| WTE_32 | A WSCA SHALL protect a private key it generated during the entire lifetime of the key. This protection SHALL at least imply that the WSCA prevents the private key from being extracted in the clear. If a WSCA is able to export a private key in encrypted format, the key used for key encryption SHALL be properly protected, for example as multiple key shares controlled by multiple key custodians. |
| WTE_33 | A WSCA SHALL associate each newly generated attestation key with a WTE key indicated by the Wallet Instance. The WSCA SHALL record the association between these keys in an internal registry, which SHALL be protected against modification by external parties. |
| WTE_34 | For the purposes of WTE_33, a Wallet Instance SHALL indicate the WTE key either directly, by WTE public key value, or indirectly, by value of a public key that is already associated to the intended WTE key. In the latter case, the WSCA SHALL look up the intended WTE key in its registry. |
| WTE_35 | A WSCA SHALL consider two keys to be associated if they are associated to a common WTE key. |
| WTE_36 | A WSCA SHOULD be able to generate a proof of association for two or more public keys. The WSCA SHALL generate such a proof if and only if the corresponding private keys are protected by that WSCA, and the WSCA has internally registered an association between these private keys. |

#### A.2.3.10 Topic 10 - Issuing a PID or Attestation to the EUDI Wallet 

**Also containing Topic 23 - PID issuance and Attestation issuance**

*Short description*

PID Providers and Attestation Providers issue PIDs and attestations to
EUDI Wallet Instances. This Topic lists the high-level technical
requirements related to PID and attestation issuance.

*High level requirements*

A - Generic HLRs

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_01 | Wallet Providers SHALL ensure that their Wallet Solution supports the OpenID4VCI protocol specified in [OpenID4VCI], with additions and changes as documented in this Annex (see e.g. this Topic and [[Topic 9](#a239-topic-9---wallet-trust-evidence)]) and in future technical specifications created by or on behalf of the Commission. |
| ISSU_02 | Wallet Providers SHALL ensure that their Wallet Solution supports the attestation formats specified in: <ul><li>ISO/IEC 18013-5, see [ISO18013-5].</li><li>"SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC].</li></ul> with additions and changes as documented in this Annex and in future technical specifications created by or on behalf of the Commission. |
| ISSU_03 | Wallet Providers SHALL ensure that their Wallet Solution supports the presentation protocols specified in: <ul><li>ISO/IEC 18013-5, see [ISO18013-5].</li><li>OpenID for Verifiable Presentations, see [OpenID4VP].</li></ul> with additions and changes as documented in this Annex and in future technical specifications created by or on behalf of the Commission. |
| ISSU_04 | The OpenID4VCI protocol specified in [OpenID4VCI] SHALL enable PID Providers and Attestation Provider to issue to a Wallet Instance a batch of multiple PIDs or attestations that are simultaneously valid and contain the same attributes. |
| ISSU_05 | A Wallet Instance SHALL support a process to activate a newly issued PID or attestation, in accordance with [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.2. The goal of the activation process is to verify that the PID or attestation was delivered into the Wallet Instance and WSCA of the User to whom it belongs. The Wallet Instance SHALL NOT allow a User to use a non-activated PID or attestation. |
| ISSU_06 | After a Wallet Instance receives a PID or an attestation from a PID Provider or Attestation Provider, it SHALL verify that the PID or attestation it received matches the request. |
| ISSU_07 | After a Wallet Instance receives a PID from a PID Provider, it SHALL validate the signature or seal of the PID using a trust anchor provided in a PID Provider Trusted List made available in accordance with [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. |
| ISSU_08 | After a Wallet Instance receives a QEAA from a QEAA Provider, it SHALL validate the qualified signature or seal of the QEAA in accordance with Art.32 of the eIDAS Regulation. For the verification, the Wallet Instance SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. |
| ISSU_09 | After a Wallet Instance receives a PuB-EAA from a PUB-EAA Provider, it SHALL validate the qualified signature or seal of the PuB-EAA in accordance with Art.32 of the eIDAS Regulation. For that verification, the Wallet Instance SHALL use the public key provided in the qualified certificate of the QTSP supporting the qualified signature or seal. The Wallet Instance SHALL also validate the qualified certificate of the QTSP using a trust anchor provided in a Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the eIDAS Regulation. Finally, the Wallet Instance SHALL also verify the certified attributes of the qualified certificate, as specified in [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1). |
| ISSU_10 | After a Wallet Instance receives a (non-qualified) EAA from an EAA Provider, it SHALL validate the signature or seal of the EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. <p><br>Note: Requirements ISSU_07 to ISSU_10 are equivalent to requirements OIA_12 to OIA_15 in [[Topic 1](#a231-topic-1---accessing-public-and-private-online-services-with-eudi-wallet)]. |
| ISSU_11 | A Wallet Instance SHALL request the User's approval before storing a PID or attestation obtained from a PID Provider or Attestation Provider. When requesting approval, the Wallet Instance SHALL show the contents of the PID or attestation to the User. The Wallet Instance SHALL also inform the User about the identity of the PID Provider or Attestation Provider, using the subject information in the PID Provider's or Attestation Provider's access certificate. |
| ISSU_12 | When a User instructs their Wallet Instance to request a PID or attestation from a PID Provider or Attestation Provider, the Wallet Instance SHALL request that PID or attestation in all formats supported by the PID Provider or Attestation Provider in accordance with the PID Rulebook or the applicable Attestation Rulebook, see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. <p><br>Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT format specified in [SD-JWT VC]. |

B - HLRs for PID issuance

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_13 | An EUDI Wallet Provider SHALL ensure that at least one PID Provider is willing to issue a PID complying with [PID Rulebook] to Users of the EUDI Wallet Instance it provides. |
| ISSU_14 | A PID Provider SHALL ensure that all PIDs it issues to Wallet Instances comply with the requirements specified in [PID Rulebook]. |
| ISSU_15 | A PID Provider SHALL support the OpenID4VCI protocol mentioned in ISSU_01 for issuing PIDs. |
| ISSU_16 | A PID Provider SHALL NOT provide the same set of values for mandatory PID attributes for more than one EUDI Wallet User. <p><br>Note: With the contents of the PID as currently described in [PID Rulebook], complying with this requirement may not be possible. If this turns out to be so, [PID Rulebook] will be changed. |
| ISSU_17 | A PID Provider SHALL implement device binding for all PIDs it issues, meaning it SHALL ensure that a PID is cryptographically bound to a WSCA used by the EUDI Wallet Instance, as specified in requirement WTE_13 in [[Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet)]. <p><br>Note that device binding is called mdoc authentication in [ISO/IEC 18013-5] and key binding in [SD-JWT-VC]. |
| ISSU_18 | A PID Provider SHALL verify the identity of the EUDI Wallet User in compliance with Level of Assurance (LoA) High requirements. |
| ISSU_19 | For the verification of WTEs and WIAs, a PID Provider SHALL accept the trust anchors in the Wallet Provider Trusted List(s) it needs. <br>Notes: <ul><li>Wallet Provider Trusted Lists are explained in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].</li><li>It is not mandatory for a PID Provider to accept all Wallet Provider Trusted Lists, if there are multiple. This is because it is not mandatory for a PID Provider to accept all certified Wallet Solutions in the EUDI Wallet ecosystem. Each PID Provider will choose which Trusted Lists they need to subscribe to.</li></ul> |
| ISSU_20 | A PID Provider SHALL publish a list of Wallet Solutions that they support for issuing their PID(s) in such a way that Users can easily find it, for example on the PID Provider's website. |
| ISSU_21 | Before issuing a PID, a PID Provider SHALL: <ul><li>verify that the EUDI Wallet Provider mentioned in the Wallet Instance's WTE is present in a Wallet Provider Trusted List.</li><li>authenticate and validate the WTE using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List.</li><li>Verify that the Wallet Instance's WIA is not revoked.</li></ul> <br>Note: For the WTE, see [[Topic 9](#a239-topic-9---wallet-trust-evidence)]. For the WIA, see [[Topic 38](#a2338-topic-38---wallet-instance-revocation)]. |
| ISSU_22 | A PID Provider SHALL include its PID Provider access certificate in its Client metadata used in the common OpenID4VCI protocol defined in ISSU_01. |
| ISSU_23 | For the verification of PID Provider access certificates, a Wallet Instance SHALL accept the trust anchors in the Trusted List(s) of PID Provider Access CAs it needs. <br>Notes: <ul><li>PID Provider Access CA Trusted Lists are explained in [[Topic 27](#a2327-topic-27---relying-party-registration)].</li><li>It is not mandatory for a Wallet Instance to accept all PID Provider Access CA Trusted Lists, if there are multiple. Wallet Providers will choose which Trusted Lists they need to subscribe to, for example depending on the Member State(s) they are operating in.</li></ul> |
| ISSU_24 | A Wallet Instance SHALL authenticate and validate the PID Provider access certificate before requesting the issuance of a PID. The Wallet Instance SHALL verify at least that: <ul><li>The access certificate indicates that its subject is a PID Provider,</li><li>The access certificate is authentic and is valid at the time of validation, and</li><li>The Issuer of the access certificate is a CA that is in a PID Provider Access CA Trusted List.</li></ul> <br>Note: The PID Provider Access CA Trusted List is not the same as the PID Provider Trusted List mentioned in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)]. |

C - HLRs for Attestation Issuance

| **Index** | **Requirement specification** |
|-----------|--------------|
| ISSU_25 | An Attestation Provider SHALL ensure all attestations issued to EUDI Wallets comply with the requirements specified in the applicable Rulebook, as described in [[Topic 12](#a2312-topic-12---attestation-rulebooks)]. |
| ISSU_26 | An Attestation Provider SHALL support the OpenID4VCI protocol mentioned in ISSU_01 for issuing attestations. |
| ISSU_27 | An Attestation Provider SHALL implement device binding for all attestations it issues, meaning it SHALL ensure that an attestation is cryptographically bound to a WSC used by the EUDI Wallet Instance, as specified in requirement WTE_13 in [[Topic 9](#a239-topic-9---wallet-trust-evidence)]. <p><br>Note that device binding is called mdoc authentication in [ISO/IEC 18013-5] and key binding in [SD-JWT-VC]. |
| ISSU_28 | For the verification of WTEs and WIAs, an Attestation Provider SHALL accept the trust anchors in the Wallet Provider Trusted List(s) it needs. <br>Notes: <ul><li>Wallet Provider Trusted Lists are explained in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].</li><li>It is not mandatory for an Attestation Provider to accept all Wallet Provider Trusted Lists, if there are multiple. This is because it is not mandatory for an Attestation Provider to accept all certified Wallet Solutions in the EUDI Wallet ecosystem. Each Attestation Provider will choose which Trusted Lists they need to subscribe to.</li></ul> |
| ISSU_29 | An Attestation Provider SHALL publish a list of Wallet Solutions that they support for issuing their attestation(s) in such a way that Users can easily find it, for example on the Attestation Provider's website. |
| ISSU_30 | Before issuing an attestation, a QEAA Provider or Pub-EAA Provider SHALL: <ul><li>verify that the EUDI Wallet Provider mentioned in the Wallet Instance's WTE is present in a Wallet Provider Trusted List.</li><li>authenticate and validate the WTE using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List.</li><li>Verify that the Wallet Instance's WIA is not revoked.</li></ul> <br>Note: For the WTE, see [[Topic 9](#a239-topic-9---wallet-trust-evidence)]. For the WIA, see [[Topic 38](#a2338-topic-38---wallet-instance-revocation)]. |
| ISSU_31 | Before issuing an attestation, an EAA Provider SHOULD: <ul><li>verify that the EUDI Wallet Provider mentioned in the Wallet Instance's WTE is present in a Wallet Provider Trusted List.</li><li>authenticate and validate the WTE using the trust anchor(s) registered for the Wallet Provider in the Wallet Provider Trusted List.</li><li>Verify that the Wallet Instance's WIA is not revoked.</li></ul> |
| ISSU_32 | An Attestation Provider SHALL include its Attestation Provider access certificate in its Client metadata used in the common OpenID4VCI protocol defined in ISSU_01. |
| ISSU_33 | For the verification of Attestation Provider access certificates, a Wallet Instance SHALL accept the trust anchors in the Trusted List(s) of Attestation Provider Access CAs it needs. <br>Notes: <ul><li>Attestation Provider Access CA Trusted Lists are explained in [[Topic 27](#a2327-topic-27---relying-party-registration)]. There may be separate Access CA Trusted Lists for QEAA Providers, PuB-EAA Providers, and EAA Providers.</li><li>It is not mandatory for a Wallet Instance to accept all Attestation Provider Access CA Trusted Lists, if there are multiple. Wallet Providers will choose which Trusted Lists they need to subscribe to, for example depending on the Member State(s) they are operating in.</li></ul> |
| ISSU_34 | A Wallet Instance SHALL authenticate and validate the Attestation Provider access certificate before requesting the issuance of an attestation. The Wallet Instance SHALL verify at least that: <ul><li>The access certificate indicates that its subject is a QEAA Provider, Pub-EAA Provider, or EAA Provider.</li><li>The access certificate is authentic and is valid at the time of validation.</li><li>The Issuer of the access certificate is a CA that is in the Attestation Provider CA Trusted List, as documented in [[Topic 27](#a2327-topic-27---relying-party-registration)].</li></ul> <br>Notes: <ul><li>The Attestation Provider CA Trusted List is not the same as the Attestation Provider Trusted List mentioned in [[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].</li><li>PID Providers, QEAA Providers, and PuB-EAA Providers are supposed to be trustworthy by default. For EAA Providers, the applicable Rulebook (see [[Topic 12](#a2312-topic-12---attestation-rulebooks)]) may define additional mechanisms allowing the Wallet Instance to verify that the EAA Provider is authorized or registered to issue the type of EAA the Wallet Instance is requesting.</li></ul> |

>  

#### A.2.3.11 Topic 11 - Pseudonym attestation  

*Short description*

The Pseudonym Rulebook contains requirements specific to the pseudonym
use case within the EUDI Wallet ecosystem. It specifies a single type of
pseudonym, which will be issued by a Pseudonym Provider to a User having
a Wallet Instance. The pseudonym specified in the Rulebook is not
designed to fit all possible use cases for pseudonyms and to comply with
all possible requirements. Rather, it is intended for basic use case,
namely allowing a Relying Party to recognize a User as someone about
whom the Relying Party already knows something, or with whom the Relying
Party has interacted before. Member States (or other Pseudonym
Providers) MAY specify and implement additional pseudonyms with
different characteristics and add these to their domestic pseudonym
namespace.

For more information, see [Annex 3](../annex-3/annex-3.03_pseudonyms-rulebook.md) - \[Pseudonym Rulebook\].

*High level requirements*

| **Index** | **Requirement specification** |
|-----------|--------------|
| PA_01 | Pseudonym Providers, Pseudonym attestations, and Wallet Instances SHALL comply with all applicable requirements in [Pseudonym Rulebook]. |

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
| ARB_1 | The body responsible for an Attestation Rulebook for a given type of attestation SHALL specify that at least one or more of the following common format(s) must be used for these attestations:                                                            <ul><li>The format specified in ISO/IEC 18013-5, see [ISO18013-5].</li><li>The format specified in "SD-JWT-based Verifiable Credentials (SD-JWT VC)", see [SD-JWT-VC].</li><li>The format specified in "W3C Verifiable Credentials Data Model", see [W3C VCDM v1.1] or [W3C VCDM v2.0]</li><ul> |
| ARB_2 | The body responsible for an Attestation Rulebook SHALL analyse whether it must be possible for a User to present that type of attestation when the Wallet Instance and the Relying Party are in proximity and attestations are presented without using the internet. If so, the Attestation Rulebook SHALL specify that the attestations must be issued in the ISO/IEC 18013-5-compliant mdoc format. |
| ARB_3 | The body responsible for an Attestation Rulebook SHALL specify in the Attestation Rulebook whether that type of attestation must be issued in the [SD-JWT VC]-compliant format, provided these documents have been approved by an EU standardization body or by the European Digital Identity Cooperation Group established pursuant to Article 46e(1) of the Regulation. |
| ARB_4 | The body responsible for an Attestation Rulebook MAY specify in the Attestation Rulebook that that type of attestation must be issued in a format compliant with [W3C VCDM v1.1] or [W3C VCDM v2.0], provided it references a document specifying in detail how a Relying Party can request attributes from a such an attestation, and how a User can selectively disclose attributes from such an attestation. This is provided these documents have been approved by an EU standardization body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the Regulation |

B.  Requirements regarding attestation types

| **Index** | **Requirement specification** |
|-----------|--------------|
| ARB_5 | The body responsible for an Attestation Rulebook SHALL specify a value for the attestation type which SHALL be unique within the scope of the EUDI Wallet ecosystem. The value of the attestation type SHOULD use the general format [Reverse Domain Name].[Domain Specific Extension].[Version], where the Domain Name SHOULD be controlled by the body specifying the Rulebook. |

C.  Requirements regarding attestation namespaces


| **Index** | **Requirement specification** |
| -----| --------|
| ARB_6 |  The body responsible for an Attestation Rulebook SHALL  define all attributes that an attestation of that type may  contain within one or more attribute namespace(s). An attribute namespace SHALL fully define the identifier, the syntax, and the semantics of each attribute within that  namespace have an identifier that is unique within the scopeof the EUDI Wallet ecosystem.|
| ARB_7 | When determining the attributes to be included in a new  attestation type, the party responsible for the applicable Attestation Rulebook SHOULD consider referring to attributes that have been defined already in a namespace included in   the catalogue as specified in [Topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabulary-for-attestation-attributes) + [26](#a2326-topic-26---attestations-catalogue), rather than   unnecessarily re-defining all attributes within a new  namespace. |
| ARB_8 | The body responsible for an Attestation Rulebook SHOULD,  when specifying a new attestation namespace, take into  consideration existing conventions for attribute identifier  values and attribute syntaxes. These conventions MAY depend on the format of the attestation, i.e., CBOR for ISO/IEC    18013-5 compliant attestations or JSON for \[SD-JWT VC\]-compliant attestations. |
| ARB_9 | The body responsible for an Attestation Rulebook SHOULD  ensure that the value of the namespace identifier uses the general format \[Reverse Domain Name\].\[Domain Specific Extension\].\[Version\], where the Domain Name SHOULD be controlled by the responsible body. |
| ARB_10 | The body responsible for an Attestation Rulebook MAY define  a domestic namespace to specify attributes that are specific to that Rulebook and are not included in the applicable  EU-wide or sectoral namespace. All requirements for  namespaces in this document also apply for domestic namespaces, except ARB_9. Instead, the value of a domestic  namespace identifier SHOULD be created by appending the  applicable ISO 3166-1 alpha-2 country code or the ISO 3166-2  region code, separated by a period, to the applicable  EU-wide or sectoral namespace. |
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
| ARB_26 | The body responsible for an Attestation Rulebook describing a type of attestation that is an EAA SHOULD define in the Rulebook:  <ul><li>mechanisms allowing a Wallet Instance to verify that the EAA Provider is authorized or registered to issue this type of EAA.</li><li>mechanisms allowing a Relying Party to obtain, in a trustworthy manner, the trust anchor(s) of EAA Providers issuing this type of EAA.</li></ul> |


#### A.2.3.13 Topic 13 - Developing an EUDI Wallet Architecture Based on Secure Element 

There are no HLRs for this Topic.

#### A.2.3.14 Topic 14 - Developing an EUDI Wallet Architecture Based on External Token 

There are no HLRs for this Topic.

#### A.2.3.15 Topic 15 - Developing an EUDI Wallet Architecture Based on Remote HSM 

There are no HLRs for this Topic.

#### A.2.3.16 Topic 16 - Signing documents with EUDI Wallet 

*Short description*

A Wallet Instance SHALL enable its User to create qualified electronic
signatures or seals. This goal can be reached by using signature or seal
creation capabilities of the Wallet Instance as a part of a local QSCD,
or by using a remote QSCD managed by a QTSP. 

This Topic contains high-level requirements related to the creation of
Qualified Electronic Signatures using an EUDI Wallet Instance. 

*High level requirements*

A.  Requirement for Wallet Providers

| **Index** | **Requirement specification** |
|-----------|------------|
| QES_01 | Wallet Providers SHALL ensure that each User has the possibility to receive a Qualified Certificate for Qualified Electronic Signature bound to a QSCD. |
| QES_02 | Wallet Providers SHALL ensure that each User has free-of-charge access to a Signature Creation Application which allows the creation of free-of-charge Qualified Electronic Signatures over any data.  Wallet Providers SHALL ensure that: <ul><li>The Signature Creation Application SHALL as a minimum be capable of signing User-provided data.</li><li>The Signature Creation Application SHALL be implemented as part of an EUDI Wallet Solution or external to it.</li><li>The Signature Creation Application SHALL be able to generate signatures in formats compliant with QES_08 and QES_12.</li></ul>  Notes: <ul><li>Signature Creation Application (SCA): see definition in ETSI TS 119 432 standard.</li><li>if the SCA is external to the Wallet Solution, it may be for example a separate mobile application, be hosted remotely, for instance by the QTSP or by a Relying Party.</li></ul>|
| QES_03 | For the use of the qualified certificate referred to in QES_01, Wallet Providers SHALL implement secure authentication and signature/seal invocation capabilities in the Wallet Solution, either as a part of a local QSCD external to the Wallet Solution, or as part of a remote QSCD managed by a QTSP. |
| QES_04 | Wallet Providers SHALL enable their Wallet Instances to interface with QSCDs using protocols and interfaces necessary for the implementation of secure authentication and signature or seal functionality. |
| QES_05 | Wallet Providers SHALL enable their Wallet Instances to be used for User enrolment to a Remote QES Provider (i.e., a QTSP offering remote QES). |
| QES_06 | Wallet Providers SHALL ensure that their Wallet Solution supports at least one of the following options for remote QES signature creation: <ul><li>remote QES creation through secure authentication to a QTSP signature web portal.</li><li>remote QES creation channelled by the Walle Instance.</li><li>remote QES creation channelled by a Relying Party.</li></ul> |
| QES_07 | Wallet Providers SHALL ensure that a Signature Creation Application embedded in their Wallet Solution supports the Cloud Signature Consortium specification, \[CSC\].|
| QES_08 | Wallet Providers SHALL ensure that their Wallet Instances are able to sign documents based on the following signature formats, either using an internal or an external Signature Creation Application component (SCA):  <ul><li>PAdES (PDF Advanced Electronic Signature) as specified in ETSI EN 319 142-1,</li><li>XAdES (XML Advanced Electronic Signature) as specified in ETSI EN 319 132-1,</li><li>JAdES (JSON Advanced Electronic Signature) as specified in ETSI TS 119 182-1,</li><li>CAdES (CMS Advanced Electronic Signature) as specified in ETSI EN 319 122-1,</li><li>ASiC (Associated Signature Container) as specified in ETSI EN 319 162-1.</li></ul> |
| QES_09 | Wallet Providers SHALL ensure that if a Wallet Instance acts as the signature creation application, it supports at least one of the signature formats mentioned in QES_08. |
| QES_10 | Wallet Providers SHOULD ensure that a Wallet Instance presents the document or data to be signed to the User.|
| QES_11 | Wallet Providers SHALL ensure that a Wallet Instance is able to compute the hash or digest of the document or data to be signed through a Signature Create Application component either internal or external to the Wallet Instance, using relevant standards. |
| QES_12 | Wallet Providers SHALL ensure that a Wallet Instance is able to create the signature value of the document or data to be signed either using a local or a remote signing application. <p><br> Note: a local signing application is on-device. It may either be embedded in the Wallet Instance or be an external application. |
| QES_13 | Wallet Providers SHALL ensure that a Wallet Instance provides a log of transaction records of qualified electronic signatures generated by the Wallet Instance, allowing the User to view the history of previously signed data or documents. |
| QES_14 | Wallet Providers SHALL ensure that Users will be able to give or refuse consent to the creation of a qualified electronic signature through their Wallet Instance. |
| QES_15 | Wallet Providers SHALL ensure that a Wallet Instance can verify the registration of Qualified Trust Service Providers providing signatures services (in remote signature creation scenarios). |
| QES_16 | Wallet Providers SHOULD ensure that a Wallet Instance supports multiple-signing scenarios where multiple signatories are required to sign the same document or data. |
| QES_17 | Wallet Providers SHALL ensure that EUDI Wallets provide a signature creation confirmation upon the creation of a qualified electronic signature, informing the EUDI Wallet user about the outcome of the signature creation process. |
| QES_18 | Wallet Providers SHALL provide at least one default qualified signing service to Users, supported by a Qualified Trust Service Provider (QTSP) offering qualified signature service. |
>  

B.  Requirements for QTSPs

| **Index** | **Requirement specification** |
|-----------|--------------|
| QES_23 | Wallet Providers SHALL ensure that the QTSP providing the remote QES part of the EUDI Wallet Solution supports:   <ul><li>ETSI TS 119 431-1 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev.</li><li>ETSI TS 119 431-2 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 2: TSP service components supporting AdES digital signature creation.</li><li>ETSI TS 119 432 - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation, and complies with the remote signing services with Sole Control Assurance Level (SCAL) 2 .</li></ul> |
| QES_24 | Wallet Providers SHALL ensure that a Wallet Solution supporting remote signing supports CEN EN 419 241-1 -- Trustworthy Systems Supporting Server Signing - Part 1: General System Security Requirements |

C.  Requirements for the Commission

| **Index** | **Requirement specification** |
|-----------|------------|
| QES_23 | Wallet Providers SHALL ensure that the QTSP providing the remote QES part of the EUDI Wallet Solution supports:  <ul><li>ETSI TS 119 431-1 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev.</li><li>ETSI TS 119 431-2 - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 2: TSP service components supporting AdES digital signature creation.</li><li>ETSI TS 119 432 - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation, and complies with the remote signing services with Sole Control Assurance Level (SCAL) 2.</li></ul> |
| QES_24 | Wallet Providers SHALL ensure that a Wallet Solution supporting remote signing supports CEN EN 419 241-1 -- Trustworthy Systems Supporting Server Signing - Part 1: General System Security Requirements |
| QES_25 | The Commission SHALL ensure that the Cloud Signature Consortium [CSC] specification is formally endorsed as a European standard.|
| QES_26 | The Commission SHALL ensure that ETSI TS 119 432 - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation (and other related specifications), is updated and completed according to the technical requirement of the EUDI Wallet. |


#### A.2.3.17 Topic 17 - Identity matching 

*Short description*

Users would like to use their PID to access their existing online
accounts using their EUDI Wallet, even if the identity data is not
exactly the same as in their other accepted eIDs. Users typically have
one or more bank accounts, regularly need to log in the public sector
services, or use online services provided by large platforms. This
enables them to use their preferred eID means for their online
interactions.

*High level requirements*

| **Index** | **Requirement specification** |
|-----------|---------------|
| IM_01 | Relying Parties in a Member State, providing cross-border services, SHALL ensure identity matching for natural persons when accessing existing accounts belonging to the same person, employing a risk-based approach.  <br>For purposes of ensuring identity matching, Relying Parties SHALL offer to natural person Users *at least* to:  <ul><li>request the identified EUDI Wallet User to identify with another eID means which is accepted by the Relying Party so to link the data received from the EUDI Wallet with the account to which the User proved to have access to.</li></ul>  In addition, Relying Parties MAY offer natural person Users to:   <ul><li>request for their PID to compare the PID attributes against attributes of existing accounts to verify whether their PID belongs to a current account owner.</li></ul> For purposes of facilitating identity matching by other Member States, Member States SHALL provide to natural person PID-s *at least* four optional attributes of their choice. |
| IM_02 | Identity matching MAY be provided by a Relying Party, by allowing additional linked notified electronic identification means or certified European Digital Identity Wallets, issued by another Member State to be used. |
| IM_03 | When requirements exist for Relying Parties cross-border services to allow persons access based on person identification data provided by other Member States, a Member State SHALL ensure risk-based identity matching and if necessary, at national level MAY require specific complementary unique identification procedures.<p><br> Where the natural person EUDI Wallet User in question cannot prove their identity with another eID means accepted by the Relying Party, the Member State MAY require complementary procedures for the User to prove their identity, such as to allow trained officials to verify the User's identity in a controlled environment. </p> |

#### A.2.3.18 Topic 18 - Relying Party handling EUDI Wallet attribute combined presentation 

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

-   How can a Wallet Instance receiving such a request present the
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
|  ACP_01 | Wallet Instances SHALL support the features in \[ISO18013-5\] and/or \[OpenID4VP\] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_02 | Relying Parties SHOULD support the features in \[ISO18013-5\] and/or \[OpenID4VP\] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_03 | If a Wallet Instance receives a message requesting a combined presentation of attributes, it SHALL process each request in that message separately, according to all relevant specifications, except for possible optimizations. |
| ACP_04 | If (as a result of ACP_03) a Wallet Instance determines it must release multiple attestations to a Relying Party in a combined presentation of attributes, it SHALL request a proof of association between the public keys of these attestations from the WSC. |
| ACP_05 | If (as a result of ACP_04), the Wallet Instance receives a proof of association from the WSCA, it SHALL include this proof in the response message containing the combined presentation of attributes and send it to the Relying Party. |
| ACP_06 | If a Relying Party receives a combined presentation of attributes including a proof of association, it SHOULD verify this proof to validate that the attestations in this presentation belong to the same User. |


B.  Process requirements

| **Index** | **Requirement specification** |
|-----------|----------------|
| ACP_07 | During issuance of a (Q)EAA, an Attestation Provider SHALL be able to request the association of the new (Q)EAA to a PID or another (Q)EAA already existing on the Wallet Instance, provided that the Attestation Provider has verified during the issuance process that the new (Q)EAA indeed belongs to the User of that existing PID or (Q)EAA. <p><br>Note: Also see requirement WTE_13 in \[Epic 09\] |
| ACP_08 | When receiving a combined presentation of attributes, a Relying Party SHOULD NOT refuse any attestation solely because a proof of association between these attestations is absent. |

C.  Miscellaneous

| **Index** | **Requirement specification** |
|-----------|-----------------|
| ACP_07 | During issuance of a (Q)EAA, an Attestation Provider SHALL be able to request the association of the new (Q)EAA to a PID or another (Q)EAA already existing on the Wallet Instance, provided that the Attestation Provider has verified during the issuance process that the new (Q)EAA indeed belongs to the User of that existing PID or (Q)EAA. <p><br>Note: Also see requirement WTE_13 in \[Epic 09\] |
| ACP_08 | When receiving a combined presentation of attributes, a Relying Party SHOULD NOT refuse any attestation solely because a proof of association between these attestations is absent. |
| ACP_09 | The common \[ISO18013-5\] and \[OpenID4VP\] protocols SHALL enable a Wallet Instance to transfer a proof of association to a Relying Party. The Commission SHALL take measures to ensure that this is the case. |

#### A.2.3.19 Topic 19 - EUDI Wallet User navigation requirements (Dashboard logs for transparency) 

*Short description*

In this use case, the User is accessing a common dashboard of the EUDI
Wallet Instance which provides a track record of transactions (i.e.
attribute requests and attribute presentations) executed through the
EUDI Wallet. The User is concerned about data privacy, and thus the
function of a dashboard ensures a higher degree of transparency, privacy
and control of the User over their personal data. 

This document explores high-level requirements related to the function
of a common dashboard of European Digital Identity Wallets.  

*HLRs*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| DASH_01 | An EUDI Wallet Provider SHALL enable the EUDI Wallet User access to a dashboard functionality, either via the EUDI Wallet Instance or external to the EUDI Wallet Instance. |
| DASH_02 | A dashboard SHALL include a functionality to allow the User to have an overview of all transactions executed through the Wallet Instance. |
| DASH_03 | For each presentation transaction executed through the Wallet Instance, the dashboard SHALL display to the User at least the time and date of the transaction, the corresponding Relying Party and the attributes requested and/or presented. |
| DASH_04 | For signature creation transactions executed through the Wallet Instance, the dashboard SHALL display to the User at least the following information specific to each signature creation: - the date and time of signature creation, - the document or data signed (where possible), - the hash of the document or data signed, - the signature value. |
| DASH_05 | The dashboard SHALL include details about all presentation and signature creation transactions executed through the EUDI Wallet, also including any transactions which were not completed successfully. |
| DASH_06 | An EUDI Wallet Provider SHALL ensure that all records included in the log cannot be altered or deleted, thus assuring the User that the displayed records in the dashboard were not altered, and thus confirming the authenticity and integrity of the information included in the dashboard. |
| DASH_07 | The dashboard SHALL include a log file functionality, allowing the EUDI Wallet User to view or export details of executed transactions. |
| DASH_08 | For a natural-person User, an EUDI Wallet Instance SHALL provide a User interface. |
| DASH_09 | The User Interface referred to in DASH_08 SHALL display an EU Digital Identity Wallet Trust Mark complying with technical specifications. |
| DASH_10 | The Commission SHALL develop technical specifications for an EUDI Trust Mark referred to in DASH_09. |
| DASH_11 | An EUDI Wallet Instance issued to a legal person SHALL allow the legal person to interact with the EUDI Wallet Instance in the appropriate interface provided by that EUDI Wallet Provider. |

#### A.2.3.20 Topic 20 - Strong User (Customer) Authentication in the context of electronic payments 

*Short description*

This topic deals with the requirement for Strong User (Customer)
Authentication (SCA) in the context of authenticating an EUDI Wallet
user as part of electronic payments.  

Users would like to be able to authenticate themselves during online
payments securely and conveniently using their EUDI Wallets, so that
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

In the future, the EUDI wallets could also be used for payments with
Central Bank Digital Currencies.  

*HLRs*

There are no HLRs for this Topic.

#### A.2.3.21 Topic 21 - [Diplomas](https://ec.europa.eu/digital-building-blocks/wikis/display/EDIWCS/EPIC-21-Diplomas+with+EUDI+Wallet) with EUDI Wallet 

There are no HLRs for this Topic.

#### A.2.3.22 Topic 22 - Digital Travel Credentials with EUDI Wallet 

There are no HLRs for this Topic.

#### A.2.3.23 Topic 23 - PID issuance and (Q)EAA issuance  

*Short description*

See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet).

*HLRs*

*See [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet).*

#### A.2.3.24 Topioc 24 - User identification in proximity scenario 

*Short description*

In this use case, the User is utilizing the Wallet Instance for
identification purposes in proximity scenarios. The User is concerned
about sharing personal data in proximity, while ithe User\'s objectives
include identifying themselves to services requiring user identification
and maintaining control over their personal data sharing. 

This topic explores high-level requirements related to User
identification in proximity use cases where Users utilize their EUDI
Wallet Instances. 

*HLRs*

| **Index** | **Requirement specification** |
|-----------|----------------|
| ProxId_01 | For proximity identification purposes, an EUDI Wallet Instance SHALL be able to establish a connection with Relying Party Instances and process their presentation requests in accordance with the technical specification mentioned in ProxId_02. |
| ProxId_02 | The Commission SHALL develop technical specifications for proximity connection establishment and presentation request processing, in accordance with the protocols and interfaces specified in ISO/IEC 18013-5. |
| ProxId_03 | An EUDI Wallet Instance SHALL present the corresponding presentation request and the identity of the Relying Party to the EUDI Wallet User after processing the proximity identification request. |
| ProxId_044 | An EUDI Wallet Instance SHALL request its User to approve the disclosure of attributes from their Wallet Instance for proximity identification before disclosing any data. |
| ProxId_05 | An EUDI Wallet Instance SHALL transmit the requested User attributes to the requesting Relying Party Instance securely in accordance with technical specifications, according to the agreed common protocols and interfaces, as specified in ISO/IEC 18013-5 for proximity flow. |
| ProxId_06 | For proximity identification scenarios, the EUDI Wallet Instance SHALL verify the authenticity and validity of the Relying Party Instance and of the corresponding attribute request. |

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
| CAT_08 | The Commission SHALL enable the registration by any entity of all types of attributes used within the EUDI Wallet ecosystem in QEAAs and PuB-EAAs, in a catalogue of attributes. <p><br>Note: The catalogue of attributes MAY contain also attributes used in non-qualified EEAs. <p><br>Note: The catalogue of attributes does need not be a separate catalogue, but rather it could be combined with the Attestation Rulebooks catalogue mentioned in CAT_01. |
| CAT_09 | The Commission will enable self-registration process of attributes in the catalogue of attributes, without pre-approval of the registry, for both public and private entities. |
| CAT_10 | The Commission SHALL make the catalogue of attributes publicly available and machine-readable. <p><br>Note 1: The requirement for availability means setting up the required means for high availability and avoiding a single point of failure. This requirement is applicable also to the Attestation Rulebooks catalogue mentioned in CAT_01. <p>Note 2: See for example the following semantic artifacts, which can be part of the catalogue of attributes: <ul><li>[The ultimate objective of the](https://joinup.ec.europa.eu/collection/isa-action-201612-semantic-interoperability-representation-powers-and-mandates-0/solution/representation-powers-and-mandates-ontology#:~:text=The%20ultimate%20objective%20of%20the,structured%20and%20machine%2Dreadable%20format)</li><li>[SEMPER \| DE4A](https://www.de4a.eu/semper)</li></ul> |
| CAT_11 | The Commission SHALL make publicly available the existence and maintenance of the catalogue of attributes mentioned in CAT_09, including processes to propose the registration to public and private parties, allowing to register attributes, and conditions for updating and/or removing attributes. These processes SHALL include archiving and logging changes of the history of the catalogue of attributes in an appropriate way, including versioning. <p><br>Note: There are layers on top of the attributes that need maintenance as well. So, maintenance in this case is more generic and encompasses more than just the attribute itself. |

#### A.2.3.26 Topic 26 - Attestations\' Catalogue 

*Short description*

See [topic 25](#a2325-topic-25---unified-definition-and-controlled-vocabulary-for-attestation-attributes).

*HLRs*

| **Index** | **Requirement specification** |
|-----------|---------------|
| CAT_01 | The Commission SHALL enable registration by any entity, of Attestation Rulebooks for QEAAs and PuB-EAAAs, used within the EUDI Wallet ecosystem, in a catalogue. <p><br>Note: The catalogue MAY also contain Rulebooks for non-qualified EEAs. |
| CAT_02 | The Commission SHALL make the catalogue publicly available and machine-readable, by hosting the catalogue, or parts of it, including an e-discovery mechanism and/or by referencing to other catalogues. |
| CAT_03 | The Commission will enable self-registration process without pre-approval of the registry, of Attestation Rulebooks, for both public and private entities. |
| CAT_04 | The Commission SHALL specify and make publicly available three (3) Rulebooks for the following generic types of Attestations -- QEAA, PuB-EAA, and non-qualified EAA. |
| CAT_05 | The Commission SHALL make publicly available the existence and maintenance of the Attestation Rulebooks catalogue mentioned in CAT_01, including processes to propose the registration to public and private parties, allowing to register an Attestation Rulebook, and conditions for updating and/or removing Attestation Rulebooks. These processes SHALL include archiving and logging changes of the history of the Attestation Rulebooks catalogue in an appropriate way, including versioning. |
| CAT_06 | The body responsible for the Attestation rulebook SHALL include a unique reference to this body and the way to contact it, or how to find information for doing so. <p><br>Note: There is an option also for Member States own extensions for rulebooks, in a hierarchical way, derived and elaborated from a Union rulebook. <p><br> Note: Rulebooks MAY be shared between interested parties in an out-of-band manner. |
| CAT_07 | When determining the attributes to be included in a new attestation type, the party specifying the applicable Attestation Rulebook SHOULD consider using attributes that have been defined already in a namespace included in the Attestation Rulebooks catalogue mentioned in CAT_01, rather than unnecessarily re-defining all attributes within a new namespace. |

#### A.2.3.27 Topic 27 - Relying Party registration 

*Short description*

PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA
Providers and Relying Parties SHALL register with a Registrar in their
Member State. The main goal of the registration process is for the
entity to receive an access certificate that Wallet Instances can use to
authenticate them

This Topic specifies high-level requirements related to the registration
of the abovementioned entities. 

*HLRs*

A.  *General requirements for Member State registration processes*

| **Index** | **Requirement specification** |
|-----------|----------------|
| Reg_01 | Member States SHALL provide processes and mechanisms for PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers and Relying Parties to register in a registry. <p><br>Note: Member States may choose to implement a single registry for all these roles, or a separate registry for each of these roles. |
| Reg_02 | Member States SHALL make publicly available all necessary details and documentation about the registration processes for their registry. |
| Reg_03 | Member States SHALL publish the registry entries online, in a sealed or signed machine-readable common format suitable for automated processing, according to the revised eIDAS Regulation Article 5b 5, for the purpose of transparency to Users and other stakeholders. |
| Reg_04 | Member States SHALL make the registry available online, in a common human-readable format. |
| Reg_05 | The Commission SHALL establish a technical specification for the common formats mentioned in Reg_04 and Reg_05. |
| Reg_06 | The Commission SHALL provide specifications for a common API for retrieving registry entries from the Member States registries per Reg_04, defining the minimum requirements for interoperability. |
| Reg_07 | The Commission SHALL provide specifications for a common User interface for accessing the Member State registries per Reg_05. |
| Reg_08 | The API mentioned in Reg_06 and the User interface mentioned in Reg_07 SHALL make use of a secure channel protecting the authenticity and integrity of the information in the registry during transport. |
| Reg_09 | The API mentioned in Reg_06 and the User interface mentioned in Reg_07 SHALL NOT require authentication or prior registration and authorization of any entity wishing to retrieve the information in the registry. |


B.  *General requirements for the issuance of access certificates*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| Reg_10 | A Member State SHALL ensure that an Access CA notified according to \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\] issues an access certificate to all PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers and Relying Parties registered in one of the Member State's registries. |
| Reg_11 | A Member State SHALL ensure that the issuance process of access certificates by their notified Access CA(s) complies with a common Certificate Policy for Access CAs. |
| Reg_12 | The Commission SHALL provide technical specifications establishing the common Access CA Certificate Policy mentioned in Reg_11. |
| Reg_13 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority logs all issued certificates for Certificate Transparency (CT). |
| Reg_14 | The common Certificate Policy mentioned in Reg_12 SHALL require that an Access Certificate Authority provides one or more method(s) to revoke the access certificates it issued. |
| Reg_15 | The common Certificate Policy mentioned in Reg_12 SHALL include a policy for revocation, which SHALL require that an Access Certificate Authority revokes an access certificate at least when: <ul><li>the certificate subject is withdrawn or suspended from the respective Registry,</li><li>on request of the certificate subject, or</li><li>on request of a competent national authority.</li></ul> |
| Reg_16 | The common Certificate Policy mentioned in Reg_12 SHALL specify the profile of access certificates in detail. |
| Reg_17 | The common Certificate Policy mentioned in Reg_12 SHALL require that an access certificate indicates whether its subject is a PID Provider, a QEAA Provider, a PuB-EAA Provider, a (non-qualified) EAA Provider, or a Relying Party Instance. |
| Reg_18 | The common Certificate Policy mentioned in Reg_12 SHALL define the minimum change history information to be stored for resolving possible disputes regarding registration. |


C.  *Requirements for the registration of PID Providers*

| **Index** | **Requirement specification** |
|-----------|---------------------|
| Reg_19 | A Member State SHALL approve a PID Provider according to a well-defined policy before including it in its PID Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of PID Providers in its Registry. |
| Reg_20 | A Member State SHALL identify PID Providers remotely, at a level of confidence proportionate to the risk arising from the potential harm a fraudulent PID Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |

D.  *Requirements for the registration of Attestation Providers*

| **Index** | **Requirement specification** |
|-----------|-------------------|
| Reg_21 | A Member State SHALL approve an Attestation Provider according to a well-defined policy before including it in its Attestation Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of Attestation Providers in its Registry. These processes and rules SHOULD consider any relevant differences between QEAA Providers, PuB-EAA Providers and (non-qualified) EAA Providers. |
| Reg_22 | A Member State SHALL identify Attestation Providers (i.e., QEAA Providers, PuB-EAA Providers and non-qualified EAA Providers) remotely, at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Attestation Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |

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
| Reg_31 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains a name for the Relying Party, in a format suitable for presenting to a User. <p><br>Note: A Wallet Instance needs such a name when requesting User approval according to \[[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)\]. |
| Reg_32 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains an EU-wide unique identifier for the Relying Party. <p><br>Note: The Wallet Instance needs such an identifier at least to determine which value to present for a User pseudonym; see \[[Topic 11](#a2311-topic-11---pseudonym-attestation)\]. |

#### A.2.3.28 Topic 28 - EUDI Wallet for legal person 

*Short description*

This topic is focused on identifying high-level requirements for a
legal-person EUDI Wallet. All the core capabilities of the EUDI Wallet
for a natural person are available for a legal person. There are some
differences between a natural and legal person that accordingly leads to
different requirements for issuing legal-person PIDs and the EUDI Wallet
Instances containing legal-person PIDs. 

-   A legal-person PID is issued under an eID scheme.

-   A legal-person PID is described in a legal-person PID Rulebook,
    which is different from the natural-person PID Rulebook in \[PID
    Rulebook\]. A legal-person PID has a different attestation type than
    a natural-person PID, and also contains different attributes. For
    example, date of birth or age are not relevant information for legal
    persons. Specifying a different Rulebook for legal-person PIDs
    allows Relying Parties and other EUDI Wallet Instances to request
    these attributes.  

-   A legal-person EUDI Wallet Solution may be implemented in the same
    manner as a natural-person Wallet Solution, meaning chiefly that it
    is implemented on a mobile device operated by a single User, who is
    a natural person. However, a legal-person EUDI Wallet Solution may
    also be implemented as a server-based (web-based) application. In
    the latter case, a Wallet Instance can be used either by one or more
    natural persons appointed by the legal person, or by information
    systems of the legal persons that give an EUDI Wallet Instance
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

#### A.2.3.30 Topic 30 - Interaction between EUDI Wallets 

*Short description*

An EUDI Wallet User can request from another EUDI Wallet User to share
an attestation of attributes using their EUDI Wallet Instances when
their EUDI Wallet devices are close together (that is, in physical
proximity) with internet connectivity for both devices (online), or
without internet connectivity for both devices (offline). 

This document explores the high-level requirements related to the
interaction between two EUDI Wallet Instances in proximity offline mode
and in proximity online mode.*HLRs*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| W2W_01 | An EUDI Wallet Instance SHALL support an interface and protocol for: <ul><li>Establishing a connection with another EUDI Wallet</li><li>Receiving PID and (Q)EAA requests from another EUDI Wallet</li><li>Validating such requests</li><li>Responding to such requests in accordance with the technical specifications as defined by \[OpenID4VP\] and \[ISO/IEC 18013-5\]</li></ul> |
| W2W_02 | The Commission SHALL develop technical specifications for exchanging PID and attestations between two EUDI Wallet Instances in accordance with the technical specifications as defined by \[OpenID4VP\] and \[ISO/IEC 18013-5\]. |
| W2W_03 | The Requestor Wallet Instance SHALL authenticate the User prior to requesting attestations presentation from another EUDI Wallet Instance. |
| W2W_04 | The Requestee Wallet Instance SHALL request User approval, as specified in \[[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)\], before presenting requested attestations or attributes to another EUDI Wallet Instance. The Wallet Instance SHALL inform the User about the attributes that are being requested, and of the outcome of authentication and validation checks of the request and the requestor. |
| W2W_05 | The Requestor Wallet Instance SHOULD have pre-defined a list of attributes of PID or attestations that can be requested from the Requestee EUDI Wallet Instance. |
| W2W_06 | The Requestee Wallet Instance SHALL authenticate and validate the Requestor, ensuring the validity of the Requestor Wallet Instance and the attribute request. |
| W2W_07 | A Requestor EUDI Wallet Instance SHALL display to the Requestor User the received attributes. |

#### A.2.3.31 Topic 31 - PID Provider, Wallet Provider, Attestation Provider and Access Certificate Authority notification and publication 

*Short description*

PID Providers, PuB-EAA Providers, Wallet Providers and Relying Party
Access Certificate Authorities must be notified by a Member State to the
Commission. As part of the notification process, the trust anchors of
these parties must be included in a Trusted List. A trust anchor is the
combination of a public key and an identifier for the associated entity.
Trust anchors are required for the verification of the signatures of
PIDs, attestations, WIAs and WTEs, and access certificates that are
issued by these parties.

This Topic contains High-Level Requirements for the notification of
these parties by Member States, and for the publication of the notified
information by the Commission.

*HLRs*

A.  Generic requirements for notification

| **Index** | **Requirement specification** |
|-----------|-----------------|
| GenNot_01 | The European Commission SHALL establish technical specifications for a common system enabling the notification of PID Providers, PuB-EAA Providers, Wallet Providers, and Relying Party Access Certificate Authorities by Member States to the Commission. <p><br> Note: Notification does not apply to QEAA Providers and (non-qualified) EAA Providers, as explained in sections D and F below, respectively. |
| GenNot_02 | As part of the specifications referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the notification of a PID Provider, PuB-EAA Provider, Wallet Provider or Relying Party Access Certificate Authorities to the Commission. <p><br> Note: The outcome of the notification procedure is the publication of the information notified by the Member State according to [Article 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1) (18) in a machine and human readable manner using the common system mentioned in section H, TLPub_01. |
| GenNot_03 | The common system mentioned in GenNot_01 SHALL enable: <ol type="a"><li>A secure notification channel between MS & COM for all notifications.</li><li>A notification, verification, and publication process and associated validation steps (with follow-up and monitoring) at the Commission side.</li><li>Collected data to be processed, consolidated, signed/sealed and published in both a machine-processable Trusted List and in a human-readable format, manually and/or automatically using e.g. a web service and/or API.</li></ol> |
| GenNot_04 | As regard to GenNot_03, point b), the Commission SHALL verify whether the notified data is complete and meets the technical specifications, while the Member States SHALL be responsible for the correctness of the notified information. |
| GenNot_05 | As part of the specifications referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the withdrawal of a PID Provider, PuB-EAA Provider, Wallet Provider, or Relying Party Access Certificate Authority. These operating procedures SHALL include unambiguous conditions for withdrawal. As an outcome of the withdrawal procedure, the status of the withdrawn PID Provider, PuB-EAA Provider, Wallet Provider, or Relying Party Access Certificate Authority in the Trusted List SHALL be changed to Invalid. |

B.  Requirements for the notification of PID Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| PPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about PID Providers. |
| PPNot_02 | The common set of information to be notified about a PID Provider SHALL include: <ol><li>Identification data:<ol><li>MS/Country of establishment,</li><li>Name as registered in an official record,</li><li>Where applicable:<ol><li>A business registration number from an official record,</li><li>Identification data from that official record.</li></ol></li></ol></li><li>PID Provider trust anchors, i.e., public keys and name as per point 1) ii) above, supporting the authentication of PIDs issued by the PID Provider,</li><li>PID Provider Access CA trust anchors, i.e., public keys and CA name, supporting the authentication of the PID Provider by Wallet Instances at the service supply point(s) listed per point 4) below.</li><li>Service supply point(s), i.e., the URL(s) at which a Wallet Instance can start the process of requesting and obtaining a PID.</li></ol><p>Notes: <ul><li>Relating to point 3) above: PID Provider Access CA trust anchors are notified separately from the Relying Party Access CA (see section G below), since PID Providers are -legally speaking- not Relying Parties.</li><li>For the concept of an Access CA, see also \[[Topic 27](#a2327-topic-27---relying-party-registration)\] and section 6.3.2 of \[ARF\]. </li></ul> |
| PPNot_03 | PID Providers SHALL ensure that all PIDs they issue can be authenticated using the PID Provider trust anchors notified to the Commission. |
| PPNot_04 | PID Providers SHALL ensure that their PID Provider access certificates can be authenticated using the PID Provider Access CA trust anchors notified to the Commission. <p><br>Note: \[[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)\] describes how access certificates will be used. |
| PPNot_05 | PID Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider Trusted List which is sealed by the Commission. |
| PPNot_06 | PID Provider Access CA trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider Access CA Trusted List which is signed or sealed by the Commission. |
| PPNot_07 | The format of the PID Provider Trusted List SHALL be aligned with ETSI TS 119 612 v2.1.1 or comply with a suitable profile similarly derived from ETSI TS 102 231. |


C.  Requirements for the notification of Wallet Providers

| **Index** | **Requirement specification** |
|-----------|-----------------|
| WPNot_01 | The European Commission SHALL establish technical specifications for the common set of information to be notified about Wallet Providers. |
| WPNot_02 | The common set of information to be notified about a Wallet Provider SHALL include: <ol><li>Identification data:<ol><li>MS/Country of establishment</li><li>Name as registered in an official record</li><li>Where applicable:<ol><li>Business registration number from an official record, and</li><li>Identification data from the official record.</li></ol></li></ol></li><li> Wallet Provider trust anchors, i.e., public keys and name as per point 1) b. above, supporting the authentication of Wallet Trust Evidences and Wallet Instance Attestations issued by the Wallet Provider.</li></ol><p><br>Notes:<ul><li>See \[[Topic 9](#a239-topic-9---wallet-trust-evidence)\] for the definition of the Wallet Trust Evidence. See \[[Topic 38](#a2338-topic-38---wallet-instance-revocation)\] for the definition of the Wallet Instance Attestation.</li><li>A Wallet Provider does not need an access certificate to interact with Wallet Instances.</li></ul> |
| WPNot_03 | Wallet Providers SHALL ensure that all WTEs and WIAs they issue can be authenticated using the trust anchors notified to the Commission. |
| WPNot_04 | Wallet Provider trust anchors SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled Wallet Provider Trusted List which is sealed by the Commission. |
| WPNot_05 | The format of the Wallet Provider Trusted List SHALL be aligned with ETSI TS 119 612 v2.1.1 or comply with a suitable profile similarly derived from ETSI TS 102 231. |

D.  Requirements for the notification of QEAA Providers

There is no notification of QEAA Provider foreseen by the Regulation,
except for establishing the [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) Trusted List once a qualified status
is granted. QTSPs issuing QEAAs to Wallet Instances SHALL abide by the
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
| PuBPNot_02 | The common set of information to be notified by Member States about PuB-EAA Providers SHALL include at least: <ol><li>Identification data:<ol><li>MS/Country of establishment</li><li>Name as registered in an official record</li><li> Where applicable: <ol><li>Registration number as in official record, and </li><li>Official record identification data</li></ol></li><li>Identification data of the Union or national law under which <ol><li>Either the PuB-EAA Provider is established as the responsible body for the authentic source based on which the electronic attestation of attributes is issued, or </li><li>The PuB-EAA Provider is the body designated to act on behalf of the responsible body referred to in point 1) iv) a).</li></ol></li><li>The conformity assessment report issued by a conformity assessment body, confirming that the requirements set out in paragraphs 1, 2 and 6 of [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1) are met.</li></ol></li><li>Service supply point(s), i.e., the URL(s) at which a Wallet Instance can start the process of requesting and obtaining a PuB-EAA from the PuB-EAA Provider.</li></ol> |
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
| RPACANot_02 | The common set of information to be notified about an Access Certificate Authority SHALL include: <ol><li>Identification data:<ol><li>MS/Country of establishment,</li><li>Name as registered in an official record,</li><li> Where applicable:<ol><li>A business registration number from an official record,</li><li>Identification data from that official record.</li></ol></li></ol></li><li>Access CA trust anchors, i.e., public keys and name as per point 1) ii), supporting the authentication of Relying Parties, QEAA Providers, PuB-EAA Providers, and (non-qualified) EAA Providers by Wallet Instances.</li></ol> |
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

#### A.2.3.33 Topic 33 - EUDI Wallet backup and restore 

*Short description*

The relevant scenario for the backup and restore functionality, is when
the User can no longer access the data, the electronic attestations of
attributes and the configurations, that were stored on the mobile device
on which the EUDI Wallet was installed, including its accessories. The
situations may include the mobile device has either been lost, stolen,
broken or hacked (e.g., a result of unauthorized access to the device)
or it malfunctions. 

The topic deals with situations when a User replaces an existing
installation of an EUDI Wallet Solution with a new installation of the
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
| BR_01 | A Wallet Instance SHALL include a Backup and Restore Object. |
| BR_02 | The Commission SHALL define a technical specification of the Backup and Restore Object. |
| BR_03 | The Wallet Instance SHALL log all attestations that are issued to it, by adding an entry to the Backup and Restore Object. |
| BR_04 | An EUDI Wallet Instance SHALL enable the User to export the Backup and Restore Object to external storage. |
| BR_05 | An EUDI Wallet Solution Provider SHALL store and transfer the Backup and Restore Object in a way that it is protected against use of it by others than the User. |

B.  Restore Requirements 

| **Index** | **Requirement specification** |
|-----------|-----------------|
| BR_06 | An EUDI Wallet solution SHALL support a procedure that will perform the following restore steps from BR_07 up to BR_16. |
| BR_07 | An EUDI Wallet Instance SHALL enable the User to request from the PID Provider to re-issue the PID in the Backup and Restore Object. The PID SHALL be the first Attestation to be restored from the Backup and Restore Object. |
| BR_08 | A Wallet solution SHALL enable the User to initiate the Restoration function, following a successful re-issuance of the PID. |
| BR_09 | The Wallet Instance SHALL present an error message to the User, if an error is detected in the Backup and Restore Object intended to be restored. |
| BR_10 | The Wallet Instance SHALL retrieve the Backup and Restore Object, if the activities in BR_09 were successful. |
| BR_11 | Attestation Providers SHALL enable the initiation by an EUDI Wallet Instance of a secured session for re-issuance of attestations issued by them. |
| BR_12 | The Wallet Instance SHALL initiate a secured session with the relevant Attestation Provider for each attestation recorded in the Backup and Restore Object. |
| BR_13 | The Wallet Instance SHALL initiate an issuance request for any attestation recorded in the Backup and Restore Object, that is selected by the User. |
| BR_14 | The Wallet Instance SHALL continue the procedure described in BR_12 to BR_13 for all attestations recorded in the Backup and Restore Object. |
| BR_15 | The Wallet Instance SHALL present to the User the results of the restoration process for every attestation, indicating whether it was successful or not. |
| BR_16 | The new Wallet Instance SHALL log all the restored attestation in its Backup and Restore Object (as described in BR_01). |

#### A.2.3.34 Topic 34 - Migrate to a different wallet solution 

*Short description*

The most relevant scenario for this functionality is when a user would
like to migrate from one Wallet solution to a different Wallet solution.
Another scenario would be when the Wallet solution provider ceases to
support the Wallet solution, or even ceases to exist as a Legal Person,
and thus the User is forced to abandon the current Wallet solution and
migrate to a different Wallet solution.

To migrate to a different Wallet solution, there is a need to transfer
the data, the electronic attestations of attributes and the
configurations, that were stored on the mobile device on which the
original EUDI Wallet was installed, including its accessories, to the
different Wallet solution.  

This topic is similar in some **characteristics to [Topic 33](#a2333-topic-33---eudi-wallet-backup-and-restore) that** deals
with backup and restore to the **same** Wallet solution, but in [Topic 34](#a2334-topic-34---migrate-to-a-different-wallet-solution)
the migration is to a **different** Wallet solution. A main difference
is that the current mobile device that the User would like to migrate
from is still under the control of the User and in the User\'s
possession, and the relevant data that exists on the current Wallet
solution is not lost and is accessible. 

*HLRs*

There are no specific requirements in this Topic. 

#### A.2.3.35 Topic 35 - PID Issuance service blueprint 

*Short description*

The PID Issuance Service Blueprints analyses the meaningful user
journeys for PID issuance to EUDI Wallets. The corresponding analysis
focuses on natural persons only and explores different scenarios
covering both remote and proximity use cases. 

This document explores high-level requirements related to the PID
Issuance user journey. 

*HLRs*

| **Index** | **Requirement specification** |
|-----------|------------------|
| PID_ISS_01 | An EUDI Wallet Instance SHALL support at least the protocol defined in the technical specifications for PID issuance. An EUDI Wallet MAY support additional protocols for PID issuance. The following requirements apply only to the protocol defined in the technical specifications. |
| PID_ISS_02 | An EUDI Wallet Instance SHALL authenticate and validate the identity of the PID Provider it is communicating with. |
| PID_ISS_03 | A PID Provider SHALL verify the authenticity of EUDI Wallet Trust Evidence. |
| PID_ISS_04 | An EUDI Wallet Instance SHALL present the corresponding data request to the EUDI Wallet User, informing the user about the data attributes to be issued by the PID Provider. |
| PID_ISS_05 | An EUDI Wallet Instance SHALL inform the PID Provider of successful issuance only after having confirmed the EUDI Wallet User's authorization to approve the PID issuance. |
| PID_ISS_06 | An EUDI Wallet Instance SHALL support device binding for PID, enabling the EUDI Wallet User to prove possession of the bound device. |
| PID_ISS_07 | An EUDI Wallet Instance SHALL support an activation procedure for PID Providers to verify that PID is only delivered to its subject. |
| PID_ISS_08 | An EUDI Wallet Instance SHALL support technical specifications for securely delivering the PID from the PID provider to the device controlled by the EUDI Wallet User. |
| PID_ISS_09 | An EUDI Wallet Instance SHALL support technical specifications to notify the PID Provider of the outcome of the PID issuance process, that is -- whether it was successful or not (e.g., PID issued to the EUDI Wallet Instance or PID not stored in the issued to the EUDI Wallet and user is informed accordingly). |

#### A.2.3.36 Topic 36 - Risk Analysis of the EUDI Wallet Usage 

There are no HLRs for this Topic.

#### A.2.3.37 Topic 37 - QES -- Remote Signing - Technical Requirements 

See [Topic 16](#a2316-topic-16---signing-documents-with-eudi-wallet).

#### A.2.3.38 Topic 38 - Wallet Instance Revocation  

*Short description*

This document discusses Wallet Instance revocation. In particular, it
answers the following questions: 

-   How can a Wallet Provider revoke a Wallet Instance? 

-   During issuance of an attestation, how can an Attestation Provider
    verify whether a Wallet Instance has been revoked? 

-   When requesting attributes from an attestation, how can a Relying
    Party verify whether a Wallet Instance has been revoked? 

For more information, see the White Paper on Wallet Instance Revocation
that will be published in the same repository as the ARF.

HLRs

A.  Issuing a Wallet Instance Attestation 

| **Index** | **Requirement specification** |
|------------|-------------------|
| WIRevocation_01 | To enable a Relying Party or an Attestation Provider to verify the authenticity and revocation status of a Wallet Instance it is interacting with, a Wallet Provider SHALL issue one or more WIAs to the Wallet Instance during the activation phase of a Wallet Instance. |
| WIRevocation_02 | During the lifetime of the Wallet Instance, the Wallet Provider SHALL ensure that the Wallet Instance at all times contains a valid WIA. |
| WIRevocation_03 | The Commission SHALL ensure that a Rulebook for the WIA is created in accordance with all requirements in [Topic 12](#a2312-topic-12---attestation-rulebooks). |
| WIRevocation_04 | The Wallet Provider SHALL manage the issuance processes for WIAs in such a way that the WIAs cannot be misused by colluding Relying Parties (and Attestation Providers) to track a User. |
| WIRevocation_05 | During the activation process of a Wallet Instance, the Wallet Provider SHALL do the following to ensure that a User can request revocation of their Wallet Instance as mentioned in WIRevocation_10: <ul><li>Register the relationship between this Wallet Instance and its User in a User account;</li><li>Enable secure authentication of the User towards the Wallet Provider is possible, by providing one or more suitable authentication mechanisms. These authentication mechanisms SHALL NOT depend on the mobile device containing the Wallet Instance.</li></ul><p>  Note: <ul><li>The Wallet Provider does not need to know the true identity of the User. Instead, an alias such as an e-mail address can be used.</li><li>The reason for requiring authentication mechanisms that are independent of the Wallet Instance is that the User must be able to authenticate to the Wallet Provider even in case the mobile device containing the Wallet Instance is lost or stolen.</li></ul> |

A.  Revoking a Wallet Instance 

| **Index** | **Requirement specification** |
|------------|------------------|
| WIRevocation_06 | A Wallet Provider SHALL be able to suspend a Wallet Instance, by suspending its WIA(s) as specified in \[[Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation)\]. |
| WIRevocation_07 | A Wallet Provider SHALL be able to revoke a Wallet Instance, by revoking its WIA(s) as specified in \[[Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation)\]. |
| WIRevocation_08 | A Wallet Provider SHALL be able to unsuspend a Wallet Instance, by unsuspending its WIA(s). |
| WIRevocation_09 | During the lifetime of a Wallet Instance, the Wallet Provider SHALL regularly verify that the security of the Wallet Instance is not breached or compromised. If the Wallet Provider detects a security breach or compromise, the Wallet Provider SHALL analyse its cause(s) and impact(s). If the breach or compromise affects the trustworthiness or reliability of the Wallet Instance, the Wallet Provider SHALL suspend the corresponding WIA(s) if they have a validity period of 24 hours or more. The Wallet Provider SHALL do so at least in the following circumstances: <ul><li>If the security of the Wallet Instance, or the security of the mobile device and OS on which it is installed, or the security of a WSCA it uses for managing cryptographic keys and sensitive data, is breached or compromised in a manner that affects its trustworthiness or reliability.</li><li>If the security of the Wallet Solution is breached or compromised in a manner that affects the trustworthiness or reliability of all corresponding Wallet Instances.</li><li>If the security of the common authentication and data protection mechanisms used by the Wallet Instance is breached or compromised in a manner that affects their trustworthiness or reliability.</li><li>If the security of the electronic identification scheme under which the Wallet Instance is provided is breached or compromised in a manner that affects its trustworthiness or reliability.</li></ul>|
| WIRevocation_10 | A Wallet Provider SHALL revoke a Wallet Instance upon the explicit request of the User registered during the Wallet Instance activation process, see WIRevocation_05. To do so, the Wallet Provider SHALL revoke all valid WIA(s) for that Wallet Instance, if they have a validity period of 24 hours or longer. The Wallet Provider SHALL authenticate the User before revoking the Wallet Instance. |
| WIRevocation_11 | A Wallet Provider SHALL revoke a Wallet Instance upon the explicit request of a PID Provider, in case the natural person using the Wallet Instance has died or the legal person using the Wallet Instance has ceased operations. To do so, the Wallet Provider SHALL revoke all valid WIA(s) for that Wallet Instance, if they have a validity period of 24 hours or longer. To identify the Wallet Instance that is to be revoked, the PID Provider SHALL use the Wallet Instance identifier provided by the Wallet Provider in the WTE during PID issuance. |
| WIRevocation_12 | Before revoking a WIA per WIRevocation_11, the Wallet Provider SHALL verify that the party requesting revocation is indeed a valid PID Provider listed in the Trusted List of PID Providers. |
| WIRevocation_13 | Before requesting a Wallet Provider to revoke a Wallet Instance per WIRevocation_11, the PID Provider SHALL ensure that the revocation does not harm the interests of any of the stakeholders. The PID Provider SHALL have (and follow) a documented policy to ensure that this is the case. |

A.  Informing the User

| **Index** | **Requirement specification** |
|-----------|-------------------|
| WIRevocation_14 | A Wallet Provider SHALL inform a User without delay in case the Wallet Provider decided to suspend or revoke the User's Wallet Instance. The Wallet Provider SHALL also inform the User about the reason(s) for the suspension or revocation. This information SHALL be understandable for the general public. It SHALL include (a reference to) technical details about any security breach if applicable. |
| WIRevocation_15 | A Wallet Provider SHALL inform a User without delay in case the Wallet Provider decided to unsuspend the User's Wallet Instance. |
| WIRevocation_16 | To inform a User about the (un)suspension or revocation of their Wallet Instance, the Wallet Provider SHALL use a communication channel that is independent of the Wallet Instance. In addition, the Wallet Provider MAY use the Wallet Instance itself to inform the User. |

B.  Verifying the revocation status of a Wallet Instance 

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIRevocation_17 | A Wallet Instance SHALL be able to transfer the WIA to PID Providers and Attestation Provider during the issuance of a PID or attestation and to Relying Parties during the presentation of attributes. |
| WIRevocation_18 | A PID Provider or Attestation Provider SHOULD, for each of its valid PIDs or attestations, regularly verify whether the Wallet Provider suspended or revoked the Wallet Instance on which that PID or attestation is residing. If it turns out that the Wallet Instance is suspended or revoked, the PID Provider or Attestation Provider SHOULD immediately revoke the respective PID or attestation in accordance with all requirements in \[[Topic 7](#a237-topic-7---attestation-validity-checks-and-revocation)\]. |
| WIRevocation_19 | A Relying Party SHOULD verify the revocation status of the Wallet Instance by requesting and verifying a WIA and subsequently verifying the revocation status of the WIA following the steps specified per VCR_09. |
| WIRevocation_20 | For the verification of WIAs, a Relying Party SHALL accept the trust anchors in the Wallet Provider Trusted List(s) of all Member States. <p><br>Note: Wallet Provider Trusted Lists are explained in \[[Topic 31](#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\]. |
| WIRevocation_21 | When no reliable information regarding the revocation status of a WIA is available, a Relying Party SHOULD perform a risk analysis considering all relevant factors for the use case, before taking a decision to accept or refuse the Wallet Instance. |

#### A.2.3.39 Topic 39 - Wallet to wallet technical Topic 

There are no HLRs for this Topic.

#### A.2.3.40 Topic 40 - Reserved 

#### A.2.3.41 Topic 41 - Minimum requirements on PuB-EAAs rulebooks 

See [topic 12](#a2312-topic-12---attestation-rulebooks).

#### A.2.3.42 Topic 42 - Requirements for QTSPs to access authentic sources 

*Short description*

This topic discusses the ability of QTSPs of electronic attestations of
attributes to verify those attributes by electronic means at the request
of the user, wherever those attributes rely on Authentic Sources within
the public sector.  

*HLRs*

| **Index** | **Requirement specification** |
|-----------|------------------|
| QTSPAS_01 | Member States SHALL define:  <ul><li>discovery mechanisms that enable QTSPs to request information about the Authentic Sources or designated intermediaries recognized at national level (including the attributes about a natural or legal person that the Authentic source or designated intermediary is considered to be a primary source or recognised as authentic in accordance with Union law or national law, including administrative practice);</li><li>procedures for QTSPs to request the verification of attributes from Authentic Sources,</li><li>in accordance with technical specifications referred to in QTSPAS_07, and that comply with QTSPAS_02.</li></ul> |
| QTSPAS_02 | Authentic Sources or designated intermediaries SHALL make available an interface that:  <ul><li>determines whether a verification request for attributes comes from a QTSP of electronic attestation of attributes (so a lookup in the QTSP Trusted List);</li><li>determine whether the QTSP issues the requested attributes, and those attributes rely on an Authentic Source within the public sector;</li><li>if both requirements are met: determine the identity of the user (presumably via a Wallet or any other eIDAS identity scheme to determine the request);</li><li>determine whether the User has given consent;</li><li>after authentication of the user: verify whether the claimed attributes match the info in the authentic source; and finally</li><li>respond with a 'match' or 'no match' for each attribute.</li></ul>   <p>The Commission SHALL take measures to ensure that this interface is specified.<p>  Note: Every QTSP will be able to verify against every authentic source. |
| QTSPAS_03 | Authentic source or designated intermediary SHALL define and implement QTSPAS_001 in a secure and privacy-preserving channel in accordance with technical specifications referred to in QTSPAS_007. |
| QTSPAS_04 | Authentic source or designated intermediary SHALL define and implement QTSPAS_001 so that the QTSP will receive the result of the verification of the requested attributes, as described in QTSPAS_002. If the verification is deferred, the response to the QTSP SHALL include the maximum time that it will take to verify the requested attributes, and a unique identifier that the QTSP SHALL use to obtain the result of the verification. |
| QTSPAS_05 | Member States SHALL define QTSPAS_001 so that the request can be sent by the QTSP directly to the Authentic Source or to a designated intermediary recognized at national level. |
| QTSPAS_06 | Member States SHALL specify the process and mechanisms to designate the authentic sources or intermediaries recognized at national level in accordance with Union or national law, allowing the QTSPs to request the verification of attributes stored in authentic sources. |
| QTSPAS_07 | The Commission SHALL publish, in agreement with the European Digital Identity Cooperation Group, a technical specification, referring to applicable standards, specifications and procedures, that will cover at least the attributes specified in Annex VI, wherever those attributes rely on authentic sources within the public sector, for which Member States should ensure that measures are taken to allow qualified providers of electronic attestations of attributes to verify by electronic means, at the request of the user, their authenticity against the relevant authentic source. <p><br> Note: These standards and procedures should be, whenever possible, aligned and compatible with those used for the platforms implementing the Once Only Principle (OOTS). There is a clear synergy of both data exchange approaches. In fact, the national OOP node would be a candidate for acting as an intermediary between QTSPs issuing QEEAs and the Authentic Sources. |
| QTSPAS_08 | QTSP SHALL obtain consent of the user to verify the authenticity of the attributes, before requesting the verification of those attributes to the authentic source or designated intermediary. |

#### A.2.3.43 Topic 43 - Embedded disclosure policy 

*Short description*

This topic is focused on embedded disclosure policy and this document is
focused on identifying high-level requirements of embedded disclosure
policy.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|-----------------|
| EDP_01 | A PID Provider or Attestation Provider SHALL be able to include an embedded disclosure policy in a PID or attestation, as defined in the applicable rulebook. |
| EDP_02 | The Provider of a PID or attestation that includes an embedded disclosure policy as in EDP_01 SHALL comply with the applicable rulebook when including an embedded disclosure policy in the PID or attestation. |
| EDP_03 | A Wallet Instance holding a PID or attestation with an embedded disclosure policy SHALL request required information from the Relying Party or from the requesting User, in order to receive information relevant to the disclosure policy. |
| EDP_04 | The Relying Party or the requesting User SHALL provide information required by a disclosure policy to the Wallet Instance in the Relying Party access certificate. |
| EDP_05 | The Wallet Instance SHALL provide to the User information on an embedded disclosure policy and any information provided by the Relying Party or by the requesting User, in order for the User to decide regarding the disclosure of the attributes requested by the Relying Party. |
| EDP_06 | The Wallet Instance SHALL be capable of evaluating an embedded disclosure policy in conjunction with the information received from the requesting Relying Party or the requesting User, in order to determine if the Relying Party or the requesting User has permission from the Attestation Provider to access the requested attributes. |
| EDP_07 | The Wallet Instance SHALL enable the User, based on the outcome of the evaluation of the embedded disclosure policy, to deny or allow the presentation of the requested electronic attestation of attributes to the requesting Relying Party or the requesting User. |
| EDP_08 | The Commission SHALL establish non-mandatory rulebooks, in agreement with the EDICG for electronic attestation of attributes for a common and interoperable set of rules for including an embedded disclosure policy in an attestation, protocols between an EUDI Wallet Instance and a Relying Party and the presentation of the response from a Relying Party or the requesting user of the EUDI Wallet by a Wallet Instance to a Wallet User. |

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

This document explores high-level requirements related to the function
of Users requesting the deletion of their personal data from Relying
Parties through the EUDI Wallet.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|------------------|
| DATA_DLT_01 | An EUDI Wallet solution Provider SHALL provide a User interface where Users can request from Relying Parties the deletion of attributes, in accordance with technical specification. |
| DATA_DLT_02 | The Commission SHALL develop in cooperation with the Member States technical specifications for Relying Parties interface to allow reception and processing of attribute deletion requests. |
| DATA_DLT_03 | The EUDI Wallet interface SHALL provide a function where the User may select one Relying Party or multiple Relying Parties for which an attribute deletion request shall be submitted. |
| DATA_DLT_04 | An EUDI Wallet interface SHALL display the previously submitted attribute deletion requests through the EUDI Wallet Instance. |
| DATA_DLT_05 | An EUDI Wallet Instance SHALL keep attribute deletion requests in a log file so it can be presented to the User in the dashboard (as specified in [Topic 19](#a2319-topic-19---eudi-wallet-user-navigation-requirements-dashboard-logs-for-transparency)). |
| DATA_DLT_06 | The log file SHALL include as a minimum:   <ul><li>Date of attribute deletion request</li><li>Relying Party to which the request was made</li><li>Attributes requested to be removed.</li></ul> |


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
the users over their personal data.

This is important specifically since there are no automatic processes
that are able to check if the request is consistent with the information
that is registered in the Relying Party registry, and so the
presentation of attributes following a request from a Relying Party
relies mostly on the approval of the User. It may happen that a User
will not be able to correctly understand the request, that the Relying
Party was confused with another one due to a similar name or a phishing
attempt, and so forth. The User may realize only after presenting the
attributes that it was taken from him unlawfully by over-asking, or even
by fraud.

This topic explores high-level requirements related to the function of
Users reporting unlawful or inappropriate attribute requests from
Relying Parties.

*HLRs*

| **Index** | **Requirement specification** |
|-----------|--------------------|
| RPT_DPA_01 | A Wallet Instance SHALL provide an interface to lodge a complaint of suspicious Relying Party presentation requests to the DPA of the Member State that provided their EUDI Wallet. |
| RPT_DPA_02 | The interface to lodge a complaint SHALL be available in the Wallet Instance's user interface. |
| RPT_DPA_03 | A Wallet Provider SHALL implement the interface in compliance with national procedural law and administrative practices. |
| RPT_DPA_04 | A Wallet Instance SHALL enable the lodged complaint to be substantiated, including information to identify the Relying Party, their presentation request, and the User's allegation. |
| RPT_DPA_05 | A Wallet Instance SHALL keep reports sent to the DPA in a log file so that it can be presented to the User in the dashboard (as specified in [Topic 19](#a2319-topic-19---eudi-wallet-user-navigation-requirements-dashboard-logs-for-transparency)). |
