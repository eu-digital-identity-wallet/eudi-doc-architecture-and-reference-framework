## 5 Data model and data exchange protocols

### 5.1 Attestation elements

Within the EUDI Wallet ecosystem, data is exchanged in the form of Electronic
Attestations of Attributes (EAA), hereafter referred to as 'attestations.' Apart
from EAA, the [European Digital Identity Regulation] explicitly defines another
category of data, called Person Identification Data (PID), see [Section 5.2][52-attestation-categories].

Each PID and attestation consists of the following key elements:

- A set of **attributes**, which provide information, typically about the
subject of the attestation. A Relying Party will request one or more of these
attributes to get the reliable information they need to provide some service to
the User. The set of attributes that an attestation may contain is defined in an
attestation scheme, see below.

- A set of **metadata**, meaning information about the attestation itself, such
as its attestation type (PID, mDL, diploma, etc.), its Attestation Provider, and
its administrative validity period, if applicable. This kind of metadata is also
defined in an attestation scheme. In addition, metadata also includes
information that is necessary to ensure the security of the attestation. This
includes at least its technical validity period. For PIDs and device-bound
attestations, it also includes a public key of the PID or attestation, which a
Relying Party will use to verify that the PID or attestation was not copied, see
[Section 6.6.3.8][6638-relying-party-instance-verifies-device-binding].
It may also include information allowing the Relying Party to verify that the
PID or attestation was not revoked, see [Section 6.6.3.7][6637-relying-party-verifies-that-the-pid-or-attestation-is-not-revoked].

- A **proof**, which ensures the integrity, authenticity, and support of
selective disclosure of the attestation. The format of the proof complies with
the proof mechanism specified for this type of attestation, see below. The proof
includes information that enables a Relying Party to verify the proof, for
example an Attestation Provider certificate and a reference to a trust anchor
that can be used to verify that certificate.

An **attestation scheme** defines the logical organisation of all mandatory and
optional attributes within an attestation, as well as the format of each
attribute, meaning its unique identifier, encoding, allowed values, and
serialisation. In addition, an attestation scheme specifies some of the
attestation metadata, such as its attestation type and information about its
Attestation Provider, validity period, etc. Within the EUDI Wallet ecosystem,
the attestation scheme for each attestation type may be specified by an Attestation
Scheme Provider, next to an Attestation Rulebook; see [Section 5.5][55-attestation-rulebooks-and-attestation-schemes].

A **proof mechanism** defines the method used to create the attestation proof.
For example, a 'standard' digital signature is a proof ensuring integrity and
authenticity, but not allowing selective disclosure. Proof mechanisms are
specified in standards or technical specifications. The attestation formats
listed in [Section 5.4][54-technical-attestation-formats-and-proof-mechanisms] either
specify a proof mechanism that allows for selective disclosure, or leave it to
other technical specifications to do so.

### 5.2 Attestation categories

#### 5.2.1 Overview

Within the European Digital Identity Wallet ecosystem, the [European Digital
Identity Regulation] distinguishes four legal categories of attestations:

- Person Identification Data (PID),
- Qualified Electronic Attestation of Attributes (QEAA),
- Electronic attestation of attributes issued by or on behalf of a public sector
body responsible for an authentic source (PuB-EAA),
- Non-Qualified EAA.

The next subsections give more information about each of these categories.
Please note that the differences between them are purely legal. For example, a
diploma may be a QEAA or a non-qualified EAA, depending on whether it is issued
by a qualified trust service provider (QTSP) or by an unqualified one.
Similarly, an mDL may be issued as a PuB-EAA, a QEAA, or a non-qualified EAA,
depending on the legal status of the party issuing mobile driving licences in
each Member State. From a technical point of view, all PIDs, QEAAs, PuB-EAAs,
and EAAs comply with one of the attestation formats listed in [Section 5.4][54-technical-attestation-formats-and-proof-mechanisms].

#### 5.2.2 Person Identification Data (PID)

A PID is a set of data that is issued in
accordance with Union or national law and that enables the establishment of the
identity of a natural or legal person, or of a natural person representing
another natural person or a legal person.

