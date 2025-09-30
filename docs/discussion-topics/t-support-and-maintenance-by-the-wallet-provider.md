# T - Support and maintenance by the Wallet Provider

Version 0.1, 01 Oct 2025
[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/583)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group
on topic **T - Support and maintenance by the Wallet Provider**

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*Are specific requirements necessary to govern support and maintenance of the Wallet? For instance, guidelines could clarify what types of data the Wallet Provider is permitted or prohibited from collecting from Wallet Instances for support and maintenance purposes.*

Following the [European Digital Identity Regulation] (EU) 2024/1183 this document discusses high-level technical requirements the ARF should include on Wallet Provider specific maintenance and support functions.

## 1.2 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that is
mandated by an external document. The word 'can' indicates a capability, whereas
other words, such as 'will' and 'is' or 'are' are intended as statements of
fact.

## 1.3 Document structure

This document is structured as follows:

- Chapter 2 introduces support and maintenance expectations set on Wallet Providers based on the existing legislation and the ARF, and lists the Annex 2 HLRs found to relate (also, in addition to their home topic) with support and maintenance on the latest ARF version (2.5.0).
- Chapter 3 Opens the discussion whether specific high-level requirements are desirable.
- Chapter 4 will list the additions and changes that will be made to the ARF as a result of discussing this topic with Member States.

## 2. Existing requirements related to Wallet Provider's support and maintenance duties

### 2.1 Regulatory requirements

Article xx of the [European Digital Identity Regulation] specifies that

### 2.2 Sections in the ARF related to Wallet Solution and Wallet Unit lifecycle management

The Trust model discussion in the ARF main text (Section 6) has the following lifecycle management related subsections, and although not directly mentioning support duty of the Wallet Provider may be of relevance for this topic:

