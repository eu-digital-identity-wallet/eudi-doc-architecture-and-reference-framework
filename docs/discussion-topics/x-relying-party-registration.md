# 
Version 0.1, updated 12 March 2025


[Link to GitHub discussion](https://www.github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/431)


# Topic X - Relying Party Registration

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic X: Relying Party registration.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_This topic is to gather High level Requirements (HLR) for Relying Party registration. The HLR relate to information necessary for authentication to access European Digital Identity Wallets, and to relying parties’ contact details and their intended use of wallets, including what data relying parties may ask users for_.

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to the Relying Party registration.

- Chapter 3 presents and discusses a list of identified issues, with suggested changes and/or new High-Level Requirements related to this topic.

- Chapter 4 presents a log of the additions and changes that will be made to High Level Requirements in the ARF as a result of discussing this topic with Member States.

- Chapter 5 refers to other topics related to Relying Party registration.

- Chapter 6 presents the additions and changes that will be made to the ARF main document as a result of discussions. 

## 2 Legal Requirements for Relying Party registration
Two legal texts impose direct requirements on the Relying Party registration: The evolving [Draft of the CIR for RP-Registration](https://tinyurl.com/IA-5b-draft) and the [European Digital Identity Regulation]. This section recaps the respective legal requirements from these sources.

### 2.1  [European Digital Identity Regulation] about Relying Party registration 

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

*For the purposes of registration, relying parties should provide the information necessary to allow for their electronic identification and authentication towards European Digital Identity Wallets. When declaring their intended use of the European Digital Identity Wallet, relying parties should provide information regarding the data that they will request, if any, in order to provide their services and the reason for the request. 
Relying party registration facilitates the verification by Member States with regard to the lawfulness of the activities of the relying parties in accordance with Union law. The obligation to register provided for in this Regulation should be without prejudice to obligations laid down in other Union or national law, such as the information to be provided to the data subjects pursuant to the Regulation (EU) 2016/679. Relying parties should comply with the safeguards offered by Articles 35 and 36 of that Regulation, in particular by performing data protection impact assessments and by consulting the competent data protection authorities prior to data processing where data protection impact assessments indicate that the processing would result in a high risk. Such safeguards should support the lawful processing of personal data by relying parties, in particular with regard to special categories of data, such as health data. The registration of relying parties is intended to enhance transparency and trust in the use of European Digital Identity Wallets. 
Registration should be cost-effective and proportionate to the related risks in order to ensure uptake by service providers. In that context, registration should provide for the use of automated procedures, including the reliance on and the use of existing registers by Member States, and should not entail a pre-authorisation process. 
The registration process should enable a variety of use-cases that can differ in terms of mode of operation, whether online or in offline mode, or in terms of the requirement to authenticate devices for the purposes of interfacing with the European Digital Identity Wallet. 
Registration should apply exclusively to relying parties providing services by means of digital interaction.*


**Recital (18)**

*Safeguarding Union citizens and residents in the Union against the unauthorised or fraudulent use of European Digital Identity Wallets is of high importance for ensuring trust in and for the wide uptake of European Digital Identity Wallets. Users should be provided with effective protection against such misuse. In particular, when facts that form the basis for fraudulent or otherwise illegal use of a European Digital Identity Wallet are established by a national judicial authority in the context of another procedure, supervisory bodies that are responsible for European Digital Identity Wallet issuers should, upon notification, take the necessary measures to ensure that the registration of the relying party and the inclusion of relying parties in the authentication mechanism are withdrawn or suspended until the notifying authority confirms that the irregularities identified have been remedied.*


**Article 3**

Definitions

*‘relying party’ means a natural or legal person that relies upon electronic identification, European Digital Identity Wallets or other electronic identification means, or upon a trust service;*


**Article 5b - European Digital Identity Wallet-Relying Parties**

1. *Where a relying party intends to rely upon European Digital Identity Wallets*
*for the provision of public or private services by means of digital*
*interaction, the relying party shall register in the Member State where it is*
*established.*
2. *The registration process shall be cost-effective and proportionate-to-risk.*
*The relying party shall provide at least:*
*(a) the information necessary to authenticate to European Digital Identity Wallets, which as a minimum includes:*
*(i) the Member State in which the relying party is established; and*
*(ii) the name of the relying party and, where applicable, its registration number as stated in an official record together with identification data of that official record;*
*(b) the contact details of the relying party;*
*(c) the intended use of European Digital Identity Wallets, including a indication of the data to be requested by the relying party from users.*
3. *Relying parties shall not request users to provide any data other than that*
*indicated pursuant to paragraph 2, point (c).*
4. *Paragraphs 1 and 2 shall be without prejudice to Union or national law that*
*is applicable to the provision of specific services.*
5. *Member States shall make the information referred to in paragraph 2*
*publicly available online in electronically signed or sealed form suitable for*
*automated processing.*
6. *Relying parties registered in accordance with this Article shall inform*
*Member States without delay about any changes to the information provided*
*in the registration pursuant to paragraph 2.*
7. *Member States shall provide a common mechanism for allowing the*
*identification and authentication of relying parties, as referred to in Article*
*5a(5), point (c).*
*…*
10. *Intermediaries acting on behalf of relying parties shall be deemed to be*
*relying parties and shall not store data about the content of the transaction.*
11. *By ... [6 months from the date of entry into force of this amending*
*Regulation], the Commission shall establish technical specifications and*
*procedures for the requirements referred to in paragraphs 2, 5 and 6 to 9 of this*
*Article by means of implementing acts on the implementation of European*
*Digital Identity Wallets as referred to in Article 5a(23). Those implementing*
*acts shall be adopted in accordance with the examination procedure referred*
*to in Article 48(2).*
*...*

### 2.2 CIR Draft on Relying Party registration

The current version of the \[Draft of the CIR for RP-Registration\] specifies the following requirements related to Relying Party registration:

1. The roles: 
    * wallet-relying party - a type of the relying party; includes: service providers, PID providers, attestation providers, trust service providers and intermediaries;
    * registrar
2. Setting up at each Member State one or more national registers of registered wallet-relying parties.
3. Make this information available to the public in a manner that is both human and machine-readable - via an API and website. The information made available shall be signed or sealed.
4. Member States should set out and publish one or more registration policies applicable to national registers set up in their territory
5. Wallet-relying parties should provide the necessary information (during registration process), including their entitlement(s), for inclusion in the national registers
6. Registrars should set up online and, where applicable, automated registration processes and  shall verify registration infromation provided by the wallet-relying party in an automated manner where possible.
7. The registrant receives:
   + one ‘Wallet-Relying Party Access Certificate’, and
   + one or more 'Wallet-Relying Party Registration Certificates' (one per intended use)
10. The Wallet-Relying Party Registration Certificate contains (i.a.) intended use description and the list of entitlements, while the Wallet-Relying Party Access Certificate does NOT carry such information. 
8. Wallets authenticate wallet-relying parties with use of the Wallet-Relying Party Access Certificates.
9. In a transaction, a wallet solution will read out the intended use from the Wallet-Relying Party Registration Certificate and will inform the wallet user whenever the wallet-relying party is asking for more information than what they have registered as intended use and the user will have possibility to reject the transaction (as well as to make a claim or report the case to a competent authority).
10. The registrar may suspend or cancel the registration with or without prior notice to the affected wallet-relying party based on proportionality assessment, taking into account the impact on the fundamental rights privacy, security and confidentiality of the users in the eco-system, as well as the severity of the disruption caused by the suspension or cancellation and the associated costs, both for the wallet-relying party and the user.

The list of information to be provided by a wallet-relying party during registration (as per Annex I):
+ official name of the wallet-relying party 
+ user-friendly name of the wallet-relying party
+ one or more official identifiers of the wallet-relying party (EORI, LEI, VAT number...)
+ physical address and member state if not present in official identifier
+ URL belonging to the wallet-relying party where applicable
+ Detailed contact information
+ description of the type of services provided
+ For each intended use, a list of the data, including attestations and attributes, that the relying party intends to request
+ description of intended use of the data
+ indication whether the wallet-relying party is a public sector body
+ the entitlement(s) of the wallet-relying party (Service provider, QEAA provider, intermediary…) 

The list of possible entitlements (as per Annex I): 
+ Service_Provider 
+ QEAA_Provider
+ Non_Q_EAA_Provider
+ PUB_EAA_Provider
+ PID_Provider
+ QCert_for_ESeal_Provider
+ QCert_for_ESig_Provider
+ rQSigCDs_Provider
+ rQSealCDs_Provider
+ ESig_ESeal_Creation_Provider
+ Intermediary 

Requirements for electronic signatures or seals applied to the information made available on registered wallet-relying parties (as per Annex II):
+ JavaScript Object Notation (JSON) and electronic signatures and electronic seals referred to in Article 3(4) shall be performed JavaScript Object Notation (JSON) in accordance with IETF 7515 for JSON Web Signatures 


Requirements on the API for the register (as per Annex II):
+ a REST API compliant with OpenAPI version 3, supporting JSON as a format
+ allow any requestor, without prior authentication, to make (search/read/list) requests to the register, for information about a wallet-relying party, allowing for partial matches
+ be published and documented through OpenAPI version 3 compatible technical specification
+ provide security functions in order to ensure the availability and integrity of the API and the information available through it 
+ shall be secure by default and by design


Requirements for wallet-relying party access certificates (as per Annex IV):
+ issued under certificate policy and certificate practice statement compliant with at least the NCP requirements as specified in ETSI EN 319 411-1 version 2.5.1 (2023-10)
+ certificate to include 
  - the location (entire certification path) where the certificate supporting the advanced electronic signature or advanced electronic seal on that certificate is available 
  - a machine processable reference to the applicable certificate policy and certificate practice statement
  - the information referred to in Annex I, points 1, 2, 3, 5 and 6 (a-b-c) 

Requirements for wallet-relying party registration certificates (as per ANNEX V):
+ issued under certificate policy and certificate practice statement compliant with at least the NCP requirements as specified in ETSI EN 319 411-1 version 2.5.1 (2023-10)
+ certificate to include
  - the location where the certificate supporting the advanced electronic signature or advanced electronic seal on that certificate is available, for the entire certification path to be built up to the expected trust anchor in the public key infrastructure hierarchy used by the provider 
  - machine processable reference to the applicable certificate policy and certificate practice statement 
  - registration information referred to in Annex I (points 1, 2, 3, 5 and 7, 8, 9, 10, 11); 
  - declaration on legal requirement to identify natural persons referred to in Article 8 paragraph 7 
  - common access policy as referred to in Article 8 paragraph 3
+ attributes in the data exchange format JavaScript Object Notation (JSON) 


Below are selected excerpts from the evolving \[Draft of the CIR for RP-Registration\], including the recitals and the Articles that establish these requirements.

**Recital (1)**

*Member States should establish and maintain registers of registered wallet-relying parties established in their territory.*

**Recital (4)** 

*In order to facilitate the consultation of the information on registered wallet-relying parties across the Union, Member States should make this information available to the public in a manner that is both human and machine-readable.* 


**Recital (6)** 

*As registration policies are a useful tool for providing clear guidance to the wallet-relying parties on the registration process, Member States should set out and publish the registration policies applicable to registers set up in their territory.*

**Recital (7)**

*[...] another objective of the relying party registration is to facilitate the verification by Member States of the lawfulness of the activities of the wallet-relying parties. Therefore, wallet-relying parties should provide, for inclusion in the registers the necessary information, including their entitlement(s).*  

**Recital (8)**

*In order to ensure that the registration process is cost-effective and proportionate-to risk, and to strike an appropriate balance between meeting a high level of transparency and safety on the one hand and ensuring uptake by service providers on the other hand, registrars should set up online and, where applicable, automated registration processes for wallet-relying parties that are easy to use and they should verify applications for registration without undue delay.*

**Recital (10)**

*[...] wallet-relying parties should use wallet-relying party access certificates when they identify themselves to wallet units. To guarantee interoperability of those certificates across all wallets provided within the Union, wallet-relying parties access certificates should adhere to common requirements set-out in the Annex to this Regulation*

**Recital (11)**

*[...] wallet-relying parties are not to request users to provide any data other than those indicated for the intended use of wallets during the registration process. Wallet users should be enabled to verify the registration data of wallet-relying parties. To enable wallet users to verify that the attributes being requested by the wallet-relying party are within the scope of their registered attributes, Member States may require the issuance of wallet-relying party registration certificates to registered wallet-relying parties. To ensure the interoperability of the wallet-relying party registration certificates, Member States should ensure that those certificates meet the requirements and standards set out in the Annex of this Implementing Regulation.* 

**Recital (12)**
*[...] registrars should be able to suspend or cancel the registration of any wallet-relying party without prior notice where the registrars have reason to believe that the registration contains information which is not accurate, not up to date or misleading, the wallet-relying party is not compliant with the registration policy or the wallet-relying party is otherwise acting in breach of Union or national law in a way that relates to their role as a wallet-relying party. In order to safeguard the stability of the wallet ecosystem, the decision to suspend or cancel a registration should be proportionate to the service disruption caused by the suspension or cancellation and the associated cost and inconvenience for the service provider and the user. For the same reason, supervisory bodies are to be enabled to suspend and cancel the registration required pursuant to Article 46a(4), point (f) of Regulation (EU) No 910/2014.*


**Article 2**

Definitions

*‘wallet-relying party’ means a relying party that intends to rely upon wallet units for the provision of public or private services by means of digital interaction;*

*'provider of person identification data’ means a natural or legal person responsible for issuing and revoking the person identification data and ensuring that the person identification data of a user is cryptographically bound to a wallet unit;*


**Article 3**

National registers

*2 Member States shall make the information set out in Annex I on registered wallet-relying parties from all national registers publicly available online, both in human readable form and in a form suitable for automated processing*

*3. The information shall be available through a single national application programming interface (‘API’) and through a national website. It shall be electronically signed or sealed by or on behalf of the registrar, in accordance with the requirements set out in Section 1 of Annex II.*


**Article 4** 

Registration policies 

*1. Member States shall lay down and publish one or more national registration policies applicable to national registers.*

*3. The registration policy shall cover at least the following points:* 

  *(a) the identification and authentication procedures applicable to wallet-relying parties during the registration process;* 
  
  *(b) the supporting documentation to be provided by the wallet-relying party to establish their identity, business registration, any applicable entitlement(s), and other relevant information that is required under the registration policy;* 
  
  *(c) where applicable, the description of the authentic sources or other official electronic records in the Member State where the register is set up, that can be relied upon to provide accurate data, information or other evidence required as part of the registration process;*  
  
  *(d) where applicable, the automated means supported to enable wallet-relying parties to register or to update an existing registration;* 
  
  *(e) the means of redress available to wallet-relying parties under the law of the Member State where the register is set up;* 
  
  *(f) the rules and procedures for the verification of the identity of the registered wallet-relying party and of any other relevant information provided by that party.* 



**Article 6**

The registration process  

*3. Registrars shall verify, where applicable, in an automated manner:* 

  *(a) the accuracy and validity of the information required under Article 5;* 

  *(b) where applicable, the power of attorney of a representative of the wallet-relying party in accordance with the laws and procedures of the Member State where the register is set up;* 

  *(c) the type of entitlement(s) of the wallet-relying party as set out in **Annex I.***  


*4. The verification of the information referred to in paragraph 3 shall include an authenticity and validity assessment of the provided information against the supporting documentation provided by the wallet-relying parties and against any authentic sources or other official electronic records in the Member State where the register is set up and to which the registrars have access in accordance with national law. The verification of entitlements of wallet-relying parties shall be carried out in accordance with **Annex III**.*  

*5. When a wallet-relying party no longer intends to rely upon wallet units for the provision of public or private services under a specific registration, it shall notify the relevant registrar without undue delay and request the cancellation of that registration.*


**Article 7**  

Wallet-relying party access certificates  

*1. Member States shall ensure that providers of wallet-relying party access certificates issue wallet-relying party access certificates to wallet-relying parties registered in accordance with the requirements set out in Article 4 to Article 6 of this Regulation.*

*2. Member States shall set up dedicated certificate policies and certificate practice statements in accordance with the requirements set out in Annex IV. Member States shall ensure that wallet-relying party access certificates meet the requirements set out in **Annex IV**.*   
 

**Article 8**  

Wallet-relying party registration certificates  

*1. Member States may require providers of wallet-relying party registration certificates to issue wallet-relying party registration certificates to wallet-relying parties registered in accordance with the requirements set out in Article 4 to Article 6 of this Regulation.*

*2. Where Member States require the provision of wallet-relying party registration certificates, Member States shall ensure that these certificates meet the requirements set out in **Annex V**.*


 
**Article 9**  
Suspension and cancellation 

*1. Registrars may suspend or cancel a registration of a wallet-relying party where such a suspension or cancellation is requested by a supervisory body pursuant to Article 46a(4), point (f) of Regulation (EU) No 910/2014 or where the registrars have reasons to believe that:*
*(a) the registration contains information which is not accurate, not up to date or misleading;*
*(b) the wallet-relying party is not compliant with the registration policy;*
*(c) the wallet-relying party is requesting more attributes than what they have registered in accordance with Article 5 and Article 6 of this Regulation;*
*(d) the wallet-relying party is otherwise acting in breach of Union or law of that Member State in a way that relates to their role as a wallet-relying party;*


*4. When considering the suspension or cancellation in accordance with Article 9 paragraph 2, the registrar shall conduct a proportionality assessment, taking into account the impact on the fundamental rights privacy, security and confidentiality of the users in the eco-system, as well as the severity of the disruption caused by the suspension or cancellation and the associated costs, both for the wallet-relying party and the user. Based on the result of this assessment, the registrar may suspend or cancel the registration with or without prior notice to the affected wallet-relying party.* 


**ANNEX I**

(summary)

Information regarding wallet-relying parties

+ name of the wallet-relying party
+ user-friendly name of the wallet-relying party
+ one or more identifiers of the wallet-relying party (EORI, LEI, VAT number...)
+ physical address
+ URL
+ Detailed contact information
+ description of the type of services provided
+ For each intended use, a list of the data, including attestations and attributes, that the relying party intends to request
+ description of intended use of the data
+ indication whether the wallet-relying party is a public sector body
+ The entitlement(s) of the wallet-relying party


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
- Intermediary

  
*5. Detailed contact information of the wallet-relying party, one or more, including:*
*(a) a website for providing helpdesk and support;*
*(b) a phone number where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;*
*(c) a digital address where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;*
*(d) an e-mail address where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;*


*7. A list of the attributes that the relying party intends to request, expressed as a friendly name and a technical name including the namespace that the attributes are grouped under in a machine-readable format for automated processing, with an indication if they are mandatory or optional.*


**ANNEX II**

(summary)


*1. REQUIREMENTS ON ELECTRONIC SIGNATURES OR SEALS APPLIED TO THE INFORMATION MADE AVAILABLE ON REGISTERED WALLET-RELYING PARTIES* 

+ The file format used by the API: be JavaScript Object Notation (JSON)
+ electronic signatures and electronic seals - JSON Web Signatures (JWS) 


*2. REQUIREMENTS ON THE SINGLE API*  

+ REST API, supporting JSON data format
+ published as OpenAPI version 3  
+ allow any requestor, without prior authentication, to make (search/read/list) requests to the register  
+ provide security functions in order to ensure the availability and integrity of the API and the information available through it. The API shall be secure by default and by design.



**ANNEX III** 

(summary)

*Source of documentary evidence for the verification of entitlements of wallet-relying parties*
+ verification of qualified trust service providers -  shall be based on the national trusted lists
+ verification of non-qualified trust service providers - shall be based on the national trusted lists  or on national MS verification procedures  (set out in their registration policies)
+ verification of providers of person identification data - shall be based on the list of providers of person identification data published by the Commission in accordance with Article 5a(18) of Regulation (EU) No 910/2014
+ verification of providers of electronic attestations of attributes issued by or on behalf of a public sector body responsible for an authentic source - shall be based on the list published by the Commission in accordance with Article 45f(3) of Regulation (EU) No 910/2014



**ANNEX IV** 

(summary)

*Requirements for wallet-relying party access certificates*

+ X.509 certificate
+ certificate policy and certificate practice statement
+ follow Normalised Certificate Policy (NCP) requirements as specified in ETSI EN 319 411-1 version 2.5.1 (2023-10)
+ plus additional requirements set out in the Annex IV 


**ANNEX V** 

(summary)

*Requirements for wallet-relying party registration certificates* 

+ non-X.509 certificate
+ certificate policy and certificate practice statement
+ follow Normalised Certificate Policy (NCP) requirements as specified in ETSI EN 319 411-1 version 2.5.1 (2023-10)
+ includes the information referred to in Annex I, points 1, 2, 3, 5 and 7, 8, 9, 10, 11; 
+ expresses attributes in JavaScript Object Notation (JSON) format and in accordance with harmonised technical specifications; 
+ plus additional requirements set out in the Annex V.



## 3 Discussion 

The Relying Party registration covers from functional perspective of the ARF and the European Digital Identity ecosystem the following aspects: 

1) the **Registrar function** for which the Member States are responsible to organise this function, register and a publicly accessible API at a national level (based on the future technical specifications and the CIR provided by the European Commission),
2) the registration process mandated to be be followed by all Relying Parties resulting in issuance of **Wallet-Relying Party Access Certificate** (RPAC) and as many **Wallet-Relying Party Registration Certificates** (RPRC) as the Relying Party has dedicated intended uses (use cases, services provided to the EUDI Wallet Users),
3) the **operational use of aforementioned certificates** in Relying Party transactions with the EUDI Wallet Units and their Users,
4) **handling the functional revocation of Relying Party certificates** as necessitated by the legal requirements, 
5) how the registration and operational use of the RP registration certificates shall be done when **the Relying Party relies upon another Relying Party that has the operational role of an Intermediary** to provide its intended use to the Wallet Units


