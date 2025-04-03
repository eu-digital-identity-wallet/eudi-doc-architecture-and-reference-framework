# G - Zero Knowledge Proof

Version 1.4, updated 30 March 2025

[GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/408)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group regarding
Topic G: Zero Knowledge Proof.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

ZKP offer strong potential as a privacy-enhancing technique. It should be
revisited to determine the foundational requirements needed for its future
integration, particularly focusing on defining specific requirements for
implementing ZKP by using any type of WSCD/WSCA.

### 1.2 Related risks in the Risk Register

Risks considered in [Topic_A] are also applicable here

## 1.3 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that is
mandated by an external document. The word 'can' indicates a capability, whereas
other words, such as 'will' and 'is' or 'are' are intended as statements of
fact.

## 1.4 Document structure

This document is structured as follows:

- Chapter 2 presents privacy properties of Zero-Knowledge Proof schemes.
- Chapter 3 introduces families of Zero-Knowledge Proof schemes and gives an
overview of representative solutions
- Chapter 4 discusses topics related to the integration of Zero-Knowledge Proof schemes
into the ARF
- Chapter 5 lists the additions and changes that will be made to the ARF
as a result of discussing this topic with Member States.

## 2. Zero-Knowledge Proof technology, legal requirements and privacy properties

Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11
April 2024 amending Regulation (EU) No 910/2014 as regards establishing the
European Digital Identity Framework [European Digital Identity Regulation], Recital 14, discusses the use of
privacy-preserving technologies, such as zero knowledge proof:

> Member States should integrate different privacy-preserving technologies, such
as zero knowledge proof, into the European Digital Identity Wallet. Those
cryptographic methods should allow a relying party to validate whether a given
statement based on the person’s identification data and attestation of
attributes is true, without revealing any data on which that statement is based,
thereby preserving the privacy of the user.

Similarly, Recital 15 of [European Digital Identity Regulation] mentions:

> All Union citizens [...] should be empowered to securely request, select, combine,
store, delete, share and present data related to their identity [...] while enabling
selective disclosure of personal data

Recital 59 of [European Digital Identity Regulation] provides the following definition and requirements for
selective disclosure:

> Selective disclosure is a concept empowering the owner of data to disclose only
certain parts of a larger data set, in order for the receiving entity to obtain
only such information as is necessary for the provision of a service requested by
a user. The European Digital Identity Wallet should technically enable the
selective disclosure of attributes to relying parties. It should be technically
possible for the user to selectively disclose attributes, including from multiple,
distinct electronic attestations, and to combine and present them seamlessly to
relying parties. This feature should become a basic design feature of European
Digital Identity Wallets, thereby reinforcing convenience and the protection of
personal data, including data minimisation.

Furthermore, Article 5a, 16 of [European Digital Identity Regulation] mandates for "the technical framework
of the European Digital Identity Wallet" to:

> (a) not allow providers of electronic attestations of attributes or any other
party, after the issuance of the attestation of attributes, to obtain data that
allows transactions or user behaviour to be tracked, linked or correlated,
or knowledge of transactions or user behaviour to be otherwise obtained, unless
explicitly authorised by the user;
> (b) enable privacy preserving techniques which ensure unlinkability, where the
attestation of attributes does not require the identification of the user.

Finally, article 11a.2 of [European Digital Identity Regulation] mandates that:

> Member States shall provide for technical and organisational measures to
ensure a high level of protection of personal data used for identity matching
and to prevent the profiling of users.

With all these in mind, the goal of this discussion paper is to establish High
Level Requirements for the use of the Zero-Knowledge Proof technology in ARF.

A Zero-Knowledge Proof (ZKP) is a cryptographic protocol that allows one party
(the prover) to convince another party (the verifier) that a given statement is
true without revealing any additional information beyond the validity of the
statement itself. This ensures that the verifier gains no knowledge about how
the prover knows the statement to be true, preserving privacy while enabling trust.

A ZKP system must satisfy three key properties:

- Completeness: If the statement is true and both the prover and verifier follow
the protocol correctly, the verifier will be convinced of its validity.
- Soundness: If the statement is false, a dishonest prover cannot convince an
honest verifier that it is true, except with some negligible probability.
- Zero-Knowledge: If the statement is true, the verifier learns nothing beyond
the fact that the statement is correct.

ETSI TR 119 476 [ETSI_119476] defines the following privacy-preserving
properties that may be provided by a ZKP scheme:

- Selective disclosure: A Wallet Unit can be enabled to present a subset of
attributes from at least one, but potentially multiple, (Qualified) Electronic
 Attestations of Attributes ((Q)EAAs).
- Relying Party unlinkability: Relying Party unlinkability means that one or more
Relying Parties cannot collude to determine if the selectively disclosed
attributes describe the same User
- Full unlinkability: Full unlinkability means that no party can collude to
determine if the selectively disclosed attributes describe the same User. This
includes PID Providers or Attestation Providers colluding with Relying Parties.

In accordance with [Topic A], the properties above must be understood as taking 
into account not only the risk of a collusion (from issuers and/or verifiers) 
but also the risk of a data breach (from the issuers and/or verifiers), allowing a 
third-party (possibly an attacker) to combine data to the aim of establishing links.

Additional privacy properties have also been defined in related literature. Such
properties are:

- Range proofs: A ZKP scheme may enable a Wallet Unit to prove that the value of
an attribute within an attestation satisfies a specific condition without
revealing the exact value. For example, the scheme could allow a Wallet Unit to
prove that their "year of birth" is earlier than 2007 without disclosing the
actual year.
- Privacy preserving revocation: A ZKP scheme may allow a Wallet Unit to prove
that a presented attestation is not included in a revocation list without
revealing any additional information. This proof is randomised to prevent
linkage across different verifications, ensuring that it cannot be used to track
or identify a specific User.
- Issuer hiding: A ZKP scheme may allow a Wallet Unit to prove that an
attestation was issued by a trusted PID Provider or Attestation Provider—i.e., a
PID Provider or Attestation Provider included in a
predefined trusted list—without disclosing any additional information about the
specific PID Provider or Attestation Provider.
- Pseudonymity: In some use cases, Relying Party unlinkability is not a
desirable property, and a Relying Party may need to correlate multiple
presentations of the same attestation to the same User (e.g., in the case of
"returning customers"). A ZKP scheme may allow Wallet Units to generate such
"correlation proofs" while still preserving user privacy to the extent required.
- Deniable Issuance and Presentation: A ZKP scheme may allow for repudiation of issued
and/or presented attestations.
- Composite Proofs: A ZKP scheme may allow a Wallet Unit to generate
presentations over several attestations with hidden attribute binding (present
vaccination credential + PID with matching name without revealing name).
- (Partially) Blind Issuance: A ZKP scheme may enable PID Providers or Attestation
Providers to issue attestations with attributes that remain hidden towards
the providers (but can be verifiably transferred from other attestations).
- Conditional Disclosure: A ZKP scheme may allow a Wallet Unit to generate attestation
presentations that contains verified but hidden attributes – which can be
discovered by dedicated party, e.g., personal address only accessible to postal service, not
online shop; credit card number revealed only in case of no-show.

## 3. Available Zero-Knowledge Proof schemes

Following ETSI TR 119 476 [ETSI_119476], ZKP schemes can be categorised into
*multi-message signature schemes* and *proofs for arithmetic circuits*.

### 3.1 Multi-message signature schemes

From a high-level perspective, multi-message signature-based solutions are
implemented as follows. Initially, a PID Provider or Attestation Provider constructs an attestation that can
be represented in the form of a list of messages. Then it uses a multi-message signature
algorithm and generates a (short) signature over the set of messages. A
Wallet Unit can now selectively hide any of the messages and generate a
ZKP which proves that “the Wallet Unit possesses a list of messages that
together with the revealed ones can verify the signature of the PID Provider or Attestation Provider. A
scheme of this category is BBS+ and its variant BBS#.

