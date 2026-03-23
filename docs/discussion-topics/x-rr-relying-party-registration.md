
Version 0.1, updated 19 March 2026

[Link to GitHub discussion](https://www.github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/645)

# Topic X - Relying Party Registration (Revision Round)

### Legal notice: All legal information and excerpts documented in Section 2 is based on the European Digital Identity Regulation (EU) 2024/1183 and the current public consultation draft of the Commission Implementing Regulation for Relying Party registration. The latter is undergoing changes due to consultation process, and thus this document may need modification after the publication and approval of the final CIR.

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the 2026 revision round (RR) version of Discussion Paper for the European Digital Identity Cooperation Group regarding Topic X: Relying Party registration.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_This topic is to gather High level Requirements (HLR) for Relying Party registration. The HLR relate to information necessary for authentication to access European Digital Identity Wallets, and to relying parties’ contact details and their intended use of wallets, including what data relying parties may ask users for_.

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to the Relying Party registration. This part is mostly unmodified from the 2025 version.
- Chapter 3 updates the map of relevant new specifications, and presents and discusses a list of identified issues on the revision round, with suggested changes and/or new High-Level Requirements related to this topic.

- Chapter 4 keeps a log of the additions and changes that will be made to High Level Requirements in the ARF as a result of discussing this topic with Member States. The ARF version and HLRs referenced in this discussion paper is version 2.8.0.

- Chapter 5 will, after completion of the revision round, present the additions and changes that will be made to the ARF main document as a result of the discussions. It will also provide and assessment of necessary changes in related technical specifications.

## 2 Legal Requirements for Relying Party registration

Two legal texts impose direct requirements on the Relying Party registration: The evolving [CIR for RP-Registration](https://eur-lex.europa.eu/eli/reg_impl/2025/848/oj/eng) and the [European Digital Identity Regulation]. This section recaps the respective legal requirements from these sources.

### 2.1 [European Digital Identity Regulation] about Relying Party registration

The [European Digital Identity Regulation] requires the Relying Parties to be registered. It specifies the following requirements related to Relying Party registration:

1. Setting up national registers of registered wallet-relying parties in each Member State
2. Registering Relying Party needs to provide at minimum, a definite set of information necessary to authenticate to EUDI Wallets including the intended use and indication of data requested for this use from the user
3. Relying Parties shall only request data that is registered for the intended use
4. Member States shall make the Relying Party register information available to the public in a manner that is both human and machine-readable
5. Member States shall provide a common mechanism for authenticating the Relying Parties in the European Digital Identity ecosystem
6. An Intermediary that is acting on behalf of relying parties is deemed to be a Relying Party, but shall not store data exchanged between the EUDI Wallet user and intermediated Relying Party
7. The European Commission shall establish technical specifications and procedures to support the registration process, publication of the registries, updates of registration information by means of implementing acts.

Below are the actual excerpts from the Regulation, including the recitals and the Articles that establish these requirements.

**Recital (17)**

_For the purposes of registration, relying parties should provide the information necessary to allow for their electronic identification and authentication towards European Digital Identity Wallets. When declaring their intended use of the European Digital Identity Wallet, relying parties should provide information regarding the data that they will request, if any, in order to provide their services and the reason for the request.
Relying party registration facilitates the verification by Member States with regard to the lawfulness of the activities of the relying parties in accordance with Union law. The obligation to register provided for in this Regulation should be without prejudice to obligations laid down in other Union or national law, such as the information to be provided to the data subjects pursuant to the Regulation (EU) 2016/679. Relying parties should comply with the safeguards offered by Articles 35 and 36 of that Regulation, in particular by performing data protection impact assessments and by consulting the competent data protection authorities prior to data processing where data protection impact assessments indicate that the processing would result in a high risk. Such safeguards should support the lawful processing of personal data by relying parties, in particular with regard to special categories of data, such as health data. The registration of relying parties is intended to enhance transparency and trust in the use of European Digital Identity Wallets.
Registration should be cost-effective and proportionate to the related risks in order to ensure uptake by service providers. In that context, registration should provide for the use of automated procedures, including the reliance on and the use of existing registers by Member States, and should not entail a pre-authorisation process.
The registration process should enable a variety of use-cases that can differ in terms of mode of operation, whether online or in offline mode, or in terms of the requirement to authenticate devices for the purposes of interfacing with the European Digital Identity Wallet.
Registration should apply exclusively to relying parties providing services by means of digital interaction._

**Recital (18)**

_Safeguarding Union citizens and residents in the Union against the unauthorised or fraudulent use of European Digital Identity Wallets is of high importance for ensuring trust in and for the wide uptake of European Digital Identity Wallets. Users should be provided with effective protection against such misuse. In particular, when facts that form the basis for fraudulent or otherwise illegal use of a European Digital Identity Wallet are established by a national judicial authority in the context of another procedure, supervisory bodies that are responsible for European Digital Identity Wallet issuers should, upon notification, take the necessary measures to ensure that the registration of the relying party and the inclusion of relying parties in the authentication mechanism are withdrawn or suspended until the notifying authority confirms that the irregularities identified have been remedied._

**Article 3**

Definitions

_‘relying party’ means a natural or legal person that relies upon electronic identification, European Digital Identity Wallets or other electronic identification means, or upon a trust service;_

**Article 5b - European Digital Identity Wallet-Relying Parties**

1. _Where a relying party intends to rely upon European Digital Identity Wallets_
_for the provision of public or private services by means of digital_
_interaction, the relying party shall register in the Member State where it is_
_established._
2. _The registration process shall be cost-effective and proportionate-to-risk._
_The relying party shall provide at least:_
_(a) the information necessary to authenticate to European Digital Identity Wallets, which as a minimum includes:_
_(i) the Member State in which the relying party is established; and_
_(ii) the name of the relying party and, where applicable, its registration number as stated in an official record together with identification data of that official record;_
_(b) the contact details of the relying party;_
_(c) the intended use of European Digital Identity Wallets, including a indication of the data to be requested by the relying party from users._
3. _Relying parties shall not request users to provide any data other than that_
_indicated pursuant to paragraph 2, point (c)._
4. _Paragraphs 1 and 2 shall be without prejudice to Union or national law that_
_is applicable to the provision of specific services._
5. _Member States shall make the information referred to in paragraph 2_
_publicly available online in electronically signed or sealed form suitable for_
_automated processing._
6. _Relying parties registered in accordance with this Article shall inform_
_Member States without delay about any changes to the information provided_
_in the registration pursuant to paragraph 2._
7. _Member States shall provide a common mechanism for allowing the_
_identification and authentication of relying parties, as referred to in Article_
_5a(5), point (c)._
_…_
8. _Intermediaries acting on behalf of relying parties shall be deemed to be_
_relying parties and shall not store data about the content of the transaction._
9. _By ... [6 months from the date of entry into force of this amending_
_Regulation], the Commission shall establish technical specifications and_
_procedures for the requirements referred to in paragraphs 2, 5 and 6 to 9 of this_
_Article by means of implementing acts on the implementation of European_
_Digital Identity Wallets as referred to in Article 5a(23). Those implementing_
_acts shall be adopted in accordance with the examination procedure referred_
_to in Article 48(2)._
_..._

### 2.2 CIR on Relying Party registration

The \[CIR for RP-Registration\] specifies the following requirements related to Relying Party registration:


1. The roles:

- wallet-relying party - a type of the relying party; includes: service providers, PID providers, attestation providers, trust service providers and intermediaries;
- registrar

1. Setting up at each Member State one or more national registers of registered wallet-relying parties.
2. Make this information available to the public in a manner that is both human and machine-readable - via an API and website. The information made available shall be signed or sealed.
3. Member States should set out and publish one or more registration policies applicable to national registers set up in their territory
4. Wallet-relying parties should provide the necessary information (during registration process), including their entitlement(s), for inclusion in the national registers
5. Registrars should set up online and, where applicable, automated registration processes and shall verify registration information provided by the wallet-relying party in an automated manner where possible.
6. The registrant receives:

- one or more ‘Wallet-Relying Party Access Certificates’, and
- one or more 'Wallet-Relying Party Registration Certificates'

7. Wallets authenticate wallet-relying parties with use of the Wallet-Relying Party Access Certificates.
8. In a transaction, a wallet solution shall inform the wallet user whenever the wallet-relying party is asking for more information than what they have registered as intended use and the user will have possibility to reject the transaction (as well as to make a claim or report the case to a competent authority).
9. The registrar may suspend or cancel the registration with or without prior notice to the affected wallet-relying party based on proportionality assessment, taking into account the impact on the fundamental rights, privacy, security and confidentiality of the users in the eco-system, as well as the severity of the disruption caused by the suspension or cancellation and the associated costs, both for the wallet-relying party and the user.


The list of information to be provided by a wallet-relying party during registration (as per Annex I):

- official name of the wallet-relying party
- one or more official identifiers of the wallet-relying party (EORI, LEI, VAT number...)
- physical address and member state if not present in official identifier
- URL belonging to the wallet-relying party where applicable
- Detailed contact information
- description of the type of services provided
- a list of the attributes that the relying party intends to request
- a description of intended use of the data
- indication whether the wallet-relying party is a public sector body
- applicable entitlement(s) of the wallet-relying party


The list of possible entitlements (as per Annex I):

- Service_Provider
- QEAA_Provider
- Non_Q_EAA_Provider
- PUB_EAA_Provider
- PID_Provider
- QCert_for_ESeal_Provider
- QCert_for_ESig_Provider
- rQSigCDs_Provider
- rQSealCDs_Provider
- ESig_ESeal_Creation_Provider
- WAC_Provider

Requirements for electronic signatures or seals applied to the information made available on registered wallet-relying parties (as per Annex II):

- shall be JSON advanced electronic signatures at conformance level B-B, B-T or B-LT, and comply with ETSI TS 119 182-1 (JAdES baseline signatures)

Requirements on the API for the register (as per Annex II):

- be a REST API, supporting JSON as format with JAdES or ASIC signature format
- allow any requestor, without prior authentication, to make (search/read) requests to the register, for information about a wallet-relying party
- be published and documented using OpenAPI version 3 

Requirements for wallet-relying party access certificates (as per Annex IV):

- issued under certificate policy and certificate practice statement compliant with IETF RFC 3647
- certificate to include: a clear description of the public key infrastructure hierarchy and certification
paths from the end-entity wallet-relying party access certificates up to the top of the hierarchy used for issuing them, while indicating the expected trust anchor(s) in such hierarchy and paths; - a machine processable reference to the applicable certificate policy and certificate practice statement; and - the information referred to in Annex I, points 1, 2, 3, 5(b) and 5(d)

Requirements for wallet-relying party registration certificates (as per ANNEX V):

- issued under certificate policy and certificate practice statement compliant with IETF RFC 3647 and
IETF RFC 5755
- certificate to include: - the location where the certificate supporting the advanced
electronic signature or advanced electronic seal on that certificate is
available, for the entire certification path to be built up to the expected
trust anchor in the public key infrastructure hierarchy used by the
provider; - machine processable reference to the applicable certificate policy and certificate practice statement; - registration information referred to in Annex I (points 1, 2 and 8; and - to comply with IETF RFC 5755 to express attributes in relation to wallet-relying party registration certificates

Below are selected excerpts from the public consultation \[CIR for RP-Registration\], including the recitals and the Articles that establish these requirements.

**Recital (1)**

_Member States should establish and maintain registers of registered wallet-relying parties established in their territory._

**Recital (4)**

_In order to facilitate the consultation of the information on registered wallet-relying parties across the Union, Member States should make this information available to the public in a manner that is both human and machine-readable._

**Recital (6)**

_As registration policies are a useful tool for providing clear guidance to the wallet-relying parties on the registration process, Member States should set out and publish the registration policies applicable to registers set up in their territory._

**Recital (7)**

_[...] another objective of the relying party registration is to facilitate the verification by Member States of the lawfulness of the activities of the wallet-relying parties. Therefore, wallet-relying parties should provide, for inclusion in the registers the necessary information, including their entitlement(s)._

**Recital (8)**

_In order to ensure that the registration process is cost-effective and proportionate-to risk, and to strike an appropriate balance between meeting a high level of transparency and safety on the one hand and ensuring uptake by service providers on the other hand, registrars should set up online and, where applicable, automated registration processes for wallet-relying parties that are easy to use and they should verify applications for registration without undue delay._

**Recital (10)**

_[...] wallet-relying parties should use wallet-relying party access certificates when they identify themselves to wallet units. To guarantee interoperability of those certificates across all wallets provided within the Union, wallet-relying parties access certificates should adhere to common requirements set-out in the Annex to this Regulation_

**Recital (11)**

_[...] wallet-relying parties are not to request users to provide any data other than those indicated for the intended use of wallets during the registration process. Wallet users should be enabled to verify the registration data of wallet-relying parties. To enable wallet users to verify that the attributes being requested by the wallet-relying party are within the scope of their registered attributes, Member States may require the issuance of wallet-relying party registration certificates to registered wallet-relying parties. To ensure the interoperability of the wallet-relying party registration certificates, Member States should ensure that those certificates meet the requirements and standards set out in the Annex of this Implementing Regulation._

**Recital (12)**
_[...] registrars should be able to suspend or cancel the registration of any wallet-relying party without prior notice where the registrars have reason to believe that the registration contains information which is not accurate, not up to date or misleading, the wallet-relying party is not compliant with the registration policy or the wallet-relying party is otherwise acting in breach of Union or national law in a way that relates to their role as a wallet-relying party. In order to safeguard the stability of the wallet ecosystem, the decision to suspend or cancel a registration should be proportionate to the service disruption caused by the suspension or cancellation and the associated cost and inconvenience for the service provider and the user. For the same reason, supervisory bodies are to be enabled to suspend and cancel the registration required pursuant to Article 46a(4), point (f) of Regulation (EU) No 910/2014._

**Article 2**

Key definitions

_‘wallet-relying party’ means a relying party that intends to rely upon wallet units for the provision of public or private services by means of digital interaction;_

_‘register of wallet-relying parties’ means an electronic register used by a Member State to make information on wallet-relying parties registered in that Member State publicly available as set out in Article 5b(5) of Regulation (EU) No 910/2014;_

_‘provider of wallet-relying party access certificates’ means a natural or legal person mandated by a Member State to issue wallet-relying party access certificates to wallet-relying parties registered in that Member State;_

_‘wallet-relying party access certificate’ means a certificate for electronic seals or signatures authenticating and validating the wallet-relying party issued by a provider of wallet-relying party access certificates;_

_‘registrar of wallet-relying parties’ means a body responsible for establishing and maintaining a list of registered wallet-relying parties established in their territory who has been designated by a Member State;_

_‘wallet-relying party registration certificate’ means a data object that indicates the attributes the relying party has registered to intend to request from users;_

_‘provider of wallet-relying party registration certificates’ means a natural or legal person mandated by a Member State to issue wallet-relying party registration certificates to wallet-relying parties registered in that Member State._

**Article 3**

National registers

_2. Member States shall make the information set out in Annex I on registered wallet-relying parties from all national registers publicly available online, both in human readable form and in a form suitable for automated processing_

_3. The information shall be available through a single national application programming interface (‘API’) and through a national website. It shall be electronically signed or sealed by or on behalf of the registrar, in accordance with the requirements set out in Section 1 of Annex II._

**Article 4**

Registration policies

_1. Member States shall lay down and publish one or more national registration policies applicable to national registers._

_3. The registration policy shall cover at least the following points:_

 _(a) the identification and authentication procedures applicable to wallet-relying parties during the registration process;_

 _(b) the supporting documentation to be provided by the wallet-relying party to establish their identity, business registration, any applicable entitlement(s), and other relevant information that is required under the registration policy;_

 _(c) where applicable, the description of the authentic sources or other official electronic records in the Member State where the register is set up, that can be relied upon to provide accurate data, information or other evidence required as part of the registration process;_

 _(d) where applicable, the automated means supported to enable wallet-relying parties to register or to update an existing registration;_

 _(e) the means of redress available to wallet-relying parties under the law of the Member State where the register is set up;_

 _(f) the rules and procedures for the verification of the identity of the registered wallet-relying party and of any other relevant information provided by that party._

**Article 6**

The registration process

_3. Registrars shall verify, where applicable, in an automated manner:_

 _(a) the accuracy and validity of the information required under Article 5;_

 _(b) where applicable, the power of attorney of a representative of the wallet-relying party in accordance with the laws and procedures of the Member State where the register is set up;_

 _(c) the type of entitlement(s) of the wallet-relying party as set out in **Annex I.**_

_4. The verification of the information referred to in paragraph 3 shall include an authenticity and validity assessment of the provided information against the supporting documentation provided by the wallet-relying parties and against any authentic sources or other official electronic records in the Member State where the register is set up and to which the registrars have access in accordance with national law. The verification of entitlements of wallet-relying parties shall be carried out in accordance with **Annex III**._

_5. When a wallet-relying party no longer intends to rely upon wallet units for the provision of public or private services under a specific registration, it shall notify the relevant registrar without undue delay and request the cancellation of that registration._

**Article 7**

Wallet-relying party access certificates

_1. Member States shall ensure that providers of wallet-relying party access certificates issue wallet-relying party access certificates to wallet-relying parties registered in accordance with the requirements set out in Article 4 to Article 6 of this Regulation._

_2. Member States shall set up dedicated certificate policies and certificate practice statements in accordance with the requirements set out in Annex IV. Member States shall ensure that wallet-relying party access certificates meet the requirements set out in **Annex IV**._

**Article 8**

Wallet-relying party registration certificates

_1. Member States may require providers of wallet-relying party registration certificates to issue wallet-relying party registration certificates to wallet-relying parties registered in accordance with the requirements set out in Article 4 to Article 6 of this Regulation._

_2. Where Member States require the provision of wallet-relying party registration certificates, Member States shall ensure that these certificates meet the requirements set out in **Annex V**._

**Article 9**
Suspension and cancellation

_1. Registrars may suspend or cancel a registration of a wallet-relying party where such a suspension or cancellation is requested by a supervisory body pursuant to Article 46a(4), point (f) of Regulation (EU) No 910/2014 or where the registrars have reasons to believe that:_
_(a) the registration contains information which is not accurate, not up to date or misleading;_
_(b) the wallet-relying party is not compliant with the registration policy;_
_(c) the wallet-relying party is requesting more attributes than what they have registered in accordance with Article 5 and Article 6 of this Regulation;_
_(d) the wallet-relying party is otherwise acting in breach of Union or law of that Member State in a way that relates to their role as a wallet-relying party;_

_4. When considering the suspension or cancellation in accordance with Article 9 paragraph 2, the registrar shall conduct a proportionality assessment, taking into account the impact on the fundamental rights privacy, security and confidentiality of the users in the eco-system, as well as the severity of the disruption caused by the suspension or cancellation and the associated costs, both for the wallet-relying party and the user. Based on the result of this assessment, the registrar may suspend or cancel the registration with or without prior notice to the affected wallet-relying party._

**ANNEX I**

(summary)

Information regarding wallet-relying parties

- name of the wallet-relying party as stated in official record
- one or more identifiers of the wallet-relying party (EORI, LEI, VAT number...)
- physical address
- Detailed contact information
- a description of the type of services provided
- a list of the attributes, that the relying party intends to request
- description of intended use of the attributes
- indication whether the wallet-relying party is a public sector body
- applicable entitlement(s) of the wallet-relying party
- whether the wallet-relying party relies upon an intermediary
- an association to the intermediary relied upon

The possible entitlements of the wallet-relying party:

- Service_Provider
- QEAA_Provider
- Non_Q_EAA_Provider
- PUB_EAA_Provider
- PID_Provider
- QCert_for_ESeal_Provider
- QCert_for_ESig_Provider
- rQSigCDs_Provider
- rQSealCDs_Provider
- ESig_ESeal_Creation_Provider
- WAC_Provider

_5. Detailed contact information of the wallet-relying party, one or more, including:_
_(a) a website for providing helpdesk and support;_
_(b) a phone number where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;_
_(c) a digital address where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;_
_(d) an e-mail address where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;_

_7. A list of the attributes that the relying party intends to request, expressed as a friendly name and a technical name including the namespace that the attributes are grouped under in a machine-readable format for automated processing, with an indication if they are mandatory or optional._

**ANNEX II**

(summary)

_1. REQUIREMENTS ON ELECTRONIC SIGNATURES OR SEALS APPLIED TO THE INFORMATION MADE AVAILABLE ON REGISTERED WALLET-RELYING PARTIES_

- The file format used by the API: be JavaScript Object Notation (JSON)
- electronic signatures and electronic seals - JSON advanced electronic signatures at conformance level B-B, B-T or B-LT, comply with ETSI TS 119 182-1 V1.2.1 (JAdES baseline signatures)

_2. REQUIREMENTS ON THE SINGLE API_

- REST API, supporting JSON data format
- published as OpenAPI version 3
- allow any requestor, without prior authentication, to make (search/read) requests to the register
- provide security functions in order to ensure the availability and integrity of the API and the information available through it. The API shall be secure by default and by design.


**ANNEX III**

(summary)

_Source of documentary evidence for the verification of entitlements of wallet-relying parties_

- verification of qualified trust service providers - shall be based on the national trusted lists
- verification of non-qualified trust service providers - shall be based on the national trusted lists or on national MS verification procedures (set out in their registration policies)
- verification of providers of person identification data - shall be based on the list of providers of person identification data published by the Commission in accordance with Article 5a(18) of Regulation (EU) No 910/2014
- verification of providers of electronic attestations of attributes issued by or on behalf of a public sector body responsible for an authentic source - shall be based on the list published by the Commission in accordance with Article 45f(3) of Regulation (EU) No 910/2014

**ANNEX IV**

(summary)

_Requirements for wallet-relying party access certificates_

- X.509 certificate with certificate policy and certificate practice statement
- shall comply with IETF RFC 3647
- plus additional requirements set out in the Annex IV

**ANNEX V**

(summary)

_Requirements for wallet-relying party registration certificates_

- certificate policy and certificate practice statement shall comply with IETF RFC 3647 and IETF RFC 5755
- includes the information referred to in Annex I, points 1, 2 and 8;
- expresses attributes in way compliant with IETF RFC 5755;
- plus additional requirements set out in the Annex V.

## 3 Discussion 

The Relying Party registration covers from functional perspective of the ARF and the European Digital Identity ecosystem the following aspects:

1) The **Registrar function** for which the Member States are responsible to organise this function, register and a publicly accessible API at a national level. These are defined on the European Commission specifications [Specification of common formats and API for Relying Party Registration information](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) and the ongoing update of \[CIR for RP-Registration\]).
2) The registration process mandated to be followed by all Relying Parties resulting in issuance of one or more **Wallet-Relying Party Access Certificates** (RPAC) and, where issued by the Member State, as many **Wallet-Relying Party Registration Certificates** (RPRC) as the Relying Party has dedicated intended uses (use cases, services provided to the EUDI Wallet Users). For minimum information to be registered the European Commission has published the technical specification for [Common Set of Relying Party Information to be Registered](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md).
3) The **operational use of aforementioned certificates** in Relying Party transactions with the EUDI Wallet Units and their Users. This has been redefined in several ARF Topics with HLRs and in ETSI technical specifications for specifying the relying party access certificates [TS 119 411-8](https://www.etsi.org/deliver/etsi_ts/119400_119499/11941108/01.01.01_60/ts_11941108v010101p.pdf), relying party registration certificates [TS 119 475](https://www.etsi.org/deliver/etsi_ts/119400_119499/119475/01.01.01_60/ts_119475v010101p.pdf), and profiles for EAA presentation [TS 119 472-2](https://www.etsi.org/deliver/etsi_ts/119400_119499/11947202/01.01.01_60/ts_11947202v010101p.pdf) and EAA issuance [TS 119 472-3](https://www.etsi.org/deliver/etsi_ts/119400_119499/11947203/01.01.01_60/ts_11947203v010101p.pdf).
4) **Handling the functional revocation of Relying Party certificates** as necessitated by the legal requirements. This is partially defined in the ARF and in [ETSI TS 119 411-8](https://www.etsi.org/deliver/etsi_ts/119400_119499/11941108/01.01.01_60/ts_11941108v010101p.pdf) and [TS 119 475](https://www.etsi.org/deliver/etsi_ts/119400_119499/119475/01.01.01_60/ts_119475v010101p.pdf). 
5) How the registration and operational use of the RP registration certificates shall be done when **the Relying Party relies upon another Relying Party that is acting on its behalf (an intermediary)** to provide its intended use towards the Wallet Units. This has been specified in the ARF Topic 44 and in [Specification of common formats and API for Relying Party Registration information](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md).

