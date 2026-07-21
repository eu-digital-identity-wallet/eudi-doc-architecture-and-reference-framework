## 7 Wallet Solution Certification and Risk Management

### 7.1 Introduction

This chapter briefly describes the certification of Wallet Solutions and the eID
schemes under which they are provided, covering the overall certification
approach, design principles, and main requirements outlined in the
[European Digital Identity Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183) and Commission Implementing Regulation [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981) laying down rules for on the certification of Wallet Solutions. Furthermore, references are made to the Annex I of CIR 2024/2981, and to the [Risk Register](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) supporting the risk-based approach of the Wallet Solutions. For more detailed requirements, please refer to CIR 2024/2981
itself.

The [European Digital Identity Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183)
requires certification of Wallet Solutions to ensure conformity of the Wallet
Solutions with functional, security, and privacy-related requirements, to
achieve a high level of interoperability, security, and trustworthiness.
Certification applies to the Wallet Solutions and the eID schemes under which
they are provided; for ease of reading this chapter only refers to Wallet
Solutions. Furthermore, the object of certification includes software
components, hardware components (in cases where they are provided directly or
indirectly by the Wallet Provider) and the processes that support the provision
and operation of a Wallet Solution, such as Wallet Unit activation, see
[Section 6.5.3][653-wallet-unit-activation].

