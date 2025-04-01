# 
Version 0.9, updated 1 April 2025


[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/443)


# Topic N - Export and data portability

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic N: Export and data portability (Article 5a(4)(f) and Article 5a(4)(g)).

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_Requirements on the export and data portability functionalities supported by all Wallet Solutions is needed when source and target Wallet Instance are managed by the same of by different Wallet Providers._



### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to the export and portability of User's data from a Wallet Unit.

- Chapter 3 presents and discusses a list of identified issues, with suggested changes and/or new High-Level Requirements related to this topic.

- Chapter 4 presents a log of the additions and changes that will be made to High Level Requirements in the ARF as a result of discussing this topic with the Member States.

- Chapter 5 refers to other topics related to User's data export and portability.

- Chapter 6 presents the additions and changes that will be made to the ARF main document as a result of discussions. 


## 2 Legal Requirements for Export and Data Portability

Two legal texts impose direct requirements on Users's data export and portability: [European Digital Identity Regulation] and  [[CIR 2024/2979]](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng) as regards the integrity and core functionalities of European Digital Identity Wallets. 

This section recaps the respective legal requirements from these sources.



### 2.1  [European Digital Identity Regulation] about Data Export and Portability

The [European Digital Identity Regulation] requires that the Wallet Units enable their Users to:
+ download the User’s data, electronic attestation of attributes and configurations (if technically possible),
+ import data to another Wallet Unit (portability),
+ all above performed in a User-friendly, transparent and traceable manner.


Below are the actual excerpts from the Regulation, including the recitals and the articles that establish these requirements.

**Article 5a**

*4. European Digital Identity Wallets shall enable the User, in a manner that is User-friendly, transparent, and traceable by the User, to:*

*[...]*

*(f) download, to the extent technically feasible, the User’s data, electronic attestation of attributes and configurations;*

*(g) exercise the user’s rights to data portability.*



### 2.2 [CIR 2024/2979] about Data Export and Portability

The current version of the [CIR 2024/2979] specifies the following requirements related to User's data export and portability:
+ the Wallet Unit stores User's data - personal data, as well as transacion data (that shall be logged), 
+  the Wallet Unit shall allow extracting and exporting (dowloading) the User's data from a Wallet Unit, to the extent of technical feasiblity (with exception of critical assets),
+ the Wallet Unit shall allow the wallet User to import User's data exported from another Wallet Unit (also from other Wallet provider),
+ the data should be protected in all steps (storage, export, import) to preserve integrity, authenticity and confidentiality,
+ the migration process from one Wallet Unit to another one should ensure level of assurance high,
+ the same technical solutions are recommended to be used to allow also implementing backup and recovery processes for Wallet Units.


Below are selected excerpts from the [CIR 2024/2979], including the recitals and the articles that establish these requirements.



**Recital (13)**

*Data export and portability objects can log the person identification data and electronic attestations of attributes that have been issued to a particular wallet unit. These objects allow wallet users to extract the relevant data from their wallet unit in order to strengthen their right to data portability.* 

*Wallet providers are encouraged to use the same technical solutions to also implement backup and recovery processes for wallet units, making it possible to recover lost wallet units or to transfer information from one wallet provider to another, where appropriate and insofar as this can be done without impairing the right to data protection and the security of the digital identity ecosystem.*



**Article 9**

*Transaction logs*


*1. Irrespective of whether or not a transaction is successfully completed, wallet instances shall log all transactions with wallet-relying parties and other wallet units, including electronic signing and sealing.*


*2. The logged information shall at least contain:*

*(a) the time and date of the transaction;*

*(b) the name, contact details, and the unique identifier of the corresponding wallet-relying party and the Member State in which that wallet-relying party is established, or in case of other wallet units, relevant information from the wallet unit attestation;*

*(c) the type or types of data requested and presented in the transaction;*

*(d) in the case of non-completed transactions, the reason for such non-completion.*


*3. Wallet providers shall ensure integrity, authenticity and confidentiality of the logged information.*


*7. Wallet providers shall enable wallet users to export the logged information referred to in paragraph 2.*


**Article 13**

*Data export and portability*

*Wallet units shall, where technically feasible and excepting cases of critical assets, support secure export and portability of personal data of the wallet user, to allow the wallet user to migrate to a wallet unit of a different wallet solution in a way that ensures level of assurance high as set out in Implementing Regulation (EU) 2015/1502.*