Having analysed the combined legal requirements, the current ARF (release 1.6), as well as recent German architecture concept proposals (\[German non-paper on RP Authn\], \[German non-paper on WRP with attestations\], that together contain considerable amount of technical detail and that were discussed indirectly in the context of topic D already), this section raises the following topics for discussion at level of High-Level Requirements relevant for the ARF:

+ Requirements needed to support registrar issuance of RP registration certificates for proximity use cases, not just remote (specifically, support of both JWT and CWT formats of the RP registration certificates, support of both JOSE and COSE signature)
+ Requirements impacted from the fact that registration certificates are issued per each registered intended use of the Relying Party
+ Changes needed in the ARF due to earlier assumption that PID or Attestation Providers did not need a Relying Party registration certificate
+ Identified HLR changes due to clarification of the role of intermediaries (adaptation to the modified role  of intermediaries and the related processes, e.g. registration process and RP registration certificate content if issued to an intermediary)  
+ Modification related to distinguishing between lifecycle of the RP registration and the lifecycle of RPRC itself, as well as the relation between them (e.g. adapt the HLRs to the fact that certificates can only be revoked (no suspension), while the registration can be cancelled or suspended)  
+ Other terminology mismatches that need alignment between the draft IA and the ARF (eg. registration 'withdrawal' to be replaced with 'cancellation')
+ Necessary adaptation of registration policy, certification policy and certification policy statement requirements in line with conclusions on the above issues
+ Impacts on the other HLRs (Topic 6 - RP authentication, Topic 10 - attribute issuance at least)

This document is ONLY intended to clarify the high-level requirements related to the Relying Party registration topic. The necessary technical specifications (including any policy documents) will be developed by the European Commission after agreement of the requirements has been reached.


### 3.1 Proximity use case support

The Annex IV and V of the draft CIR on RPR will bind legally what certificate standards are applicable for the RPAC and RPRC to be issued by the registrar. Use of the RPRC in context of proximity use case is mentioned in the ARF indirectly in (6.6.3.5), but necessary technical requirements for RPRC issuance are pointing at use of JOSE for signing/sealing the certificate, and the data format of the certificate contents being JSON (Annex V of the draft CIR). Option to support COSE/CWT at the registrar must be added to the requirements.

A new HLR is proposed to extend the scope of registration to apply over both online and proximity use cases:

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| REG_30    | During registration, the Relying Party SHALL indicate if they intend to use proximity and/or remote presentation requests. For use with proximity presentation requests, the Registrar SHALL issue a registration certificate in CWT format. For use with remote presentation requests, the Registrar SHALL issue a registration certificate in JWT format. | New (currently: Empty)| 


### 3.2 Registration certificate per intended use

According to the draft CIR on RPR a Relying Party will get issued a unique RPRC for each of its registered intended uses, and these registration certificates may be revoked independent of each other or of the associated RPAC. The access certificate is the Relying Party's 'master switch' to the EUDI ecosystem, whilst registration certificates are used to register and document the use case/s provided to the Wallet User. The registration certificate will not be a X.509 certificate, and thus the required certificate policies for RPRCs should be clarified both in the IA draft and the ARF. 