Having analysed the combined legal requirements, the latest ARF (release 2.8.0) and the (at this point only partial) EUDIW Coordination Group feedback which the European Commission received in the first meeting of the topic X discussion revision round, this section of the paper raises  following key questions for discussion. Discussion should be kept at level of High-Level Requirements relevant for the ARF, not yet as specific technical corrigenda to the applicable technical specifications of the EC or ETSI, which will be collected to section 5 at the end of the revision round.

### 3.1 Mix of Access certificates, multiple Relying Party instances and multiple services of a Relying Party

There appears a need to clarify the difference between a "Relying Party Instance" (RPI), which is covered currently in ARF Topics 6 (Relying Party Authentication) and 27 (Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and non-qualified EAAs, and Relying Parties) and an individual, intended use-bound service instance of a (potentially large) Relying Party. 

Relying Party Instance is defined in ARF section 3.11.2: "A Relying Party uses a system consisting of software and hardware to interact with Wallet Units. The ARF calls such a system a Relying Party Instance. A Relying Party Instance maintains an interface with Wallet Units to request PIDs and attestations. It implements Relying Party authentication, using an access certificate obtained by the Relying Party, as described in Section 6.6.3.2. Note that a Relying Party can operate multiple Relying Party Instances."

The set-up option that the ARF and the specifications are missing is one where the access certificate of an RPI needs to be bound to the Intended Use of RP's individual service which is served (only) via this RPI. This option is necessary to disallow the RPIs of an RP to have in practice 'wildcard RPACs' that could be used in serving all registered Intended uses (i.e. different services) of the given Relying Party. This would allow over-asking of information from Wallet Users by malicious actor that has gained access to a single access certificate of the breached RP (threat scenario details - see section 3.2.1 below).

