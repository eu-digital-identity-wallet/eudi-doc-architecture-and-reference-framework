# J - Wallet to Wallet Interactions

Version 0.5, updated 11 June 2025

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

- Chapter 3 discusses a high-level use case for Wallet to Wallet Interactions. 

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

**Article 5 Presentation of attributes to wallet-relying parties**

1.   Wallet providers shall ensure that wallet solutions support protocols and interfaces for the presentation of attributes to wallet-relying parties, remotely, and where appropriate in proximity, in accordance with the standards set out in the Annex.

2.   Wallet providers shall ensure that, at the request of users, wallet units respond to successfully authenticated and validated requests from wallet-relying parties referred to in Article 3, in accordance with the standards set out in the Annex.

3.   Wallet providers shall ensure that wallet units support proving the possession of private keys corresponding to public keys used in cryptographic bindings.

4.   Wallet providers shall ensure that wallet solutions support the selective disclosure of attributes of personal identification data and of electronic attestations of attributes.

5.   Paragraphs 1 to 4 shall apply mutatis mutandis to interactions between two wallet units in proximity.


## 3 Use Cases
Below we present a use case derived from the legal requirements.

### 3.1 Terminology 
Below, we will use the following terminology. 

| Term      | Meaning                                                                                          |
|-----------|--------------------------------------------------------------------------------------------------|
| Verifier  | An EUDI Wallet User that wishes to find out attested information about another EUDI Wallet user. |
| Holder    | An EUDI Wallet User that wishes to share attested information with another EUDI Wallet user.     |
| Presentation offer | A description of the attested information, that a Holder wishes to share with the Verifier.     |
| Presentation request | A description of the attested information, that the Verifier wishes the Holder to present.     |
| Presentation | The attested information being sent from the Holder to the Verifier.     |

### 3.2 Basic Use Case
Wallet-to-Wallet interactions cover the use case, where a natural person, wishes to present a PID or (Q)EAA to another natural person, using their EUDI Wallets. Note that legal entities are not allowed to bypass the processes and rules governing Relying Parties using Wallet-to-Wallet Interactions between natural persons instead of presentations towards Relying Parties.
 
We envision that the below use case could be used as basis for Wallet-to-Wallet interactions. As an example, the use case could occur in a setting where one private person wants to rent their car (the *Verifier*) to another private person (the *Holder*), if the Holder has a valid driving licence:

1. The two EUDI Wallet Users meet in physical proximity and agree (out of band of the EUDI Wallet system), that one (the *Holder*) should present a specific PID (or other attestation), including what data fields, towards the other (the *Verifier*).
2. Both users select *Wallet-to-Wallet mode* in their respective EUDI Wallet Unit UI and are asked to specify their role (*Holder* or *Verifier*).
3. The *Holder* should be given an option suggesting which PID or Attestation (and which data fields) to share with the *Verifier* (i.e. produce a *presentation offer*).
4. A handshake protocol is performed and a data connection is established between the two devices. This protocol also sends the *presentation offer* to the *Verifier*, if it was specified.
5. If the *Holder* specified a *presentation offer* in step 3, this is now displayed to the *Verifier* in the EUDI Wallet Unit UI. Based on this, the *Verifier* specifies, what PID or attestation (and which data fields) should be presented, in the Wallet-to-Wallet presentation, i.e. a *presentation request*. Note that the *presentation request* can be created from scratch if there was no *presentation offer* or it can contain all, or a subset, of the elements specified in the *presentation offer*.
6. The *presentation request* and some information about the *Verifier* is sent to the *Holder*    
7. The *Holder* verifies the validity of the *Verifier* and is prompted to share their presentation with the *Verifier* (i.e. accept the *presentation request*). Note that the EUDI Wallet may automatically check if the *presentation request* matches the *presentation offer* created in step 3.
8. If the *Holder* approves the presentation on their EUDI Wallet, then a *presentation* is sent to the *Verifier's* EUDI Wallet Unit, along with some information allowing the *Verifier* to verify the validity of the *Holder's* EUDI Wallet Unit.
9. In the *Verifier's* EUDI Wallet Unit, the received *presentation* is verified and presented in the UI.
10. The *Verifier* makes a decision (out of band of the EUDI Wallet system), based on the data presented in the EUDI Wallet Unit.

Note the following: 
* Step 2 ensures that both parties actively accept that a local data connection should be established.
* Step 4 established a local data connection. This could be done in multiple ways, e.g. by activating a BLE/NFC connection and/or by exchanging a QR code containing pairing information. During this step, the *presentation offer* must be transferred, if it was specified by the *Holder*.
* The mutual validation of the EUDI Wallet Units (the additional data sent in Steps 6 and 8), should follow the same approach as the presentation WUA.
* Only Steps 2 to 9 are done within the EUDI Wallets: Steps 1 and 10 allow for additional actions to be taken and information to be exchanged out of band. 
* If the *Holder* or *Verifier* is offline, certain security checks (e.g. revocation) might not be possible. If this is the case, the user should be warned about the risks, but the flow should not be stopped. 
* The UI must make it clear to the users that the Wallet-to-Wallet use case is only intended for natural persons and not replace the (normal) Relying Party use case.
* A user-friendly UI is important in steps 3 and 5 (when users select what attributes to share/request).

#### 3.2.1 Holder vs. Verifier driven use case

In some use cases it may be most meaningful that the *Holder* decides what information should be shared, whereas other use cases may require that the *Verifier* request certain information: 

On the *Holder* end, Wallet Providers SHOULD support a *Holder* driven use case, by offering the *Holder* UI an option to choose which PID or (Q)EAA (and which data fields) to share with the *Verifier*. This choice is communicated as an **optional** *presentation offer* during the handshake protocol. If the Wallet Provider does not wish to support the *Holder* driven use case, or if the *Holder* wishes to let the *Verifier* specify the requested information, the *presentation offer* field of the handshake protocol is left empty.

On the *Verifier* end, Wallet Providers MUST be able to handle a *presentation offer* in a meaningful way. The *Verifier* Wallet Unit SHALL transform the *presentation offer* to a draft *presentation request* and let the *Verifier* either:
* Accept the draft *presentation request* as is and return it to the *Holder*; or
* Modify the draft *presentation offer*. The *Verifier* is allowed to remove elements from the *presentation request*, before it is returned to the *Holder*.
If no *presentation offer* was specified, the *Verifier* is asked to select which PID or (Q)EAA (and which data fields) should be requested in the *presentation request* that is sent to the *Holder*.

The described approach ensures interoperability between different Wallet Units: Support for the *Holder* driven use case is isolated to functionality on the *Holder* Wallet Unit and is primarily related to the UI.


### 3.3 Measures to Prevent Abuse of Wallet To Wallet Interactions
As stated in the previous section, legal entities are not allowed to bypass the processes and rules governing Relying Parties (i.e., being registered etc.), by using Wallet-to-Wallet Interactions between natural persons instead of presentations towards Relying Parties. 

This can be handled in different ways:
- **Remote Monitoring and Rate Limiting:** The Wallet Provider could monitor the use of the Wallet Unit, detect suspicious patterns, and temporarily disable the feature if suspicious usage patterns were detected. 
- **On-device Rate Limiting:** The Wallet Unit could locally monitor the use of the Wallet Unit, detect suspicious patterns, and temporarily disable the feature if suspicious usage patterns were detected. Also more simple rate-limiting could be applied locally. 
- **Remote Audit Log:** The use of the Wallet to Wallet Interaction features could be logged to a log maintained by Wallet Providers. 

As there may be privacy concerns regarding Wallet Providers remotely monitoring the use of the Wallet Unit, on-device solutions are to be preferred. There are currently three suggested mitigations proposed to prevent abuse:
- When the user is prompted to present PID or (Q)EAA, the user must be made aware that they are interacting with a natural person and not a legal entity.
- Rate limiting is applied to the verification functionality. This makes the functionality less useful for high-volume use (e.g. legal entities abusing the functionality), without limiting the Holder.
- The presentation may only be displayed to the Verifier and must never be stored in the EUDI Wallet permanently. Measures should be taken to prevent screenshots. Relevant metadata and messages produced by the Wallet Unit may be permanently stored for logging purposes.

## 4 Additions and Changes to the ARF

Below we present the additions and changes that will be done to the high level requirements in the ARF. 

### 4.1 HLRs for Wallet to Wallet Interactions

#### 4.1.1 Requirements for Functionality

##### Requirement 1
A Wallet Unit SHALL support an interface and protocol for, in close proximity to another Wallet Unit to: 
- Establish a connection with the other Wallet Unit.

> Rationale: A Wallet Unit shall be able to take establish a connection with another Wallet Unit. 


##### Requirement 2
A Wallet Unit SHALL support functionality for, using the connection established in Requirement 1 to: 
- Receive PID and (Q)EAA presentation requests from the other Wallet Unit, 
- Respond to such requests. 

> Rationale: A Wallet Unit shall be able to take the role of a Holder in a wallet to wallet interaction. 

##### Requirement 3
A Wallet Unit SHOULD provide the User with the option to inform other Wallet Units of which attestations and attributes it can include in presentation requests, i.e., a presentation offer. If such option exists, it SHALL be accessible through a user-friendly UI and, if the User uses the functionality, the information SHALL be transferred as part of the protocol mentioned in Requirement 1.

> Rationale: The Holder shall be given the choice to select which attestations and attributes they want to share.  It should be easy for a Holder to select which attributes it wishes to present.


##### Requirement 4
A Wallet Unit SHALL support functionality for, using the connection established in Requirement 1: 
- Create and send PID and (Q)EAA presentation requests to the other Wallet Unit: 
- If a presentation offer is present, it SHALL be used to create the presentation request. The Verifier MAY choose to only request a subset of the suggested attributes. 
- If a presentation offer is not present, the Wallet Unit SHALL allow the Verifier to, using a user-friendly UI, specify which attributes to request in a presentation request.
- Receive, validate, and present the corresponding presentation response to the Verifier.

> Rationale: A Wallet Unit shall be able to take the role of a verifier in a wallet to wallet interaction. 


#### 4.1.2 Requirements for Security 

##### Requirement 5
If the Holder makes a suggestion for a presentation request, i.e., a presentation offer, then the Wallet Unit of the Verifier SHALL NOT allow the Verifier to include different attestations and/or more attributes in their presentation request sent to the Holder.

> Rationale: A Verifier shall not be allowed to ask the Holder to disclose more information than what the Holder originally intends to, but asking for less information is fine.

##### Requirement 6
A Wallet Unit SHALL only establish a connection with another Wallet Units if both Users of the Wallet Units take explicit actions to make this happen. In doing so, it SHALL be possible for the User to indicate which other device a connection is to be established with.

> Rationale: Connections between two Users' Wallet Units shall not be established unless desired by both Users.

##### Requirement 7
The Holder Wallet Unit SHALL authenticate the User and obtain the User's approval, as specified in, before presenting requested attestations or attributes to another Wallet Unit. The Wallet Unit SHALL inform the User about the attributes that are being requested.

> Rationale: Disclosing personal information should only happen when an explicit consent is given by the user. 

##### Requirement 8
The Verifier Wallet Unit SHALL authenticate its User and obtain the User's approval prior to requesting attestations presentation from another Wallet Unit.

> Rationale: As the Verifier will disclose some information as part of the presentation request, it should only happen when an explicit consent is given by the user. 

##### Requirement 9
The Holder Wallet Unit SHALL verify the validity of the Verifier Wallet Unit before presenting a received request to the User.

> Rationale: The Holder must be sure that data is only presented to another EUDI Wallet Unit.

##### Requirement 10
The Verifier Wallet Unit SHALL verify the validity of the Holder Wallet Unit before presenting the received presentation to the user.

> Rationale: The Verifier must be sure that data originates from another EUDI Wallet Unit.

> Note that this requirement is likely to be updated based upon the ongoing discussions about supporting presentation WUAs. 

##### Requirement 11 
The Holder Wallet Unit SHALL make it clear to the user whether they are presenting to a Relying Party or another natural person's EUDI Wallet before the Holder is to approve their presentation. The Holder SHALL be advised to stop the presentation in case they were expecting to interact with a legal entity different from a natural person but are informed that the presentation will be towards a natural person. 

> Rationale: To prevent abuse of the wallet to wallet functionality by other Relying Parties it is important that the Holder is made aware that they are interacting with a natural person and not another legal entity in case they would expect to be interacting with another legal entity. 

##### Requirement 12
Wallet Units SHALL take measures to limit the number of Wallet-to-Wallet presentations per time unit to prevent large-scale abuse of the wallet-to-wallet functionality. The limitation strategy, e.g. exponential backoff time between subsequent presentations or hard limits, is decided by the Wallet Provider. 

> Rationale: This is to prevent large-scale abuse of the wallet to wallet functionality by another legal entity than a natural person to relying on it.

##### Requirement 13
A Verifier Wallet Unit SHALL not persistently store the content of a received presentation. The Verifier Wallet Unit SHOULD minimize the time the received presentation is stored in memory. 

> Rationale: This requirements ensures that the Holder obtains similar privacy guarantees to what they would have achieved by showing a physical card to another natural person. I.e., if no explicit actions are taken to store the (such as the Verifier taking a photo of the attributes), then the presentation is only ephemeral. 

##### Requirement 14
Wallet Providers SHOULD take measures to prevent a Verifier from taking screenshots of a received presenation in their Wallet Units. 

> Rationale: This is to make it more difficult to circumvent Requirement 13. 

#### 4.1.3 Misc. Requirements

##### Requirement 15
The Commission SHALL develop technical specifications for exchanging PIDs and attestations between two Wallet Units in accordance with the above HLRs. 

### 4.2 Existing HLRs from Topic 30
Below we list the HLRs that was previously established for the topic and provide a mapping to the new HLRs. 

| Index    | Requirement specification                                                                                                                                                                                                                                                                                                                              | Mapping |
|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| W2W\_01  | A Wallet Unit SHALL support an interface and protocol for: - Establishing a connection with another Wallet Unit, - Receiving PID and (Q)EAA presentation requests from another Wallet Unit, - Validating such requests, - Responding to such requests in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5]. | Requirement 1.         |
| W2W\_01a | In addition to W2W\_01, a Wallet Unit SHALL support an interface and protocol for: - Sending PID and (Q)EAA presentation requests to another Wallet Unit, - Receiving and validating the corresponding presentation response, in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5].                         | Requirement 2.        |
| W2W\_02  | The Commission SHALL develop technical specifications for exchanging PIDs and attestations between two Wallet Units in accordance with the technical specifications as defined by [OpenID4VP] and [ISO/IEC 18013-5].                                                                                                                                   | Requirement 15.        |
| W2W\_03  | The Requester Wallet Unit SHALL authenticate its User prior to requesting the presentation of an attestation from another Wallet Unit.                                                                                                                                                                                                                          | Requirement 8.         |
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







