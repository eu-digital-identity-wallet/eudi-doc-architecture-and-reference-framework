# J - Wallet to Wallet Interactions

Version 0.1, updated 23 April 2025

[GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/510)

## 1 Introduction 

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding *Topic J: Wallet to Wallet Interactions*.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*Requirements for implementing wallet to wallet interactions need to be defined. Several mechanisms should be considered and revised when a Wallet Instance functions as a Relying Party, for example authentication and data protection.*

### 1.2 Key words
This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to the Wallet Unit Attestation and key attestation.

- Chapter 3 discusses the high-level purpose of the Wallet Unit Attestation and introduces use cases for Wallet to Wallet Interactions. Additionally, several questions related to the use case are raised. 

- Chapter 4 presents the additions and changes that will be made to the ARF based upon this discussion paper.

## 2 Legal Requirements for Wallet to Wallet Interactions

Multiple legal texts impose direct requirements for Wallet to Wallet Interactions: [CIR 2024/2982] and the [European Digital Identity Regulation]. 

This section recaps the respective legal requirements from these sources.

### 2.1 [European Digital Identity Regulation] about Wallet to Wallet Interactions

**Article 5a European Digital Identity Wallets**

 ...4. European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, transparent, and traceable by the user, to: 

... (c) securely authenticate another person’s European Digital Identity Wallet, and receive and share person identification data and electronic attestations of attributes in a secured way between the two European Digital Identity Wallets;... 

...5.   European Digital Identity Wallets shall, in particular:

(a) support common protocols and interfaces:...

... (vi) for interaction between two persons’ European Digital Identity Wallets for the purpose of receiving, validating and sharing person identification data and electronic attestations of attributes in a secure manner;...

### 2.2 [CIR 2024/2982] about Wallet to Wallet Interactions

**Article 3 General Provisions** 

Regarding the protocols and interfaces referred to in Articles 4 and 5, wallet providers shall ensure that wallet units:...

(2) authenticate and validate the wallet unit attestations of other wallet units where interacting with other wallet units;...
(8) present wallet unit attestations of the wallet unit to wallet-relying parties or wallet units that request it;...

## 3 Use Cases
Below we present a use case derived from the legal requirements.

### 3.1 Terminology 
Below, we will use the following terminology. 

| Term      | Meaning                                                                                       |
|-----------|-----------------------------------------------------------------------------------------------|
| Verifier  | An EUDI Wallet User that wishes to find out attested information about another EUDI Wallet user. |
| Presenter | An EUDI Wallet User that wishes to share attested information with another EUDI Wallet user.  |


### 3.2 Basic Use Case
We envision that the below use case could be used in a setting where one private person wants to rent their car (the *verifier*) to another private person (the *presenter*) if the presenter has a valid driving license:

1. Two EUDI Wallet Users meet in physical proximity and agree that one (the *presenter*) should present either PID or other attestations towards the other (the *verifier*).
2. To initiate the presentation, the presenter chooses which data fields from their PIDs or attestation they would like to share with the verifier. 
3. A data connection is established between the two devices and some information about the verifier is sent to the presenter.
4. The presenter is prompted to share their presentation with the verifier.
5. If the presenter approves the presentation on their EUDI Wallet, then a presentation is sent to the verifier's EUDI Wallet and the selected fields of the credential are presented to the verifier.

### 3.3 Use Case Related Questions
The above use case is an instance of a proximity-based supervised presentation.

> **Question 1**: The above use case is described as the presenter being allowed to choose which data to share. Alternatively, the verifier could choose which attributes they would like to request. Is it necessary to support both?

> **Question 2**: The above use case is describes a proximity-based setting. Is it necessary to support this when either presenter or verifier are offline?

> **Question 3**: The above use case describes a proximity-based setting. Are there any use cases for a remote presentation between user's of EUDI Wallets and if so: Should this be supported?

> **Question 4**: In Step 4 of the above use case, the presenter is prompted to share their attestation based on the information sent by the verifier in Step 3. What information is required for the presenter to make a sound decision on whether or not to share their attestation? I.e., what information about the verifier should be sent during Step 3? to which degree should the verifier be authenticated before being able to make a request for a presentation?

> **Question 5**: Depending on the answer to Question 4, how should the verifier be prompted to about wanting to request a presentation? Should mutual authentication be required before presenting anything to the user?

> **Question 6**: Depending on the answers to Question 4 and 5, what information should be logged in the transaction logs?


## 4 Additions and Changes to the ARF

### 4.1 Existing HLRs from Topic 30

| Index    | Requirement specification                                                                                                                                                                                                                                                                                                                              |
|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| W2W\_01  | A Wallet Unit SHALL support an interface and protocol for: - Establishing a connection with another Wallet Unit, - Receiving PID and (Q)EAA presentation requests from another Wallet Unit, - Validating such requests, - Responding to such requests in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5]. |
| W2W\_01a | In addition to W2W\_01, a Wallet Unit SHALL support an interface and protocol for: - Sending PID and (Q)EAA presentation requests to another Wallet Unit, - Receiving and validating the corresponding presentation response, in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5].                         |
| W2W\_02  | The Commission SHALL develop technical specifications for exchanging PIDs and attestations between two Wallet Units in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5].                                                                                                                                   |
| W2W\_03  | The Requester Wallet Unit SHALL authenticate its User prior to requesting attestations presentation from another Wallet Unit.                                                                                                                                                                                                                          |
| W2W\_04  | The Requestee Wallet Unit SHALL request User approval, as specified in [Topic 6], before presenting requested attestations or attributes to another Wallet Unit. The Wallet Unit SHALL inform the User about the attributes that are being requested, and of the outcome of authentication and validation checks of the request and the requester.     |
| W2W\_05  | The Requester Wallet Unit SHOULD have pre-defined a list of attributes of PID or attestations that can be requested from the Requestee Wallet Unit.                                                                                                                                                                                                    |
| W2W\_06  | The Requestee Wallet Unit SHALL authenticate and validate the Requester Wallet Unit, ensuring the validity of the Requester Wallet Unit and the attribute request.                                                                                                                                                                                     |
| W2W\_07  | The Requester Wallet Unit SHALL display the received attributes to its User.                                                                                                                                                                                                                                                                           |

### 4.2 Additions and Changes
Tba. 

## 5 References
| Reference | Description |
|-----------------|----------------|
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v1.0. |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [CIR 2024/2982] | Commission Implementing Regulation (EU) 2024/2982 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards protocols and interfaces to be supported by the European Digital Identity Framework |