#### 3.1.1 BBS+/BBS#

BBS+ is a digital signature protocol which is used for signing a set of
messages.  It was first envisioned by Boneh, Boyen, Shacham in [BBS2024] (from
where it takes its name), touched and re-visited by [Cam2016]. Currently under
standardisation by the IRTF Crypto Forum Research Group [Loo2025], BBS+ provides the ability to
sign a set of individual messages, with only a single constant size signature.
The signature can be validated given the signer’s Public Key (PK) and the entire
set of signed messages; this is equivalent to validating a “traditional”
digital signature, if we consider the set of messages as a single compound
message. BBS+ can be combined with ZKPs allowing an entity to selectively hide
elements of a signed set of messages. In particular, any entity that knows the
signature and the original signed set of messages, can create a proof of
knowledge of the signature while selectively disclosing only a sub-array of the
signed messages. The proof can be validated with only the signer’s public key
and the array of revealed messages. BBS+ is based on pairing friendly curves.
BBS# [Ora2024] is a modification of BBS+ that removes the need for pairing-friendly 
elliptic curves, and can be combined with ECDSA signatures for device binding. 
Hence it can be used with existing WSCDs and P-256. The trade-off is that BBS# 
requires interaction with the issuer that scales linearly in the number of presentations. 
A recent work builds upon the ideas of BBS#, and provides a provably-secure variant of 
such Server-Aided Anonymous Credentials  [Api2025]. The latter 
work, also improves upon BBS# by preserving full unlinkability properties of BBS.

#### 3.1.2 Advantages

- Performant with low computational and communication overhead

#### 3.1.3 Disadvantages

- Require changes in the attestation signing process using digital signature schemes
 that are not widely supported yet on the issuer side

### 3.2 Proofs for arithmetic circuits (programmable ZKPs)

These solutions are based on a program expressed in the form of an arithmetic
circuit. This circuit receives a secret input, referred to as the witness,
which can be for example an attestation, as well as a public statement. The
circuit performs a calculation and outputs true if certain conditions hold (e.g.,
“the attestation includes an age attribute with value > 18”). A Wallet Unit
can then generate a ZKP which proves that “the Wallet Unit knows a witness (e.g.,
an attestation), which when provided as input to a certain circuit using the
provided statement, the circuit outputs true”. Zero-Knowledge Succinct Non-Interactive
Arguments of Knowledge (zk-SNARK) is a representative scheme of this category.

#### 3.2.1 zk-SNARKs

zk-SNARKs are ZKP schemes based on arithmetic circuits. Circuits can be
constructed for arbitrary programs expressed using a Domain Specific Language
(DSL) and an appropriate compiler. zk-SNARK solutions require a setup phase
where a circuit is mapped to some public parameters, which must be known both to
the prover and the verifier. This setup phase may require a secret input, which
must be hidden from the prover (trusted setup) or it may not require a secret input (transparent setup).
Furthermore, the secret input may be required for setting up all circuits, or
only for a specific universal setup phase. The setup phase has an impact on the
size of proof and the verification time. Recent advances in this area have demonstrated
interoperability with existing identification and authentication systems (e.g., [Lav2016], [Ros2023] ) 
as well as interoperability with existing attestation formats (e.g., [Fri2024], [Paq2024]). A
key challenge that these new proposals aim to address is that many multi-message signature schemes,
like BBS+, rely on new cryptographic assumptions that require system-wide
changes to PID Providers' and Attestation Providers' infrastructure. Additionally, PID Providers or Attestation Providers often mandate that
attestations be device-bound, integrating secure elements into the authentication
process. This further complicates adoption, as multi-message signature schemes would
necessitate either updates to both hardware secure elements and operating systems
across all user devices, or additional interactions between Wallet Units and PID Providers or Attestation Providers, whereas
some zk-SNARKs solutions, such as [Fri2024], can support
this function without requiring such modifications.

#### 3.2.2 Advantages

