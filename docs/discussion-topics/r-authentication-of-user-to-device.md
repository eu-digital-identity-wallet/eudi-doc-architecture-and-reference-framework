Version 0.9, updated 16 September 2025


[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/585)


# R - Authentication of the User to the device

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic R: Authentication of the User to the device.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_Requirements and guidance need to be provided to address the authentication methods available on modern mobile devices, such as PIN codes, swipe patterns, and biometrics (e.g., face or fingerprint recognition)._

The device here means the User's device where the Wallet Instance is installed.


### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to authentication of the User to the device.

- Chapter 3 presents and discusses a list of identified issues, with suggested changes and/or new High-Level Requirements related to this topic.

- Chapter 4 presents a log of the additions and changes that will be made to High Level Requirements in the ARF as a result of discussing this topic with the Member States.

- Chapter 5 refers to other topics related to authentication of the User to the device.

- Chapter 6 presents the additions and changes that will be made to the ARF main document as a result of discussions. 


## 2 Legal Requirements for authentication of the User to the device

The following legal texts impose requirements on authentication of the User to the device: 
- [European Digital Identity Regulation],
- [CIR 2024/2979] as regards the integrity and core functionalities of European Digital Identity Wallets,
- [CIR 2015/1502] on setting out minimum technical specifications and procedures for assurance levels for electronic identification means,
- [CIR 2024/2981] as regards the certification of European Digital Identity Wallets.

This section recaps the respective legal requirements from these sources.


### 2.1  [European Digital Identity Regulation] about authentication of the User to the device

The [European Digital Identity Regulation] does not contain direct requirements for authentication of the User to the device, however it provides  definition of the Strong User Authentication in Article 3(51):

>‘strong user authentication’ means an authentication based on the use of at least two authentication factors from different categories of either knowledge, something only the user knows, possession, something only the user possesses or inherence, something the user is, that are independent, in that the breach of one does not compromise the reliability of the others, and is designed in such a way as to protect the confidentiality of the authentication data;

The Wallet Unit is supposed to be a means of strong user authentication agains Wallet-Relying Parties and their services, while the authentication methods provided by the device to the User, are part of this means. 

At the same time, the Wallet Unit with the PID is the electronic identification means, as defined by Article 3(2): 

>“electronic identification means” means a material and/or immaterial unit containing person identification data and which is used for authentication for an online service or, where appropriate, for an offline service;

and according to Article 5a(5)(d) shall:

>meet the requirements set out in Article 8 with regard to assurance level high, in particular as applied to the requirements for identity proofing and verification, and electronic identification means management and authentication;

Therefore the authentication methods provided by the device to the User shall (in applicable scope) comply with requirements for LoA High and strong customer authentication, set out by eIDAS and the implementing acts (see the next sections).


### 2.2 Implementing acts about authentication of the User to the device

[CIR 2024/2979] contains general requirements that:
+ the Wallet Unit shall authenticate the User prior to any further action with the Wallet Unit,
+ the Wallet unit shall meet requirements for the characteristics and design of electronic identification means at assurance level high.

Below are selected excerpts from the [CIR 2024/2979] that establish these requirements.

Article 3(1):
	
>Wallet units shall not perform any functionality listed in Article 5a(4) of Regulation (EU) No 910/2014, except wallet user authentication to access the wallet unit, until the wallet unit has successfully authenticated the wallet user.

_Note: Functionality listed in Article 5a(4) comprises operations such as:_
+ _issuance and presentation of attributes,_ ​
+ _generation of pseudonyms,_
+ _access a log of transactions (dashboard),_ ​
+ _requests the erasure by a relying party of personal data,_ ​
+ _reporting to a DPA,_ ​
+ _signing/sealing,_ ​
+ _data export and migration._


Article 5(1): 
	
>Wallet providers shall ensure that wallet secure cryptographic applications:
>
>(a) perform wallet cryptographic operations involving critical assets other than those needed for the wallet unit to authenticate the wallet user only in cases where those applications have successfully authenticated wallet users;
>
>(b) where they authenticate wallet users in the context of performing electronic identification at assurance level high; perform authentication of wallet users, in accordance with, the requirements for the characteristics and design of electronic identification means at assurance level high, as set out in Implementing Regulation (EU) 2015/1502;