Besides the fact that the [European Digital Identity Regulation] defines the PID as a category of data that
is legally distinct from Electronic Attestations of Attributes (EAA), another
difference between PID and EAA is that the presence or absence of a valid PID
determines whether a Wallet Unit is in the Operational or the Valid state, as
discussed in [Section 4.6.4][464-wallet-unit].

As implied in that section, it is possible for a Wallet Unit to contain multiple
PIDs. If the User has multiple nationalities, they may be able to
receive a PID from multiple PID Providers in a single Wallet Unit. However,
please note that a Wallet Provider is free to decide that its Wallet Unit does
not support all PID Providers, and that, conversely, a PID Provider may decide
that it does not support all Wallet Solutions; see [Section 6.5.2.3][6523-user-validates-that-wallet-solution-is-usable-with-relevant-pid].
Note that the subject of all PIDs in the Wallet Unit will be
the same person, namely the User of the Wallet Unit.

For more information, please refer to [Section 3.4][34-person-identification-data-pid-providers].

#### 5.2.3 Qualified Electronic Attestation of Attributes (QEAA)

A QEAA is an electronic attestation of attributes which is issued by a qualified
trust service provider (QTSP) and meets the requirements laid down in Annex V of
the [European Digital Identity Regulation]. For more information, please refer to [Section 3.6][36-qualified-electronic-attestation-of-attributes-qeaa-providers].

#### 5.2.4  Electronic attestation of attributes issued by or on behalf of a public sector body responsible for an authentic source (PuB-EAA)

A PuB-EAA is an electronic attestation of attributes issued by a public sector
body that is responsible for an authentic source or by a public sector body that
is designated by the Member State to issue such attestations of attributes on
behalf of the public sector bodies responsible for authentic sources in
accordance with Article 45f and with Annex VII of the [European Digital Identity Regulation].

For more information, please refer to [Section 3.7][37-eaa-issued-by-or-on-behalf-of-a-public-sector-body-responsible-for-an-authentic-source-pub-eaa-providers].

#### 5.2.5 Non-Qualified Electronic Attestation of Attributes (EAA)

A non-qualified EAA is an EAA which is not a QEAA or a PuB-EAA. For more
information, please refer to [Section 3.8][38-non-qualified-electronic-attestation-of-attributes-eaa-providers].

### 5.3 Logical versus technical PIDs and attestations

When discussing PIDs and attestations, it is important to make a distinction between 'logical' and 'technical' PIDs and attestations. By a 'logical PID or attestation', this ARF means a PID or attestation as it will be understood, for instance, by a non-expert User. When such a User says they have a PID in their Wallet, what they mean is that they see their PID and its attributes in the UI of their Wallet Unit, and that they can present PID attributes to a Relying Party. They do not know about, or care about, the format of that PID or the proof mechanism used by it. In contrast, what this ARF calls a 'technical PID or attestation' is a specific data structure having a specific encoding and proof mechanism, as explained in [Section 5.4][54-technical-attestation-formats-and-proof-mechanisms].

Each technical PID or attestation that is present in a Wallet Unit corresponds to a logical PID or attestation of the User of that Wallet Unit. However, a single logical PID or attestation can (and will) correspond to multiple technical PIDs or attestations, which are present in the User's Wallet Unit either simultaneously or over time. For example, as explained in [Section 7.4.3.5.2][74352-mitigating-relying-party-linkability], a PID Provider may issue a batch of technical PIDs to a Wallet Unit, and then stipulate that the Wallet Unit must present a different technical PID each time when the User presents their logical PID. This eliminates the risk that a fraudulent Relying Party, possibly in collusion with other Relying Parties, tracks or traces the User by linking attestations based on their unique elements, such as public keys.

The difference between logical and technical PIDs and attestations is particularly important when discussing re-issuance of PIDs and attestations. For reasons of privacy and security, a technical PID or attestation has a technical validity period, which is usually rather short. That means that during the lifetime of the associated logical PID or attestation, it will be necessary to regularly issue new technical PIDs or attestations. For more information about re-issuance, see [Section 6.6.6.2][6662-pid-or-attestation-re-issuance].

Please note that when this ARF talks about PIDs or attestations, it means *technical* PIDs or attestations, unless explicitly mentioned otherwise.

### 5.4 Technical attestation formats and proof mechanisms

#### 5.4.1 Overview

