## 1 Introduction

### 1.1 EUDI Wallet ecosystem

The European Digital Identity (EUDI) Wallet is a secure, user-controlled digital
application that empowers citizens to manage their official identity and other
personal data. It allows Users to request verified digital information (known as
"attestations") from trusted issuers (known as PID Providers and Attestation
Providers), store that information, and present it to trusted parties (called
Relying Parties) in a way that prioritizes privacy and security.

This Architecture and Reference Framework defines the following aspects of the
EUDI Wallet ecosystem:

- [Chapter 2][2-eudi-wallet-functionalities] describes the main
functionalities of a Wallet Unit, from the perspective of the User.
- [Chapter 3][3-roles-within-the-eudi-wallet-ecosystem] describes the main roles and components
within the EUDI Wallet ecosystem, with their associated responsibilities.
- [Chapter 4][4-high-level-architecture] describes the architecture of EUDI
Wallet ecosystem, including its design principles, the components that make up a
Wallet Unit and the interfaces between a Wallet Unit and other entities, the
proximity and remote attestation presentation flows, the different architectures
that may be used for implementing a WSCD, the lifecycles of the main entities
and components, and the implementation of pseudonym generation and presentation.
- [Chapter 5][5-data-model-and-data-exchange-protocols] describes the elements
that make up an attestation, the different (legal) attestation categories that
will be used in the EUDI Wallet ecosystem, the different attestation formats,
the role of attestation rulebooks and associated catalogues, and the different
attestation presentation protocols.
- [Chapter 6][6-trust-model] contains the trust model for the EUDI Wallet
ecosystem. For each of the main entities and components in the ecosystem, this
chapter describes the mechanisms used to ensure it can be trusted by the
entities it interfaces with, throughout its lifetime. These mechanisms may
include registration, revocation, authentication, and authorisation.
- [Chapter 7][7-wallet-solution-certification-and-risk-management] discusses
Wallet Solution certification and risk management.
- [Chapter 8][8-accessibility] discusses the accessibility of all User-facing
components of the EUDI Wallet ecosystem.
- [Chapter 9][9-document-development] describes how this document is and will
be developed.
- [Chapter 10][10-references] contains a list of references.
- [Chapter 11][11-annexes] lists the Annexes to this document.

### 1.2 Legal context

The European Digital Identity Framework is established by Regulation (EU) No 910/2014, as amended by Regulation (EU) 2024/1183 (the [European Digital Identity Regulation]). This ARF is developed as part of the Common Union Toolbox to support the implementation of that Regulation, as described below.