It seems that the complete EC documentation on RPRCs is superfluous regarding how the RPs are supposed to register their Intended uses; an incorrect definition can be found in TS5 (v1.3) Registry API's get/wrp/{identifier} method, indicating that a given RP identifier could match at best only one registration instance, whereas the intended response is to return all WRP objects found behind the queried identifier. The intention is that each Intended use is registered by the RP, thus the RP will receive a RPRC per each Intended use (service). This needs a clarification on TS5, and a change on the API to deliver an Intended use specific dataset, not a full WRP object with individual Intended use objects within an embedded array.
´
In summary, a new, optional identifier to allow binding the Intended use specific RPRC (or, if not issued then the registrar-provided data for this Intended use) to a particular RPI-bound RPAC is needed. This implies new HLRs and changes to the respective technical specifications. These cover the RP data model, RPAC and RPRC certificate elements and the Registry API methods.

Initial new HLRs are proposed to add an optional **service identifier** attribute into the RP registration information:

| **Index (Tentative)** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_12    |  When indicated in the Relying Party's registration data for an Intended use, a Relying Party Instance specific access certificate should be bound to Relying Party -provided internal Relying Party Instance identifier in addition to the Relying Party unique identifier required by the [CIR for Relying-Party Registration]. *Note: The identifier for binding an Intended use to a specific RPAC could be e.g. an existing client_id or alternatively a service endpoint URL. First option would bind the intended use and its client_id to an RPAC through the OpenID4VP hash, the latter would allow RPAC key rotation without a need to renew the Intended use/RPRC registration simultaneously. Provisioning the optional identifier and ensuring its uniqueness is responsibility of the registering Relying Party.* | New | 
| Reg_33    |  The access certificate shall provide for an optional data element to carry the Relying Party Instance identifier of Reg_12. | New |
| RPRC_04a    |  The registration certificate shall provide for an optional data element to carry the Relying Party Instance identifier of Reg_12. | New |
| RPRC_04b    |  If the subject of the registration certificate wants to bind an Intended use to a specific access certificate, the binding to the service SHALL consist of the Relying Party Instance identifier of Reg_12. Note: This Relying Party Instance identifier is identical to the one in the access certificate of the Relying Party Instance responsible for providing the Intended use / service. | New |

