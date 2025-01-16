
# European Digital Identity Wallet Architecture and Reference Framework

## 1 Introduction

### 1.1 Context

On 3 June 2021, the European Commission adopted a Recommendation ([COMMISSION RECOMMENDATION (EU) 2021/946 of 3 June 2021 on a common Union Toolbox for a coordinated approach towards a European Digital Identity Framework](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2021.210.01.0051.01.ENG), [OJ L 210/51, 14.6.2021](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ%3AL%3A2021%3A210%3AFULL)) calling on Member States to work towards the development of a Toolbox including a technical Architecture and Reference Framework (hereinafter the ARF), a set of common standards and technical specifications and a set of common guidelines and best practices.

The Recommendation specifies that these outcomes will serve as a basis for the implementation of the proposal for a European Digital Identity Framework, without the process of developing the Toolbox interfering with, or prejudging the legislative process.

The Recommendation sets up a structured process of cooperation between Member States, the Commission and, where relevant, private sector operators, to develop the Toolbox. The eIDAS Expert Group is tasked as main interlocutor for the purposes of implementing this Recommendation. The Expert Group's page can be found [at the official page](https://ec.europa.eu/transparency/expert-groups-register/screen/expert%20groups/consult?do=groupDetail.groupDetail&groupID=3032).

The eIDAS Expert Group has since further developed the concepts and specifications for the European Digital Identity Framework. The current ARF version 1.5.0 is based on the legal text adopted by the co-legislators, including the adopted Commission Implementing Regulations: 
- [CIR 2024/2977] regarding PID and EAA, 
- [CIR 2024/2979] regarding integrity and core functionalities,
- [CIR 2024/2980] regarding ecosystem notifications,
- [CIR 2024/2981] regarding certification of Wallet Solutions,
- [CIR 2024/2982] regarding protocols and interfaces.

### 1.2 Purpose of this document

