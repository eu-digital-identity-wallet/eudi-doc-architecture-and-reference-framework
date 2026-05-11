
Version 1.0, updated 8 May 2026

[Link to GitHub discussion](https://www.github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/645)

# Topic X - Relying Party Registration (Revision Round)

**Legal notice: All legal information and excerpts documented in Section 2 is based on the European Digital Identity Regulation (EU) 2024/1183 and the current public consultation draft of the Commission Implementing Regulation for Relying Party registration. The latter is undergoing changes due to the consultation process, and thus this document may need modification after the publication and approval of the final CIR.**

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the 2026 revision round (RR) version of Discussion Paper for the European Digital Identity Cooperation Group regarding Topic X: Relying Party registration.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_This topic is to gather High-Level Requirements (HLR) for Relying Party registration. The HLR relate to information necessary for authentication to access European Digital Identity Wallets, and to relying parties’ contact details and their intended use of wallets, including what data relying parties may ask users for_.

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to the Relying Party registration. This part is mostly unmodified from the 2025 version.
- Chapter 3 updates the map of relevant new specifications, and presents and discusses a list of identified issues to be discussed in the revision round, with suggested changes and/or new High-Level Requirements related to this topic.

- Chapter 4 keeps a log of the additions and changes that will be made to High-Level Requirements in the ARF as a result of discussing this topic with Member States. The ARF version and HLRs referenced in this discussion paper is version 2.8.0.

- Chapter 5 will, after completion of the revision round, present the additions and changes that will be made to the ARF main document as a result of the discussions. It will also provide and assessment of necessary changes in related technical specifications.

## 2 Legal Requirements for Relying Party registration

Two legal texts impose direct requirements on the Relying Party registration process: The evolving [CIR for RP-Registration](https://eur-lex.europa.eu/eli/reg_impl/2025/848/oj/eng) and the [European Digital Identity Regulation]. This section recaps the respective legal requirements from these sources.

### 2.1 [European Digital Identity Regulation] about Relying Party registration

The [European Digital Identity Regulation] requires the Relying Parties to be registered. It specifies the following requirements related to Relying Party registration:

1. Member States shall set up national registers of registered wallet-relying parties.
2. A registering Relying Party shall provide, at minimum, a definite set of information necessary to authenticate to EUDI Wallets, including the Relying Party's intended use and indication of the data that will be requested for this use from the user.
3. Relying Parties shall only request data that they have registered for an intended use.
4. Member States shall make the Relying Party register information available to the public in a manner that is both human-readable and machine-readable.
5. Member States shall provide a common mechanism for authenticating the registered Relying Parties in the European Digital Identity ecosystem.
6. An Intermediary that is acting on behalf of a Relying Party is deemed to be a Relying Party, but shall not store any data exchanged between the EUDI Wallet user and the intermediated Relying Party.
7. The European Commission shall establish technical specifications and procedures to support the registration process, publication of the registries, updates of registration information by means of implementing acts.

Below are the actual excerpts from the Regulation, including the recitals and the Articles that establish these requirements.

#### Recital (17)

_For the purposes of registration, relying parties should provide the information necessary to allow for their electronic identification and authentication towards European Digital Identity Wallets. When declaring their intended use of the European Digital Identity Wallet, relying parties should provide information regarding the data that they will request, if any, in order to provide their services and the reason for the request.
Relying party registration facilitates the verification by Member States with regard to the lawfulness of the activities of the relying parties in accordance with Union law. The obligation to register provided for in this Regulation should be without prejudice to obligations laid down in other Union or national law, such as the information to be provided to the data subjects pursuant to the Regulation (EU) 2016/679. Relying parties should comply with the safeguards offered by Articles 35 and 36 of that Regulation, in particular by performing data protection impact assessments and by consulting the competent data protection authorities prior to data processing where data protection impact assessments indicate that the processing would result in a high risk. Such safeguards should support the lawful processing of personal data by relying parties, in particular with regard to special categories of data, such as health data. The registration of relying parties is intended to enhance transparency and trust in the use of European Digital Identity Wallets.
Registration should be cost-effective and proportionate to the related risks in order to ensure uptake by service providers. In that context, registration should provide for the use of automated procedures, including the reliance on and the use of existing registers by Member States, and should not entail a pre-authorisation process.
The registration process should enable a variety of use-cases that can differ in terms of mode of operation, whether online or in offline mode, or in terms of the requirement to authenticate devices for the purposes of interfacing with the European Digital Identity Wallet.
Registration should apply exclusively to relying parties providing services by means of digital interaction._

#### Recital (18)

_Safeguarding Union citizens and residents in the Union against the unauthorised or fraudulent use of European Digital Identity Wallets is of high importance for ensuring trust in and for the wide uptake of European Digital Identity Wallets. Users should be provided with effective protection against such misuse. In particular, when facts that form the basis for fraudulent or otherwise illegal use of a European Digital Identity Wallet are established by a national judicial authority in the context of another procedure, supervisory bodies that are responsible for European Digital Identity Wallet issuers should, upon notification, take the necessary measures to ensure that the registration of the relying party and the inclusion of relying parties in the authentication mechanism are withdrawn or suspended until the notifying authority confirms that the irregularities identified have been remedied._

#### Article 3

Definitions

_‘relying party’ means a natural or legal person that relies upon electronic identification, European Digital Identity Wallets or other electronic identification means, or upon a trust service;_

#### Article 5b - European Digital Identity Wallet-Relying Parties

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

The [CIR for RP-Registration](https://data.europa.eu/eli/reg_impl/2025/848/oj) specifies the following requirements related to Relying Party registration:

The roles:

- wallet-relying party - a type of the relying party; includes: service providers, PID providers, attestation providers, trust service providers and intermediaries;
- registrar

1. Set up in each Member State one or more national registers of registered wallet-relying parties.
2. Make the registered information available to the public in a manner that is both human and machine-readable - via an API and website. The information made available shall be signed or sealed.
3. Member States should set out and publish one or more registration policies applicable to national registers set up in their territory.
4. During the registration process, wallet-relying parties should provide the necessary information, including their entitlement(s), for inclusion in the national registers.
5. Registrars should set up online and, where applicable, automated registration processes and shall verify registration information provided by the wallet-relying party in an automated manner where possible.
6. The registrant receives:
    - one or more ‘Wallet-Relying Party Access Certificates’, and
    - where issued by the Member State, one or more 'Wallet-Relying Party Registration Certificates'
7. Wallets authenticate wallet-relying parties by verifying the Wallet-Relying Party Access Certificates.
8. In a transaction, a wallet shall inform the wallet user whenever the wallet-relying party is asking for more information than what they have registered in the context of their intended use, and the user will have the possibility to refuse presentation of the requested data. The user will also have the possibility to report the case to a competent authority).
9. The registrar may suspend or cancel the registration with or without prior notice to the affected wallet-relying party, based on a proportionality assessment, taking into account the impact on the fundamental rights, privacy, security, and confidentiality of the users in the eco-system, as well as the severity of the disruption caused by the suspension or cancellation and the associated costs, both for the wallet-relying party and the user.

The list of information to be provided by a wallet-relying party during registration (as per Annex I):

- official name of the wallet-relying party
- a user-friendly name of the wallet-relying party that can be either a trade name or service name that is recognisable to the user where applicable
- one or more official identifiers of the wallet-relying party (EORI, LEI, VAT number...)
- physical address and member state if not present in official identifier
- URL belonging to the wallet-relying party where applicable
- Detailed contact information
- description of the type of services provided
- a list of the attestations and attributes that the relying party intends to request
- a description of intended use of the data
- indication whether the wallet-relying party is a public sector body
- indication whether the wallet-relying party relies upon an intermediary acting on behalf of the relying party who intends to rely upon the wallet where applicable
- an association to the intermediary that the wallet-relying party is relying upon that is acting on behalf of the relying party who intends to rely upon the wallet where applicable
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

Requirements for electronic signatures or seals applied to the information made available on registered wallet-relying parties (as per Annex II):

- shall be JSON Web Signatures complying with IETF RFC 7515.

Requirements on the API for the register (as per Annex II):

- shall be a REST API, supporting JSON as format with JSON Web Signatures as the signature format,
- shall allow any requestor, without prior authentication, to make (search/read) requests to the register, for information about a wallet-relying party,
- shall be published and documented using OpenAPI version 3.

Requirements for wallet-relying party access certificates (as per Annex IV):

- shall be issued under a certificate policy and an certificate practice statement compliant with NCP requirements in ETSI EN 319411-1 v1.4.1.
- the certificate shall include:
    - the location where the certificate supporting the advanced electronic signature or advanced electronic
seal on that certificate is available, for the entire certification path to be built up to the expected trust
anchor in the public key infrastructure hierarchy used by the provider;
    - a machine processable reference to the applicable certificate policy and certificate practice statement; and -
    - the information referred to in Annex I, points 1, 2, 3, 5, 6 and 7, (a), (b) and (c).

Requirements for wallet-relying party registration certificates (as per ANNEX V):

- shall be issued under certificate policy and certificate practice statement compliant with NCP requirements in ETSI EN 319411-1 v1.4.1
- shall be signed JWTs (IETF RFC 7519) or CWTs (RFC 8392)
- the certificate shall include:
    - the location where the certificate supporting the advanced
electronic signature or advanced electronic seal on that certificate is
available, for the entire certification path to be built up to the expected
trust anchor in the public key infrastructure hierarchy used by the
provider;
    - a machine processable reference to the applicable certificate policy and certificate practice statement;
    - registration information referred to in Annex I (points 1, 2 and 8;

Below are selected excerpts from the \[CIR for RP-Registration\], including the recitals and the Articles that establish these requirements.

#### Recital (1)

_Member States should establish and maintain registers of registered wallet-relying parties established in their territory._

#### Recital (3)

_To ensure broad access to the registers and to achieve interoperability, Member States should set up both human and machine-readable interfaces that meet the technical specifications set out in this Regulation. Providers of wallet-relying party access certificates and wallet-relying party registration certificates, where available, should, for the purpose of issuing those certificates, also be able to rely upon these interfaces._

#### Recital (4)

_As registration policies provide clear guidance to the wallet-relying parties on the registration process, Member States should set out and publish the registration policies applicable to the national registers established in their territory._

#### Recital (5)

_The purpose of registering wallet-relying parties is to build trust in the use of the wallets through greater transparency. Therefore, Member States should make the relevant information available to the public in a manner that is both human and machine-readable. To this end, wallet-relying parties should provide the necessary information, including their entitlement or entitlements, to the national registers._

#### Recital (7)

_To ensure that the registration process is cost-effective and proportionate to risk, registrars should set up online and, where applicable, automated registration processes for wallet-relying parties that are easy to use. Registrars should verify applications for registration without undue delay._

#### Recital (8)

_[...] wallet-relying parties should use wallet-relying party access certificates when they identify themselves to wallet units. To guarantee interoperability of those certificates across all wallets provided within the Union, wallet-relying parties access certificates should adhere to common requirements set out in the Annex._

#### Recital (9)

_[...] wallet-relying parties are not to request users to provide any data other than those indicated for the intended use of wallets during the registration process. Wallet users should be enabled to verify the registration data of wallet-relying parties. To enable wallet users to verify that the attributes being requested by the wallet-relying party are within the scope of their registered attributes, Member States may require the issuance of wallet-relying party registration certificates to registered wallet-relying parties. To ensure the interoperability of the wallet-relying party registration certificates, Member States should ensure that those certificates meet the requirements and standards set out in the Annex._

#### Recital (11)

_[...] registrars should be able to suspend or cancel the registration of any wallet-relying party without prior notice where the registrars have reason to believe that the registration contains information which is inaccurate, out of date or misleading; that the wallet-relying party is not complying with the registration policy; or that the wallet-relying party is otherwise acting in breach of Union or national law or of the European Declaration on Digital Rights and Principles for the Digital Decade (5) in a way that relates to their role as a wallet-relying party, for example if the wallet-relying party has not rightfully minimised the set of attributes it requests access to. To safeguard the stability of the European Digital Identity Wallet ecosystem (‘wallet ecosystem’), the decision to suspend or cancel a registration should be proportionate to the service disruption caused by the suspension or cancellation and the associated cost and inconvenience for the service provider and the user. Pursuant to Article 46a(4), point (f) of Regulation (EU) No 910/2014, supervisory bodies are also to be empowered to suspend and cancel the registration if required._

#### Article 2 Key definitions

_‘wallet-relying party’ means a relying party that intends to rely upon wallet units for the provision of public or private services by means of digital interaction;_

_‘register of wallet-relying parties’ means an electronic register used by a Member State to make information on wallet-relying parties registered in that Member State publicly available as set out in Article 5b(5) of Regulation (EU) No 910/2014;_

_‘provider of wallet-relying party access certificates’ means a natural or legal person mandated by a Member State to issue wallet-relying party access certificates to wallet-relying parties registered in that Member State;_

_‘wallet-relying party access certificate’ means a certificate for electronic seals or signatures authenticating and validating the wallet-relying party issued by a provider of wallet-relying party access certificates;_

_‘registrar of wallet-relying parties’ means a body responsible for establishing and maintaining a list of registered wallet-relying parties established in their territory who has been designated by a Member State;_

_‘wallet-relying party registration certificate’ means a data object that indicates the attributes the relying party has registered to intend to request from users;_

_‘provider of wallet-relying party registration certificates’ means a natural or legal person mandated by a Member State to issue wallet-relying party registration certificates to wallet-relying parties registered in that Member State._

#### Article 3 National registers

_4. Member States shall make the information set out in Annex I on registered wallet-relying parties publicly available online, both in human-readable form and in a form suitable for automated processing._

_5. The information referred to in paragraph 2 shall be available through a single common application programming interface (‘API’) and through a national website. It shall be electronically signed or sealed by or on behalf of the registrar, in accordance with the common requirements for a single API set out in Section 1 of Annex II._

#### Article 4 Registration policies

_1. Member States shall lay down and publish one or more national registration policies applicable to national registers established in their territory._

_3. The registration policy shall cover at least the following points:_

- _(a) the identification and authentication procedures applicable to wallet-relying parties during the registration process;_
- _(b) the supporting documentation to be provided by the wallet-relying party to establish their identity, business registration, any applicable entitlement(s), and other relevant information that is required under the registration policy;_
- _(c) where applicable, the description of the authentic sources or other official electronic records in the Member State where the register is set up, that can be relied upon to provide accurate data, information or other evidence required as part of the registration process;_
- _(d) where applicable, the automated means supported to enable wallet-relying parties to register or to update an existing registration;_
- _(e) the means of redress available to wallet-relying parties under the law of the Member State where the register is set up;_
- _(g) the rules and procedures for the verification of the identity of the registered wallet-relying party and of any other relevant information provided by that party._

#### Article 6 Registration process

_3. Registrars shall verify, where applicable, in an automated manner:_

- _(a) the accuracy and validity of the information required under Article 5;_
- _(b) where applicable, the power of attorney of a representative of the wallet-relying party in accordance with the laws and procedures of the Member State where the register is set up;_
- _(c) the type of entitlement(s) of the wallet-relying party as set out in **Annex I.**_
- _(d) the absence of an existing registration in another national register._

_4. Registrars shall verify the information set out in paragraph 3 against the supporting documentation provided by the wallet-relying parties or against appropriate authentic sources or other official electronic records in the Member State where the national register is established and to which the registrars have access in accordance with the applicable national laws and procedures.._

_7. When a wallet-relying party no longer intends to rely upon wallet units for the provision of public or private services under a specific registration, it shall notify the relevant registrar without undue delay and request the cancellation of that registration._

#### Article 7 Wallet-relying party access certificates

_1. Member States shall authorise at least one certificate authority to issue wallet-relying party access certificates._

_2. Member States shall ensure that providers of wallet-relying party access certificates issue wallet-relying party access certificates exclusively to registered wallet-relying parties._

_3. Member States shall implement in a syntactically and semantically harmonised manner the certificate policies and certificate practice statements for the wallet-relying party access certificates, in accordance with the requirements set out in Annex IV._

#### Article 8 Wallet-relying party registration certificates

_1. Member States may require providers of wallet-relying party registration certificates to issue wallet-relying party registration certificates to wallet-relying parties registered in accordance with the requirements set out in Article 4 to Article 6 of this Regulation._

_2. Where a Member State authorised the issuance of a wallet-relying party registration certificate, that Member State shall;_

- _(a) require providers of wallet-relying party registration certificates to issue wallet-relying party registration certificates exclusively to registered wallet-relying parties;_
- _(b) ensure that each intended use is expressed in the wallet-relying party registration certificates;_
- _(c) ensure that wallet-relying party registration certificates include a general access policy, being syntactically and semantically harmonised across the Union, informing users that the wallet-relying party is only allowed to request the data specified in the registration certificates for the intended use registered in the registration certificates;_
- _(d) ensure that providers of wallet solutions established in that Member State comply with the general access policy by informing users when a wallet-relying party requests data that is not specified in the registration certificates;_
- _(e) implement wallet-relying party registration certificates in a syntactically and semantically harmonised manner and in line with the requirements set out in Annex V;_
- _(f) implement dedicated certificate policies and certificate practice statements for the wallet-relying party registration certificates in accordance with the requirements set out in Annex V;_
- _(g) ensure that wallet-relying parties provide a URL to the privacy policy regarding the intended use._

_3. The policy referred to in point (g) shall be expressed in the wallet-relying party registration certificate._

#### Article 9 Suspension and cancellation of registration

_1. Registrars shall suspend or cancel a registration of a wallet-relying party where such a suspension or cancellation is requested by a supervisory body pursuant to Article 46a(4), point (f) of Regulation (EU) No 910/2014._

_2. Registrars may suspend or cancel a registration of a wallet-relying party where the registrars have reasons to believe one of the following:_
_(a) the registration contains information which is inaccurate, out of date or misleading;_
_(b) the wallet-relying party is not compliant with the registration policy;_
_(c) the wallet-relying party is requesting more attributes than what they have registered in accordance with Article 5 and Article 6;_
_(d) the wallet-relying party is otherwise acting in breach of Union or national law in a manner related to their role as wallet-relying party;_

_3. Registrars shall suspend or cancel a registration of a wallet-relying party where the request for cancellation or suspension is made by the same wallet-relying party._

_4. When considering the suspension or cancellation in accordance with Article 9 paragraph 2, the registrar shall conduct a proportionality assessment, taking into account the impact on the fundamental rights privacy, security and confidentiality of the users in the eco-system, as well as the severity of the disruption caused by the suspension or cancellation and the associated costs, both for the wallet-relying party and the user. Based on the result of this assessment, the registrar may suspend or cancel the registration with or without prior notice to the affected wallet-relying party._

#### ANNEX I Information regarding wallet-relying parties

(summary)

- name of the wallet-relying party as stated in official record
- a user-friendly name of the wallet-relying party that can be either a trade name or service name that is recognisable to the user
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

#### ANNEX II

(summary)

_1. REQUIREMENTS ON ELECTRONIC SIGNATURES OR SEALS APPLIED TO THE INFORMATION MADE AVAILABLE ON REGISTERED WALLET-RELYING PARTIES:_

- _The file format used by the API: be JavaScript Object Notation (JSON)_
- _electronic signatures and electronic seals - JSON Web Signatures in compliance with IETF RFC 7515_

_2. REQUIREMENTS ON THE SINGLE API:_

- _REST API, supporting JSON data format_
- _published as OpenAPI version 3_
- _allow any requestor, without prior authentication, to make (search/read) requests to the register_
- _provide security functions in order to ensure the availability and integrity of the API and the information available through it. The API shall be secure by default and by design._

#### ANNEX III

(summary)

_Source of documentary evidence for the verification of entitlements of wallet-relying parties:_

- _verification of qualified trust service providers - shall be based on the national trusted lists_
- _verification of non-qualified trust service providers - shall be based on the national trusted lists or on national MS verification procedures (set out in their registration policies)_
- _verification of providers of person identification data - shall be based on the list of providers of person identification data published by the Commission in accordance with Article 5a(18) of Regulation (EU) No 910/2014_
- _verification of providers of electronic attestations of attributes issued by or on behalf of a public sector body responsible for an authentic source - shall be based on the list published by the Commission in accordance with Article 45f(3) of Regulation (EU) No 910/2014_

#### ANNEX IV

(summary)

_Requirements for wallet-relying party access certificates:_

- _certificate policy and certificate practice statement for the provision of access certificates shall comply with at least the normalised certificate policy (‘NCP’) requirements as specified in standard ETSI EN 319411-1 version 1.4.1 (as applicable);_
- _plus additional requirements set out in the Annex IV_

#### ANNEX V

(summary)

_Requirements for wallet-relying party registration certificates:_

- _certificate policy and certificate practice statement for the provision of registration certificates shall comply with at least the normalised certificate policy (‘NCP’) requirements as specified in standard ETSI EN 319411-1 version 1.4.1 (as applicable);_
- _shall be signed JSON Web Tokens (IETF RFC 7519) or CBOR Web Tokens (IETF RFC 8392);_

## 3 Discussion

As described in the ARF, from a functional perspective Relying Party registration covers the following aspects of the European Digital Identity Wallet ecosystem:

1) The **Registrar function** for which the Member States are responsible. Member States must organise this function to register Relying Party via a publicly accessible API at a national level. These aspects are defined in the European Commission [Specification of common formats and API for Relying Party Registration information](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) and the ongoing update of \[CIR for RP-Registration\]).
2) The registration process mandated to be followed by all Relying Parties resulting in issuance of one or more **Wallet-Relying Party Access Certificates** (RPAC) and, where issued by the Member State, as many **Wallet-Relying Party Registration Certificates** (RPRC) as the Relying Party has dedicated intended uses (use cases, services provided to the EUDI Wallet Users). Regarding the minimum information to be registered, the European Commission has published the technical specification for a [Common Set of Relying Party Information to be Registered](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md).
3) The **operational use of aforementioned certificates** in Relying Party transactions with the EUDI Wallet Units and their Users. This has been defined in several ARF Topics with HLRs and in ETSI technical specifications for specifying the relying party access certificates [TS 119 411-8](https://www.etsi.org/deliver/etsi_ts/119400_119499/11941108/01.01.01_60/ts_11941108v010101p.pdf), relying party registration certificates [TS 119 475](https://www.etsi.org/deliver/etsi_ts/119400_119499/119475/01.01.01_60/ts_119475v010101p.pdf), and profiles for EAA presentation [TS 119 472-2](https://www.etsi.org/deliver/etsi_ts/119400_119499/11947202/01.01.01_60/ts_11947202v010101p.pdf) and EAA issuance [TS 119 472-3](https://www.etsi.org/deliver/etsi_ts/119400_119499/11947203/01.01.01_60/ts_11947203v010101p.pdf).
4) **Handling the functional revocation of Relying Party certificates** as necessitated by the legal requirements. This is partially defined in the ARF and in [ETSI TS 119 411-8](https://www.etsi.org/deliver/etsi_ts/119400_119499/11941108/01.01.01_60/ts_11941108v010101p.pdf) and [TS 119 475](https://www.etsi.org/deliver/etsi_ts/119400_119499/119475/01.01.01_60/ts_119475v010101p.pdf).
5) How the registration and operational use of the RP registration certificates shall be done when **the Relying Party relies upon another Relying Party that is acting on its behalf (an intermediary)** to provide its intended use towards the Wallet Units. This has been specified in the ARF Topic 44 and in the [Specification of common formats and API for Relying Party Registration information](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md).