### 3.2 TS5 Registry API specific problems

#### 3.2.1 Compromised service attack

A "compromised service attack" scenario could unfold as follows, if registration certificates are not issued to RPs by a Registry: A malicious actor manages to hijack a single Relying Party Instance (RPI) of a large organisation that has several services run over a volume of RPIs. Through using the Registry API to provide details of RP's all currently registered Intended uses from the Registry. Then, selecting a suitable IntendedUseIdentifier from the RP's registered set the hijacked service could over-ask attributes from a WU via using its compromised RPAC, thus breaking the RP's intended internal data minimisation and privacy protections between RP's individual Relying Party Instances.

What if the Wallet Unit's verification query to Registry API against a presentation request would always be performed by a combination of organization Identifier plus IntendedUseIdentifier, presumably always returning only the given Intended use's registered set of requested attestation & attributes - and thus allow the WU to run over-asking analysis against a malicious RP's presentation request?

The narrowed verification query would not work, since scenario's attacker could probably learn the IntendedUseIdentifiers of other services of the RP by querying and listing the open API. To avoid this, the IndendedUseIdentifiers would need to be kept secret, which would not be very practical. Thus, introducing an optional binding mechanism is necessary, both when using certificates as well as when falling back to using the API.

#### 3.2.2 Condensed WRP object as Registry API query response

