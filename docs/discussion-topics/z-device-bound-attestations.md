# Topic Z - Device-bound Attestations

Version 1.0, updated 29 Sep 2025

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/581)

## 1. Introduction

### 1.1 Discussion Paper Topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group regarding
Topic Z - Device-bound Attestations

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

Currently the ARF only assumes device-bound Attestations. Should this be 
extended to not-device-bound Attestations. What specific high-level requirements for non-device-bound Attestations should the ARF specify? 


## 1.2 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that is
mandated by an external document. The word 'can' indicates a capability, whereas
other words, such as 'will' and 'is' or 'are' are intended as statements of
fact.

## 1.3 Document structure
This document is structured as follows:
- Chapter 2 presents requirements related to device-bound attestations. 
- Chapter 3 discusses use cases for non-device-bound attestations.
- Chapter 4 presents the additions and changes that will be made to the ARF as a result of discussing this topic with Member States.

## 2. Definitions, Existing requirements related to device-bound attestations
Device binding refers to the practice of cryptographically linking an attestation 
to a specific device,  through the use of a private key stored in secure hardware. 
In the context of the ARF **device binding refers to the binding of an attestation
to a cryptographic key stored in a WSCD**. 

One of the key advantages of device binding is its ability to prevent the sharing 
or unauthorised reuse of attestations. Since the attestation is tied to a cryptographic 
key that only exists on the user device, it becomes significantly more difficult 
for users to copy and transfer an attestation to another device or individual. Similarly, device binding prevents replay attacks, as each presentation shall include a fresh proof bound to the Relying Party.

On the other hand, when device binding is enforced, the portability of attestations 
would most likely require re-issuance of the attestation on the new device. Another 
disadvantage is that device binding can complicate the use 
of privacy-preserving protocols such as Zero-Knowledge Proofs (ZKPs), which may be
considered in future versions of the ARF. 

The question of whether Electronic Attestations of Attributes (EAA) should be 
cryptographically bound to a specific device remains open. As of now, there is no 
legal requirement mandating such device binding.  Section 6.6.3.8 of the ARF 
leaves room for future decisions on whether or not non device-bound attestations should
be supported. 

mDL specification [ISO/IEC 18013-5] enforces device binding through the use of a 
"deviceKey" which is included in the Mobile Security Object (MSO). This same key 
is also used to authenticate the device to verifiers during attestation presentation. 
Consequently, mDL implementations necessarily couple the attestation with the device 
that holds the private key, ensuring strong holder binding. On the other hand, [SD-JWT VC] 
and [W3C VCDM v2.0] treat key binding as an optional feature. 

When it comes to attestation presentation, [OpenID4VP] provides mechanisms for holder 
binding but does not enforce them universally. 
Section 5.3 of the OpenID4VP specification describes how a Relying Party can request a 
presentation without requiring "holder binding proofs". Using this mechanism a
Relying Party may indicate that such a proof is not required even if an attestation
is device-bound.

Based on the above, three distinct cases can be identified regarding attestation binding and verification requirements:

1. The attestation is bound to a device, and the Relying Party explicitly requests a binding proof during presentation.
2. The attestation is bound to a device, but the Relying Party does not require a binding proof.
3. The attestation is not bound to any device.


## 3. Use cases for non device-bound attestations
### Low security attestations

A prominent use case for non device-bound attestations involves low-risk, low-security 
attestations such as event tickets, discount vouchers, or other entitlements where 
strong holder binding is not required. 

In such cases, the level of assurance needed by the Relying Party is minimal.

It should be highlighted, however, that holder binding and device binding are related but not the same. An attestation may be bound to a device but not to a User. 
Device binding in this case will prevent attestation sharing, as well as replay 
attacks (as discussed in Section 2). 


### Attestations Bound to a Biometric Trait

Another use case for non device-bound attestations involves attestations that are 
bound to a biometric trait of the User rather than to the device. In this model, 
the attestation includes a reference to a biometric identifier, such as a facial 
template or fingerprint hash, or even the actual biometric data, which serves as
the basis for binding the attestation to its legitimate holder.

In practice, the Wallet may not be able to generate a binding proof on its own, 
since it lacks the capability to verify biometric traits against the reference template 
embedded in the attestation. Instead, binding verification must be performed 
externally—either by a biometric sensor operated by the Relying Party or through a 
trusted third-party service that conducts biometric matching.

On the other hand, device binding may offer additional security advantages as
discussed in Section 2.  