Current RPRC_2 and RPC_3 in the ARF should be updated to reflect the text of the draft CIR on RPR, a requirement on use of unique RP identifier across the RPRCs, and a new HLR on creating applicable certificate policies is suggested for Topic 44 as follows:

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPRC_2    | The Commission SHALL ensure that a technical specification is created, describing at least 1. the contents and format of registration certificates, 2. the signing method(s) used to ensure the authenticity of the registration certificates. 3. the trust infrastructure necessary for signing registration certificates and for verifying these signatures, including, if necessary, the use of Trusted Lists to establish trust in Member States Registrars and to distribute their trust anchors to Wallet Units. 4. the method used for binding each registration certificate to the Relying Party Instance access certificate that will be used during the same transaction. This binding method SHALL enable a Wallet Unit to verify that the registration certificate was in fact issued to the Relying Party that authenticated itself using the access certificate. The binding method SHALL consider situations in which the Relying Party uses the services of an intermediary (see Topic 52) to connect to the Wallet Unit. 5. whether or not a registration certificate must have a validity period. 6. whether or not a registration certificate must be revocable, and if so, the method to be used for revocation. Moreover, ~~if a registration certificate must be revocable,~~ the technical specification SHALL describe the impact of revocation, especially compared to the impact of revocation of the Relying Party Instance access certificates. |          Keep with proposed changes    |
| RPRC_3    | The contents of a registration certificate **issued per registered intended use of the Relying Party** SHALL include at least ~~1. the list of attributes registered by the Relying Party, where each attribute is identified by the identifier specified for it in the applicable Attestation Rulebook, as specified in ARB_06a or ARB_06b. 2. the name of the Relying Party, which SHALL be identical to the name meant in Reg_31. 3. the EU-wide unique identifier of the Relying Party, as meant in Reg_32. 4.~~ **information required in Annex V of the CIR for Relying Party Registration.** ~~i~~**I**f the Relying Party uses the services of an intermediary (see Topic 52): the fact that this is the case, plus the name and unique identifier (as meant in Reg_32) of this intermediary. |      Keep with proposed changes        |
| RPRC_4    | The EU-wide unique identifier SHALL be identical in all registration certs issued for a given Relying Party.| New |
| RPRC_5    | The Commission SHALL provide technical specifications establishing common Security Policy for registration certificates.| New |
 