Another problem identified with large organisations: The GET /wrp/{identifier} endpoint currently returns a single, "condensed" Relying Party object corresponding to multiple Instances using the same RP identifier. All instances are expected to have the RP-level common name or trade name (the TradeName attribute).
+ a condensed response will not work in practice, as large organizations will use different TradeNames for their services.
+ TradeName is what Wallet Users will see in UI, and this must be recognisable for citizens
+ thus for large organisations TradeName should be possible as a Relying Party Instance -dependent (Intended use-dependent) attribute.

A practical example related to TradeNames under same organisation, from a current production configuration in the public sector:
+ "Helsenorge" ("HealthNorway"):  the national citizen health portal where you can see your health journal, appointments, vaccines etc.
+ "HelseCERT" - common CERT portal for security personnel in all municipalities as well as regional and national level health organisations.
+ "HelseID" - a proxy IDP broker for health professionals (doctors, nurses, etc)

All these three services are **operated by the same organization, under identical business identifier**. They are registered as three different OIDC clients, each having different `client_name` which is shown to the end-user when logging in.
+ To mimic this structure, the Registry API would need to return an array of TradeName strings belonging to the condensed entry under the current design.
+ It is probably better to return them as three separate RPI-specific, Intended-use bound object instances. This would mean changing the Intended use class in TS5 to contain the TradeName, instead of having it on the WRP class.
+ The binding of a TradeName to RPs allocated RPI is made with the (optional) RPI identifier that the RP would register for their Intended use. This again means changing the IntendedUse class to contain this attribute.

