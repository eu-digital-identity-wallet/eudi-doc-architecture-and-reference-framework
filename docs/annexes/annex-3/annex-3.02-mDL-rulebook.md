# ANNEX 3.2 - mDL Rulebook 



*This is a working document that holds no legal value* *and does not
reflect any common agreement or position of the co-legislators. It
presents a state-of-play of ongoing work of the eIDAS Expert Group. This
document is being continuously updated and should not be considered
final.*

## 1 Introduction

This document is the mobile driving license (mDL) Rulebook. It contains
requirements specific to the mDL use case within the EUDI Wallet. 

This mDL Rulebook contains the following topics:

-   [Chapter 2](#2-mdl-attribute-schema) specifies the mDL attribute schema. This describes the
    structure, the type, the entity identifiers, and the logical
    organization of the mandatory and optional attributes of the mDL. It
    also describes how Member States can specify any possible national
    attributes.

-   [Chapter 3](#3-trust-infrastructure-details) specifies details about the trust infrastructure necessary
    for mDL attestations. This information may be moved to another
    document in the future.

Further topics will be added if and when they are identified.

## 2 mDL attribute schema

## 2.1 Introduction

This document describes the structure, type, data element identifiers,
and logical organization of the mandatory and optional attributes of the
mobile driving license (mDL) attestation within the EUDI Wallet. It also
describes how Member States can specify any possible national
attributes.

Mobile driving licenses are legally specified in the [proposed
EC Regulation 2023_127](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A52023PC0127) ( 4<sup>th</sup> Driving License Regulation). This
Regulation specifies that mDLs shall comply with the ISO/IEC 18013-5
standard. It does not mention any other standards, in particular not
\[SD JWT\]. Consequently, mDLs issued to a EUDI Wallet instance SHALL
NOT be implemented as \[SD JWT\]-compliant document. This document
therefore specifies only an ISO/IEC 18013-5 compliant encoding.

### 2.2 ISO/IEC 18013-5 compliant encoding

A data model for ISO/IEC 18013-5-encoded mDLs is fully specified in
ISO/IEC 18013-5. No changes need to be made to this data model for an
mDL attestation within the EUDI Wallet.

## 3 Trust infrastructure details

### 3.1 Introduction

To trust a signature or seal over an mDL attestation, the Relying Party needs a mechanism
to validate that the public key it uses to verify that signature or seal is
trusted. ISO/IEC 18013-5 provides such mechanisms. However, additional
details need to be specified to fully specify these mechanisms for mDL
attestations within the EUDI Wallet ecosystem.

### 3.2 Trusted Issuer List 

For authenticating mDL attestations, trust anchors will be used that are present in an mDL Attestation Provider Trusted List which complies with [[Topic 31](../annex-2/annex-2-high-level-requirements.md#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)].


## 4 References

See [Chapter 9](../../arf.md#9-references) of the main ARF 1.4.0 document.