| Feature | [ISO/IEC 18013-5] / [ISO/IEC 23220-2] | [SD-JWT VC] | [W3C VCDM v2.0] |
| :--- | :--- | :--- | :--- |
| **Data Format** | CBOR (Binary) | JSON Web Token (JSON) | JSON-LD (Linked Data) |
| **Proof Type** | Embedded (Salted Hashes) | Embedded (Salted Hashes) | Detached or Embedded |
| **Key Use Case** | Proximity (e.g., mDL) | Remote (e.g., remote identification) | General (requires profiling) |
| **Wallet Support** | Mandatory | Mandatory | Optional |

[Section 5.1][51-attestation-elements] listed a proof mechanism as one of the
key elements needed to define a type of attestation. The proof mechanism for an
attestation is closely related to the format of that attestation. Within the
EUDI Wallet ecosystem, the following standardised formats for electronic
attestations of attributes can be used:

- The format specified in [ISO/IEC 18013-5] and generalised in [ISO/IEC 23220-2],
- The format specified in 'SD-JWT-based Verifiable Credentials' [SD-JWT VC],
- The format specified in 'W3C Verifiable Credentials Data Model v2.0' [W3C VCDM v2.0].

The next subsections give more information about each of these formats and
specifications, and explain where the different elements of an attestation, as
explained in [Section 5.1][51-attestation-elements] are defined for that
attestation format.

Within the EUDI Wallet ecosystem, Wallet Units will support the first two
formats above. Support for the third format is optional and meant for
non-qualified EAAs only. [Topic 12][topic-12]
states the detailed requirements regarding support by Wallet Units, PID
Providers, and Attestation Providers for these formats and specifications.

#### 5.4.2 [ISO/IEC 18013-5] and [ISO/IEC 23220-2]

The [ISO/IEC 18013-5] standard was originally developed as a standard for mobile
driving licences (mDL) and mDL readers. In terms of this ARF, an mDL is a Wallet
Unit containing an mDL attestation (as defined in the [mDL Rulebook](../annexes/annex-3/annex-3.02-mDL-rulebook.md)),
while an mDL reader is a Relying Party requesting such an attestation.

[ISO/IEC 18013-5] specifies:

- An attestation scheme containing all attributes and metadata for an mDL. The
scheme specifies the semantics of these attributes and metadata, as well as
their encoding in Concise Binary Object Representation (CBOR), see [RFC 8949].
The standard also specifies the use of namespaces to avoid collision of
attribute identifiers.
- A proof mechanism ensuring the authenticity and integrity of a PID or
attestation, while allowing selective disclosure of attributes.
- A mandatory security mechanism enabling device binding of PIDs and
attestations, see [Section 6.6.3.8][6638-relying-party-instance-verifies-device-binding],
- All other aspects necessary to securely request, present, and verify an mDL
attestation in proximity flows, see [Section 5.7.2][572-proximity-attestation-presentation-using-isoiec-18013-5].

Points to note about [ISO/IEC 18013-5]:

- the mDL attestation scheme (see first bullet above) is the only aspect of
ISO/IEC 18013-5 that is specific for mDLs. All other aspects are generic and
can be used for any other attestation type, including PIDs. This means that
another [ISO/IEC 18013-5]-compliant attestation type can be created simply by
specifying an appropriate attestation scheme using CBOR, and referring to [ISO/IEC
18013-5] for all other details. Please refer to Chapter 3 of the [PID Rulebook](../annexes/annex-3/annex-3.01-pid-rulebook.md)
for an example. Within the EUDI Wallet ecosystem, such an attestation scheme is
specified in an Attestation Rulebook, see [Section 5.5][55-attestation-rulebooks-and-attestation-schemes].
ISO/IEC 23220-2 specifies a generic set of attributes for use in different
attestation types, and also specifies how these can be encoded in CBOR.
- An ISO/IEC standard for presenting mobile documents in general (not mDLs specifically) is in
preparation and will become [ISO/IEC 23220-4]. This standard will generalise
ISO/IEC 18013-5, in the sense that it will allow more options and communication
flows. Once that standard is published, all references in this ARF to [ISO/IEC
18013-5] may be replaced by appropriate references to [ISO/IEC 23220-4]. However,
at the moment [ISO/IEC 23220-4] is not finished yet and therefore cannot be
referenced.
- Within the EUDI Wallet ecosystem, [ISO/IEC 18013-5]-compliant attestations are requested and presented in proximity using the transmission mechanism and protocol described in [Section 5.7.2][572-proximity-attestation-presentation-using-isoiec-18013-5]. For remote presentation, such attestations are requested and presented either using the transmission mechanism and protocol specified in [ISO/IEC 18013-7], see [Section 5.7.3][573-remote-attestation-presentation-using-isoiec-18013-7], or using the ones described in [OpenID4VP] and [HAIP], see [Section 5.7.4][574-remote-attestation-presentation-using-openid4vp-and-haip].