The purpose of this version of the document is to establish high level requirements as reference to create uniform conditions for the implementation of the legislative act and to define the technical specifications, standards and procedures that the Commission will develop for the purpose of implementing the [eIDAS Regulation](https://eur-lex.europa.eu/eli/reg/2024/1183/oj), and which are related to the following topics:

- Wallet Unit core functionalities ([art. 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1))
- Relying parties ([art. 5b](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1776-1-1))
- Requirements for QEAA ([art.45d](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3849-1-1))
- Verification of attributes against authentic sources ([art.45e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3883-1-1))
- Requirements for EAA issued by/on behalf of a public sector body (PSB) ([art.45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1))
- Cross border identity matching ([art.11a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e2220-1-1))
- Certification of the Wallet Solution ([art. 5c](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1875-1-1))
- Publication of a list of certified Wallet Solutions ([art. 5d](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1938-1-1))
- Security breaches of Wallet Solutions or Wallet Units ([art. 5e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e2020-1-1))
- Requirements for EAA issued by/on behalf of a PSB - notification ([art.45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1))

The Commission intends to use this ARF to develop the Wallet Solution reference implementation.

The document presents a state-of-play of ongoing work of the eIDAS Expert Group and does not imply any formal agreement regarding its content. This document will be complemented and updated over time through the process of establishing the toolbox, as described in [Chapter 8](#8-document-development).

This document holds no legal value and does not prejudge the final mandatory legal requirements for the EUDI Wallet ecosystem. Only the adopted European Digital Identity Framework Regulation [eIDAS 2.0], and the implementing and delegated acts adopted under that Regulation, are mandatory.

### 1.3 Guidance for the Large-Scale Pilots (LSP)

To support the development of a reference implementation of a Wallet Solution and to pilot its usage across different priority use cases, the Commission launched a call for proposals on 22<sup>nd</sup> February 2022 under the Digital Europe Programme to pilot use cases for the EUDI Wallet ecosystem at a large-scale.

The objective of the Large-Scale Pilots (LSP) call is to support the piloting of the EUDI Wallet ecosystem around a range of use cases involving both public and private sector stakeholders. The LSPs will test the EUDI Wallet ecosystem in both national and cross-borders contexts and integrate with the iterative development of the reference application.

The works of the LSPs will be aligned with the ARF, which will guide pilot system design and architecture development together with the release of the reference implementation.

The LSPs are expected to provide feedback on the ARF as they develop and interact with Relying Party services, Qualified or non-qualified Electronic Attestations of Attributes (Q)EAA Providers, Person Identification Data (PID) Providers, Qualified and non-Qualified Trust Service Providers and Users in meaningful interactions under the proposed use cases.

### 1.4 Definitions

The definitions used in this document can be found in Annex 1 of this document.

### 1.5 Scope

This document only applies to the EUDI Wallet ecosystem. Attestations that are not bound to Wallet Units are not included in the scope of this document.

### 1.6 Future work

The Commission recognised that the following topics need further discussion. These topics will be discussed with Member States and the results of these discussions will be reflected in future versions of this ARF:

- Topic A: Privacy risks and mitigations,
- Topic B: Re-issuance and batch issuance of PIDs and Attestations,
- Topic C: Wallet Unit Attestation (WUA),
- Topic D: Embedded Disclosure Policies,
- Topic E: Pseudonyms,
- Topic F: Digital Credential API,
- Topic G: Zero Knowledge Proofs (ZKP),
- Topic H: Transaction logs kept by the Wallet Unit, 
- Topic I: Natural person representing another natural person,
- Topic J: Wallet to Wallet interaction,
- Topic K: Combined presentation of attestations,
- Topic L: User requesting data deletion to Relying Parties, 
- Topic M: User reporting unlawful or suspicious requests of data to DPAs,
- Topic N: Data portability,
- Topic O: Catalogues for Attestations,
- Topic P: Secure Cryptographic Interface between Wallet Instance and WSCA, 
- Topic Q: Interface between the User and the Wallet Instance,
- Topic R: Authentication of the User to the device,
- Topic S: Certificate transparency,
- Topic T: Support and maintenance by the Wallet Provider,
- Topic U: EUDI Wallet Trust Mark,
- Topic V: PID Rulebook.

## 2 Use Cases

### 2.1 Introduction

The development of the Architecture Reference Framework (ARF) is strategically guided by use cases that showcase the User experience, value proposition, and business requirements of the EUDI Wallet ecosystem. In this process, the eIDAS Expert Group initially created service blueprints for each use case. These blueprints meticulously detail the service delivery's touch points, components, and processes. Their role is twofold: they are instrumental in the service design and function as a tool to improve User experience and service efficiency, while simultaneously highlighting potential areas for enhancement. Serving as a foundational element, these blueprints inform the development of common specifications. Detailed in the Annexes, these blueprints offer comprehensive solutions with the flexibility to incorporate alternative approaches and optional steps. It's important to note that User journeys may differ depending on the chosen implementation approach, affecting processes like data retrieval and obtaining User approval.

The eIDAS Expert Group has described service blueprints for the following use cases:

- Identification and authentication to access online services, see [Section 2.2](#22-identification-and-authentication-to-access-online-services)
- Qualified Electronic Signature, see [Section 2.3](#23-qualified-electronic-signature)
- Mobile Driving Licence, see [Section 2.4](#24-mobile-driving-licence)
- Pseudonyms, see [Section 2.5](#25-pseudonyms).
- Several other use cases that will be detailed in subsequent versions of this document, see [Section 2.6](#26-other-use-cases).

### 2.2 Identification and authentication to access online services

The EUDI Wallet ecosystem is primarily designed to facilitate secure User identification and authentication at a high Level of Assurance (LoA) for various online services, both public and private. This capability is crucial, as it allows Relying Parties to confidently verify the identity of Users they interact with.

In this use case, a User employs their Wallet Unit to present some User attributes to a Relying Party, in order to access online services. Before presenting the attributes, the Wallet Unit authenticates the User. The User is particularly mindful of the privacy and security concerns associated with presenting person identification data (PID) online. Their primary goals include reliably identifying themselves to services that demand User identification while maintaining control over the presentation of their personal data.

Instead of using their PID to authenticate to online services, a User can also use a pseudonym provided by their Wallet Unit. See [Section 2.5](#25-pseudonyms).

### 2.3 Qualified electronic signature

The Wallet Unit enables Users to create qualified electronic signatures or seals. This goal can be reached by using the authentication and signing capabilities of the Wallet Unit as a part of a local QSCD, or a remote QSCD managed by a QTSP [Topic16] and [Topic 37].

### 2.4 Mobile Driving Licence

A significant use case for the Wallet Unit involves allowing Users to acquire, store, and present a mobile Driving Licence (mDL) as an attestation to prove their driving privileges. In this use case, the User employs a Wallet Unit to present a mDL to a Relying Party, for instance a police officer.

The use case description concentrates on proximity supervised and unsupervised flows, which involve scenarios where the User is physically near a Relying Party, and the mDL attribute exchange occurs using proximity technologies (e.g., NFC, Bluetooth). The two proximity flows have one significant difference: in the supervised flow, the Wallet Unit presents mDL attributes to a human Relying Party or under their supervision, whereas in the unsupervised flow, the Wallet Unit presents mDL attributes to a machine without human oversight.

### 2.5 Pseudonyms

A User can present a pseudonym to a Relying Party, instead of a PID or attestation. Wallet Units support the generation of pseudonyms for Users in compliance with the W3C WebAuthn API specification, [W3C WebAuthn].

Note: Pseudonyms were added to the list of Topics to be discussed for ARF 2.0. These discussions will include which use cases for using a pseudonym must be supported by Wallet Units and the way in which this support will be technically implemented. This section will be updated in ARF 2.0.

### 2.6 Other use cases

#### 2.6.1 Health

Easy access to health data is crucial in both national and cross-border contexts. A Wallet Unit may enable access to patient summary, ePrescriptions, etc.

#### 2.6.2 Educational attestations and professional qualifications

Providing credentials for qualification recognition procedures can be costly and time-consuming for Users, Relying Parties such as companies and employers, and Attestation Providers such as education and training providers or academic institutions. A Wallet Unit may be a repository for educational credentials and a means for exchanging them by the User to relevant Relying Parties.

#### 2.6.3 Digital Finance

A Wallet Unit may facilitate complying with strong customer authentication requirements, using the user authentication capabilities described in [Section 2.2](#22-identification-and-authentication-to-access-online-services). In line with the Commission's Retail Payments Strategy, this use case would be developed in close coordination with Member States' advisory groups on retail payments and the finance industry.

#### 2.6.4 Digital Travel Credential

Digital Travel Credential (DTC) Providers may issue DTCs to Wallet Units in a supported format, to enable Relying Parties to identify Users, thus facilitating a smooth travel experience and  User journey. Relying parties for a DTC may include governments, transportation providers, hospitality agents, or any other actors operating in a regulated environment which requires the use of a DTC.

#### 2.6.5 Social Security
Documents related to social security are important for many EU citizens to prove their rights and obligations under social security legislation in the EU. Examples include:

- Portable Document (“PDA1”) – This is a statement of applicable legislation which is useful to prove that a person pays social contributions in another EU country, for example if they are a posted worker or work in several countries at the same time. 
- Electronic Health Insurance Card (“EHIC”) – This is a free card that provides every citizen with access to medically necessary government-provided healthcare during a temporary stay in one of the 27 EU countries, Iceland, Liechtenstein, Norway, and Switzerland, under the same conditions and at the same cost (free in some countries) as persons insured in that country. This includes, for example, services related to chronic or existing illnesses, as well as in connection with pregnancy and childbirth.

## 3. EUDI Wallet ecosystem

### 3.1 Introduction

This chapter describes the EUDI Wallet ecosystem as it is foreseen in the Regulation. The different roles in the EUDI Wallet ecosystem are described in Figure 1 and detailed in the following sections.

![Figure 1: Overview of the EUDI Wallet ecosystem roles](media/Figure_1_Overview_of_EUDI_Wallet_roles.jpeg) <!-- <img src="Figure_1_Overview_of_EUDI_Wallet_roles.jpeg" style="width="7.2131944444444445in" height="3.375in" /> -->

Figure 1: Overview of the EUDI Wallet ecosystem roles

1. Users of Wallet Units, see [Section 3.2](#32-users-of-wallet-units),
2. Wallet Providers, see [Section 3.3](#33-wallet-providers),
3. Person Identification Data (PID) Providers, see [Section 3.4](#34-person-identification-data-pid-providers),
4. Trusted List Providers, see [Section 3.5](#35-trusted-list-provider),
5. Qualified Electronic Attestation of Attributes (QEAA) Providers, see [Section 3.6](#36-qualified-electronic-attestation-of-attributes-qeaa-providers),
6. Electronic attestation of attributes issued by or on behalf of a public sector body responsible for an authentic source (Pub-EAA) Providers, see [Section 3.7](#37-electronic-attestation-of-attributes-issued-by-or-on-behalf-of-a-public-sector-body-responsible-for-an-authentic-source-pub-eaa-providers),
7. Electronic Attestation of Attributes (EAA) Providers, see [Section 3.8](#38-non-qualified-electronic-attestation-of-attributes-eaa-providers),
8. Qualified Electronic Signature Remote Creation Providers, see [Section 3.9](#39-qualified-electronic-signature-remote-creation-qesrc-providers),
9. Authentic Sources, see [Section 3.10](#310-authentic-sources),
10. Relying Parties, see [Section 3.11](#311-relying-parties),
11. Conformity Assessment Bodies (CAB), see [Section 3.12](#312-conformity-assessment-bodies-cab),
12. Supervisory Bodies, see [Section 3.13](#313-supervisory-bodies),
13. Device Manufacturers and Related Subsystems Providers, see [Section 3.14](#314-device-manufacturers-and-related-subsystems-providers),
14. Attribute Schema Providers, see [Section 3.15](#315-attribute-schema-providers-for-qeaa-pub-eaa-and-eaa),
15. National Accreditation Bodies, see [Section 3.16](#316-national-accreditation-bodies),
16. Access Certificate Authorities, see [Section 3.17](#317-access-certificate-authorities).

### 3.2 Users of Wallet Units

Users of Wallet Units use the Wallet Unit to receive, store, and present PID, QEAA, PuB-EAA, or non-qualified EAA to Relying Parties. Users can also create qualified electronic signatures and seals (QES) and create and present pseudonyms.

[CIR 2024/2982] (among others) defines 'wallet user' as 'a user who is in control of the wallet unit'. Being in control of the Wallet Unit implies being able to present a PID or attestation to a Relying Party. In most cases, the User (the person presenting a PID or attestation) is the subject of that PID or attestation. However, this may not always be the case, as a Wallet Unit may possibly contain the PIDs of different persons or legal entities. An example is the case of a parent having their children's PIDs in their Wallet Unit. Another example is a natural person representing a legal person, who may hold a legal-person PID in their Wallet Unit next to their own natural-person PID. However, the topics of representation and delegation will be further discussed with Member States in the future and no decisions have been made yet.

Who can be a User of a Wallet Unit depends on national law. The use of a Wallet Unit by citizens is not mandatory under the [eIDAS 2.0] Regulation. However, each Member State will provide at least one European Digital Identity Wallet within 24 months after the entry into force of the implementing acts referred to in the Regulation.

### 3.3 Wallet Providers

Wallet Providers are Member States or organisations either mandated or recognised by Member States making a Wallet Solution available to Users. All Wallet Solutions must be certified as described in [Chapter 7](#7-security-and-data-protection).

A Wallet Provider makes a combination of several products and Trust Services available to a User, which give the User sole control over the use of their Person Identification Data (PID) and Electronic Attestations of Attributes (QEAA, PuB-EAA or EAA), and any other personal data within their Wallet Unit. This also implies guaranteeing a User sole control over sensitive cryptographic material (e.g., private keys) related to their Wallet Unit. 

Wallet Providers are responsible for ensuring compliance with the requirements for Wallet Solutions. 

From the viewpoint of the other actors in the EUDI Wallet ecosystem, the Wallet Provider is responsible for all components of the Wallet Unit. These components are described in [Section 4.3.2](#432-components-of-a-wallet-unit). In particular, the Wallet Provider is responsible for ensuring that the Wallet Instance can access a Wallet Secure Cryptographic Device (WSCD) that has a level of security sufficient to ensure that the Wallet Unit can achieve Level of Assurance "high", as required in the Regulation. This is true  even if the WSCD is not delivered by the Wallet Provider but is integrated into the User device. For more information, see [Section](#45-wscd-architecture-types). Other actors in the ecosystem do not need to interact with or explicitly trust a WSCD supplier. As explained in [Section 6.5.3](#653-wallet-unit-activation), Wallet Providers provide a Wallet Unit Attestation (WUA) to the Wallet Unit. The WUA attests that the Wallet Unit and all of its components, including the WSCD, comply with the relevant requirements.

### 3.4 Person Identification Data (PID) Providers

PID Providers are trusted entities responsible for:

- verifying the identity of the User in compliance with LoA high requirements,
- issuing a PID to the Wallet Unit, and
- making available, in a privacy preserving way, information for Relying Parties to verify the validity of the PID.

The terms and conditions of these services are for each Member State to determine.

PID Providers may be the same organisations that today issue official identity documents, electronic identity means, etc. PID Providers may be the same organisations as Wallet Providers. In case an organisation acts as both a PID Provider and a Wallet Provider, it complies with all requirements for both PID Providers and Wallet Providers.

### 3.5 Trusted List Provider

A Trusted List Provider (TLP) is a body responsible for maintaining, managing, and publishing a Trusted List. In compliance with [Article 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1), a Trusted List Provider is appointed by a Member State and notified to the Commission. Within the EUDI Wallet ecosystem, Trusted Lists exist for the following entities:

- Wallet Providers,
- PID Providers,
- QEAA Providers,
- PuB-EAA Providers,
- Access Certificate Authorities
- Qualified Electronic Signature Remote Creation (QESRC) Providers

Note: Trusted Lists and Trusted List Providers may also exist for non-qualified EAA Providers, but this is out of scope of the ARF.

These Trusted Lists are described in more detail in [Sections 6.2.2](#622-wallet-provider-registration-and-notification), [6.3.2](#632-pid-provider-or-attestation-provider-registration-and-notification) and [6.4.2](#642-relying-party-registration), as well as in [Topic 31]. Some Trusted Lists contain the trust anchors of the relevant entities. A trust anchor is a combination of a public key and the identifier of the associated entity and may be used to verify signatures created by that entity.

An entity's status as a trusted entity can be verified by checking whether they are present on the relevant Trusted List. Trusted List Providers provide a registration service for the relevant entities. The terms and conditions for entities to become registered are for each Trusted List Provider to determine unless specified elsewhere e.g., in sectoral rules.

For more information, please refer to [Topic 27] and to [Topic 31].

### 3.6 Qualified Electronic Attestation of Attributes (QEAA) Providers

Qualified EAAs are provided by Qualified Trust Service Providers (QTSPs). The general trust framework for QTSPs (see Chapter III, Section 3 of the [eIDAS 2.0] Regulation) applies also to QEAA Providers, but specific rules for the Trust Service of issuing QEAAs may be defined as well. 

QEAA Providers maintain an interface to Wallet Units to provide QEAAs upon request, including mutual authentication. Potentially, they also maintain an interface towards Authentic Sources to verify attributes, as specified in Annex 2 [Topic 42].

It is likely that for most QEAAs, a QEAA Provider will need to verify the identity of a User when issuing a QEAA. It is up to each QEAA Provider to implement the necessary User authentication processes, in compliance with all applicable national and Union legislation. Note that, when User identity verification is necessary, it is likely that the User requesting a QEAA already possesses a PID. This would enable the QEAA Provider to carry out User identification and authentication at LoA "high", by requesting and verifying User attributes from the PID in the Wallet Unit.

The terms and conditions of these services are for each QEEA Provider to determine, beyond what is specified in the [eIDAS 2.0] Regulation.

### 3.7 Electronic attestation of attributes issued by or on behalf of a public sector body responsible for an authentic source (Pub-EAA) Providers

As specified in the Regulation, an attestation may be issued by or on behalf of a public sector body responsible for an Authentic Source. This ARF calls such an attestation a PuB-EAA. For a description of Authentic Sources, see [Section 3.10](#310-authentic-sources). A public sector body primarily is a state, regional or local authority, or a body governed by public law.

A PuB-EAA Provider, meaning a public sector body issuing PuB-EAAs, is not a QTSP. However, a PuB-EAA Provider has a qualified certificate, issued by a QTSP, that allows it to sign PuB-EAAs. A Relying Party verifies a PuB-EAA by first verifying the signature over the PuB-EAA, and subsequently verifying the signature of the qualified PuB-EAA Provider certificate. For more details, refer to [Section 6.6.3.6](#6636-relying-party-instance-verifies-the-authenticity-of-the-pid-or-attestation).

The Regulation stipulates that PuB-EAAs, like QEAAs, have the same legal effect as attestations in paper form. It is up to the Member States to define terms and conditions for the provisioning of Pub-EAAs, but PuB-EAA Providers will comply with the same technical specifications and standards as Providers of PIDs and other attestations.

For the precise and legally binding definitions and obligations regarding the issuance of PuB-EAAs, please refer to the Regulation.

### 3.8 Non-Qualified Electronic Attestation of Attributes (EAA) Providers

Non-qualified EAAs can be provided by any (non-qualified) Trust Service Provider. While they will be supervised under [eIDAS 2.0], it can be assumed that other legal or contractual frameworks will mostly govern the rules for provision, use and recognition of EAAs. Those other frameworks may cover policy areas such as educational credentials, digital payments, although they may also rely on Qualified Electronic Attestation of Attributes Providers. For non-qualified EAAs to be used, EAA Providers offer Users a way to request and obtain these EAAs. This implies that these non-qualified EAA Providers comply with the Wallet Unit interface specifications. The terms and conditions of issuing EAAs and related services are subject to sectoral rules.

### 3.9 Qualified Electronic Signature Remote Creation (QESRC) Providers

The Wallet Unit will allow the User to create free-of-charge qualified electronic signatures or seals over any data. This will also enhance the use of the Wallet Unit for signing, in a natural and convenient way. The creation of a qualified electronic signature or seal by means of the Wallet Unit can be achieved in several ways:

- the Wallet Unit itself could be certified as a qualified signature or seal creation device (QSCD), or
- the Wallet Unit could implement secure authentication into an electronic signature or electronic seal invocation capability, as part of a local QSCD or a remote QSCD managed by a QTSP.

As part of the ecosystem, the use of common interfaces and protocols for provisioning qualified electronic signatures and seals will create a unified European market for QTSPs offering remote signature services. European citizens will be able to choose any QTSP, without worrying about technical interoperability, and this will enhance competition.

Besides providers of qualified electronic signatures and seals, also providers of non-qualified electronic signatures or seals may exist. However, such providers are out of scope of this ARF.

### 3.10 Authentic Sources

Authentic Sources are public or private repositories or systems, recognised or required by law, containing attributes about natural or legal persons. Authentic Sources are sources for attributes on, for instance, address, age, gender, civil status, family composition, nationality, education and training qualifications titles and licences, professional qualifications titles and licences, public permits and licences, or financial and company data. 

Authentic Sources are required to provide an interface to QEAA Providers to verify the authenticity of the above attributes, either directly or via designated intermediaries recognised at national level. Authentic Sources may act as PuB-EAA Providers if they meet the requirements of the [eIDAS 2.0] Regulation, see [Section 3.7](#37-electronic-attestation-of-attributes-issued-by-or-on-behalf-of-a-public-sector-body-responsible-for-an-authentic-source-pub-eaa-providers). In Figure 1 this is indicated by the arrow 'provides qualified data'.

### 3.11 Relying Parties

Relying Parties are natural or legal persons that rely upon an electronic identification scheme or on a Trust Service. They request attributes contained within a PID, QEAA, Pub-EAA or EAA from the Wallet Unit, subject to the approval of the User and within the limits of applicable legislation and rules.

The reason for reliance on the Wallet Unit may be a legal requirement, a contractual agreement, or their own decision. In particular, the Regulation requires that providers of very large online platforms must accept the EUDI Wallet for their user authentication processes.

Relying Parties maintain an interface with Wallet Units to request PIDs and attestations, using Relying Party authentication, as described in [Section 6.6.3.2](#6632-wallet-unit-authenticates-the-relying-party-instance). If a Wallet Unit presents attributes from a PID or attestation to a Relying Party, the Relying Party can verify the authenticity of these attributes.

To rely on Wallet Units for the purpose of providing a service, Relying Parties inform the Member State where they are established about their intention for doing so, and register the attributes that they intend to request. See [Section 6.4.2](#642-relying-party-registration) for more information on Relying Party registration. During a transaction, a Wallet Unit will verify that the Relying Party only requests attributes that it registered. It will warn the User if this is not the case. This is explained in [Section 6.6.3.3](#6633-wallet-unit-allows-user-to-verify-that-relying-party-does-not-request-more-attributes-than-it-registered). 

In addition, an Attestation Provider may embed a disclosure policy in an attestation. Such a policy indicates to which Relying Parties a Wallet Unit should (or should not) present specific attributes from that attestation. During a transaction, the Wallet Unit evaluates the policy based on data provided by the Relying Party, and warns the User if the outcome of that evaluation is negative. Please refer to [Section 6.6.3.4](#6634-wallet-unit-evaluates-disclosure-policy-embedded-in-attestation-if-present) for more information.

### 3.12 Conformity Assessment Bodies (CAB)

Conformity Assessment Bodies (CAB) are public or private bodies that are accredited by a national accreditation body, which itself is designated by Member States according to [Regulation 765/2008](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:32008R0765) Article 6c (3). In particular, CABs are accredited to carry out assessments on which Member States will rely before issuing a Wallet Solution or providing the 'qualified' status to a Trust Service Provider.

Wallet Solutions will be certified by CABs. QTSPs will be audited regularly by CABs.

The standards and schemes used by CABs to fulfil their tasks to certify Wallet Solutions are discussed in [Chapter 7](#7-certification-and-risk-management).

### 3.13 Supervisory Bodies

Supervisory Bodies review the proper functioning of Wallet Providers and other actors in the EUDI Wallet ecosystem. Supervisory Bodies will be created and appointed by the Member States. The Supervisory Bodies will be notified to the Commission by the Member States.

### 3.14 Device Manufacturers and Related Subsystems Providers

In the EUDI Wallet ecosystem, commercial actors such as device manufacturers and related subsystems providers fulfil an important role to enable a Wallet Unit to work smoothly and securely. Device manufacturers and related subsystem providers provide a platform on which a Wallet Unit can be built. Wallet Providers ensure that their Wallet Units use that platform to ensure usability, security, stability and connectivity. The components provided by device manufacturers and providers of related subsystems may include, among others, hardware, operating systems, secure cryptographic hardware, libraries, and app stores.

### 3.15 Attribute Schema Providers for QEAA, PuB-EAA and EAA

 Attribute Schema Providers publish attribute schemas describing the structure of QEAAs, PuB-EAAs and EAAs, including the identifier, semantics, and encoding of all attributes. These attribute schemas are published in Attestation Rulebooks, see [Section 5.5](#55-attestation-rulebooks). For PIDs and mDLs, the applicable Rulebooks are published by the Commission.

 A catalogue of published Attestation Rulebooks will enable other entities such as Relying Parties to discover which attestations exist within the EUDI Wallet ecosystem, and how attributes from these attestations can be requested and validated. The Commission sets out the technical specifications, standards, and procedures for this purpose. Common schemas, including by sector-specific organisations, are critical for widespread adoption of attestations.

### 3.16 National Accreditation Bodies

National Accreditation Bodies (NAB), under [Regulation (EC) No 765/2008](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:32008R0765), are the bodies in Member States that perform accreditation with authority derived from the Member State. NABs accredit CABs ([Section 3.12](#312-conformity-assessment-bodies-cab)) as competent, independent, and supervised professional certification bodies in charge of certifying Wallet Solutions against normative document(s) establishing the relevant requirements. NABs monitor the CABs to which they have issued an accreditation certificate.

### 3.17 Access Certificate Authorities

Access Certificate Authorities issue access certificate to all PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers and Relying Parties in the EUDI Wallet ecosystem. When these entities interact with a Wallet Unit to issue or request a PID or attestation, they will present an access certificate to prove their authenticity and validity.

Access Certificate Authorities must be notified by a Member State to the Commission. As part of the notification process, the trust anchors of the Access CA must be included in a Trusted List. A trust anchor is the combination of a public key and an identifier for the associated entity. Wallet Units need these trust anchors to verify of the signatures over the access certificates presented to them when a new PID or attestation is issued or when they receive an attribute presentation request from a Relying Party.

## 4 High level architecture

### 4.1 Introduction

This chapter provides a broad overview of the EUDI Wallet ecosystem's core components, their interfaces, and the overall design principles. This chapter is structured as follows:

- [Section 4.2](#42-design-principles) discusses the design principles that guided the design of the EUDI Wallet ecosystem, as described in this ARF.
- [Section 4.3](#43-reference-architecture) presents an overview of the ecosystem's architecture, focussing on the components that make upa Wallet Unit and on the interfaces between a Wallet Unit and other entities, as well as the protocols used on these interfaces.
- [Section 4.4](#44-attestation-presentation-flows) discusses the different attestation presentation flows enabled by this architecture, and in particular the mechanisms foreseen to enable and secure remote presentation flows in which the Wallet Unit and the Relying Party interact over the internet.
- [Section 4.5](#45-wscd-architecture-types) briefly discusses the different architecture types Wallet Providers may use for implementing one or more Wallet Secure Cryptographic Device(s) into their Wallet Solutions.
- [Section 4.6](#46-state-diagrams) presents state diagrams for all of the main entities and components in the EUDI Wallet ecosystem, discussing all of the states a particular component can be in, as well as the conditions triggering state transitions.

### 4.2 Design principles

To effectively translate the European Digital Identity Regulation into a User-friendly, privacy-focused, and secure technical architecture, establishing design principles is crucial. These principles, rooted in the regulatory framework and enriched by industry best practices, will serve as fundamental guidelines. This approach ensures compliance with requirements emphasising User-centricity, privacy, security, and cross-border interoperability. It demonstrates a commitment to both regulatory alignment and excellence in the EUDI Wallet architecture's design.

#### 4.2.1 User-centricity

The EUDI Wallet ecosystem prioritises User-centricity as a core design principle. This means placing User needs and experience at the forefront of every design decision. The Wallet Unit should be intuitive and easy to use, with seamless integration into existing use cases. Users should have full control over their attributes and privacy, with transparent information about what are attributes are being presented and to whom. Additionally, the Wallet Unit should be accessible and inclusive, catering to Users with varying technical backgrounds and abilities. By prioritising User-centricity, the EUDI Wallet ecosystem fosters trust and encourages widespread adoption, ultimately achieving its goal of empowering Users with secure and convenient digital identity management.

#### 4.2.2 Interoperability

The EUDI Wallet ecosystem prioritises interoperability as a core design principle. This ensures a Wallet Unit functions seamlessly across borders within the EU. Users can travel freely and confidently utilise their digital identity wallets for various services, from e-government platforms to private online interactions. Interoperability fosters secure data exchange through standardised protocols, allowing trusted entities to verify credentials effortlessly. This not only simplifies the User experience but also strengthens overall security within the system. Moreover, interoperability prevents market fragmentation by creating a level playing field for different Wallet Solutions. It fosters competition and collaboration, ultimately driving innovation in the EUDI Wallet ecosystem. By prioritising interoperability, the EUDI Wallet architecture lays the foundation for a trusted and universally accepted EUDI Wallet ecosystem across the EU.

#### 4.2.3 Privacy by design

The EUDI Wallet architecture embodies the principle of privacy by design. This means that the protection of User data is a fundamental pillar of the architecture's design. The principle of data minimisation guides the collection of personal information, ensuring that Relying Parties gather only the attributes they need and have registered for. By enabling selective disclosure of attributes, the Wallet Unit empowers Users with granular control over what data is presented and to whom. Transparency is built into the system, with clear explanations of how data is used and protected. By making privacy a cornerstone from the beginning, the EUDI Wallet ecosystem aims to foster trust and protect the fundamental rights of its Users. Finally, measures are taken to prevent Users from being tracked by Relying Parties, PID Providers, or Attestation Providers. 

For more information, please refer to [Sections 6.1.2.4](#6124-risks-and-mitigation-measures-related-to-authorisation) and [6.1.2.5](#6125-risks-and-mitigation-measures-related-to-user-tracking). 

#### 4.2.4 Security by design

The EUDI Wallet architecture embraces the principle of security by design. This means security considerations are woven into the very fabric of the architecture's design. Throughout the design process, potential vulnerabilities are identified and mitigated. Secure coding practices are mandated, and the architecture itself minimises attack surfaces by compartmentalising sensitive data and access controls. By prioritising security from the outset, the EUDI Wallet architecture aims to be inherently resistant to cyberattacks and data breaches, fostering trust and User confidence in this EUDI Wallet ecosystem.

For more information, please refer to [Sections 6.1.2.2](#6122-risks-and-mitigation-measures-related-to-confidentiality-integrity-and-authenticity) and [6.1.2.3](#6123-risks-and-mitigation-measures-related-to-tampering-of-cryptographic-keys-and-sensitive-data). 

### 4.3 Reference architecture

### 4.3.1 Overview

Figure 2 below gives an overview of the architecture of the EUDI Wallet ecosystem and its components. In comparison to Figure 1, this figure presents more detail on the composition of a Wallet Unit and its interfaces to other entities. The depicted components of a Wallet Unit are described in [Section 4.3.2](#432-components-of-a-wallet-unit), while the interfaces are described in [Section 4.3.3](#433-wallet-unit-interfaces-and-protocols). The other entities shown in the figure were already described in [Chapter 3](#3-eudi-wallet-ecosystem).

![Figure 2](media/Figure_2_High-Level_Architecture.jpeg) <!-- <img src="Figure_2_High-Level_Architecture.jpeg" style="width="6.195290901137358in" height="6.5597200349956255in" /> -->

Figure 2: EUDI Wallet ecosystem reference architecture

Note that a User device can host more than one Wallet Unit, either provided by multiple Wallet Providers or by the same one, if supported by that Wallet Provider. If a User device hosts more than one Wallet Unit, all statements in this ARF regarding a Wallet Unit and its components hold for each Wallet Unit independently.

### 4.3.2 Components of a Wallet Unit

The following have been identified as the core components of a Wallet Unit:

- **Wallet Instance (WI)**: The app or application installed on a User device,
which is an instance of a Wallet Solution and belongs to and is controlled by a
User. This component implements the core business logic and interfaces as
depicted in Figure 2. It directly interacts with the WSCA/WSCD (see bullets hereafter) to securely
manage cryptographic assets and execute cryptographic functions, ensuring a high
level of assurance for authentication.
- **User device (UD)**: A User device comprises the hardware, operating system,
and software environment required to host and execute the Wallet Instance. The
minimum hardware and software requirements for the User device will be
determined by the Wallet Provider.
- **Wallet Secure Cryptographic Device (WSCD):** tamper-resistant device that
provides an environment that is linked to and used by the wallet secure
cryptographic application to protect critical assets and provide cryptographic
functions for the secure execution of critical. This includes a keystore, but
also the environment where the security-critical functions are executed. The
WSCD is tamper-proof and duplication-proof. One WSCD may be included in multiple
Wallet Units, e.g. in case of a remote HSM. The WSCD consists of two parts: the
WSCD hardware covers the hardware issued by the WSCD vendor and the WSCD
firmware covers security-related software, such as an operating system and
cryptographic libraries provided by the WSCD vendor. Figure 2 shows four
different possible security architectures for the WSCD (for more details see
[Section 4.5](#45-wscd-architecture-types)):
    - a remote WSCD, a remote device, such as a Hardware Security Module (HSM),
    accessed over a network.
    - a local external WSCD, an external device, such as a smart card issued
    to the User specifically for this purpose,
    - a local internal WSCD, a component within the User device,
    such as a SIM, e-SIM, or embedded Secure Element,
    - a local native WSCD, a component embedded in the User device and accessed via
    an API provided by the operating system.
- **Wallet Secure Cryptographic Application (WSCA):** an application that
manages critical assets by being linked to and using the cryptographic and
non-cryptographic functions provided by the Wallet Secure Cryptographic Device. The WSCA interfaces directly with the Wallet Instance. For more details see [Section 4.5](#45-wscd-architecture-types).
- **Wallet Provider backend (WPB**): The Wallet Provider backend offers Users
support with their Wallet Units, performs essential maintenance, and issues
Wallet Unit Attestations through the Wallet Provider Interface (WPI).

#### 4.3.3 Wallet Unit interfaces and protocols

Figure 2 shows the following interfaces between components of a Wallet Unit, or
between the Wallet Unit and other entities in the EUDI Wallet ecosystem:

- The **Wallet Provider Interface (WPI)** is used by the Wallet Instance to
communicate with the Wallet Provider to request and issue the Wallet Unit
Attestation, as well as to provide support to the User and collect aggregated
and user-consented information in a privacy-preserving manner to provision the
Wallet Unit, in compliance with applicable legislation. Because the Wallet
Provider is responsible for both sides of this interface, it will not be
standardised in the scope of the EUDI Wallet ecosystem.
- The **User Interface (UI)** is the point of interaction and communication
between the User and the Wallet Instance. This interface will not be
standardised in the scope of the EUDI Wallet ecosystem.
- The **Presentation Interface (PI)** enables Relying Parties to securely
request and receive PIDs, QEAAs, PuB-EAAs and EAAs from Wallet Units. This
interface accommodates both remote and proximity interactions. For remote
presentation flows, as detailed in [Section
4.4.3](#443-remote-presentation-flows), the Wallet Instance implements the
OpenID for Verifiable Presentation protocol [OpenID4VP] in combination with the
[W3C Digital Credentials API]. In contrast, for the proximity presentation flow,
this interface adheres to the [ISO/IEC 18013-5] standard, see [Section
4.4.2](#442-proximity-presentation-flows). The same interface can also be used
by another Wallet Unit to request User attributes, see [Section
6.6.4](#664-pid-or-attestation-presentation-to-another-wallet-unit).
- The **Secure Cryptographic Interface (SCI)** enables the Wallet Instance to
communicate with the Wallet Secure Cryptographic Application (WSCA). This
interface is specifically designed for managing crirical assets and
executing cryptographic functions.To be able to support different types of
WSCA/WSCD, Wallet Instances may need to be able to handle multiple flavours of
this interface.

- The **PID Issuance Interface (PII)** complies with the [OpenID4VCI] standard
and is used when the Wallet Unit communicates with a PID Provider to request and
receive PIDs to be stored within the Wallet Unit.

- The **Attestation Issuance Interface** **(AII)** complies with the
[OpenID4VCI] standard and is used by the Wallet Unit to request various
attestations that the User wants to include in their Wallet Unit.

- The **Remote Signing Interface (RSI)** facilitates communication between the
Wallet Unit and a Qualified Electronic Signature or Seal Remote Creation (QESRC)
Provider. This interface is  used  by the Wallet Unit to generate a qualified electronic 
signature or seal.

Note that the "Attribute Deletion Request to Relying Party Interface" and the
"Reporting Relying Party to DPA Interface", which are mentioned in the
Regulation, are not depicted as interfaces in Figure 2. Functionality enabling
a User to request a Relying Party to delete personal data (i.e., User
attributes) obtained from the User's Wallet Unit is seen as a features of the
Wallet Solution  The same applies to functionalities enabling the User to report a Relying Party to a Data Protection Authority.

### 4.4 Data presentation flows

#### 4.4.1 Overview

This section defines four distinct communication flows that can be used when a
Wallet Unit presents a PID or attestation to a Relying Party Instance:

- **Proximity Supervised Flow**: In this flow, the User and their Wallet
Instance are physically near the Relying Part Instance. PIDs and attestations
are exchanged using proximity technology (e.g., NFC, Bluetooth) between the
Wallet Unit and the Relying Party Instance. Both devices may be with or without
internet connectivity. A human representative of the Relying Party supervises
the process.
- **Proximity Unsupervised Flow**: This flow is like the supervised flow, but
the Wallet Unit presents attestations to a machine, without human supervision.
The interfaces and protocols used in this flow are the same as for the proximity
supervised flow, and are described in [Section
4.4.2](#442-proximity-presentation-flows).
- **Remote Same-Device Flow**:In this flow, the User utilises a web browser or
another application on their User Device to access a Relying Party's a service.
If consuming the service requires the Relying Party to obtain specific
attributes from the User's Wallet Unit, the Relying Party sends a presentation
request to the Wallet Unit. As explained in [Section 4.4.3.2](#4432-same-device-remote-presentation-flows-and-inter-app-presentation-flows),
this request is managed by the web browser on the User's device, utilising the
[W3C Digital Credentials API] and, behind the scenes, an inter-app API
provided by the device's operating system.
- **Remote Cross-Device Flow**: In this flow, the User uses a web browser on a
device other than their Wallet Instance, for instance a desktop or laptop, to
access the Relying Party's service. If the Relying Party needs to send a
presentation request to the User's Wallet Unit, it presents this request to the
web browser on the other device. Again using the [W3C Digital Credentials API],
this web browser sets up a secure communication channel between the other device
and the User's device. [Section 4.4.3.3](#4433-cross-device-remote-presentation-flows)
explains this in more detail.

Specific use cases integrate one or more of these flows. Each of these flows is
described in more detail in one of the next sections.

#### 4.4.2 Proximity presentation flows

Figure 3 shows how attestation presentation works when the User and their Wallet
Instance are physically near the Relying Part Instance. In this case, the
[ISO/IEC 18013-5] standard specifies how a communication channel is set up and
how a presentation request and the corresponding response are exchanged.

![Figure 3](media/Figure_3_Proximity_Flow.png) <!-- <img src="Figure_3_Proximity_Flow.png" style="width="6.195290901137358in" height="6.5597200349956255in" /> -->

Figure 3: Proximity presentations

The attribute presentation flow begins when the User opens the Wallet Instance
and instructs it to display a QR code or present an NFC tag. This QR code or
NFC tag contains the information necessary to establish an NFC, BLE, or
Wi-Fi Aware connection. The Relying Party Instance scans the QR code or the NFC
tag and set ups the connection. The QR code or NFC tag also contains the
information necessary to create an authenticated and encrypted secure channel
between both parties.

#### 4.4.3 Remote presentation flows

#### 4.4.3.1 Introduction

Remote transaction flows are use cases in which the Relying Party Instance is
remote from the User and the User device. The Relying Party Instance accesses
the Wallet Instance over the internet, using a browser. These use cases can be
further distinguished in same-device flows, in which the browser is running on
the same device as the Wallet Unit, and cross-device flows, where the browser is
on a different device.

Remote presentation flows come with a number of challenges that are not present
for proximity flows:

1. **Secure Cross-Device Flows**: Cross-device flows are vulnerable to phishing and
relay attacks, necessitating enhanced security measures. Proximity checks,
managed by the mobile operating system, can mitigate these the risks derived  by
these vulnerabilities by leveraging built-in security features to verify the
authenticity of interactions, ensuring they are both secure and reliable.
2. **Wallet Unit Selection**: In remote flows, where interactions
do not originate from the Wallet Unit, Users may encounter difficulties in
selecting and invoking the appropriate Wallet Instance to fulfill a specific
presentation request, particularly when multiple Wallet Units are present on the
device. A unified interface provided by the web browser and the mobile operating
system can streamline this process, offering a seamless and intuitive User
experience.
3. **Invocation Mechanism**: Establishing a communication channel
between the Wallet Unit and the remote Relying Party Instance presents
challenges due to inconsistent invocation methods. One approach considered by
standardisation bodies involves using custom URI schemes, such as "mdoc://" or
"openid4vp://". In this approach, the mobile operating system would trigger the
Wallet Unit when the Relying Party Instance requests a connection via a custom
URI. Another approach is the use of domain-bound universal links (a.k.a. app links). However, relying on custom URI schemes or universal links introduces variability in User
experiences across different browsers and operating systems, resulting in
operational inefficiencies and potential security risks.
1. **Clear Origin Verification**: Protecting against relay attacks requires precise
identification of the Relying Party Instance's origin. Including the origin
information, such as the website domain or app package name, within the
presentation request ensures the authenticity of the request and enhances trust
for both Wallet Units and Users.

The next sections describe how these challenges can be solved for both same-device
and cross-device remote presentation flows, by using the W3C Digital Credentials API. Note that requirements for Wallet Units and Relying Party Instances to use this browser API for remote presentation flows will be further discussed with Member States for ARF 2.0.

#### 4.4.3.2 Same-device remote presentation flows and inter-app presentation flows

Figure 4 shows attribute presentation in a remote same-device flow.

![Figure 4](media/Figure_4_Remote_Same-Device_Flow.png) <!-- <img src="Figure_4_Remote_Same-Device_Flow.png" style="width="6.195290901137358in" height="6.5597200349956255in" /> -->

Figure 4: Remote same-device presentations

Compared to Figure 2, Figure 4 shows additional detail. In particular, it shows
the browser on the User device and the relevant interfaces of this browser:

- The **Remote same-device presentation** interface establishes communication
between the web browser and a remote Relying Party Instance, which may operate
on a server managed by the Relying Party. This interface complies with the
[Digital Credentials API], which is a browser API that is currently being
standardised within the W3C. Additionally, OpenID Foundation is standardazing an
OpenID4VP profile for the W3C Digityal Credentials API, that defines how
OpenID4VP will be used over the Digital Credentials API.
- The **WI-platform API** interface is an inter-app API that implements the
Digital Credentials API mechanism at OS level. There are however no current plans
to standardise this interface on the level of the API calls. These calls will be
specified in the developer documentation for the respective OS. One of the key
elements of this API is that Wallet Unit receives reliable information regarding
the origin of the presentation request.
- Obviously, the browser also has a User interface allowing the User to interact
with it. This interface will not be standardised in the context of the EUDI
Wallet ecosystem.

A remote same-device attribute presentation flow begins when the User uses the
browser on their User device to visit the website of the Relying Party. The
website may offer the User the possibility to present attributes from their
Wallet Unit, for example by clicking a button. If the User does so, the browser
will ask the User for permission to connect to the Wallet Unit. If the User
allows this, the Relying Party Instance sends an OpenID4VP-compliant
presentation request to the browser over the Digital Credentials API. The
browser, in collaboration with the device OS, forwards this request to the
Wallet Instance, using the WI-platform API described above. If there are multiple
Wallet Instances present on the User device, the browser and the device OS will
determine to which of these the request will be forwarded, possibly after
consulting the User. The selected Wallet Unit will process the presentation request
and, after requesting approval from the User, will return the requested
attributes in encrypted format to the browser. The browser will forward the
response to the remote Relying Party Instance.

Figure 4 also shows an inter-app attribute presentation flow. In such a flow, a
mobile app on the User device, for example a banking app or shopping app, acts
as the Relying Party Instance. The mobile app may use the User attributes
received from the Wallet Unit for instance to authenticate the User or to fill
out User data, such as name and address, automatically. 

In such a use case, the attribute presentation flow begins when the User opens
the mobile app and instructs it to request attributes from the Wallet Unit over
the WI-platform API. Note that this is the same API that is also used by a
browser in remote same-device presentation flows. The only difference may be
that the origin information in the presentation request, if present, is
different. The mobile app consumes the attributes it receives itself, and does
not forward the presentation response to a remote Relying Party Instance.

#### 4.4.3.3 Cross-device remote presentation flows

Figure 5 shows attribute presentation in a remote cross-device flow.

![Figure 5](media/Figure_5_Remote_Cross-Device_Flow.jpeg) <!-- <img src="Figure_4_Remote_Cross-Device_Flow.jpeg" style="width="6.195290901137358in" height="6.5597200349956255in" /> -->

Figure 5: Remote cross-device presentations

A remote cross-device attribute presentation flow begins when the User uses a
browser on a device different from their User device to visit the website of the
Relying Party. The website may offer the User the possibility to present
attributes from their Wallet Unit, for example by clicking a button. If the User
does so, the browser will ask the User for permission to connect to the Wallet
Unit. If the User allows this, the Relying Party Instance sends a presentation
request to the browser over the Digital Credentials API. The browser then
establishes a tunnel towards the User device, using the FIDO CTAP 2.2 hybrid
flow, see section 11.5 of [CTAP]. Note that this flow is also used for FIDO
Passkeys. This is done as follows:

 1. The browser presents a QR code that includes information about the tunnel
 endpoint, as well as keys that will be used for establishing a secure channel over this
 tunnel.
 2. The User scans the QR code using the camera on the User device.
 3. The User device emits a BLE advertisement, which is received by the browser.
 The advertisement includes, in an encrypted form, information required for
 establishing the secure tunnel. This advertisement is used as a proximity
 check: the tunnel cannot be established if the User device and the device on
 which the browser runs are not close to each other.
 4. A tunnel is established between the two devices.
  
The browser then sends the OpenID4VP-compliant presentation request to the User
device. If there are multiple Wallet Instances present on the User device, the
device OS will determine to which of these the request will be forwarded,
possibly after consulting the User. The selected Wallet Unit will process the
presentation request and, after requesting approval from the User, will return
the requested attributes in encrypted format to the browser, using the established tunnel. The browser will forward the response to the remote Relying Party Instance.

Note that the Wallet Instance does not see any difference between the
cross-device flow and same-device flow. In both cases, it receives an
OpenID4VP-compliant presentation request over the WI-platform API described in
the previous section.

### 4.5 WSCD architecture types

#### 4.5.1 Introduction

Figure 2 showed four different types of architecture for the WSCD, which are:

- Remote WSCD
- Local external WSCD
- Local internal WSCD
- Local native WSCD

In addition, this section also describes a hybrid architecture. Within the EUDI
Wallet ecosystem, a Wallet Provider is allowed to use any of these architectures.

Note that, regardless of the architecture used, the Wallet Provider is responsible for ensuring that the Wallet Instance can access a WSCD that has a level of security sufficient to ensure that the Wallet Unit can achieve Level of Assurance "high", as required in the Regulation. The Wallet Provider remains responsible for managing cyrptographic keys on the WSCD (through the WSCA) throughout the lifetime of the Wallet Unit. The Wallet Provider is also responsible for attesting the properties of the WSCD (including relevant certifications) in the Wallet Unit Attestation, see [Section 6.5.3](#653-wallet-unit-activation).

#### 4.5.2 Remote WSCD

In this architecture, the Wallet Secure Cryptographic Device is situated
remotely from the User device. Typically, it will be implemented by the Wallet
Provider using an HSM running on a secure server. The Wallet Provider will also
provide the WSCA with which the Wallet Unit interacts.

This architecture is typically used if the User device lacks sufficiently secure
hardware, or if the Wallet Provider does not want to have a dependency on such
hardware.

#### 4.5.3 Local external WSCD

If the User device lacks sufficiently secure hardware, another option is to use
a local external hardware component as the WSCD. This local external WSCD is
typically a smart card or a secure token. It is connected to the User device via
NFC or another short-range connection, and is able to perform all of the
cryptographic operations required from a WSCD / WSCA in the ARF. Note that many
existing smart cards, such as identity cards, will not be able to do this.

The WSCA typically takes the form of a Java Card applet. The WSCA is installed
prior to issuance of the smart card or secure token to the User. The issuer of
the WSCD and of the WSCA is the Wallet Provider or another entity acting on
behalf of or in cooperation with the Wallet Provider.

#### 4.5.4 Local internal WSCD

In this architecture, the Wallet Secure Cryptographic Device is integrated
directly within the User's device. This includes solutions like UICCs,
e-SIM/SAMs, or embedded Secure Elements. Such solutions typically are compliant
with the GlobalPlatform Card Specifications [GP CS] or with the GSMA Secured
Applications for Mobile [GSMA SAM] specification.

The WSCA will typically be a Java Card applet, and it is remotely issued to the
WSCD by the Wallet Provider, at the moment the Wallet Unit is activated; see
[Section 6.5.3](#653-wallet-unit-activation). In order to do this, the Wallet
Provider may need to connect to and colloborate with other entities, such as a
Trusted Service Manager employed by the owner of the WSCD.

The Wallet Provider is responsible for verifying that the local internal WSCD is
compliant with all applicable requirements, prior to activating a Wallet Unit
using such a WSCD.

#### 4.5.5 Local native WSCD

A local native WSCD is integrated into the User device. However, the API to
access the WSCD is included in the operating system of the User device.
Therefore, no separate WSCA is necessary. Alternatively, the API offered by the
OS may be viewed as the WSCA.

The Wallet Provider is responsible for verifying that the local native WSCD is
compliant with all applicable requirements, prior to activating a Wallet Unit
using such a WSCD.

#### 4.5.6 Hybrid architecture

In this architecture, two or more of the different types of WSCD described above
are combined. For example, a remote HSM may manage the cryptographic keys of the
Wallet Unit and of PIDs and attestations present in the Wallet Unit, while an
embedded Secure Element is used to manage the access to the remote HSM.

### 4.6 State diagrams

#### 4.6.1 Introduction

In this section, state diagrams are presented to explain the relations between
the Wallet Solution, the Wallet Unit, and the PID.

#### 4.6.2 Wallet Solution

A Wallet Solution has a state diagram of its own. The state of a Wallet Solution
affects the state of all Wallet Units of that Wallet Solution. Figure 6 below
shows the states of the Wallet Solution:

![Figure 6](media/Figure_6_Statechart_Wallet_Solution.png) <!-- <img src="media/Figure_6_Statechart_Wallet_Solution.png" style="width:3.8190529308836396in;height:4.104166666666667n" /> -->

Figure 6: State diagram of Wallet Solution

The **Candidate** state is the first state of a Wallet Solution. This means it
is fully implemented and the Wallet Provider requests the solution to be
certified as a Wallet Solution as part of an EUDI Wallet eID scheme.

If all the legal and technical criteria have been met, a Member State may decide
to allow a Wallet Provider to start providing the Wallet Solution to Users. The
state of the Wallet Solution becomes **Valid**. This means the Wallet Solution
can be officially launched, and can be provided to Users. The issuing Member
State informs the Commission of each change in the certification status of their
EUDI Wallet eID schemes and the Wallet Solutions provided under that scheme.

The issuing Member State can temporarily suspend a Wallet Solution. This would
for example be the result of a critical security issue. This leads to the
**Suspended** state. The issuing Member State can unsuspend the Wallet Solution,
bringing the Solution back to the **Valid** state. The issuing Member State can
also decide to completely withdraw the Wallet Solution, which brings the Wallet
Solution in the **Withdrawn** state.

A Wallet Unit that is part of a suspended or withdrawn Wallet Solution Provider
cannot request the issuance of a PID or attestation. Nor will a PID or
attestation presented by such a Wallet Unit be accepted by a Relying Party.

#### 4.6.3 Wallet Unit

Figure 7 below shows the states of a Wallet Unit.

![Figure 7](media/Figure_7_Statechart_Wallet_Unit.png) <!-- <img src="media/Figure_7_Statechart_Wallet_Unit.png" style="width:4.5927395013123355in;height:4.538937007874016in" /> -->

Figure 7: State diagram of Wallet Unit

A Wallet Unit lifecycle begins when the User installs a Wallet Instance on their
User device (see [Section 6.5.2](#652-wallet-instance-installation). The Wallet
Unit's state is then **Installed**. In this state, the User and the Wallet
Provider can perform only one action, namely activating the Wallet Unit, as
described in [Section 6.5.3](#653-wallet-unit-activation). As part of the activation process, the
Wallet Provider issues a Wallet Unit Attestation (WUA) to the Wallet Unit.

Once a Wallet Unit is activated, it is in the **Operational** state. In this
state, the User and the Wallet Provider manage the Wallet Unit and can perform
the same actions as in the **Valid** state, see below. However, obviously, the
User cannot present a PID to a Relying Party, nor can any other action with a
PID be performed, because by definition no valid PID is present in this state.

If, in the **Operational** state, a PID Provider issues a PID to a Wallet Unit,
it transitions to the **Valid** state. If, in either of these two states, the
Wallet Provider revokes the WUA or the WUA expires, the Wallet Unit moves back
to **Installed**.

The following actions can be performed in the **Valid** state:

- The Wallet Provider updates the Wallet Unit to a new version,
- The Wallet Provider revokes the Wallet Unit, for instance at the User's
request of if the security of the Wallet Instance is broken. Revocation of the
Wallet Unit is accomplished by revoking the Wallet Unit Attestation (see [Topic
9] and [Topic 38]).
- The User requests issuance of a PID, a QEAA, a PuB-EAA, or an EAA.
- The User presents attributes from a PID, a QEAA, a PuB-EAA, or an EAA to a
Relying Party.
- The User deletes a PID, a QEAA, a PuB-EAA, or an EAA.
- A PID, a QEAA, a PuB-EAA, or an EAA is revoked by its Provider (if it is valid
for more than 24 hours).
- The User uninstalls the Wallet Instance.

If the last or only PID in the Wallet Unit expires, is revoked, or is deleted,
the Wallet Unit's state is moved back to **Operational**. Note that if there are
multiple PIDs in the Wallet Unit, it does not move to the **Operational** state
as long as at least one of them is valid.

#### 4.6.4 PID Provider or Attestation Provider

Figure 8 shows the possible states of a PID Provider or Attestation Provider.

![Figure 8](media/Figure_8_Statechart_PID_Provider_Attestation_Provider.png) <!-- <img src="media/Figure_8_Statechart_PID_Provider_Attestation_Provider.png" style="width:4.5927395013123355in;height:4.538937007874016in" /> -->

Figure 8: State diagram of PID Provider or Attestation Provider

The **Valid** state is the first state of a PID Provider or Attestation Provider. This means it is registered by the corresponding Trusted List Provider and notified to the Commission, as described in [Section 6.3.2](#632-pid-provider-or-attestation-provider-registration-and-notification).

The Trusted List Provider can temporarily suspend a PID Provider or Attestation Provider.  This leads to the **Suspended** state. The Trusted List Provider can unsuspend the PID Provider or Attestation Provider, bringing it back to the **Valid** state. The Trusted List Provider can also decide to completely withdraw the PID Provider or Attestation Provider, which brings the it in the **Withdrawn** state. For more information about suspension or withdrawal, please refer to [Section 6.3.3](#633-pid-provider-or-attestation-provider-suspension-or-withdrawal). A suspended or withdrawn PID Provider or Attestation Provider cannot issue PIDs or attestations to Wallet Units, nor will a PID or attestation issued by such a PID Provider or Attestation Provider be accepted by Relying Parties.

#### 4.6.5 PID or attestation

Figure 9 shows the possible states of a PID or attestation.

In the context of the EUDI Wallet ecosystem, a PID or attestation begins its lifecycle when being issued to a Wallet Unit. Please note that this means that the management of attributes in the Authentic Source (adhering to national structures and attribute definitions) is outside of the scope of the ARF.

For certain use cases, a PID or attestation may be pre-provisioned, meaning it is not yet valid when issued. In that case, its state is **Issued**, and it will transition to **Valid** when it reaches the beginning of its validity period. However, if a PID or attestation is issued on or after the validity start date, its state directly changes to **Valid**.

![Figure 9](media/Figure_9_Statechart_PID.png) <!-- <img src="media/Figure_9_Statechart_PID.png" style="width:4.34150699912511in;height:4.624997812773404in" /> -->

Figure 9: State diagram of PID or attestation

There are two possible transitions for a valid PID or attestation: it expires by passing through the validity end date and transitions to the **Expired** state, or it is revoked by its PID Provider or Attestation Provider, ending up in the **Revoked** state. Expiration and revocation are independent transitions. Once a PID or attestation is expired or revoked, it cannot transition back to **Valid**.

#### 4.6.6 Relying Party

Figure 10 shows the possible states of a Relying Party.

![Figure 10](media/Figure_10_Statechart_Relying_Party.png) <!-- <img src="media/Figure_10_Statechart_Relying_Party.png" style="width:4.34150699912511in;height:4.624997812773404in" /> -->

Figure 9: State diagram of Relying Party

The **Valid** state is the first state of a Relying Party. This means it has been registered by a Relying Party Registrar, as described in [Section 6.4.2](#642-relying-party-registration).

The Registrar can de-register a Relying Party.  This leads to the **Invalid** state. For more information about de-registration, please refer to [Section 6.4.3](#643-relying-party-de-registration). A Wallet Unit will not present a PID or attestation to a Relying Party that is in this state.

## 5 Data model

### 5.1 Introduction

Within the EUDI Wallet ecosystem, data is exchanged in the form of Electronic Attestations of Attributes (EAA), hereafter referred to as "attestations." Apart from EAA, the Regulation explicitly defines another category of data, called Person Identification Data (PID), which establishes the identity of a natural person or a legal person. PID can only be issued by a PID provider operating under the supervision of the Member State. Each PID and attestation consists of the following key elements:

- A set of **attributes**, which provide information about the subject of the attestation. The subject of the PID or attestation may be a natural person or a legal person. A Relying Party will request one or more of these attributes to get the reliable information they need to provide some service to the User. The set of attributes that an attestation may contain is defined in an attribute schema, see below.
  
- A set of **metadata**, meaning information about the attestation itself, such as its attestation type (PID, mDL, diploma, etc.), its Attestation Provider, and its administrative validity period, if applicable. This kind of metadata is also defined in an attribute schema. In addition, metadata also includes information that is necessary to ensure the security of the attestation. This includes at least its technical validity period. It also includes a public key of the attestation, which a Relying Party will use to verify that the attestation was not copied, see [Section 6.6.3.8](#6638-relying-party-instance-verifies-device-binding). It may also include information allowing the Relying Party to verify that the attestation was not revoked, see [Section 6.6.3.7](#6637-relying-party-verifies-that-the-pid-or-attestation-is-not-revoked).

- A **proof**, which ensures the integrity, authenticity, and support of selective disclosure of the attestation. The format of the proof complies with the proof mechanism specified for this type of attestation, see below. The proof includes information that enables a Relying Party to verify the proof, for example a Attestation Provider certificate and a reference to a trust anchor that can be used to verify that certificate.

An **attribute schema** defines the logical organisation of all mandatory and optional attributes within an attestation, as well as the format of each attribute, meaning its unique identifier, encoding, allowed values, and serialisation. In addition, an attribute schema specifies some of the attestation metadata, such as its attestation type and information about its Attestation Provider, validity period, etc. Within the EUDI Wallet ecosystem, the attribute schema for each attestation type is specified by an Attribute Schema Provider in an Attestation Rulebook according to [Section 5.5](#55-attestation-rulebooks).

A **proof mechanism** defines the method used to create the attestation proof. For example, a 'standard' digital signature is a proof ensuring integrity and authenticity, but not allowing selective disclosure. Proof mechanisms are specified in standards or technical specifications. The attestation formats listed in [Section 5.4](#54-standardised-attestation-formats) either specify a proof mechanism that allows for selective disclosure, or leave it to other technical specifications to do so.

### 5.2 Attestation categories

Within the European Digital Identity Wallet ecosystem, the Regulation distinguishes four legal categories of attestations, which are defined as follows:

- **Person Identification Data (PID)**: A set of data that is issued in accordance with Union or national law and that enables the establishment of the identity of a natural or legal person, or of a natural person representing another natural person or a legal person.

- **Qualified Electronic Attestation of Attributes (QEAA)**: An electronic attestation of attributes which is issued by a qualified trust service provider (QTSP) and meets the requirements laid down in Annex V of the Regulation.

- **Electronic attestation of attributes issued by or on behalf of a public sector body responsible for an authentic source (PuB-EAA)**: An electronic attestation of attributes issued by a public sector body that is responsible for an authentic source or by a public sector body that is designated by the Member State to issue such attestations of attributes on behalf of the public sector bodies responsible for authentic sources in accordance with Article 45f and with Annex VII of the Regulation.

- **Non-Qualified EAA:** An EAA which is not QEAA or PuB-EAA.

Please note that the differences between these attestation categories are purely legal. For example, a diploma may be a QEAA or a non-qualified EAA, depending on whether it is issued by a qualified trust service provider (QTSP) or by an unqualified one. Similarly, an mDL may be issued as a PuB-EAA, a QEAA, or a non-qualified EAA, depending on the legal status of the party issuing mobile driving licences in each Member State. From a technical point of view, all PIDs, QEAAs, PuB-EAAs, and EAAs comply with one of the attestation formats listed in [Section 5.4](#54-standardised-attestation-formats).

### 5.3 PID

Besides the fact that the Regulation defines the PID as a category of data that is legally different from EAAs, another difference between PID and EAA is that the presence or absence of a valid PID determines whether a Wallet Unit is in the Operational or the Valid state, as discussed in [Section 4.6.3](#463-wallet-unit). 

As implied in that section, it is possible for a Wallet Unit to contain multiple PIDs. In fact,  if the User has multiple nationalities, they may be able to receive a PID from multiple PID Providers in a single Wallet Unit. However, please note that a Wallet Provider is free to decide that its Wallet Unit does not support all PID Providers, and that, conversely, a PID Provider may decide that it does not support all Wallet Solutions; see [Section 6.5.2.3](#6523-user-validates-that-wallet-solution-is-usable-with-relevant-pids). Note that in this situation, the subject of all PIDs in the Wallet Unit will be the same person, namely the User of the Wallet Unit.

Additionally, a Wallet Unit may contain multiple PIDs, where these PIDs have different subjects. This may happen in case the User is a natural person representing another natural person or a legal person. Examples of this include a parent holding the PID of a child, or a guardian holding the PID of a disabled or elderly person they can legally represent, or a company owner holding a legal-person PID for their company. However, such a situation may lead to operational complexities. In general, how to handle legal representation use cases within the EUDI Wallet ecosystem is a topic that will be further discussed with Member States in the future.

### 5.4 Standardised attestation formats

Within the EUDI Wallet ecosystem, the following suitable standardised formats for electronic attestations of attributes are (potentially) used:

1. The ISO/IEC 18013-5 standard defines an attribute schema, data format and proof mechanisms for mobile driving licences, which can be used also for other types of attestations, see [ISO/IEC 18013-5].
2. SD-JWT-based Verifiable Credentials (SD-JWT VC) defines a proof mechanism similar to [ISO/IEC 18013-5], but for a different data format, see [SD-JWT VC].
3. W3C Verifiable Credentials Data Model v1.1 [W3C VC DM v1.1] defines a generic attribute schema agnostic to data formats and proof mechanisms, while v2.0 introduces requirements on format and recommendations on proof mechanisms, see [W3C VC DM v2.0].

[Topic 12] states the requirements regarding support for these specifications.

### 5.5 Attestation Rulebooks

This section specifies the concept of an Attestation Rulebook. For each type of attestation, such as a PID, an mDL, a diploma, or an e-prescription, an Attestation Rulebook specifies the attribute schema and proof mechanisms of that attestation, and, when required, the trust mechanisms for authentication and authorisation. Each attestation has an attestation type. The attribute schema specified in the Attestation Rulebook defines the unique identifier, syntax, and semantics of all attributes that can be part of that attestation.

An Attestation Rulebook also makes some choices regarding the protocol(s) for presentation that must be supported by the relevant attestations. [Topic 12] contains the requirements for Attestation Rulebooks.

Attestation Rulebooks are defined by Attribute Schema Providers, see [Section 3.15](#315-attribute-schema-providers-for-qeaa-pub-eaa-and-eaa). This role can be assumed by different types of organisation:

- Some Rulebooks already have been defined by the European Commission, in consultation with the eIDAS Expert Group. This concerns the PID Rulebook and the mDL Rulebook. These can be found in [Annex 3](#annex-3) of this ARF.
- The Rulebook for an attestation intended to be used across organisations and/or across borders can be defined by an organisation in which, insofar possible, all stakeholders are represented. This will prevent multiple Attestation Rulebooks being defined for the same type of attestation, for example, diplomas. It will also prevent unnecessary differences in the syntax and semantics between similar attestations. The decision on which organisation will be responsible for a given Attestation Rulebook is out of scope for this document. As explained in [Topic 12], it is possible that an individual Attestation Provider needs to include attributes in an attestation that have not been specified in the relevant sectoral or EU-wide Rulebook. An example of this are attributes that only have a meaning within the Member State in which the Attestation Provider resides. To allow such domestic attributes, an Attestation Provider can define a custom Rulebook to specify attributes that are specific to this Provider and are not included in the EU-wide or sectoral Rulebook.
- The Rulebook for an attestation intended to be used only within an organisation will be defined by that organisation.

### 5.6 Catalogues

Section 2 in [Article 45e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3883-1-1) of the regulation, sets up the direct legal basis for the Commission to "where necessary, establish specifications and procedures for the catalogue of attributes and schemes for the attestation of attributes and verification procedures for qualified electronic attestations of attributes".

One of the main rationales for the ARF is to reach a high level of interoperability. This interoperability can be achieved on different layers. On the technical level, interoperability can be achieved by using common standards, protocols and technical specifications, ensuring common language for Attestation Providers, Wallet Providers and Relying Parties, enabling issuance, presentation and processing of attestations, based on agreed common protocols interfaces and syntax.

The other layer is the semantic one and relates to semantic schemes of attributes. The risk is that an uncontrolled manner of implementation and usage will create barriers and complicate the implementation, thus making the ecosystem much more costly to create and maintain, complex, and error-sensitive, affecting the quality of the overall system.

For the development and success of the EUDI Wallet ecosystem, re-using the building blocks of attributes and attestations is therefore essential. Creating and maintaining controlled vocabularies, a catalogue of attributes, and attestation rulebooks enables shorter 'time-to-market' and efficient implementation.

Building on the requirements of [Topic 12], having in mind both the need for interoperability on the one hand and the varied nature of attestations and organisations specifying those attestations on the other hand, the following principles were defined:

- Attestation Rulebooks for QEAAs and PuB-EAAs used within the EUDI Wallet ecosystem may be registered and published in a publicly accessible catalogue. The Attestation Rulebook catalogue may also include Attestation Rulebooks for non-qualified EAAs.
- The Commission will take measures to establish and maintain the Attestation Rulebooks catalogue.
- The Attestation Rulebooks catalogue will enable Attestation Providers, Relying Parties and other actors in the EUDI Wallet ecosystem to know which attestation types exist, and what are the identifiers, syntax, and semantics of all attributes that are part of the attestation.

Also, the following points are emphasised, to facilitate creation and adoption:

- Registration of an Attestation Rulebook in the Attestation Rulebook catalogue is not mandatory.
- Registration does not create any obligation or automatic acceptance by any third party, or automatically implies cross-border recognition of the type of attestation described in the Rulebook.
- The Attestation Rulebooks catalogue can be in the same environment as the catalogue of attributes.

Implementation of these principles will be discussed further in detail. The ambition is to use existing efforts and tools created by the Member States, the Commission and cross-border organisations, to connect and interact with the stakeholders, to utilise existing data assets for updating them when needed and add new data sets to support new use cases that will be implemented in the EUDI Wallet ecosystem.

[Topic 25] and [Topic 26] (combined into one topic), present the current and foreseen status of the catalogues, their creation, distribution, discovery, management and maintenance, that will allow simple update procedures, not burdening the process on the one hand, while ensuring consistent and on-going mechanisms to keep the catalogues updated and accessible to the relevant actors, both those that create the content and those that use, consume and process the attributes and the attestations, and - last but not least - for the general public.

## 6 Trust model

### 6.1 Overview

#### 6.1.1 Scope

The trust model presented in this chapter describes, for all interactions between components of the EUDI Wallet ecosystem, which trust relationships are established between the interacting parties to enable these interactions.

![Figure 11](media/Figure_11_Trust_Model.jpeg) <!-- <img src="Figure_11_Trust_Model.jpeg" style="width:7.16666447944007in;height:5.281294838145232in" /> -->

Figure 11: EUDI Wallet trust architecture

Figure 11 above shows the parties and components that are involved in the trust architecture for the EUDI Wallet ecosystem.

In the center of this ecosystem is the **Wallet Unit**, shown in the top middle in blue. [Section 6.5](#65-trust-throughout-a-wallet-unit-lifecycle) describes the interactions between the Wallet Unit and other roles in the ecosystem in the lifecycle of a Wallet Unit, namely installation, activation, management, and de-installation.

A Wallet Unit is a unique configuration of a Wallet Solution, including a Wallet Instance and one or more WSCA/WSCDs, provided by a **Wallet Provider**. The Wallet Instance is an instance of the Wallet Provider's Wallet Solution. Figure 11 positions the Wallet Provider above the Wallet Unit and depicts the Wallet Provider Trusted List Provider (TLP) located in the lower right corner for each Member State. [Section 6.2](#62-trust-throughout-a-wallet-solution-lifecycle) elaborates on the interactions among these entities throughout the lifecycle of a Wallet Solution and Wallet Provider, including processes such as registration and potential withdrawal or suspension. The Wallet Provider manages the latter by issuing a **Wallet Unit Attestation (WUA)** to a Wallet Unit and, when necessary, revoking it.

One of the main functions of the Wallet Unit is to handle the User's PID(s) and attestations (QEAAs, PuB-EAAs and non-qualified EAAs). The PID(s) are issued by **PID Providers** and the attestations by **Attestation Providers**, shown to the left of the Wallet Unit in Figure 11. Like Wallet Providers, PID Providers and Attestation Providers are registered by a **PID Provider Trusted List Provider** (TLP) or by an **Attestation Provider Trusted List Provider** before they can interact with a Wallet Unit, and before a Relying Party can verify the PID(s) or attestation those Providers issue. As a result of the registration, a PID Provider or an Attestation Provider receives an access certificate from a **PID Provider Access Certificate Authority (CA)** or from an **Attestation Provider Access CA,** accordingly. [Section 6.3](#63-trust-throughout-a-pid-provider-or-an-attestation-provider-lifecycle) describes interactions between these roles in the lifecycle of a PID Provider or an Attestation Provider, namely registration, and possibly withdrawal and suspension.

After receiving one or more PIDs or attestations, a Wallet Unit can present User attributes from these attestations to **Relying Party Instances**. These are shown on the right-hand side of the Wallet Unit in Figure 11. A Relying Party Instance is a combination of hardware and software used by a **Relying Party** to interact with a Wallet Unit. A Relying Party can use multiple Relying Party Instances, especially in case the interactions with the Wallet Unit take place in proximity. Relying Parties are registered by a **Relying Party Registrar** in their Member State. As a result of the registration, a Relying Party receives an Access certificate for each of its Relying Party Instances from a **Relying Party Instance Access CA**. In addition, the Relying Party also receives a **Relying Party registration certificate** from the Registrar. [Section 6.4](#64-trust-throughout-a-relying-party-lifecycle) describes interactions between these roles in the lifecycle of a Relying Party, namely registration, and possibly de-registration.

Finally, [Section 6.6](#66-trust-throughout-a-pid-or-an-attestation-lifecycle) describes interactions in the lifecycle of a PID or an attestation, namely issuance, presentation to a Relying Party or to another Wallet Unit, management, and deletion.

Notes:

- This trust model is conceptual and may be implemented by Member States in different ways. For example, the different Trusted Lists may be implemented as a single list, provided that this list clearly indicates which trust anchors can be used for which purposes. Similarly, a Member State may decide to combine multiple Trusted List Providers and/or Certificate Authorities into a single entity, again provided that that entity maintains clear separations between its different roles and responsibilities. In some case, existing entities can probably be used to fulfil these roles.
- For PIDs, qualified EAAs, and PuB-EAAs, interoperability is required (see [Section 4.2.2](#422-interoperability)) and therefore, this trust model will be implemented using X.509 certificates and X.509-based Certificate Authorities according to [[RFC5280](https://datatracker.ietf.org/doc/html/rfc5280)] and [[RFC3647](https://datatracker.ietf.org/doc/html/rfc3647)]. The same is true for non-qualified EAAs complying with [ISO/IEC 18013-5]. However, for non-qualified EAAs complying with [SD-JWT VC] or [W3C VC DM v1.0 or 2.0], other trust frameworks may be used.
- This trust model is valid for both remote and proximity use cases. However, technical measures taken to ensure that the requirements on trust are fulfilled may differ between these two use cases. Moreover, the authentication and authorisation mechanisms will depend on the characteristics of the interacting parties.
- In this version of the ARF, the trust model does not yet include interactions needed to enable Users to create qualified electronic signatures or seals. Please refer to [Topic 16] and [Topic 37].

#### 6.1.2 Risks and mitigation measures

##### 6.1.2.1 Introduction

This section briefly discusses some of the risks that were considered when this trust model was created, together with the mitigations for these risks and the residual risks that remain after these mitigations. This section is not intended to be a comprehensive risk register for the EUDI Wallet ecosystem as a whole; for that register, see [Risk Register]. This section is limited to the scope of the ARF, namely, the Wallet Unit and its interactions with other parties in the ecosystem, as depicted in Figure 11.

##### 6.1.2.2 Risks and mitigation measures related to confidentiality, integrity, and authenticity

Within the EUDI Wallet ecosystem, many interactions take place between parties in which one party requests another party to perform a task. For example, a User may ask a PID Provider or an Attestation Provider to provide a PID or an attestation to a Wallet Unit, or a Relying Party may ask a User to present attributes from an attestation in their Wallet Unit.
For any of these interactions, the following risks apply:

- An attacker could impersonate one of the interacting parties. Therefore, the receiver of a message must be able to verify the identity of the sender. In other words, mutual authentication is needed. This authentication can be performed because valid parties in the EUDI Wallet ecosystem are put on a Trusted List by Member States. By verifying the signature over a message and verifying the associated public key certificates with a trust anchor included in a Trusted List, the receiver of a message can be sure about the identity of the message's sender.
- Messages between parties could be intercepted, meaning that they could be read by an attacker. To mitigate this risk, messages must be encrypted to ensure confidentiality.
- Intercepted messages could be changed by an attacker. To mitigate this risk, messages must be authenticated, so that the receiver can verify that originate from the authenticated sender and were not changed.

##### 6.1.2.3 Risks and mitigation measures related to tampering of cryptographic keys and sensitive data

The mechanisms for authentication and confidentiality described in the previous section rely on the security of cryptographic keys, especially private and secret keys. If an attacker can obtain, use, or tamper with these keys, these security mechanisms would break down. Therefore, all cryptographic keys are managed by dedicated secure applications (WSCAs), running on secure hardware (WSCDs), as described in [Section 4.3](#43-reference-architecture). The security of WSCDs and WSCAs is ensured by means of an appropriate certification process.

These mitigation measures apply for all entities in the EUDI Wallet ecosystem that use cryptographic keys, including Wallet Units, Wallet Providers, PID Providers and Attestation Providers, Trusted List Providers, and Certificate Authorities. For Relying Parties and Relying Party Instances, such measures are formally not required.

WSCDs and WSCAs in a Wallet Unit may also be used to store other sensitive data except cryptographic keys. In particular, they could be used to store User attributes, in such a way that attackers, including malicious applications residing on the same User device as the Wallet Instance, cannot retrieve these attributes. This is beneficial for User privacy.

##### 6.1.2.4 Risks and mitigation measures related to authorisation

In some cases, there is a risk that a valid party in the EUDI Wallet ecosystem tries to perform actions that it is not allowed to do. This risk occurs for mainly two types of parties. In the first place, a non-qualified EAA Provider may try to issue attestations it is not entitled to issue. For example, an Attestation Provider that is not officially entitled by a Member State (or by some other relevant authority) to issue diplomas may nevertheless attempt to issue an attestation having the diploma attestation type. Within the EUDI Wallet ecosystem this risk only applies to non-qualified EAA Providers. PID Providers, QEAA Providers and PuB-EAA Providers are assumed to be trustworthy in this regard. For more information, see [Section 6.3.2.2](#6322-pid-provider-or-attestation-provider-receives-an-access-certificate). That section also explains how this risk is mitigated.

A second case of a valid party in the EUDI Wallet ecosystem that may try to do things that it is not allowed to do, is a Relying Party trying to request attributes from a Wallet Unit for which they have no lawful grounds. This risk is mitigated mainly by three measures:

- First of all, the attestation formats and protocols specified in [ISO/IEC 18013-5] and [SD-JWT] + [OpenID4VP] allow selective disclosure of attributes. This means that a Relying Party can specify which of the attributes in an attestation it wishes to receive, and which ones not. This feature is sometimes called collection limitation. Next, selective disclosure also allows the User to approve or deny the presentation of the requested attributes. More information on selective disclosure and User approval can be found in [Section 6.6.3.5](#6635-wallet-unit-obtains-user-approval-for-presenting-selected-attributes).
- Secondly, the Regulation requires each Relying Party to register the attributes it intends to request from Users. [CIR 2024/2982] requires that these registered attributes are included in a so-called Relying Party registration certificate, and that a Wallet Unit must be able to display information from this registration certificate to the User. This allows the User to make a considered decision to approve or deny the presentation of the requested attributes. For more information, see [Section 6.6.3.3](#6633-wallet-unit-allows-user-to-verify-that-relying-party-does-not-request-more-attributes-than-it-registered).
- Lastly, the Regulation requires that an Attestation Provider is able to embed a disclosure policy into their attestations. This policy may contain rules determining whether the Attestation Provider approves of the release of one or more of the requested attributes to the authenticated Relying Party. The Wallet Unit evaluates the policy (if present in the attestation) in combination with authenticated data provided by the Relying Party, and informs the User about the outcome of the evaluation. Again, this allows the User to make a considered decision to approve or deny the presentation of the requested attributes. More information can be found in [Section 6.6.3.4](#6634-wallet-unit-evaluates-disclosure-policy-embedded-in-attestation-if-present).

##### 6.1.2.5 Risks and mitigation measures related to User tracking

The privacy of Users is a major concern in the design and implementation of the EUDI Wallet ecosystem. Attributes are presented in the form of electronic attestations of attributes complying with the format specified in either [ISO/IEC 18013-5] or [SD-JWT VC]. A property of such attestation is that they contain a number of elements with a unique and fixed value, such as salts, hashes, public keys, and signature values. By storing and comparing these values across many transactions, malicious Relying Parties would be able to find matching values. They would then conclude that the same User was involved in these transactions. This could be done within one Relying Party, but also between multiple colluding Relying Parties. This form of tracking is called Relying Party linkability.

Another form of tracking is called Attestation Provider linkability. Here, Relying Parties share the unique values they received with a colluding and malicious Attestation Provider. This would allow that Attestation Provider to track the User's behaviour across all colluding Relying Parties.

Regarding the mitigation of these risks:

- An (honest) PID Provider or Attestation Provider can partly or fully prevent Relying Party linkability of the PIDs or attestations it issues, at the cost of issuing multiple PIDs and attestations to the same User. This is a topic that will be further discussed for ARF 2.0. In addition, organisational and repressive measures can be used to discourage Relying Parties from colluding and tracking Users. In particular, Relying Parties found offending will have their access certificate revoked, after which they will not be able to interact with Wallet Units anymore.
- Attestation Provider linkability cannot be prevented for attestations in [ISO/IEC 18013-5] or [SD-JWT VC]-compliant format. The only technical way to mitigate this risk is by using Zero-Knowledge Proofs (ZKPs), instead of the salted-attribute hashes used by these formats.However, at the moment, using ZKPs is not feasible within the EUDI Wallet ecosystem, due to a lack of support for them in currently available secure hardware (WSCDs). This topic will be further explored for ARF 2.0. Like for Relying Party linkability, organisational and repressive measures can be used to discourage Attestation Providers from colluding and tracking Users. In addition, many Attestation Providers are subject to regular audits, which means that collusion and tracking can more easily be detected than for Relying Parties.

Additional risks of User tracking may arise from the communication protocols used between Wallet Units and Relying Party Instances, such as HTTP, TLS, NFC, or BLE. If not properly used, these protocols could use fixed identifiers and other values, which would allow Relying Parties to track Users. Typically, these communication protocols are handled by the OS of the User device. These risks are therefore out of scope of this ARF and will be dealt with in the Wallet Solution certification process.

#### 6.1.3 Other trust relations

Besides the trust relationships described in this chapter, other trust relations are established as well. For instance, Users, PID Providers, Attestation Providers, and Relying Parties trust certification bodies and Trusted List Providers. This trust is primarily rooted in authority and in procedural measures, such as public oversight, published security and operational policies, and audits, rather than in technical measures. To verify that parties are indeed interacting with a trusted authority, standard technical measures suitable for the context will be used.

### 6.2 Trust throughout a Wallet Solution lifecycle

#### 6.2.1 Wallet Solution lifecycle

[Section 4.6.2](#462-wallet-solution) presented the lifecycle of a Wallet Solution:

1. The Wallet Provider responsible for the Wallet Solution is registered by a Trusted List Provider. As a result, the Wallet Solution enters the Valid state. This is discussed in [Section 6.2.2](#622-wallet-provider-registration-and-notification).
2. Under specific conditions, a Trusted List Provider may decide to suspend or withdraw a registered Wallet Provider. This is discussed in [Section 6.2.3](#623-wallet-provider-suspension-or-withdrawal).

#### 6.2.2 Wallet Provider registration and notification

Figure 11 depicts the Wallet Provider to the top of the Wallet Unit. To the left and below of this, the figure also shows that a Wallet Provider registers itself and its Wallet Solution with a Wallet Provider Trusted List Provider in its Member State. Subsequently, the Member State notifies the Wallet Provider to the European Commission.

The Wallet Solution provided by the Wallet Provider is certified as described in [Chapter 7](#7-certification-and-risk-management).

If the registration and notification processes are successful, the trust anchors of the Wallet Provider are included in a Wallet Provider Trusted List. During issuance of a PID or an attestation, the PID Provider or the Attestation Provider can use these trust anchors to verify the authenticity of a Wallet Unit Attestation signed by the Wallet Provider, so they can be sure they are dealing with an authentic Wallet Unit from a trusted Wallet Provider. See [Section 6.6.3.2](#6632-wallet-unit-authenticates-the-relying-party-instance) and [Topic 9]. Similarly, when the Wallet Unit presents a PID or an attestation to a Relying Party, the Relying Party can use the Wallet Provider trust anchors to verify the authenticity of a Wallet Unit Attestation signed by the Wallet Provider; see [Section 6.6.3.11](#66311-relying-party-instance-authenticates-the-wallet-unit-and-the-wallet-provider) and [Topic 38].

If a certain entity offers multiple Wallet Solutions, they will register as a separate Wallet Provider for each of these Wallet Solutions. This implies that such an entity will register different trust anchors for each of their Wallet Solutions.

More details on the Wallet Provider notification process can be found in [Topic 31].

#### 6.2.3 Wallet Provider suspension or withdrawal

Under specific conditions, a Trusted List Provider may decide to suspend or withdraw a Wallet Provider. This implies that the Wallet Provider's status in the respective Trusted List will be changed to Invalid. The conditions for this will be specified by each Trusted List Provider. As a result of de-registration, PID Providers, Attestation Providers and Relying Parties will no longer trust the trust anchors of the Wallet Provider and will therefore refuse to interact with any Wallet Unit provided by that Wallet Provider.

When a Trusted List Provider suspends or withdraws a Wallet Provider, the Wallet Provider revokes all of their WUAs as described in [Section 6.6.3.12](#66312-relying-party-verifies-that-wua-is-not-revoked).

If an entity has registered multiple Wallet Providers, each offering a different Wallet Solution, and one of these Wallet Providers is suspended or withdrawn, only the applicable Wallet Solution will be impacted. It may happen that the reason for suspension or withdrawal is applicable to all Wallet Solutions offered, in which case all of the Wallet Providers registered by that entity will be withdrawn or suspended separately.

### 6.3 Trust throughout a PID Provider or an Attestation Provider lifecycle

#### 6.3.1 PID Provider or Attestation Provider lifecycle

[Section 4.6.4](#464-pid-provider-or-attestation-provider) presented the lifecycle of a PID Provider or Attestation Provider:

1. A PID Provider or an Attestation Provider is registered by a Trusted List Provider. This is discussed in [Section 6.3.2](#632-pid-provider-or-attestation-provider-registration-and-notification).
2. Under specific conditions, a Trusted List Provider may decide to suspend or withdraw a registered PID Provider or Attestation Provider. This is discussed in [Section 6.3.3](#633-pid-provider-or-attestation-provider-suspension-or-withdrawal).

#### 6.3.2 PID Provider or Attestation Provider registration and notification

##### 6.3.2.1 Introduction

Figure 11 depicts the PID Providers and Attestation Providers to the left of the Wallet Unit. To the left and below of this, the figure also shows that each PID Provider and Attestation Provider will register itself with a PID Provider Trusted List Provider or an Attestation Provider Trusted List Provider in its Member State. Subsequently, the Member State notifies the PID Provider or Attestation Provider to the European Commission.

If the registration and notification processes are successful, mainly two things happen:

- The PID Provider or Attestation Provider receives an access certificate.
- The trust anchors of the PID Provider or Attestation Provider are included in a Trusted List.

These two processes are discussed in the next two subsections.

##### 6.3.2.2 PID Provider or Attestation Provider receives an access certificate

When a PID Provider or Attestation Provider is registered by a Member State, a PID Provider Access Certificate Authority (CA) or Attestation Provider Access Certificate Authority issues one or more access certificates to the PID Provider or to the Attestation Provider. A PID Provider or an Attestation Provider needs such a certificate to authenticate itself towards a Wallet Unit when issuing a PID or an attestation to it, as described in [Section 6.6.2.2](#6622-wallet-unit-authenticates-the-pid-provider-or-attestation-provider). A PID Provider access certificate indicates that its subject is a PID Provider. Similarly, an Attestation Provider access certificate indicates that its subject is a QEEA Provider, a PuB-EAA Provider or a non-qualified EAA Provider.

Subsequently, the Access Certificate Authority is included in a PID Provider Access CA Trusted List or Attestation Provider Access CA Trusted List. This Trusted List contains at least the trust anchor(s) of the CA. A Wallet Unit can use these trust anchors to verify the authenticity of a PID Provider or an Attestation Provider access certificate during the issuance of a PID or an attestation. For more information, see [Topic 31].

Note that, in case the subject is an Attestation Provider, the access certificate does not contain further information about its authorisation or registration to issue attestations of a specific type, for instance an mDL or diploma. Authorisation is dealt with in the following manner:

- For QEAA Providers and Pub-EAA Providers, no authorisation is necessary, since these kinds of Providers are trusted by other actors in the EUDI Wallet ecosystem to not fraudulently issue attestations that they are not legally allowed to issue. This trust is warranted since these kinds of Providers operate within a regulated framework and are regularly audited.

- For non-qualified EAA Providers, this is different, since they are unregulated and may not be completely trustworthy. Without additional measures, a fraudulent EAA Provider may be technically able to issue types of QEAAs, PuB-EAAs or EAAs that it is not legally allowed to issue. To prevent this, the applicable Rulebook (see [Topic 12]) may define mechanisms allowing a Wallet Unit, during issuance of an EAA, to verify that the EAA Provider is authorised or registered to issue the type of EAA the Wallet Unit is requesting. The same mechanism may also be used by Relying Parties during presentation of an EAA.

##### 6.3.2.3 PID Provider or Attestation Provider trust anchors are included in a Trusted List

For a PID Provider, a QEAA Provider, or a PuB-EAA Provider, successful registration and notification also means that the Provider is notified to the European Commission and that its trust anchors are included in a Trusted List. Relying Parties can use these trust anchors to verify the authenticity of PIDs, QEAAs, and PuB-EAAs they obtain from Wallet Units.

Non-qualified EAA Providers are not included in a Trusted List by a Member State. However, if a Relying Party requests a non-qualified EAA from a Wallet Instance, it must know how to obtain the domain-specific trust anchor it needs to verify the signature over that EAA. To help with this, [Topic 12] recommends that the applicable Rulebook specifies the mechanisms enabling this. This mechanism may be similar to the one for QEAAs, namely that the relevant non-qualified EAA Providers and their trust anchors are included in a trusted list. However, other methods may be used as well, and even if such a trusted list exists, it does not have to comply with the requirements in [Topic 31].

More details on the PID Provider or Attestation Provider notification process, as well as on the information registered and published in the PID Provider Trusted List or Attestation Provider Trusted List, can be found in [Topic 31].

#### 6.3.3 PID Provider or Attestation Provider suspension or withdrawal

Under specific conditions, a Trusted List Provider may decide to suspend or withdraw a registered PID Provider or Attestation Provider. The conditions for this will be specified by each Trusted List Provider.

Suspension or withdrawal implies that the PID Provider or Attestation Provider access certificates are revoked. As a result, the PID Provider or Attestation Provider will no longer be able to issue PIDs or attestations to Wallet Units.

For a PID Provider, QEAA Provider or PuB-EAA Provider, suspension or withdrawal also implies that its status in the respective Trusted List will be changed to Invalid. As a result, Relying Parties will no longer trust PIDs or attestations issued by the suspended or withdrawn Provider. For non-qualified EAA Providers, the applicable Rulebook (see [Topic 12]) may define additional mechanisms ensuring that Relying Parties will no longer trust the trust anchors of EAA Providers that have been suspended or withdrawn.

When a Trusted List Provider suspends or withdraws a PID Provider or Attestation Provider, the PID Provider or Attestation Provider revokes all of their PIDs or attestations as described in [Section 6.6.3.7](#6637-relying-party-verifies-that-the-pid-or-attestation-is-not-revoked).

### 6.4 Trust throughout a Relying Party lifecycle

#### 6.4.1 Relying Party lifecycle

[Section 4.6.4](#464-Relying-Party) presented the lifecycle of a Relying Party:

1. A Relying Party is registered by a Registrar in the Member State where it resides. Relying Party registration is discussed in [Section 6.4.2](#642-relying-party-registration).
2. Under specific conditions, a Registrar may decide to de-register a registered Relying Party. This is discussed in [Section 6.4.3](#643-relying-party-de-registration).

#### 6.4.2 Relying Party registration

Figure 11 depicts the Relying Party Instance to the right of the Wallet Unit. A Relying Party Instance is a combination of hardware and software used by a Relying Party to interact with a Wallet Unit. A Relying Party can use multiple Relying Party Instances, especially in case the interactions with the Wallet Unit take place in proximity, for instance, a border control agency at an aiport employing multiple lines where arriving passengers can present their PID.

Figure 11 also shows the Relying Party. Below that, it shows that each Relying Party will register itself with a Relying Party Registrar in its Member State. If the registration process is successful, the Registrar includes the Relying Party in its public registry.

As a result of successful registration,

- the Registrar issues a registration certificate to the Relying Party. The purpose of the registration certificate is described in [Section 6.6.3.3](#6633-wallet-unit-allows-user-to-verify-that-relying-party-does-not-request-more-attributes-than-it-registered).
- a Relying Party Instance Access Certificate Authority (CA) associated with the Registar issues an access certificate to each Relying Party Instance of the Relying Party. A Relying Party Instance needs such a certificate to authenticate itself towards Wallet Units when requesting the presentation of attributes, as described in [Section 6.6.3.2](#6632-wallet-unit-authenticates-the-relying-party-instance).

Subsequently, a Trusted List Provider in each Member State creates a Relying Party Instance Access CA Trusted List containing the trust anchor(s) of all associated Relying Party Instance Access CA(s). A Wallet Unit can use these trust anchors to verify the authenticity of Relying Party Instance access certificates. The Trusted List Provider signs and publishes the Relying Party Instance Access CA Trusted List and makes the URL of the Trusted List available to a common trust infrastructure maintained by the Commission, the so-called List of Trusted Lists. Using the common infrastructure, any party in the EUDI Wallet ecosystem will be able to find all Trusted Lists in the ecosystem.

More details on the Relying Party registration process can be found in [Topic 27].

#### 6.4.3 Relying Party de-registration

Under specific conditions, a Registrar may decide to de-register a registered Relying Party. The conditions for this will be specified by each Registrar.

De-registration involves revocation of all valid Relying Party Instance access certificates by the relevant Access CA, such that the Relying Party is no longer able to interact with Wallet Units.

### 6.5 Trust throughout a Wallet Unit lifecycle

#### 6.5.1 Wallet Unit lifecycle

[Section 4.6.3](#463-wallet-unit) above presented the lifecycle of a Wallet Unit:

1. The Wallet Instance that is part of the Wallet Unit is installed on a device by a User. The required trust relationships for installation are discussed in [Section 6.5.2](#652-wallet-instance-installation) below.
2. Next, the Wallet Unit is activated by the Wallet Provider and the User and becomes operational. The goals and required trust relationships for activation are discussed in [Section 6.5.3](#653-wallet-unit-activation).
3. Once in the **Operational** or **Valid** state, the Wallet Unit is managed by the User and the Wallet Provider. This management includes at least revoking the Wallet Unit when necessary. This is discussed in [Section 6.5.4](#654-wallet-unit-management). Management will also include regular updates of the Wallet Instance application to ensure its continued security and functionality. However, this is not further defined in this chapter.
4. The User may de-install the Wallet Instance; see [Section 6.5.5](#655-wallet-instance-de-installation).

#### 6.5.2 Wallet Instance installation

##### 6.5.2.1 Required trust relationships

The lifecycle of a Wallet Unit starts when a User decides to install a Wallet Instance application on their device. This application in an instance of a Wallet Solution, which is provided to the User by a Wallet Provider.

When downloading and installing the Wallet Instance, the following trust relationships are established:

1. On behalf of the User, the OS of the User's device and the relevant app store verify that the Wallet Instance (i.e., the application the User is installing) is genuine and authentic and does not contain any malware or other threats.
2. The User verifies that they can obtain the PID(s) they need in an instance of this Wallet Solution. If the relevant PID Provider does not support the Wallet Solution, the User would not be able to use the Wallet Unit for obtaining those PID(s).

The next two sections discuss these trust relationships.

##### 6.5.2.2 Wallet Solution authenticity is verified

To ensure that the User can trust the Wallet Solution, Wallet Providers preferably make their certified Wallet Solutions available for installation via the official app store of the relevant operating system (e.g., Android, iOS). This allows the operating system of the device to perform relevant checks regarding the authenticity of the app. It also allows Users to use the same well-known channel for obtaining a Wallet Instance as they use for obtaining other apps. Finally, it avoids a situation where a User must allow side-loading of apps, which would increase the risk of unintentionally installing malicious apps.

If a Wallet Provider makes its Wallet Solution available for installation through other means than the official OS app store, it implements a mechanism allowing the User to verify the authenticity of the Wallet Unit. Moreover, the Wallet Provider provides clear instructions to the User on how to install the Wallet Unit, including:

- instructions on how to verify the authenticity of the Wallet Instance to be installed. This can be done, for example, by comparing the hash value of the application downloaded by the User with a hash value published by the Wallet Provider.
- instructions on bypassing of any operating system limitations on side-loading of apps, if applicable, and ensuring that these limitations are restored after the Wallet Instance has been installed.

Note: The Regulation does not exclude the possibility that a Wallet Instance may be installed on a non-mobile device, for example a server. The requirements above also apply for the installation of a Wallet Unit on a User device that is not a mobile device, and for which no official operating system app store may exist.

##### 6.5.2.3 User validates that Wallet Solution is usable with relevant PID

A User installs a Wallet Unit because they want to obtain and use one or more PIDs. However, PID Providers are not required to support all Wallet Solutions in the EUDI Wallet ecosystem. 'Support' here means that the PID Provider is willing to issue a PID to an instance of a given Wallet Solution on request of the User. Instead, a PID Provider may choose to support only a single Wallet Solution or a limited number of Wallet Solutions. Therefore, each PID Provider will publish a list of Wallet Solutions that they support, such that a User that wants to request a PID from that PID Provider knows which Wallet Unit they should install. This list could be published, for example, on the PID Provider's website.

Conversely, a Wallet Solution is not required to support all PID Providers, where 'support' means that it is able to request the issuance of a PID from a PID Provider. Each Wallet Provider will, prior to or during installation of a Wallet Unit, let the User know which PID Providers are supported by this Wallet Unit.

For QEAAs, Pub-EAAs, and non-qualified EAAs, the situation is different. Providers of such attestations will support all Wallet Solutions and are not allowed to discriminate between them when processing a request for the issuance of an attestation. Conversely, a Wallet Solution supports all Attestation Providers, and cannot discriminate between different Attestation Providers when requesting the issuance of an attestation at the User's request.

#### 6.5.3 Wallet Unit activation

After installation of the Wallet Instance, the new Wallet Unit (which includes that Wallet Instance) will contact the Wallet Provider to start the activation process. For successful EUDI Wallet Instance activation, the following trust relations are established:

1. The EUDI Wallet Instance authenticates the EUDI Wallet Provider, meaning that the instance is sure that it is dealing with the genuine Wallet Provider who provided it to the User.
2. The EUDI Wallet Provider authenticates the EUDI Wallet Instance. This means that the EUDI Wallet Provider is sure that the instance is indeed a true instance of their EUDI Wallet Solution, and not a fake app.

Both of these trust relationships are the responsibility of the Wallet Provider. The ARF does not specify how these trust relationships can be satisfied.

During the activation process, at least the following steps happen:

1. The Wallet Provider requests data about the User's device from the Wallet Instance.
2. The Wallet Provider requests the User to set up at least one User authentication mechanism.
3. The Wallet Provider issues one or more Wallet Unit Attestations to the Wallet Unit.
4. The Wallet Provider sets up a User account for the User.

These steps are described below.

**1. Wallet Provider requests data about the User's device from the Wallet Instance**

The Wallet Unit connects to the Wallet Provider to be activated.

This data may include the communication technologies supported by the device and the characteristics of the WSCD(s) available to the device for securely storing cryptographic keys and data associated with the Wallet Unit itself and with the attestations in that Wallet Unit.

Notes:

- As discussed in [Section 4.5](#45-wscd-architecture-types), a WSCD may be integrated directly within the User's device. Examples of this include an e-SIM, a UICC, an embedded Secure Element, or native secure hardware accessible via the device's OS. If so, the Wallet Instance will discover the presence of such a WSCD during activation and will communicate the characteristics of the WSCD to the Wallet Provider. In some cases, the Wallet Provider will subsequently deploy a WSCA to the WSCD to facilitate communication between the Wallet Instance and the WSCD.
- Sometimes, the User's device does not contain a WSCD, or the WSCD does not have the security posture necessary to enable the Wallet Unit to be an identity means at LoA "high". In such a case, the Wallet Provider ensures the Wallet Unit gets access to a remote HSM operated by the Wallet Provider.

**2. Wallet Provider requests User to set up at least one User authentication mechanism.**

User authentication will take place at several moments when a User uses their Wallet Unit:<ol><li>When the User opens the Wallet Instance. This is necessary to prevent anyone except the User from accessing the Wallet Unit and inspecting the User's attestations and attribute values. This data is personal and might be sensitive.</li><li>When (or before) the Wallet Unit asks the User for approval to present some attributes to a Relying Party, see [Section 6.6.3.5](#6635-wallet-unit-obtains-user-approval-for-presenting-selected-attributes).</li></ol>

User authentication for point 1 above can be done either by the Wallet Instance or by a WSCD. In the latter case, it is the same mechanism employed for point 2, see below. In the former case, the mechanism is Wallet Unit-specific, meaning it is independent from any general User authentication mechanism used by the User device, such as a lock screen.

User authentication for point 2 effectively means that the User gives the WSCA permission to use the cryptographic keys belonging to the Wallet Unit and to the PID or attestation for performing the cryptographic operations necessary for releasing that PID or attestation. For that reason, it is always the WSCD that performs User authentication in this case.

Depending on the choice made by the Wallet Provider to combine the two User authentication mechanisms or not, the Wallet Provider will ask the User to set up one or two authentication mechanisms.

Note that, as discussed in the first bullet in [Section 6.6.3.9](#6639-relying-party-instance-verifies-or-trusts-user-binding), the User authentication mechanisms implemented in the WSCD may also play a role in ensuring User binding. User binding allow a Relying Party to trust that the person presenting a PID or attestation is in fact the subject of that PID or attestation.

**3. Wallet Provider issues one or more Wallet Unit Attestations to the Wallet Unit**

The Wallet Unit Attestation (WUA) is described in [Topic 9]. A WUA has three main purposes:

- It describes the capabilities and properties of the Wallet Unit, including the Wallet Instance, the User device, and the WSCD(s). This allows a PID Provider or an Attestation Provider to verify that the Wallet Unit complies with the Provider's requirements and therefore is fit to receive a PID or an attestation from the Provider.
- Moreover, the WUA contains a WUA public key. During the issuance of a PID or an attestation (see [Section 6.6.2.3](#6623-pid-provider-or-attestation-provider-validates-the-wallet-unit), a PID Provider or Attestation Provider can use this public key to verify that the Wallet Unit is in possession of the corresponding private key. Moreover, at that time, the Wallet Unit will send another public key to the PID Provider or Attestation Provider. The Provider will include this public key in the issued PID or attestation. By using a concept called public key association, described in [Topic 9], the PID Provider or Attestation Provider can verify that the private key belonging to this public key is protected by the same WSCD as the private key belonging to the WUA public key. Thus, the PID Provider or Attestation Provider can trust this new public key.
- Lastly, if a WUA is valid for 24 hours or longer, it contains information allowing a PID Provider, an Attestation Provider, or a Relying Party to verify that the Wallet Provider did not revoke the Wallet Unit Attestation, and hence the Wallet Unit itself. The WUA and the revocation mechanisms for Wallet Units are described in [Topic 38].

The detailed format of the WUA will be discussed with Member States for ARF 2.0. However, it will be an attestation complyin either with [SD-JWT VC] or [ISO/IEC 18013-5], allowing selective disclosure of attributes. This is necessary because Relying Parties do not need to know the properties of the Wallet Unit described in the first bullet above. Consequently, the Wallet Unit must be able to present a WUA without disclosing these attributes.

The responsibilities of the Wallet Provider regarding issuance of a WUA are similar to those of a PID Provider or Attestation Provider regarding the issuance of a PID or attestation. This means that after the initial issuance of a WUA during activation, the Wallet Provider will manage the WUA and will issue new WUAs to the Wallet Unit as needed, during the lifetime of the Wallet Unit. In particular, the Wallet Provider will ensure that the risk of malicious Relying Parties linking multiple presentations of the same WUA in order to track the User, is minimised. For example, the Wallet Provider may set up the Wallet Unit in such a way that each Wallet Unit Attestation is presented to at most one PID Provider, Attestation Provider, or Relying Party. This topic will be discussed with Member States for ARF 2.0.

**4. Wallet Provider sets up a User account for User**
The User needs a User account at the Wallet Provider to ensure that they can request the revocation of their Wallet Unit in case of theft or loss. The Wallet Provider associates the Wallet Unit with the User account. The Wallet Provider registers one or more backend-based User authentication methods that the Wallet Provider will use to authenticate the User. Note that:

- The Wallet Provider does not need to know any real-world attributes of the User. The User can use a pseudonym to register, for example an e-mail address. If the Wallet Provider wants to request additional User attributes, for instance to be able to provide additional services, they are free to do so if the User consents.
- In any case, User details registered by the Wallet Provider will not be included in the WUA. They are strictly for use by the Wallet Provider only.

#### 6.5.4 Wallet Unit management

Starting from Wallet Unit activation and until the Wallet Instance is de-installed by the User, a Wallet Unit is managed by the User and the Wallet Provider. The Wallet Provider is responsible at least to:

- perform installation of a new version of the Wallet Solution as necessary.
- update the WUAs as necessary; see [Topic 9].
- revoke the Wallet Unit in case its security is compromised; see [Topic 38].

The User will be able to request the Wallet Provider to revoke the Wallet Unit at least in case of loss or theft of the User's device. See [Topic 38].

In case the Wallet Unit contains a PID, the PID Provider may request the Wallet Provider to revoke the Wallet Unit in case the natural person using the Wallet Unit has died or the legal person using the Wallet Unit has ceased operations. See [Topic 38].

Lastly, the Wallet Unit supports procedures for backing up and restoring the attestations it contains, or for migrating these attestations to a different Wallet Solution. See [Topic 33] and [Topic 34] respectively.

To allow Wallet Unit management, the following trust relations are established:

1. When contacting the Wallet Provider, for instance to request the revocation of the Wallet Unit, the User authenticates the Wallet Provider. This means the User is sure that they are visiting the website or the User portal of the genuine Wallet Provider who is responsible for the User's Wallet Unit, and not a spoofed website or portal. This risk can be partly mitigated by using standard mechanisms such as TLS server authentication. However, in addition the User will need to be vigilant as well, just as with any website on the internet.
2. When contacted by a User, the Wallet Provider authenticates the User. This means that the Wallet Provider is sure that the User is indeed the User that was associated with the Wallet Unit during activation. For this, the Wallet Provider uses the authentication methods established in the User's account during activation, see [Section 6.5.3](#653-wallet-unit-activation).
3. When the Wallet Unit and the Wallet Provider set up a communication channel, the Wallet Unit authenticates the Wallet Provider, meaning that the Wallet Unit is sure that it is dealing with the genuine Wallet Provider. Similarly, the Wallet Provider authenticates the Wallet Unit. This means that the Wallet Provider is sure that the EUDI Wallet Instance is indeed a true instance of their allet Solution, and not a fake app. This will be ensured by the Wallet Provider. The ARF does not specify how these trust relationships can be satisfied.

Specifically for the functionality allowing a PID Provider to request Wallet Unit revocation:

4. When contacted by a PID Provider, the Wallet Provider authenticates the PID Provider. [Section 6.6.2.2](#6622-wallet-unit-authenticates-the-pid-provider-or-attestation-provider) below describes how a Wallet Unit can do this during PID issuance; a Wallet Provider can use the same mechanism.
5. To identify the Wallet Unit that is to be revoked, the PID Provider uses a Wallet Unit identifier provided by the Wallet Provider in the WUA during PID issuance; see [Topic 9].

#### 6.5.5 Wallet Instance de-installation

No trust relationships are required for Wallet Instance de-installation; anybody able to access the device of the User will be able to do this.

If the User uninstalls the Wallet Instance, the Wallet Instance ensures that the associated WSCA(s) delete all sensitive data and cryptographic keys related to the Wallet Unit and to all PIDs and attestations on the Wallet Unit.

### 6.6 Trust throughout a PID or an attestation lifecycle

#### 6.6.1 PID or attestation lifecycle

[Section 4.6.5](#465-pid-or-attestation) above presented the lifecycle of a PID or attestation within a Wallet Unit:

1. Using their Wallet Unit, the User requests the issuance of a PID or an attestation from a PID Provider or an Attestation Provider. The required trust relationships for issuance are discussed in [Section 6.6.2](#662-pid-or-attestation-issuance) below.
2. Once the PID or attestation is issued into the Wallet Unit, the User can present attributes from it to a Relying Party Instance, according to the User's decision and depending on successful authentication of the Relying Party. The required trust relationships for presenting PIDs and attestations, including User approval and Relying Party authentication, are discussed in [Section 6.6.3](#663-pid-or-attestation-presentation-to-relying-party).
3. Instead of presenting attributes to a Relying Party, a User can also present them to another User, meaning that their Wallet Unit is interacting with another Wallet Unit. This is briefly discussed in [Section 6.6.4](#664-pid-or-attestation-presentation-to-another-wallet-unit).
4. The PID Provider or the Attestation Provider remains responsible for managing the PID or attestation over its lifetime. Management may include re-issuing the PID or attestation with the same or with different attribute values. The Provider can also revoke the PID or the attestation, possibly based on a request of the User. The required trust relationships for managing PIDs and attestations are discussed in [Section 6.6.5](#665-pid-or-attestation-management).
5. Finally, [Section 6.6.6](#666-pid-or-attestation-deletion) discusses the scenario that a User decides to delete the PID or an attestation from their Wallet Unit.

#### 6.6.2 PID or attestation issuance

##### 6.6.2.1 Required trust relationships

The lifecycle of a PID or an attestation starts when a User, using their Wallet Unit, requests a PID Provider or an Attestation Provider to issue the PID or an attestation to their Wallet Unit. The following trust relationships are established during issuance:

1. The Wallet Unit authenticates the PID Provider or Attestation Provider using the access certificate referred to in [Section 6.3](#63-trust-throughout-a-pid-provider-or-an-attestation-provider-lifecycle). This ensures that the User can trust that the PID or attestation they are about to receive, is issued by an authenticated PID Provider or Attestation Provider respectively. See [Section 6.6.2.2](#6622-wallet-unit-authenticates-the-pid-provider-or-attestation-provider) below describing how this will be done.
2. The PID Provider or Attestation Provider authenticates the User, meaning that the Provider is sure about the identity of the User. This is necessary to enable determination of the values of the attributes that the Provider will attest to. For instance, a PID Provider needs to authenticate the User to ensure it provides a PID containing the correct family name and date of birth. The method by which the PID Provider or Attestation Provider performs User identification and authentication is out of scope of the ARF, as these processes are specific to each PID Provider or Attestation Provider. However, they will satisfy the requirements for the Level of Assurance required for the PID or attestation issued.
3. The PID Provider or Attestation Provider authenticates and validates the Wallet Unit, see [Section 6.6.2.3](#6623-pid-provider-or-attestation-provider-validates-the-wallet-unit) below.
4. The PID Provider or Attestation Provider verifies that the Wallet Provider did not revoke the Wallet Unit. This is described in [Section 6.6.2.4](#6624-pid-provider-or-attestation-provider-verifies-that-wua-is-not-revoked).
5. After the PID or attestation is issued to the Wallet Unit, the Wallet Unit verifies the authenticity of the PID or attestation; see [Section 6.6.2.5](#6625-wallet-unit-verifies-pid-or-attestation).
6. Finally, the User will activate a PID before they can use it; see [Section 6.6.2.6](#6626-user-activates-the-pid).

More detailed requirements for the issuance process of PIDs and attestations, for instance regarding the issuance protocol, are included in [Topic 10] and [Topic 23].

##### 6.6.2.2 Wallet Unit authenticates the PID Provider or Attestation Provider

As shown in Figure 11, a Wallet Unit downloads the PID Provider Access CA Trusted List(s) it needs from the relevant Trusted List Provider(s), possibly after having located them via the Commission common trust infrastructure. It also downloads all Attestation Provider Access CA Trusted List(s)See [Section 6.3.2](#632-pid-provider-or-attestation-provider-registration-and-notification) for more information on these Trusted Lists.

Note: It is not mandatory for each Wallet Unit to possess all PID Provider CA Trusted Lists, if there are multiple. Wallet Providers will choose which Trusted Lists they need to subscribe to, for example depending on the Member State(s) they are operating in. It is however mandatory to possess all Attestation Provider CA Trusted Lists, as Wallet Units must support all QEAA Providers and PuB-EAA Providers in the EUDI Wallet ecosystem.

To start the process of requesting a PID or an attestation, the User directs the Wallet Unit to contact the PID Provider or Attestation Provider. The User may for example use the Wallet Unit to scan a QR code or tap an NFC tag to do so. Note that no centralised service discovery mechanism for PID or attestation issuance is foreseen.

Before requesting the issuance of a PID or an attestation, the Wallet Unit authenticates the PID Provider or the Attestation Provider. To do so, the Wallet Unit verifies the access certificate presented to it by the PID Provider or Attestation Provider in its Issuer metadata according to [OpenID4VCI]. The Wallet Unit checks that the access certificate indicates that its subject is a PID Provider or an Attestation Provider. The Wallet Unit also verifies that the access certificate is authentic, that it is valid at the time of validation, and that the issuer of the certificate is a CA that is in the PID Provider or Attestation Provider Access CA Trusted List.

##### 6.6.2.3 PID Provider or Attestation Provider validates the Wallet Unit

**Verifies the authenticity of the Wallet Unit**

As shown in Figure 11, a PID Provider or an Attestation Provider downloads the Wallet Provider Trusted List(s) it needs from the relevant Trusted List Provider(s), possibly after having located them via the Commission common trust infrastructure.

Note that for PID Providers it is not mandatory to possess all Wallet Provider Trusted Lists, if there are multiple. This is because it is not mandatory for a PID Provider to accept all certified Wallet Solutions in the EUDI Wallet ecosystem. Each PID Provider  will choose which Trusted Lists they need to subscribe to. This is different for Attestation Providers: they must accept all Wallet Solutions and hence must possess all Wallet Provider Trusted Lists.

[Section 6.5.3](#653-wallet-unit-activation) above described that a Wallet Provider, during activation of a Wallet Unit, issues a Wallet Unit Attestation (WUA) to the Wallet Unit. When the Wallet Unit sends a request for a PID or an attestation to a PID Provider or to an Attestation Provider, it includes the WUA in the request. The PID Provider or Attestation Provider verifies the signature over the WUA, using the Wallet Provider trust anchor obtained from the Trusted List. Next, the PID Provider or Attestation Provider verifies that the Wallet Unit possesses the private key belonging to the public key in the WUA. This proves that the Wallet Unit is authentic and is provided by a trusted Wallet Provider. For more details see [Topic 9].

**Optionally, verifies that the User's Wallet Unit supports all required features**

The WUA describes relevant features of the Wallet Unit, as well as the device it is installed on. Depending on their needs, PID Providers or Attestation Providers optionally verify that the User's Wallet Instance supports all features they require. For example, for some PID Providers or Attestation Providers it may be relevant to know whether the Wallet Unit supports presenting the attestation in proximity flows using NFC.

**Optionally, validates the properties of the WSCD**

The WUA describes the certifications and the other relevant properties of the WSCD, i.e., the secure cryptographic device included in the Wallet Unit to store and manage cryptographic keys. The security level of the WSCD is a key determinant for the overall Level of Assurance (LoA) of the Wallet Unit. For obtaining a PID, the Wallet Unit and the WSCD will comply with the requirements for LoA High. For other attestations, LoA High or Substantial will be needed, depending on the requirements of the Attestation Provider.

**Verifies that the PID key or the attestation key is protected by the WSCD**

Knowing the properties of the WSCD is not very useful if the PID Provider or Attestation Provider cannot be sure that the private key for their new PID or attestation is indeed protected by that WSCD. [Topic 9] describes how the PID Provider or Attestation Provider can obtain a so-called proof of association from the WSCD. This proof of association proves that the WSCD described in the WUA protects both the WUA private key and the private key of the PID or the new attestation.

##### 6.6.2.4 PID Provider or Attestation Provider verifies that WUA is not revoked

[Section 6.5.3](#653-wallet-unit-activation) above described that a Wallet Provider, during activation of a Wallet Unit, issues a Wallet Unit Attestation (WUA) to the Wallet Unit. If the WUA is valid for longer than 24 hours, it contains revocation information. During the lifetime of the Wallet Unit, the Wallet Provider regularly verifies that the security of the Wallet Unit is not breached or compromised. If the Wallet Unit is no longer secure, the Wallet Provider revokes any of its WUAs that has a remaining validity period of 24 hours or longer. If the Wallet Provider uses WUAs with a validity period of less than 24 hours, it stops issuing new WUAs to a Wallet Unit that is no longer secure. The WUA thus allows PID Providers, Attestation Providers and Relying Parties to verify that the Wallet Unit is not revoked.

[Topic 38] describes Wallet Unit revocation in more detail.

Once it has done all verifications, the PID Provider or Attestation Provider will issue the PID or attestation to the Wallet Unit.

##### 6.6.2.5 Wallet Unit verifies PID or attestation

After the Wallet Unit receives the PID or attestation, it will

- verify that the PID or attestation it received matches the request.
- verify the signature of the PID or attestation, using the appropriate trust anchor, in the same way as described for a Relying Party Instance in [Section 6.6.3.6](#6636-relying-party-instance-verifies-the-authenticity-of-the-pid-or-attestation).
- show the contents (i.e., attribute values) of the new PID or attestation to the User and request the User's approval for storing the new PID or attestation. When requesting approval, the Wallet Unit shows the contents of the PID or attestation to the User. The Wallet Unit also informs the User about the identity of the PID Provider or Attestation Provider, using the subject information from the PID Provider or Attestation Provider access certificate.

If one these verifications fail, the Wallet Unit will delete the PID or attestation, and will inform the User that issuance was not successful.

##### 6.6.2.6 User activates the PID

As documented in [Topic 9], to achieve Level of Assurance (LoA) "high", [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:32015R1502) requires that an activation process will be implemented to verify that a PID was in fact delivered into the possession of the person to whom it belongs.

However, in fact no additional step is needed in the issuance process to ensure this. This is because the User always starts the issuance process from the Wallet Unit into which they want the PID Provider to issue the new PID. The PID Provider sets up a secure communication channel towards this Wallet Unit, using the flow specified in [OpenID4VCI]. Additionally, the User uses an eID means on LoA High to authenticate towards the PID Provider. This process ensures that the new PID can only end up on the mobile device of the subject of the PID.

Note that activation is formally required only for PIDs, since the [eIDAS 2.0] Regulation only requires PIDs to be issued at LoA "high". However, the above applies for QEAAs, PuB-EAAs, and non-qualified EAAs as well.

#### 6.6.3 PID or attestation presentation to Relying Party

##### 6.6.3.1 Required trust relationships

A Relying Party can request a User to present some attributes from a PID or from an attestation in their Wallet Unit. Figure 11 shows that a Relying Party uses a Relying Party Instance to interact with the Wallet Unit of the User. The relationship between the Relying Party and their Relying Party Instance is equivalent to the relationship between the User and their Wallet Unit.

When processing the request, the following trust relationships are established:

1. The Wallet Unit authenticates the Relying Party Instance, ensuring the User about the Relying Party's identity. [Section 6.6.3.2](#6632-wallet-unit-authenticates-the-relying-party-instance) explains how this will be done.
2. The Wallet Unit verifies that the Relying Party does not request more attributes than it has registered for, and informs the User about the outcome of this verification. See [Section 6.6.3.3](#6633-wallet-unit-allows-user-to-verify-that-relying-party-does-not-request-more-attributes-than-it-registered) for more information.
3. The Attestation Provider, during issuance, may optionally have embedded a disclosure policy in the attestation. If such a policy is present for the requested attestation, the Wallet Unit evaluates the disclosure policy and informs the User about the outcome of this evaluation. See [Section 6.6.3.4](#6634-wallet-unit-evaluates-disclosure-policy-embedded-in-attestation-if-present).
4. The User approves or rejects the presentation of the requested attributes. User approval and selective disclosure are described in [Section 6.6.3.5](#6635-wallet-unit-obtains-user-approval-for-presenting-selected-attributes).

Subsequently, after the Wallet Unit presents the selected attributes from the PID or attestation to the Relying Party Instance by sending a response to the request, the Relying Party validates the response. The following trust relationships are established:
5. The Relying Party Instance verifies the signature of the PID or attestation. This ensures that the Relying Party can trust that the PID or attestation it receives is issued by an authentic Provider and has not been changed. This is described in [Section 6.6.3.6](#6636-relying-party-instance-verifies-the-authenticity-of-the-pid-or-attestation).
6. The Relying Party verifies that the PID Provider or Attestation Provider did not revoke the PID or attestation. This is described in [Section 6.6.3.7](#6637-relying-party-verifies-that-the-pid-or-attestation-is-not-revoked).
7. The Relying Party verifies that the PID Provider or Attestation Provider issued this PID or attestation to the same Wallet Unit that provided it to the Relying Party. In other words, it checks that the PID or attestation was not copied or replayed. This is generally called device binding, and it is discussed in [Section 6.6.3.8](#6638-relying-party-instance-verifies-device-binding)
8. In some use cases, the Relying Party verifies that the person presenting the PID or attestation is the subject of the PID or attestation. This is called User binding. In other use cases, the Relying Party trusts that Wallet Unit and the WSCD have done this. User binding is discussed in [Section 6.6.3.9](#6639-relying-party-instance-verifies-or-trusts-user-binding).
9. The Relying Party can request attributes from two or more attestations in the same interaction. This is called a **combined presentation of attributes**. If so, the Relying Party verifies that these attestations belong to the same User. This is discussed in [Section 6.6.3.10](#66310-relying-party-instance-verifies-combined-presentation-of-attributes).

Either before or after validating the PID or attestation per steps 5 - 9,

10. The Relying Party Instance authenticates the Wallet Unit and the Wallet Provider; see [Section 6.6.3.11](#66311-relying-party-instance-authenticates-the-wallet-unit-and-the-wallet-provider).
11. The Relying Party Instance verifies that the Wallet Provider did not revoke the Wallet Unit, see [Section 6.6.3.12](#66312-relying-party-verifies-that-wua-is-not-revoked)

Finally, after the interaction with the Relying Party Instance is over,

12. The Wallet Unit enables the User to report unlawful or suspicious requests for personal data by a Relying Party, based on information logged by the Wallet Unit. Similarly, the Wallet Unit enables the User to request a Relying Party to delete personal data (i.e., User attributes) obtained from the Wallet Unit. This is discussed in [Section 6.6.3.13](#66313-wallet-unit-enables-the-user-to-report-suspicious-requests-by-a-relying-party-and-to-request-a-relying-party-to-erase-personal-data).

##### 6.6.3.2 Wallet Unit authenticates the Relying Party Instance

Relying Party authentication is a process whereby a Relying Party proves its identity to a Wallet Unit, in the context of an interaction in which the Relying Party requests the Wallet Unit to present some attributes. Relying Party authentication is discussed in [Topic 6].

Relying Party authentication is included in the protocol used by a Wallet Unit and a Relying Party Instance to communicate. As documented in [Topic 12], at least two different protocols can be used within the EUDI Wallet ecosystem, namely the ones specified in [ISO/IEC 18013-5] and [OpenID4VP]. Both protocols include functionality allowing the Wallet Unit to authenticate the Relying Party Instance. Although these protocols differ in the details, on a high level, they both implement Relying Party authentication as shown in Figure 12 below.

![Figure 12](media/Figure_12_Relying_Party_Authentication.png) <!-- <img src="media/Figure_12_Relying_Party_Authentication.png" style="width:4.987771216097988inin;height:4.385083114610674in" /> -->

Figure 12 High-level overview of Relying Party authentication process

The figure shows the following:

First, there are two preconditions that need to be fulfilled before the Relying Party authentication process can begin. Note that these actions are not carried out for every presentation, but only once (excluding possible updates):

A) The Relying Party registered itself as described in [Section 6.3.2](#632-pid-provider-or-attestation-provider-registration-and-notification) and obtained a Relying Party Instance access certificate.

B) The Wallet Unit obtained the trust anchor of the Relying Party Instance Access Certificate Authority.

Subsequently, during each presentation of attributes:

1. The Relying Party Instance prepares a request for some attributes to the Wallet Unit and includes its Relying Party Instance access certificate in the request, plus all intermediate certificates up to (but excluding) the trust anchor.
2. The Relying Party Instance signs some data in the attribute request using its private key.
3. The Relying Party Instance sends the request to the Wallet Unit.
4. The Wallet Unit checks the authenticity of the request by verifying the signature over the request using the public key in the Relying Party Instance access certificate.
5. The Wallet Unit checks the authenticity of the Relying Party by validating the Relying Party Instance access certificate and all intermediate certificates included in the request. For validating the last intermediate certificate, the Wallet Unit uses the trust anchor it obtained from the Trusted List.
6. The Wallet Unit validates that none of the certificates in the trust chain have been revoked. This includes the Relying Party Instance access certificate as well as all other certificates in the trust chain, including the trust anchor itself if applicable.
7. The Wallet Unit continues by requesting the User for approval.
8. The User approves the attributes that will be presented.
9. The Wallet Unit sends a response containing only the approved attributes to the Relying Party Instance.

##### 6.6.3.3 Wallet Unit allows User to verify that Relying Party does not request more attributes than it registered

During registration, the Relying Party registered which attributes it intends to request from Wallet Units. The Registrar listed these attributes in a Relying Party registration certificate and sent it to the Relying Party, which distributes it to all of its Relying Party Instances.

During a transaction, a Relying Party Instance sends this registration certificate to the Wallet Unit in the presentation request. The Wallet Unit displays the contents of the registration certificate to the User, at least in case one or more of the requested attributes is not included in the list of attributes in the registration certificate.

The format of the registration certificate, as well as the way in which the Wallet Unit can verify that the registration certificate belongs to the authenticated Relying Party, will be specified in a technical specification. For more information, see [Topic 44].

##### 6.6.3.4 Wallet Unit evaluates disclosure policy embedded in attestation, if present

During attestation issuance, an Attestation Provider optionally has embedded a disclosure policy in the attestation. Such an embedded disclosure policy contains rules determining which types of Relying Party are allowed by the Attestation Provider to receive specific attributes from the attestation. Note that the Regulation does not contain a requirement for PIDs to be able to contain an embedded disclosure policy, but only for QEAAs and PuB-EAAs.

If a policy is present in the attestation, the Wallet Unit evaluates the policy, together with data obtained from the Relying Party, to determine whether the Attestation Provider allows this Relying Party to receive the requested attributes. Data obtained from the Relying Party may be included in an attribute certificate comparable to the registration certificate discussed in the previous section. Such an attribute certificate may have been issued to the Relying Party by the Attestation Provider itself. In any case, the Wallet Unit authenticates any data obtained from the Relying Party before using it.

The Wallet Unit presents the outcome of the disclosure policy evaluation to the User in the form of advice, when requesting User approval. For example, "The issuer of your medical data does not want you to present \<attribute names\> to \<Relying Party name\>. Do you want to continue?" Note that the User can overrule the disclosure policy evaluation outcome.

For more details on the embedded disclosure policy, see [Topic 43]. This topic will be further discussed with Member States for ARF 2.0.

##### 6.6.3.5 Wallet Unit obtains User approval for presenting selected attributes

**Note: In this document the term 'User approval' exclusively refers to a User's decision to present an attribute to a Relying Party. Under no circumstances User approval to present data from their Wallet Unit should be construed as lawful grounds for the processing of personal data by the Relying Party or any other party. A Relying Party requesting or processing personal data from a Wallet Unit must ensure that it has grounds for lawful processing of that data, according to Article 6 of the GDPR.**

Before presenting any attribute to a Relying Party, the Wallet Unit requests the User for their approval. This is critical for ensuring that the User remains in control of their attributes.

A Wallet Unit requests User approval in all use cases, both in proximity flow and remote flow, and including:

- Use cases where the Relying Party could be assumed to be trusted, for example, when the Relying Party is part of law enforcement or another government agency.
- Use cases where the requested attributes are critical for the Relying Party to grant access to the User or deliver the requested services.
- Use cases where there is, according to the GDPR or other legislation, no legal need to ask for the User's approval because another legal basis exists for requesting the attributes.

A prerequisite for requesting User approval is that the Wallet Unit is sure that the person using the Wallet Unit is in fact the User. Therefore, the WSCA authenticates the User prior to or during requesting User approval, on request of the Wallet Unit. To do so, the Wallet Unit uses the User authentication mechanisms set up during Wallet Unit activation, see [Section 6.5.3](#653-wallet-unit-activation). More detailed requirements regarding User approval can be found in [Topic 6].

Another prerequisite for effective User approval is that the Wallet Unit allows the selective disclosure of attributes. Selective disclosure implies mainly two thing. First, it enables a Relying Party to specify which of the attributes in an attestation it wishes to receive (and which ones not). A Relying Party may have different purposes for the requested attributes. For example, an online liquor shop may need an age attestation to comply with its legal obligations, and in addition would like to receive address information to be able to send the ordered liquor to the User's home. Therefore, the Relying Party indicates the goal of each (group of) requested attributes.

Secondly, selective disclosure implies that the Wallet Unit enables the User to approve or deny the presentation of each (group of) attributes separately. The User takes a decision based on at least the following information:

- The authenticated identity of the Relying Party,
- The information in the Relying Party's prsentation certificate regarding the attributes that the Relying Party has registered during registration,
- The outcome of the evaluation of the embedded disclosure policy.

After the User gives their approval, the Wallet Unit will present the approved User attributes to the Relying Party Instance.

##### 6.6.3.6 Relying Party Instance verifies the authenticity of the PID or attestation

The Relying Party Instance receives a PID or attestation, including some attributes, from the Wallet Unit. Subsequently, it verifies the signature over the PID or attestation. To do this for PIDs and QEAAs, the Relying Party Instance uses a trust anchor of the Provider obtained from a Trusted List. Note that the PID Provider or QEAA Provider may use an intermediate signing certificate to sign the PID or attestation, and use the trust anchor to sign the signing certificate, instead of signing the PID or attestation directly with the trust anchor.

For PuB-EAAs, the Relying Party Instance verifies a PuB-EAA by first verifying the signature of the PuB-EAA Provider over the PuB-EAA, using the PuB-EAA Provider certificate issued by a QTSP. Subsequently, the Relying Party Instance verifies the signature over this certificate, using the corresponding trust anchor from the QTSP Trusted List. Note that both the PuB-EAA Provider and the QTSP may use an intermediate signing certificate. All other things being equal, the verification of a PuB-EAA will therefore involve one or more extra certificates, compared to the verification of a PID or QEAA.

Finally, for non-qualified EAAs, the applicable Rulebook may describe how the Relying Party Instance obtains the relevant trust anchor.

The above implies that a Relying Party Instance is aware whether the attestation it is requesting from a Wallet Instance is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. Also, the Relying Party Instance stores trust anchors in such a way that, at the time of verification, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs.

The technical implementation of the signature verification process depends on which of the standards mentioned in [Topic 12] is supported by the Wallet Unit. Each of these standards specifies in detail how to carry out signature verification.

In addition, the Relying Party may want to verify that the Attestation Provider can legally issue the type of attestation in question. As described in [Section 6.6.3.3](#6633-wallet-unit-allows-user-to-verify-that-relying-party-does-not-request-more-attributes-than-it-registered), this is only needed for non-qualified EAA Providers, as the Relying Party trusts a PID Provider, QEAA Provider or PuB-EAA Provider. For EAA Providers, the applicable Rulebook may define methods that the Relying Party can use to verify that the EAA Provider is allowed to issue this type of attestation.

Notes:

- All PIDs and attestations in the EUDI Wallet ecosystem are digitally signed by the respective PID Provider or Attestation Provider, or by a WSCD that is part of the Wallet Unit. If an attestation is digitally signed by a WSCD, it is called a device-signed or self-issued attestation. Device-signed or self-issued PIDs or attestations are allowed only if it can be shown that the WSCD signs them at the required Level of Assurance (LoA). This implies that the level of security offered by the WSCD is at least equivalent to the security level of the secure infrastructure used by the PID Provider or Attestation Provider for signing PIDs or attestations.

- The signature over the PID or attestation may or may not include the value of the presented attributes. If the attribute values are not included in the signature creation, the Relying Party trusts these attributes because they are presented over an authenticated channel set up between the secure environment (i.e., the WSCD or the secure infrastructure used by the PID Provider or Attestation Provider, see previous bullet) and the Relying Party. One possible way to set up such an authenticated channel is by ensuring the authenticity and integrity (but not the non-repudiation) of the attributes by means of a Message Authentication Code (MAC). The MAC is created by the secure environment over the presented attribute values. The MAC key is generated from an ephemeral key of the Relying Party (sent to the secure environment by the Wallet Instance) in combination with an ephemeral key created by the secure environment. The latter ephemeral key is sent to the Relying Party in such a way that the Relying Party can verify the authenticity of this key. Such a solution, or similar ones, can be used provided that:
    - the solution is fully compliant with the relevant standards, i.e., [ISO/IEC 18013-5] or [OpenID4VP] and [SD-JWT VC].
    - the solution can be certified for security at LoA "high" according to [chapter 7](#7-certification-and-risk-management)

##### 6.6.3.7 Relying Party verifies that the PID or attestation is not revoked

To allow revocation checking of a PID or attestation, the PID Provider or Attestation Provider includes revocation information in the PID or attestation, if it is valid for longer than 24 hours. This revocation information includes a URL indicating the location where a Relying Party can obtain a status list or revocation list, and an identifier or index for this specific certificate or attestation within that list.

Notes:

- For attestations with a validity period of less than 24 hours, including revocation information is not necessary.
  
- A status list is a bit string or byte string in which each bit or group of bits denotes the current revocation status (valid or revoked) of one attestation. To get the status of the attestation it has received from the Wallet Unit, the Relying Party obtains the status list from the URL specified in the attestation and verifies the value encoded at the bit position given by the index value in the attestation.

- A revocation list is a list of PID identifiers or attestations identifiers revoked by the PID Provider or Attestation Provider. To get the status of the PID or attestation it has received from the Wallet Unit, the Relying Party obtains the revocation list from the URL specified in the attestation and verifies whether the identifier included in the attestation is on the list or not.

For more details and requirements on revocation, see [Topic 7].

##### 6.6.3.8 Relying Party Instance verifies device binding

Device binding is the property that an attestation is bound to a specific device (in fact, a WSCD) and cannot be used independent from that device. Device binding protects the attestation against copying or cloning, which enhances its security.

A PID Provider or an Attestation Provider implements device binding by including a cryptographic public key in the attestation and signing it. The corresponding private key is protected by a certified WSCD in the Wallet Unit.

[Topic 9] explains that a WSCD generates a public-private key pair for each attestation upon request of the Wallet Unit, and that the Wallet Unit sends the public key to the PID Provider or Attestation Provider. Furthermore, it discusses how the PID or Attestation Provider can verify that the corresponding private key is really protected by the WSCD.

During an interaction, the Relying Party verifies that the PID or attestation it received from a Wallet Unit is indeed bound to the WSCD included in the Wallet Unit. The Relying Party does so by requesting the Wallet Unit to sign some data using the private key corresponding to the public key in the PID or attestation. For this reason, device binding is also called 'proof of possession'. In [ISO/IEC 18013-5] it is called 'mdoc authentication'. In [SD-JWT VC] it is called 'key binding'.

The technical implementation of this verification depends on which of the standards mentioned in [Topic 12] is supported by the Wallet Unit. Each of these standards specifies in detail how to carry out this verification.

##### 6.6.3.9 Relying Party Instance verifies or trusts User binding

User binding (sometimes also called 'holder binding') is the property that the subject of the PID or attestation, meaning the natural or legal person described in it, is in fact the person that presents the PID or attestation to the Relying Party. User binding prevents an attacker from successfully presenting a PID or an attestation that they are not legally allowed to use.

The mechanism(s) available for User binding depend on the presentation flow type (proximity or remote, supervised or unsupervised, see also [Section 4.4](#44-data-presentation-flows)), and on the attributes issued to the User by the PID Provider or Attestation Provider: <ol><li>In the first place, the Relying Party can always decide to trust the User authentication mechanisms implemented by the WSCD (see [Topic 9]). This means that the Relying Party trusts that the the WSCD has properly authenticated the User before allowing the User to present the attributes. Note that:<ul><li>This trust is not based on the outcome of any verification by the Relying Party but is a-priori trust in (in particular) the certified WSCD that is part of the Wallet Unit.</li><li>Using this method implies that Relying Parties also trust device binding, as described in [Section 6.5.3](#653-wallet-unit-activation). The Relying Party Instance in fact first verifies that the PID or attestation is bound to a WSCD trusted by the PID Provider or Attestation Provider, and then trusts that the WSCD has properly authenticated the User.</li><li>As a matter of fact, this User binding method will always be carried out, since the WSCD must authenticate its User when asking for User approval for presenting any attributes, and since device binding is also mandatory.</li></ul></li> <li>In addition, in some cases, if a Relying Party does not want to only trust the above mechanism, it may be able to use User attributes to carry out an additional User binding process. For example, if the PID or attestation contains a User portrait, the Relying Party may be able to visually or biometrically compare that portrait to the face of the person presenting the attestation or by a photo taken of it by an automated machine or as a "selfie". This will generally be possible in supervised proximity presentations by human inspection, or in an unsupervised proximity flow if equipped with the appropriate equipment. It may also be possible to do this in unsupervised remote presentations by using face recognition technology, possibly even remotely. However, to generate trustworthy outcomes in such situations, special conditions and dedicated security measures are required, such as good lighting, clear instructions for the User for positioning their face and an approved liveness detection mechanism supporting Presentation Attacks Detection ([PAD](https://www.enisa.europa.eu/publications/remote-identity-proofing-attacks-countermeasures)), as well as mechanisms for injection attack detection, in particular deepfake detection.</li> <li>Lastly, if the person presenting the PID or attestation is able to present an identity document, the Relying Party may be able to verify User binding by comparing attributes from the PID or attestation, such as first and last name, to those in the identity document. However, this requires that the Relying Party can verify that the identity document is authentic and really belongs to the person presenting it. In practice this will often mean that the identity document is a photo ID, and the presentation must consequently be done in proximity and be supervised, or done remotely and supported by PAD.</li></ol>

Finally, note that in a combined presentation of attributes according to the next section, if User binding is proven for one of the presented attestations, it is proven for all of them.

##### 6.6.3.10 Relying Party Instance verifies combined presentation of attributes

According to the Regulation, a combined presentation of attributes is a request for attributes from two or more attestations in the same action. In this case, the Relying Party will verify that these attestations belong to the same User, to prevent a hacked or fraudulent Wallet Unit from presenting attributes from different Users.

A Relying Party can verify this by comparing attributes from the different attestations. For example, the Relying Party may request the first and last name of the User in all of the attestations, and compare the names. If they match, the Relying Party concludes that the attestations belong to the same User. However, this method implies that the Relying Party must request identifying information from the User. In some use cases, requiring that information may not be strictly necessary, and so this method may be seen as a threat to User privacy. Moreover, this method may not be conclusive, for instance if multiple people share the same name.

To solve these drawbacks, [Topic 18] describes how the Relying Party Instance can verify this cryptographically by checking that the public keys in the attestations are associated. Key association is described in [Topic 9].

##### 6.6.3.11 Relying Party Instance authenticates the Wallet Unit and the Wallet Provider

[Section 6.5.3](#653-wallet-unit-activation) above describes that a Wallet Provider, during the lifetime of a Wallet Unit, ensures that the Wallet Unit is always in possession of one or more valid Wallet Unit Attestations (WUAs). Either before or after requesting one or more PIDs or attestaions from a Wallet Unit, a Relying Party Instance:

- requests a WUA from the Wallet Unit.

- verifies the signature over the WUA using the Wallet Provider trust anchor obtained from the Wallet Provider Trusted List.

- verifies that the Wallet Unit is in possession of the private key belonging to the public key in the WUA. This proves that the Wallet Unit is authentic and is provided by the trusted Wallet Provider.

##### 6.6.3.12 Relying Party verifies that WUA is not revoked

[Section 6.6.2.4](#6624-pid-provider-or-attestation-provider-verifies-that-wua-is-not-revoked) explained how a PID Provider or an Attestation Provider can verify that a Wallet Unit is not revoked. The same mechanism is used by Relying Party Instances as well.

##### 6.6.3.13 Wallet Unit enables the User to report suspicious requests by a Relying Party and to request a Relying Party to erase personal data

A Wallet Unit enables the User to report unlawful or suspicious requests for personal data by a Relying Party to a Data Protection Authority (DPA). To allow this, a Wallet Unit provides a dashboard allowing the User to lodge a complaint about a suspicious Relying Party presentation request to the DPA of the Member State that provided their Wallet Unit. For more information and requirements, see [Topic 50]. The User can make such a report regardless of whether any attributes were actually presented to the Relying Party. Even if the Wallet Instance prevented the presentation of any attributes because Relying Party authentication failed, or if the User did not approve the presentation of any attributes, the User can still lodge a complaint about the request with the relevant Data Protection Authority.

The dashboard also enables the User to request a Relying Party to immediately erase personal data. For more information and requirements, see [Topic 48].

To be able to substantiate a complaint, or to list data that must be deleted, the User needs to be informed about which attributes were requested by which Relying Parties. To enable this, a Wallet Unit maintains a log of all attributes that were requested and presented. The abovementioned dashboard also enables the User to view the log and lodge a complaint for any attribute in the log. More details about the logging functionality can be found in [Topic 19].

#### 6.6.4 PID or attestation presentation to another Wallet Unit

[Section 6.6.3](#663-pid-or-attestation-presentation-to-relying-party) discussed the trust relationships necessary when a Wallet Unit receives a request from a Relying Party Instance and presents attributes to that Relying Party Instance.

However, the Regulation requires that a Wallet Unit is also able to receive such a request from another Wallet Unit, and present attributes to that requesting Wallet Unit. For more information and requirements, please refer to [Topic 30].

#### 6.6.5 PID or attestation management

Starting from the issuance of a PID or attestation, the PID or attestation is managed by the User and the Wallet Provider. Management is performed until the PID, or attestation, is deleted or the Wallet Instance is de-installed by the User.

For PID and attestation revocation, see [Topic 7]. The User can request the PID Provider or Attestation Provider to revoke the PID or attestation at least in case of loss or theft.

In addition, a PID Provider or Attestation Provider could regularly verify, for each of its valid PIDs or attestations, whether the Wallet Provider revoked the Wallet Unit on which that PID or attestation is residing. If it turns out that the Wallet Unit is revoked, the PID Provider or Attestation Provider could revoke the respective PID or attestation. Currently, no mechanism has been specified yet to enable a PID Provider or Attestation Provider to verify whether a Wallet Unit is revoked. This will be discussed for ARF 2.0.

#### 6.6.6 PID or attestation deletion

In case the User no longer wants to retain a specific PID or attestation in their Wallet Unit, the User can delete it. If the PID Provider or Attestation Provider issued multiple attestations that have the same content and are valid, the Wallet Unit deletes them all. Deleting a PID or an attestation also means that the WSCD destroys the cryptographic key material associated with that PID or attestation. Before deleting the PID or attestation and the cryptographic keys, the WSCA included in the Wallet Unit will authenticate the User.

## 7 Certification and Risk Management

### 7.1 Introduction

This chapter briefly describes the certification of Wallet Solutions and the eID schemes under which they are provided, covering the overall certification approach, design principles, and key requirements outlined in the [eIDAS Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183) and Commission Implementing Regulation (CIR) laying down rules for on the certification of Wallet Solution (2024/2981), or simply the [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981). Furthermore, references are made to the Annex I of the CIR, the [Risk Register](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I,), supporting the risk-based approach of the Wallet Solutions. For more detailed requirements, please refer to the [CIR](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981) itself.

The [eIDAS Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183) requires certification of Wallet Solutions to ensure conformity of the Wallet Solutions with functional, security, and privacy related requirements, to achieve a high level of interoperability, security and trustworthiness. Certification applies to the Wallet Solutions and the eID schemes under which they are provided; for ease of reading this chapter only refers to Wallet Solutions. Furthermore, the object of certification includes software components, hardware components (in cases where they are provided directly or indirectly by the Wallet Provider) and the processes that support the provision and operation of a Wallet Solution, such as Wallet Unit activation, see [Section 6.5.3](#653-wallet-unit-activation).

The aim is to harmonise the implementation of the requirements laid down by the Regulation and avoid divergent approaches to the maximum extent possible. For this reason, the Commission requested ENISA to prepare a candidate European certification scheme under the Cybersecurity Act, the [CSA](https://eur-lex.europa.eu/eli/reg/2019/881/oj). As defining and adopting a dedicated, harmonised certification scheme for Wallet Solutions depends on agreements between Member States on detailed security requirements, on the availability of underlying certification schemes, and on established good practices in the Member States themselves, a transitory approach is foreseen by means of national certification schemes.

In other words, the certification approach for Wallet Solutions follows two phases. In the short-term, Member States provide national (transitory) certification schemes. In the medium term, a harmonised CSA scheme will be established. When the CSA-based scheme becomes available, it replaces the national schemes as for cybersecurity requirements. The schemes may continue to exist for functional requirements.

#### 7.2. Certification of Wallet Solutions against national certification schemes

Until a dedicated Wallet Solution cybersecurity certification scheme under the CSA is available, the Regulation requires Member States to establish national certification schemes. This will be done in time to make available the Wallet Solutions before the end of 2026. The Commission has adopted the [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981) to provide the main requirements on Member States for creation of national certification schemes. The [CIR 2024/2981] and resulting national certification schemes are defined around a number of guiding principles:

First, the goal is to harmonise requirements to the extent possible. Member States are also encouraged to work together in the design and implementation of national schemes. Additionally, national schemes will leverage the use of relevant and existing certification schemes and standards for Wallet Solution certifcation and evaluation. Where available, relevant European CSA schemes must be used. Currently, only the Common Criteria based European candidate cybersecurity certification [EUCC](https://certification.enisa.europa.eu/about-eu-certification/developing-certification-schemes_en) scheme is available for the cybersecurity certification of ICT products, parts, or components for products. Upcoming CSA-based schemes include [EUCS](https://certification.enisa.europa.eu/about-eu-certification/developing-certification-schemes_en) & [EU5G](https://certification.enisa.europa.eu/about-eu-certification/developing-certification-schemes_en). Additionally, other existing or upcoming schemes​ include schemes based on FITCEM (EN 17640)​, national schemes such as on remote identity verification, or other private schemes (e.g. for mobile devices and apps)​. For harmonisation of functional requirements, the Commission Implementing Regulations (CIRs) adopted under [eIDAS Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183) article 5(a) are referenced. For harmonisation of certification requirements, the ISO/IEC 17065 framework under Regulation [765/2008] is used, complemented by ISO/IEC 17067 on the definition of schemes.

Next, the [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981) refers to the composite nature of the Wallet Solutions as well as the potential different architectures in Member States, considering that the [eIDAS Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183) is technology (and architecture) neutral. This means that a final ('top-level') certification of the Wallet Solution will yield a composite certificate, built on certification of separate components, such as EUCC certification. Wallet Solutions are always to be certified against assurance level "high", as set out in [eIDAS Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183) as well as [CIR (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ%3AJOL_2015_235_R_0002). That assurance level has to be reached by the overall Wallet Solution. Under this Regulation, some components of the Wallet Solution may be certified at a lower assurance level, provided this is duly justified and without prejudice to the assurance level "high" reached by the overall Wallet Solution. For the use of assurance information from other certification schemes or sources, a dependency analysis will be performed.

Finally, in order to ensure a harmonised approach to cybersecurity and the assessment of the most critical risks that might affect the provision and operation of Wallet Units, a register of risks and threats is defined [#7.4-Risk-based-approach-and-risk-register]. The [Risk Register](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) contains high level risks and threats in relation to Wallet Solutions and the ecosystem, as well as detailed threat scenarios that will be taken into consideration when designing Wallet Solutions, independent of their specific architecture.

As a first step towards certification of Wallet Solutions under national schemes, Member States will assign a scheme owner, and design and roll out the scheme. As part of this process, Certification Bodies (CBs) will be accredited to carry out conformity assessments of Wallet Solutions against the requirements of the [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981) and the national scheme. Wallet Providers then request one or more designated CABs to assess and certify the conformity of their Wallet Solution. The CAB evaluates and certifies the conformity of the Wallet Solution if they meet the requirements.

The European Commission and ENISA support Member States in designing and implementing national certification schemes in the Cooperation Group.

#### 7.3 Certification of Wallet Solutions against a dedicated CSA-based scheme

In parallel to the work described above, ENISA is requested to draft a dedicated European cybersecurity certification scheme for the Wallet Solutions under the [CSA](https://eur-lex.europa.eu/eli/reg/2019/881/oj). Once available, this CSA-based scheme will replace the national transitory schemes mentioned above for the cybersecurity requirement it covers. This scheme will be based on available national schemes, harmonised requirements, and identify any additional requirements relevant for cybersecurity. The scheme will further detail the cybersecurity requirements, identify and set normative standards and define the target level of assurance or security for the relevant Wallet Solution components.

The work to develop the CSA-based scheme follows the milestones set out by the [CSA](https://eur-lex.europa.eu/eli/reg/2019/881/oj) and is supported by the Ad Hoc Working Group or '[AHWG](https://www.enisa.europa.eu/news/call-for-experts-join-the-enisa-ad-hoc-working-group-on-eu-digital-identity-wallets-cybersecurity-certification)'. This group is composed of selected experts from private organisations and industry, with extensive knowledge and experience in the areas of cybersecurity certification, digital wallets, electronic identification and trust services. The first step is to have a candidate scheme ready for public consultation and submitted for feedback of the European Cybersecurity Certification Group or [ECCG](https://digital-strategy.ec.europa.eu/en/policies/cybersecurity-certification-group). The ECCG’s opinion serves as advisory input to ensure the candidate scheme aligns to EU cybersecurity objectives, standards and regulatory requirements. Although the ECCG’s opinion is not binding, it will hold significant influence, as it reflects the collective expertise of national cybersecurity authorities, aiming to harmonise cybersecurity certification practices across Member States. Based on this input, the candidate scheme might be updated further. After finalisation of the ECCG opinion, the scheme will be transformed into a new Implementing Regulation and adopted by comitology procedure.

Finally, ENISA is also asked to facilitate the transition from national certification schemes to the dedicated cybersecurity certification scheme under the CSA.

### 7.4 Risk-based approach and risk register

This section details the approach to develop harmonised guidelines for the development of the transitory national certification schemes. In addition to the requirements set out in the [eIDAS Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183) article 5c, cybersecurity risks and threats associated with the Wallet Solutions will be identified. Here, a risk-based approach is envisioned as the basis for certification by Member States, ensuring that the Wallet Solutions uphold confidentiality, availability and strong safeguards for User privacy and data protection. This is inspired by known processes, such as for the General Data Protection Regulation ([GDPR](https://eur-lex.europa.eu/eli/reg/2016/679/oj)) and related Data Protection Impact Assessments (DPIA).

The risk-based approach sets out a common [Risk Register](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) that contains a comprehensive but non-exhaustive list of risks and threats related to the Wallet Solution. These risks and threats are architecture-agnostic and provide a benchmark overview of the most critical risks and threats to Wallet Solutions. By adopting this common set of risks and threats, national transitory certification schemes will achieve a baseline level of harmonisation.

The risk register will be applied by scheme owners, Wallet Providers, and Certification Bodies (CBs). When establishing their certification schemes, scheme owners will perform a risk assessment to refine and complement the risks and threats listed in the register with those specific to their architecture, and consider how the applicable risks and threats can be appropriately treated. Wallet Providers will complement the scheme’s risk assessment to identify any risks and threats specific to their implementation and propose appropriate mitigation measures for evaluation by the certification body.

#### 7.4.1 High-level risks and threats

The following is an excerpt from [Risk Register]. To keep in line with the continuously evolving threat landscape, the risk register will be maintained and regularly updated in collaboration with the Cooperation Group.

*High-level risks and threats*

	R1 	Creation or use of an existing electronic identity 
	R2 	Creation or use of a fake electronic identity 
	R3 	Creation or use of fake attributes 
	R4 	Identify theft 
	R5 	Data theft 
	R6 	Data disclosure 
	R7 	Data manipulation 
	R8 	Data loss 
	R9 	Unauthorised transaction 
	R10 Transaction manipulation 
	R11 Repudiation 
	R12 Transaction data disclosure 
	R13 Service disruption
	R14	Surveillance

*System-related risks*

    SR1 Wholesale surveillance 
	SR2 Reputational damage 
	SR3 Legal non-compliance 

*Technical threats*

    TT1 Physical attacks 	
    
    1.1	Theft 
	1.2	Information leakage 
	1.3 Tampering 
	
    TT2 Errors and misconfigurations 	
    
    2.1	Errors made when managing an IT system 
	2.2	Application-level errors or usage errors 
	2.3	Development-time errors and system misconfigurations 
	
    TT3 Use of unreliable sources 
    
    3.1	Erroneous use or configuration of wallet components 
	
    TT4 Failure and outages 	
    
    4.1	Failure or dysfunction of equipment, devices or systems 
	4.2	Loss of resources 
	4.3 Loss of support services 
	
    TT5 Malicious actions 	

    5.1 Interception of information 
	5.2 Phishing and spoofing 
	5.3 Replay of messages 
	5.4 Brute-force attack 
	5.5 Software vulnerabilities 
	5.6 Supply chain attacks 
	5.7 Malware 
	5.8 Random number prediction 

## 8 Document development

### 8.1 Publication

This document is made publicly available at <https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework> (GitHub repository) where it will be regularly updated.

### 8.2 Contributing

We value your feedback and encourage you to share any thoughts, suggestions, or concerns you may have regarding this document.

#### 8.2.1 Providing Feedback

To provide feedback on this document, please visit our GitHub repository. You can do so by navigating to the "Issues" tab and submitting a new issue or commenting on existing ones. Whether you've spotted a typo, have a suggestion for clarifying a section, or want to propose a new topic for inclusion, we welcome your feedback.

##### 8.2.1.1 Guidelines for adding issues to the Github repository

When adding issues to the Github repository, please follow these general guidelines:

- Use **clear and descriptive titles** for your issues to provide a concise summary of the problem or task. This helps others quickly understand the issue at a glance.

- Provide a **detailed description of the issue**, including any relevant context, background information. The description should be comprehensive enough for others to understand the issue and take appropriate action.

- Use one or more of the following **labels** to categorise issues. Labels help organise and prioritise issues, making it easier to manage the repository.

| **Label** | **Description** |
|-----------------------|---------------------------------------------------------------------------------|
| Content Clarifications| Raise issues seeking clarification on specific content within the document. This could include explanations of concepts, definitions of terms, or examples to illustrate certain points. |
| Suggestions for Improvements | Propose suggestions to enhance the clarity, completeness, or accuracy of the document. This could involve restructuring sections, adding examples, or providing additional information. |
| Errors and Corrections | Identify errors such as typos, grammatical mistakes, or factual inaccuracies within the document and suggest corrections. |
| Compatibility and Integration | Issues related to how the document integrates with other systems or technologies, ensuring compatibility with different platforms or frameworks. |
| Enhancement Requests | Request new features, sections, or content to be added to the document to improve its usefulness or relevance. |
| Formatting and Styling | Feedback regarding the visual appearance, organisation, and consistency of formatting within the document. |
| Documentation Standards | Discussions around adhering to documentation standards, conventions, or guidelines. |
| Licence and Legal Concerns | Questions or concerns related to the licensing of the document, usage rights, attribution requirements, or legal implications for contributors and Users. |
| Technical Clarification | Raise issues seeking clarification on specific technical content within the document. |

- **Attach** relevant files, screenshots, or links to additional resources that provide context or assist in resolving the issue. This can include **references** to related documentation or discussions.

- **Follow issue etiquette** by conducting a search to see if the issue has already been reported before creating a new one. This helps avoid duplicate issues.

##### 8.2.1.2 Guidelines for discussing existing issues in the GitHub repository

When discussing existing issues in the Github repository, please follow these general guidelines:

- **Communicate with respect and courtesy** towards other contributors, maintain a professional tone, and avoid using language that could be interpreted as confrontational or inflammatory.

- Provide **context and background information** to help others understand your perspective. Explain the reasoning behind your comments.

- Communicate your intentions and motivations behind your comments or suggestions to **avoid misunderstandings**.

- Keep **discussions focused on the technical aspects of the issue** at hand.

- Provide **constructive feedback and suggestions** in a helpful and supportive manner. Instead of simply pointing out problems, offer solutions or alternative approaches to address the issue positively.

- Approach discussions with a **mindset of collaboration and problem-solving**.

- Be **open to different perspectives**, as contributors may have different viewpoints, experiences, and expertise levels.

- Contribute to a **positive and welcoming community atmosphere**.

#### 8.2.2 Managing Issues and Pull Requests

Our team is committed to managing issues and pull requests related to this document in a transparent and efficient manner to ensure that all feedback is addressed promptly and effectively. Here's how we manage issues and pull requests to set the right expectations:

- Issue Management: When an issue is submitted, our team will review and prioritise it based on its relevance and impact. We'll keep you informed of the status of your issue and provide updates as it progresses. Once resolved, we'll close the issue and incorporate any necessary changes into the document.

- Pull Request Management: If you submit a pull request with proposed changes or improvements to the document, our team will review it carefully and provide feedback and suggestions for refinement. We'll work collaboratively with you to ensure that your contribution aligns with our document's objectives and maintains consistency and quality. Once approved, we'll merge your changes into the document and acknowledge your contribution.

Your feedback and contributions are essential in helping us maintain the quality and relevance of this document. We value your participation and strive to create a collaborative environment where everyone's contributions are valued and recognised.

### 8.3 Document Versioning

To avoid interoperability issues and changes to the ARF going unnoticed, a version control system and the following semantic versioning scheme (<https://semver.org>) will be used for the ARF.

The ARF document will be published under a standardised release versioning format, *MAJOR.MINOR.PATCH*, where:

**MAJOR** version is incremented (i.e., new version), when the ARF document has undergone significant changes, for example introducing some breaking changes in the architecture,

**MINOR** version is incremented when new information has been added to the document or information has been removed from the document, and

**PATCH** version is incremented when minor changes have been made (e.g., fixing typos).

## 9 References

For undated references, the latest version available applies.

| **Item Reference** | **Standard name/details**|
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| [2015/1505] | [COMMISSION IMPLEMENTING DECISION (EU) 2015/1505](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32015D1505) of 8 September 2015 laying down technical specifications and formats relating to trusted lists pursuant to Article 22(5) of Regulation (EU) No 910/2014 of the European Parliament and of the Council on electronic identification and trust services for electronic transactions in the internal market. |
| [eIDAS 2.0] | [Regulation (EU) 2024/1183](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202401183) of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [Risk Register] | [Regulation (EU) 2024/2981, Annex I](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets |
| [CIR 2024/2977]  | [Commission Implementing Regulation 2024/2977](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402977) of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards person identification data and electronic attestations of attributes issued to European Digital Identity Wallets |
| [CIR 2024/2979] | [Commission Implementing Regulation 2024/2979](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402979) of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets |
| [CIR 2024/2980] | [Commission Implementing Regulation 2024/2980](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402980) of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards notifications to the Commission concerning the European Digital Identity Wallet ecosystem |
| [CIR 2024/2981] | [Regulation (EU) 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981) of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets |
| [CIR 2024/2982] | [Commission Implementing Regulation 2024/2982](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402982) of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards protocols and interfaces to be supported by the European Digital Identity Framework | 
| [ISO/IEC 18013-5]| [ISO/IEC 18013-5](https://www.iso.org/standard/69084.html), Personal identification --- ISO-compliant driving licence - Part 5: Mobile driving licence (mDL) application, First edition, 2021-09. |
| [ISO 3166-1] | [ISO 3166-1](https://www.iso.org/standard/72482.html): Codes for the representation of names of countries and their subdivisions -- Part 1: Country codes: alpha-2 country |
| [ISO 3166-2] | [ISO 3166-2:2020](https://www.iso.org/standard/72483.html): Codes for the representation of names of countries and their subdivisions --- Part 2: Country subdivision code |
| [ETSI TS 119 612]| Electronic Signatures and Infrastructures (ESI); Trusted Lists |
| [ETSI TS 119 431-1]| [ETSI TS 119 431-1](https://www.etsi.org/deliver/etsi_ts/119400_119499/11943101/01.02.01_60/ts_11943101v010201p.pdf) - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 1: TSP service components operating a remote QSCD / SCDev. |
| [ETSI TS 119 431-2]| [ETSI TS 119 431-2](https://www.etsi.org/deliver/etsi_ts/119400_119499/11943102/01.02.01_60/ts_11943102v010201p.pdf) - Electronic Signatures and Infrastructures (ESI); Policy and security requirements for trust service providers; Part 2: TSP service components supporting AdES digital signature creation |
| [ETSI TS 119 432]| [ETSI TS 119 432](https://www.etsi.org/deliver/etsi_ts/119400_119499/119432/01.02.01_60/ts_119432v010201p.pdf) - Electronic Signatures and Infrastructures (ESI); Protocols for remote digital signature creation |
| [ETSI EN 319 132-1]| [ETSI EN 319 132-1](https://www.etsi.org/deliver/etsi_en/319100_319199/31913201/01.03.00_20/en_31913201v010300a.pdf) - Electronic Signatures and Infrastructures (ESI); XAdES digital signatures; Part 1: Building blocks and XAdES baseline signatures (XAdES) |
| [ETSI TS 119 182-1]| [ETSI TS 119 182-1](https://www.etsi.org/deliver/etsi_ts/119100_119199/11918201/01.01.01_60/ts_11918201v010101p.pdf) - Electronic Signatures and Infrastructures (ESI); JAdES digital signatures; Part 1: Building blocks and JAdES baseline signatures |
| [ETSI EN 319 122-1]| [ETSI EN 319 122-1](https://www.etsi.org/deliver/etsi_en/319100_319199/31912201/01.03.01_60/en_31912201v010301p.pdf) - Electronic Signatures and Infrastructures (ESI); CAdES digital signatures; Part 1: Building blocks and CAdES baseline signatures |
| [ETSI EN 319 162-1]| [ETSI EN 319 162-1](https://www.etsi.org/deliver/etsi_en/319100_319199/31916201/01.01.01_60/en_31916201v010101p.pdf) - Electronic Signatures and Infrastructures (ESI); Associated Signature Containers (ASiC); Part 1: Building blocks and ASiC baseline containers |
| [ETSI EN 319 142] | [ETSI EN 319 142](https://www.etsi.org/deliver/etsi_en/319100_319199/31914202/01.01.01_60/en_31914202v010101p.pdf) - Electronic Signatures and Infrastructures (ESI); PAdES digital signatures; Part 1: Building blocks and PAdES baseline signatures |
| [CEN EN 419 241-1]| [CEN EN 419 241-1](https://www.en-standard.eu/csn-en-419241-1-trustworthy-systems-supporting-server-signing-part-1-general-system-security-requirements/) -- Trustworthy Systems Supporting Server Signing - Part 1: General System Security Requirements |
| [SD-JWT VC] | SD-JWT-based Verifiable Credentials (SD-JWT VC). Retrievable from: <https://datatracker.ietf.org/doc/draft-ietf-oauth-sd-jwt-vc/> |
| [RFC 2119] | [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) - Key words for use in RFCs to Indicate Requirement Levels. S. Bradner, March 1997. |
| [RFC 3339] | [RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339) - Date and Time on the Internet: Timestamps, G. Klyne et al., July 2002 |
| [RFC 4122] | [RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122) - A Universally Unique Identifier (UUID) URN Namespace, P. Leach et al., July 2005 |
| [RFC 5280] | [RFC 5280](https://datatracker.ietf.org/doc/html/rfc5280) - Internet X.509 Public Key Infrastructure Certificate and Certificate Revocation List (CRL) Profile, D. Kooper et al., May 2008 |
| [RFC 3647] | [RFC 3647](https://datatracker.ietf.org/doc/html/rfc3647) - Internet X.509 Public Key Infrastructure Certificate Policy and Certification Practices Framework, S. Chokhani et al., November 2003 |
| [RFC 8259] | [RFC 8259](https://datatracker.ietf.org/doc/html/rfc8259) - The JavaScript Object Notation (JSON) Data Interchange Format, T. Bray, Ed., December 2017 |
| [RFC 8610] | [RFC 8610](https://datatracker.ietf.org/doc/html/rfc8610) - Concise Data Definition Language (CDDL): A Notational Convention to Express Concise Binary Object Representation (CBOR) and JSON Data Structures, H. Birkholz et al., June 2019 |
| [RFC 8943] | [RFC 8943](https://datatracker.ietf.org/doc/html/rfc8943) - Concise Binary Object Representation (CBOR) Tags for Date, M. Jones et al., November 2020 |
| [RFC 8949] | [RFC 8949](https://datatracker.ietf.org/doc/html/rfc8949) - Concise Binary Object Representation (CBOR), C. Bormann et al., December 2020 |
| [GP OMAPI] | GPD_SPE_075 [Open Mobile API Specification](https://globalplatform.org/specs-library/open-mobile-api-specification-v3-3/#collapse-), v3.3, July 2018, GlobalPlatform |
| [GP CS] | GPC_SPE_034 [Card Specification](https://globalplatform.org/specs-library/card-specification-v2-3-1/#collapse-), v2.3.1, March 2018, GlobalPlatform |
| [GSMA SAM] | [GSMA Secured Applications for Mobile](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.gsma.com/get-involved/working-groups/wp-content/uploads/2023/11/SAM.01-v1.1-1.pdf&ved=2ahUKEwjFtvKyhOmKAxWuzAIHHWpeLxsQFnoECBgQAQ&usg=AOvVaw3SqJxlMQfs4pzK4cjWqj22), v1.1, 03 November 2023, GSM Association |
| [W3C VCDM v1.1] | Sporny, M., Longley, D. and D. Chadwick, "[Verifiable Credentials Data Model 1.1](https://www.w3.org/TR/vc-data-model/)", W3C Recommendation, 03 March 2022 |
| [W3C VCDM v2.0] | Sporny, M. *et al,* "[Verifiable Credentials Data Model v2.0](https://www.w3.org/TR/vc-data-model-2.0/)", W3C Candidate Recommendations Draft, 16 April 2024 |
| [W3C Digital Credentials API] | Caceres, M., Cappalli, T., Goto, S. *et al,* "[Digital Credentials API](https://wicg.github.io/digital-credentials/)" |
| [W3C WebAuthn] | [Web Authentication](https://www.w3.org/TR/2021/REC-webauthn-2-20210408/), An API for accessing Public Key Credentials Level 2, W3C Recommendation |
| [CTAP] | Client to Authenticator Protocol (CTAP) Review Draft, March 21, 2023. Available:  <https://fidoalliance.org/specs/fido-v2.2-rd-20230321/fido-client-to-authenticator-protocol-v2.2-rd-20230321.html> |
| [OpenID4VCI]| Lodderstedt, T. et al., "OpenID for Verifiable Credential Issuance", OpenID Foundation. Available: <https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html> |
| [OpenID4VP profile for the W3C Digital Credentials API]     | TBD, "OpenID Connect for Verifiable Presentations", OpenID Foundation. Available: <https://openid.net/specs/openid-4-verifiable-presentations-1_0.html> |
| [OpenID4VP] | Terbu O. et al., "OpenID Connect for Verifiable Presentations", OpenID Foundation. Available: <https://openid.net/specs/openid-4-verifiable-presentations-1_0.html> |
| [Topic 6]| Annex 2 - Relying Party authentication and User approval |
| [Topic 7] | Annex 2 - Attestation validity checks and revocation |
| [Topic 9] | Annex 2 - Wallet Unit Attestation |
| [Topic 10] | Annex 2 - Issuing a (Q)EAA to the Wallet Unit |
| [Topic 11] | Annex 2 - Pseudonyms |
| [Topic 12] | Annex 2 - (Q)EAA Rulebook |
| [Topic 16] | Annex 2 - Signing documents with Wallet Unit|
| [Topic 18] | Annex 2 - Relying Party handling Wallet Unit attribute combined presentation |
| [Topic 19] | Annex 2 - User Navigation requirements (Dashboard logs for transparency) |
| [Topic 23] | Annex 2 - PID issuance and (Q)EAA issuance |
| [Topic 25] | Annex 2 - Unified definition and controlled vocabulary for attestation attributes|
| [Topic 26] | Annex 2 - Attestations Catalogue|
| [Topic 27] | Annex 2 - Relying Party registry |
| [Topic 30] | Annex 2 - Interaction between Wallet Units |
| [Topic 31] | Annex 2 - PID, Wallet and Attestation Providers registration |
| [Topic 34] | Annex 2 - Migrate to a different Wallet solution |
| [Topic 37] | Annex 2 - QES -- Remote Signing - Technical Requirements |
| [Topic 38] | Annex 2 - Wallet Unit Revocation |
| [Topic 43] | Annex 2 - Embedded disclosure policy |
| [Topic 50] | Annex 2 - Blueprint to report unlawful or suspicious request of data |

## 10 Annexes

- [Annex 1](./annexes/annex-1/annex-1-definitions.md) - Definitions

- [Annex 2](./annexes/annex-2/annex-2-high-level-requirements.md) - High Level Requirements

- [Annex 3] - Rulebooks <span id="annex-3"><span>

    - [Annex 3.1](./annexes/annex-3/annex-3.01-pid-rulebook.md) - PID rulebook

    - [Annex 3.2](./annexes/annex-3/annex-3.02-mDL-rulebook.md) - mDL rulebook

- Annex 4 - Service Blueprints <span id="annex-4"><span>

    - [Annex 4.1](./annexes/annex-4/annex-4.01-eudi-wallet-initialisation-and-activation.pdf) - Blueprint Initialisation and activation

    - [Annex 4.2](./annexes/annex-4/annex-4.02-eudi-wallet-online-identification-and-authentication.pdf) - Blueprint Online identification and authentication

    - [Annex 4.3](./annexes/annex-4/annex-4.03-eudi-wallet-issuing-mdl.pdf) - Blueprint Issuing mDL

    - [Annex 4.4](./annexes/annex-4/annex-4.04-eudi-wallet-presenting-mdl-proximity-supervised.pdf) - Blueprint Presenting mDL (proximity-supervised)

    - [Annex 4.5](./annexes/annex-4/annex-4.05-eudi-wallet-presenting-mdl-proximity-unsupervised.pdf) - Blueprint Presenting mDL (proximity-unsupervised)

    - [Annex 4.6](./annexes/annex-4/annex-4.06-Remote-qes-creating-a-signature-eudi-wallet-used-for-authentication-authorisation.pdf) - Blueprint Remote QES -- Creating a signature for authentication / authorisation

    - [Annex 4.7](./annexes/annex-4/annex-4.07-remote-qes-enrolment.pdf) - Blueprint Remote QES - Enrolment

    - [Annex 4.8](./annexes/annex-4/annex-4.08-remote-qes-creating-a-signature-channeled-by-eudi-wallet.pdf) - Blueprint Remote QES - Creating a signature channelled by a Wallet Unit

    - [Annex 4.9](./annexes/annex-4/annex-4.09-remote-qes-creating-a-signature-channeled-by-relying-party.pdf) - Blueprint Remote QES - Creating a signature channelled by Relying Party

    - [Annex 4.10](./annexes/annex-4/annex-4.10-qes-view-history-of-signatures.pdf) - Blueprint QES -- View history of signatures

    - [Annex 4.11](./annexes/annex-4/annex-4.11-local-qes-enrolment.pdf) - Blueprint Local QES - Enrolment

    - [Annex 4.12](./annexes/annex-4/annex-4.12-local-qes-creating-a-signature.pdf) - Blueprint Local QES -- Creating a signature.

- Annex 5 - Design guides

    - [Annex 5.1](./annexes/annex-5/annex-5.01-design-guide.pdf) - Wallet Unit design guide

    - [Annex 5.2](./annexes/annex-5/annex-5.02-design-guide-data-sharing-scenarios.pdf) - Wallet Unit design guide -- data sharing scenarios