-  Do not require any change to the attestation signing process
- Can be used to prove arbitrary properties on the attributes (e.g., range proof)

#### 3.2.3 Disadvantages

- Introduce computational overhead and in some cases storage overhead

- Per use case circuits are required.

## 4. Discussion

### 4.1 Expectations from ZKP systems

In Chapter 2, we introduced key privacy properties of Zero-Knowledge Proof (ZKP)
systems. Some of these properties can also be achieved using non-ZKP mechanisms.
For example, selective disclosure can be implemented using salted and hashed
data signatures, while batch issuance can help achieve unlinkability between
presentations of the same attestation. Similarly, short-lived attestations may be
preferred to privacy-preserving revocation. On the other hand, certain privacy
properties can only be ensured through ZKPs. Similarly, replacing these mechanisms
with ZKP schemes may result in simpler protocols and attestation management processes.

Similarly, the need for privacy varies across use cases. In some scenarios, full
identity verification is required, such as when opening a bank account. In
contrast, other cases may only require proving a specific attribute or a
property of an attribute—such as proving that a user is over 18 without
revealing their exact birthdate. In cases where full identity verification is
necessary, achieving unlinkability is not possible. Indeed, this is also
recognised by the [European Digital Identity Regulation] which in Article 5a, 16b
mandates unlinkability "where the attestation of attributes does not require the
identification of the user". In the following we identify use cases where ZKP shall be
used when it becomes available.

#### 4.1.1 Selective disclosure of an attribute

In many cases, Users are required to prove that they possess a PID or attestation
that includes a specific attribute having a specific value without revealing additional information about
their identity. For example, they may need to prove possession of a PID that
includes the "age over 18" attribute with value equal to true or a specific city. A ZKP scheme can be used
in this use case to provide privacy-preserving selective disclosure for both remote
and proximity flows.

A ZKP scheme shall hide all attributes of the PID or attestation while providing proofs that:

- The PID or attestation includes the revealed attribute.
- The PID or attestation is within its validity period.
- The PID or attestation has not been revoked (if revocation is used).
- The PID or attestation has been issued by a trusted issuer, optionally without
revealing the issuer.
- The PID or attestation is bound to a key stored in the WSCD of the Wallet User.

#### 4.1.2 Proof of personhood

Many online services require users to prove that they are not robots. Currently,
this is usually done using CAPTCHA. According to a recent report, it takes a user
an average of 32 seconds to complete a CAPTCHA [Clo2021]. If a user could prove possession
of a PID, this would serve as a sufficient indication that the user is a human
being. A ZKP scheme can be used to provide a privacy-preserving proof of personhood.

In fact, this is a simpler form of the selective disclosure use case, as a ZKP scheme
shall provide the same proofs, except for the proof that "the PID or attestation includes
the revealed attribute."

For this use case, a suitable rate limiting mechanism shall be used in order to prevent users
from re-using an attestation in a malcious way. The fact that
a user shall authenticate to the WSCD before generating a proof is such a suitable
mechanism.

#### 4.1.3 Proof of attestation

The previous use case can be generalised to any type of attestation. For example,
Users may want to prove that they are students (e.g., to receive a discount) without
revealing any additional information about their identity. This should be possible
for both remote and proximity presentation flows.

#### 4.1.4 Privacy-preserving binding of an attestation to a PID

In many cases, "simple" attestations may need to be linked to the PID of a User.
For example, some countries require tickets for sporting events to include the User's
identity number. As a consequence, tickets for different sporting events can be
linked to the same User. Similarly, such information was included in the
implementation of some countries' COVID vaccination certificates.
By using a ZKP scheme and composite proofs, a Wallet Unit can generate a proof
that an attestation includes an attribute (e.g., `personal_administrative_number`),
which is also present in the User's PID, without revealing any information about
this attribute or any other attributes contained in the PID.
In addition to this binding, the ZKP scheme should also provide the same proofs
as the "Proof of Personhood" use case.

