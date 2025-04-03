# V - PID Rulebook

Version 1.2, updated 30 March 2025

[GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/410)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation
Group regarding Topic V: PID Rulebook

### 1.2 Related risks in the Risk Register

Risks considered in [Topic_A] are also applicable here

### 1.3 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that is
mandated by an external document. The word 'can' indicates a capability, whereas
other words, such as 'will' and 'is' or 'are' are intended as statements of
fact.

### 1.4 Document structure

- Chapter 2 introduces the objectives of this paper.
- Chapter 3 presents available attestation format.
- Chapter 4 discusses interoperability Challenges in the EUDI Wallet.
- Chapter 5 discusses privacy considerations.
- Chapter 6 gives a background about the discussion on W3C VCDM in the Expert Group.
- Chapter 7 lists the additions and changes that will be made to the ARF
as a result of discussing this topic with Member States.

## 2. Problem statement

Currently, W3C VCDM 1.1 is referenced in the implementing acts, though it is
understood to be a placeholder pending a final technical decision. This is
because, in its current form, VCDM 1.1 remains an incomplete framework, lacking
the necessary specifications to fully support the implementation of an EUDI
Wallet.

To finalise the list of requirements and related technical specifications
for implementing the PID based on the current ARF approach—which
envisions issuing the PID in two formats:

- **ISO/IEC 18013 series format**, required for **proximity scenarios**.
- **JSON-based format**, better suited for **online scenarios**.

It is essential to **fully define** this second format by detailing all relevant
aspects.

A clear and well-defined set of requirements and technical
specifications for these components is crucial to accurately describe the
PID and provide implementers with a robust framework for developing
Wallet solutions.

In the current ARF, the decision leans toward adopting JWT-like Simple
Attestations, which offer a simpler and widely compatible format, complemented
by the SD-JWT-VC draft, but still several details are missing. Ongoing
discussions emphasise the need to balance flexibility, interoperability, and
security while avoiding unnecessary complexity.  

## 3 Attestation formats

The topic of attestation formats and data models has been a long-standing discussion
within the expert group. Over the past two years, it has been extensively debated
among Member State experts, reflecting both its importance and complexity.

When discussing verifiable attestations, at least four key aspects must be considered:

1. Data Model – Defines how attestation information is structured and
represented.
1. Data Format – Specifies how attestations are serialised and exchanged.
1. Security, Proof Mechanisms, and Signature Formats – Covers how attestation
authenticity and integrity are ensured, including cryptographic signatures used
to verify the PID Provider or Attestation Provider.
1. Privacy Considerations – Ensures that attestations minimise data exposure,
allow selective disclosure, and comply with privacy-preserving principles
(in particular unlinkability as mandated by the Regulation).

### 3.1 Several families of attestation formats

There are at least three main families of attestation formats, each with distinct
characteristics in terms of structure, flexibility, and implementation requirements:

#### 3.1.1 ISO/IEC-Based attestations (ISO/IEC 18013 & ISO/IEC 23220 Series)

These standards define highly structured specifications for:

- Data models
- Data formats
- Security mechanisms
- Signature formats
- Communication protocols

They are designed to ensure strict interoperability and security, particularly
for official and regulated attestations, such as:

- Mobile Driving Licences (mDLs) under ISO/IEC 18013-5, which standardises the
issuance, storage, and verification of digital driving licences.
- More general mobile identity attestations under ISO/IEC 23220, expanding the
use cases beyond driving licences.

These specifications provide clear, predefined guidelines on how attestations should
be issued, stored, and verified. However, they leave little room for flexibility, prioritizing
high trust and compatibility across different systems.

#### 3.1.2 JWT-Like Simple attestations

Compared to ISO/IEC-based attestations, this category:

- Is not necessarily binary-encoded (primarily JSON-based).
- Uses JWT (JSON Web Token)-based attestations, which are simpler but widely
used in practice.
- Does not define a specific data format or model—these aspects must be defined
separately through additional specifications.

For example:

- The OAuth SD-JWT-VC draft [SD-JWT VC] defines data format specifications for
attestations based on JWT & SD-JWT. A roadmap [Fet2024] was previously discussed
by Germany as a possible approach for structuring JWT-based attestations.

While JWT-based attestations offer simplicity and widespread adoption in web
authentication (e.g., OAuth2, OpenID Connect), they lack built-in advanced
cryptographic proof mechanisms unless extended via additional specifications.

#### 3.1.3 W3C Verifiable Credentials (VCDM 1.1 & 2.0)

This category is like JWT-based attestations in that it is JSON-based, but it provides
a fully-fledged, and extensible data model for verifiable attestations.

The W3C Verifiable Credentials Data Model (VCDM) defines a general data model,
offering a high-level structure but leaving many technical aspects open for further
definition, including:

- Security mechanisms
- Signature formats
- Transport protocols

Key Features of W3C VCDM:

- JSON-LD (Linked Data) Based: Ensures structured and interoperable data
exchange but introduces complexity.
- Extensible Framework: Allows different implementations but requires
additional specifications.
- Security and Signature Formats: Not inherently defined—must be specified separately.

To implement W3C VCDM-based attestations, separate specifications are needed for
security mechanisms and signatures, such as:

1. VC-JOSE-COSE [Jon2025]: Defines how to use JWT, SD-JWT, and COSE to secure
attestations in the VCDM model.
1. VC Data Integrity [Spo2025]: Provides a cryptographic proof format
independent of JWT and COSE, relying on detached proofs (not embedded
signatures) for better flexibility.

These mechanisms offer different trade-offs, allowing PID Providers or
Attestation Providers and Relying Parties to choose the appropriate security
model based on their privacy, interoperability, and trust requirements.

##### 3.1.3.1 SD-JWT and Its Relation to W3C VCDM

SD-JWT (Selective Disclosure JSON Web Token) is often mentioned in discussions
related to W3C VCDM, but it serves a different purpose:

- Unlike W3C VCDM, SD-JWT is not a general framework for verifiable attestations
but rather a technical specification that extends JWT to support selective
disclosure.
- It allows attestation holders to disclose only selected parts of their
attestations while keeping other data hidden, enhancing privacy and data
minimisation.
- Since W3C VCDM does not define how attestations should be cryptographically
secured, W3C introduced VC-JOSE-COSE, which enables the use of SD-JWT within the
VCDM model.

Thus, W3C VCDM and SD-JWT are not competing approaches—rather, SD-JWT can be
used as a security mechanism within W3C VCDM to provide privacy-preserving
selective disclosure.

## 4 Interoperability Challenges in the EUDI Wallet

To ensure interoperability in the EUDI Wallet, it is crucial that we do not
allow open-ended choices or support multiple, competing attestation models
beyond a strict minimum. Currently, the EUDI Wallet already supports two
attestation models:

1. ISO/IEC 18013/23220 series  mdoc (mobile document format) – A well-defined,
standardised model primarily used for official government-issued attestations.
1. A JSON-based attestation format – Providing flexibility for broader use cases
while ensuring compatibility with widely used web-based ecosystems.

Adding a third or more attestation models would introduce significant risks, including:

- Interoperability issues: Different ecosystems may struggle to communicate
seamlessly if multiple, incompatible models are used.
- Increased security risks: Supporting multiple formats increases attack
surfaces, making it harder to apply consistent security measures.
- Code duplication and complexity: Wallet implementations and Relying Parties
would need to support multiple verification pathways, increasing development and
maintenance costs.

Thus, while diversity in attestation formats may seem beneficial in theory, in
practice, it introduces unnecessary complexity, security risks, and operational
burdens. A clear and limited selection of attestation models is essential to
ensure a coherent, secure, and interoperable EUDI Wallet ecosystem.

For all the above reasons, the requirement [PID_\01] included in the the PID Rulebook
of Annex 3 of the ARF still applies.

## 5 Privacy considerations

Privacy is a critical concern, especially regarding how attestation data is
presented and verified. All the attestation categories mentioned above implement
selective disclosure using a technique called salted and hashed data. This
approach conceals specific attributes by hashing their values, allowing the user
to select which attributes to disclose when presenting their attestations or
attestations.

However, this technique—like user signatures on presentations—leaves cryptographic
"fingerprints" that could be exploited to track users across different interactions.

While salting and hashing can obfuscate attestation data, it has inherent
weaknesses, particularly in scenarios where PID Providers or Attestation
Providers and Relying Parties collude or if they are subject to data breaches 
as described in [Topic A]:

1. Collusion Between or data breach of two Relying Parties: If two Relying Parties share collected
attestations containing same hashes and signatures for the user, they can track
and profile users across different interactions, compromising unlinkability.
An attacker would be able to proceed to the same kind of attempt in case of 
a data breach of the Relying Parties
This specific scenario can be somehow mitigated with different techniques.
1. Collusion Between or data breach of PID Provider or Attestation Provider and Relying Party: If
the PID Provider or Attestation Provider and Relying Party share collected
attestations containing same hashes and signatures for the user, they can track
and profile users across different interactions, compromising unlinkability.
An attacker would be able to proceed to the same kind of attempt in case of a 
data breach of the PID Provider or Attestation Provider and Relying Party.

To truly mitigate these risks, more advanced cryptographic techniques—particularly
Zero-Knowledge Proofs (ZKPs)—are required.

ZKPs provide a stronger privacy-preserving alternative by allowing users to:

- Prove statements (e.g., "I am over 18") without revealing the underlying data
(e.g., date of birth).
- Ensure unlinkability, even if a PID Provider or Attestation Provider and
Relying Party collude or are subject to a data breach.
- Prevent unnecessary data exposure, reducing the risk of attestation misuse.