It should be noted that biometric-bound attestations are not currently considered by
the ARF. 

### Combined presentation of attestations
One of the use cases for supporting non device-bound attestations is the combined 
presentation of multiple attestations. In certain scenarios, users may need to 
present a set of attestations issued by different providers, each attesting to 
distinct attributes. To support such combined presentations, mechanisms must exist
to establish that the combined attestation belong to the same user. As discussed 
in [Topic K], this can be achieved through "Attribute-Based Binding". In this approach, 
attestations include a shared unique identifier—such as a PID number—that allows 
verifiers to correlate the attestations. Alternatively, redundant person identification 
data, such as name, date of birth, or address, can be used to infer linkage.

Under this model, it is not necessary for every attestation involved in a combined 
presentation to be device-bound. For example, a PID can be securely bound to a device, 
while complementary attestations, such as a university diploma or a professional license, 
may remain portable and unbound. 

It should be noted that the security and privacy considerations of combined 
attestation presentations are out of scope for this paper; they are addressed 
in Topic K

## 4 Discussion
### Re-issuance of non device bound attestations
Currently the ARF specifies the following for attestations that can be re-issued
using a refresh token:

> In the absence of User authentication, and to prevent that a re-issued PID or attestation 
ends up at the wrong User, the PID Provider or Attestation Provider ensures that the re-issued 
PID or attestation is bound to the same WSCA/WSCD as the PID or attestation it replaces.

But this is not applicable to non-device-bound attestations. It is noted that even if an attacker
cannot use the re-issued attestation (e.g., because "claim-based" binding is used) sensitive information about a User may be inferred. 

In order to ensure that a re-issued non device-bound attestation does not end up 
with the wrong User, the corresponding refresh tokens SHALL be bound to the WSCA/WSCD 
used by the Wallet Unit that stores the replaced attestation.

### Security of non device-bound attestations
Non device-bound attestations should be bound to the User using alternative 
mechanisms, such as "Attribute-Based Binding" that links them to a device-bound 
attestation, for example, a PID. Nevertheless, there are no technical means 
to prevent a User from presenting a standalone non device-bound attestation, nor 
to prevent a Relying Party from accepting it. In such cases, non device-bound 
attestations can be stolen and re-used by a third party. Attestation Providers 
should always assess this risk.

## 5 Additions and changes to the ARF
Currently the ARF only considers device-bound attestations. It will be adapted to also consider non-device-bound attestations. 

### 5.1 High-Level Requirements to be added to Annex 2
The following HLR will be added to Topic 12 (Attestation Rulebooks)

**ARB_30**
The Schema Provider for an Attestation Rulebook SHALL specify whether an attestation 
is device-bound or not.  

The following HLR will be added to Topic 10 (Issuing a PID or attestation to a Wallet Unit)

**ISSU_66**The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI 
Wallet-specific extension or profile thereof, SHALL   enable an Attestation Provider 
to verify that the refresh token used for the re-issuance of a non device-bound 
attestation is bound to a WSCA/WSCD included with the Wallet Unit in which the 
replaced attestation is stored.

The following HLR will be added to Topic 6 (Relying Party authentication and User approval)

**RPA_12**
A Wallet Unit MAY provide a visual indication to the User about the binding mechanism
used by an attestation requested by a Relying Party. 

### 5.2 High-Level Requirements to be changed
**OAI_02** A Wallet Unit SHALL support proving cryptographic device binding between a 
WSCA/WSCD included in the Wallet Unit and a PID or **device-bound** attestation,
in accordance with [SD-JWT VC] or [ISO/IEC 18013-5]. Notes: Such a mechanism is called 
'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT VC]. 
~~Discussions on device binding are ongoing, in particular regarding whether non-device-bound 
PIDs or attestations should be supported by a Wallet Unit, and if so, what the requirements for 
this support should be.~~

**ISSU_17** A PID Provider SHALL implement device binding for all PIDs it issues, 
meaning it SHALL ensure that a PID is cryptographically bound to a WSCA/WSCD included 
in the Wallet Unit, as specified in requirement WUA_11 in [Topic 9]. Notes: 
Device binding is called 'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' 
in [SD-JWT-VC]. ~~Discussions on device binding are ongoing, in particular regarding 
whether non-device-bound PIDs or attestations should be supported by a Wallet Unit, 
and if so, what the requirements for this support should be.~~

**ISSU_27** ~~An Attestation Provider SHALL implement device binding for all 
attestations it issues, meaning it SHALL ensure that an attestation is cryptographically 
bound to a WSCA/WSCD included in the Wallet Unit, as specified in requirement WUA_11 in 
[Topic 9]. Notes: -Device binding is called 'mdoc authentication' in [ISO/IEC 18013-5] 
and 'key binding' in [SD-JWT-VC]. - Discussions on device binding are ongoing, 
in particular regarding whether non-device-bound PIDs or attestations should be 
supported by a Wallet Unit, and if so, what the requirements for this support should be.~~

**ISSU_27** An Attestation Provider SHOULD implement device binding for all attestations it issues. When an issued
attestation is device-bound, an Attestation Provider SHALL ensure that the attestation is
cryptographically bound to a WSCA/WSCD included in the Wallet Unit, as specified in requirement
WUA_11 in [Topic 9]

**ISSU_65** The common OpenID4VCI protocol referenced in requirement ISSU_01, or an 
EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider, 
Attestation Provider or Wallet Provider to verify that a re-issued PID, **device-bound** attestation, 
or WUA is bound to the same WSCA/WSCD to which the existing PID, **device-bound** attestation, or WUA is bound. 
Note: This can be done, for instance, by requiring that OAuth 2.0 Demonstrating 
Proof of Possession (DPoP) [RFC 9449] is used for each Refresh Token and that the
public key of the Refresh Token and the PID are stored in the same WSCA/WSCD.
~~public key in the DPoP proof is identical to the public key in the existing PID, 
attestation, or WUA issued to the Wallet Unit previously.~~

**ZKP_01**
A ZKP scheme SHALL provide support for the following generic functions, while hiding 
all attributes of PIDs or attestations: (i) generation of a proof that an (some) 
attribute(s) having a specific value is (are) included in a PID or attestation, 
(ii) generation of a proof that a PID or attestation is within its validity period, 
(iii) generation of a proof that a PID or attestation has not been revoked, and 
(iv) generation of a proof that a PID or **device-bound** attestation is bound to 
a key stored in the WSCA/WSCD of the Wallet Unit. Additionally, a ZKP scheme SHOULD 
provide support for the following function, which SHOULD be used only when hiding 
the PID Provider or Attestation Provider is necessary: (v) generation of a proof 
that a PID or attestation has been issued by a trusted PID Provider or Attestation 
Provider, without revealing the PID Provider or Attestation Provider. 
Notes: - See section 4.1.1 of the Discussion Paper for Topic G.

**Mig_03** For each PID or **device-bound** attestation that is issued to it, a Wallet Unit SHALL 
add to the Migration Object all data necessary to request issuance of that PID or attestation once again. 
This SHALL include at least the attestation type and the PID Provider or 
Attestation Provider that issued the PID or attestation, as well as their service supply points.
However, the Migration Object SHALL NOT contain attribute identifiers or attribute values, 
and SHALL NOT contain any private keys of the PID or  **device-bound** attestation.
**For non device-bound attestations a Wallet Unit MAY add to the Migration Object all data necessary to
transfer the attestation to a new device. This includes attribute identifiers or attribute values**


### 5.3 Descriptions to be added to the ARF main document

Section "6.6.3.8 Relying Party Instance verifies device binding" will be modified
to reflect that non device-bound attestation can exist. Section 
"6.6.2.3.3 Verifies that the PID key or the attestation key is protected by the WSCD"
will be modified to reflect that non device-bound attestation can exist

### 5.4 Other changes
The Rulebook template will be modified according to the new HRL **ARB_30**. TS 10
will be modified according to the new HRL **Mig_03**. 

##  5. References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [ISO/IEC 18013-5] | [ISO/IEC 18013-5](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84), Personal identification --- ISO-compliant driving licence - Part 5: Mobile driving licence (mDL) application |
| [OpenID4VP] | Terbu, O. et al., [OpenID Connect for Verifiable Presentations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2), OpenID Foundation.  |
| [SD-JWT VC] | [SD-JWT-based Verifiable Credentials](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/9) (SD-JWT VC). Retrievable from: <https://datatracker.ietf.org/doc/draft-ietf-oauth-sd-jwt-vc/> |
| [Topic K](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework-private/blob/main/docs/discussion-topics/k-combined-presentation-of-attestations.md) | ARF Discussion Topic K - Combined presentations of attributes |
| [W3C VCDM v2.0] | Sporny, M. *et al,* [Verifiable Credentials Data Model v2.0](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/115), W3C Recommendation |