On 3 June 2021, the European Commission adopted [COMMISSION
RECOMMENDATION (EU) 2021/946 of 3 June 2021 on a
Common Union Toolbox](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-toolbox)
for a coordinated approach towards a [European Digital Identity Framework](https://eur-lex.europa.eu/eli/reco/2021/946),
calling on Member States to work closely together with the Commission towards
the development of a Toolbox including a technical Architecture and Reference
Framework (hereinafter the ARF), a set of common standards and technical
specifications and a set of common guidelines and best practices.

The Recommendation specifies that these outcomes will serve as a basis for the
implementation of the [European Digital Identity Regulation],
without the process of developing the Toolbox interfering with, or prejudging
the legislative process.

The Recommendation establishes a structured framework for cooperation between
Member States, the Commission, and, where relevant, private sector operators to
develop the Toolbox. The European Digital Identity Cooperation Group (EDICG),
formerly known as the eIDAS Expert Group, is responsible for:

- exchanging best practices and cooperating with the Commission on emerging
policy initiatives in the field of digital identity wallets, electronic
identification means and trust services;
- advising the Commission in the preparation of draft implementing and delegated
acts;
- supporting Supervisory Bodies in the implementation of the [European Digital
Identity Regulation];
- organising peer reviews of electronic identification schemes;
- engaging with the Commission and other relevant stakeholders to develop a
[Common Union Toolbox](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-toolbox);

The European Digital Identity Cooperation Group's page can be found
[at the official page](https://digital-strategy.ec.europa.eu/en/policies/european-digital-identity-cooperation-group).

The European Digital Identity Cooperation Group has since further developed the
concepts and specifications for the European Digital Identity Framework. The
current ARF version is based on the legal text adopted by the
co-legislators, including the Commission Implementing Regulations adopted under
it. The complete list of these implementing acts, with their official titles and
links, is provided in [Section 10.1][101-commission-regulations-and-decisions].

To harmonise the conformity assessment of the functional requirements that Wallet
Solutions must support under [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981),
the European Commission and the Member States are establishing the Functional
Conformance Assessment Framework (FCAF), which complements the cybersecurity
certification of Wallet Solutions. The FCAF is described in
[Section 7.5][75-functional-conformance-fcaf].

### 1.3 Purpose, scope and audience

This **EUDI Wallet Architecture and Reference Framework (ARF)** defines the
architecture, components, and interactions of the EUDI Wallet ecosystem. It
provides the technical foundation for ensuring ecosystem-wide
**interoperability, security, and privacy**.

Specifically, this document serves three primary purposes:

- **Explains the architecture:** It details the system components and their
interactions, serving as background information for the High-Level Requirements
(HLRs) found in Annex 2.
- **Guides implementation:** It acts as a common reference for the harmonised
implementation of the [European Digital Identity Regulation], guiding the
development of technical specifications, standards, and operational procedures.
- **Supports development of reference implementation:** It is used to develop
the Wallet Solution [reference implementation](https://github.com/eu-digital-identity-wallet/.github/blob/main/profile/reference-implementation.md)
and will serve as a foundation for future updates to Implementing Acts based on
technological advancements.

This ARF is **informative** and intended to support implementation; it **does
not replace** the legally binding [European Digital Identity Regulation] or its
adopted implementing and delegated acts, which are the only mandatory
requirements.

This document applies exclusively to EUDI Wallet ecosystems compliant with the
Regulation. It represents the current state-of-play of the European Digital
Identity Cooperation Group and will be updated over time.

The audience of the ARF consists of:

- Entities acting as PID Providers, QEAA Providers, PuB-EAA Providers,
or EAA Providers,
- Wallet Providers,
- Relying Parties,
- Conformity Assessment Bodies (CABs), and
- Supervisory Bodies.

### 1.4 Relation to the Large-Scale Pilots (LSP)

To support the development of a reference implementation of a Wallet Solution
and to pilot its usage across different priority use cases, the Commission
launched a call for proposals on 22 February 2022 under the Digital Europe
Programme to pilot use cases for the EUDI Wallet ecosystem at a large scale.

The objective of the Large-Scale Pilots (LSP) call is to support the piloting of
the EUDI Wallet ecosystem around a range of use cases involving both public and
private sector stakeholders. The LSPs will test the EUDI Wallet ecosystem in
both national and cross-borders contexts and integrate with the iterative
development of the reference application.

The works of the LSPs will be aligned with the ARF, which will guide pilot
system design and architecture development together with the release of the
reference implementation.

The LSPs are expected to provide feedback on the ARF as they develop and
interact with Relying Party services, Qualified or non-qualified Electronic
Attestations of Attributes (Q)EAA Providers, Person Identification Data (PID)
Providers, Qualified and non-qualified Trust Service Providers and Users in
meaningful interactions under the proposed use cases.

### 1.5 Definitions

The definitions used in this document can be found in
[Annex 1](../annexes/annex-1/annex-1-definitions.md) of this document.

### 1.6 Change Log

In this version of the ARF, the following changes were made:

- Changes due to the CIRs amending [CIR 2025/848],
- Changes due to the CIRs amending [CIR 2024/2977], [CIR 2024/2979], [CIR 2024/2980], and [CIR 2024/2982],
- Changes due to the [revision round discussion paper for Topic J](../discussion-topics/j-rr-wallet-to-wallet-interactions.md)
(Wallet-to-wallet interactions).
- Changes due to the [revision round discussion paper for Topic X](../discussion-topics/x-rr-relying-party-registration.md)
(Relying Party registration), which introduced the concept of Relying Party Services, especially in [Section 3.11.2][3112-relying-party-services] and in [Topic 44][topic-44].
- Several issues raised via Confluence and GitHub have been resolved.

Apart from these changes, a number of editorial mistakes were corrected.

### 1.7 Further refinement of the ARF

The **Architecture and Reference Framework (ARF)** will be further refined and
maintained according to the ARF work plan, which addresses the work to:

- Refine and stabilize high-level requirements (HLRs) for core EUDI Wallet
functionalities.
- Maintain alignment with relevant standards and technical specifications.
- Maintain alignment with certification requirements.

The work will be progressed through discussions with Member States, the European
Digital Identity Cooperation Group, civil society, industry representatives, and
professionals, ensuring broad and comprehensive feedback from all relevant
stakeholders.

The outcomes of these discussions will be incorporated into future versions of
the ARF. The document will continue to evolve iteratively, improving its content
and addressing new topics as they emerge. The process for providing feedback and
details on how updates are managed is described in [Chapter 9][9-document-development].

The topics to further refine and stabilise the ARF are available on
[GitHub](https://github.com/orgs/eu-digital-identity-wallet/projects/36),
including progress updates.

Please note the ARF and its supporting materials remain open to continuous
feedback via the internal and public channels, and stakeholders can propose new
or revised topics at any time. Updates to the ARF are implemented through the
ARF work plan: topics are prioritized, scheduled, and progressed via the agreed
process, and the work plan is updated accordingly as implementation needs evolve.

### 1.8 Drafting Process and Discussion Papers

The development of the **Architecture and Reference Framework (ARF)** is guided
by discussions with Member States and experts from the European Digital Identity
Cooperation Group, as well as by feedback from industry and the wider community
through GitHub.

For each [discussion topic](https://github.com/orgs/eu-digital-identity-wallet/projects/36),
a **Discussion Paper** is created and iteratively refined until consensus is
reached. Once finalised, the paper is integrated into the next release of the
ARF. An overview of all Discussion Papers and the ARF versions into which they
were integrated can be found in the [corresponding README file](../discussion-topics/README.md).

Once a Discussion Paper has been integrated into the ARF, it is **no longer
updated**. Over time, its content may therefore become outdated, for example,
when high-level requirements are modified in later ARF versions. This can happen
for several reasons:

- **Adjustments at integration**  
  Requirements or descriptions may already be slightly modified when a
  Discussion Paper is integrated into the ARF, to ensure consistency of language
  and style
  across the ARF. Sometimes further refinements are made in collaboration
  between the ARF editors and the authors of the paper, for example to solve
  contradictions between high-level requirements proposed in the discussion
  paper and existing requirements in other parts of the ARF.
- **Interdependence of topics**  
  Discussion topics are not entirely separate. The introduction of new
  Discussion Papers may lead to adjustments of existing requirements or
  descriptions in the ARF.
- **Continuous feedback**  
  The Commission receives feedback via Confluence, GitHub, and internal reviews.
  When accepted, these comments lead to further changes in the ARF.

Although the ARF may reference Discussion Papers as background information,
**historic Discussion Papers (including their proposed high-level requirements)
should not be used**. The final requirements are those in the latest
version of the Annex 2 of the ARF. In addition, as said in [Section 1.3][13-purpose-scope-and-audience], the ARF itself is informative and not legally binding.