### 3.4 Addressing the PID Providers and Attestation Providers on RPRCs

The \[Draft of the CIR for RP-Registration\] implies that among all other roles defined in the ARF also the PID Providers and Attestation Providers will receive registration certificates, with the role registered as part of the registration and reflected in the certificate information (the specific entitlement being one or more of the set PID_Provider, QEAA_Provider, Non_Q_EAA_Provider or PUB_EAA_Provider). This needs to be reflected in the ARF, which so far has separated these roles from the Relying Parties (per definition of the ARF).

 Section 6.3.2.2 of the ARF says that "*A PID Provider access certificate indicates that its subject is a PID Provider. Similarly, an Attestation Provider access certificate indicates that its subject is a QEAA Provider, a PuB-EAA Provider or a non-qualified EAA Provider.*" 

This is not the case per the draft CIR, the entitlements indicating the registered role are only present in the Relying Party registration certificate. 

Therefore, the definition set in the ARF needs to be adapted or extended accordingly, and Reg_17 on list of HLRs for the issuance of access certificates should be removed (entitlements not being present in access certificates):

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
|Reg_17	| ~~The common Certificate Policy mentioned in Reg_12 SHALL require that an access certificate indicates whether its subject is a PID Provider, a QEAA Provider, a PuB-EAA Provider, a (non-qualified) EAA Provider, or a Relying Party Instance.~~ | Deletion |

Alternatively, the Reg_17 could be moved with proper modification to topic 44 on Relying Party registration certificates.


### 3.5 Registration certificate for intermediaries

The intention reflected in the draft IA is that the intermediaries are to receive the RPRC. If an end-Relying Party uses an intermediary, it (the end-RP) will not need to receive a Wallet-Relying Party certificate as the intermediary will apply for it and host the RPRCs for all of its customers.
The intermediary will obtain as many RPRCs as number of its intermediated end-RPs entities (multiplied by the number of services/intended uses for each entity possibly).

ARF (1.6) contains requirement RPI_02, assuming the intermediary does not receive its own registration certificate.  Therefore the ARF needs to be adapted to the intended role of the intermediaries as per the draft IA, which implies modifications of multiple HLRs. Here below presented are proposed changes to the key HRLs in this respect (other HLRs might need to be updated accordingly). 



| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPI_02 | An intermediary is acting ~~only~~ as an intermediary for other Relying Parties, ~~and not as a Relying Party in its own right, SHALL NOT obtain~~ **but from the Registrar point of view is considered as a Relying Party and obtains** a registration certificate according to [Topic 44](#a2344-topic-44---relying-party-registration-certificates), containing its own name and Relying Party identifier. |  Keep with proposed changes     |
| RPI_03 | For each of the **end-** Relying Parties that uses its services, an intermediary SHALL obtain a registration certificate from a Registrar, according to the requirements in [Topic 44](#a2344-topic-44---relying-party-registration-certificates). This registration certificate SHALL contain that Relying Party's name and unique identifier, as well as the list of attributes registered for that Relying Party. |   Keep with proposed changes      |
| RPI_05 | When issuing a registration certificate for ~~a Relying Party to~~ an intermediary, the Registrar SHALL include in the registration certificate the attribute meant in requirement RPRC_03, point 4, containing the name and identifier of the ~~intermediary~~**intermediated end-Relying Party**. |         Keep with proposed changes    |
| RPI_06 | When requested by **an intermediated end-Relying Party** ~~Relying Party~~, an intermediary SHALL request the presentation of attributes from a specific Wallet Unit, using their own access certificate meant in requirement RPI_01, and the registration certificate **issued for the intermediary in relation to this end-Relying Party, as** ~~of the Relying Party~~ meant in RPI_03. |  Keep with proposed changes      |
| RPRC_01    | During the registration process for Relying Parties, as specified in Topic 27, the Member State Registrar SHALL create and sign **or seal** a registration certificate and issue it to the Relying Party. The registration certificate SHALL comply with the applicable requirements in the technical specification mentioned in RPRC_02. *Note: ~~These requirements do not apply in case the Relying Party acts only as an intermediary, see~~ **See also** Topic 52*. |    Keep with proposed changes     |
| RPRC_03    | The contents of a registration certificate SHALL include at least 1. the list of attributes registered by the Relying Party, where each attribute is identified by the identifier specified for it in the applicable Attestation Rulebook, as specified in ARB_06a or ARB_06b. 2. the name of the Relying Party, which SHALL be identical to the name meant in Reg_31. 3. the EU-wide unique identifier of the Relying Party, as meant in Reg_32. 4. if the ~~Relying Party uses the services of~~ certificate is for an intermediary (see Topic 52): ~~the fact that this is the case, plus~~ the name and unique identifier (as meant in Reg_32) of ~~the intermediary~~ **the intermediated end-Relying Party**. |   Keep with proposed changes    |



### 3.6 Registration and Registration Certificate life cycles 

The \[Draft of the CIR for RP-Registration\] (Article 9(4)) envisions 'suspension' and 'cancellation' of the registration (apart from the non-specified "active" state after the registration). 
At the same time the RP Registration certificate has its own life cycle, which envisions only 'revocation' (apart from the "valid" state after issuance).

In addition, the IA draft text lists the following reasons of suspension/cancellation:
+ the registration contains information which is inaccurate, out of date or misleading;
+ the wallet-relying party is not complying with the registration policy;
+ the wallet-relying party is otherwise acting in breach of Union or national law or of the European Declaration on Digital Rights and Principles for the Digital Decade 2023/C 23/016 in a way that relates to their role as a wallet-relying party for example if the wallet-relying party has not rightfully minimised the set of attributes it requests access to;
+ by a supervisory body European Digital Identity Wallet Framework in the case of illegal or fraudulent use of the European Digital Identity Wallet



| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_15 | The common Certificate Policy mentioned in Reg_12 SHALL include a policy for revocation, which SHALL require that an Access Certificate Authority revokes an access certificate at least when: **the certificate subject's registration is cancelled or suspended**  ~~the certificate subject which is a Relying Party is de-registered by the respective Registrar,the certificate subject which is a PID Provider, QEAA Provider, PuB-EAA Provider, or (non-qualified) EAA Provider is withdrawn or suspended~~ by the respective Registrar, on request of the certificate subject, or on request of a competent national authority. |     Keep with proposed changes       |
| Reg_22a | A Registrar SHALL provide a method to suspend or ~~withdraw~~ cancel **the registration of** a registred Attestation Provider. |     Keep with proposed changes       |
| Reg_22b | A Registrar SHALL have a policy for the suspension or ~~withdrawal~~ **cancellation** of a registered Attestation Provider, which SHALL specify that an Attestation ~~Provider~~**Provider's registration**  is suspended or ~~withdrawn~~ **cancelled** at least on request of the PID Provider **,Registrar** or of a competent national authority. |     Keep with proposed changes       |
| REG_28    | A Member State's Registry SHALL log all changes made on the information regarding a Relying Party, including at least initial registration, updates, deletion of information, and suspension or **cancellation**~~withdrawal~~. |     Keep with proposed changes      |
| REG_29    | A Registrar SHALL have a policy for the **cancellation and suspension** ~~withdrawal~~ of **the registration of** a registered Relying Party, which SHALL specify that ~~a Relying Party is withdrawn~~ **the Relying Party's registration is cancelled or suspended** at least on request of the Relying Party **, Registrar** or ~~of~~ a competent national authority. |     Keep with proposed changes      |


## 4 Current HLRs and Proposals of Changes

ARF 1.5.0, Annex 2, Topic 27, Topic 44 and Topic 52, contains a number of High-Level Requirements related to the topic. 
The Topic 27 requirements cover general requirements for Member State registration processes and specific requirements for the registration of Relying Parties, whereas Topic 44 covers issuance of Relying Party registration certificates. Topic 52 focuses on the intermediaries.

The existing HLRs are listed in the tables below, along with a proposal to keep, change, add, or remove the HLR.


### 4.1 Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and (non-qualified) EAAs, and Relying Parties

A.  General requirements for Member State registration processes

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| REG_01    | Member States SHALL provide processes and mechanisms for PID Providers, QEAA Providers, PuB-EAA Providers, (non-qualified) EAA Providers, and Relying Parties to register in a registry. Note: Member States may choose to implement a single registry for all these roles, or a separate registry for each of these roles. |              |
| REG_02    | Member States SHALL make publicly available all necessary details and documentation about the registration processes for their registry. |              |
| REG_03    | Member States SHALL publish the registry entries online, in a sealed or signed machine-readable common format suitable for automated processing, according to the [European Digital Identity Regulation] Article 5b 5, for the purpose of transparency to Users and other stakeholders. |              |
| REG_04    | Member States SHALL make the registry available online, in a common human-readable format. |              |
| REG_05    | The Commission SHALL establish a technical specification for the common formats mentioned in Reg_03 and Reg_04. |              |
| REG_06    | The Commission SHALL provide specifications for a common API for retrieving registry entries from the Member States registries per Reg_03, defining the minimum requirements for interoperability. Note: Requirements for this API are defined in Reg_08 and Reg_09. |              |
| REG_07    | The Commission SHALL provide specifications for a common user interface for accessing the Member State registries per Reg_04. Note: Requirements for this user interface are defined in Reg_08 and Reg_09. |              |
| REG_08    | The API mentioned in Reg_06 and the user interface mentioned in Reg_07 SHALL use a secure channel protecting the authenticity and integrity of the information in the registry during transport. |              |
| REG_09    | The API mentioned in Reg_06 and the user interface mentioned in Reg_07 SHALL NOT require authentication or prior registration and authorisation of any entity wishing to retrieve the information in the registry. |              |
| Reg_15 | The common Certificate Policy mentioned in Reg_12 SHALL include a policy for revocation, which SHALL require that an Access Certificate Authority revokes an access certificate at least when: the certificate subject which is a Relying Party is de-registered by the respective Registrar,the certificate subject which is a PID Provider, QEAA Provider, PuB-EAA Provider, or (non-qualified) EAA Provider is withdrawn or suspended by the respective Registrar, on request of the certificate subject, or on request of a competent national authority. |              |
…

E.  Requirements for the registration of Relying Parties

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| REG_23    | The Commission SHALL establish a technical specification for a common set of Relying Party information to be registered in Member State registries. This set SHALL include at least the information defined in [European Digital Identity Regulation] article 5b 2 (c). |              |
| REG_24    | A Member State SHALL enable a Relying Party to register remotely, using an API or user interface. |              |
| REG_25    | A Member State SHALL identify a Relying Party at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Relying Party could cause to Users and other stakeholders in the EUDI Wallet ecosystem. |              |
| REG_26    | A Member State SHALL enable a Relying Party to update the information registered on it using a process comparable to the original registration process, and using the API or user interface mentioned in Reg_24. |              |
| REG_27    | Relying Parties SHALL make any updates necessary to ensure the continued correctness of the registered information without undue delay. |              |
| REG_28    | A Member State's Registry SHALL log all changes made on the information regarding a Relying Party, including at least initial registration, updates, deletion of information, and suspension or withdrawal. |              |
| REG_29    | A Registrar SHALL have a policy for the withdrawal of a registered Relying Party, which SHALL specify that a Relying Party is withdrawn at least on request of the Relying Party or of a competent national authority. |              |
| REG_30    | Empty                            

F.  *Requirements for the issuance of Relying Party Instance access certificates*

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Reg_31 |  The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains a name for the Relying Party, in a format suitable for presenting to a User. *Note: A Wallet Unit needs such a name when requesting User approval according to [[Topic 6](#a236-topic-6---relying-party-authentication-and-user-approval)].* |   Remove, RP name presentation to the user is part of the Topic 44. |
| Reg_32 | The common Certificate Policy mentioned in Reg_12 SHALL require that a Relying Party Instance access certificate contains an EU-wide unique identifier for the Relying Party, and SHALL specify a method for deriving such identifiers. *Notes: - The Wallet Instance needs such an identifier at least to lodge a complaint of suspicious Relying Party presentation requests to a data protection authority according to [Topic 50](#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data). - The EU-wide unique identifier could, for example, be a composition of a unique identifier of the registrar, defined in the policy, and a unique identifier for the Relying Party allocated by this registrar. - This Relying Party identifier is identical in all Relying Party Instance access certificates issued to a given Relying Party.* |Remove, RP name presentation to the user is part of the Topic 44.            |              |

### 4.2 Topic 44 - Relying Party Registration Certificates

A.  Issuance of Relying Party registration certificates 

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPRC_01    | During the registration process for Relying Parties, as specified in Topic 27, the Member State Registrar SHALL create and sign a registration certificate and issue it to the Relying Party. The registration certificate SHALL comply with the applicable requirements in the technical specification mentioned in RPRC_02. Note: These requirements do not apply in case the Relying Party acts only as an intermediary, see Topic 52. |              |
| RPRC_02    | The Commission SHALL ensure that a technical specification is created, describing at least 1. the contents and format of registration certificates, 2. the signing method(s) used to ensure the authenticity of the registration certificates. 3. the trust infrastructure necessary for signing registration certificates and for verifying these signatures, including, if necessary, the use of Trusted Lists to establish trust in Member States Registrars and to distribute their trust anchors to Wallet Units. 4. the method used for binding each registration certificate to the Relying Party Instance access certificate that will be used during the same transaction. This binding method SHALL enable a Wallet Unit to verify that the registration certificate was in fact issued to the Relying Party that authenticated itself using the access certificate. The binding method SHALL consider situations in which the Relying Party uses the services of an intermediary (see Topic 52) to connect to the Wallet Unit. 5. whether or not a registration certificate must have a validity period. 6. whether or not a registration certificate must be revocable, and if so, the method to be used for revocation. Moreover, if a registration certificate must be revocable, the technical specification SHALL describe the impact of revocation, especially compared to the impact of revocation of the Relying Party Instance access certificates. |              |
| RPRC_03    | The contents of a registration certificate SHALL include at least 1. the list of attributes registered by the Relying Party, where each attribute is identified by the identifier specified for it in the applicable Attestation Rulebook, as specified in ARB_06a or ARB_06b. 2. the name of the Relying Party, which SHALL be identical to the name meant in Reg_31. 3. the EU-wide unique identifier of the Relying Party, as meant in Reg_32. 4. if the Relying Party uses the services of an intermediary (see Topic 52): the fact that this is the case, plus the name and unique identifier (as meant in Reg_32) of this intermediary. |              |


### 4.3 Topic 52 - Relying Party Intermediaries


| **Index** | **Requirement specification** | **Proposal** |
|-----------|-------------------------------|--------------|
| RPI_01 | An intermediary SHALL register as a Relying Party, in accordance with all requirements in [Topic 27](#a2327-topic-27---registration-of-pid-providers-providers-of-qeaas-pub-eaas-and-non-qualified-eaas-and-relying-parties). *Note: This implies that an intermediary obtains an access certificate containing its own name and unique Relying Party identifier.* |               |
| RPI_02 | An intermediary is acting only as an intermediary for other Relying Parties, and not as a Relying Party in its own right, SHALL NOT obtain a registration certificate according to [Topic 44](#a2344-topic-44---relying-party-registration-certificates), containing its own name and Relying Party identifier. |            |
| RPI_03 | For each of the Relying Parties that uses its services, an intermediary SHALL obtain a registration certificate from a Registrar, according to the requirements in [Topic 44](#a2344-topic-44---relying-party-registration-certificates). This registration certificate SHALL contain that Relying Party's name and unique identifier, as well as the list of attributes registered for that Relying Party. |            |
| RPI_04 | When issuing a registration certificate for a Relying Party to an intermediary, the Registrar SHALL verify, in a manner to be decided by a Member State, that the Relying Party will indeed use the services of the intermediary to interact with Wallet Units. |            |
| RPI_05 | When issuing a registration certificate for a Relying Party to an intermediary, the Registrar SHALL include in the registration certificate the attribute meant in requirement RPRC_03, point 4, containing the name and identifier of the intermediary. |               |
| RPI_06 | When requested by a Relying Party, an intermediary SHALL request the presentation of attributes from a specific Wallet Unit, using their own access certificate meant in requirement RPI_01, and the registration certificate of the Relying Party meant in RPI_03. |               |
| RPI_07 | In case a Wallet Unit receives a presentation request from an intermediary, on behalf of a Relying Party, it SHALL verify the name of the intermediary during Relying Party authentication and display this name to the User when asking for User approval, as described in requirement RPA_06a. |               |
| RPI_08 | When a Wallet Unit presents any User attributes to an intermediary, the intermediary SHALL forward these attributes only to the Relying Party that requested the intermediary to request these attributes from the Wallet Unit. |               |



## 5 Relation to Other Topics (TBD)

Below we discuss how Relying Party registration relates to the other topics being discussed.

As indicated in the chapter 3, several changes are proposed in the context of the Relying Party registration. The changes introduced in the respective HLRs are to be also reflected in the remaining topics/HLRs, at least in referece to 
+ Topic 6 - RP authentication,
+ Topic 31 - PID Provider, Wallet Provider, Attestation Provider, and Access Certificate Authority notification and publication
+ ...

In result, the following modification are therefore proposed:


| **Index** | **Requirement specification** | **Proposal** |
|-----------|-------------------------------|--------------|
| RPA_06a | If the registration certificate indicates that ~~the Relying Party is using the services of~~ **the certificate belongs to** an intermediary, as described in [Topic 52](#a2352-topic-52-relying-party-intermediaries), the Wallet Unit SHALL ~~verify that the name and the unique identifier of the intermediary included in the registration certificate are identical to the name and unique identifier included in the Relying Party Instance access certificate. If this verification fails, the Wallet Unit SHALL treat this as a Relying Party authentication failure. If this verification succeeds,~~ the Wallet Instance SHALL display to the User the name of the intermediary **and the intermediated end-Relying Party**. |     Keep with proposed changes      |


### 5.1 Use of Certificate Transparency

[Topic S] refers to use of Certificate Transparencey (CT) in the context of Access Certificate. There is no decision yet whether CT will be used at all, as the initial intention of CT use was the context of browsers/QWACs.
Same applies to RPRC (where the use of CT has even less sense, as this is not supposed to be a X.509 certificate).


### 5.2 User requesting data deletion to relying parties

[Topic L] will discuss requirements related to the EUDI Wallet User's means to request data deletion from any Relying Parties that they've provided with attestation data. This will be using the contact details which are required to be registered as part of the registration data set.


### 5.3 User reporting unlawful or suspicious request of data to DPAs

[Topic M] will cover requirements on EUDI Wallet users means to report evidently or potentially unlawful presentation requests by a Relying Party to relevant data protection authority/-ies (DPAs). If a Relying Party is trying to ask attestations or attributes beyond its reported Intended Use -specific data set that is present in the related Relying Party Registration Certificate. If found in breach and not corrected promptly by the Relying Party, the DPA and national authorities are allowed to revoke certificates of the Relying Party in breach of their registration data.


### 5.4 Relation to Risk Register
The risk register for European Digital Identity Wallets \[RiskRegister\]
contains the following risks that are related to the Relying Party registration:

|Risk type | Risk id | Related risk titles|
|-------------|-------|-------------------|
|High-level risks to the wallets | R6 | Data disclosure|
|High-level risks to the wallets |R9 | Unauthorised transaction|

| R6 Data disclosure |
|---|
|Data disclosure is defined as the unauthorised exposure of personal data including special categories of personal data. The privacy breach risk is very similar when considered from a privacy rather than security viewpoint. |

| R9 DUnauthorised transaction |
|---|
|Unauthorised transactions are defined as operational activities conducted without the permission or knowledge of the wallet user. In many cases, an unauthorised transaction can lead to Identity theft (R4) or Data disclosure (R6). It is also related to unauthorised transactions, such as the misuse of cryptographic keys. |

More specifically, \[RiskRegister\]  describes the following threats to a Wallet:

|ID | Threat description | Related risks |
|---------|-------|-------------------|
|TR25 | The wallet can present attributes to a relying party without the approval of a user. | Data disclosure (R6) |
|TR29 | An attacker can leak attributes from the wallet and identify the wallet user where identification is not required/allowed. | Data disclosure (R6) |
|TR38 | Not being able to prove user’s consent for shared attributes, relying parties can affect the integrity of logs. |  Data disclosure (R6)  |
|TR40 | A relying party that consists of multiple units/entities that each have a different scope of what they are allowed to request/process, can request and process data for which they do not have lawful grounds for. |  Data disclosure (R6) / Unauthorised transaction (R9)  |
## 6 Additions and Changes to the ARF (TBD)

See chapter 4 above. In addition, discussions of the Relying Party registration in the main part of the ARF will be updated accordingly.

## 7 References

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [Ref_1]                                | TBA                                                          |
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [Topic S]                            | Topic S - Certificate transparency                             |
| [RiskRegister]                         | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |                                                |
| [Topic 27]                             | Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and (non-qualified) EAAs, and Relying Parties |
| [Topic 44]                             | Topic 44 - Relying Party registration certificates           |
| [Topic 52]                             | Topic 52 - Relying Party intermediaries                      |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [Draft of the CIR for RP-Registration]                      | [Commission Implementing Regulation (EU) 2025/xxxx laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the registration of wallet-relying parties*, draft]((https://tinyurl.com/IA-5b-draft)) |
| [OID4VP] | OpenID for Verifiable Presentations - draft 24 |
| [German non-paper on RP Authn]                     | DE non-paper on Wallet-Relying Party Authentication, outlining a proposed solution for implementing the Wallet-Relying Party authentication requirements from IA 5b |
| [German non-paper on WRP with attestations]        | DE non-paper on use fo OID4VC with Wallet-Relying Party Attestations (architecture concept) |
|
