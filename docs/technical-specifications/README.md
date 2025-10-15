# Essential Standards and Technical Specifications (STS)

The EUDI Wallet is supported by a defined set of standards and technical specifications considered essential for its implementation.
These form the minimum foundation needed to ensure secure issuance, presentation, authentication, signing, and certification of digital identity credentials.
Each essential standard is referenced with a link to its corresponding GitHub ticket for transparency and traceability.

## Purpose

The European Digital Identity Wallet (EUDI Wallet) relies on a comprehensive set of standards and technical specifications (STS).
Out of nearly 200 STS tracked across the ecosystem, a core subset has been identified as **essential** for the Wallet itself.

These essentials form the backbone of the Wallet’s ability to securely issue, present, authenticate, sign, and certify digital identity credentials.
They are marked in the GitHub tracker with both the `essential` and `Wallet` labels.

## Scope

This document provides a non-technical overview of the essential standards underpinning the EUDI Wallet.
It is intended for decision-makers, implementers, and stakeholders who need to understand why these specific standards matter and how they support the Wallet’s functionality.

The essentials are organised by high-level categories that align with the main actors and concerns across the EUDI Wallet ecosystem. Each section groups the essential standards accordingly.

## Categories

### Wallet Providers

These requirements are the responsibility of the entities building and managing the EUDI Wallet solutions. They cover the core functionalities, security, user interface elements, and lifecycle management of the wallet.