Additional and more detailed requirements to User authentication mechanisms are defined in: ​
+ [CIR 2015/1502]​, which contains in particular requirements for eID means at LoA High, such as related to activation process, use of two factors and protection against attackers with high attack potential;
+ [CIR 2024/2981], which provides list of threats in relation to i.a. User authentication, against which Wallet Solutions must provide proper security controls. 

Consequently, at least the following requirements needs to be taken into account from [CIR 2015/1502]:
+ From section 2.2.1 Electronic identification means characteristics and design:
>The electronic identification means utilises at least two authentication factors from different categories.
>The electronic identification means is designed so that it can be assumed to be used only if under the control or possession of the person to whom it belongs. 
>The electronic identification means protects against duplication and tampering as well as against attackers with high attack potential.
>The electronic identification means is designed so that it can be reliably protected by the person to whom it belongs against use by others.

+ From section 2.2.2. Issuance, delivery and activation:
>The activation process verifies that the electronic identification means was delivered only into the possession of the person to whom it belongs.

+ From section 2.3.1. Authentication mechanism:
>Where person identification data is stored as part of the authentication mechanism, that information is secured in order to protect against loss and against compromise, including analysis offline.
>The authentication mechanism implements security controls for the verification of the electronic identification means, so that it is highly unlikely that activities such as guessing, eavesdropping, replay or manipulation of communication by an attacker with enhanced-basic attack potential can subvert the authentication mechanisms.
>The authentication mechanism implements security controls for the verification of the electronic identification means, so that it is highly unlikely that activities such as guessing, eavesdropping, replay or manipulation of communication by an attacker with high attack potential can subvert the authentication mechanisms.


The most of the above referenced security requirements are related to the robustness and reliability of the mechanisms offered by the Wallet Solution and the User's device, and are to be proven by certification of the Wallet Solution, as defined by [CIR 2024/2981].


## 3 Discussion 

# 3.1 Interpretation of legal requirements

The following contexts of the User authentication to the device can be distinguished:​
+ (1) User authentication prior using any wallet functionality​,
+ (2) Using the wallet as eID means​,
+ (3) User authentication to the WSCA/WSCD .

Using the Wallet as LoA High eID means (2)​, implies that the Wallet Unit (and its User authententication mechanis) must meet applicable LoA High requirements.
In the remaining two contexts (1) and (3), the LoA of authentication does not require to comply with LoA High requirements, except if used as part of the  context (1) at LoA High.  

At the same time, there are the following layers of authentication of the User:​
+ Authentication to the Wallet Unit (device's operating system level or Wallet Instance level),​
+ Authentication to the WSCA/WSCD (which can rely on Wallet Unit's mechanisms or WSCA/WSCD native mechanisms, in particular for external WSCA/WSCD)​

The effective authentication may use one or combine various authentication mechanisms, depending on the context and Wallet Solution design.

The solution of "means of electronic identification" and "strong user authentication" offered by the (device-based) Wallet Solution is interpreted the following way.

The first authentication factor (possession) is a PID or other device-bound attestation possibly (where the associated private key is stored in WSCD).

The second authentication factor can be:
+ a device build-in mechanism for authenticating the User to the device (such as a biometric factor, PIN or password), or
+ a mechanism offered by the Wallet Instance itself (such as application PIN, password or other).

For the sake of User Experience and Wallet adoption, it is desired that Wallet Solutions are desined the way avoiding redundant authentications of the User and whernever possible rely on standard authentication mechanisms offered by the device, also when WSCA/WSCD is an external cloud service/HSM.​

However, if the WSCA/WSCD is based on an external component (eg. cloud HSM), than the WSCA/WSCD will not play a role of the possession factor - this needs to be taken into account by the Wallet Solution designers.

Ultimately, the design and technical implementation details are up to the Wallet Solution provider, and their correctness, compliance and robustness will be evaluated in the Wallet Solution certification process.


### 3.2 Activation process

The current version of ARF (2.4) contains the following HLRs related to Wallet Unit activation process: 

| **Index** | **Requirement specification**                                |
|-----------|--------------------------------------------------------------|
| WIAM_15a | In order to ensure that operating system-level authentication can be used and is sufficiently secure, during installation of the Wallet Unit, the Wallet Unit SHALL enforce the activation of an OS-level User authentication mechanism with adequate security policies. |  
| WIAM_15b | During installation of the Wallet Unit, the Wallet Unit SHALL enable the User to indicate if they want to use a Wallet Unit-specific PIN for User authentication, or use the OS-level User authentication mechanism. The Wallet Unit SHALL enable the User to change this preference during the lifetime of the Wallet Unit. | 

In the opinion of the ARF editors team, the above requirements are sufficient. The detailed requirements and the appropriate means or controls (eg. minimal length or complexity of the PIN/passwords, restricting the acceptable methods), are to be defined by the Wallet Solution providers to meet the requirements of LoA High and the Wallet Solution certification (as set out by [CIR 2024/2981]).

**Question 1: Is there a need to update the requirements?**


### 3.3 Authentication process

The current version of ARF (2.4) contains the following HLRs related to authentication process: 

| **Index** | **Requirement specification**                                |
|-----------|--------------------------------------------------------------|
| WIAM_14 | A WSCA/WSCD SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or a private or secret key of a PID or an attestation stored in a Wallet Unit. For a PID key (which is part of the EUDI Wallet eID means), this WSCA/WSCD SHALL be certified to be compliant with applicable requirements for Level of Assurance High in Commission Implementing Regulation (EU) 2015/1502 section 2.2.1. *Note: Many actions of the Wallet Unit, such as processing a Relying Party presentation request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and presentation signing and encryption. This requirement does not imply that a separate User authentication is necessary before each of these operations. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.* |       
| WIAM_15 | Before performing any operation, a Wallet Unit SHALL authenticate the User. The Wallet Unit SHALL use the OS-level authentication mechanism according to WIAM_15a, unless this is technically impossible (for instance on some legacy devices), or the User prefers to use a Wallet Unit-specific PIN implemented by the Wallet Unit itself, as specified in WIAM_15b. |  
| WIAM_16 | For User authentication according to WIAM_15, a Wallet Unit SHALL implement an idle timeout, after which User authentication SHALL again be required. The Wallet Unit SHOULD provide the User with the option to set the idle timeout to a duration shorter than the default timeout. | 
| WIAM_17 | A WSCA/WSCD SHALL be able to authenticate a User in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. | 

In the opinion of the ARF editors team, the above requirements are sufficient in principle. The detailed requirements and the appropriate means or controls (eg. minimal length or complexity of the PIN/passwords, restricting the acceptable methods), are to be defined by the Wallet Solution providers to meet the requirements of LoA and the Wallet Solution certification (as set out by [CIR 2024/2981]).
   

**Question 2: Is there a need to update the requirements?**


However, it is imperative to ensure as good User Experience as possible. Therefore authentication of the User in all possible contexts ideally should use always the same mechanisms/factors and avoid unecessary/redundant authentication. For this reason the following new HLR is proposed:

| **Index** | **Requirement specification**                                |
|-----------|--------------------------------------------------------------|
| **WIAM_17a**| **The Wallet Unit *SHALL* securely authenticate the User using a *multi-factor authentication mechanism*. The same authentication mechanism *SHOULD* also be used to unlock the local keystore, where applicable. User authentication *SHALL* support a *time-based control* (e.g., session timeout or re-authentication interval) to ensure that access is automatically revoked after a defined period of inactivity. To maintain a seamless User experience, the Wallet Unit *SHALL* avoid unnecessary re-authentication prompts within the defined validity period of a successful authentication** |  


In addition, basing on the public discussion in GitHub, it is proposed to fine tune the WIAM_14: 

| **Index** | **Requirement specification**                                |
|-----------|--------------------------------------------------------------|
| WIAM_14 | A WSCA/WSCD SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or a private or secret key of a PID or an attestation stored in a Wallet Unit. For a PID key (which is part of the EUDI Wallet **used as** eID means), this WSCA/WSCD SHALL be certified **or evaluated (according to Commission Implementing Regulation (EU) 2024/2981)** to be compliant with applicable requirements for Level of Assurance High in Commission Implementing Regulation (EU) 2015/1502 section 2.2.1. ​*Note: Many actions of the Wallet Unit, such as processing a Relying Party presentation request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and presentation signing and encryption. This requirement does not imply that a separate User authentication is necessary before each of these operations. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.*|     


### 3.4 Authentication process

The current version of AR



### 3.5 Security considerations

In the discussions on this topic, it was raised that as of today the mobile devices have no means or basis to attest to Wallet-Relying Parties that the User authentication has been performed. Furthermore, in the opinion of some experts, device biometrics and other local authentication mechanisms of the devices are not fully reliable. In conclusion, todays Wallet Solutions would not achieve LoA High just basin on device's authentication mechanisms - unless they are certified against an appropriate Protection Profile for Wallet Solutions (that is yet to be delivered). ​



## 4 Current HLRs and Proposals of Changes

ARF (as of version 2.4) contains High-Level Requirements related to the topic included in the following sections:
+ Topic 40 - Wallet Instance installation and Wallet Unit activation and management

The existing HLRs are listed in the tables below, along with a proposal to keep, change, add, or remove the HLR.


### 4.1 Topic 40 - Wallet Instance installation and Wallet Unit activation and management

| **Index** | **Requirement specification**                                | **Proposal** |
|-----------|--------------------------------------------------------------|--------------|
| WIAM_14 | A WSCA/WSCD SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or a private or secret key of a PID or an attestation stored in a Wallet Unit. For a PID key (which is part of the EUDI Wallet **used as** eID means), this WSCA/WSCD SHALL be certified **or evaluated (according to Commission Implementing Regulation (EU) 2024/2981)** to be compliant with applicable requirements for Level of Assurance High in Commission Implementing Regulation (EU) 2015/1502 section 2.2.1. ​*Note: Many actions of the Wallet Unit, such as processing a Relying Party presentation request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and presentation signing and encryption. This requirement does not imply that a separate User authentication is necessary before each of these operations. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.* |        Keep with proposed modification              |
| WIAM_15 | Before performing any operation, a Wallet Unit SHALL authenticate the User. The Wallet Unit SHALL use the OS-level authentication mechanism according to WIAM_15a, unless this is technically impossible (for instance on some legacy devices), or the User prefers to use a Wallet Unit-specific PIN implemented by the Wallet Unit itself, as specified in WIAM_15b. |            Keep as-is               |
| WIAM_15a | In order to ensure that operating system-level authentication can be used and is sufficiently secure, during installation of the Wallet Unit, the Wallet Unit SHALL enforce the activation of an OS-level User authentication mechanism with adequate security policies. |  Keep as-is  |
| WIAM_15b | During installation of the Wallet Unit, the Wallet Unit SHALL enable the User to indicate if they want to use a Wallet Unit-specific PIN for User authentication, or use the OS-level User authentication mechanism. The Wallet Unit SHALL enable the User to change this preference during the lifetime of the Wallet Unit. | Keep as-is    |
| WIAM_16 | For User authentication according to WIAM_15, a Wallet Unit SHALL implement an idle timeout, after which User authentication SHALL again be required. The Wallet Unit SHOULD provide the User with the option to set the idle timeout to a duration shorter than the default timeout. | Keep as-is   |
| WIAM_17 | A WSCA/WSCD SHALL be able to authenticate a User in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. |  Keep as-is    |
| **WIAM_17a**| **For any use cases other than using the wallet as electronic identification means at LoA High level, the authentication of the User SHOULD be based always on the same authentication mechanisms, providing the same User experience. It is recommended that  such mechanisms use o.s. level functions (such as embedded biometric reader or screen unlock).** | New requirement |


## 5 Relation to Other Topics 

### 5.1 Z - Device-bound Attestations

The issue of non device-bound attestation is a subject of comprehensive discussion within the Topic Z and the outcome of the discussion needs to be taken into account if needed. 

The current ARF requimrents do not distinguish whether, in the context of attribute presentations, the authentication process of the User to the device concerns device-bound or non-device-bound attestation. At the same time, there are use cases such as event tickets or discount vouchers, where the bound to the device is not needed or even not wanted (eg. for ensuring easy portability). In such cases the level of assurance needed by the Wallet-Relying Party is minimal. Therefore, the requirements related to authentication of the User to the device might be significantly relaxed, but not avoided at all (see as Article 3(1) of [CIR 2024/2979] and section 2.2 of this document). 
At this stage, there are not envisioned any specific requirements / HLRs for non-device bound attestations - the current ARF implicitely allows already using the lower assurance level for authentication in such case. 


### 5.2 Relation to Risk Register
The risk register for European Digital Identity Wallets \[RiskRegister\] contains (at least) the following risks that are related to the authentication of the User to the device:

|Risk type | Risk id | Related risk titles|
|-------------|-------|-------------------|
|High-level risks to the wallets | R4 | Identify theft |
|High-level risks to the wallets | R5 | Data theft    |
|High-level risks to the wallets | R6 | Data disclosure|
|High-level risks to the wallets |R9 | Unauthorised transaction|
|High-level risks to the wallets |R10 | Transaction manipulation|


| R4 Identify theft |
|---|
|Identity theft is defined as the unauthorised acquisition of the wallet unit or loss of authentication factors enabling to impersonate a person.|

| R5 Data theft |
|---|
|Data theft is defined as the unauthorised extraction of data. Data theft is also associated to threats, such as data interception (unauthorised capture of data in transit) and data decryption (unauthorised decoding of encrypted data), which are likely to lead in some cases to Data disclosure (R6).|

| R6 Data disclosure |
|---|
|Data disclosure is defined as the unauthorised exposure of personal data including special categories of personal data. The privacy breach risk is very similar when considered from a privacy rather than security viewpoint. |

| R9 Unauthorised transaction |
|---|
|Unauthorised transactions are defined as operational activities conducted without the permission or knowledge of the wallet User. In many cases, an unauthorised transaction can lead to Identity theft (R4) or Data disclosure (R6). It is also related to unauthorised transactions, such as the misuse of cryptographic keys. |

| R10 Transaction manipulation |
|---|
|Transaction manipulation is defined as the unauthorised alteration of operations in the wallet. Transaction manipulation is an attack on integrity, and it is related to a data integrity breach. |

More specifically, \[RiskRegister\]  describes the following threats to a Wallet:

|ID | Threat description | Related risks |
|---------|-------|-------------------|
|TR35 | An attacker can obtain a knowledge factor used for user authenticating to the WSCA. | Data disclosure (R6) |
|TR55 | An attacker can bypass the user authentication method to use a pseudonym generated by a wallet unit. | Identity theft (R4) |
|TR57 | An attacker can export wallet data, including PID, (Q)EAAs or logs. | Identity theft (R4)  |
|TR87 | An attacker can activate/take over the wallet remotely (e.g., a bank app embedding an authentication or attestation request) without the explicit consent or sole control of the user, in situations where the user is unaware of (e.g., asleep), or cannot see the relying party. |  Transaction manipulation (R10)  |
| TR95 | An attacker can issue a PID without the user’s consent. |Unauthorised transaction (R9) |
| TR98 | An attacker can use the wallet outside of the user’s control. | Unauthorised transaction (R9) |
| TR113 | An attacker can defeat the user authentication mechanism itself to bypass the authentication of the wallet user. | Effect on various risks |
| TR133 | An attacker can intercept communication between the wallet instance and the WSCA, or replay/imitate a user (e.g. by hijacking authentication mechanism).| Effect on various risks |


## 6 Additions and Changes to the ARF 

See section 4. In addition, authentication of the User to the device aspects in the main text of the ARF will be updated accordingly.


## 7 References (tbd)

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [Topic 40]                             | Topic 40 - Wallet Instance installation and Wallet Unit activation and management |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [CIR 2024/2979]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng) |
| [CIR 2015/1502]                      | [Commission Implementing Regulation (EU) 2024/2979 of 8 September 2015 on setting out minimum technical specifications and procedures for assurance levels for electronic identification means pursuant to Article 8(3) of Regulation (EU) No 910/2014 of the European Parliament and of the Council on electronic identification and trust services for electronic transactions in the internal market](https://eur-lex.europa.eu/eli/reg_impl/2015/1502/oj/eng) |
| [CIR 2024/2981]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng) |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, 28 November 2024](https://eur-lex.europa.eu/eli/reg_impl/2024/2981/oj/eng) |