#### 4.1.5 Privacy preserving linking of an attestation to a Relying Party identifier

In some use cases, a Relying Party needs to correlate multiple presentations of
the same attestation (e.g., to detect a "returning customer"). A ZKP scheme can
be used to derive a pseudonym by combining an attribute of an attestation that
is unique to the User with the Relying Party identifier (or in general with some Relying Party specific context).

A related solution shall have the following properties:

- The attribute used for deriving the pseudonym shall be hidden from the
Relying Party.
- The attribute used for deriving the pseudonym shall also be hidden from the
Provider; otherwise, a colluding Provider and Relying Parties would be able to
correlate User presentations. This property can be achieved using blind issuance.

Using a ZKP scheme a User can create only a fixed number of verifiable pseudonyms associated with the same
Relying Party identifier (or context), as opposed for example
to the WebAutnN-based approach presented in Topic E. 


### 4.2 Device binding using WSCD

According to ARF "User binding [...] is the property that the subject of the PID
or attestation [...] is in fact the person that presents the PID or attestation
to the Relying Party." The simplest approach for implementing User binding is by
binding an attestation to a Wallet Secure Cryptographic Device (WSCD), aka
device binding, and then trusting the User authentication mechanisms implemented
by the WSCD. A PID Provider or Attestation Provider implements device
binding by including a cryptographic public key in the attestation and signing
it. The corresponding private key is protected by a certified WSCD in the Wallet
Unit. During an interaction, the Relying Party verifies that the PID or
attestation it received from a Wallet Unit is indeed bound to the WSCD included
in the Wallet Unit. The Relying Party does so by requesting the Wallet Unit to
sign some data using the private key corresponding to the public key in the PID
or attestation. However, the User public key can be used for tracking users and
linking their activities. 

A ZKP scheme should achieve the same functionality in a privacy-preserving
manner. Specifically, using a ZKP scheme, a Wallet Unit should be able to prove
that it knows a valid signature that can be verified using the public key
included in the PID or attestation—without revealing either the signature or the
public key.

### 4.3 Performance

ZKP schemes may introduce computational, communication, or storage overhead,
which can impact their practicality in real-world deployments. For example,
zkSNARKs may take several seconds to generate a proof, require tens or even hundreds
of megabytes of auxiliary data per attestation type (data that must be stored and
processed by the User’s device) and produce proofs that are several kilobytes in size.

To ensure usability, ZKP schemes should strike a balance between security and
efficiency, introducing only tolerable levels of overhead.

A ZKP-based solution should remain usable and feasible across different presentation
flows. Acceptable delays due to ZKP processing vary depending on the use case.
For instance, using an attestation in a proximity flow to enter a stadium imposes
stricter time constraints compared to a remote, cross-device presentation flow used
for user authentication. Likewise, technologies used for attestation presentation,
such as QR codes, NFC, and BLE, impose stricter requirements regarding the size of
the presented data.

### 4.4 Attestation format support

Implementing a ZKP solution may require modifications to the existing
attestation format. For instance, new fields might need to be added to the
attestation presentation to include the proof itself, proof parameters (e.g.,
the “index” of messages in multi-message signature formats), and other relevant
data. These changes must align with the specifications of the relevant message
format standards (e.g,ISO/IEC 18013-5). Additionally, future versions of ARF may
define different ZKP schemes for proximity and remote presentation flows.
Regardless of the specific approach, ZKP scheme providers should collaborate
with relevant standardisation bodies to ensure their schemes remain compatible
with the corresponding attestation formats.

### 4.5 Integration with issuance and presentation protocols

ZKP schemes may require modifications to the message format of the issuance and
presentation protocols, as well as adjustments to the metadata format used by
PID Providers or Attestation Providers. These changes could include new
fields for specifying ZKP parameters,
signaling ZKP support, and other relevant metadata. To ensure interoperability,
ZKP scheme providers should collaborate with standardisation bodies to maintain
compatibility with the corresponding protocols.

Additionally, support for ZKP schemes is expected to be introduced following the 
launch of the EUDI Wallet. By that time, many PIDs and attestations will already 
have been issued, and it should be possible to generate proofs for those already 
issued attestations.

Beyond changes to existing protocols, ZKP schemes may introduce additional
interactions. For example, zkSNARK-based schemes may require the distribution of
public parameters from PID Providers or Attestation Providers to Wallet Units and/or to Relying Parties.
Other schemes, such as BBS#, may require pre-computations that involve
communication between a Wallet Unit and a PID Provider or Attestation Provider, before a proof can be
generated. Privacy-preserving revocation mechanisms may also require Wallet
Units to retrieve cryptographic accumulators before generating a proof.

The frequency and overhead of these interactions vary significantly. Public
parameters may only need to be distributed once per attestation type, while
pre-computation steps might need to be performed for every N presentations.
Additionally, the impact of these interactions differs depending on scale; e.g.,
high-volume interactions initiated by thousands of Wallet Units could impose a
significant load on PID Providers or Attestation Providers and other network participants.
These interactions shall not result in User tracking or linkability.

### 4.6 Additional desirable properties from ZKP-based systems

Beyond the privacy properties of ZKP schemes presented in Section 2, a ZKP-based
system may also offer additional security properties.
A ZKP-based system may be extendable and updatable to accommodate future advancements
in security and performance. For instance, in a zkSNARK-based system, the arithmetic
circuits used for proof generation could be replaced or optimised to enhance
efficiency or mitigate newly discovered vulnerabilities. Likewise, a ZKP-based
system should be agile, allowing adaptability to different cryptographic
primitives. For example, a solution based on multi-message signatures could
support various elliptic curve types, enabling flexible deployment across different
environments and security requirements.

## 5 Additions and changes to the ARF

### 5.1 High-Level Requirements to be added to Annex 2

The following High-Level Requirements will be added to Annex 2 of the ARF

#### REQUIREMENT 1

A ZKP scheme SHALL provide support for the following generic functions, while hiding 
all attributes of PIDs or attestations: (i) generation of a proof that an (some) 
attribute(s) having a specific value is (are) included in a PID or attestation, 
(ii) generation of a proof that a PID or attestation is within its validity period, 
(iii) generation of a proof that a PID or attestation has not been revoked, (iv) 
generation of a proof that a PID or attestation is bound to a key stored in the 
WSCD of the Wallet User. Additionally, a ZKP scheme SHOULD provide support for the
following function which should  be used only when hiding 
the PID Provider or Attestation Provider is necessary (v) generation of a proof that a 
PID or attestation has 
been issued by a trusted PID Provider or Attestation Provider without revealing 
the PID Provider or Attestation Provider. 


#### REQUIREMENT 2

A ZKP scheme SHALL support proving possession of attestation of a given type.

#### REQUIREMENT 3

A ZKP scheme SHOULD support the privacy-preserving binding of an attestation to a PID. 
In addition to the generic functions defined in ZKP_01, for this use case, a ZKP 
scheme SHALL provide support for the following functions: (i) generation of a proof 
that the Wallet Unit stores an attestation and a PID and that the attestation includes a 
specific attribute, having a specific value, which is also present in the PID.

#### REQUIREMENT 4

A ZKP scheme SHOULD support the derivation of a verifiable User pseudonym, by combining 
an attribute value that is unique for the User with Relying Party specific context (e.g., the Relying Party identifier). 
In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme 
SHALL provide support for the following functions: (i) generation of a request for 
the issuance of an attestation that includes a secret attribute unique to the User, 
without revealing this attribute to the Attestation Provider, (ii) generation of an 
attestation presentation that includes a verifiable pseudonym derived from the secret 
attribute and the Relying Party identifier.

#### REQUIREMENT 5

A ZKP scheme SHALL be usable in both remote and proximity presentation flows. While 
the inclusion of ZKP will introduce computational and verification delays, these delays 
SHALL NOT critically undermine or defeat the service’s purpose (e.g. because of a 
critical impact on the User experience of the Wallet Unit).

