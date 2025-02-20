# G - Zero Knowledge Proof

Version 0.1, updated 19 February 2025

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group regarding
Topic  G: Zero Knowledge Proof.

The ARF Development Plan \[ARF\_DevPlan\] describes this Topic as follows:

ZKP offer strong potential as a privacy-enhancing technique. It should be
revisited to determine the foundational requirements needed for its future
integration, particularly focusing on defining specific requirements for
implementing ZKP by using any type of WSCD/WSCA.

### 1.2 Related risks in the Risk Register

Risks considered in \[Topic\_A\] are also applicable here

## 1.3 Key words

This document uses the capitalized key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalized) is used to indicate an external
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
European Digital Identity Framework \[European Digital Identity Regulation\], Recital 14, discusses the use of
privacy-preserving technologies, such as zero knowledge proof:

> Member States should integrate different privacy-preserving technologies, such
as zero knowledge proof, into the European Digital Identity Wallet. Those
cryptographic methods should allow a relying party to validate whether a given
statement based on the person’s identification data and attestation of
attributes is true, without revealing any data on which that statement is based,
thereby preserving the privacy of the user.

Similarly, Recital 15 of \[European Digital Identity Regulation\] mentions:

> All Union citizens [...] should be empowered to securely request, select, combine,
store, delete, share and present data related to their identity [...] while enabling
selective disclosure of personal data

Recital 59 of \[European Digital Identity Regulation\] provides the following definition and requirements for
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

Furthermore, Article 5a, 16 of \[European Digital Identity Regulation\] mandates for "the technical framework
of the European Digital Identity Wallet" to:

> (a) not allow providers of electronic attestations of attributes or any other
party, after the issuance of the attestation of attributes, to obtain data that
allows transactions or user behaviour to be tracked, linked or correlated,
or knowledge of transactions or user behaviour to be otherwise obtained, unless
explicitly authorised by the user;
> (b) enable privacy preserving techniques which ensure unlikeability, where the
attestation of attributes does not require the identification of the user.

Finally, article 11a.2 of \[European Digital Identity Regulation\] mandates that:

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

ETSI TR 119 476 \[ETSI\_119476\] defines the following privacy-preserving
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

Additional privacy properties have also been defined in related literature. Such
properties are:

- Range proofs: A ZKP scheme may enable a Wallet Unit to prove that the value of
an attribute within an attestation satisfies a specific condition without
revealing the exact value. For example, the scheme could allow a Wallet Unit to
prove that their "year of birth" is earlier than 2007 without disclosing the
actual year.
- Privacy preserving revocation: A ZKP scheme may allow a Wallet Unit to prove
that a presented attestation is not included in a revocation list without
revealing any additional information. This proof is randomized to prevent
linkage across different verifications, ensuring that it cannot be used to track
or identify a specific User.
- Issuer hiding: A ZKP scheme may allow a Wallet Unit to prove that an
attestation was issued by a trusted PID Provider or Attestation Provider—i.e., a PID Provider or Attestation Provider included in a
predefined trusted list—without disclosing any additional information about the
specific PID Provider or Attestation Provider.
- Pseudonymity: In some use cases, Relying Party unlinkability is not a
desirable property, and a Relying Party may need to correlate multiple
presentations of the same attestation to the same User (e.g., in the case of
"returning customers").  A ZKP scheme may allow Wallet Units to generate such
"correlation proofs" while still preserving user privacy to the extent required.

## 3. Available Zero-Knowledge Proof schemes

Following ETSI TR 119 476 \[ETSI\_119476\]  ZKP schemes can be categorized into
*multi-message signature schemes* and *proofs for arithmetic circuits*.

### 3.1 Multi-message signature schemes

From a high-level perspective, multimessage signature-based solutions are
implemented as follows. Initially, a PID Provider or Attestation Provider constructs an attestation that can
be represented in the form of a list of messages. Then it uses a group signature
algorithm and generates a (short) signature over the group of messages. A
Wallet Unit can now selectively hide any of the messages and generate a
ZKP which proves that “the Wallet Unit possesses a list of messages that
together with the revealed ones can verify the signature of the PID Provider or Attestation Provider. A
scheme of this category is BBS+ and its variant BBS#.

#### 3.1.1 BBS+/BBS\#

BBS+ is a digital signature protocol which is used for signing a group of
messages.  It was first envisioned by Boneh, Boyen, Shacham in  \[BBS2024\] (from
where it takes its name), touched and re-visited by \[Cam2016\]. Currently under
standardization IRTF Crypto Forum Research Group. BBS+ provides the ability to
sign a group of individual messages, with only a single constant size signature.
The signature can be validated given the signer’s Public Key (PK) and the entire
group of signed messages; this is equivalent to validating a “traditional”
digital signature, if we consider the group of messages as a single compound
message. BBS+ can be combined with ZKPs allowing an entity to selectively hide
elements of a singed group of messages. In particular, any entity that knows the
signature and the original signed group of messages, can create a proof of
knowledge of the signature while selectively disclosing only a sub-array of the
signed messages. The proof can be validated with only the signer’s public key
and the array of revealed messages. BBS+ is based on pairing friendly curves.
BBS# \[Ora2024\] is a modification of BBS+ allowing group signatures and
selective disclosure based on ECDSA.

#### 3.1.2 Advantages

- Performant with low computational and communication overhead

- They are generic and they can be used with any type of attestation

#### 3.1.3 Disadvantages

- Require support for digital signature schemes that  not widely supported yet

### 3.2 Proofs for arithmetic circuits (programmable ZKPs)

These solutions are based on a program expressed in the form of an arithmetic
circuit. This circuit receives a secret input, referred to as the witness,
which can be for example an attestation, as well as a public statement. The
circuit performs a calculation and outputs true if certain conditions hold (e.g.,
“the attestation includes an age attribute with value > 18”). A Wallet Unit,
can then generates a ZKP which proves that “the Wallet Unit knows a witness (e.g.,
an attestation), which when provided as input to a certain circuit using the
provided statement, the circuit outputs true”. Zero-Knowledge Succinct Non-Interactive
Arguments of Knowledge (zk-SNARK) is a representative scheme of this category.

#### 3.2.1 zk-SNARKs

zk-SNARKs are ZKP schemes based on arithmetic circuits. Circuits can be
constructed for arbitrary programs expressed using a Domain Specific Language
(DSL) and an appropriate compiler.  zk-SNARK solutions require a setup phase
where a circuit is mapped to some public parameters, which must be known both to
the prover and the verifier.  This setup phase may require a secret input, which
must be hidden from the prover (trusted setup) or it may not require a secret input (transparent setup).
Furthermore, the secret input may be required for setting up all circuits, or
only for a specific universal setup phase.  The setup phase has an impact on the
size of proof and the verification time. Recent advances in this area, such as
\[Fri2024\] and \[Paq2024\] have demonstrated interoperability with existing attestation formats. A
key challenge that these new proposals aim to address is that many multi-message signature schemes,
like BBS+, rely on new cryptographic assumptions that require system-wide
changes to PID Providers' and Attestation Providers' infrastructure. Additionally, PID Providers or Attestation Providers often mandate that
attestations be device-bound, integrating secure elements into the authentication
process. This further complicates adoption, as multi-message signature schemes would
necessitate either updates to both hardware secure elements and operating systems
across all user devices, or additional interactions between Wallet Units and PID Providers or Attestation Providers, whereas 
some zk-SNARKs solutions, such as \[Fri2024\], can support
this function without requiring such modifications.

#### Advantages

- Can be used with existing signature algorithms. Do not require any change to
the issuance process

#### Disadvantages

- Introduce computational overhead and in some cases storage overhead

- Per use case circuits are required.

## 4. Discussion

### 4.1 Expectations from ZKP systems

In Chapter 2, we introduced key privacy properties of Zero-Knowledge Proof (ZKP)
systems. Some of these properties can also be achieved using non-ZKP mechanisms.
For example, selective disclosure can be implemented using salted and hashed
data signatures, while batch issuance can help achieve unlinkability between
presentations of the same credential. Similarly, short-lived certificates may be
preferred to privacy-preserving revocation. On the other hand, certain privacy
properties can only be ensured through ZKPs.

Similarly, the need for privacy varies across use cases. In some scenarios, full
identity verification is required, such as when opening a bank account. In
contrast, other cases may only require proving a specific attribute or a
property of an attribute—such as proving that a user is over 18 without
revealing their exact birthdate.  In cases where full identity verification is
necessary, achieving unlinkability may not always be possible.

**Question**
* What are the practical use cases for ZKPs? Which privacy properties are most
important for a ZKP scheme to provide, and in which scenarios? Are there cases where
non-ZKP mechanisms might be preferable to ZKPs? If so, why?
* Who determines which approach should be used? Shall ZKP and alternative non-ZKP approaches 
be used simultaneously?


### 4.2 User binding using WSCD

According to ARF "User binding [...] is the property that the subject of the PID
or attestation [...] is in fact the person that presents the PID or attestation
to the Relying Party." The simplest approach for implementing User binding is by
binding an attestation to a Wallet Secure Cryptographic Device (WSCD), aka
device binding, and then trusting the User authentication mechanisms implemented
by the WSCD.  A PID Provider or Attestation Provider implements device
binding by including a cryptographic public key in the attestation and signing
it. The corresponding private key is protected by a certified WSCD in the Wallet
Unit. During an interaction, the Relying Party verifies that the PID or
attestation it received from a Wallet Unit is indeed bound to the WSCD included
in the Wallet Unit. The Relying Party does so by requesting the Wallet Unit to
sign some data using the private key corresponding to the public key in the PID
or attestation.

