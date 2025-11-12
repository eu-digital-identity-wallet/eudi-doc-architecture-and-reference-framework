---
title: "European Digital Identity Wallet"
subtitle: "Architecture and Reference Framework"
...

# ANNEX 2.01 - High-Level Requirements <!-- omit from toc -->

Since ARF 2.7.0, all high-level requirements in Annex 2
are included in the [high-level-requirements.csv file](https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/refs/heads/main/hltr/high-level-requirements.csv), which allows for easy sorting and filtering of
requirements. Insofar relevant, the texts in the introduction to each Topic in the original
Annex 2 were moved to suitable sections in the ARF main document.

For the convenience of readers, the high-level requirements in the .csv file are also included in two new .md files, called [annex-2.02-high-level-requirements-by-topic.md](./annex-2.02-high-level-requirements-by-topic.md) and [annex-2.03-high-level-requirements-by-category.md](./annex-2.03-high-level-requirements-by-category.md), which were generated from the .csv file. Note that in case of deviations between the .csv file and the .md files, the .csv file takes precedence.

The requirements in these files are identical, but they are ordered in a different manner.  The file [annex-2.02-high-level-requirements-by-topic.md](./annex-2.02-high-level-requirements-by-topic.md) contains the high-level requirements in the same order as the original (i.e., pre-v2.7.0) Annex 2 file, meaning ordered per discussion topic. It also contains the same Topic numbers and section indicators. However, Topics in the original file that did not contain any high-level requirements have been removed from the .csv file and hence from the resulting .md file.

The file [annex-2.03-high-level-requirements-by-category.md](./annex-2.03-high-level-requirements-by-category.md) orders the high-level requirements on the basis of their subject, meaning the entity that has to comply with each requirement. To enable this, a new system of requirement identifiers was developed, next to the existing identifiers which are based on topic. These new requirement identifiers have a simple, hierarchical format: PART-CATEGORY-SUBCATEGORY-ID, where
  
- PART is either actor-specific requirements (AS) or ecosystem-wide requirements (EW).
- CATEGORY is a two or three-letter code based on the six main categories established below. This provides immediate context.
- TOPIC is the number of of the topic in which this requirement was originally included.
- ID is a three-digit sequential number (e.g., 001, 002) to ensure uniqueness.

Categories under Part 1: Actor-Specific Requirements:

- **Wallet Providers (WP)**: This category includes all HLRs that are the direct responsibility of the entities developing and maintaining the EUDI Wallet solutions. It covers core functionalities, security, user interface elements, and lifecycle management of the wallet.
- **Member States & Registrars (MS)**: This category includes all requirements for Member States, including their designated Registrars and authorities. It focuses on establishing the legal and trust infrastructure, such as setting up registries, notifying the Commission, and defining national policies.
- **Attestation Providers & PID Providers (AP)**: In this categories, all HLRs for the organizations that issue digital credentials are placed. This includes requirements for identity verification, issuance protocols, data formats, and revocation procedures.
- **Relying Parties (RP)**: This category consolidates all requirements for the services that accept EUDI Wallet Units. It covers how they must register, authenticate themselves to the wallet, request user attributes, and handle User attributes.

Categories under Part 2: Ecosystem-Wide Requirements:

- **Protocols & Interoperability (PIO)**: This category includes the HLRs that define the common communication standards and protocols. It ensures that a Wallet Unit from one Wallet Provider can interact seamlessly with a Relying Party service in another, covering how different components talk to each other.
- **Data Models & Attestation Rules (DM)**: Finally, this category defines the structure and rules for the data (attestations) itself. It includes HLRs for PIDs, Attestation Rulebooks, and Catalogues, ensuring that the information exchanged is consistent and understandable across the entire ecosystem.