While hashed data with salts provides basic privacy protections and is essential
when proving real identity, it does not ensure unlinkability and remains
susceptible to PID Provider or Attestation Provider-Relying Party collusion or subjection 
to a data breach. In
contrast, ZKP-enhanced attestations offer a higher level of privacy assurance,
enabling secure, verifiable, and unlinkable digital interactions while
minimizing data exposure.

Zero-Knowledge Proofs (ZKPs) are particularly useful in situations where you do
not want—and are not required—to disclose specific personal information, such as
your name or surname.

However, if full identity verification is required (e.g., for opening a bank
account or signing a contract), ZKPs cannot prevent linking, as the disclosed
PII will inherently allow correlation. Therefore, ZKPs are most effective when
proving eligibility without the need for full identity disclosure, enabling
strong privacy protection in scenarios where anonymity and unlinkability are
critical.

Zero-Knowledge Proofs (ZKPs) can be integrated into any of the attestation
categories mentioned above, and ongoing developments are actively working
to implement ZKP support across different models. This is discussed in more depth in [Topic_G].

A particularly important effort focuses on developing ZKP mechanisms using
cryptographic algorithms that are widely recognised and standardised by by NIST
and SOG-IS.

Specifically, there is growing interest in leveraging ECDSA-based ZKPs, as ECDSA
is already supported by secure hardware such as Hardware Security Modules (HSMs)
and Secure Elements (SEs). This approach aims to ensure that ZKP can be implemented
efficiently within the EUDI Wallet ecosystem while maintaining strong security
guarantees and compatibility with level of assurance requested by the Regulation.

However, it is important to note that these developments are still relatively new
and require further validation and broad review by experts in the cryptographic
and identity communities. Ensuring that these mechanisms meet security, performance,
and regulatory requirements will be essential before they can be widely adopted
in real-world deployments.

For more details on these advancements, the following recent research articles
explore ECDSA-based ZKPs and their potential applications:

- Efficient Zero-Knowledge Proofs for ECDSA-Secured Credentials [Paq2024]
- ZKPs for ECDSA: Enabling Secure and Scalable Privacy-Preserving Authentication
[Fri2024]

These developments mark a significant step toward making ZKPs practical,
scalable, and compatible with the security requirements of the EUDI Wallet
ecosystem, but further scrutiny and testing are necessary to confirm their
feasibility in large-scale implementations.

## 6 Additions and changes to the ARF

Based on the outcomes of the discussion of the focus group meeting, the requirement
[PID_01] defined in Annex 3 of the ARF remains active. This requirement mandates
the following:

> A PID Provider SHALL issue any PID in both the format specified in ISO/IEC 18013-5 [ISO/IEC 18013-5] and the format specified in [SD-JWT VC]

### 6.1 High-Level Requirements to be added

The following High-Level Requirements will be added in Annex 3 of the ARF

#### REQUIREMENT 1

A PID Provider issuing [SD-JWT VC]-compliant PIDs SHALL include the vct claim in their PIDs,
where the vct claim will be a URN. A catalog linked in the PID Rulebook will associate this URN with SD-JWT VC type metadata
which will include the same information as the PID Rulebook.

### 6.2 High-Level Requirements to be changed

The following requirement is modified (changes in bold)

**Req_06b**For [SD-JWT VC]-compliant attestations, the Schema Provider for the Attestation
Rulebook SHALL ensure that each claim name is either included in the IANA registry for
JWT claims, or is Public Name as defined in RFC 7519, **or is a Private name specific
to the attestation type, which is defined by the vct claim**. Note: [SD-JWT VC] does not
discuss how to avoid conflicting claim names. Since SD-JWTs are a special kind of JWTs,
the methods specified in RFC 7519 are applicable.

### 6.3 Descriptions to be added to the ARF main document

## 7 References

| Reference | Description |
| --- | --- |
|[Fet2024]| SD-JWT VC DM Credential Format, available at <https://github.com/danielfett/sd-jwt-vc-dm>i|
| [Fri2024] | Matteo Frigo and abhi shelat, Anonymous credentials from ECDSA, Cryptology ePrint Archive, Paper 2024/2010, 2024, available at <https://eprint.iacr.org/2024/2010> |
|[Jon2025]| Securing Verifiable Credentials using JOSE and COSE, available at <https://www.w3.org/TR/vc-jose-cose/>|
| [Paq2024] | Christian Paquin, Guru-Vamsi Policharla, and Greg Zaverucha, Crescent: Stronger Privacy for Existing Credentials, Cryptology ePrint Archive, Paper 2024/2013, 2024, available at <https://eprint.iacr.org/2024/2013> |
|[Spo2025]| Verifiable Credential Data Integrity 1.0, available at <https://www.w3.org/TR/vc-data-integrity/>|
|[SD-JWT VC]| SD-JWT-based Verifiable Credentials (SD-JWT VC), IETF draft, available at <https://www.ietf.org/archive/id/draft-ietf-oauth-sd-jwt-vc-08.html>|
| [Topic_G] | Discussion Paper for the European Digital Identity Cooperation Group regarding Topic G: Zero Knowledge Proof, version 1.4 |