A ZKP scheme should achieve the same functionality in a privacy-preserving
manner.  Specifically, using a ZKP scheme, a Wallet Unit should be able to prove
that it knows a valid signature that can be verified using the public key
included in the PID or attestation—without revealing either the signature or the
public key.

**Question**
Do you agree with the requirement that a ZKP scheme shall support user binding using
WSCD?

### 4.3 Performance

ZKP schemes may introduce computational, communication, or storage overhead, which
can impact their practicality in real-world deployments. For example, zkSNARKs
may take several seconds to generate a proof, require tens or even hundreds of MBs megabytes of auxiliary
data per attestation type that should be stored in and processed by the User device, and produce proofs that are several kilobytes in size.
To ensure usability, ZKP schemes should strike a balance between security and
efficiency, introducing only tolerable levels of overhead.

To maintain feasibility, certain thresholds should be considered. For instance,
proof generation time should remain below 2 seconds, storage overhead should not
exceed 10MB per attestation type, and communication overhead should be limited
to 100KB per proof.

**Question**
What should be the acceptable overhead of a ZKP scheme? Is there any other type of
overhead that needs to be considered? What about required hardware?

### 4.4 Attestation format support

Implementing a ZKP solution may require modifications to the existing
attestation format. For instance, new fields might need to be added to the
attestation presentation to include the proof itself, proof parameters (e.g.,
the “index” of messages in multi-message signature formats), and other relevant
data. These changes must align with the specifications of the relevant message
format standards (e.g, ISO mdoc).  Additionally, future versions of ARF may
define different ZKP schemes for proximity and remote presentation flows.
Regardless of the specific approach, ZKP scheme providers should collaborate
with relevant standardization bodies to ensure their schemes remain compatible
with the corresponding attestation formats.

**Question**
Do you agree with this approach?

### 4.5 Integration with issuance and presentation protocols

ZKP schemes may require modifications to the message format of the issuance and
presentation protocols, as well as adjustments to the metadata format used by
PID Providers or Attestation Providers. These changes could include new fields for specifying ZKP parameters,
signaling ZKP support, and other relevant metadata. To ensure interoperability,
ZKP scheme providers should collaborate with standardization bodies to maintain
compatibility with the corresponding protocols.

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

**Question**
Should there be limits on the additional interactions introduced by ZKP schemes?
Besides system load, what other types of impact can be considered? How can this
impacts be assessed?

### 4.6 Other desirable properties

A ZKP system may be extendable and updatable to accommodate future advancements
in security and performance. For instance, in a zkSNARK-based system, the arithmetic
circuits used for proof generation could be replaced or optimized to enhance efficiency
or mitigate newly discovered vulnerabilities. Similarly, a ZKP system may be agile,
allowing adaptability to different cryptographic primitives. For example, a solution
based on multi-message signatures could support various elliptic curve types,
enabling flexibility in deployment across different environments and security requirements.

**Question**
What other desirable properties may/shall a ZKP scheme have?

## 5 Additions and changes to the ARF

### 5.1 High-Level Requirements to be added to Annex 2

The following High-Level Requirements will be added to Annex 2 of the ARF v1.11

### 5.2 High-Level Requirements to be changed

### 5.3 Descriptions to be added to the ARF main document

## 6 References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| \[BBS2024\] | Boneh, Dan, Xavier Boyen, and Hovav Shacham. "Short group signatures." In Annual international cryptology conference, pp. 41-55. Berlin, Heidelberg: Springer Berlin Heidelberg, 2004. |
| \[Cam2016\] | Camenisch, Jan, Manu Drijvers, and Anja Lehmann. "Anonymous attestation using the strong diffie hellman assumption revisited." In Trust and Trustworthy Computing: 9th International Conference, TRUST 2016, Vienna, Austria, August 29-30, 2016, Proceedings 9, pp. 1-20. Springer International Publishing, 2016 |
| \[European Digital Identity Regulation\] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| \[ETSI\_119476\] | ETSI TR 119 476 V1.2.1, Electronic Signatures and Trust  Infrastructures (ESI); Analysis of selective disclosure and zero-knowledge proofs applied to Electronic Attestation of Attributes |
| \[Fri2024\] | Matteo Frigo and abhi shelat, Anonymous credentials from ECDSA, Cryptology ePrint Archive, Paper 2024/2010, 2024, available at <https://eprint.iacr.org/2024/2010> |
| \[Ora2024\] | Orange, “The BBS# protocol”, Technical Report, 2024 |
| \[Paq2024\] | Christian Paquin, Guru-Vamsi Policharla, and Greg Zaverucha, Crescent: Stronger Privacy for Existing Credentials, Cryptology ePrint Archive, Paper 2024/2013, 2024, available at <https://eprint.iacr.org/2024/2013> |
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation (EU) 2024/2981 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets |
| \[Topic\_A\] | Discussion Paper for eIDAS Coordination Group regarding Topic A: Privacy risks and mitigation, version 1.0 |
