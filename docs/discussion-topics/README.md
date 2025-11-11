# Discussion topics

## Introduction

The Architecture and Reference Framework (ARF) is currently in development. To
finalise it, the Commission, in collaboration with the European Digital Identity
Cooperation Group (EDICG), has identified 24 open items,referred to as
topics, that must be addressed and discussed by the end of 2025. The ARF roadmap
project outlines these topics and provides a structured timeline for their
resolution.

## Objective

The Architecture and Reference Framework (ARF) defines high-level requirements
for the European Digital Identity (EUDI) Wallet, serving as the foundation for
developing the technical specifications, standards, and procedures referenced by
the European Commission in the implementing acts of the European Digital Identity
Regulation. These elements ensure a consistent and standardised implementation
of the EUDI Wallet ecosystem.

## Drafting Process

The **Architecture and Reference Framework (ARF)** is developed in close
collaboration with Member States, experts from the European Digital Identity
Cooperation Group, and with feedback from industry and the wider community via
GitHub.  

Each [discussion topic](https://github.com/orgs/eu-digital-identity-wallet/projects/36)
is documented in a **Discussion Paper**, refined until consensus is reached, and
then integrated into the next ARF release. An overview of all papers and the ARF
versions they contributed to is available in the [README file](README.md).

Once integrated, a Discussion Paper is **no longer updated**. Its content may
become outdated due to:  

- editorial adjustments at the time of integration,  
- interdependence with later discussion topics, or  
- continuous feedback received through Confluence, GitHub, and internal reviews.

Historic Discussion Papers are **not normative**. The authoritative requirements
are always those in the latest version of **Annex 2 of the ARF**.  

The process of defining high-level requirements consists of five steps:

1. A discussion paper on the topic is published on
[GitHub](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/tree/main/docs/discussion-topics)
and [on this page](#topics).
2. The discussion paper includes several questions, each with a dedicated
response thread in the [GitHub discussion area](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/categories/arf-discussion-topics).
3. The discussion remains open for three weeks, and while responses to all the
comments may not be provided, all input will be carefully considered.
4. Approximately seven weeks after the discussion paper is published, the
Commission will release an updated ARF version on [GitHub](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/releases),
incorporating revisions to the topic.
5. The published ARF version remains open for further comments on GitHub.

The topics are subject to change, and the order of the topics may be adjusted
based on the feedback received during the discussions. The progress of the
discussions can be tracked on the [ARF Roadmap](https://github.com/orgs/eu-digital-identity-wallet/projects/36).

## Topics

Topics are organised into three iterations, each focusing on a specific set of
subjects to be included in a major document release. Below is the list of topics
with links to their corresponding discussion papers. The requirements from each
discussion paper will be consolidated and integrated into the major release at
the end of each iteration, ensuring a structured and iterative development
process for the ARF.

### Iteration 1

Iteration took place from 27 November 2024 to 25 April 2025 covering the
following topics:

| Topic | Title | Link | Integrated into ARF version |
|-------|-------|--|---|
| A | [Privacy risks and mitigation](a-privacy-risks-and-mitigations.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/327)| [1.6.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.6.0/architecture-and-reference-framework-main/) |
| B | [Re-issuance and batch issuance of PIDs and Attestations](b-re-issuance-and-batch-issuance-of-pids-and-attestations.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/332)| [1.6.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.6.0/architecture-and-reference-framework-main/) |
| C | [Wallet Unit Attestation (WUA) and Key Attestation](c-wallet-unit-attestation.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/333) | [1.8.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.8.0/architecture-and-reference-framework-main/) |
| D | [Embedded Disclosure Policies](d-embedded-disclosure-policies.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/334) | [1.8.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.8.0/architecture-and-reference-framework-main/) |
| E | [Pseudonyms, including User authentication mechanism](e-pseudonyms-including-user-authentication-mechanism.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/335) | [1.7.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.7.0/architecture-and-reference-framework-main/) |
| F | [Digital Credentials API](f-digital-credential-api.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/336) | [1.7.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.7.0/architecture-and-reference-framework-main/) |
| G | [Zero Knowledge Proof](g-zero-knowledge-proof.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/337) | [1.8.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.8.0/architecture-and-reference-framework-main/) |
| V | [PID Rulebook](v-pid-rulebook.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/356) | [1.8.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.8.0/architecture-and-reference-framework-main/) |
| X | [Relying Party registration](x-relying-party-registration.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/378) | [1.10.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/1.10.0/architecture-and-reference-framework-main/) |

### Iteration 2

Iteration took place from 26 March 2025 to 02 July 2025 covering the following topics:

| Topic | Title | Link | Integrated into ARF version |
|-------|-------|--|---|
| H | [Transaction logs kept by the wallet](h-transaction-logs-kept-by-the-wallet.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/338) | [2.4.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.4.0/) |
| I | [Natural person representing another natural person](i-natural-person-representing-another-natural-person.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/339) | [2.2.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.2.0/architecture-and-reference-framework-main/) |
| J | [Wallet to Wallet interaction](j-wallet-to-wallet-interactions.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/340) | [2.2.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.2.0/architecture-and-reference-framework-main/) |
| K | [Combined presentation of Attestations](k-combined-presentation-of-attestations.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/341) | [2.3.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.3.0/) |
| L | [User requesting data deletion to Relying Parties](l+m-data-deletion-and-reporting-of-wrp-to-dpa.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/342) | [2.2.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.2.0/architecture-and-reference-framework-main/) |
| M | [User reporting unlawful or suspicious request of data to DPAs](l+m-data-deletion-and-reporting-of-wrp-to-dpa.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/343) | [2.2.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.2.0/architecture-and-reference-framework-main/) |
| N | [Data portability](n-export-and-data-portability.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/344) | [2.2.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.2.0/architecture-and-reference-framework-main/) |
| U | [EUDI Wallet Trust Mark](u-eudi-wallet-trust-mark.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/351) | [2.4.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.4.0/) |
| W | [Transactional data for payments and other use cases](w-transactional-data-for-payments-and-other-use-cases.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/371) | [2.2.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.2.0/architecture-and-reference-framework-main/) |

### Iteration 3

Iteration is planned from 20 August 2025 to 26 November 2025 covering the
following topics:

| Topic | Title | Link | Integrated into ARF version |
|-------|-------|--|---|
| O | [Catalogues for Attestations](o-catalogues-for-attestations.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/345) | [2.6.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.6.0/) |
| P | [Secure Cryptographic Interface between the Wallet Instance and the WSCA](p-secure-cryptographic-interface-between-the-Wallet-Instance-and-WSCA.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/346) | [2.7.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.7.0/) |
| Q | [Interface between the User and the Wallet Instance](q-interface-user-wallet-instance.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/347) | [2.7.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.7.0/) |
| R | [Authentication of the User to the device](r-authentication-of-user-to-device.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/348) | [2.7.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.7.0/) |
| S | [Certificate transparency](s-certificate-transparancy.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/349) | [2.7.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.7.0/) |
| T | [Support and maintenance by the Wallet Provider](#topics) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/350) | Not yet integrated |
| Z | [Device-bound Attestations](z-device-bound-attestations.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/567) | [2.6.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.6.0/) |
| AA | [Support of Electronic Payments Customer Authentication (SCA) with the Wallet](aa-support-of-electronic-payments-SCA-with-wallet.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/568) | Not yet integrated |

#### Earlier topics, planned to be additionally discussed in iteration 3:

| Topic | Title | Link |Integrated into ARF version |
|-------|-------|--|--|
| E | [Pseudonyms, including User authentication mechanism](e-pseudonyms-including-user-authentication-mechanism.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/335) | Not yet integrated |
| F | [Digital Credentials API](f-digital-credential-api.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/336) | [2.7.0](https://eu-digital-identity-wallet.github.io/eudi-doc-architecture-and-reference-framework/2.7.0/) |
| G | [Zero Knowledge Proof](g-zero-knowledge-proof.md) | [Roadmap issue](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/337) | - |