#### 5.4.3 [SD-JWT VC]

'SD-JWT-based Verifiable Credentials' [SD-JWT VC] specifies a data format and
processing rules to express verifiable credentials (i.e., attestations).
"SD-JWT" here stands for 'Selectively Disclosable JSON Web Token'. As that name
suggests, SD-JWTs are a special form of JWTs [RFC 7519] that are selectively
disclosable. The mechanisms used to make them selectively disclosable is often
described as using 'salted hashes', and is conceptually identical to the
mechanism used for the same purpose in [ISO/IEC 18013-5].

[SD-JWT VC] specifies the following aspects:

- The encoding to be used for attributes and metadata, namely JSON, as well as
rules to prevent collisions of claim names,
- A proof mechanisms ensuring the authenticity and integrity of a PID or
attestation, while allowing selective disclosure of attributes, see above.
- A security mechanism enabling device binding of PIDs and attestations, see
[Section 6.6.3.8][6638-relying-party-instance-verifies-device-binding].
This mechanism is optional in [SD-JWT VC].

In addition to these aspects, within the EUDI Wallet ecosystem,

- attestation schemes for specific [SD-JWT VC]-compliant attestation types will be
specified in Attestation Rulebooks, see [Section 5.5][55-attestation-rulebooks-and-attestation-schemes].
Please refer to Chapter 4 of the [PID Rulebook](../annexes/annex-3/annex-3.01-pid-rulebook.md)
for an example.
- [SD-JWT VC]-compliant attestations will be requested and presented remotely using the protocol and transmission mechanism specified in
[OpenID4VP] and [HAIP], see [Section 5.7.4][574-remote-attestation-presentation-using-openid4vp-and-haip]. [SD-JWT VC]-compliant attestations cannot be used in proximity presentations.

Since [SD-JWT VC] contains a number of options, the use of the profile for
SD-JWT VCs specified in [HAIP] is necessary to ensure interoperability between
Wallet Units and Relying Parties.

#### 5.4.4 W3C Verifiable Credentials

The W3C Verifiable Credentials Data Model [W3C VCDM v2.0] defines a general data model,
offering a high-level structure but leaving many technical aspects open for further
definition, including:

- Security mechanisms
- Signature formats
- Transport protocols

Key features of W3C VCDM are:

- JSON-LD (Linked Data)-based: The use of JSON-LD ensures structured and
interoperable data exchange, but introduces complexity.
- Extensible Framework: Allows different implementations but requires
additional specifications.
- Security and Signature Formats: Not inherently defined — must be specified separately.

To implement W3C VCDM-based attestations, separate specifications are needed for
security mechanisms and signatures, such as:

1. 'Securing Verifiable Credentials using JOSE and COSE' [W3C VC-JOSE-COSE]:
Defines how to use one of the following to secure attestations in the VCDM
model:
    - a JWT (see [RFC 7519]),
    - a SD-JWT (see the [previous section][543-sd-jwt-vc]), or
    - a CBOR Web Token (CWT, see [RFC 8392]).
1. 'Verifiable Credential Data Integrity' [W3C VC Data Integrity]: Provides a
cryptographic proof format independent of JWT or CWT, relying on detached proofs
(not embedded signatures) for better flexibility.

These mechanisms offer different trade-offs, allowing PID Providers or
Attestation Providers and Relying Parties to choose the appropriate security
model based on their privacy, interoperability, and trust requirements. In order
to achieve interoperability, the specification of a profile standard making
specific choices will be necessary.

