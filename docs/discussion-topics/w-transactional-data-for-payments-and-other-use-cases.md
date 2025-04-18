# Version 0.3, updated 14 April 2025


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
The European Digital Identity Regulation requires the Wallets to provide a functionality of strong authentication to play the role of an authenticator for various services, while the Service Providers are obliged to accept them in their (online) services. Consequently, to enable such processes, the Wallet Units should be able to handle transactional data related to an (external) service and a transaction, to enable required functionality, provide a proof of transaction and auditability, as well as ensure compliance with other regulations where necessary (like Payment Services related legislation).  

Most of the use cases will use the standard Wallet functionality (meaning w/o the need to involve "transactional data"). However for the following use cases it is necessary handle the transactional data:
+ payments,
+ remote qualified electronic signature.   

In this paper we focus on the cases, where the transactional data are involved. 

At the same time, [OID4VP] provides so called "transaction data" mechanism that: 

>enables a binding between the User's identification/authentication and the user’s authorization, for example to complete a payment transaction, or to sign specific document(s) using QES (Qualified Electronic Signatures)

This mechanism seems to be suitable for the purpose of handling the transactional data.  


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

The goal of the discussion is to work out set of generic HLRs that are not tied to any specific use case, unless justified. The intention is to keep the Wallet's role as limited as possible - just as an enabler of the use cases. 

The legal text sets out the requirement of use the Wallet's as strong authenticator in the context of "online services". However the ARF envisions transactions initiated in/from the same Wallet Unit or by another device in a proximity mode. 

To summarise, there are several fundamental questions to be discussed and answered before proposing the set of HLRs. These questions are presented in the next sections.

Note: This document is ONLY intended to clarify or create the high-level requirements related to this topic. The necessary technical specifications (including any policy documents) will be developed by the European Commission after an agreement on the requirements has been reached.


### 3.2 Question for Discussion 

Here below is the list of the fundamental questions that needs answering prior to drafting HLRs.

As the outcome:
+ the set of new HLRs requirements is to be delivered in the ARF Annex 2 for [Topic 20] (Strong User authentication for electronic payments),
+ new Topics may be introduced in the ARF Annex 2 (to cover non-payment use cases),
+ modification or amendments of other HLRs and Topics may be proposed.


**Question 1:** Are rules for representing the contents of a transaction necessary and if so, who should specify these? 

**Question 2:** Should it be possible to send a transaction from one Wallet User to another Wallet User?  

**Question 3:** Should it be possible for a Wallet-Relying Party to define the structure and contents of a transaction? 

**Question 4:** Should it be possible to define the structure and contents of a transaction type for a business area such as payments? 

**Question 5:** If transactions types are defined for a business area, who should be responsible for defining and maintaining these? 

**Question 6:** Should it be possible for a EUDI Wallet to process a transaction in a structured way? 

**Question 7:** Is a transaction restricted to authentication and authorization? 

**Question 8:** Should it be possible to include the actual contents in a transaction or should it be a representation (hash) of it?  

**Question 9:** What is expected from the wallet as mandatory technical requirements to enable it as SCA for payment transaction according to PSD2/RTS ?

 **Question 10:** What is the minimum set of information to be specified for a transaction? 

**Question 11:** Should batch transactions be supported? 

**Question 12:** What are the requirements for the proof of transaction?

**Question 13:** Should the Wallet verify payment transaction data/identifier and to make sure it is different every time? – is it a role of the Wallet? 

**Question 14:** Are there / what are the requirements to ensure a transaction is processed only once?

**Question 15:** Should an access a log of all transactions carried out through the European Digital Identity Wallet via a common dashboard?



## 4 Current HLRs and Proposals of Changes

The topics of the ARF Annex 2 related to the Topic W are the following:
+ Topic 20 - Strong User authentication for electronic payments,
+ Topic 16 - Topic 16 - Signing documents with a Wallet Unit.

The existing HLRs are listed in the tables below, along with a proposal to keep, change, add, or remove the HLR.


### 4.1 Topic 20 - Strong User authentication for electronic payments (tbd)


**Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| TD_01  | tbd |      New     |




## 5 Relation to Other Topics 

### 5.1 Changes to other topics

At this stage no changes to other topics have been identified.


### 5.2 Relation to Risk Register (tbd)
The risk register for European Digital Identity Wallets \[RiskRegister\]
contains the following risks that are related to the Relying Party registration:

|Risk type | Risk id | Related risk titles|
|-------------|-------|-------------------|
|High-level risks to the wallets | R6 | Data disclosure|
|High-level risks to the wallets |R9 | Unauthorised transaction|

| R6 Data disclosure |
|---|
|Data disclosure is defined as the unauthorised exposure of personal data including special categories of personal data. The privacy breach risk is very similar when considered from a privacy rather than security viewpoint. |

| R9 Unauthorised transaction |
|---|
|Unauthorised transactions are defined as operational activities conducted without the permission or knowledge of the wallet User. In many cases, an unauthorised transaction can lead to Identity theft (R4) or Data disclosure (R6). It is also related to unauthorised transactions, such as the misuse of cryptographic keys. |

More specifically, \[RiskRegister\]  describes the following threats to a Wallet:

|ID | Threat description | Related risks |
|---------|-------|-------------------|
|TR25 | The wallet can present attributes to a relying party without the approval of a User. | Data disclosure (R6) |
|TR29 | An attacker can leak attributes from the wallet and identify the wallet User where identification is not required/allowed. | Data disclosure (R6) |
|TR38 | Not being able to prove User’s consent for shared attributes, relying parties can affect the integrity of logs. |  Data disclosure (R6)  |
|TR40 | A relying party that consists of multiple units/entities that each have a different scope of what they are allowed to request/process, can request and process data for which they do not have lawful grounds for. |  Data disclosure (R6) / Unauthorised transaction (R9)  |


## 6 Additions and Changes to the ARF 

See sections 4 and 5 above. In addition, transactional data related aspects in the main text of the ARF will be updated accordingly.


## 7 References

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [RiskRegister]                         | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |                                                |
| [Topic 20]                             | Topic 20 - Strong User authentication for electronic payments |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [CIR 2024/2979]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng)) |
| [OID4VP] | OpenID for Verifiable Presentations - draft 24 |
| [GDPR]   |  Regulation (EU) 2016/679 of the European Parliament and of the Council of 27 April 2016 on the protection of natural persons with regard to the processing of personal data and on the free movement of such data, and repealing Directive 95/46/EC (General Data Protection Regulation) |
| [PSD2]   |  Directive (EU) 2015/2366 of the European Parliament and of the Council of 25 November 2015 on payment services in the internal market, amending Directives 2002/65/EC, 2009/110/EC and 2013/36/EU and Regulation (EU) No 1093/2010, and repealing Directive 2007/64/EC |
| [RTS SCA]   |  Commission Delegated Regulation (EU) 2018/389 of 27 November 2017 supplementing Directive (EU) 2015/2366 of the European Parliament and of the Council with regard to regulatory technical standards for strong customer authentication and common and secure open standards of communication |