| # | Title | Status | Articles | CIR | SDO |
|---:|---|---|---|---|---|
| 1 | [ISO/IEC 18013-5 - Mobile driving licence (mDL) application, First edition, 2021-09 #84](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84) | Jul, 2026 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj), [CIR (EU) 2024/2982](https://data.europa.eu/eli/reg_impl/2024/2982/oj) | ISO |
| 2 | [ETSI DTS 119 602 - Trusted lists; Data model #278](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/278) | Oct, 2025 | Art 22(5) |  | ETSI |
| 3 | [ETSI EN 319 142-1 - Electronic Signatures and Infrastructures (ESI); PAdES digital signatures; Part 1: Building blocks and PAdES baseline signatures , V1.2.1 (2024-01) #69](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/69) | ✅ Done | Art 5a(23) ICF | [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | ETSI |
| 4 | [ETSI TS 119 412-6 Electronic Signatures and Trust Infrastructures (ESI); Certificate Profiles; Part 6: Certificate profile requirements for PID, Wallet, EAA, QEAA, and PSBEAA providers #421](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/421) | Oct, 2025 |  |  | ETSI |
| 5 | [ETSI TS 119 432 V1.2.1 (2020-10) - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation #68](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/68) | Nov, 2025 | Art 5a(23) ICF |  | ETSI |
| 6 | [ETSI TS 119 472-3 - Profiles for EAA/PID Issuance #398](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/398) | Nov, 2025 | Art 5a(23), Art 5a(23) PID/EAA |  | ETSI |
| 7 | [ETSI TS 119 475 - Electronic Signatures and Trust Infrastructures (ESI); Relying party attributes supporting EUDI Wallet user's authorisation decisions #287](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/287) | Oct, 2025 | Art 5a, Art 5b |  | ETSI |
| 8 | [ETSI TS 119 612 V2.4.1 (2025-08) - Electronic Signatures and Infrastructures (ESI); Trusted Lists #41](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/41) | Nov, 2025 | Art 22(5), Art 5a(23) ICF |  | ETSI |
| 9 | [W3C VCDM Verifiable Credentials Data Model and Representations, version 2.0, Manu Sporny et al #115](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/115) | Nov, 2025 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | W3C |
| 10 | [OIDF OpenID for Verifiable Presentations 1.0 #2](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) | ✅ Done | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 11 | [OIDF OpenID4VC High Assurance Interoperability Profile 1.0 - Editor's draft #4](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/4) | Dec, 2025 | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 12 | [OpenID for Verifiable Credential Issuance 1.0 #3](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/3) | ✅ Done | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 13 | [IETF SD-JWT-based Verifiable Credentials (SD-JWT VC) #9](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/9) | Mar, 2026 | Art 5a(23) PID/EAA |  | IETF |
| 14 | [IETF Token Status List (TSL) draft-ietf-oauth-status-list-12 #11](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/11) | Dec, 2025 | Art 5a(23) ICF |  | IETF |
| 15 | [CSC - Architectures and protocols for remote signature applications version 2.1.0.1 #29](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/29) | Nov, 2025 | Art 5a(23) P&I |  | CSC |
| 16 | [EC TS01 v1.0 (2025-04) Specification of EUDI Wallet Trust Mark #18](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/18) | ✅ Done | Art 5a |  | EC |
| 17 | [EC TS03 V1.0 (2025-08) Specification of Wallet Unit Attestations (WUA) used in issuance of PID and Attestations #17](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/17) | ✅ Done | Art 5a(23) ICF |  | EC |
| 18 | [EC TS07 v1.0 (2025-07) - Specification of common interface for data deletion requests to Relying Parties #20](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/20) | ✅ Done | Art 5a(23) P&I |  | EC |
| 19 | [EC TS08 V.095 2025-07 Specification of common interface for lodging complaints to DPAs #19](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/19) | ✅ Done | Art 5a(23) ICF, Art 5a(23) P&I |  | EC |
| 20 | [EC TS09 V 1.0 (2025-07) - Specification of Wallet-to-Wallet interactions #22](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/22) | ✅ Done | Art 5a(23) P&I |  | EC |
| 21 | [EC TS10 v 1.0 (2025-08) - Data Portability and Download (export) #24](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/24) | ✅ Done | Art 5a(4)(f), Art 5a(4)(g) |  | EC |
| 22 | [ENISA EUCC Guidelines Cryptography v.2 (2025-05) #415](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/415) | ✅ Done |  | [CIR (EU) 2024/2981](https://data.europa.eu/eli/reg_impl/2024/2981/oj), CIR (EU) 2024/482 | ENISA |


### Member States & Registrars

These requirements are for the public bodies that establish the legal and trust infrastructure. They focus on establishing registries, notifying the Commission, and defining national policies.

| # | Title | Status | Articles | CIR | SDO |
|---:|---|---|---|---|---|
| 1 | [ETSI DTS 119 602 - Trusted lists; Data model #278](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/278) | Oct, 2025 | Art 22(5) |  | ETSI |
| 2 | [ETSI TS 119 612 V2.4.1 (2025-08) - Electronic Signatures and Infrastructures (ESI); Trusted Lists #41](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/41) | Nov, 2025 | Art 22(5), Art 5a(23) ICF |  | ETSI |
| 3 | [EC TS02 v0.9 (2025-04) Specification of systems enabling the notification and subsequent publication of Provider information #23](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/23) | Nov, 2025 | Art 5a(23) We |  | EC |
| 4 | [EC TS05 V1.0 (2025-06) Common Formats and API for Relying Party Registration Information #14](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/14) | ✅ Done | Art 5b.11 |  | EC |
| 5 | [EC TS06 v1.0 (2025-06) Common set of Relying Party information to be registered #16](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/16) | ✅ Done | Art 5b(2)(c) |  | EC |
| 6 | [ENISA EUCC Guidelines Cryptography v.2 (2025-05) #415](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/415) | ✅ Done |  | [CIR (EU) 2024/2981](https://data.europa.eu/eli/reg_impl/2024/2981/oj), CIR (EU) 2024/482 | ENISA |


### Attestation & PID Providers

These requirements are for the organizations that issue digital credentials to the wallet. This includes requirements for identity verification, issuance protocols, data formats, and revocation policies.

| # | Title | Status | Articles | CIR | SDO |
|---:|---|---|---|---|---|
| 1 | [ISO/IEC 18013-5 - Mobile driving licence (mDL) application, First edition, 2021-09 #84](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84) | Jul, 2026 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj), [CIR (EU) 2024/2982](https://data.europa.eu/eli/reg_impl/2024/2982/oj) | ISO |
| 2 | [ETSI DTS 119 602 - Trusted lists; Data model #278](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/278) | Oct, 2025 | Art 22(5) |  | ETSI |
| 3 | [ETSI TS 119 412-6 Electronic Signatures and Trust Infrastructures (ESI); Certificate Profiles; Part 6: Certificate profile requirements for PID, Wallet, EAA, QEAA, and PSBEAA providers #421](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/421) | Oct, 2025 |  |  | ETSI |
| 4 | [ETSI TS 119 461 V2.1.1 (2025-02) - Electronic Signatures and Trust Infrastructures (ESI); Policy and security requirements for trust service components providing identity proofing of trust service subjects #271](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/271) | Nov, 2025 | Art 19a(2), Art 24(5), Art 5a(24), Art 8(3), Art: 24(1c) | [CIR (EU) 2025/1566](http://data.europa.eu/eli/reg_impl/2025/1566/oj) | ETSI |
| 5 | [ETSI TS 119 472-1 - Electronic Signatures and Trust Infrastructures (ESI); Profiles for Electronic Attestations of Attributes; Part 1 - General requirements #284](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/284) | Dec, 2025 | Art 45d - f, Art 45e(2), Art 5a |  | ETSI |
| 6 | [ETSI TS 119 472-3 - Profiles for EAA/PID Issuance #398](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/398) | Nov, 2025 | Art 5a(23), Art 5a(23) PID/EAA |  | ETSI |
| 7 | [ETSI TS 119 612 V2.4.1 (2025-08) - Electronic Signatures and Infrastructures (ESI); Trusted Lists #41](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/41) | Nov, 2025 | Art 22(5), Art 5a(23) ICF |  | ETSI |
| 8 | [W3C VCDM Verifiable Credentials Data Model and Representations, version 2.0, Manu Sporny et al #115](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/115) | Nov, 2025 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | W3C |
| 9 | [OIDF OpenID4VC High Assurance Interoperability Profile 1.0 - Editor's draft #4](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/4) | Dec, 2025 | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 10 | [OpenID for Verifiable Credential Issuance 1.0 #3](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/3) | ✅ Done | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 11 | [IETF SD-JWT-based Verifiable Credentials (SD-JWT VC) #9](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/9) | Mar, 2026 | Art 5a(23) PID/EAA |  | IETF |
| 12 | [IETF Selective Disclosure for JWTs (SD-JWT) version 22 #28](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/28) | Sep, 2025 | Art 5a(23) PID/EAA |  | IETF |
| 13 | [IETF Token Status List (TSL) draft-ietf-oauth-status-list-12 #11](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/11) | Dec, 2025 | Art 5a(23) ICF |  | IETF |
| 14 | [EC TS03 V1.0 (2025-08) Specification of Wallet Unit Attestations (WUA) used in issuance of PID and Attestations #17](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/17) | ✅ Done | Art 5a(23) ICF |  | EC |
| 15 | [EC TS11 Specification of interfaces and formats for the catalogue of Attestation Rulebooks and attributes #21](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/21) | Oct, 2025 | Art 45e(2) |  | EC |
| 16 | [ENISA EUCC Guidelines Cryptography v.2 (2025-05) #415](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/415) | ✅ Done |  | [CIR (EU) 2024/2981](https://data.europa.eu/eli/reg_impl/2024/2981/oj), CIR (EU) 2024/482 | ENISA |


### Relying Parties

These requirements are for the services and entities that accept and use the EUDI Wallet. They cover how they must register, authenticate themselves to the wallet, request user attributes, and handle user data.

| # | Title | Status | Articles | CIR | SDO |
|---:|---|---|---|---|---|
| 1 | [ISO/IEC 18013-5 - Mobile driving licence (mDL) application, First edition, 2021-09 #84](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84) | Jul, 2026 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj), [CIR (EU) 2024/2982](https://data.europa.eu/eli/reg_impl/2024/2982/oj) | ISO |
| 2 | [ETSI DTS 119 602 - Trusted lists; Data model #278](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/278) | Oct, 2025 | Art 22(5) |  | ETSI |
| 3 | [ETSI EN 319 142-1 - Electronic Signatures and Infrastructures (ESI); PAdES digital signatures; Part 1: Building blocks and PAdES baseline signatures , V1.2.1 (2024-01) #69](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/69) | ✅ Done | Art 5a(23) ICF | [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | ETSI |
| 4 | [ETSI TS 119 411-8 V1.1.1 (2025-10) - Electronic Signatures and Trust Infrastructures (ESI); Policy and security requirements for Trust Service Providers issuing certificates; Part 8: Access Certificate Policy for EUDI Wallet Relying Parties #286](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/286) | Nov, 2025 | Art 5a(23) ICF, Art 5b.11 |  | ETSI |
| 5 | [ETSI TS 119 431-1 V1.3.1 (2024-12) - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev #66](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/66) | Nov, 2025 | Art 29a(2)/39(a), Art 5a(23) ICF | [CIR (EU) 2025/1567](http://data.europa.eu/eli/reg_impl/2025/1567/oj) | ETSI |
| 6 | [ETSI TS 119 432 V1.2.1 (2020-10) - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation #68](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/68) | Nov, 2025 | Art 5a(23) ICF |  | ETSI |
| 7 | [ETSI TS 119 472-2 Electronic Signatures and Trust Infrastructures (ESI); Profiles for Electronic Attestation of Attributes; Part 2: Profiles for EAA/PID Presentations to Relying Party #285](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/285) | Oct, 2025 | Art 5b.11 |  | ETSI |
| 8 | [ETSI TS 119 475 - Electronic Signatures and Trust Infrastructures (ESI); Relying party attributes supporting EUDI Wallet user's authorisation decisions #287](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/287) | Oct, 2025 | Art 5a, Art 5b |  | ETSI |
| 9 | [ETSI TS 119 612 V2.4.1 (2025-08) - Electronic Signatures and Infrastructures (ESI); Trusted Lists #41](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/41) | Nov, 2025 | Art 22(5), Art 5a(23) ICF |  | ETSI |
| 10 | [W3C VCDM Verifiable Credentials Data Model and Representations, version 2.0, Manu Sporny et al #115](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/115) | Nov, 2025 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | W3C |
| 11 | [OIDF OpenID for Verifiable Presentations 1.0 #2](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) | ✅ Done | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 12 | [OIDF OpenID4VC High Assurance Interoperability Profile 1.0 - Editor's draft #4](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/4) | Dec, 2025 | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 13 | [IETF SD-JWT-based Verifiable Credentials (SD-JWT VC) #9](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/9) | Mar, 2026 | Art 5a(23) PID/EAA |  | IETF |
| 14 | [IETF Token Status List (TSL) draft-ietf-oauth-status-list-12 #11](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/11) | Dec, 2025 | Art 5a(23) ICF |  | IETF |
| 15 | [CSC - Architectures and protocols for remote signature applications version 2.1.0.1 #29](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/29) | Nov, 2025 | Art 5a(23) P&I |  | CSC |
| 16 | [EC TS05 V1.0 (2025-06) Common Formats and API for Relying Party Registration Information #14](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/14) | ✅ Done | Art 5b.11 |  | EC |
| 17 | [EC TS06 v1.0 (2025-06) Common set of Relying Party information to be registered #16](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/16) | ✅ Done | Art 5b(2)(c) |  | EC |
| 18 | [ENISA EUCC Guidelines Cryptography v.2 (2025-05) #415](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/415) | ✅ Done |  | [CIR (EU) 2024/2981](https://data.europa.eu/eli/reg_impl/2024/2981/oj), CIR (EU) 2024/482 | ENISA |


### Protocols & Interoperability

These requirements define the common communication standards and protocols that ensure the entire system works together seamlessly across borders. This covers how different components talk to each other.

| # | Title | Status | Articles | CIR | SDO |
|---:|---|---|---|---|---|
| 1 | [ISO/IEC 18013-5 - Mobile driving licence (mDL) application, First edition, 2021-09 #84](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84) | Jul, 2026 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj), [CIR (EU) 2024/2982](https://data.europa.eu/eli/reg_impl/2024/2982/oj) | ISO |
| 2 | [ETSI EN 319 142-1 - Electronic Signatures and Infrastructures (ESI); PAdES digital signatures; Part 1: Building blocks and PAdES baseline signatures , V1.2.1 (2024-01) #69](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/69) | ✅ Done | Art 5a(23) ICF | [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | ETSI |
| 3 | [ETSI TS 119 412-6 Electronic Signatures and Trust Infrastructures (ESI); Certificate Profiles; Part 6: Certificate profile requirements for PID, Wallet, EAA, QEAA, and PSBEAA providers #421](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/421) | Oct, 2025 |  |  | ETSI |
| 4 | [ETSI TS 119 431-1 V1.3.1 (2024-12) - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev #66](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/66) | Nov, 2025 | Art 29a(2)/39(a), Art 5a(23) ICF | [CIR (EU) 2025/1567](http://data.europa.eu/eli/reg_impl/2025/1567/oj) | ETSI |
| 5 | [ETSI TS 119 432 V1.2.1 (2020-10) - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation #68](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/68) | Nov, 2025 | Art 5a(23) ICF |  | ETSI |
| 6 | [ETSI TS 119 461 V2.1.1 (2025-02) - Electronic Signatures and Trust Infrastructures (ESI); Policy and security requirements for trust service components providing identity proofing of trust service subjects #271](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/271) | Nov, 2025 | Art 19a(2), Art 24(5), Art 5a(24), Art 8(3), Art: 24(1c) | [CIR (EU) 2025/1566](http://data.europa.eu/eli/reg_impl/2025/1566/oj) | ETSI |
| 7 | [ETSI TS 119 472-2 Electronic Signatures and Trust Infrastructures (ESI); Profiles for Electronic Attestation of Attributes; Part 2: Profiles for EAA/PID Presentations to Relying Party #285](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/285) | Oct, 2025 | Art 5b.11 |  | ETSI |
| 8 | [ETSI TS 119 472-3 - Profiles for EAA/PID Issuance #398](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/398) | Nov, 2025 | Art 5a(23), Art 5a(23) PID/EAA |  | ETSI |
| 9 | [ETSI TS 119 612 V2.4.1 (2025-08) - Electronic Signatures and Infrastructures (ESI); Trusted Lists #41](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/41) | Nov, 2025 | Art 22(5), Art 5a(23) ICF |  | ETSI |
| 10 | [W3C VCDM Verifiable Credentials Data Model and Representations, version 2.0, Manu Sporny et al #115](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/115) | Nov, 2025 | Art 5a(23) ICF, Art 5a(23) P&I, Art 5a(23) PID/EAA | [CIR (EU) 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj), [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | W3C |
| 11 | [W3C Web Authentication: An API for accessing Public Key Credentials, Level 2, Jeff Hodges et al, April 2021 (W3C Recommendation) #314](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/314) | ✅ Done | Art 5a(23) ICF | [CIR (EU) 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj) | W3C |
| 12 | [OIDF OpenID for Verifiable Presentations 1.0 #2](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) | ✅ Done | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 13 | [OIDF OpenID4VC High Assurance Interoperability Profile 1.0 - Editor's draft #4](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/4) | Dec, 2025 | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 14 | [OpenID for Verifiable Credential Issuance 1.0 #3](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/3) | ✅ Done | Art 5a(23) ICF, Art 5a(23) P&I |  | OIDF |
| 15 | [IETF SD-JWT-based Verifiable Credentials (SD-JWT VC) #9](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/9) | Mar, 2026 | Art 5a(23) PID/EAA |  | IETF |
| 16 | [IETF Selective Disclosure for JWTs (SD-JWT) version 22 #28](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/28) | Sep, 2025 | Art 5a(23) PID/EAA |  | IETF |
| 17 | [IETF Token Status List (TSL) draft-ietf-oauth-status-list-12 #11](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/11) | Dec, 2025 | Art 5a(23) ICF |  | IETF |
| 18 | [CSC - Architectures and protocols for remote signature applications version 2.1.0.1 #29](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/29) | Nov, 2025 | Art 5a(23) P&I |  | CSC |
| 19 | [CSC API Data Model for remote signature applications, V 0.5.0 pre-release #403](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/403) | Nov, 2025 | Art 5a(23) P&I |  | CSC |
| 20 | [EC TS03 V1.0 (2025-08) Specification of Wallet Unit Attestations (WUA) used in issuance of PID and Attestations #17](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/17) | ✅ Done | Art 5a(23) ICF |  | EC |
| 21 | [EC TS09 V 1.0 (2025-07) - Specification of Wallet-to-Wallet interactions #22](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/22) | ✅ Done | Art 5a(23) P&I |  | EC |


### Data Models & Attestation Rules

These requirements define the structure and meaning of the data being exchanged. This includes HLRs for PIDs, Attestation Rulebooks, and Catalogues, ensuring that the information exchanged is consistent and understandable across the entire ecosystem.

| # | Title | Status | Articles | CIR | SDO |
|---:|---|---|---|---|---|
| 1 | [ETSI TS 119 472-1 - Electronic Signatures and Trust Infrastructures (ESI); Profiles for Electronic Attestations of Attributes; Part 1 - General requirements #284](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/284) | Dec, 2025 | Art 45d - f, Art 45e(2), Art 5a |  | ETSI |
| 2 | [EC TS11 Specification of interfaces and formats for the catalogue of Attestation Rulebooks and attributes #21](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/21) | Oct, 2025 | Art 45e(2) |  | EC |

## Technical Specifications

While the EUDI Wallet relies primarily on recognised standards and technical specifications (STS), certain implementation details require additional, fast-track guidance.

To bridge these gaps, the **European Commission**, in collaboration with the **European Digital Identity Cooperation Group** and the **European Standards Organisations (ESO)**, develops **complementary technical specifications**.

These EC-authored specifications:

* address short-term implementation needs not yet covered by existing standards,
* provide concrete guidance on interfaces, data formats, and trust mechanisms, and
* serve as input for future standardisation under ESO responsibility.

All technical specifications are published openly on GitHub, following a transparent and collaborative drafting process that allows stakeholders to comment and contribute.

**Explore the technical specifications repository:**
- [Technical Specifications to support EUDI Wallet implementation](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/README.md)