#### REQUIREMENT 6

A ZKP scheme SHOULD be able to generate proofs for already issued PIDs and attestations 
in the formats specified in [ISO/IEC 18013-5] or [SD-JWT VC].

#### REQUIREMENT 7

A ZKP scheme SHALL NOT introduce any additional communication or information that 
could be used to track or link User activity during, before, or after proof generation.

#### REQUIREMENT 8

A ZKP scheme SHALL rely solely on algorithms standardised by a standardisation 
organisation recognised by the Commission or in a standard recognised by the Commission.


#### REQUIREMENT 9
Use of a ZKP scheme SHALL NOT prevent the Wallet Unit's ability to provide User 
authentication with Level of Assurance  "high".

### 5.2 High-Level Requirements to be changed

### 5.3 Descriptions to be added to the ARF main document

## 6 References

| Reference | Description |
| --- | --- |
| [Api2025] | Rutchathon Chairattana-Apirom, Franklin Harding, Anna Lysyanskaya, and Stefano Tessaro, "Server-Aided Anonymous Credentials," available at <https://eprint.iacr.org/2025/513>, 2025
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [BBS2024] | Boneh, Dan, Xavier Boyen, and Hovav Shacham. "Short group signatures." In Annual international cryptology conference, pp. 41-55. Berlin, Heidelberg: Springer Berlin Heidelberg, 2004. |
| [Cam2016] | Camenisch, Jan, Manu Drijvers, and Anja Lehmann. "Anonymous attestation using the strong diffie hellman assumption revisited." In Trust and Trustworthy Computing: 9th International Conference, TRUST 2016, Vienna, Austria, August 29-30, 2016, Proceedings 9, pp. 1-20. Springer International Publishing, 2016 |
| [Clo2021] | Cloudflare, Humanity wastes about 500 years per day on CAPTCHAs. It’s time to end this madness, available at <https://blog.cloudflare.com/introducing-cryptographic-attestation-of-personhood>|
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [ETSI\_119476] | ETSI TR 119 476 V1.2.1, Electronic Signatures and Trust  Infrastructures (ESI); Analysis of selective disclosure and zero-knowledge proofs applied to Electronic Attestation of Attributes |
| [Fri2024] | Matteo Frigo and abhi shelat, Anonymous credentials from ECDSA, Cryptology ePrint Archive, Paper 2024/2010, 2024, available at <https://eprint.iacr.org/2024/2010> |
| [Lav2016] | Antoine Delignat-Lavaud, Cédric Fournet, Markulf Kohlweiss, and  Bryan Parno, "Cinderella: Turning Shabby X.509 Certificates into Elegant Anonymous Credentials with the Magic of Verifiable Computation, IEEE Symposium on Security and Privacy, 2016
| [Loo2025] | Tobias Looker, Vasilis Kalos, Andrew Whitehead and  Mike Lodder, "The BBS Signature Scheme," available at <https://datatracker.ietf.org/doc/draft-irtf-cfrg-bbs-signatures/>, 2025
| [Ora2024] | Nicolas Desmoulins, Antoine Dumanois, Seyni Kane, and Jacques Traoré, “The BBS# protocol”, Technical Report, 2025 |
| [Paq2024] | Christian Paquin, Guru-Vamsi Policharla, and Greg Zaverucha, Crescent: Stronger Privacy for Existing Credentials, Cryptology ePrint Archive, Paper 2024/2013, 2024, available at <https://eprint.iacr.org/2024/2013> |
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation (EU) 2024/2981 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets |
| [Ros2023]| Michael Rosenberg, Jacob White, Christina Garman, and Ian Miers, "zk-creds: Flexible Anonymous Credentials from zkSNARKs and Existing Identity Infrastructure", IEEE Symposium on Security and Privacy, 2023
| [Topic_A] | Discussion Paper for the European Digital Identity Cooperation Group regarding Topic A: Privacy risks and mitigation, version 1.0 |