Having analysed the combined legal requirements, the latest ARF (release 2.8.0) and the (at this point only partial) EUDI Wallet Coordination Group feedback which the European Commission received in the first meeting of the topic X discussion revision round, this section of the paper raises the following key questions for discussion. Discussion should be kept at the level of High-Level Requirements relevant for the ARF, not yet as specific technical corrigenda to the applicable technical specifications of the EC or ETSI, which will be collected to section 5 at the end of the revision round.

### 3.1 Introducing Relying Party Service identifiers

#### 3.1.1 Disentangling Relying Party Instances and Relying Party services

There appears to be a need to clarify the difference between a "Relying Party Instance" (RPI), as discussed in the ARF, and an individual service of a (potentially large) Relying Party.

**Relying Party Instances** are covered currently in ARF Topics 6 and 27. They are described in the ARF main document, section 3.11.2 as follows: "A Relying Party uses a system consisting of software and hardware to interact with Wallet Units. The ARF calls such a system a Relying Party Instance. A Relying Party Instance maintains an interface with Wallet Units to request PIDs and attestations. It implements Relying Party authentication, using an access certificate obtained by the Relying Party, as described in Section 6.6.3.2. Note that a Relying Party can operate multiple Relying Party Instances."

In the context of a remote Relying Party, a RPI can be thought of as an endpoint (as in OpenID4VP). In the context of a proximity Relying Party, an RPI is more commonly called a reader (as in ISO/IEC 18013-5).