## 3 Discussion 

The implementing act [CIR 2024/2979] has been adopted and the ARF document has been aligned with the act in earlier stage, thus there are no identified discrepancies or major issues. Therefore this paper presents and clarifies the overall concept and technical assumptions and aims to collect feedback if there is a need of any improvements of HLR from the Member States and Coordination Group point of view.


The topics identified for this paper are as follows:
+ scope of data to be logged by the Wallet Unit,
+ possible extent of data export from a Wallet Unit,
+ usability of a Wallet Unit after the data import process,
+ involvement of the PID and Attestation Providers in the Wallet Unit migration and recovery process.


This document is ONLY intended to clarify the high-level requirements related to the export and data portability topic. The necessary technical specifications (including any policy documents) will be developed by the European Commission after an agreement on the requirements has been reached.


### 3.1 Data Export

The Article 5a of [European Digital Identity Regulation] requires from the Wallets to enable to 

> _download, to the extent technically feasible, the User’s data, electronic attestation of attributes and configurations_

as well as in Article 13 of [CIR 2024/2979]


> _where technically feasible and excepting cases of critical assets, support secure export and portability of personal data of the wallet user, to allow the wallet user to migrate to a wallet unit of a different wallet solution in a way that ensures level of assurance high as set out in Implementing Regulation (EU) 2015/1502_


The technically feasible extent of the User's data export is therefore limited for security reasons. 

The ARF is in line with this. In the current version of ARF it is assumed that private keys of PIDs and attestations are not exportable (and not a part of so called Migration Object). In the consequence, the migration process in fact always entails re-issuance of PID and attestations of attributes (see section 3.2). 

Therefore, there are no identified HLRs modifications in this respect. 


### 3.2 Technical Feasibility of Portability and Migration 

The requirements set out in the Topic 34 of ARF define so called Migration Object, that contains a set of data - User's personal and transaction log data - ready to be exported from a Wallet Unit and imported into another one.

This is to be noted that the Migration Object does not contain PID and attestations related private keys, and therefore the migration process requires re-issuance of all PID/attestations with the involvement of the PID / Attestation Providers.

From the Topic 34 'Description' section:

>_Note that the Migration Object does not contain any private keys associated with the PIDs or attestations. In most security architectures for a Wallet Solution described in Section 4.5 of the ARF main document, this is impossible, since the WSCA/WSCD that contains these private keys does not allow their extraction under any circumstances._

The process might be however different if the keys are stored in a remote HSM (as the further text in the 'Description'): 

>_An exception may be architectures in which attestation private keys are managed in a remote HSM and the migration is to a new Wallet Unit of the same Wallet Provider. However, in such cases, restoring functionality of the PIDs and attestations in a new Wallet Unit does not necessitate that private keys must be exported to another HSM. Rather, it implies the User must be able to authenticate towards the existing HSM from the new Wallet Unit, and be recognised as an existing User._

In any case, regardless the architecture, this is assumed that the Migration Object's role is only to facilitate the migration process, i.a. give a list of PIDs and attributes, so that can be re-issued in a new Wallet Unit. 

Finally
>_The fact that the Migration Object does not contain private keys means that PIDs and attestations cannot be backed up and restored from the object in such a way that they are usable in a new Wallet Unit without involvement of the PID Provider or Attestation Provider. Instead, the User must ask the respective PID Provider(s) or Attestation Provider(s) to re-issue the PID(s) or attestation(s) to the new Wallet Unit. The only function of the Migration Object is to simplify this process by listing the PIDs and attestations present in the existing Wallet Unit, together with the information needed by the new Wallet Unit to start the re-issuance process._
 


In conclusion, there are no modifications of HLR in relation to the essence.



There are however minor corrections proposed to Mig_01 and Mig_05. 


For Mig_01, it is to clarify that the WUAs are not part of the migration object (as considered as not "User's data" as such) 

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Mig_01    | A Wallet Unit SHALL include and keep up-to-date a Migration Object, containing the following information: The contents of the log for all transactions executed through the Wallet Unit, as listed in requirement DASH_02. A list of PIDs and attestations present in the Wallet Unit **, except Wallet Unit Attestations**, according to the requirements in this Topic.|      Keep with proposed changes        |



