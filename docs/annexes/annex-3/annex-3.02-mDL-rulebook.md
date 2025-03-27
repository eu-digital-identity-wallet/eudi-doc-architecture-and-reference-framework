---
title: "European Digital Identity Wallet"
subtitle: "ARF Annex 3.02 - mDL Rulebook"
...

# ANNEX 3.02 - mDL Rulebook

*This is a working document that holds no legal value and does not
reflect any common agreement or position of the co-legislators. It
presents a state-of-play of ongoing work of the European Digital Identity Cooperation Group. This
document is being continuously updated and should not be considered
final.*

## 1 Introduction

This document is the mobile driving licence (mDL) Rulebook. It is part of the Architecture and Reference Framework for the EUDI Wallet ecosystem. It contains requirements specific to mDL attestations with the EUDI Wallet ecosystem.

This mDL Rulebook contains the following topics:

- [Chapter 2](#2-mdl-attribute-schema) specifies the mDL attribute schema. This
describes the structure, the type, the entity identifiers, and the logical
organisation of the mandatory and optional attributes of the mDL. It also
describes how Member States can specify any possible national attributes.

Further topics will be added if and when they are identified.

## 2 mDL attribute schema

## 2.1 Introduction

This document describes the structure, type, data element identifiers,
and logical organisation of the mandatory and optional attributes of the
mobile driving licence (mDL) attestation within the EUDI Wallet. It also
describes how Member States can specify any possible national
attributes.

Mobile driving licences are legally specified in the [proposed EC Regulation 2023_127](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A52023PC0127)
(4th Driving Licence Regulation). This Regulation specifies that mDLs shall
comply with the ISO/IEC 18013-5 standard. It does not mention any other
standards, in particular not [SD-JWT VC]. Consequently, mDLs issued to a Wallet
Unit SHALL NOT be implemented as [SD-JWT VC]-compliant attestations. This
document therefore specifies only an ISO/IEC 18013-5-compliant encoding.

### 2.2 ISO/IEC 18013-5 compliant encoding

The data model for ISO/IEC 18013-5-encoded mDLs is fully specified in
ISO/IEC 18013-5. No changes need to be made to this data model for an
mDL attestation within the EUDI Wallet ecosystem.

## 4 References

See [Chapter 9](../../architecture-and-reference-framework-main.md#9-references)
of the main ARF document.