An aspect that the ARF and the specifications are currently missing is that a Relying Party may be a big organisation that consists of multiple **services** that have (partly or wholly) different intended uses. Moreover, the Relying Party may want to ensure that its different services cannot access each other's data, or use each other's access certificates or registration certificates towards wallets. To enable such a separation of concerns between Relying Party services, this Discussion Paper proposes to formally introduce the concept of a Relying Party Service in the ARF and the specifications. It is also necessary to reduce ambiguity this new concept brings along, as the [Specification of common formats and API for Relying Party Registration information](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) and [CIR for RP-Registration](https://data.europa.eu/eli/reg_impl/2025/848/oj) already refers to "service descriptions" of a Relying Party, which have an implied (but not well-defined) relation to legal or technical concepts of *intended use*, *user-friendly name*, *purpose*, *technical name*, *entitlements* and *RP-provided attestations*.

NOTE: This paper does not define the nature of a Relying Party service. For example, a service may correspond to a specific department or business unit within the Relying Party, or to its operations in a specific country, or it may be closely aligned with a specific user-facing product or service of the Relying Party. It is up to each Relying Party to decide on the number and nature of its services.

#### 3.1.2 Registering Relying Party services

During registration, the Relying Party registers at least one service. For every service, it specifies a Relying Party Service identifier (a technical name listed as point 8 in the Annex I of [CIR for RP-Registration](https://data.europa.eu/eli/reg_impl/2025/848/oj)). This identifier can be freely chosen by the Relying Party, as long as it is unique for the given Relying Party.

Notes:

- The Service identifier could, for example, be an existing OAuth `client_id` for the given service.
- If the Relying Party register only one service (for example because it is a small business), the Service identifier could be an empty string, or "N/A", or similar. It is up to each Registrar to set applicable rules if needed.

As was specified already in TS5, the Relying Party also registers one or more intended uses. The identifiers of these intended uses are generated by the Registrar, not the Relying Party. This paper further proposes that the Relying Party must indicate which service has which intended use(s) and provide the matching user-friendly trade name and description of the service, as well as the description of the intended use(s) (the TS5 data model's 'purpose' element) with proper localisations. This requires an update for the data model structures in the current TS5.

EXAMPLE: If a Relying Party registers services A, B, and C, and also registers intended uses 1, 2, 3, 4, and 5, it may subsequently register that

- Service A has intended uses 1 and 2,
- Service B has intended uses 2, 3, 4, and 5,
- Service C has intended uses 4.

Please note the following clarifications on the relations between existing elements in the current [Specification of common formats and API for Relying Party Registration information](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md):
- Service A has its own service description (`srvDescription`) Ad, service B has Bd etc; this element is thus moved from the WRP object level to a new, to-be-introduced Service object in the TS5 data model.
- intended use 1 has its own description of the intended use (`purpose`, realisation of point 10 in Annex I of [CIR for RP-Registration](https://data.europa.eu/eli/reg_impl/2025/848/oj)) 1d, intended use 2 has 2d etc. No change in TS5 data model is required here.
- PID providers and attestation providers have related entitlements, which  register which types of attestation they intend to issue. These entitlements will need to be registered at the Service level, rather than the WRP level.  If the attestation-providing service requires the User to present an attestation (for example for User authentication purposes), they shall also register the corresponding intended use under the service, just like regular service providers do.

Assuming that the Registrar issues registration certificates, in this example the Registrar would issue seven registration certificates to this Relying Party, two for service A, four for service B, and one for service C. (As described in the ARF, each registration certificate contains precisely one intended use.) Each registration certificate contains the (MS-assigned, EU-wide unique) Relying Party identifier and the (RP-chosen, RP-unique) Relying Party Service identifier.

Notes:

- It seems that the EC documentation on RPRCs is lacking detail regarding how the RPs must register their intended uses. The intention is that each intended use is registered by the RP, and that the RP will receive a separate RPRC (where issued) per intended use. This needs to be clarified in TS5.
- The definition in TS5 (v1.3) of the Registry API's get/wrp/{identifier} method is incorrect, since it indicates that a given RP identifier matches at best only one registration instance. Instead, the intended response is to return all WRP objects found that match the queried intended-use identifier. This needs a change in the API specification, to deliver an intended use-specific dataset, not a full WRP object with individual intended use objects within an embedded array.

#### 3.1.3 Binding a Relying Party service to a Relying Party Instance

To bind a Relying Party Instance to a Relying Party service, this Paper proposes to include the Relying Party Service identifier also in the access certificate, next to the Relying Party identifier that was already there. Note that an access certificate is bound to a specific Relying Party Instance, because the public key in the certificate corresponds to a private key that is securely stored in the hardware of the RPI.

Note: As the RPAC and RPRC specifications are owned by ETSI at the time of writing this Discussion Paper, the Commission will request ETSI to specify the exact certificate element (for access certificates) and JSON claim or CBOR key-value pair (for registration certificates) to be used for the Relying Party Service Identifier, including their format.

Access certificates are generated by an Access Certificate Authority, in a separate step that follows after the registration of the Relying Party. To obtain an access certificate for a given Relying Party Instance, a Relying Party requests the RPI to generate a key pair. The RPI securely stores the private key, and returns the public key to the Relying Party. The Relying Party then sends the public key to the Access CA in a certificate signing request, together with a Relying Party identifier and a Relying Party Service identifier. The Access CA returns a signed access certificate that includes (and thus binds together) the public and both identifiers. 

Note that if a single Relying Party Instance is used by multiple services of the same Relying Party, the Relying Party can request multiple access certificates for that RPI, each bearing a different Service identifier. Of course, to prevent misuse, the RP should carefully control access to its certificate-requesting functions.

##### 3.1.4 Verifying the binding between service and Instance

Finally, during a transaction with a wallet, the Relying Party sends both the access certificate and the registration certificate (if any) to the wallet. The wallet verifies that

- Both the Relying Party identifier and the Relying Party Service identifier in the access certificate match those in the registration certificate.
- the Relying Party Instance can prove possession of the private key corresponding to the public key in the access certificate, by performing Relying Party authentication.

If these checks pass, the wallet has verified that the Relying Party Instance is indeed used by the service identified in the access certificate. It can subsequently verify that the requested attributes match the registered intended use of this Service, as specified in the registration certificate. This prevents over-asking of information from wallet users by a malicious (internal or external) actor that has gained access to a single access certificate of the RP. (For threat scenario details, see section 3.2.1 below).

#### 3.1.5 Applicability to PID Providers and Attestation Providers

The discussion in this section so far focused on Relying Parties (i.e., Service Providers, in terms of CIR 2025/848) that have multiple services as well as multiple Relying Party Instances. However, exactly the same logic can be applied to PID Providers and Attestation Providers, which can similarly have multiple services and service supply points. For example, a single entity within a Member State may issue PIDs and (for instance) photoIDs, and may wish to prevent that a service supply point used for issuing photoIDs can present a registration certificate showing an entitlement to issue PIDs.

The HLRs in Section 4 are written in such a way that they are applicable both to Relying Parties and to PID Providers and Attestation Providers.

#### 3.1.4 New and changed HLRs

In summary, a new Relying Party Service identifier is needed to allow binding the intended use-specific RPRC (or, if no RPRC is issued, then the registrar-provided data for this intended use) to a particular RPI-bound RPAC. This implies new HLRs and changes to the respective technical specifications. These cover the RP data model, the RPAC and RPRC elements and the Registry API methods.

New and changed HLRs are proposed to add a conditional **Relying Party Service identifier** and **Relying Party Service name** attribute into the RP registration information. These can be found in [Section 4](#4-current-hlrs-and-proposals-of-changes).

### 3.2 TS5 Registry API-specific problems

#### 3.2.1 Compromised RPI attack

Suppose a large organisation has several services and operates multiple Relying Party Instances (RPI). Each RPI is used for only one service, and the organisation would like to maintain a separation of concerns between RPIs, such that an RPI used for one service cannot be used to request attributes registered for intended uses related to another service. In the absence of a Relying Party Service identifier (as currently in the ARF and TS5), the only way to do this is by configuring each RPI only with those attribute identifiers, intended use identifiers, and registration certificates (if used) that are related to 'its' service. Hence, security is based only on a lack of knowledge of each RPI regarding the identifiers of attributes and intended uses that are not its business.

A "compromised RPI attack" scenario on this organisation could unfold as follows: A malicious actor manages to hijack a single Relying Party Instance. Hijacking here means that the attacker can control the RPI, including the private keys corresponding to its access certificates. Note that the malicious actor can be either an (external) hacker, or an insider having legitimate access to the RPI. The goal of the malicious actor is to use the hijacked RPI to request as many attributes from Wallet Units as possible, including those attributes that the RPI should not be able to request according to the organisation's intents.  

To do this if no registration certificates were issued to the organisation by its Registrar, the actor would need to configure the RPI with the missing attribute identifiers and intended use identifiers. However, this is easy to do, as both of these identifiers are registered in the publicly accessible registry. The malicious actor can obtain them by using the Registry API to request details of all currently registered intended uses of the organisation. Then, selecting a suitable IntendedUseIdentifier from the registered set, the hijacked RPI could over-ask attributes from a Wallet Unit, without the Wallet Unit being able to detect this. This would break the RP's intended internal data minimisation and privacy protection rules between its individual Relying Party services.

To make this more difficult, the Registry API could be changed in such a way that it never returns intended use identifiers - it would only accept an intended use identifier as a query parameter to obtain the list of associated attribute identifiers. However, although this would make things more difficult for the malicious actor, it would probably still be possible for them to learn the `IntendedUseIdentifier`s of other services of the RP by querying and listing the open API. To avoid this, the IntendedUseIdentifiers would need to be kept secret, which would not be very practical.

A similar argument can be made in case the organisation uses registration certificates. This would complicate the life of the malicious actor, since the Registry API does not return registration certificates. However, as long as registration certificates are not kept strictly secret, it is reasonable to assume that it would be possible for the actor to get access to all of the organisation's registration certificates.

Thus, introducing a Relying Party Service identifier and include it in the access certificate of the RPI is necessary is necessary to bind a specific RPI to a specific service, both when using registration certificates as well as when falling back to using the Registry API.

#### 3.2.2 Condensed WRP object as Registry API query response

Another problem identified with large organisations is that the GET /wrp/{identifier} endpoint currently returns a single, "condensed" Relying Party object corresponding to multiple services using the same RP identifier. All services are expected to have the RP-level common name or trade name (the TradeName attribute).

However, such a condensed response will not work in practice, as large organisations will use different TradeNames for their services. This TradeName is what Users will see in the Wallet Unit's UI, and this must be recognisable for Users. Thus, for large organisations, TradeName should be a Relying Party Service-dependent attribute.

A practical example related to different TradeNames under the same organisation, from a current production configuration in the public sector:

- "Helsenorge" ("HealthNorway"):  the national citizen health portal where you can see your health journal, appointments, vaccines, etc.
- "HelseCERT" - common CERT portal for security personnel in all municipalities as well as regional and national level health organisations.
- "HelseID" - a proxy IDP broker for health professionals (doctors, nurses, etc)

All these three services are **operated by the same organisation, under the identical business identifier**. They are currently registered as three different OIDC clients, each having a different `client_name`, which is shown to the end-user when logging in.

To mimic this structure under the current design, the Registry API would need to return an array of TradeName strings belonging to the condensed entry. However, it is better to return them as three separate, Relying Party Service-specific, intended-use bound, object instances. This would mean introducing a `Service` class in TS5 which contains the TradeName, instead of having it directly in the `WalletRelyingParty` class. Similarly, the Intended use class would be part of this Service class rather than the `WalletRelyingParty` class. The `Service` class would obviously also contain the Service identifier.

#### 3.2.3 Binding a Relying Party Service to an intermediary

A related problem is how to handle Relying Party Services in case the Relying Party uses an intermediary to connect to Wallet Units. The solution currently described in the ARF and TS5 is as follows:

- The data registered about the intermediated Relying Party contain the `usesIntermediary` attribute, which is an array of `WalletRelyingParty` objects, where each object contains information about one intermediary, including its unique identifier and TradeName.
- Each registration certificate (if issued) of the intermediated Relying Party contains the Relying Party identifier of the intermediary.
- During a transaction, the intermediary sends its own access certificate plus the registration certificate of the intermediated Relying Party (if available) to the Wallet Unit. The intermediary also includes the identifier of the intermediated Relying Party directly in the request.
- If there is a registration certificate, the Wallet Unit verifies that the identifier of the intermediary included in the registration certificate is identical to the identifier of the intermediary in the access certificate. If there is no registration certificate, the Wallet Unit can verify via the Registry API that the intermediated Relying Party (from the request) indeed uses the services of the intermediary (from the access certificate).

The introduction of Relying Party Services implies the following:

- Not only an intermediated Relying Party may have multiple services, but an intermediary may have as well. This is not only because the same business logic applies, but also because the Regulation says that an intermediary is a Relying Party.
- Consequently, for each intermediated Relying Party we need not only to register the intermediary, but also the applicable Service of that intermediary. In terms of TS5, the `usesIntermediary` attribute must contain doublets of `WalletRelyingParty` and `WalletRelyingPartyService` objects. The same is true for a registration certificate, if issued.
- Finally, in the request to a Wallet Unit, the intermediary must include not only the Relying Party identifier, but also the Service identifier.

Apart from these changes, all aspects of the use of an intermediary will remain the same.

#### 3.2.4 A list of problems identified in TS5 API

_NOTE: Written feedback and error correction for the design of TS5 API is solicited during the commenting period of the paper, as no concrete feedback apart from the issue handled in section 3.2.2 was received so far._

### 3.3 Provisioning and distribution of large numbers of Relying Party access certificates

The Member States have need for guidance on how to scale the RPAC distribution to e.g. individual mobile readers used by the government agencies (e.g. Law Enforcement) or for example large private entities running automatic payment terminals in 4-5 digit volumes.

An early technical solution proposal based on use of an ACME-powered automated certificate issuance process for both access and registration certifications has been proposed. This will need to be analysed further after being published as an academic paper.

Meanwhile, the EC recommends the Member States to consult available product or service providers in the mobile device management and certificate provider marketplace.

## 4 Current HLRs and Proposals of Changes

The ARF Annex 2, Topic 6, Topic 27, Topic 44 and Topic 52, contain a number of High-Level Requirements related to the topic.

Topic 6 covers Relying Party authentication through utilisation of access certificates. The Topic 27 requirements cover general requirements for Member State registration processes and specific requirements for the registration of Relying Parties, whereas Topic 44 covers issuance of Relying Party registration certificates. Topic 52 focuses on the intermediaries.

After the refinement round all existing HLRs from the ARF version 2.8.0 are listed in the tables below for EDICG review, along with a proposal to keep, change, add, or remove the HLR.

### 4.1 Topic 6 - Relying Party authentication and User approval

A. Relying Party authentication

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPA_01 | The Wallet Unit used by a User, as well as the Relying Party Instance used by the Relying Party, SHALL implement a mechanism for Relying Party authentication in PID or attestation presentation transactions. This mechanism SHALL: - enable the Wallet Unit to identify and authenticate the Relying Party, - enable the Wallet Unit to verify that the request from the Relying Party was not copied and replayed, - use an access certificate issued in accordance with [[Topic 27](./annex-2.02-high-level-requirements-by-topic.md#a2316-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties)]. |       Keep        |
| RPA_01a | If a Wallet Unit supports the [W3C Digital Credentials API] for remote presentation flows, it SHALL retain full authority over the process meant in RPA_01. In particular, this process SHALL NOT be handled by a third party, including the browser and the operating system. |        Keep       |
| RPA_02 | For performing Relying Party authentication, Wallet Units and Relying Party Instances SHALL support access certificates as specified in ETSI TS 119 475 and ETSI TS 119 411-8. _Note: In [ISO/IEC 18013-5], the Relying Party authentication mechanism is called mdoc reader authentication and uses an X.509 certificate. For [OpenID4VP], [HAIP] specifies that Client Identifier Prefix ``x509_hash`` must be used to authenticate the Relying Party; this also uses an X.509 certificate._ |     Keep          |
| RPA_02a | Empty |    Keep           |
| RPA_03 | A Wallet Unit and a Relying Party Instance SHALL perform Relying Party authentication in all PID or attestation presentation transactions to Relying Parties, whether proximity or remote, using an access certificate. _Note: The actions both entities perform differ. For example, while the Relying Party creates a signature over some data in the request, the Wallet Unit validates that signature._ |    Keep           |
| RPA_04 | For the verification of access certificates, a Wallet Unit SHALL accept the trust anchors in the LoTE(s) of all Access Certificate Authorities notified by Member States. _Note: For more information about Access Certificate Authorities, please see [[Topic 31](./annex-2.02-high-level-requirements-by-topic.md#a2320-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)]._ |       Keep        |
| RPA_05 | If Relying Party authentication fails for any reason, the Wallet Instance SHALL inform the User that the identity of the Relying Party could not be verified and that therefore the request is not trustworthy. |    Keep           |
| RPA_06 | If Relying Party authentication succeeds, the Wallet Instance SHALL display to the User the **trade** name of the Relying Party **'s Relying Party Service** as included in the access certificate received from the Relying Party Instance, together with the attributes requested by the Relying Party. The Wallet Instance SHALL do so when asking the User for approval according to RPA_07. _Notes: **a) A Relying Party Instance may be used for multiple Relying Party services, provided it has received a separate access certificate for each, see Reg_10b. b)** If the Relying Party is an intermediary acting on behalf of an intermediated Relying Party, the Wallet Instance displays the **trade** names of both the intermediary **'s Service** and the intermediated Relying Party **'s Service** to the User, see RPI_07._ |    **Modify**           |
| RPA_06a | If Relying Party authentication fails for any reason, the Wallet Unit SHALL notify the User. In addition, the Wallet Unit SHALL either not present the requested attributes to the Relying Party, or give the User the choice to present the requested attributes or not. _Note: It is up to the Wallet Provider to make a choice for one of these two options._ |       Keep        |

### 4.2 Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and (non-qualified) EAAs, and Relying Parties

A.  General requirements for Member State registration processes

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_01 | Member States SHALL provide processes and mechanisms for PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers, and Relying Parties to register in a registry. _Note: Member States may choose to implement a single registry for all these roles, or a separate registry for each of these roles._ |       Keep        |
| Reg_01a | Member States SHALL register a common set of data about a) PID Providers, b) QEAA Providers, c) PuB-EAA Providers, d) non-qualified EAA Providers. and e) Relying Parties, according to the relevant requirements in [Technical Specification 6](../../technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md). _Note: For PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers, the common set of data specified in [Technical Specification 6] include the attestation type(s) that the provider intends to issue to Wallet Units._ | Keep |
| Reg_01b | Empty |       -        |
| Reg_02 | Member States SHALL make publicly available all necessary details and documentation about the registration processes for their registry. |       Keep        |
| Reg_03 | Member States SHALL publish the registry entries online, in a sealed or signed machine-readable common format suitable for automated processing, according to the relevant requirements in [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md), for the purpose of transparency to Users and other stakeholders. |       Keep        |
| Reg_04 | Member States SHALL make the registry entries available online, in a human-readable format. The website used for this purpose SHALL use a secure channel protecting the authenticity and integrity of the information in the registry during transport. Member States SHALL NOT require authentication or prior registration and authorisation of any person wishing to retrieve the information in the registry. |       Keep        |
| Reg_05 | Empty |       -        |
| Reg_06 | Member States SHALL support the common API specified in [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) ~~for~~ to enable automated retrieval of registry entries from the Member States' registries. _Note: [Technical Specification 5] specifies the use of a secure channel protecting the authenticity and integrity of the information in the registry during transport, and does not require authentication or prior registration and authorisation of any entity wishing to retrieve the information in the registry._ |   **Modify**   |
| Reg_07 | A Member State SHALL enable a registered PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party to update the information registered on it, using a process comparable to the original registration process. For Relying Parties, this SHALL be possible using the API or user interface mentioned in Reg_24. |    Keep   |
| Reg_08 | A registered PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party SHALL make any updates necessary to ensure the continued correctness of the registered information without undue delay. | Keep   |
| Reg_09 | Member States SHALL log all changes made on the information registered regarding a PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party, including at least initial registration, updates, deletion of information, and suspension or cancellation. |       Keep        |

B. _General requirements for the issuance of access certificates_

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_10    | A Member State SHALL ensure that an Access Certificate Authority notified according to [[Topic 31](./annex-2.02-high-level-requirements-by-topic.md#a2320-topic-31---notification-and-publication-of-pid-provider-wallet-provider-attestation-provider-access-certificate-authority-and-provider-of-registration-certificates)] issues **one or more** access certificate**s** to all PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers **and Relying Parties** registered in one of the Member State's registries. **_Note: To be able to authenticate towards Wallet Units, each Relying Party Instance of a Relying Party and each service supply point of a PID Provider or Attestation Provider needs a separate access certificate, where the private key corresponding to the public key in the certificate is managed in the RPI's or service supply point's hardware and software._** | Modified, merged existing Reg_10a into Reg_10, since also PID Providers and Attestation Providers may have multiple Relying Party Instances. Moreover, that each RPI receives a separate access certificate is a technical necessity, not a requirement; this is now explained now in a note. |
| Reg_10a    | ~~A Member State SHALL ensure that an Access Certificate Authority notified according to [[Topic 31]] issues one or more access certificates to all Relying Parties registered in one of the Member State's registries. A Relying Party SHALL receive a separate access certificate for each of its Relying Party Instances.~~ Empty | Deleted, see Reg_10 |
| Reg_10b   | A registering entity SHALL register one or more Relying Party services, and SHALL receive at least one access certificate for each registered service, complying with Reg_33 and Reg_34. _Notes: a) If the registering entity registers only one service, all of its access certificates will contain an identical Service identifier and Service trade name. b) A single Relying Party Instance may receive multiple access certificates, corresponding to multiple services of the same Relying Party. This would enable the Relying Party to use the same RPI for multiple services._ | New |
| Reg_10c   | If the Registrar decided that registration certificates must be issued (see RPRC_09 or RPRC_09a), the registering entity SHALL receive at least one registration certificate for each registered service, complying with RPRC_07a. _Note: If the registering entity registers only one service, all of its registration certificates will contain an identical Service identifier and Service trade name._ | New |
| Reg_10d   | A Relying Party SHALL register which of its registered intended uses are applicable to each of its registered services. _Note: Another way to phrase this is to say that the Relying Party must register the intended use(s) of each of it registered services separately._ | New - Note that this requirement must be included in TS5 / TS6. |
| Reg_10e   | A PID Provider or Attestation Provider SHALL register which type(s) of attestation each of its registered services intends to issue to Wallet Units. | New - Note that this requirement must be included in TS5 / TS6. |
| Reg_11 | A Member State SHALL ensure that the issuance process of access certificates by their notified Access Certificate Authority(s) complies with ETSI TS 119 411-8. In addition, the Access Certificate Authority(s) SHALL comply with at least the normalised certificate policy (‘NCP’) requirements as specified in ETSI EN 319- 411-1. |       Keep        |
| Reg_12 | Empty |       -           |
| Reg_13 | Empty |       -           |
| Reg_14 | Empty |       -           |
| Reg_15 | Empty |       -           |
| Reg_16 | Empty |       -           |
| Reg_17 | Empty |       -           |
| Reg_18 | Empty |       -           |

C. _Requirements for the registration of PID Providers_

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_19 | A Member State SHALL approve a PID Provider according to a well-defined policy before including it in its PID Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of PID Providers in its Registry. |       Keep        |
| Reg_20 | A Member State SHALL identify PID Providers at a level of confidence proportionate to the risk arising from the potential harm a fraudulent PID Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |       Keep        |
| Reg_20a | A Registrar SHALL provide a method to suspend or cancel a registered PID Provider. |       Keep        |
| Reg_20b | A Registrar SHALL have a policy for the suspension or cancellation of a registered PID Provider, which SHALL specify that a PID Provider is suspended or cancelled at least on request of the PID Provider or of a competent national authority. |       Keep        |

D. _Requirements for the registration of Attestation Providers_

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_21 | A Member State SHALL approve an Attestation Provider according to a well-defined policy before including it in its Attestation Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of Attestation Providers in its Registry. These processes and rules SHOULD consider any relevant differences between QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers. |       Keep        |
| Reg_22 | A Member State SHALL identify Attestation Providers (i.e., QEAA Providers, PuB-EAA Providers and non-qualified EAA Providers) at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Attestation Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |       Keep        |
| Reg_22a | A Registrar SHALL provide a method to suspend or cancel a registered Attestation Provider. |       Keep        |
| Reg_22b | A Registrar SHALL have a policy for the suspension or cancellation of a registered Attestation Provider, which SHALL specify that an Attestation Provider is suspended or cancelled at least on request of the Attestation Provider or of a competent national authority. |       Keep        |

E. Requirements for the registration of Relying Parties

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_23 | Empty |       -        |
| Reg_24 | A Member State SHALL enable a Relying Party to register remotely, using an API or user interface. |       Keep        |
| Reg_25 | A Member State SHALL identify a Relying Party at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Relying Party could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |        Keep        |
| Reg_26 | With respect to Reg_25, a Member State SHALL consider whether a registering entity intends to act as an intermediary. _Note: According to the [European Digital Identity Regulation], an intermediary is a Relying Party._ |       Keep        |
| Reg_27 | Empty |       -        |
| Reg_28 | Empty |       -        |
| Reg_29 | A Member State SHALL have a policy for the cancellation of a registered Relying Party, which SHALL specify that a Relying Party is cancelled at least on request of the Relying Party or of a competent national authority. |       Keep        |
| Reg_30 | Empty |       -        |

F.  _Requirements for the contents of access certificates_

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_31 | An access certificate SHALL contain a **trade** name for the PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party, in a format suitable for presenting to a User. |      **Modify**       |
| Reg_32 | An access certificate SHALL contain an EU-wide unique identifier for the entity (i.e., the PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party), which SHALL be identical to the identifier for the entity registered according to [TS6] and included in the entity's registration certificate(s) (if present) according to RPRC_07. | **Modify**; reword to be similar to Reg_31 and to reference TS6.       |
| Reg_32a | The trade name meant in Reg_31 and the identifier meant in Reg_32 SHALL be the same in all access certificates issued to a given entity. | New |
| Reg_33    | An access certificate SHALL contain a Relying Party Service identifier, which SHALL be provided by the registering entity according to [TS5] and [TS6], and SHALL be unique within the scope of that entity. Moreover, it SHALL be included in the entity's registration certificate (if present) according to RPRC_07a. | New |
| Reg_34    | An access certificate SHALL contain a trade name for the Relying Party service, which SHALL be provided by the registering entity according to [TS5] and [TS6], and SHALL be suitable for presenting to a User. | New |
| Reg_35  | The access certificate format SHALL provide for the data elements to carry the Relying Party Service identifier mentioned in Reg_33 and the user-friendly Relying Party Service trade name mentioned in Reg_34. _Note: The generic X.509 certificate structure has multiple suitable data elements which could be designated for this use. As the RPAC specification is owned by ETSI by the time of handling this question, the EC will forward the question on fixing the exact element to the standardisation organisation._ | New |

### 4.3 Topic 44 - Relying Party Registration Certificates

A. Issuance of ~~Relying Party~~ registration certificates

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPRC_01 | Providers of registration certificates SHALL comply with all relevant requirements in ETSI TS 119 475. |        Keep        |
| RPRC_02 | Empty |      Keep        |
| RPRC_03 | The contents of a registration certificate SHALL include at least the information required in Annex V of the [CIR 2025/848](https://data.europa.eu/eli/reg_impl/2025/848/oj) regarding registration of wallet-relying parties. |      Keep        |
| RPRC_04     | If the subject of the registration certificate uses the services of an intermediary (see [Topic 52]), the 'association to the intermediary' mentioned in Annex I (15) of [CIR 2025/848] SHALL consist of the ~~user-friendly name and~~ unique identifier of this intermediary, as meant in requirement~~s~~ Reg_31 ~~and Reg_32,~~ **and the intermediary's Relying Party Service identifier as meant in Reg_33**.  _Note: ~~This~~**These** identifier**s** are identical to those in the access certificate of the intermediary._  | **Modify** by adding Relying Party Service identifier and removing Relying Party trade name. The trade name is not necessary for matching the intermediated RP to the intermediary. |
| RPRC_04a    | The registration certificate format SHALL provide for the data elements to carry the Relying Party Service identifier mentioned in Reg_33 and the Relying Party Service trade name mentioned in Reg_34. _Note: The Commission will request ETSI to specify these additional claims in JSON and CBOR._ |  New |
| RPRC_05 | If the subject of the registration certificate is not a Relying Party (i.e. in the terms of CIR 2025/848, a Service Provider), the certificate SHALL NOT contain the intended use as meant in Annex I (9) and (10) of CIR 2025/848. _Note: A PID Provider or Attestation Provider may request attributes from the Wallet Unit during issuance. If so, it registers as both a Service Provider and an Attestation Provider, and consequently its registration certificate contains its intended use._ |      Keep        |
| RPRC_06     | The contents of a registration certificate SHALL include a name for the subject of the certificate, in a format suitable for presenting to a User **, which SHALL be identical to the trade name in the access certificates of the entity, see Reg_31**. ~~Notes: _b) This name is identical to the name in the access certificate(s) of the entity, see Reg_31._~~. | **Modify** by moving note b) into the requirement itself for more clarity. |
| RPRC_07     | The contents of a registration certificate SHALL include an EU-wide unique identifier for the subject of the certificate **, which SHALL be identical to the identifier in the access certificates of that entity, see Reg_32**. ~~_Notes: c) This identifier is identical to the identifier in the access certificate(s) of the entity, see Reg_32.~~_ | **Modify** by moving note c) into the requirement itself for more clarity. Also, we will delete note b, which is superfluous. |
| RPRC_07a    |  The contents of a registration certificate SHALL contain an identifier and a name for the Relying Party service, which SHALL be identical to the service identifier and user-friendly name in one or more of the access certificates of that entity, see Reg_33 and Reg_34. _**Note: There must be at least one Relying Party Instance or service supply point that is able to use a given registration certificate.**_| New |
| RPRC_08 | The EU-wide unique identifier meant in RPRC_07 SHALL be identical in all registration certificates issued for a given entity. _Note: In case the registration certificates issued to an intermediated Relying Party are held and presented by an intermediary, the entity meant in this requirement is the intermediated Relying Party. An intermediary may obtain and hold registration certificates with a different unique identifier for other intermediated Relying Parties._ |      Keep        |

#### B Requirements on the issuance of registration certificates to Relying Parties

| **Index** | **Requirement specification** |**Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPRC_09    | A Member State Registrar MAY decide that, during the registration process for Relying Parties, as specified in [Topic 27](./annex-2.02-high-level-requirements-by-topic.md#a2316-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties), a Provider of registration certificates associated to the Registrar must create and sign or seal one or more registration certificates. If the Registrar decides to do so, the Provider of registration certificates SHALL create and sign or seal a separate registration certificate for each **combination of** intended use **and Relying Party service, as registered by the Relying Party per Reg_10d,** and issue it to the Relying Party. Each registration certificate SHALL comply with the requirements in the technical specification mentioned in RPRC_0~~2~~**1**. | **Modify** to take Relying Party services into consideration |
| RPRC_10 | If, during registration, a Relying Party received one or more registration certificates, it SHALL distribute these to all ~~its~~ Relying Party Instances having an access certificate containing the same Relying Party Service identifier. | **Modify** to take Relying Party services into consideration |
| RPRC_11 | The contents of a registration certificate issued to a Relying Party SHALL **contain** at least one of the following: a) the URL of a web form provided by the Relying Party, which Users can use to send data deletion requests, b) an e-mail address of the Relying Party, on which the Relying Party is prepared to receive data deletion requests from Users, c) a telephone number of the Relying Party, on which the Relying Party is prepared to receive data deletion requests from Users. _Note: See [Topic 48](./annex-2.02-high-level-requirements-by-topic.md#a2327-topic-48---blueprint-for-requesting-data-deletion-to-relying-parties) for more information about data deletion requests._ |      **Modify** by adding missing word        |
| RPRC_12 | The contents of a registration certificate issued to a Relying Party SHALL contain the name and country of the Data Protection Authority supervising the Relying Party. In addition, the registration certificate SHALL contain at least one of the following: a) the URL of a web form provided by the DPA, which Users can use to report suspicious attribute presentation requests. c) an e-mail address of the DPA, on which the DPA is prepared to receive reports about suspicious attribute presentation requests from Users, c) a telephone number of the DPA, on which the DPA is prepared to receive reports about suspicious attribute presentation requests from Users. _Note: See [Topic 50](./annex-2.02-high-level-requirements-by-topic.md#a2328-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data) for more information about reporting suspicious attribute presentation requests._ |      Keep        |

##### C. Requirements on the issuance of registration certificates to PID Providers and Attestation Providers

| **Index** | **Requirement specification** |**Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPRC_13 | A Registrar MAY decide that, during the registration process for PID Providers, QEAA Providers, PuB-EAA Provider, or non-qualified EAA Providers, as specified in [Topic 27](./annex-2.02-high-level-requirements-by-topic.md#a2316-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties), a Provider of registration certificates associated to the Member State Registrar must create and sign or seal ~~a registration certificate~~ **one or more registration certificates. If the Registrar decides to do so, the Provider of registration certificates SHALL sign or seal a separate registration certificate for each of the registered services of the registering entity** and issue it to the registering entity. ~~If so,~~**Each** ~~that~~ registration certificate SHALL comply with the requirements in the technical specification mentioned in RPRC_0~~2~~**1**. |  Change to take into account registered services, and to correct reference   |
| RPRC_14 | If, during registration, a PID Provider, QEAA Provider, PuB-EAA Provider, or non-qualified EAA Provider received a registration certificate, it SHALL distribute it to all ~~its~~ service supply points **having an access certificate containing the same Relying Party Service identifier**. **_Notes: a) A service supply point is a system at which a Wallet Unit can start the process of requesting and obtaining a PID or attestation.**_ |     **Modify** to take Relying Party services into consideration.     |
| RPRC_15 | The contents of a registration certificate issued to a PID Provider, a QEAA Provider, a PuB-EAA Provider, or a non-qualified EAA Provider SHALL contain the type(s) of attestation that **the applicable service of** this entity intends to issue to Wallet Units, as registered per Reg_10e. |      Keep        |

##### D. Requirements on the presentation and verification of registration certificates of Relying Parties

| **Index** | **Requirement specification** |**Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPRC_16 | Either after receiving a presentation request or as a general User setting, a Wallet Unit SHALL offer the User the possibility to indicate whether the User wants to verify the information registered by the competent Registrar about the Relying Party **and the Relying Party Service** the User is interacting with. |      **Modify**        |
| RPRC_17 | If the User indicated that they want to verify the information registered about the Relying Party **and the Relying Party Service** and the Relying Party sent a registration certificate to the Wallet Unit, the Wallet Unit SHALL verify the authenticity and validity of the registration certificate according to the technical specification meant in RPRC_02. If the outcome of the verification is negative, the Wallet Unit SHALL, when asking for User approval according to RPA_07, notify the User that it could not obtain the information registered about the ~~entity~~**the Relying Party and the Relying Party Service**. |      **Modify**       |
| RPRC_18 | If the User indicated that they want to verify the information registered about the Relying Party **and the Relying Party Service**, but the Relying Party did not send a registration certificate to the Wallet Unit, the Wallet Unit SHALL connect to the URL of the online service of the Registrar to obtain this information. If the Wallet Unit cannot connect to this URL or if it cannot verify the authenticity and validity of the registered information, it SHALL, when asking for User approval according to RPA_07, notify the User that it could not obtain the information registered about the Relying Party **and the Relying Party Service**. _Note: The URL of the Registrar is included in the extension of the presentation request, see RPRC_19a._ |      **Modify**        |
| RPRC_19 | If a Relying Party Instance received one or more registration certificates (see RPRC_10), it SHALL include a single registration certificate applicable for its current **Service and** intended use in each presentation request to a Wallet Unit, according to the applicable standard's extension mentioned in RPRC_20. The registration certificate SHALL be included in the request by value, not by reference. The Relying Party Instance SHALL do so both in proximity and remote presentation flows. _Notes: **a)** This ensures that no external requests are necessary to validate the Relying Party. **b) An RPI may be used for multiple Relying Party services, provided it has a separate access certificate for each of these services, see RPA_06 and Reg_10b.**_ |      **Modify**        |
| RPRC_19a | A Relying Party Instance SHALL include in each presentation request the following information, according to the applicable standard's extension mentioned in RPRC_20a: a) the ~~user-friendly~~ **trade** name of the Relying Party, b) the unique identifier of the Relying Party, **c)the trade name of the Relying Party Service, d) the identifier of the Relying Party Service,** e) a User-friendly description of the intended use of the ~~Relying Party~~ **current use case**, f) the URL of the Registrar of the Relying Party, and g) the identifier of the intended use of ~~the Relying Party~~**this use case**. _Notes: **a)** Including items a) and ~~b~~**c**) enables the Wallet Unit to show to the User the name of the Relying Party **and Relying Party Service**. Including ~~c~~**e**) enables the Wallet Unit to inform the User about the intended use. Including ~~c) and d)~~**b), d) and g)** enables the Wallet Unit, if desired by the User, to request from the Registrar the attributes registered by the Relying Party for this **Service and** intended use, as well as the corresponding privacy policy and other registered information. See [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) for the definition of this information. **b)** ~~Note that~~ in case the Relying Party Instance is operated by an intermediary, items a) - g) pertain to the intermediated Relying Party, see also RPI_06._ |      **Modify**        |
| RPRC_20 | Relying Party Instances and Wallet Units SHALL support the extension for [ISO/IEC 18013-5] or the extension for [OpenID4VP], as specified in ETSI TS 119 472-2 and amended by a CIR in preparation, as applicable, for transferring a single Relying Party registration certificate from a Relying Party Instance to a Wallet Unit. _Note: The correct CIR will be referenced here when it is published._ |      Keep        |
| RPRC_20a | Relying Party Instances and Wallet Units SHALL support the extension for [ISO/IEC 18013-5] or the extension for [OpenID4VP], as specified in ETSI TS 119 472-2 and amended by a CIR in preparation, as applicable, for transferring the information listed in RPRC_19a from a Relying Party Instance to a Wallet Unit. _Note: The correct CIR will be referenced here when it is published._ |      Keep        |
| RPRC_21 | If the User indicated that they want to verify the information registered about a Relying Party and the Wallet Unit retrieved this information either from the registration certificate or from the online service of the Registrar (see RPRC_16 - RPRC_18), it SHALL verify that all attributes requested in the presentation request are included in the list of attributes registered by the Registrar. If the outcome of the verification is negative, the Wallet Unit SHALL, when asking for User approval according to RPA_07, notify the User about the requested attributes that the Relying Party did not register. |      Keep        |

##### E. Requirements on the presentation and verification of registration certificates of PID Providers and Attestation Providers

| **Index** | **Requirement specification** |**Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPRC_22 | If a PID Provider or Attestation Provider received a registration certificate **for one of its services** (see RPRC_1**3**~~4~~), it SHALL include the **applicable** registration certificate in its Credential Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01 and the extension thereof in ETSI TS 119 472-3. The registration certificate SHALL be included in the metadata by value, not by reference. _Note: This ensures that no external requests are necessary to validate the PID Provider or Attestation Provider, and that issuance transactions are atomic and self-contained._ |      **Modified**       |
| RPRC_22a | A PID Provider or Attestation Provider SHALL include the ~~the~~ following information in its Credential Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01 and the extension thereof in ETSI TS 119 472-3: a) the ~~user-friendly~~**trade** name of the PID Provider or Attestation Provider, b) the unique identifier of the PID Provider or Attestation Provider, **c)the trade name of the Relying Party Service, d) the identifier of the Relying Party Service,** e) a User-friendly description of the PID(s) or attestation(s) issued by this **Service of the** PID Provider or Attestation Provider, f) the URL of the Registrar of the PID Provider or Attestation Provider, and g) the attestation type(s) that **this Service of** the PID Provider or Attestation Provider intends to issue to Wallet Units. |      **Modified**       |
| RPRC_23 | A Wallet Unit SHALL verify that the type of attestation it wants to request from the PID Provider or Attestation Provider is registered by the relevant Registrar, according to ISSU_24a for PID Providers and ISSU_34a for Attestation Providers. _Note: Unlike for Relying Parties, see RPRC_21, the Wallet Unit always carries out this verification, regardless of the preference of the User set as per RPRC_16._ |      Keep        |