For Mig_05 it is to reflect "integrity and authenticity" aspect required by the Article 9 (2) of [CIR2024/2979]:

>*3. Wallet providers shall ensure integrity, authenticity and confidentiality of the logged information.*

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Mig_05 | The Wallet Unit SHALL store the Migration Object in such a way that its confidentiality, **integrity and authenticity** is protected and that it is protected against use by others than the User. *Note: This could be done, for example, by using password-based cryptography to encrypt the object.* |      Keep with proposed modification      |





### 3.3 Recovery of Lost Wallet Units

The recovery of lost of a Wallet Units follows the same process and the same limitations as for the migration process apply (see section 3.2).


### 3.4 Scope of Logged Information

Article 9(2) of [CIR 2024/2979] specifies the scope of data to be logged:

>_The logged information shall at least contain: (a) the time and date of the transaction; (b) the name, contact details, and the unique identifier of the corresponding wallet-relying party and the Member State in which that wallet-relying party is established, or in case of other wallet units, relevant information from the wallet Unit attestation; (c) the type or types of data requested and presented in the transaction; (d) in the case of non-completed transactions, the reason for such non-completion._


The ARF defines the scope of information to be logged as:
+ all types of transaction executed through the Wallet Unit: issuance and re-issuance transactions, presentation transactions, signature and seal creation transactions, attribute deletion requests sent to a Relying Party, and complaints lodged with a Data Protection Authority (DASH_02, DASH_2a, DASH_03, DASH_04, DASH_05, Mig_01),
+ transactions related to qualified electronic signatures and seals generated by or through the Wallet Unit (QES_13),
+ reports sent to the DPA (RPT_DPA_05).


In conclusion, the ARF is in line with the regulatory requirements in principle, and there are no essential modifications proposed for HLRs in this respect.


However, there are the following minor changes proposed to improve consistency of the text:  

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| DASH_04  | For a signature **and seal** creation transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: a) the date and time of the transaction, b) the document or data signed (where possible), c) in the case of non-completed transactions, the reason for such non-completion. |      Keep with proposed changes        |
| QES_13    | Wallet Providers SHALL ensure that a Wallet Unit provides a log of transactions related to qualified electronic signatures **and seals** generated by or through the Wallet Unit, allowing the User to view the history of previously signed data or documents, according to the requirements in Topic 19. Note: If the signature is generated by a remote Signature Creation Application, the Wallet is at minimum used to authenticate the User to the remote QTSP and to obtain the User's consent for the usage of the private signing key. The logs then record information about these processes. |     Keep with proposed changes         |


Additionally, to improve clarity, there are ongoing changes that will be introduced in the next ARF realease in relation to DASH_03, DASH_04, DASH_05 (to state it more clearly that these information are logged).


## 4 Current HLRs and Proposals of Changes

ARF 1.8.0 contains a number of High-Level Requirements related to the topic included in the following sections:
+ Topic 19 - User navigation requirements (Dashboard logs for transparency)
+ Topic 34 - Migrate to a different Wallet Solution
+ Topic 16 - Signing documents with a Wallet Unit
+ Topic 50 - Blueprint to report unlawful or suspicious request of data

The existing HLRs are listed in the tables below, along with a proposal to keep, change, add, or remove the HLR.


### 4.1 Topic 19 - User navigation requirements (Dashboard logs for transparency)


| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| DASH_02  | The Wallet Unit SHALL log all transactions executed through the Wallet Unit, including any transactions that were not completed successfully. This log SHALL include all types of transaction executed through the Wallet Unit: issuance and re-issuance transactions, presentation transactions, signature creation transactions (see Topic 16), attribute deletion requests sent to a Relying Party (see Topic 48), and complaints lodged with a Data Protection Authority (see Topic 50). _Note: For the data to be logged for an attribute deletion request or a complaint, see Topic 48 and Topic 50, respectively._ |      Keep as-is        |
| DASH_02a  | The Wallet Unit SHALL retain transactions in the log at least for the time period specified in applicable legislation. If the Wallet Unit must delete transactions from the log, for instance because of size limitations, the Wallet Unit SHALL notify the User via the dashboard before doing so and SHALL instruct the User how to export the transactions that are about to be deleted; see DASH_07. |      Keep as-is        |
| DASH_03  | For a presentation transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: a) the date and time of the transaction, b) the name, contact details, and unique identifier of the corresponding Relying Party, and the Member State in which that Relying Party is established, or relevant information from the WUA of the Requestor Wallet Unit (see Topic 30), c) the name, contact details, and unique identifier of the intermediary, if an intermediary is involved in the transaction, d) the attestation type(s) and the identifier(s) of the attribute(s) that were requested, as well as those that were presented, e) in the case of non-completed transactions, the reason for such non-completion. |       Keep as-is       |
| DASH_04  | For a signature **and seal** creation transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: a) the date and time of the transaction, b) the document or data signed (where possible), c) in the case of non-completed transactions, the reason for such non-completion. |      Keep with proposed changes        |
| DASH_05  | For an issuance or re-issuance transaction executed through the Wallet Unit, the dashboard SHALL display to the User at least: a) the date and time of the transaction, b) the name, contact details, and unique identifier of the corresponding PID Provider or Attestation Provider, c) the attestation type requested, as well as the attestation type issued, d) the number of attestations requested and/or issued (i.e., the size of the batch in case of batch issuance). d) in the case of non-completed transactions, the reason for such non-completion. e) for a re-issuance transaction, whether it was triggered by the User or by the Wallet Unit without involvement of the User. |       Keep as-is       |
| DASH_07  | The dashboard SHALL allow the User to export the details of one or more transactions in the log to a file, while ensuring their confidentiality, authenticity and integrity. |       Keep as-is       |


### 4.2 Topic 34 - Migrate to a different Wallet Solution

A. Back-up requirements

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Mig_01    | A Wallet Unit SHALL include and keep up-to-date a Migration Object, containing the following information: The contents of the log for all transactions executed through the Wallet Unit, as listed in requirement DASH_02. A list of PIDs and attestations present in the Wallet Unit **, except Wallet Unit Attestations**, according to the requirements in this Topic.|      Keep with proposed changes        |
| Mig_02 | The Commission SHALL define a technical specification of the Migration Object. |       Keep as-is     |
| Mig_03 | For each PID or attestation that is issued to it, a Wallet Unit SHALL add all data that is necessary to request re-issuance of that PID or attestation to the Migration Object. This SHALL include at least the attestation type and the PID Provider or Attestation Provider that issued the PID or attestation, as well as their service supply points. However, the Migration Object SHALL NOT contain attribute identifiers or attribute values, and SHALL NOT contain any private keys associated with the PID or attestation. |     Keep as-is       |
| Mig_03b | If the User deletes a PID or attestation from their Wallet Unit, the Wallet Unit SHALL delete the corresponding entry from the Migration Object. |     Keep as-is       |
| Mig_04 | The Wallet Unit SHALL store the Migration Object in an external storage or remote location of the User's choice, in such a way that the User can still retrieve the object from a new Wallet Unit in case the existing Wallet Unit becomes unavailable. *Note: The new Wallet Unit may be either an instance of the same Wallet Solution as the old one, or an instance of a different Wallet Unit.* |      Keep as-is      |
| Mig_05 | The Wallet Unit SHALL store the Migration Object in such a way that its confidentiality, **integrity and authenticity** is protected and that it is protected against use by others than the User. *Note: This could be done, for example, by using password-based cryptography to encrypt the object.* |      Keep with proposed modification      |


B. Restore Requirements

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| Mig_06    | Directly after installation of a new Wallet Instance, the Wallet Instance SHALL enable the User to import a Migration Object from an external storage or remote location indicated by the User. |     Keep as-is         |
| Mig_07 | For each PID and attestation listed in the Migration Object, the Wallet Unit SHALL enable the User to select that PID or attestation. When selected, the Wallet Unit SHALL request the respective PID Provider or Attestation Provider to re-issue that PID or attestation. If the Migration Object lists a PID, the PID SHALL be the first to be restored. |      Keep as-is      |
| Mig_07a | The Wallet Unit SHALL ask the User whether they want to restore the log from the Migration Object. When the User agrees, the Wallet Unit SHALL restore the log, and SHALL append future transactions to this log according to the requirements in [Topic 19](#a2319-topic-19---User-navigation-requirements-dashboard-logs-for-transparency). |    Keep as-is        |
| Mig_11 | The processes and interfaces used for re-issuance of a PID or attestation (as part of a migration process) SHALL be the same as those used for their issuance, as specified in [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit). |      Keep as-is      |



### 4.3 Topic 16 - Signing documents with a Wallet Unit

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| QES_13    | Wallet Providers SHALL ensure that a Wallet Unit provides a log of transactions related to qualified electronic signatures **and seals** generated by or through the Wallet Unit, allowing the User to view the history of previously signed data or documents, according to the requirements in Topic 19. Note: If the signature is generated by a remote Signature Creation Application, the Wallet is at minimum used to authenticate the User to the remote QTSP and to obtain the User's consent for the usage of the private signing key. The logs then record information about these processes. |     Keep with proposed changes         |



## 4.4 Topic 50 - Blueprint to report unlawful or suspicious request of data

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| RPT_DPA_05    | A Wallet Unit SHALL keep reports sent to the DPA in a log file so that it can be presented to the User in the dashboard (as specified in Topic 19). |      Keep as-is        |



## 5 Relation to Other Topics 

### 5.1 Changes to other topics

Below we discuss how User's data export and portability relates to the other topics being discussed.

As indicated in the chapter 3 and 4, there are very few and insignificant changes proposed in the context of data export and portability. 

There are no identified impact to other ARF topics than mentioned in chapters 3 and 4.

### 5.2 Topic C - Wallet Unit Attestation (WUA) and Key Attestation

The data export and portability topic may have relation with the WUA requirements, as the private key handling for PIDs and attestation has relevance for the discussion on the scope and technical feasibility of data to be exported/imported from/to a wallet.

There were several changes introduced to the Topic C (and the related ARF Annex II [Topic 9]) in the earlier stages of the ARF work (see the [Topic C Discussion Paper](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework-private/blob/main/docs/discussion-topics/c-wallet-unit-attestation.md), resulting in reduction and simplification of the requirments. 

In result there is only one requirement with potential relevance:

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| WUA_16    | If a WSCA is able to export a private key, the Wallet Provider SHALL specify this capability as an attribute in the WUA. |       Keep as-is       |

At the same time the Migration Object is assumed not to contain any private keys (refer to Topic 34). Therefore it is finally assumed, that there is no impacts to any of the WUA / [Topic 9] requirements. 


### 5.3 Relation to Risk Register (tbd)
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
|Unauthorised transactions are defined as operational activities conducted without the permission or knowledge of the wallet User. In many cases, an unauthorised transaction can lead to Identity theft (R4) or Data disclosure (R6). It is also related to unauthorised transactions, such as the misuse of cryptographic keys. |

More specifically, \[RiskRegister\]  describes the following threats to a Wallet:

|ID | Threat description | Related risks |
|---------|-------|-------------------|
|TR25 | The wallet can present attributes to a relying party without the approval of a User. | Data disclosure (R6) |
|TR29 | An attacker can leak attributes from the wallet and identify the wallet User where identification is not required/allowed. | Data disclosure (R6) |
|TR38 | Not being able to prove User’s consent for shared attributes, relying parties can affect the integrity of logs. |  Data disclosure (R6)  |
|TR40 | A relying party that consists of multiple units/entities that each have a different scope of what they are allowed to request/process, can request and process data for which they do not have lawful grounds for. |  Data disclosure (R6) / Unauthorised transaction (R9)  |


## 6 Additions and Changes to the ARF 

See sections 4 and 5 above. In addition, data export and portability aspects in the main text of the ARF will be updated accordingly.


## 7 References (tbd)

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [RiskRegister]                         | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |                                                |
| [Topic 9]                             | Topic 9 - Wallet Unit Attestation |
| [Topic 16]                               | Topic 16 - Signing documents with a Wallet Unit
| [Topic 19]                             | Topic 19 - User navigation requirements (Dashboard logs for transparency) |
| [Topic 34]                             | Topic 34 - Migrate to a different Wallet Solution                      |
|[Topic 50 ]                            |  Topic 50 - Blueprint to report unlawful or suspicious request of data |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [CIR 2024/2979]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng)) |
| [OID4VP] | OpenID for Verifiable Presentations - draft 24 |
| [GDPR]   |  Regulation (EU) 2016/679 of the European Parliament and of the Council of 27 April 2016 on the protection of natural persons with regard to the processing of personal data and on the free movement of such data, and repealing Directive 95/46/EC (General Data Protection Regulation) |
