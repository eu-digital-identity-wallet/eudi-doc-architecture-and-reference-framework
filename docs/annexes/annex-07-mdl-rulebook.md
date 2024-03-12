# mDL Rule Book
*for the EUDI Wallet ecosystem*

_November 2023_
_v1.0.0_

*This is a working document that holds no legal value* *and does not
reflect any common agreement or position of the co-legislators. It
presents a state-of-play of ongoing work of the eIDAS Expert Group. This
document is being continuously updated and should not be considered
final.*

## Introduction

This document is the mobile driving licence (mDL) Rule Book. It contains
requirements specific to the mDL use case within the EUDI Wallet. These
requirements hold in addition to the requirements in the Architecture
Reference Framework (ARF), see \[ARF\]. Requirements in the ARF hold for
all use cases in the EUDI Wallel.

This mDL Rule Book contains the following topics:

-   Chapter 0 specifies the mDL attribute schema. This describes the
    structure, the type, the entity identifiers, and the logical
    organisation of the mandatory and optional attributes of the mDL. It
    also describes how Member States can specify any possible national
    attributes.

-   Chapter 3 specifies details about the trust infrastructure necessary
    for mDL attestations. This information may be moved to another
    document in the future.

Further topics will be added if and when they are identified.

## 1 mDL attribute schema {#mdl-attribute-schema .list-paragraph}

### 1.1 Introduction

This document describes the structure, type, data element identifiers,
and logical organisation of the mandatory and optional attributes of the
mobile driving licence (mDL) attestation within the EUDI Wallet. It also
describes how Member States can specify any possible national
attributes.

Requirement 7 in section 5.2.1 of the ARF specifies that (Q)EAAs must be
issued in accordance with one of the data models specified in ISO/IEC
18013-5:2021 or in the W3C Verifiable Credentials Data Model 1.1.
Requirements 8 and 10 make clear that for the latter encoding, Selective
Disclosure JSON Web Tokens (SD-JWT) must be used, and that consequently,
data elements must be encoded in JSON. For the former, data elements
must be encoded in CBOR.

However, mobile driving licences are legally specified in the proposed
EC Regulation 2023\_127 (4^th^ Driving Licence Regulation). This
Regulation specifies that mDLs shall comply with the ISO/IEC 18013-5
standard. It does not mention any other standards, in particular not
\[SD JWT\]. Consequently, mDLs issued to an EUDI Wallet Instance shall
not be implemented as \[SD JWT\]-compliant document. This document
therefore specified only an ISO/IEC 18013-5 compliant encoding.

### 1.2 ISO/IEC 18013-5 compliant encoding
A data model for ISO/IEC 18013-5-encoded mDLs is fully specified in
ISO/IEC 18013-5. No changes need to be made to this data model for an
mDL attestation within the EUDI Wallet.

## 2 Trust infrastructure details 

### 2.1 Introduction 

To trust a signature over an mDL attestation, the RP needs a mechanism
to validate that the public key it uses to verify that signature is
trusted. ISO/IEC 18013-5 provides such mechanisms. However, additional
details need to be specified to fully specify these mechanisms for mDL
attestations within the EUDI Wallet ecosystem.

#### 2.1.1 Trusted Issuer List 

Section 5.3.2.2. of \[ARF\] describes the concept of a trusted list of
Issuers. This document specifies that for mDL attestations, such a
trusted list SHALL be used. Relying Parties SHALL only trust mDL issuers
that are included in a trusted list of mDL issuers. Additionally, there
SHALL be only a single trusted list of mDL issuers, which SHALL be
generated and maintained by a yet-to-be-determined party. This list
SHALL also contain the (root) certificate(s) of each mDL issuer.
Regarding the format of this trusted list, the format specified in Annex
C of ISO/IEC 18013-5 SHALL be used.

## 3 References
|  |  |
|---|---|
| [ARF] | The Common Union Toolbox for a Coordinated Approach Towards a European Digital Identity Framework - The European Digital Identity Wallet Architecture and Reference Framework, January 2023, Version 1.0.0  |
| [ISO] | ISO/IEC 18013-5, Personal identification — ISO-compliant driving licence — Part 5: Mobile driving licence (mDL) application, First edition, 2021-09  |
| [2015/1505] | COMMISSION IMPLEMENTING DECISION (EU) 2015/1505  |
|  | of 8 September 2015  |
|  | laying down technical specifications and formats relating to trusted lists pursuant to Article 22(5) of Regulation (EU) No 910/2014 of the European Parliament and of the Council on electronic identification and trust services for electronic transactions in the internal market  |
| [SD-JWT] | Selective Disclosure for JWTs (SD-JWT)  |
|  | draft-ietf-oauth-selective-disclosure-jwt-04, 11 April 2023 [1]  |



[^1]: The exact version to be referenced is to be determined. \[ARF\]
    references v0.2. v0.4 is the latest version available at the time of
    writing of this document. The level of interoperability between
    these versions is not known. As \[SD-JWT\] is still under
    development, presumably later versions will become available over
    time.

[^2]: The exact version to be referenced is to be determined. \[ARF\]
    references v0.2. v0.4 is the latest version available at the time of
    writing of this document. The level of interoperability between
    these versions is not known. As \[SD-JWT\] is still under
    development, presumably later versions will become available over
    time.
