# J - Wallet to Wallet Interactions

Version 0.2, updated 5 May 2025

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

- Chapter 2 presents the legal requirements for functionality related to the Wallet to Wallet Interactions.

- Chapter 3 discusses introduces a high-level use case for Wallet to Wallet Interactions. 

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
Wallet-to-Wallet interactions cover the use case, where a natural person, wishes to present a PID or (Q)EAA to another natural person, using their EUDI Wallets. Note that legal entities are not allowed to bypass the processes and rules governing Relying Parties using Wallet to Wallet Interactions between natural persons instead of presentations towards Relying Parties.
 
We envision that the below use case could be used as basis for Wallet-to-Wallet interactions. As an example, the use case could occur in a setting where one private person wants to rent their car (the *Verifier*) to another private person (the *Presenter*), if the presenter has a valid driving license:

1. The two EUDI Wallet Users meet in physical proximity and agree (out of band of the EUDI Wallet system), that one (the *Presenter*) should present a specific PID (or other attestation), including what data fields, towards the other (the *Verifier*).
2. To initiate the presentation, the Verifier specifies, in the EUDI Wallet Unit UI, what PID or attestation (and which data fields) should be presented, in a Wallet-to-Wallet presentation, i.e. a *presentation request*.
3. Similarly, the Presenter, in the EUDI Wallet Unit UI, accepts that a Wallet-to-Wallet presentation is about to take place and activates *Wallet-to-Wallet mode*.
4. A data connection is established between the two devices and some information about the Verifier is sent to the Presenter along with the *presentation request*.
5. The Presenter verifies the validity of the Verifier and is prompted to share their presentation with the Verifier (i.e. accept the *presentation request*).
6. If the Presenter approves the presentation on their EUDI Wallet, then a presentation is sent to the Verifier's EUDI Wallet Unit, along with some information allowing the Verifier to verify the validity of the Presenter's EUDI Wallet Unit.
7. In the Verifier's EUDI Wallet Unit, the received presentation is presented in the UI.
8. The Verifier makes a decision (out of band of the EUDI Wallet system), based on the data presented in the EUDI Wallet Unit.

Note the following: 
* Step 2 and 3 ensures that both parties actively accepts that a local data connection should be established. This could be done in multiple ways, e.g. by activating a BLE/NFC connection and/or by exchanging a QR code containing pairing information.
* The mutual validation of the EUDI Wallet Units (the additional data sent in Steps 4 and 6), should follow the same approach as the presentation WUA.
* Only Steps 2 to 7 are done within the EUDI Wallets: Steps 1 and 8 allow for additional actions to be taken and information to be exchanged out of band. 
* If the Presenter or Verifier is offline, certain security checks (e.g. revocation) might not be possible. If this is the case, the user should be warned about the risks, but the flow should not be stopped. 

#### 3.2.1 Presenter driven use case

Rather than having the Verifier request information from the Presenter, the basic use case can be modified to allow the Presenter to choose what information to share with the Verifier. Note that at Step 1, both parties decide what information should be shared. This is done outside of the EUDI Wallet system, e.g. it could be done verbally. Similarly, Step 8 requires a manual decision on whether or not to accept the presentation. Hence the EUDI Wallet does not need to validate that the presentation correlates to the presentation request, it is sufficient to verify that the presented attributes originate from a valid PID or Attestation.

Inside the EUDI Wallet system, this would mean that the Verifier would not construct a *presentation request* in Step 2. Instead the Presenter would create an *presentation request* for internal use, which result in the presentation produced in Step 5. The change would change the above flow to the following:

* ...
2. The Verifier activates *Wallet-to-Wallet* mode.
3. The Presenter also activates *Wallet-to-Wallet mode*.
4. A data connection is established between the two devices and some information about the Verifier is sent to the Presenter.
5. The Presenter verifies the validity of the Verifier's EUDI Wallet Unit and chooses which PID or Attestation (and which data fields) to present.
6. The Presenter confirms to share their presentation with the Verifier, after which the presentation is sent to the Verifier's EUDI Wallet Unit, along with some information allowing the Verifier to verify the validity of the Presenter's EUDI Wallet Unit.
* ...

### 3.3 Open Question: Measures to Prevent Abuse of Wallet To Wallet Interactions
As stated in previous section, legal entities are not allowed to bypass the processes and rules governing Relying Parties (i.e., being registered etc.) using Wallet to Wallet Interactions between natural persons instead of presentations towards Relying Parties. 

However, it still remains an open question whether it is necessary to deploy technical measures to prevent this. Several versions of such technical measures are technically possible:
- **Remote Monitoring and Rate Limiting:** The Wallet Provider could monitor the use of the Wallet Unit, detect suspicious patterns, and temporarily disable the feature if suspicious usage patterns were detected. 
- **On-device Rate Limiting:** The Wallet Unit could locally monitor the use of the Wallet Unit, detect suspicious patterns, and temporarily disable the feature if suspicious usage patterns were detected. Also more simple rate-limiting could be applied locally. For example a HLR could be: *A Wallet Unit SHALL not allow the User to make more than 5 presentation requests per hour.*
- **Remote Audit Log:** The use of the Wallet to Wallet Interaction features could be logged to a log maintained by Wallet Providers. 

> **Question:** Is it necessary to require any such mechanisms to prevent such abuse of the functionality by Relying Parties?

## 4 Additions and Changes to the ARF

Below we present the additions and changes that will be done to the high level requirements in the ARF. 

### 4.1 HLRs for Wallet to Wallet Interactions

#### 4.1.1 Requirements for Functionality