In addition to these aspects, within the EUDI Wallet ecosystem,

- attestation schemes for specific W3C VCDM-compliant attestation types (if any)
will be specified in Attestation Rulebooks, see [Section 5.5][55-attestation-rulebooks-and-attestation-schemes].
- W3C VCDM-compliant attestations may be requested and presented remotely using the protocol and transmission mechanism specified in
[OpenID4VP] and [HAIP], see [Section 5.7.4][574-remote-attestation-presentation-using-openid4vp-and-haip]. However, this ARF does not currently require this, and for any W3C VCDM-compliant
attestation, the applicable transport protocol must be defined in the
corresponding Rulebook. W3C VCDM-compliant attestations cannot be used in proximity presentations using [ISO/IEC 18013-5].

> Note: As the W3C VCDM format is used as the reference format for attestations in particular in the educational sector, Wallet Units may be required to support this format when the new profiles (created by ETSI) on the W3C VCDM format are available.

See [chapters 3 and 4 of the Discussion Paper for Topic V](../discussion-topics/v-pid-rulebook.md#3-attestation-formats)
for more considerations regarding the formats specified in [SD-JWT VC] and [W3C VCDM 2.0]
and their interoperability within the EUDI Wallet ecosystem.

### 5.5 Attestation Rulebooks and Attestation schemes

#### 5.5.1 Introduction

An **Attestation Scheme Provider** defines a type of attestation (e.g., PID,
mDL, diploma) and publishes a **human-readable Attestation Rulebook** that
explains what the attestation is and how it works: which attributes it contains,
what each attribute means, how the attributes are encoded, how proofs are
produced, and, where needed, how trust and presentation are handled. When the
attestation is listed in the European Commission's **catalogue of attestation
schemes** (the official index that lets ecosystem participants discover and
reuse attestation types), the Attestation Scheme Provider also includes a
**machine-readable attestation scheme**, so software can automatically build
requests to Wallet Units and verify responses.

In short: the **Rulebook** is the documentation for people, the **scheme** is
the specification for software, and the **catalogue** is where everyone finds
them.

[Section 5.1][51-attestation-elements] listed an attestation scheme as a key
element of any attestation type. This section introduces the **Attestation
Rulebook**, which for each attestation type specifies:

- the **attestation scheme** and proof mechanisms;
- where required, the **trust mechanisms** for authentication and authorisation;
- the **unique identifiers, syntax and encoding, and semantics** of all attributes
that may appear in the attestation;  
- the **presentation protocol(s)** that relevant attestations must support.

The requirements for Rulebooks are defined in [Topic 12][topic-12].

#### 5.5.2 Who defines Rulebooks and schemes

Attestation Rulebooks are defined by **Attestation Scheme Providers** (see
[Section 3.15][315-attestation-scheme-providers-for-qeaas-pub-eaas-and-eaas]).
This role can be held by various parties:

- **The European Commission**, in consultation with EDICG, currently maintains the [PID Rulebook](https://github.com/eu-digital-identity-wallet/eudi-doc-attestation-rulebooks-catalog/blob/main/rulebooks/pid/pid-rulebook.md)
and the [mDL Rulebook](https://github.com/eu-digital-identity-wallet/eudi-doc-attestation-rulebooks-catalog/blob/main/rulebooks/mdl/mdl-rulebook.md).
- **Public administrations or sectoral or cross-border organisations** will create EU-wide or sectoral Attestation Rulebooks. These organisations represent
relevant stakeholders, to avoid duplicative Rulebooks (e.g., for diplomas) and
unnecessary syntax or semantics divergence. Selection of the responsible
organisation for a particular type of attestation is out of scope for this document.
- **Individual Attestation Providers** can create Provider-specific Rulebooks as add-ons to a EU-wide or sectoral Rulebook, when they must include **domestic or
provider-specific attributes** not covered by the EU-wide or sectoral Rulebook
(see [Topic 12][topic-12]).
- **Single organisations** may write Attestation Rulebooks for attestations intended solely for internal use.

#### 5.5.3 Publication in the catalogue

An Attestation Scheme Provider may publish a new attestation in the
**catalogue of attestation schemes** to enable discovery by
Relying Parties and other actors (see [Section 5.6.3][563-catalogue-of-attestation-schemes]).
When doing so, the provider **also supplies the machine-readable attestation scheme**
in accordance with [Technical Specification 11](../technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md).

### 5.6 Catalogue of attributes and catalogue of attestation schemes

#### 5.6.1 Introduction

[Article 45e(2) of Regulation (EU) 2024/1183](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3883-1-1)
empowers the Commission to establish **specifications and procedures** for: (i)
the **catalogue of attributes**, (ii) the **catalogue of attestation schemes**,
and (iii) **verification procedures** for qualified electronic attestations of
attributes.

The objective of this provision is to reach a high level of interoperability:

- **Technical interoperability** through common standards, protocols, and
technical specifications enabling issuance, presentation, and processing of
attestations (see [Sections 5.4][54-technical-attestation-formats-and-proof-mechanisms] and
[5.7][57-protocols-and-transmission-mechanisms-for-attestation-presentation]).
- **Semantic interoperability** through clear definitions of
attestation contents, i.e., which attributes exist for each attestation type and
their identifiers, syntax, and semantics (see [Section 5.5][55-attestation-rulebooks-and-attestation-schemes]).

To support discovery and re-use across the EUDI Wallet ecosystem, two
Commission-run catalogues are defined:

- a **Catalogue of attributes** that draws on authentic public-sector sources
(see [Section 5.6.2][562-catalogue-of-attributes]); and
- a **Catalogue of attestation schemes** for QEAAs, PuB-EAAs, and EAAs (see
[Section 5.6.3][563-catalogue-of-attestation-schemes]).

#### 5.6.2 Catalogue of attributes

The catalogue of attributes is exclusively intended for use by QTSPs issuing
QEAAs, and enables them to find the access point of the Authentic Source
responsible for a given attribute, at which the QTSP can verify the value of that
attribute for a given User. This verification is discussed in [Topic 42][topic-42]
in Annex 2.

See [Topic 25][topic-25]
and [Commission Implementing Regulation 2025/1569](http://data.europa.eu/eli/reg_impl/2025/1569/oj),
particularly Article 7, for the high-level requirements for the catalogue of attributes.

For more details, see also the [Discussion Paper on Topic O](../discussion-topics/o-catalogues-for-attestations.md).
Detailed interface specifications for registering and managing attributes in the
catalogue and for querying the catalogue can be found in
[Technical Specification 11](../technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md).

#### 5.6.3 Catalogue of attestation schemes

The catalogue of attestation schemes is intended for use by Relying Parties,
Attestation Providers, and other actors in the EUDI Wallet ecosystem. It enables
them to discover which types of attestations already exist within the ecosystem,
and to understand the identifiers, syntax, and semantics of all attributes
within each type of attestation.

This section defines the following principles for the catalogue of attestation schemes:

- Attestation schemes are machine-readable, and each attestation scheme
published in the catalogue refers to the corresponding human-readable
Attestation Rulebook.
- Attestation schemes for QEAAs and PuB-EAAs used within the EUDI Wallet
ecosystem may be registered and published in the catalogue of attestation
schemes, but this is not mandatory.
- The catalogue of attestation schemes may also include attestation schemes for
non-qualified EAAs. Registration and publication of non-qualified EEAs is not mandatory.
- The Commission will take measures to establish and maintain the catalogue of
attestation schemes.
- The catalogue of attestation schemes will be publicly accessible.
- Registration of attestation scheme in the catalogue does not create any
obligation for acceptance of the relevant type of attestation by any actor in
the EUDI Wallet ecosystem. Neither does it automatically imply cross-border
recognition of the type of attestation.
- Where possible, existing tools created by Member States, the
Commission and cross-border organisations, will be used to connect to the
catalogue and to interact with its stakeholders. Also, mechanisms to add new and
existing data sets to the catalogue will be implemented.

See [Commission Implementing Regulation 2025/1569](http://data.europa.eu/eli/reg_impl/2025/1569/oj),
particularly Article 8, for the high-level requirements for the catalogue of attestation schemes.

For more details, see also the [Discussion Paper on Topic O](../discussion-topics/o-catalogues-for-attestations.md).
Detailed interface specifications for registering and managing attestation
schemes in the catalogue and for querying the catalogue can be found in
[Technical Specification 11](../technical-specifications/ts11-interfaces-and-formats-for-catalogue-of-attributes-and-catalogue-of-schemes.md).

### 5.7 Protocols and transmission mechanisms for attestation presentation

#### 5.7.1 Introduction

A protocol for attestation presentation consists of a series of messages that are exchanged between a Wallet Unit and a Relying Party Instance. A transmission mechanism specifies how a communication channel is established between these entities to enable them to exchange the protocol messages.

Within the EUDI Wallet ecosystem, the protocol and transmission mechanism specified in [ISO/IEC 18013-5] is used for proximity attestation presentation flows. For remote attestation presentation flows, Wallet Units and Relying Parties support the following protocols and transmission mechanisms:

- The protocol specified in [OpenID4VP], combined with a transmission mechanism based on redirects and custom URI schemes,
- The protocol specified in [OpenID4VP], combined with a transmission mechanism specified in [W3C Digital Credentials API],
- The protocol specified in [ISO/IEC 18013-7], combined with a transmission mechanism specified in [W3C Digital Credentials API].
- Optionally, the protocol specified in [ISO/IEC 18013-7], combined with a transmission mechanism based on redirects and custom URI schemes.

This section briefly describes these protocols. For high-level requirements, please refer to [Topic 1][topic-1]. Also refer to [ETSI TS 119 472-2].

#### 5.7.2 Proximity attestation presentation using [ISO/IEC 18013-5]

ISO/IEC 18013-5 specifies the following aspects related to secure data exchange
for attestation presentations:

1. Message structures and transaction flows allowing a Wallet Unit and a Relying
Party to request and present attestations.
2. Proximity interface specifications, allowing a Wallet Unit and a Relying
Party to set up a communication channel using QR code or NFC, and to
subsequently communicate over BLE, NFC, or Wi-Fi Aware.
3. Security mechanisms ensuring
    - the confidentiality and authenticity of all data exchanged between a
    Wallet Unit and a Relying Party,
    - Relying Party authentication, see [Section 6.6.3.2][6632-wallet-unit-authenticates-the-relying-party-instance].

As already explained in [Section 5.4.2][542-isoiec-18013-5-and-isoiec-23220-2],
although [ISO/IEC 18013-5] nominally specifies the mobile driving licence, all of
the above aspects are generic and can be used for any type of attestation.

#### 5.7.3 Remote attestation presentation using [ISO/IEC 18013-7]

Whereas [ISO/IEC 18013-5] specifies proximity transaction flows only, [ISO/IEC 18013-7] specifies how to transmit [ISO/IEC 18013-5]-compliant request and response messages in remote transaction flows. [ISO/IEC 18013-7] can be used only to request and present attestations in [ISO/IEC 18013-5]-compliant format.

[ISO/IEC 18013-7] specifies two transmission mechanisms for transporting presentation requests and responses between a Relying Party Instance and a Wallet Unit:

- The mechanism specified in Annex A is based on the use of a custom URI scheme.
- The mechanism specified in Annex C uses the [W3C Digital Credentials API].

More information about custom URI schemes and the Digital Credentials API can be found in [Section 4.4.3][443-remote-presentation-transaction-flows].

#### 5.7.4 Remote attestation presentation using [OpenID4VP] and [HAIP]

The [OpenID4VP] standard defines message structures, transaction flows, and an
HTTP-based interface specification for attestation presentations by Wallet Units
to Relying Parties. [OpenID4VP] also specifies security mechanisms ensuring:

- the confidentiality and authenticity of all data exchanged between a Wallet
Unit and a Relying Party,
- Relying Party authentication.

[OpenID4VP] is suitable only for remote presentation transaction flows. [OpenID4VP] can be used for presenting attestations in different formats,
including especially the [SD-JWT VC]-compliant and [ISO/IEC 18013-5]-compliant  formats used within the EUDI Wallet ecosystem.

Since [OpenID4VP] contains a number of options, the use of the profile for
'OpenID for Verifiable Presentations for IETF SD-JWT VC' specified in [HAIP] is
necessary to ensure interoperability between Wallet Units and Relying Parties. [HAIP] specifies two transmission mechanisms for transporting presentation requests and responses between a Relying Party Instance and a Wallet Unit. The first uses redirects and is based on the use of a custom URI scheme. The second uses the [W3C Digital Credentials API]. More information about custom URI schemes and the Digital Credentials API can be found in [Section 4.4.3][443-remote-presentation-transaction-flows].

#### 5.7.5 Transactional data using [ISO/IEC 18013-5] and [OpenID4VP]

In some use cases, a Relying Party must be able to include additional data in
the attestation presentation request. Primary examples include strong customer
authentication for payments, see [Section 2.6.4][264-strong-user-authentication-for-electronic-payments],
and the creation of qualified electronic signatures, see [Section 2.4][24-qualified-electronic-signatures].
In the case of strong customer authentication for payments, the Relying Party
sends payment information, such as the payment amount and the payee, to the
Wallet Unit. In the case of electronic signatures, the Relying Party may send (a
representation of) data to be signed to the Wallet Unit. In [Topic 20][topic-20],
such data is called transactional data.

The Wallet Unit will process the transactional data in a use-case specific way,
and, after consulting the User, will sign a (representation of the)
transactional data to authenticate it. The Wallet Unit will then return the
signed data in the presentation response, together with the presented
attributes, if any.

Both [ISO/IEC 18013-5] and [OpenID4VP] allow for sending, authenticating, and
returning transactional data. In both protocols, the presentation request can be
extended with use-case specific (proprietary) transactional data. The Wallet
Unit can subsequently sign this data by including it in the device binding
process, see [Section 6.6.3.8][6638-relying-party-instance-verifies-device-binding].
Therefore, no extensions of the presentation response are necessary to return
the signed transactional data.

### 5.8 Protocols and transmission mechanisms for attestation issuance

A protocol for attestation issuance consists of a series of messages that are exchanged between a Wallet Unit and a PID Provider or Attestation Provider. A transmission mechanism specifies how a communication channel is established between these entities to enable them to exchange the protocol messages.

Within the EUDI Wallet ecosystem, the protocol and transmission mechanism specified in [OpenID4VCI] is used for PID and attestation issuance flows. The [OpenID4VCI] standard defines message structures, transaction flows, and an
HTTP-based interface specification for attestation issuance, based on OAuth 2.0. It inherits many features of OAuth 2.0, such as the use of an Authorization Server to manage the authentication of Wallet Units ("clients") to one or more Credential Issuers ("Resource Servers"), and the use of Authorization Codes and Access Tokens. It adds specific features such as a Credential Offer endpoint to inform Wallet Units about the type(s) of credential that a particular Credential Issuer offers. It also specifies security mechanisms ensuring:

- the confidentiality and authenticity of all data exchanged between a Wallet
Unit and a PID Provider or Attestation Provider,
- Wallet Unit authentication,
- Transport of public keys to be included in attestations (credentials) from the Wallet Unit to the PID Provider or Attestation Provider.

Since [OpenID4VCI] contains a number of options, the use of the profile for
'OpenID for Verifiable Credential Issuance' specified in [HAIP] is
necessary to ensure interoperability between Wallet Units and Relying Parties. [Technical Specification 3](../technical-specifications/ts3-wallet-unit-attestation.md) specifies additional EUDI Wallet ecosystem-specific mechanisms on top of these specifications, in particular regarding the use of Wallet Instance Attestations (WIA) and Key Attestations (KA). 

Lastly, [ETSI TS 119 472-3] also contains EUDI Wallet ecosystem-specific mechanisms applicable to PID and attestation issuance, especially with regards to 

- the several methods for PID or attestation re-issuance explained in [Section 6.6.6.2][6662-pid-or-attestation-re-issuance] and [Section 7.4.3.5.2][74352-mitigating-relying-party-linkability],
- EUDI Wallet ecosystem-specific Credential Issuer metadata, in particular access certificates and registration certificates.

> Note: In addition to supporting [OpenID4VCI] in combination with [HAIP] and [ETSI TS 119 472-3], PID Providers are allowed to support other protocols for issuing PIDs to (national) Wallet Units, provided these protocols comply with all relevant requirements in the Implementing Acts and the standards referenced therein.. In many Member States, the PID Provider and the Wallet Provider are closely related, and can therefore bilaterally agree to support a different protocol for PID issuance.

