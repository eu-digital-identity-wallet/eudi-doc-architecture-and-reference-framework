# L+M - Requesting erasure of personal data at a wallet-relying party and lodging a complaint with the competent data protection supervisory authority

Version 0.2, created 01 April 2025

[GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/480)

## 1. Introduction

### 1.1 Discussion Paper topic description

The present discussion paper discusses how a wallet user can use her wallet unit to request the erasure 
of personal data at a wallet-relying party and for lodging a complaint with the competent data protection supervisory 
authority. 

The present paper builds upon (see [clause 3](#3-existing-high-level-requirements)) and complements (see [clause 6](#61-high-level-requirements-to-be-added-to-annex-2)) the related discussion in [**Topic 48** (Blueprint for requesting data deletion to Relying Parties)](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2348-topic-48---blueprint-for-requesting-data-deletion-to-relying-parties) 
and [**Topic 50** (Blueprint to report unlawful or suspicious request of data)](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data) 
respectively.

### 1.2 Related risks in the Risk Register

Risks considered in [Topic_A](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/a-privacy-risks-and-mitigations.md) are also applicable here and additional risks
may be added in this discussion paper, if this turns out to be necessary.

### 1.3 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in [RFC 2119](http://rfc-editor.org/rfc/rfc2119.html), i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that is
mandated by an external document. The word 'can' indicates a capability, whereas
other words, such as 'will' and 'is' or 'are' are intended as statements of
fact.

### 1.4 Relevant definitions and requirements from the General Data Protection Regulation (EU) 2016/679

Article 2 (4) of [(EU) No 910/2014](http://data.europa.eu/eli/reg/2014/910/oj) 
stipulates that this regulation is without prejudice to the ''General Data Protection Regulation'' (GDPR)
[(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) and hence it seems to be 
appropriate to recall the most relevant stipulations from GDPR here. 

#### 1.4.1 Definitions

Article 4 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) in particular contains the
following definitions: 

>(1) ‘**personal data**’ means any information relating to an identified or identifiable natural person (‘data subject’); an identifiable natural person is one who can be identified, directly or indirectly, in particular by reference to an identifier such as a name, an identification number, location data, an online identifier or to one or more factors specific to the physical, physiological, genetic, mental, economic, cultural or social identity of that natural person;
>
>(2) ‘**processing**’ means any operation or set of operations which is performed on personal data or on sets of personal data, whether or not by automated means, such as collection, recording, organisation, structuring, storage, adaptation or alteration, retrieval, consultation, use, disclosure by transmission, dissemination or otherwise making available, alignment or combination, restriction, erasure or destruction;
>
>(3) ‘**restriction of processing**’ means the marking of stored personal data with the aim of limiting their processing in the future;
>
>(5) ‘**pseudonymisation**’ means the processing of personal data in such a manner that the personal data can no longer be attributed to a specific data subject without the use of additional information, provided that such additional information is kept separately and is subject to technical and organisational measures to ensure that the personal data are not attributed to an identified or identifiable natural person;
>
>(6) ‘**filing system**’ means any structured set of personal data which are accessible according to specific criteria, whether centralised, decentralised or dispersed on a functional or geographical basis;
>
>(7) ‘**controller**’ means the natural or legal person, public authority, agency or other body which, alone or jointly with others, determines the purposes and means of the processing of personal data; where the purposes and means of such processing are determined by Union or Member State law, the controller or the specific criteria for its nomination may be provided for by Union or Member State law;
>
>(8) ‘**processor**’ means a natural or legal person, public authority, agency or other body which processes personal data on behalf of the controller;
>
>(9) ‘**recipient**’ means a natural or legal person, public authority, agency or another body, to which the personal data are disclosed, whether a third party or not. However, public authorities which may receive personal data in the framework of a particular inquiry in accordance with Union or Member State law shall not be regarded as recipients; the processing of those data by those public authorities shall be in compliance with the applicable data protection rules according to the purposes of the processing;
>
>(10) ‘**third party**’ means a natural or legal person, public authority, agency or body other than the data subject, controller, processor and persons who, under the direct authority of the controller or processor, are authorised to process personal data;
>
>(11) ‘**consent**’ of the data subject means any freely given, specific, informed and unambiguous indication of the data subject's wishes by which he or she, by a statement or by a clear affirmative action, signifies agreement to the processing of personal data relating to him or her;
>
>(12) ‘**personal data breach**’ means a breach of security leading to the accidental or unlawful destruction, loss, alteration, unauthorised disclosure of, or access to, personal data transmitted, stored or otherwise processed;
>
>(21) ‘**supervisory authority**’ means an independent public authority which is established by a Member State pursuant to Article 51;
>
>(22) '**supervisory authority concerned**’ means a supervisory authority which is concerned by the processing of personal data because:
>>
>>   (a) the controller or processor is established on the territory of the Member State of that supervisory authority;
>>
>>   (b) data subjects residing in the Member State of that supervisory authority are substantially affected or likely to be substantially affected by the processing; or
>>
>>   (c) a complaint has been lodged with that supervisory authority;

#### 1.4.2 Requirements

##### Article 5 (Principles relating to processing of personal data) 

Article 5 Nr. 1 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) requires that personal data 
shall be:

>(a) processed lawfully, fairly and in a transparent manner in relation to the data subject (‘**lawfulness, fairness and transparency**’);
>
>(b) collected for specified, explicit and legitimate purposes and not further processed in a manner that is incompatible with those purposes; further processing for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes shall, in accordance with Article 89(1), not be considered to be incompatible with the initial purposes (‘**purpose limitation**’);
>
>(c) adequate, relevant and limited to what is necessary in relation to the purposes for which they are processed (‘**data minimisation**’);
>
>(d) accurate and, where necessary, kept up to date; every reasonable step must be taken to ensure that personal data that are inaccurate, having regard to the purposes for which they are processed, are erased or rectified without delay (‘**accuracy**’);
>
>(e) kept in a form which permits identification of data subjects for no longer than is necessary for the purposes for which the personal data are processed; personal data may be stored for longer periods insofar as the personal data will be processed solely for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes in accordance with Article 89(1) subject to implementation of the appropriate technical and organisational measures required by this Regulation in order to safeguard the rights and freedoms of the data subject (‘**storage limitation**’);
>
>(f) processed in a manner that ensures appropriate security of the personal data, including protection against unauthorised or unlawful processing and against accidental loss, destruction or damage, using appropriate technical or organisational measures (‘**integrity and confidentiality**’).


Article 5 Nr. 2 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>2.   The controller shall be responsible for, and be able to demonstrate compliance with, paragraph 1 (‘**accountability**’).

#### Article 11 (Processing which does not require identification)

Article 11 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>1. If the purposes for which a controller processes personal data do not or do no longer require the identification of a data subject by the controller, the controller shall not be obliged to maintain, acquire or process additional information in order to identify the data subject for the sole purpose of complying with this Regulation.
>
>2.   Where, in cases referred to in paragraph 1 of this Article, the controller is able to demonstrate that it is **not in a position to identify the data subject**, the controller shall inform the data subject accordingly, if possible. In such cases, **Articles 15 to 20 shall not apply** except where the data subject, for the purpose of exercising his or her rights under those articles, provides additional information enabling his or her identification.

#### Article 17 (Right to erasure (‘right to be forgotten’))

Article 17 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>1.   The data subject shall have the **right to obtain from the controller the erasure of personal data** concerning him or her without undue delay and the controller shall have the obligation to erase personal data without undue delay where one of the following grounds applies:
>>
>> (a) the personal data are no longer necessary in relation to the purposes for which they were collected or otherwise processed;
>>
>> (b) the data subject withdraws consent on which the processing is based according to point (a) of Article 6(1), or point (a) of Article 9(2), and where there is no other legal ground for the processing;
>>
>> (c) the data subject objects to the processing pursuant to Article 21(1) and there are no overriding legitimate grounds for the processing, or the data subject objects to the processing pursuant to Article 21(2);
>>
>> (d) the personal data have been unlawfully processed;
>>
>> (e) the personal data have to be erased for compliance with a legal obligation in Union or Member State law to which the controller is subject;
>>
>> (f) the personal data have been collected in relation to the offer of information society services referred to in Article 8(1).
>
> 2.   Where the controller has made the personal data public and is obliged pursuant to paragraph 1 to erase the personal data, the controller, taking account of available technology and the cost of implementation, shall take reasonable steps, including technical measures, to inform controllers which are processing the personal data that the data subject has requested the erasure by such controllers of any links to, or copy or replication of, those personal data.
>
> 
>3.   Paragraphs 1 and 2 shall not apply to the extent that processing is necessary:
>>
>>(a) for exercising the right of freedom of expression and information;
>>
>>(b) for compliance with a legal obligation which requires processing by Union or Member State law to which the controller is subject or for the performance of a task carried out in the public interest or in the exercise of official authority vested in the controller;
>>
>>(c) for reasons of public interest in the area of public health in accordance with points (h) and (i) of Article 9(2) as well as Article 9(3);
>>
>>(d) for archiving purposes in the public interest, scientific or historical research purposes or statistical purposes in accordance with Article 89(1) in so far as the right referred to in paragraph 1 is likely to render impossible or seriously impair the achievement of the objectives of that processing; or
>>
>>(e) for the establishment, exercise or defence of legal claims.

#### Article 24 (Responsibility of the controller)

Article 24 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>1.   Taking into account the nature, scope, context and purposes of processing as well as the risks of varying likelihood and severity for the rights and freedoms of natural persons, the controller **shall implement appropriate technical and organisational measures** to ensure and to be able to demonstrate that processing is performed in accordance with this Regulation. Those measures shall be reviewed and updated where necessary.
>
>2.   Where proportionate in relation to processing activities, the measures referred to in paragraph 1 shall include the implementation of appropriate data protection policies by the controller.
>
>3.   Adherence to approved codes of conduct as referred to in Article 40 or approved certification mechanisms as referred to in Article 42 may be used as an element by which to demonstrate compliance with the obligations of the controller.

#### Article 28 (Processor)

Article 28 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following: 

>1.   Where processing is to be carried out on behalf of a controller, the controller shall use only processors providing sufficient guarantees to implement appropriate technical and organisational measures in such a manner that processing will meet the requirements of this Regulation and ensure the protection of the rights of the data subject.

#### Article 31 (Cooperation with the supervisory authority)

Article 31 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>The controller and the processor and, where applicable, their representatives, shall cooperate, on request, with the supervisory authority in the performance of its tasks.

#### Article 32 (Security of processing)

Article 32 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>1.   Taking into account the state of the art, the costs of implementation and the nature, scope, context and purposes of processing as well as the **risk** of varying likelihood and severity **for the rights and freedoms of natural persons**, the controller and the processor shall implement appropriate **technical and organisational measures** to ensure a level of security appropriate to the risk, including inter alia as appropriate:
>
>>(a) the pseudonymisation and encryption of personal data;
>>
>>(b) the ability to ensure the ongoing **confidentiality, integrity, availability** and resilience of processing systems and services;
>>
>>(c) the ability to restore the availability and access to personal data in a timely manner in the event of a physical or technical incident;
>> 
>>(d) a process for regularly testing, assessing and evaluating the effectiveness of technical and organisational measures for ensuring the security of the processing.
>
>2.   In assessing the appropriate level of security account shall be taken in particular of the **risks** that are presented by processing, in particular from **accidental or unlawful destruction, loss**, alteration, unauthorised disclosure of, or access to personal data transmitted, **stored** or otherwise processed.

#### Article 51 (Supervisory authority)

Article 51 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following: 

>1. Each Member State shall provide for one or more independent public authorities to be responsible for monitoring the application of this Regulation, in order to protect the fundamental rights and freedoms of natural persons in relation to processing and to facilitate the free flow of personal data within the Union (‘supervisory authority’).

#### Article 57 (Tasks)

Article 57 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>1.   Without prejudice to other tasks set out under this Regulation, each supervisory authority shall on its territory:
>
> [...]
>
>> (f) handle **complaints lodged by a data subject**, or by a body, organisation or association in accordance with Article 80, and investigate, to the extent appropriate, the subject matter of the complaint and **inform the complainant of the progress and the outcome** of the investigation within a reasonable period, in particular if further investigation or coordination with another supervisory authority is necessary;

#### Article 77 (Right to lodge a complaint with a supervisory authority))

Article 77 of [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) stipulates the following:

>1.   Without prejudice to any other administrative or judicial remedy, every data subject shall have the right to lodge a complaint with a supervisory authority, in particular **in the Member State of his or her habitual residence, place of work or place of the alleged infringement** if the data subject considers that the processing of personal data relating to him or her infringes this Regulation.
>
>2.   The supervisory authority with which the complaint has been lodged **shall inform the complainant on the progress and the outcome** of the complaint including the possibility of a judicial remedy pursuant to Article 78.

### 1.5 Document structure

This document is structured as follows:

- Chapter 2 provides an overview of the two topics to be discussed within the present document.
- Chapter 3 recalls the existing high-level requirements  
- Chapter 4 discusses topics related to requesting the erasure of personal data at a wallet-relying party.
- Chapter 5 discusses topics related to lodging a complaint with the competent data protection supervisory authority. 
- Chapter 6 lists the additions and changes that will be made to the ARF as a result of discussing 
  the two topics with experts from the EU Member States.

## 2. Overview

According to Article 5a (a) of Regulation [(EU) No 910/2014](http://data.europa.eu/eli/reg/2014/910/oj)
a wallet solution shall support common protocols and interfaces for

* (ix) requesting a relying party to **erase the personal data** stored at a wallet-relying party pursuant to Article 17 of Regulation
  [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj) and
* (x) **reporting a relying party to the competent national data protection authority** where 
an allegedly unlawful or suspicious request for data is received.

The present document discusses topics related to these protocols and interfaces, as outlined in the following figure. 

![Overview](img/Privacy-Architecture.svg)

## 3. Existing High-Level Requirements

### 3.1 High-Level Requirements specified in Topic 48 

The following high-level requirements have already been specified in [Topic 48](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2348-topic-48---blueprint-for-requesting-data-deletion-to-relying-parties):

| **Index** | **Requirement specification** |
|-----------|------------------|
| DATA_DLT_01 | A Wallet Provider SHALL ensure that its Wallet Units support the technical specifications mentioned in DATA_DLT_02, allowing a User to request from a Relying Party the erasure of their attributes that were presented by that Wallet Unit to that Relying Party, in accordance with Regulation (EU) 2016/679. |
| DATA_DLT_02 | The Commission SHALL, in cooperation with the Member States, develop technical specifications for a Wallet Unit interface allowing a Wallet Unit to send attribute deletion requests to Relying Parties with whom it has interacted in the past. |
| DATA_DLT_03 | A Wallet Instance SHALL provide a function where the User may select one Relying Party or multiple Relying Parties for which an attribute deletion request must be submitted. |
| DATA_DLT_04 | A Wallet Instance SHALL be able to display the attribute deletion requests previously submitted through the Wallet Unit. |
| DATA_DLT_05 | A Wallet Unit SHALL include attribute deletion requests in a log so they can be presented to the User via the dashboard (as specified in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency)). |
| DATA_DLT_06 | The log SHALL include as a minimum: - Date of attribute deletion request, - Relying Party to which the request was made, - Attributes requested to be removed. |





### 3.2 High-Level Requirements specified in Topic 50

The following high-level requirements have already been specified in [Topic 50](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2350-topic-50---blueprint-to-report-unlawful-or-suspicious-request-of-data):

| **Index** | **Requirement specification** |
|-----------|--------------------|
| RPT_DPA_01 | A Wallet Unit SHALL provide an interface to lodge a complaint of suspicious Relying Party presentation requests to the DPA of the Member State that provided the Wallet Unit. |
| RPT_DPA_02 | The User interface enabling a User to start the process of lodging a complaint SHALL be accessible via the Wallet Instance. |
| RPT_DPA_03 | A Wallet Provider SHALL implement the interface in compliance with national procedural law and administrative practices. |
| RPT_DPA_04 | A Wallet Unit SHALL enable the lodged complaint to be substantiated, including information to identify the Relying Party, their presentation request, and the User's allegation. |
| RPT_DPA_05 | A Wallet Unit SHALL keep reports sent to the DPA in a log file so that it can be presented to the User in the dashboard (as specified in [Topic 19](#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency)). |


## 4. Erasure of personal data at a wallet-relying party

> **Note:**
> The next version of this discussion paper will provide the relevant legal background and discuss open questions here.  

## 5. Lodging a complaint with the competent data protection supervisory authority

> **Note:**
> The next version of this discussion paper will provide the relevant legal background and discuss open issues here.

## 6. Additions and changes to the ARF

### 6.1 High-Level Requirements to be added to Annex 2

> **Note:**
> It is very likely that there will be more high-level requirements here, which will be added during the discussion phase.

The following High-Level Requirements will be added to Annex 2 of the ARF

#### REQUIREMENT 1 (Userfriendly, transparent and traceable common dashboard) 

According to Article 5a (4) (d) of [(EU) No 910/2014](http://data.europa.eu/eli/reg/2014/910/oj) the EUDIW shall provide a log of all transactions carried
   out through the EUDIW via a **userfriendly, transparent and traceable common dashboard**, which 
   enables the user to
* (i) view an up-to-date list of relying parties with which the user has established a connection and, where applicable, all data exchanged;
* (ii) easily request the erasure by a relying party of personal data pursuant to Article 17 of the Regulation (EU) 2016/679;
* (iii) easily report a relying party to the competent national data protection authority, where an allegedly unlawful or suspicious request for data is received;

Further details with respect to this requirement have been specified in [Topic 19 - User navigation requirements
(Dashboard logs for transparency)](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2319-topic-19---user-navigation-requirements-dashboard-logs-for-transparency).


#### REQUIREMENT 2 (Authentication of request for data erasure) 

Before a wallet-relying party erases the data of a user, which requests the erasure of its 
    personal data, there shall be a suitable **authentication of the request** to prevent misuse. 