##### Requirement 1
A Wallet Unit SHALL support an interface and protocol for, in close proximity to another Wallet Unit: 
- Establish a connection with the other Wallet Unit,
- Receive PID and (Q)EAA presentation requests from the other Wallet Unit, 
- Respond to such requests. 

> Rationale: A Wallet Unit shall be able to take the role of a presenter in a wallet to wallet interaction.

##### Requirement 2
A Wallet Unit SHALL support an interface and protocol for, in close proximity to another Wallet Unit: 
- Establish a connection with the other Wallet Unit,
- Create and send PID and (Q)EAA presentation requests to the other Wallet Unit,
- Receive, validate, and present the corresponding presentation response to the user.

> Rationale: A Wallet Unit shall be able to take the role of a verifier in a wallet to wallet interaction.

##### Requirement 3
A Wallet Unit SHOULD support an interface and protocol for, in close proximity to another Wallet Unit: 
- Establish a connection with the other Wallet Unit,
- Let the User select attributes of PID and (Q)EAAs and present these to the other Wallet Unit,

> Rationale: It is recommended to also support the presenter in deciding what attributes to be presented without receiving a request from the verifier.

##### Requirement 4
A Wallet Unit SHOULD support an interface and protocol for, in close proximity to another Wallet Unit: 
- Establish a connection with the other Wallet Unit,
- Receive, validate, and present a presentation of PID or (Q)EAAs from another Wallet Unit to the user.

> Rationale: It is recommended to also support the presenter in deciding what attributes to be presented without receiving a request from the verifier.

##### Requirement 5
A Wallet Unit SHOULD have predefined a list of attributes of PID or attestations that can be requested from other Wallet Units.

> Rationale: It should be easy for a user to select which attributes to request. 

#### 4.1.2 Requirements for Security 

##### Requirement 6
A Wallet Unit SHALL only establish a connection with another Wallet Units if both Users of the Wallet Units take explicit actions to make this happen. In doing so, it SHALL be possible for the User to indicate which other Wallet Unit a connection is to be established with.

> Rationale: Connections between Users' Wallet Units shall not be established unless desired by both Users.

##### Requirement 7
The presenter Wallet Unit SHALL authenticate the User and obtain the User's approval, as specified in [Topic 6], before presenting requested attestations or attributes to another Wallet Unit. The Wallet Unit SHALL inform the User about the attributes that are being requested.

> Rationale: Disclosing personal information should only happen when an explicit consent is given by the user. 

##### Requirement 8
The verifier Wallet Unit SHALL authenticate its User and obtain the User's Approval prior to requesting attestations presentation from another Wallet Unit.

> Rationale: As the verifier will disclose some information as part of the presentation request, it should only happen when an explicit consent is given by the user. 

##### Requirement 9
The presenter Wallet Unit SHALL verify the validity of the verifier Wallet Unit before presenting a received request to the User.

> Rationale: The presenter must be sure that data is only presented to another EUDI Wallet Unit.

##### Requirement 10
The verifier Wallet Unit SHALL verify the validity of the presenter Wallet Unit before presenting the received presentation to the user.

> Rationale: The verifier must be sure that data originates from another EUDI Wallet Unit.

#### 4.1.3 Misc. Requirements

##### Requirement 11
The Commission SHALL develop technical specifications for exchanging PIDs and attestations between two Wallet Units in accordance with the above HLRs. 

### 4.2 Existing HLRs from Topic 30
Below we list the HLRs that was previously established for the topic and provide a mapping to the new HLRs. 

| Index    | Requirement specification                                                                                                                                                                                                                                                                                                                              | Mapping |
|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| W2W\_01  | A Wallet Unit SHALL support an interface and protocol for: - Establishing a connection with another Wallet Unit, - Receiving PID and (Q)EAA presentation requests from another Wallet Unit, - Validating such requests, - Responding to such requests in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5]. | Requirement 1.         |
| W2W\_01a | In addition to W2W\_01, a Wallet Unit SHALL support an interface and protocol for: - Sending PID and (Q)EAA presentation requests to another Wallet Unit, - Receiving and validating the corresponding presentation response, in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5].                         | Requirement 2.        |
| W2W\_02  | The Commission SHALL develop technical specifications for exchanging PIDs and attestations between two Wallet Units in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5].                                                                                                                                   | Requirement 11.        |
| W2W\_03  | The Requester Wallet Unit SHALL authenticate its User prior to requesting attestations presentation from another Wallet Unit.                                                                                                                                                                                                                          | Requirement 8.         |
| W2W\_04  | The Requestee Wallet Unit SHALL request User approval, as specified in [Topic 6], before presenting requested attestations or attributes to another Wallet Unit. The Wallet Unit SHALL inform the User about the attributes that are being requested, and of the outcome of authentication and validation checks of the request and the requester.     | Requirement 7.        |
| W2W\_05  | The Requester Wallet Unit SHOULD have pre-defined a list of attributes of PID or attestations that can be requested from the Requestee Wallet Unit.                                                                                                                                                                                                    | Requirement 5.        |
| W2W\_06  | The Requestee Wallet Unit SHALL authenticate and validate the Requester Wallet Unit, ensuring the validity of the Requester Wallet Unit and the attribute request.                                                                                                                                                                                     | Requirement 9.         |
| W2W\_07  | The Requester Wallet Unit SHALL display the received attributes to its User.                                                                                                                                                                                                                                                                           | Requirement 2.          |


## 5 References
| Reference | Description |
|-----------------|----------------|
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v1.0. |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [CIR 2024/2982] | Commission Implementing Regulation (EU) 2024/2982 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards protocols and interfaces to be supported by the European Digital Identity Framework |







