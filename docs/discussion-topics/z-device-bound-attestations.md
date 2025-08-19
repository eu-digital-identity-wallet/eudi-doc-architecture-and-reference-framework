# Z - Device-bound Attestations

Version 0.4, updated 19 Aug 2025

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/581)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group regarding
Topic Z - Device-bound Attestations

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

Currently the ARF only assumes device-bound Attestations. Should this be extended to not-device-bound Attestations. What specific high level requirements for not-device-bound Attestations should the ARF specify? 


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
- Chapter 3 discusses use cases for non device-bound attestations.

## 2. Existing requirements related to device-bound attestations
Device binding refers to the practice of cryptographically linking an attestation 
to a specific device,  through the use of a private key stored in secure hardware. 

One of the key advantages of device binding is its ability to prevent the sharing 
or unauthorized reuse of attestations. Since the attestation is tied to a cryptographic 
key that only exists on the user device, it becomes significantly more difficult 
for users to copy and transfer an attestation to another device or individual. Similarly,
device binding prevents replay attacks, since each presentation shall include
a fresh proof bound to the Relying Party.

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

**Question 1**

What are the advantages and disadvantages of each case?


## 3. Use cases for non device-bound attestations
### Low security attestations

A prominent use case for non device-bound attestations involves low-risk, low-security 
attestations such as event tickets, discount vouchers, or other entitlements where 
strong holder binding is not required. 

In such cases, the level of assurance needed by the Relying Party is minimal, and the 
main functionality expected from the Wallet is to display a QR code that can be scanned 
at the point of access. Once the QR code is presented, no further interaction is needed 
between the Wallet Unit and the Relying Party. As a result, the Wallet functions 
primarily as a display interface rather than as an active participant in the verification protocol.

This model can be implemented efficiently by embedding the QR code as a display 
property of the attestation, allowing a User to simply present it to a compatible 
QR reader. In this setup, the Wallet assumes a passive role and has no control 
over the Relying Party with which the User interacts. Notably, this interaction 
flow is not explicitly addressed in the ARF. Moreover, since the QR code is treated 
as a static image from the Wallet’s perspective, if it encodes multiple attributes, 
the User cannot perform selective disclosure. In this context, whether or not the 
attestation is bound to the device becomes irrelevant. It is reminded, however, 
that [ISO/IEC 18013-5] enforces device binding as part of its specification.

It should be highlighted however, holder binding and device binding are related 
but not the same. An attestation may be bound to a device but not to a User. 
Device binding in this case will prevent attestation sharing, as well as replay 
attacks (as discussed in Section 2). 

**Question 2**

What are the advantages and disadvantages of using device-bound attestations in this
use case? 

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

**Question 3**

What are the advantages and disadvantages of using device-bound attestations in this
use case? 

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

**Question 4**

What are the advantages and disadvantages of using device-bound attestations in this
use case?

---

**Question 5**

What are other use cases for non device-bound attestations?


##  References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [ISO/IEC 18013-5] | [ISO/IEC 18013-5](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84), Personal identification --- ISO-compliant driving licence - Part 5: Mobile driving licence (mDL) application |
| [OpenID4VP] | Terbu, O. et al., [OpenID Connect for Verifiable Presentations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2), OpenID Foundation.  |
| [SD-JWT VC] | [SD-JWT-based Verifiable Credentials](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/9) (SD-JWT VC). Retrievable from: <https://datatracker.ietf.org/doc/draft-ietf-oauth-sd-jwt-vc/> |
| [Topic K](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework-private/blob/main/docs/discussion-topics/k-combined-presentation-of-attestations.md) | ARF Discussion Topic K - Combined presentations of attributes |
| [W3C VCDM v2.0] | Sporny, M. *et al,* [Verifiable Credentials Data Model v2.0](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/115), W3C Recommendation |