[Section 6.2.3](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#623-wallet-provider-suspension-or-cancellation) of the main document discusses what happens on Wallet Unit level if a Wallet Provider is cancelled or suspended. Informing duty by the Wallet Provider of such event for the Wallet Users is defined in Annex 2/[Topic 38](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2338-topic-38---wallet-unit-revocation) part B part of the ARF.

[Section 6.5](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#65-trust-throughout-a-wallet-unit-lifecycle) of the main document discusses Wallet Unit lifecycle related trust. Once a Wallet User has a Wallet Unit in Operational or Valid state, the Wallet Unit is managed by the User and **the Wallet Provider, and this management includes at least revoking the Wallet Unit when necessary** 

The ARF sub-section [6.5.4](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#654-wallet-unit-management) covers the details (**bold text** effect added by the editor):

The **Wallet Provider** is responsible at least to:

* perform **installation of a new version of the Wallet Solution as necessary** - this is mentioned in [Topic 40](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management) part C, WIAM_11.
* update the WUAs as necessary - covered in [Topic 9](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a239-topic-9---wallet-unit-attestation).
* revoke the Wallet Unit in case its security is compromised - covered in [Topic 38](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2338-topic-38---wallet-unit-revocation).

Management will also include **regular updates of the Wallet Instance application to ensure its continued security and functionality.** 

No technical requirements are currently specified regarding e.g. automatic installation of Wallet Solution updates and their regularity.

### 2.3 Existing high-level requirements in the ARF

The following HLRs were found relevant for the topic of support and maintenance (involving either the Solution management, informing the Wallet User or providing lifecycle support for the Wallet Solution) under existing Annex 2 topics.

#### 2.3.1 Topic 9

Topic 9 covers HLRs for Wallet Unit Attestation (WUA). WUA_03 below relates to (invisible to the Wallet User) readiness maintenance by the Wallet Provider (for ensuring a valid WUA at all times).

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WUA_03  | A Wallet Provider SHALL ensure that a non-revoked Wallet Unit at all times can present a WUA, when requested by a PID Provider or Attestation Provider. |

#### 2.3.2 Topic 38

Topic 38 covers HLRs addresseing Wallet Unit revocation. HLRs having a link between the Wallet Provider and Wallet User have been picked for this topic discussion

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WURevocation_14 | A Wallet Provider SHALL inform a User without delay, and within 24 hours at most, in case the Wallet Provider decided to revoke the User's Wallet Unit. The Wallet Provider SHALL also inform the User about the reason(s) for the revocation. This information SHALL be understandable for the general public. It SHALL include (a reference to) technical details about any security breach if applicable. |
| WURevocation_16 | To inform a User about the revocation of their Wallet Unit, the Wallet Provider SHALL use a communication channel that is independent of the Wallet Unit. In addition, the Wallet Provider MAY use the Wallet Unit itself to inform the User. |

#### 2.3.3 Topic 40

Annex 2 [Topic 40](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management) discusses requirements related to the installation of a Wallet Instance by the User, the subsequent activation of the Wallet Unit by the User and the Wallet Provider, and the management of the Wallet Unit throughout its lifetime. Part C covers high-level technical requirements for Wallet Unit management in WIAM_11 - WIAM_21, of which the maintenance & support related are listed below in [Section 2.3](#23-existing-high-level-requirements-in-the-arf).

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WIAM_01 | To ensure that the User can trust the Wallet Solution, a Wallet Provider SHOULD make its certified Wallet Solution available for installation only via the official app store of the relevant operating system (e.g., Android, iOS). *Note: This allows the operating system of the device to perform relevant checks regarding the authenticity of the Wallet Unit.* |
| WIAM_02 | If a Wallet Provider makes its certified Wallet Solution available for installation through other means than the official OS app store, it SHALL implement a mechanism allowing the User to verify the authenticity of the Wallet Unit. Moreover, it SHALL provide clear instructions to the User on how to install the Wallet Instance, including at least: - instructions on the verification of the authenticity of the Wallet Instance to be installed, - instructions on bypassing of any operating system limitations on side-loading of apps, if applicable, and ensuring that these limitations are restored after the Wallet Instance has been installed. *Note: This requirement also applies for the installation of a Wallet Instance on a User device that is not a mobile device, and for which no official operating system app store may exist.* |
| WIAM_05 | During the activation process of a new Wallet Unit, the Wallet Provider SHALL process information about the User device and the available WSCAs and WSCDs, as far as necessary to issue a Wallet Unit Attestation to the Wallet Unit conform all requirements in [Topic 9](#a239-topic-9---wallet-unit-attestation) section A. The Wallet Provider MAY process additional information necessary for managing the Wallet Unit, but it SHALL NOT process more information than it reasonably needs for legitimate purposes. The Wallet Provider SHALL request User consent (through the Wallet Instance) for all information and data it will process, both during activation and throughout the lifetime of the Wallet Unit. The Wallet Provider SHALL inform the User about the purposes of data processing, in accordance with the General Data Protection Regulation. |
| WIAM_06 | The Wallet Provider SHALL request the User, through the new Wallet Instance, to set up a User account at the Wallet Provider. The Wallet Provider SHALL explain to the User that this is necessary to enable the User to request revocation of the Wallet Unit in case of theft or loss. The Wallet Provider SHALL register one or more User authentication methods that the Wallet Provider will use to authenticate the User in the future. These methods SHALL be independent of the Wallet Unit and the User device. The Wallet Provider SHALL allow the User to register using an alias instead of true identity data. The Wallet Provider SHALL NOT use any registered User data for purposes other than User authentication, unless the User gives explicit consent to do so. The Wallet Provider SHALL register the relationship between the Wallet Unit and the corresponding User account. |
| WIAM_10a | During the activation process of a new Wallet Unit, the Wallet Provider SHALL offer the User a means to verify the formal certification information of their Wallet Solution. |
| WIAM_11 | During the lifetime of the Wallet Unit, the Wallet Provider SHALL update the Wallet Unit as necessary to ensure its continued security and functionality. |
| WIAM_12 | All communication between the Wallet Provider and the Wallet Unit SHALL be mutually authenticated and SHOULD be encrypted. |
| WIAM_12a | The Wallet Unit SHALL ensure that the Wallet Provider cannot access the contents of the Wallet Unit, in particular to learn a) which attestations are present on the Wallet Unit, b) the status of these attestations, c) the value of attributes in these attestations, and d) the contents of the Wallet Unit log meant in DASH_02. |
| WIAM_13 | If the User uninstalls the Wallet Unit, the Wallet Unit SHALL ensure that all cryptographic key material in the WSCA(s) related to the Wallet Unit is securely destroyed. This includes all keys of the WUAs, PIDs and attestations stored in the Wallet Unit. *Note: Key deletion is a cryptographic key operation and requires User authentication, as specified in requirement WIAM_14.* |
| WIAM_13a | If a Wallet Unit supports the [W3C Digital Credentials API] and the User uninstalls the Wallet Unit, the Wallet Unit SHALL disclose the fact that it no longer stores any PID(s) or attestation(s) to the Digital Credentials API framework. |
| WIAM_14 | A WSCA/WSCD SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or a private or secret key of a PID or an attestation stored in a Wallet Unit. For a PID key (which is part of the EUDI Wallet eID means), this WSCA/WSCD SHALL be certified to be compliant with applicable requirements for Level of Assurance High in Commission Implementing Regulation (EU) 2015/1502 section 2.2.1. *Note: Many actions of the Wallet Unit, such as processing a Relying Party presentation request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and presentation signing and encryption. This requirement does not imply that a separate User authentication is necessary before each of these operations. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.* |
| WIAM_15 | Before performing any operation, a Wallet Unit SHALL authenticate the User. The Wallet Unit SHALL use the OS-level authentication mechanism according to WIAM_15a, unless this is technically impossible (for instance on some legacy devices), or the User prefers to use a Wallet Unit-specific PIN implemented by the Wallet Unit itself, as specified in WIAM_15b. |
| WIAM_15a | In order to ensure that operating system-level authentication can be used and is sufficiently secure, during installation of the Wallet Unit, the Wallet Unit SHALL enforce the activation of an OS-level User authentication mechanism with adequate security policies. |
| WIAM_15b | During installation of the Wallet Unit, the Wallet Unit SHALL enable the User to indicate if they want to use a Wallet Unit-specific PIN for User authentication, or use the OS-level User authentication mechanism. The Wallet Unit SHALL enable the User to change this preference during the lifetime of the Wallet Unit. |
| WIAM_16 | For User authentication according to WIAM_15, a Wallet Unit SHALL implement an idle timeout, after which User authentication SHALL again be required. The Wallet Unit SHOULD provide the User with the option to set the idle timeout to a duration shorter than the default timeout. |
| WIAM_21 | Whenever the WSCA/WSCD successfully authenticated the User according to WIAM_14, the Wallet Unit SHOULD check if there are any PIDs or attestations on the Wallet Unit that cannot be presented any longer to Relying Parties, for example because they have expired or because a once-only attestation (see [Topic 10](#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit), section D, method A) was presented to a Relying Party already. The Wallet Unit SHOULD then request the WSCA/WSCD to destroy all cryptographic key material related to these PIDs or attestations. *Note: The reason for this recommendation is that probably, Wallet Providers will want to prevent an accumulation of unused private keys in the WSCA/WSCD, given that such devices typically do not have much storage space. However, deletion of private keys (and potentially other key material) is a cryptographic key operation and cannot be done without User authentication; see WIAM_14. At the same time, for usability reasons the User must not be involved in such 'cleaning up' processes, see also ISSU_42. The recommended solution is to take advantage of a User authentication event to also carry out any necessary cleaning operations.* |

## 3 Discussion

The support and maintenance functions of the Wallet Provider are in the current ARF mostly implicit and embedded under technical topics that either link to issuance, revocation or lifecycle management of technical artefacts (functional requirements under various topics). 

Many operative functions of a Wallet Provider related to sustained custoner support and active engineering towards keeping the Wallet Solution up to date might be addressed by listing comprehensive non-functional requirements unless they are part of the Wallet Provider certification checklists. The open question is: would such HLRs make sense to be specified as EC technical requirements? 


## 4 Additions and changes to the ARF

> Note: Section 4 will be documented after the focus group discussions have been concluded.

### 4.1 High-Level Requirements to be added to Annex 2

TBA

### 4.2 High-Level Requirements to be changed

TBA

A list of the requirements that shall be removed follows:

**Topic xx**

TBA

### 4.3 Descriptions to be added to the ARF main document

TBA

## 4 References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |