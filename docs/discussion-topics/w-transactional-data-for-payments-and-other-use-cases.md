# Version 0.97, updated 19 May 2025


[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/496)


# Topic W - Transactional data for payments and other use cases

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic W: Transactional data for payments and other use cases.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_This topic is to gather High level Requirements for transactional data needed by the Wallet in payment use cases and other use cases._



### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to the transactional data for payments and other use cases.

- Chapter 3 presents and discusses a list of identified issues, with suggested changes and/or new High-Level Requirements related to this topic.

- Chapter 4 presents a log of the additions and changes that will be made to High Level Requirements in the ARF as a result of discussing this topic with the Member States.

- Chapter 5 refers to other topics related to transactional data.

- Chapter 6 presents the additions and changes that will be made to the ARF main document as a result of discussions. 


## 2 Legal Requirements for Transactional Data for payments and other use cases

The [European Digital Identity Regulation] requires the Wallets to support and provide a function of strong user authentication, that could be used to authenticate the User accessing or using an online service that requires identification and strong authentication (by EU or local law or by contractual obligation).
The online services might be of any type, provided by public or private Service Providers, in particular from  the areas of transport, energy, banking, financial services, social security, health, drinking water, postal services, digital infrastructure, education or telecommunications (but not limited to these ones only).

Therefore the Wallet Solutions should provide functionality that enable wallet-Relying Parties (which are the Service Providers) to use the Wallets as an external tool of User authentication.

Below are the actual excerpts from the Regulation, including the recitals and the articles that establish these requirements.



**Recital (62)**

_Secure electronic identification and the provision of attestation of attributes should offer additional flexibility and solutions for the financial services sector to allow the identification of customers and the exchange of specific attributes necessary to comply with, for example, customer due diligence requirements under a future Regulation establishing the Anti Money Laundering Authority, with suitability requirements stemming from investor protection law, or to support the fulfilment of strong customer authentication requirements for online identification for the purposes of account login and of initiation of transactions in the field of payment services._


**Article 3 (Definitions)**

(51) _'strong user authentication' means an authentication based on the use of at least two authentication factors from different categories of either knowledge, something only the user knows, possession, something only the user possesses or inherence, something the user is, that are independent, in that the breach of one does not compromise the reliability of the others, and is designed in such a way as to protect the confidentiality of the authentication data;_


**Article 5f(2)**
_Where private relying parties that provide services, with the exception of microenterprises and small enterprises as defined in Article 2 of the Annex to Commission Recommendation 2003/361/EC, are required by Union or national law to use strong user authentication for online identification or where strong user authentication for online identification is required by contractual obligation, including in the areas of transport, energy, banking, financial services, social security, health, drinking water, postal services, digital infrastructure, education or telecommunications, those private relying parties shall, no later than 36 months from the date of entry into force of the implementing acts referred to in Article 5a(23) and Article 5c(6) and only upon the voluntary request of the user, also accept European Digital Identity Wallets that are provided in accordance with this Regulation._



## 3 Discussion 

### 3.1 Introduction

#### 3.1.1 The Use Cases
The European Digital Identity Regulation requires the Wallets to provide a functionality of strong authentication of a User, to play a role of an authenticator for various services, while the Service Providers are obliged to accept them in their (online) services. Consequently, to enable such processes, the Wallet Units should be able to handle transactional data related to an (external) service and a transaction, to enable required functionality, provide a proof of transaction and auditability, as well as ensure compliance with other regulations where necessary (like Payment Services related legislation). 

In addition, the Wallet is supposed to provide the functionality of a Qualified Electronic Signature. In case of remote QES, the Wallet can play a role of a tool to activate (authorise) signature creation in a remote signing service.  

Therefore, despite there might be many use cases where there will be no need to involve "transactional data", at least for the following use cases it is necessary to do so:
+ payments authentication,
+ remote qualified electronic signature.   

In this paper we focus on the use cases where transactional data is involved. 

At the same time, [OID4VP] provides so called "transaction data" mechanism that: 

>enables a binding between the User's identification/authentication and the user’s authorization, for example to complete a payment transaction, or to sign specific document(s) using QES (Qualified Electronic Signatures)

This mechanism seems to be suitable for the purpose of handling the transactional data. Similarly, the [ISO/IEC 18013-5] protocol payload is also able to bear transactional data if needed.


#### 3.1.2 The Role of the Wallet

In general the life cycle of a Wallet Unit in the role of an authenticator, comprises the following phases:
+ registration - registering the Wallet as an authenticator for a service, that includes User identification and authentication, User consent (for the registration) and linking a Wallet Unit with a service and User's account in that service,
+ authentication - performing User authentication in an on-line service, on request of that service,
+ de-registration - unlinking the Wallet Unit from a service and the User's account in that service.

As the result of registration, a specific Attestation ("service credentials") is issued by the Service Provider or other Wallet-Relying Party (depending on the scheme) to the Wallet Unit. The registration relies on the standard Attestation issuance processes, and the data included in this Attestation are defined by the Service Provider.

In the authentication phase, the Wallet Unit will receive the presentation request of the "service credentials". The presentation is a standard process for the Wallet User, however the request should include transactional data (unique for each service transaction).
In some cases, like payment authentication, the Wallet Unit should display to the User (some) transaction related data (that should be inlcuded in the transactional data).

After the User accepts the presentation request, the Wallet response should include the transactional data, as well as piece of data generated dynamically by the Wallet Unit, for each such presentation, to provide a proof of the User's approval and meet compliance needs where necessary (eg. PSD2 dynamic linking). 

#### 3.1.3 The Goals of the Discussion

The goal of the discussion is to work out a set of generic HLRs that are not tied to any specific use case, unless justified. The intention is to keep the Wallet's role as limited as possible - just as an enabler of the use cases. 

The legal text sets out the requirement to use the Wallet as a strong authenticator in the context of "online services". However ARF envisions transactions initiated in/from the same Wallet Unit or by another device in proximity mode. 

To summarise, there are several fundamental questions to be discussed and answered before proposing the set of HLRs. These questions are presented in the next sections.

Note: This document is ONLY intended to clarify or create the high-level requirements related to this topic. The necessary technical specifications (including any policy documents) will be developed by the European Commission after an agreement on the requirements has been reached.


### 3.2 Question for Discussion 

Here below is the list of the fundamental questions that needs answering prior to drafting HLRs.

As the outcome:
+ the set of new HLRs requirements is to be delivered in the ARF Annex 2 for [Topic 20] (Strong User authentication for electronic payments),
+ new Topics may be introduced in the ARF Annex 2 (to cover non-payment use cases),
+ modification or amendments of other HLRs and Topics may be proposed.


**Question 1:** Are rules for representing the contents of a transaction necessary and if so, who should specify these? 

**Question 2:** Should it be possible to send a transaction to/from one Wallet User to another Wallet User?  

**Question 3:** Should it be possible for a Wallet-Relying Party to define the structure and contents of a transaction? 

**Question 4:** Should it be possible to define the structure and contents of a transaction type for a business area such as payments? 

**Question 5:** If transactions types are defined for a business area, who should be responsible for defining and maintaining these? 

**Question 6:** Should it be possible for a EUDI Wallet to process a transaction in a structured way? 

**Question 7:** Is a transaction restricted to authentication and authorization? 

**Question 8:** Should it be possible to include the actual contents in a transaction or should it be a representation (hash) of it?  

 **Question 9:** What is the minimum set of information to be specified for a transaction? 

**Question 10:** Should batch transactions be supported? 

**Question 11:** What are the requirements for the proof of transaction?

**Question 12:** Are there / what are the requirements to ensure a transaction is processed only once?

**Question 13:** Should a log of all transactions carried out through the European Digital Identity Wallet be accessible via a common dashboard?

On the basis of the discussion and the feedback from Member States' representatives, the High-Level Requirements have been proposed as specified in the section 4.

## 4 Current HLRs and Proposals of Changes

The topics of the ARF Annex 2 related to the Topic W are the following:
+ Topic 20 - Strong User authentication for electronic payments,
+ Topic 16 - Signing documents with a Wallet Unit.

Topic 20 does not have any requirements yet, so the set of new ones is proposed in the section 4.1.

The HLRs set out in the Topic 16 have been reviewed too, however no changes have been identified as necessary from the Topic W perspective.


### 4.1 Topic 20 - Strong User Authentication for Electronic Payments and Other Use Cases


**Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| TD_01  | The Wallet **Unit** SHALL be able to process and render transactional data included in a presentation request. **The Wallet Unit SHALL be able to display transactional data (or parts of it) to the User in a clear, understandable and accurate manner when obtaining the User's confirmation for the transaction.** **Specific** rules for representing the content, structure, rendering and scope of information to be logged in a Wallet Unit is to be defined by an industry sector or a Relying Party in an Attestation Rulebook (according to [Topic 12]). |      New     |
| ~~TD_02~~  | ~~The Wallet Unit SHALL be able to sign the transactional data with the private key of the attestation that was the subject of the presentation request and return it in the response to the Relying Party as a proof of transaction.~~ |      ~~New~~     |
| TD_02  | The Wallet Unit SHALL deliver to the requesting Relying Party a response, that (if required in a given use case) includes transactional data (or parts of it). The ~~scope~~**format and content** of transactional data included in the response SHALL be set out in an Attestation Rulebook or in information provided to the Wallet Unit in the presentation request.    |      New     |
| **TD_03**  | **The Wallet Unit SHALL sign the response, including transactional data, with the private key of the Attestation, using the mechanisms provided by [SD-JWT-VC] and [ISO/IEC 18013-5].   _Note: Such a response constitutes a proof of transaction, as well as fulfils the requirement of the authentication code required in [PSD2]._**   |      **New**     |
| TD_04  | The Wallet Unit SHALL be able to dynamically adapt the dialog (message) displayed to the User (like font size and colour, background colour, text  position, labels in the buttons to 'approve' or 'reject' a transaction) based on the transactional data contained in the presentation request, according to rules set out in an Attestation Rulebook or information provided to the Wallet Unit in the presentation request.   |      New     |
| ~~TD_04~~  | ~~The Wallet Unit SHALL be able to generate and include in an attestation presentation response a unique, cryptographically random value with the sufficient entropy (authentication code), according to rules set out in an Attestation Rulebook or information provided to the Wallet Unit in the presentation request. Note: For payment SCA this requirement is met by use of key binding in [SD-JWT-VC].~~   |      ~~New~~     |


## 5 Relation to Other Topics 

### 5.1 Changes to other topics

At this stage no changes to other topics have been identified.


### 5.2 Relation to Risk Register (tbd)
The risk register for European Digital Identity Wallets \[RiskRegister\]
contains the following risks that are related to the Relying Party registration:

|Risk type | Risk id | Related risk titles|
|-------------|-------|-------------------|



More specifically, \[RiskRegister\]  describes the following threats to a Wallet:

|ID | Threat description | Related risks |
|---------|-------|-------------------|



## 6 Additions and Changes to the ARF 

See sections 4 and 5 above. In addition, transactional data related aspects in the main text of the ARF will be updated accordingly.


## 7 References

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [RiskRegister]                         | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |                                                |
| [Topic 20]                             | Topic 20 - Strong User authentication for electronic payments |
| [Topic 16]                             | Topic 16 - Signing documents with a Wallet Unit |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
| [European Digital Identity Regulation] | [Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng) |
| [CIR 2024/2979]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng)) |
| [OID4VP] | [OpenID for Verifiable Presentations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) |
| [ISO/IEC - 18013-5]   |  [Mobile driving licence (mDL) application](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84) |
| [PSD2]   |  [Directive (EU) 2015/2366 of the European Parliament and of the Council of 25 November 2015 on payment services in the internal market, amending Directives 2002/65/EC, 2009/110/EC and 2013/36/EU and Regulation (EU) No 1093/2010, and repealing Directive 2007/64/EC](https://eur-lex.europa.eu/eli/dir/2015/2366/oj/eng) |
| [RTS SCA]   |  [Commission Delegated Regulation (EU) 2018/389 of 27 November 2017 supplementing Directive (EU) 2015/2366 of the European Parliament and of the Council with regard to regulatory technical standards for strong customer authentication and common and secure open standards of communication](https://eur-lex.europa.eu/eli/reg_del/2018/389/oj/eng) |