The aim is to harmonise the implementation of the requirements laid down by the
[European Digital Identity Regulation] and avoid divergent approaches to the
maximum extent possible. For this reason, the Commission requested ENISA to
prepare a candidate European certification scheme under the [Cybersecurity Act](https://eur-lex.europa.eu/eli/reg/2019/881/oj) (CSA). As defining and
adopting a dedicated, harmonised certification scheme for Wallet Solutions
depends on agreements between Member States on detailed security requirements,
on the availability of underlying certification schemes, and on established good
practices in the Member States themselves, a transitory approach is foreseen by
means of national certification schemes.

In other words, the certification approach for Wallet Solutions follows two
phases. In the short-term, Member States provide national (transitory)
certification schemes. In the medium term, a harmonised CSA scheme will be
established. When the CSA-based scheme becomes available, it replaces the
national schemes as for cybersecurity requirements. The schemes may continue to
exist for functional requirements.

### 7.2 Certification of Wallet Solutions against national certification schemes

Until a dedicated Wallet Solution cybersecurity certification scheme under the
CSA is available, the [European Digital Identity Regulation] requires Member
States to establish national certification schemes. This will be done in time to
make available the Wallet Solutions before the end of 2026. The Commission has
adopted the [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981)
to provide the main requirements on Member States for creation of national
certification schemes. The [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981)
and resulting national certification schemes are defined around a number
of guiding principles:

First, the goal is to **harmonise** requirements to the extent possible. Member
States are also encouraged to work together in the design and implementation of
national schemes. Additionally, national schemes will leverage the use of
**relevant and existing certification schemes and standards** for Wallet Solution
certification and evaluation. Where available, relevant European CSA schemes
must be used. Currently, only the Common Criteria-based European candidate
cybersecurity certification [EUCC](https://certification.enisa.europa.eu/about-eu-certification/developing-certification-schemes_en)
scheme is available for the cybersecurity certification of ICT products, parts,
or components for products. Upcoming CSA-based schemes include
[EUCS](https://certification.enisa.europa.eu/about-eu-certification/developing-certification-schemes_en)
and [EU5G](https://certification.enisa.europa.eu/about-eu-certification/developing-certification-schemes_en).
Additionally, other existing or upcoming schemes include schemes based on
FITCEM (EN 17640), national schemes such as on remote identity verification, or
other private schemes (e.g. for mobile devices and apps). For harmonisation of
functional requirements, the Commission Implementing Regulations (CIRs) adopted
under the [European Digital Identity Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183)
article 5(a) are referenced. For harmonisation of certification requirements,
the [ISO/IEC 17065] framework under Regulation [765/2008] is used, complemented by
[ISO/IEC 17067] on the definition of schemes.

Next, the [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981)
refers to the **composite nature** of the Wallet Solutions as well as the potential
different architectures in Member States, considering that the
[European Digital Identity Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183)
is technology (and architecture) neutral. This means that a final ('top-level')
certification of the Wallet Solution will yield a composite certificate, built
on certification of separate components, such as EUCC certification. Wallet
Solutions are always to be certified against assurance level High, as set out
in the [European Digital Identity Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183)
as well as [CIR (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ%3AJOL_2015_235_R_0002).
That assurance level has to be reached by the overall Wallet Solution. Under
this Regulation, some components of the Wallet Solution may be certified at a
lower assurance level, provided this is duly justified and without prejudice to
the assurance level High reached by the overall Wallet Solution. For the use
of assurance information from other certification schemes or sources, a
dependency analysis will be performed.

Finally, in order to ensure a harmonised approach to cybersecurity and the
assessment of the most critical risks that might affect the provision and
operation of Wallet Units, a **register of risks and threats** is defined, see
[Section 7.4][74-risk-based-approach-and-risk-register].
The [Risk Register](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I)
contains high level risks and threats in relation to Wallet Solutions and the
ecosystem, as well as detailed threat scenarios that will be taken into
consideration when designing Wallet Solutions, independent of their specific
architecture.

As a first step towards certification of Wallet Solutions under national
schemes, Member States will assign a scheme owner, and design and roll out the
scheme. As part of this process,  Conformity Assessment Bodies (CABs) will be accredited
to carry out conformity assessments of Wallet Solutions against the requirements
of the [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981)
and the national scheme. Wallet Providers then request one or more designated
CABs to assess and certify the conformity of their Wallet Solution. The CAB
evaluates and certifies the conformity of the Wallet Solution if they meet the
requirements.

The European Commission and ENISA support Member States in designing and
implementing national certification schemes in the Cooperation Group.

Once a Wallet Solution has been certified, the Member State submits information about that certification to the Commission and the Cooperation Group in accordance with [CIR 2025/849].

### 7.3 Certification of Wallet Solutions against a dedicated CSA-based scheme

In parallel to the work described above, ENISA is requested to draft a dedicated
European cybersecurity certification scheme for the Wallet Solutions under the
[CSA](https://eur-lex.europa.eu/eli/reg/2019/881/oj). Once available, this
CSA-based scheme will replace the national transitory schemes mentioned above
for the cybersecurity requirement it covers. This scheme will be based on
available national schemes and harmonised requirements. It will identify any additional
requirements relevant for cybersecurity. The scheme will further detail the
cybersecurity requirements, identify and set normative standards, and define the
target level of assurance or security for the relevant Wallet Solution
components.

The work to develop the CSA-based scheme follows the milestones set out by the
[CSA](https://eur-lex.europa.eu/eli/reg/2019/881/oj) and is supported by the Ad
Hoc Working Group or '[AHWG](https://www.enisa.europa.eu/news/call-for-experts-join-the-enisa-ad-hoc-working-group-on-eu-digital-identity-wallets-cybersecurity-certification)'.
This group is composed of selected experts from private organisations and
industry, with extensive knowledge and experience in the areas of cybersecurity
certification, digital wallets, electronic identification, and trust services.
The first step is to have a candidate scheme ready for public consultation and
submitted for feedback of the European Cybersecurity Certification Group or
[ECCG](https://digital-strategy.ec.europa.eu/en/policies/cybersecurity-certification-group).
The ECCG's opinion serves as advisory input to ensure the candidate scheme
aligns to EU cybersecurity objectives, standards and regulatory requirements.
Although the ECCG's opinion is not binding, it will hold significant influence,
as it reflects the collective expertise of national cybersecurity authorities,
aiming to harmonise cybersecurity certification practices across Member States.
Based on this input, the candidate scheme might be updated further. After
finalisation of the ECCG opinion, the scheme will be transformed into a new
Implementing Regulation and adopted by comitology procedure.

Finally, ENISA is also asked to facilitate the transition from national
certification schemes to the dedicated cybersecurity certification scheme under
the CSA.

### 7.4 Risk-based approach and risk register

#### 7.4.1 Introduction

This section details the approach to develop harmonised guidelines for the
development of the transitory national certification schemes. In addition to the
requirements set out in the [European Digital Identity Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183)
article 5c, cybersecurity risks and threats associated with the Wallet Solutions
will be identified. Here, a risk-based approach is envisioned as the basis for
certification by Member States, ensuring that the Wallet Solutions uphold
confidentiality, availability, and strong safeguards for User privacy and data
protection. This is inspired by known processes, such as for the General Data
Protection Regulation ([GDPR](https://eur-lex.europa.eu/eli/reg/2016/679/oj))
and related Data Protection Impact Assessments (DPIA).

The risk-based approach sets out a common [Risk Register](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I)
that contains a comprehensive but non-exhaustive list of risks and threats
related to the Wallet Solution. These risks and threats are
architecture-agnostic and provide a benchmark overview of the most critical
risks and threats to Wallet Solutions. By adopting this common set of risks and
threats, national transitory certification schemes will achieve a baseline level
of harmonisation.

The risk register will be applied by scheme owners, Wallet Providers, and
 Conformity Assessment Bodies. When establishing their certification schemes,
scheme owners will perform a risk assessment to refine and complement the risks
and threats listed in the register with those specific to their architecture,
and consider how the applicable risks and threats can be appropriately treated.
Wallet Providers will complement the scheme's risk assessment to identify any
risks and threats specific to their implementation and propose appropriate
mitigation measures for evaluation by the CAB.

#### 7.4.2 High-level risks and threats

The following is an excerpt from [Risk Register]. To keep in line with the
continuously evolving threat landscape, the risk register will be maintained and
regularly updated in collaboration with the Cooperation Group.

High-level risks and threats

- R1 Creation or use of an existing electronic identity
- R2 Creation or use of a fake electronic identity
- R3 Creation or use of fake attributes
- R4 Identity theft
- R5 Data theft
- R6 Data disclosure
- R7 Data manipulation
- R8 Data loss
- R9 Unauthorised transaction
- R10 Transaction manipulation
- R11 Repudiation
- R12 Transaction data disclosure
- R13 Service disruption
- R14 Surveillance

System-related risks

- SR1 Wholesale surveillance
- SR2 Reputational damage
- SR3 Legal non-compliance

Technical threats

- TT1 Physical attacks

    - 1.1 Theft
    - 1.2 Information leakage
    - 1.3 Tampering

- TT2 Errors and misconfigurations

    - 2.1 Errors made when managing an IT system
    - 2.2 Application-level errors or usage errors
    - 2.3 Development-time errors and system misconfigurations

- TT3 Use of unreliable sources

    - 3.1 Erroneous use or configuration of wallet components

- TT4 Failure and outages

    - 4.1 Failure or dysfunction of equipment, devices or systems
    - 4.2 Loss of resources
    - 4.3 Loss of support services

- TT5 Malicious actions

    - 5.1 Interception of information
    - 5.2 Phishing and spoofing
    - 5.3 Replay of messages
    - 5.4 Brute-force attack
    - 5.5 Software vulnerabilities
    - 5.6 Supply chain attacks
    - 5.7 Malware
    - 5.8 Random number prediction

#### 7.4.3 Risks and mitigation measures discussed in Chapter 6 of this ARF

##### 7.4.3.1 Introduction

This section briefly discusses some of the risks that were considered when the
trust model in [Chapter 6][6-trust-model] was created, together with the
mitigations for these risks and the residual risks that remain after these
mitigations. This section is not intended to be a comprehensive risk register
for the EUDI Wallet ecosystem as a whole; for that register, see [Risk Register]
and [Section 7.4.2][742-high-level-risks-and-threats] above. This section is
limited to the scope of the ARF, namely, the Wallet Unit and its interactions
with other entities in the ecosystem, as depicted in [Figure 12][61-scope] in
Chapter 6.

##### 7.4.3.2 Risks and mitigation measures related to confidentiality, integrity, and authenticity

Within the EUDI Wallet ecosystem, many interactions take place between entities
in which one entity requests another entity to perform a task. For example, a
User may ask a PID Provider or an Attestation Provider to provide a PID or an
attestation to a Wallet Unit, or a Relying Party may ask a User to present
attributes from an attestation in their Wallet Unit.
For any of these interactions, the following risks apply:

- An attacker could impersonate one of the interacting entities. Therefore, the
receiver of a message must be able to verify the identity of the sender, and
vice versa. In other words, mutual authentication is needed. This authentication
can be performed because valid entities in the EUDI Wallet ecosystem are put on
a Trusted List or List of Trusted Entities (LoTE); see [Section 3.5][35-trusted-list-provider-or-lote-provider]. By verifying the signature over a message and
verifying the associated public key certificates with a trust anchor included in
a Trusted List or LoTE, the receiver of a message can be sure about the identity of the
message's sender.
- Messages between entities could be intercepted, meaning that they could be read
by an attacker. To mitigate this risk, messages must be encrypted to ensure
confidentiality.
- Intercepted messages could be changed by an attacker. To mitigate this risk,
messages must be authenticated, so that the receiver can verify that they originate
from the authenticated sender and were not changed.

##### 7.4.3.3 Risks and mitigation measures related to tampering of cryptographic keys and sensitive data

The mechanisms for authentication and confidentiality described in the previous
section rely on the security of cryptographic keys, especially private and
secret keys. If an attacker can obtain, use, or tamper with these keys, these
security mechanisms would break down. Therefore, all critical assets on
Wallet Units are managed by dedicated secure applications (WSCAs), running on
secure hardware (WSCDs), as described in [Section 4.3][43-reference-architecture].
The security of WSCDs and WSCAs is ensured by means of an appropriate certification
process.

Similar mitigation measures apply for all other entities in the EUDI Wallet
ecosystem that use cryptographic keys, including Wallet Providers, PID Providers
and Attestation Providers, Trusted List Providers and LoTE Providers, Providers of registration
certificates, and Access Certificate Authorities. Such parties will typically
use a certified Hardware Security Module (HSM) for managing private and secret
keys. For Relying Parties and Relying Party Instances, such measures are
formally not required.

A WSCA/WSCD or keystore in a Wallet Unit may also be used to store sensitive data
other than cryptographic keys. In particular, they could be used to store User
attributes, in such a way that attackers, including malicious applications
residing on the same User device as the Wallet Instance, cannot retrieve these
attributes. This could be beneficial for User privacy.

##### 7.4.3.4 Risks and mitigation measures related to authorisation

In certain cases, there is a risk that a legitimate entity within the EUDI Wallet
ecosystem may attempt to perform actions beyond its authorised scope. This risk
primarily affects two types of actors:

First, a Relying Party in the EUDI Wallet ecosystem may attempt to request
attributes from a Wallet Unit that it does not reasonably need for its use case.
This risk of 'overasking' is mitigated by three measures:

1. **Selective Disclosure and User Control** - The attestation formats and protocols
   specified in [ISO/IEC 18013-5] and [SD-JWT VC] (in combination with [OpenID4VP]) enable selective disclosure of attributes. This allows a Relying Party to specify which attributes within an attestation it wishes to receive while excluding others, a feature known as *collection limitation*. Additionally, selective disclosure ensures that the User retains control over their data, as they can approve or deny the presentation of requested attributes. More details on selective disclosure and User approval can be found in [Section 6.6.3.5][6635-wallet-unit-obtains-user-approval-for-presenting-selected-attributes].
1. **Mandatory Relying Party Registration of Attributes Intended to be Requested** -
  The [European Digital Identity Regulation] mandates that each Relying Party must
  register the attributes it intends to request from Wallet Units. According to [CIR 2024/2982](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=OJ:L_202402982),
  the Member State Registrar publishes the data registered about each Relying Party in a publicly accessible register, both in a human-readable and machine-readable format. The Registrar also includes these registered attributes in a Relying Party registration
  certificate, which it issues to the Relying Party. The Relying Party then includes this registration certificate in the presentation request, such that the Wallet Unit can use it to verify the legitimacy of the
  request and inform the User accordingly. This transparency ensures that Users
  can make an informed decision about whether to approve or deny the
  presentation of the requested attributes. More details on this requirement can
  be found in [Section 6.6.3.3][6633-wallet-unit-verifies-that-relying-party-does-not-request-more-attributes-than-it-registered].
1. **Attestation Provider Disclosure Policy Enforcement** - The [European
  Digital Identity Regulation] also mandates that Attestation Providers can
  embed a disclosure policy within their attestations. This policy may include
  rules governing whether the Attestation Provider approves the presentation of
  this attestation to an authenticated Relying Party. The Wallet Unit evaluates
  this policy —if present— using authenticated data in the registration certificate of the Relying Party,
  and informs the User of the outcome. This mechanism further supports the User
  in making a well-informed decision on whether to approve or deny attribute
  presentation. More information on disclosure policy enforcement can be found
  in [Sections 6.6.2.8][6628-provisioning-embedded-disclosure-policies] and
  [6.6.3.4][6634-wallet-unit-evaluates-embedded-disclosure-policy-if-present].

Second, an Attestation Provider may attempt to issue attestations for which it
lacks the necessary authorisation. For example, an Attestation Provider that has
not been officially designated by a Member State or another relevant authority
to issue diplomas may still attempt to generate an attestation of the diploma
type. Wallet Units can mitigate this risk in a manner similar to the one described in the second bullet point above, by inspecting the registration
certificate of the Attestation Provider before requesting that
Attestation Provider to issue an attestation to the Wallet Unit. Relying Parties can 
query the online service of the Registrar after receiving an attestation issued by a specific
Attestation Provider, to verify that the Attestation Provider is registered for
issuing that type of attestation.

##### 7.4.3.5 Risks and mitigation measures related to User privacy

###### 7.4.3.5.1 Linkability

User privacy is a very important consideration in the design and implementation
of the EUDI Wallet ecosystem. An important aspect of privacy is unlinkability.
Unlinkability implies that, if a User presents attributes from an attestation
multiple times, the receiving Relying Parties cannot link these separate
presentations to conclude that they concern the same User.

Within the EUDI Wallet ecosystem, attributes are presented in electronic
attestations containing unique, fixed elements such as hash values, salts,
public keys, and signatures. Malicious Relying Parties could exploit these
values to track Users by storing and comparing them across multiple
transactions, identifying recurring patterns. This privacy threat, known as
**Relying Party linkability**, can occur within a single Relying Party or among
colluding entities. It can also occur when a third party attacks the systems of
one or more Relying Parties, resulting in a data breach. For
that reason, Relying Parties will discard the unique fixed elements in received
attestations as soon as they no longer need these elements.

A similar privacy threat arises when colluding Relying Parties share the unique
values they obtained from an attestation with a malicious PID Provider or
Attestation Provider. This allow the PID Provider or Attestation Provider to
track User activity across multiple services. This form of linkability is called
**Attestation Provider linkability**.

This topic is discussed in more detail in the [Discussion Paper for Topic A](../discussion-topics/a-privacy-risks-and-mitigations.md).

###### 7.4.3.5.2 Mitigating Relying Party linkability

Regarding the mitigation of Relying Party linkability: A trustworthy PID
Provider or Attestation Provider can mitigate Relying Party linkability fully by
issuing multiple technical PIDs or attestations to the same Wallet Unit, all representing the same logical PID or attestation. (For the difference between logical and technical attestations, see [Section 5.3][53-logical-versus-technical-pids-and-attestations].)

Wallet Units can use
these technical attestations as disposable (single-use) attestations, which ensures
attestations can never be linked by Relying Parties. [Topic 10 in Annex 2](../annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a237-topic-10-issuing-a-pid-or-attestation-to-a-wallet-unit)
calls this **method A**, 'once-only attestations', and requires Wallet Solutions to support
this method. It also specifies how a PID Provider or Attestation Provider can
indicate that they want a Wallet Unit to treat their PIDs or attestations in
this way.

However, the 'once-only' approach increases issuance complexity and management
overhead. Therefore, [Topic 10][topic-10]
also mandates support for another solution, where technical PIDs and attestations are
valid for a limited time only. This limits the number of technical PIDs and attestations
to be issued, but only partially mitigates Relying Party linkability. Topic
10 calls this **method B**, 'limited-time attestations'.

Furthermore, Topic 10 describes two other approaches, which are optionally
supported by Wallet Solutions, namely:

- the Attestation Provider issues technical attestations in batches to the Wallet Unit.
The Wallet Unit then uses the attestations from a batch in a random order, until
it has presented all attestations in the batch once. Then it 'resets' the batch
and starts using them again in a random order. Topic 10 calls this **method C**,
'rotating-batch attestations'.
- the Wallet Unit will present different technical attestations to different Relying
Parties. However, in case a Relying Party requests attributes from this
attestation multiple times, the Wallet Unit will present the same attestation to
this Relying Party each time. Topic 10 calls this **method D**, 'Per-Relying Party
attestations'.

Additionally, organisational and enforcement measures can help deter Relying
Parties from colluding and tracking Users. In particular, Relying Parties found
in violation will have their access certificates revoked, preventing them from
further interactions with Wallet Units.

###### 7.4.3.5.3 Zero-Knowledge Proofs

> **NOTE: Discussions on Zero-Knowledge Proofs (ZKPs) are ongoing. No specific
ZKP has been selected to be supported by components in the EUDI Wallet
ecosystem. For more information, see** 
>
> - **[Technical Specification 4](../technical-specifications/ts4-zkp.md) Specification for ZKP Implementation in EUDI Wallet,**
> - **[Technical Specification 13](../technical-specifications/ts13-zksnark.md) Specification for the implementation of Zero-Knowledge Proofs based on arithmetic circuits in the EUDI Wallet, and**
> - **[Technical Specification 14](../technical-specifications/ts14-zkps-from-mms.md) Specification for the implementation of Zero-Knowledge Proofs based on multi-message signatures in the EUDI Wallet.**

Unlike Relying Party linkability, Attestation Provider linkability cannot be fully eliminated when using
attestation formats using a proof mechanism based on salted hashes. The only viable mitigation is to
adopt Zero-Knowledge Proofs (ZKPs) as a proof mechanism instead of
relying on salted-attribute hashes. A Zero-Knowledge Proof (ZKP) is a
cryptographic protocol that allows one party (the prover) to convince another
party (the verifier) that a given statement is true without revealing any
additional information beyond the validity of the statement itself. This ensures
that the verifier gains no knowledge about how the prover knows the statement to
be true, thus preserving privacy while enabling trust.

However, the integration of ZKPs in the EUDI Wallet ecosystem is still under
discussion and development, due to the complexity of implementing ZKP solutions
in secure hardware and the lack of support in currently available secure
hardware (WSCDs). As with Relying Party linkability, organisational and
enforcement measures can help deter Attestation Providers from colluding and
tracking Users. Additionally, many Attestation Providers are subject to regular
audits, making it easier to detect collusion and tracking compared to Relying
Parties.

Zero-Knowledge Proof (ZKP) mechanisms for verifying personal information are
highly promising and essential for ensuring privacy in various use cases. They
enable Users to prove statements such as "I am over 18" without disclosing any
personal data, offering a robust solution for privacy-preserving authentication
and verification.

One area of development is age verification, where the European Commission
is actively exploring and testing ZKP-based solutions. The outcomes of this
initiative could pave the way for the adoption of ZKPs within the EUDI Wallet
ecosystem, further strengthening privacy protections in future implementations.

The [Discussion Paper for Topic G](../discussion-topics/g-zero-knowledge-proof.md)
(Zero-Knowledge Proofs) presents the (desired) privacy properties of
Zero-Knowledge Proof schemes. It introduces the main families of Zero-Knowledge
Proof schemes and gives an overview of representative solutions. Finally, it
discusses topics related to the integration of Zero-Knowledge Proof schemes into
the EUDI Wallet ecosystem.

High-level requirements for Zero-Knowledge Proofs to be used in the EUDI Wallet
ecosystem are included in [Topic 53][topic-53]
of Annex 2.

### 7.5 Functional conformance (FCAF)

[Section 7.2][72-certification-of-wallet-solutions-against-national-certification-schemes]
and [Section 7.3][73-certification-of-wallet-solutions-against-a-dedicated-csa-based-scheme]
address the certification of Wallet Solutions against cybersecurity requirements.
In addition, the [European Digital Identity Regulation](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183)
and [CIR 2024/2981](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981)
require conformity assessment of the **functional requirements** that Wallet
Solutions must support. These are defined in the Commission Implementing
Regulations referenced in Annex III of [CIR 2024/2981], in particular:

- integrity and core functionalities — [CIR 2024/2979];
- protocols and interfaces — [CIR 2024/2982]; and
- person identification data and electronic attestations of attributes — [CIR 2024/2977].

To harmonise how these requirements are assessed during certification, the
European Commission and the Member States, through the EDICG, are establishing
the **Functional Conformance Assessment Framework (FCAF)**, published and
maintained at [conformance.eudi.dev](https://conformance.eudi.dev). The FCAF
provides a shared, transparent, and reusable set of test cases and supporting
framework content that Conformity Assessment Bodies (CABs), test laboratories,
Wallet Providers, tool vendors, and other stakeholders can apply consistently.

The FCAF's overriding goal is **interoperability**: a Wallet Unit, PID Provider,
Attestation Provider, or Relying Party built to the same tested requirements
should work with any other, across implementations and Member States. Its
objectives are to:

- **drive interoperability**, so that independently built components operate
together seamlessly;
- **prevent market fragmentation**, by giving every stakeholder a single, shared
set of test cases and expected results;
- **make conformance testing coherent and comparable**, so that results from
different CABs and test laboratories are consistent and reproducible;
- **ensure uniform adherence to the functional and functional-security
requirements** set out in the applicable CIRs, standards, and technical
specifications;
- **reduce certification costs and duplication**, by making the test material
reusable across schemes and Member States; and
- **increase transparency and auditability** of the testing process.

The FCAF assesses functional conformance only: it demonstrates that a Wallet
Solution behaves as required by the applicable standards, technical
specifications, profiles, and regulatory requirements, and that it can
interoperate within the EUDI Wallet ecosystem. This covers both:

- **external interfaces** of the Wallet Solution, for example towards PID
Providers and Attestation Providers, Relying Parties, and infrastructure
components; and
- **internal functional requirements** that cannot be validated through a
standardised external interface, and which may therefore require structured
manual testing or observation of behaviour — for example, a Wallet Unit
requesting User approval before sharing attributes with a Relying Party.

Functional conformance is therefore one component of the national EUDI Wallet
certification schemes, and complements rather than replaces the security
evaluation in [Section 7.2][72-certification-of-wallet-solutions-against-national-certification-schemes]
and [Section 7.3][73-certification-of-wallet-solutions-against-a-dedicated-csa-based-scheme]:
the FCAF supplies the test cases for the functional requirements, but does not by
itself provide cybersecurity assurance, nor does it cover non-functional testing
such as performance, scalability, penetration, or availability testing. The other
components defined in [CIR 2024/2981] — including the cybersecurity and risk-based
requirements described above and the risk register referred to in
[European Digital Identity Regulation] Article 5c — must also be met for full
certification.

Finally, the FCAF neither provides nor mandates testing tools or execution
environments; such tooling may be developed externally and used by CABs, test
laboratories, or other implementers. Because the FCAF is developed and released
independently of this ARF, this document does not reproduce its detailed structure
or versioning; [conformance.eudi.dev](https://conformance.eudi.dev) remains the
authoritative and up-to-date source for its content.