#### 3.2.3 Binding an Intended use to an Intermediary

This problem sounds similar to issue discussed in context of secrtions 3.2.1 and 3.2.2, with new nuances that need to be discussed and documented.

#### 3.2.4 A list of problems identified in TS5 API (expected to be delivered latest to the 2nd focus group meeting)

To be discussed when available.

### 3.3 Provisioning and distribution of large numbers of Relying Party access certificates

The Member States have need for guidance on how to scale the RPAC distribution to e.g. individual mobile reader apps used by the government agencies (e.g. Law Enforcement) or for example large private entities running automatic payment terminals in 4-5 digit volumes.

To be discussed further in the second focus group meeting. Initially, the EC recommends the member states to consult available product or service providers in the mobile device management and certificate provider marketplace.

## 4 Current HLRs and Proposals of Changes

The ARF, Annex 2, Topic 6, Topic 27, Topic 44 and Topic 52, contains a number of High-Level Requirements related to the topic.

Topic 6 covers Relying Party authentication through utilisation of access certificates. The Topic 27 requirements cover general requirements for Member State registration processes and specific requirements for the registration of Relying Parties, whereas Topic 44 covers issuance of Relying Party registration certificates. Topic 52 focuses on the intermediaries.

After completing two focus group meetings of the revision round all existing HLRs from the ARF version 2.8.0 will be listed in the tables below for EDICG review, along with a proposal to keep, change, add, or remove the HLR.

### 4.1 Topic 6 - Relying Party authentication and User approval

A. Relying Party authentication

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |


### 4.2 Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and (non-qualified) EAAs, and Relying Parties

A.  General requirements for Member State registration processes

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

B. *General requirements for the issuance of access certificates*

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

C. *Requirements for the registration of PID Providers*

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

D. *Requirements for the registration of Attestation Providers*

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

E. Requirements for the registration of Relying Parties

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

F.  *Requirements for the issuance of Relying Party Instance access certificates*

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

### 4.3 Topic 44 - Relying Party Registration Certificates

A. Issuance of Relying Party registration certificates

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

### 4.4 Topic 52 - Relying Party Intermediaries

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|           |                                                              |              |

## 5 Additions and Changes to the ARF and related technical specifications


The agreed Annex 2 HLR changes will be listed in Section 4. 

Any identified changes that are necessary in RP Registration related technical specifications (TS5 and TS6, published standard organisation specifications related to RPACs, RPRCs) will be collected to this section.



## 6 References

| Reference | Description |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | [Architecture and Reference Framework Maintenance and Development Workplan for 2026, European Commission](https://ec.europa.eu/digital-building-blocks/wikis/spaces/CG/pages/835683474/a.+The+Architecture+and+Reference+Framework+Maintenance+and+Development+Workplan+for+2026) |
| [Topic 6]                              | Topic 6 - Relying Party authentication and User approval     |
| [Topic 27]                             | Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and (non-qualified) EAAs, and Relying Parties |
| [Topic 31]                             | Topic 31 - PID Provider, Wallet Provider, Attestation Provider, and Access Certificate Authority notification and publication          |
| [Topic 44]                             | Topic 44 - Relying Party registration certificates           |
| [Topic 52]                             | Topic 52 - Relying Party intermediaries                      |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
| [European Digital Identity Regulation] | [Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework](https://eur-lex.europa.eu/eli/reg/2024/1183/oj) |
| [CIR for RP-Registration] | [Commission Implementing Regulation (EU) 2025/848 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the registration of wallet-relying parties](https://eur-lex.europa.eu/eli/reg_impl/2025/848/oj/eng) |
| [OID4VP]                               | [OpenID for Verifiable Presentations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) |
| [ETSI TS 119 475]                      | [ETSI TS 119 475 V1.1.1 Electronic Signatures and Trust Infrastructure (ESI); Relying Party attributes supporting EUDI Wallet user's authorisation decisions](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/287)                                     |
| [ETSI TS 119 411-8]                      | [ETSI TS 119 411-8 V1.1.1 Electronic Signatures and Trust Infrastructure (ESI); Policy and security requirements for Trust Service Providers issuing certificates; Part 8: Access Certificate Policy for EUDI Wallet Relying Parties](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/286)                                     |
| [ETSI TS 119 472-2]                      | [ETSI TS 119 472-2 V1.1.1 Electronic Signatures and Trust Infrastructure (ESI); Profiles for Electronic Attestation of Attributes; Part 2: Profiles for EAA/PID Presentations to Relying Party](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/285)                                     |
| [ETSI TS 119 472-3]                      | [ETSI TS 119 472-3 V1.1.1 Electronic Signatures and Trust Infrastructure (ESI); Profiles for Electronic Attestation of Attributes; Part 3: Profiles for issuance of EAA or PID](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/398)                                     |
| [ETSI EN 319 401]                      | [ETSI Electronic Signatures and Infrastructures; General Policy Requirements for Trust Service Providers](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/140)                     |
| [ETSI TS 119 461]                      | [ETSI Electronic Signatures and Infrastructures; Policy and security requirements for trust service components providing identity proofing of trust service subjects](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/271)                         |
| [ETSI EN 319 412-1]                    | [ETSI Electronic Signatures and Infrastructures; Certificate Profiles, Part 1: Overview and common data structures](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/178)                                                          |