### 4.4 Topic 52 - Relying Party Intermediaries

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPI_01 | An intermediary SHALL register as a Relying Party, in accordance with all requirements in [Topic 27](./annex-2.02-high-level-requirements-by-topic.md#a2316-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties), while indicating it intends to act as an intermediary. _Note: a) This implies that an intermediary obtains an access certificate containing its own name and unique Relying Party identifier. b) An intermediary may also obtain a registration certificate according to [Topic 44](./annex-2.02-high-level-requirements-by-topic.md#a2326-topic-44---registration-certificates-for-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties), but this certificate will not be used for intermediated transactions. c) An entity that registered as an intermediary may also register as a Relying Party in its own capacity. In such a case, it will receive one or more registration certificates for its intended use(s), and will use one of these certificates when interacting with a Wallet Unit._ |      Keep        |
| RPI_02 | Empty |      -        |
| RPI_03 | An intermediary SHALL register each intermediated Relying Party it is acting on behalf of at a Registrar in the Member State where the intermediated Relying Party is established, according all requirements in [Topic 44](./annex-2.02-high-level-requirements-by-topic.md#a2326-topic-44---registration-certificates-for-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties). If a Provider of registration certificates associated with the Registrar issues registration certificates, the intermediary SHALL receive a registration certificate for each of the registered intended uses of the intermediated Relying Party. |      Keep        |
| RPI_04 | When registering an intermediated Relying Party, an intermediary SHALL provide legally valid evidence that this Relying Party will indeed use the services of this intermediary to interact with Wallet Units. The Registrar SHALL verify this evidence, and, if it is found to be correct, SHALL register the relationship between the intermediary and the intermediated Relying Party. _Note: Such evidence may, for instance, be a contract between the intermediary and the intermediated Relying Party._ |      Keep        |
| RPI_05 | When an intermediated Relying Party asks its intermediary to request some attributes from a Wallet Unit, it SHALL specify a) its ~~user-friendly~~**trade** name, b) its unique identifier, **c) its Service identifier, d) the trade name of its Service, e**~~c~~) the URL of its Registrar. f) the identifier of its intended use, g) a User-friendly  description of its intended use. In addition, if the intermediated Relying Party has registration certificates, it SHALL indicate which single registration certificate the intermediary must include in the presentation request. _Note: a) See RPRC_19a for why the intermediary needs this information. b) Since a), b) and ~~c~~**e**) will not change for each request, specification of this information can be done once. The same is true for c) and d) if the intermediated Relying Party has only one registered **Service, and for f) and g) in case it has only one** intended use._ |    **Modify**    |
| RPI_06 | When requested by an intermediated Relying Party, an intermediary SHALL request a presentation of attributes from a specific Wallet Unit. In the request, the intermediary SHALL include the intermediary's access certificate meant in requirement RPI_01 and the registration certificate of the Relying Party, as meant in RPI_03, if available. In addition, whether or not a registration certificate is available, the intermediary SHALL include in the request the information about the intermediated Relying Party required in RPRC_19a. |      Keep        |
| RPI_06a | Empty |      -        |
| RPI_07 | In case a Wallet Unit receives a presentation request from an intermediary on behalf of an intermediated Relying Party, it SHALL display the **trade** names and identifiers of both the intermediary and the intermediated Relying Party to the User when asking for User approval, as described in RPA_07. _Note: In this case, the **trade** name and identifier of the intermediary are included in the access certificate presented by the Relying Party Instance, whereas the **trade** name and identifier of the intermediated Relying Party are included in the extension of the presentation request (see RPRC_19a), and in the registration certificate if available. If these names and identifiers are different, the Wallet Unit knows that the presentation request is from an intermediary on behalf of an intermediated Relying Party._ |    **Modify**    |
| RPI_07a | In case a Wallet Unit receives a presentation request from an intermediary on behalf of an intermediated Relying Party, and if the User indicated that they want to verify the information registered about this Relying Party (according to RPRC_16), the Wallet Unit SHALL verify that that the contractual relationship between the Relying Party **Service** and the intermediary **Service** is indeed registered by the responsible Registrar according to RPI_04, see also RPRC_04. If this verification fails, the Wallet Unit SHALL notify the User when asking for User consent. _Note: The Wallet Unit can either do this by inspecting the registration certificate (if available) or by querying the Registrar._ |      **Modify**        |
| RPI_07b | Empty |      -       |
| RPI_08 | When a Wallet Unit presents to an intermediary any User attributes from a PID or attestation, the intermediary SHALL, after successfully carrying out the verifications in RPI_09, forward these attributes (only) to the Relying Party on behalf of which the presentation request was made. If any of the verifications in RPI_09 fail, the intermediary SHALL NOT forward any attributes to the Relying Party. |      Keep        |
| RPI_09 | When a Wallet Unit presents to an intermediary any attributes from a PID or attestation, the intermediary SHALL verify the authenticity of the PID or attestation, its revocation status, device binding, and User binding, as well as any combined presentation of attributes, if applicable, as specified in this ARF and if agreed with the Relying Party. Furthermore, the intermediary SHALL verify the authenticity of the Wallet Unit and its revocation status, as specified in this ARF, if agreed with the Relying Party. _Note: ~~This~~**The** ARF does not mandate that a Relying Party must carry out all of these verifications. Therefore, the intermediary and any Relying Party using its services must agree on what verifications the intermediary will carry out._ |       **Modify**       |
| RPI_10 | The intermediary SHALL delete any PIDs or attestations it obtained from the Wallet Unit, including any User attributes, completely and immediately after it has sent the User attributes to the intermediated Relying Party. If the intermediary does not send any User attributes to the intermediated Relying Party, for example because one of the verifications in the previous step failed, the intermediary SHALL delete the PIDs, attestations, or WUAs completely and immediately as soon as it has completed all necessary verifications. |      Keep        |

## 5 Additions and Changes to the ARF and related technical specifications

The agreed Annex 2 HLR additions and modifications to existing HRLs are listed in Section 4.

Any identified changes that are necessary in RP Registration related technical specifications (TS5 and TS6, published standard organisation specifications related to RPACs, RPRCs) will be collected to this section during the open commenting period.

Initially the recognised changes required are:

- Adding the Relying Party Service identifier to the data model of registration certificate in ETSI TS 119 475.
- Ask ETSI 119 411-8 on access certificate policy to specify proper X.509 element to be used to carry the Relying Party Service identifier, as well as the Relying Party Service tradename.
- Modify the TS5 data model to a) include the WalletRelyingPartyService class containing the RP service identifier and b) move Trade Name from the WalletRelying Party (WRP) class under the Service class and provide refined attribute usage descriptions. Each WRP class can contain 1..* Service objects. The following current members of the WalletRelyingParty class will be moved into the WalletRelyingPartyService class: supportURI, srvDescription, intendedUse, entitlements, providesAttestations, usesIntermediary. WRP TradeName remains in WalletRelyingParty, but WalletRelyingPartyService also contains a Service TradeName.
- Modify the TS6 information to be registered to include the RP service identifier and TradeName.
- Modify the behaviour of Registry API of TS5 to allow the RP service identifier as a query parameter.
- Modify the API response model for providing information of query-matching Intended uses (not the condensed mode reply of today)
- other Registry API fixes that are received via official written feedback channels during the commenting period.

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
