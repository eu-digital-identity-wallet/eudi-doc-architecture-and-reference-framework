Version 0.1, updated 3 Feruary 2025

# C - Wallet Unit Attestation (WUA) and Key Attestation

## 1 Introduction

### 1.1 Discussion Paper Topic Description
This document is the Discussion Paper for eIDAS Coordination Group regarding Topic C: Wallet Unit Attestation (WUA) and key attestation.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*Define high-level requirements for WUA as defined in the IAs of article 5a, and for the key attestation.*

### 1.2 Key Words
This document uses the capitalized key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalized) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to wallet unit attestation and key attestation.

- Chapter 3 discusses the high level purpose wallet unit attestation as well as lists open questions related to this topic.

- Chapter 4 discussed the current HLRs related to WUA.

- Chapter 5 relates the topic to other topics being discussed and previously identified risks.

- Chapter 6 presents the additions and changes that will be made to the ARF as a result of discussing this topic with Member States. 

## 2 Legal Requirements for Wallet Unit Attestation
Multiple legal texts impose direct requirements Wallet Unit Attestation and impose requirement that are solved using Wallet Unit Attestation: [CIR.2024.2977], [CIR.2024.2979], [CIR.2024.2982] and [eiDAS 2.0].
Below we recap the respective legal requirements from these sources.

### 2.1 [eIDAS 2.0] about Wallet Unit Attestation
[eIDAS 2.0] does not directly address the need for Wallet Unit Attestations. Rather, it requires that it should be possible to verify the authenticity and validity of an EUDI Wallet. 


Below are the actual excerpts from the law including the recitals that establish these requirements.

**Recital (34)**

*The use of European Digital Identity Wallets as well as the discontinuation of their use should be the exclusive right and choice of users. Member States should develop simple and secure procedures for the users to request immediate revocation of validity of European Digital Identity Wallets, including in the case of loss or theft. Upon the death of the user or the cessation of activity by a legal person, a mechanism should be established to enable the authority responsible for settling the succession of the natural person or assets of the legal person to request the immediate revocation of European Digital Identity Wallets.*

**Article 5a European Digital Identity Wallets**

*... 4.  European Digital Identity Wallets shall, in particular:\
...\
(a) support common protocols and interfaces:\
...\
(viii) for relying parties to verify the authenticity and validity of European Digital Identity Wallets;\
...\
... 8. Member States shall provide validation mechanisms free-of-charge, in order to:\
(a) ensure that the authenticity and validity of European Digital Identity Wallets can be verified;\
...\
...9. Member States shall ensure that the validity of the European Digital Identity Wallet can be revoked in the following circumstances:\
...*

### 2.2 [CIR.2024.2977] about Wallet Unit Attestation

[CIR.2024.2977] specifies three main requirements related to Wallet Unit Attestation:
1. PID issuers must ensure their data is cryptographically bound to the wallet unit during issuance.
2. PID issuers must verify that wallet unit belongs to a trusted wallet solution.
3. Wallet unit attestation must support revocation.

Below are the actual excerpts from the law including the recitals that establish these requirements.

**Recital (10)**

*To protect the data of wallet users and to ensure the authenticity of electronic attestations of attributes, mechanisms
for the authentication of providers of electronic attestations of attributes, and for the verification of the authenticity
and validity of wallet units by that provider should apply prior to the issuance of the attestations to wallet units.*

**Article 3**

*5. Providers of person identification data shall ensure that person identification data that they issue is cryptographically bound to the wallet unit to which it is issued.\
9. Before issuing person identification data to a wallet unit, providers of person identification data shall authenticate and validate the wallet unit attestation of the wallet unit and verify that the wallet unit belongs to a wallet solution the provider of person identification data accepts or use another authentication mechanism in accordance with an electronic identity scheme notified at assurance level high.*

**Article 5**

*4. Where providers of person identification data revoke person identification data issued to wallet units, they shall do so in each of the following circumstances:\
...\
(b) where the wallet unit attestation to which the person identification data was issued to has been revoked;*

### 2.3 [CIR.2024.2979] about Wallet Unit Attestation

[CIR.2024.2979] specifies six main requirements related to Wallet Unit Attestation:
1. Wallet unit providers must ensure the wallet unit contains a wallet unit attestation.
2. The WUA must contain a public key, where the corresponding private key is protected by a WSCD.
3. The WUA must be revocable only by the wallet provider that provided the WUA.
4. The wallet provider have certain responsibilities in relation to revocation of WUA.
5. The WUA must contain information as to where revocation information can be found. This information must be made available in a privacy preserving manner. 
6. Relevant information contained in the WUA may be logged.


Below are the actual excerpts from the law including the recitals that establish these requirements.


**Recital (7)**

*Wallet units are to enable providers of person identification data or electronic attestations of attributes to verify that
they are issuing this data or attestations to genuine wallet units of the wallet user.*

**Recital (8)**

*To ensure data protection by design and by default, the wallets should be provided with available state-of-the-art
privacy enhancing techniques. These features should provide the possibility that wallets can be used without the
wallet user being trackable across different wallet-relying parties, if applicable in the usage scenario. For instance,
wallet providers should consider state-of-the-art privacy mitigating measures in relation to wallet unit attestations,
such as using ephemeral wallet unit attestations or batch issuance. In addition, embedded disclosure policies should
warn the wallet users against inappropriate or illegal disclosure of attributes from electronic attestations of
attributes.*

**Recital (9)**

*Wallet unit attestations should make it possible for wallet-relying parties which request attributes from wallet units,
to verify the validity status of the wallet unit that they are communicating with, as wallet unit attestations are to be
revoked when a wallet unit is no longer considered valid. The information regarding the validity status of the wallet
units should be made available in an interoperable manner, to ensure that it can be used by all wallet-relying parties.
Moreover, for cases where wallet users lost their wallet units or no longer have control over it, wallet providers
should enable wallet users to request the revocation of their wallet unit. To ensure the privacy and unlinkability,
Member States should employ privacy preserving techniques also for the wallet unit attestation. This may include
the usage of multiple wallet unit attestations for different purposes, disclosing only the minimally relevant
information about the wallet necessary for a transaction, or to limit the lifetime of the wallet unit attestation as an
alternative to the use of revocation identifiers.*

**Article 6**

*1. Wallet providers shall ensure that each wallet unit contains wallet unit attestations.\
2. Wallet providers shall ensure that the wallet unit attestations referred to in paragraph 1 contain public keys and that the corresponding private keys are protected by a wallet secure cryptographic device.\
3. Wallet providers shall:\
( c ) ensure wallet users have the right to request revocation of their wallet unit attestations, using the authentication mechanisms referred to in point (b).*

**Article 7**

*1. Wallet providers shall be the only entities capable of revoking wallet unit attestations for wallet units that they have provided.\
2. Wallet providers shall establish a publicly available policy specifying the conditions and the timeframe for the revocation of wallet unit attestations.\
3. Where wallet providers have revoked wallet unit attestations, they shall inform affected wallet users within 24 hours of the revocation of their wallet units, including the reason for the revocation and the consequences for the wallet user. This information shall be provided in a manner that is concise, easily accessible and using clear and plain language.\
4. Where wallet providers have revoked wallet unit attestations, they shall make publicly available the validity status of the wallet unit attestation in a privacy preserving manner and describe the location of that information in the wallet unit attestation.*

**Article 9**

*2. The logged information shall at least contain:\
…\
(b) the name, contact details, and the unique identifier of the corresponding wallet-relying party and the Member State in which that wallet-relying party is established, or in case of other wallet units, relevant information from the wallet unit attestation;*


### 2.3 [CIR.2024.2982] about Wallet Unit Attestation

[CIR.2024.2982] specifies four main requirements related to Wallet Unit Attestation:
1. Wallet units must validate WUA when interacting with other wallet units.
2. WUA information must be displayed to users in certain cases.
3. Wallet units must provide WUA to wallet-relying parties or wallet units upon request.
4. Wallet units must provide WUA to PID or attestation providers upon request.


**Recital (5)**

*In order to ensure transparency and trustworthiness of wallet-relying parties towards wallet users, the protocols and
interfaces used by the wallet solutions should provide wallet users with a reliable mechanism to authenticate wallet-
relying parties and other wallet units. Inversely, wallet providers should provide a mechanism to authenticate and
validate wallet units so that relying parties can receive assurances with respect to trustworthiness and authenticity
of the wallet units. Further, the technical infrastructure of the wallets should also be designed to ensure that only the
minimal necessary amount of data is transferred only to the authorized relying parties, while keeping unlinkability
between the different transactions. In order to facilitate the issuance of person identification data and electronic
attestations of attributes, all wallet solutions should support a minimum set of protocols and interfaces.*



**Article 3**

*Regarding the protocols and interfaces referred to in Articles 4 and 5, wallet providers shall ensure that wallet units:\
(2) authenticate and validate the wallet unit attestations of other wallet units where interacting with other wallet units;\
(3) authenticate and validate requests made using wallet-relying party access certificates or wallet unit attestations from other wallet units, where applicable;\
(5) display to wallet users information contained in the wallet-relying party access certificates or in the wallet unit attestations;\
(8) present wallet unit attestations of the wallet unit to wallet-relying parties or wallet units that request it;*

**Article 4**

*3. In relation to the issuance of person identification data and electronic attestations of attributes to a wallet unit, wallet
providers shall ensure that the following requirements are complied with:\
...\
(b) where wallet users use their wallet unit to interact with providers of person identification data or electronic attestations of attributes, wallet units shall enable authentication and validation of the wallet unit components by presenting the wallet unit attestations to those providers upon their request;*




## 3 Purpose of WUA

The legal requirements of Chapter 2 address different aspects related to Wallet Unit Attestation. The aspects cover interaction with the user (i.e. requirements in relation to the user interface), interaction with other parties (i.e. what WUA should be used for) and the WUA itself (i.e. essential information that should be contained in the WUA). This document will not go into requirements on the user interface, etc., but will focus on how WUA may be used in connection with other parties.

**Furthermore, this document is ONLY intended to clarify the high level requirements related to WUA. The technical specifications related to WUA is to be developed by the Commission at a later point in time.**

The legal requirements in relation to the functional requirements of WUA can be summarized as the following functionality:

1. WUA information must allow relying parties, PID and attestation providers and other Wallet Units to validate the authenticity and revocation status of a Wallet Unit.
2. Wallet Providers must be able to revoke a Wallet Unit.
3. Only the Wallet Providers of a Wallet Unit must be able to revoke that Wallet Unit.
4. It is the Wallets Providers responsibility to create the WUA.
5. PID issuers must be able to ensure their data is cryptographically bound to the wallet unit during issuance.

Based on the funtional requirement, the following requirements with regard to the WUA itself can derived:
1. The WUA must contain a public key, where the corresponding private key is protected by a WSCD. 
2. The WUA must contain information, allowing parties to check if a Wallet Unit has been revoked.
3. The WUA must contain information, allowing parties to verify the validity of the Wallet Unit, i.e. the WUA must contain a signature from the Wallet Provider.

All of this can be achieved as a (revocable) attestation on a public key, issues by the Wallet Provider. Additionally the WUA should contain relevant information on the Wallet Unit capabilities, such as the WSCD/WSCA. These must also be attested by the Wallet Provider and may be used to provide additional trust in the Wallet Unit.

> Question: Are there any missing requirements?

We have identified two requirements in relation to WUA that warrant further discussion:

### Cryptographically binding
[CIR.2024.2977] Article 3 states that:

*5. Providers of person identification data shall ensure that person identification data that they issue is cryptographically bound to the wallet unit to which it is issued.*

The wording, _cryptographically bound_, may be interpreted in different ways. While this interpretation, and the consequences of the interpretation, is relevant for the EUDI Wallet as a whole, it is essentially not a an issue to be addressed in the WUA. The WUA is only intended to provide a base of trust, i.e. an attestation on a public key and the capabilities of the wallet unit. This approach will provide a trusted foundation, on which more advanced features, such as proof of association can be built upon. At the same time, this allows the WUA to be treated as "any other attestation". 

> Question: Do we prevent PID and Attestation providers from achieving _"cryptographically bound"_ (such as by proof of association), by limiting the WUA to contain only a signed public key and a set of supported capabilities/operations?


### Revocation
[CIR.2024.2977] Article 5 states that:

*4. Where providers of person identification data revoke person identification data issued to wallet units, they shall do so in each of the following circumstances:\
...\
(b) where the wallet unit attestation to which the person identification data was issued to has been revoked;*

The text states that providers of PID are obligated to revoke PID issued to a Wallet Unit, if that Wallet Unit is revoked. Depending on how the WUA is constructed and how the above mentioned _cryptographic binding_ is done, it may be possible (e.g. using Zero-Knowledge proofs) to make a revocation of the Wallet Unit automatically revoke any issued PID. Alternatively the providers of PID are obliged to maintain a record of Wallet Units that have been issued PID and periodically monitor the revocation status of these Wallet Units. In general there are two approaches as to how revocation can be done:

- Approach A: All attestations (PID, Attestations, Pseudonyms) are somehow cryptographically connected to the WUA, e.g. the PID will contain a reference to the WUA of the Wallet Instance it was issued to. During presentation of an attestation, both the attestation and the WUA (or parts hereof) are presented to the Relying Party, which verifies both the revocation status of the WUA and the validity (including revocation status) of the attestation. If the Wallet Instance is revoked, the connected attestations all automatically become invalidated and the PID and attestation providers will not need to take action.

- Approach B: Attestations (PID, Attestations, Pseudonyms) are not linked with the WUA. During presentation, only the attestation is sent to the Relying Party, which verifies the validity (including revocation status). In order for this to work, PID and Attestations providers must monitor the revocation status of all Wallet Instances that have been issued PID or Attestations. Once a revoked WUA is detected by the PID or Attestation provider, the provider can perform their own revocation of the issued PID or attestation.

[Topic A] discusses privacy risks related to the usage of attestations, which also apply to the WUA.
Using Approach A, will involve the WUA in nearly all activity of the Wallet Unit, hence the drawbacks mentioned in [Topic A] may become overwhelming.

> Question: Which approach should be taken?


## 4 Current HLRs
Currently the ARF, Annex 2, Topic 9, contains a number of High Level Requirements related to "Wallet Trust Evidence" and "Wallet Instance Attestation". These requirements cover multiple aspects of WUA and complicates the topic. As some of these HLRs relate more to the usage of WUA and the surrounding processes, rather than the WUA itself, it is proposed that these are moved to other content, e.g. it is important for the Wallet Provider to verify the capabilities of the WSCA before issuing the WUA (and the WUA may include a list of these capabilities), however this should not be a HLR of the WUA. The existing HLRs are listed in the tables below along with a proposal to keep or remove the HLR. 
>Note: The remaining HLRs will have their text updated to the new definitions (e.g. WUA rather than WTE/WIA).   

| **Index** | **Requirement** | **Proposal** |
|-----------|--------------|--------------|
| WTE_01 | A Wallet Provider SHALL have to activate a new Wallet Instance before a User can use it to obtain an attestation. | Move - Genereal requirement on Wallet Instance functionality |
| WTE_02 | A WSCA SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Instance (i.e., a WTE key) or of an attestation in a Wallet Instance. | Move - General requirement on Wallet Instance functionality|
| WTE_03 | A Wallet Instance SHALL authenticate the User before performing any operation excluding cryptographic operations. The Wallet Instance MAY rely on a WSCA certified to be compliant with applicable requirements for level of assurance "high" to do so, but MAY also rely on other components. <p><br>Note: Cryptographic operations can only be performed by the WSCA after User authentication according to WTE_02. | Move - General requirement on WI functionality  |
| WTE_04 | For a Wallet Instance containing a natural-person PID, the User mentioned in WTE_02 and WTE_03 SHALL be the natural person who is the subject of that PID. | Move - Legal/Procedural requirement for the Wallet Provider |
| WTE_05 | For a Wallet Instance containing a legal-person PID, the User mentioned in WTE_02 and WTE_03 SHALL be a natural person appointed by the legal person who is the subject of that PID. <p><br>Note: This requirement does not imply that the actions of a legal-person Wallet Instance cannot be automated, or that the person(s) controlling the Wallet Instance must authenticate every time the Wallet Instance presents an attestation or creates a seal. The intent is that every operation performed by the legal-person Wallet Instance is performed under the responsibility of a natural person. | Move - Legal/Procedural requirement for the Wallet Provider |
| WTE_06 | A Wallet Provider SHALL only activate a new Wallet Instance if it has verified that: <ul><li>The Wallet Instance has access to at least one WSCA that is certified to be compliant with applicable requirements in this Topic, for level of assurance "high". In addition, the Wallet Instance MAY have access to one or more other WSCAs.</li><li>The private key corresponding to the public key in the WTE (see WTE_07) is protected by the respective WSCA.</li></ul> | Keep |
| WTE_07 | During the activation of a new Wallet Instance, a Wallet Provider SHALL sign at least one Wallet Trust Evidence (WTE) and issue it to the Wallet Instance. | Keep |
| WTE_08 | The Commission SHALL take measures to ensure that the contents, format and encoding of the Wallet Trust Evidence is specified in a technical specification. Each WTE SHALL describe the Wallet Instance and a certified WSCA available to that Wallet Instance, in such a way that a PID Provider or Attestation Provider processing the WTE is able to take a well-grounded decision on whether to issue an attestation to that Wallet Instance and WSCA. <br>Notes: <ul><li>In general, a PID Provider or Attestation Provider will also need information about the User. Such information is not contained in the WTE.</li><li>The WTE does not contain information allowing a PID Provider or Attestation Provider to verify whether the WTE (and by extension the Wallet Instance) is revoked. Revocation information for the Wallet Instance is instead included in the WIA defined in \[[Topic 38](#a2338-topic-38---wallet-instance-revocation)\].</li></ul> | Keep |
| WTE_09 | A Wallet Provider SHALL consider all relevant factors, including the risk of a WTE public key becoming a vector to track the User, when deciding on the validity period of a WTE. A Wallet Provider MAY use short-lived WTEs to mitigate such risks. | Keep - possibly refer to general requirements on attestations|
| WTE_10 | A WSCA SHALL generate a new key pair for a new WTE on request of the Wallet Provider via the Wallet Instance. The WSCA SHALL register the new key as a WTE key in an internal registry. The WSCA SHALL register the WTE key as an independent (i.e., non-associated) key in an internal registry. <p><br>Note: A WTE key can be associated later with a PID or attestation key when that PID or attestation key is created, see WTE_13. | Keep - possibly move to functional requirement on WSCA|
| WTE_11 | A WTE SHALL contain a public key, and the corresponding private key SHALL be generated by the WSCA described in the WTE. <p><br>Note: A WTE key pair is generated as per WTE_10. | Keep |
| WTE_12 | In case the Wallet Provider must update the WTE because the information in the WTE is outdated, the Wallet Provider SHALL ensure that the Wallet Instance only releases the latest version of a WTE to an Attestation Provider. | Keep | 

B.  Using the WTE during issuance of an attestation 

**The entire B section if focused on verifications needed to be performed during issuance. This section should be moved to another document or section of Annex 2, e.g. Topic 10 : "Issuing a PID or Attestation to the EUDI Wallet"** 

>Question: Should section B be moved elsewhere (and if so where?)


| **Index** | **Requirement** | **Proposal** |
|-----------|--------------|--------------|
| WTE_13 | During PID or attestation issuance, a WSCA SHALL generate a new key pair for a new PID or attestation, on request of the PID Provider or Attestation Provider via the Wallet Instance. The PID Provider or Attestation Provider SHALL indicate a single WTE public key (see WTE_10) with which the new PID or attestation key must be associated. This indication can either be direct, by providing the WTE public key value, or indirect, by providing a public key value that has been associated with the WTE key previously. In the latter case, the WSCA SHALL look up the associated WTE key in its internal registry. <br>The WSCA SHALL register the new key in an internal registry as an attestation key. The WSCA SHALL register the association between the new private key and the WTE private key in an internal registry. <br>Notes: <ul><li>Direct indication of the WTE is used in case a PID Provider or Attestation Provider indicates during issuing that the new PID or attestation must be associated with a WTE public key, see WTE_15 and WTE_16.</li><li>Indirect indication of the WTE key is used in case an Attestation Provider indicates during issuing that the new attestation must be associated with an existing PID or attestation, see WTE_16.</li></ul> | Keep |
| WTE_14 | During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to the new PID or attestation public key, on request of the PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key. | Keep |
| WTE_15 | A PID Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new PID must be associated. This SHALL be a WTE public key. | Keep |
| WTE_16 | An Attestation Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new attestation must be associated. This SHALL be either a WTE public key or the public key of a PID or attestation that already exists in the Wallet Instance. <p><br>Note: if the Attestation Provider indicates a PID or attestation public key, this is an indirect indication of a WTE key, see WTE_13. | Keep |
| WTE_17 | During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to a WTE public key on request of a PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key. | Keep | 
| WTE_18 | During PID or attestation issuance, a WSCA SHOULD generate a proof of association for two or more public keys, if and only if the corresponding private keys are protected by the same WSCA and the WSCA has internally registered an association between these private keys. <br>Notes: <ul><li>It is possible that some private keys in a WSCA are not associated with each other, even though they are managed within the same WSCA.</li><li>If two keys are associated, this implies that they are both associated with the same WTE key. The concept of associated keys is explained in the forthcoming White Paper on Wallet Trust Evidence.</li></ul> | Keep |
| WTE_19 | During PID or attestation issuance, the PID Provider or Attestation Provider SHALL verify that: <ul><li>The WSCA described in the WTE received from the Wallet Instance has proven possession of the private key corresponding to the public key in the WTE (see WTE_17),</li><li>The WSCA has proven possession of the new PID or attestation private key (see WTE_14)</li></ul> In addition, the PID Provider or Attestation Provider SHOULD verify that: <ul><li>The WSCA has proven association (see WTE_18) between the new PID or attestation public key and the public key requested by the PID Provider or Attestation Provider according to WTE_15 or WTE_16.</li></ul> <br>Notes: <ul><li>See also WTE_13.</li><li>These three proofs MAY be implemented as a single cryptographic proof.</li></ul> | Keep |
| WTE_20 | During PID or attestation issuance, a Wallet Instance SHALL provide the PID Provider or Attestation Provider with information on all WSCAs it is able to use for private key management and that comply with the PID Provider's or Attestation Provider's requirements. | Keep |
| WTE_21 | During PID or attestation issuance, a Wallet Instance SHALL provide the PID Provider or Attestation Provider with the WTE describing the properties of the WSCA that generated the new PID or attestation private key and protects it. | Keep |
| WTE_22 | If a Wallet Instance has access to multiple WSCAs, it SHALL register which PIDs and attestations are bound to each of these WSCAs. | Keep |

C.  Miscellaneous 

| **Index** | **Requirement** | **Proposal** |
|-----------|--------------|------|
| WTE_23 | The common OpenID4VCI protocol defined in requirement ISSU_01 SHALL enable a Wallet Instance to transfer a WTE to a PID Provider or Attestation Provider. | Keep - Ensure that format of WUA is compatible|
| WTE_24 | A Wallet Instance SHALL release a WTE only to a PID Provider or Attestation Provider, and not to a Relying Party or any other party. | Depends on outcome of revocation discussion - Introduce selective disclosure and only reveal relevant WUA information to PID Provider, Attestation Provider, Relying Party or any other party.|
| WTE_25 | The common OpenID4VCI protocol SHALL enable a Wallet Instance to transfer the proofs of association and possession mentioned in WTE_19 to a PID Provider or Attestation Provider. <p><br>Note: These three proofs MAY be implemented as a single cryptographic proof. | Remove - doesn't involve content of WUA |
| WTE_26 | The common OpenID4VCI protocol SHALL enable a Wallet Instance to transfer a public key to a PID Provider or Attestation Provider, to be included in the new PID or attestation. | Uncertain - doesn't not appear to involve content of WUA, but OpenId4VCI protocol may impose requirements on the public key contained in WUA? | 
| WTE_27 | The common OpenID4VCI protocol SHALL enable a PID Provider or Attestation Provider to indicate in the Token Response: <ul><li>the WSCA to which the new PID or attestation key must be bound, for example by referring to a WSCA identifier listed in the WTE</li><li>or, alternatively, the existing PID or attestation public key with which the new credential key must be associated.</li></ul> | Keep - Imposes requirement to content of WUA (WSCA identifiers or PID or attestation public keys) | 

D.  Overview: Requirements for a WSCA

The technical requirements above imply the following requirements for a WSCA.

**The WSCA requirements need to be updated according to outcome of above discussion points. Furthermore, mandatory (SHALL) requirements could be moved to a separate deliverable on minimum requirements for WSCA. This deliverable would be used by Wallet Providers before issuing WUA. WTE_36 describes a capability that could be included in the WUA.**

>Question: Should Section D be moved to a separate deliverable   


| **Index** | **Requirement** |
|-----------|--------------|
| WTE_28 | A WSCA SHALL be able to verify the authentication factors of a User, in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) Section 2.2.1. |
| WTE_29 | A WSCA SHALL be able to generate a new key pair on request of the Wallet Instance. |
| WTE_30 | A WSCA SHALL be able to prove possession of the private key corresponding to a public key on request of a Wallet Instance, for example by signing a challenge with that private key. |
| WTE_31 | A WSCA SHALL register each newly generated key pair as either a WTE key or an attestation key, depending on information provided by the Wallet Instance in the key generation request. The internal registry used by the WSCA for this purpose SHALL be protected against modification by external parties. |
| WTE_32 | A WSCA SHALL protect a private key it generated during the entire lifetime of the key. This protection SHALL at least imply that the WSCA prevents the private key from being extracted in the clear. If a WSCA is able to export a private key in encrypted format, the key used for key encryption SHALL be properly protected, for example as multiple key shares controlled by multiple key custodians. |
| WTE_33 | A WSCA SHALL associate each newly generated attestation key with a WTE key indicated by the Wallet Instance. The WSCA SHALL record the association between these keys in an internal registry, which SHALL be protected against modification by external parties. |
| WTE_34 | For the purposes of WTE_33, a Wallet Instance SHALL indicate the WTE key either directly, by WTE public key value, or indirectly, by value of a public key that is already associated to the intended WTE key. In the latter case, the WSCA SHALL look up the intended WTE key in its registry. |
| WTE_35 | A WSCA SHALL consider two keys to be associated if they are associated to a common WTE key. |
| WTE_36 | A WSCA SHOULD be able to generate a proof of association for two or more public keys. The WSCA SHALL generate such a proof if and only if the corresponding private keys are protected by that WSCA, and the WSCA has internally registered an association between these private keys. |

**Annex 2, Topic 38 contains HLRs on revocation of Wallet Units. This section will need to be updated to contain WUA rather than WIA. Furthermore the discussion on revocation may also trigger some minor changes.**




## 5 Relation to Other Topics
Below we discuss how wallet unit attestations relate to the other topics being discussed.

### 5.1 Privacy Risks and Mitigations


[Topic A - Privacy Risks and Mitigations] highlight that WUA functions like any other attestation and therefore the risks and mitigations are the same:
- PID and Attestation providers may assume the role of Relying Party with regard to RP-linkability: When presenting a WUA to a Relying Party (in this case this includes PID and Attestation providers), the Relying Party may record attribute values and use these to track the user.
- The Wallet Provider may assume the role of Attestation Provider with regard to AP-linkability: If the Wallet Provider colludes with Relying Parties (PID and Attestation providers), user behaviour may be tracked.
- Using one of the one-time, limited-time, rotating batch or per-relying part attestations will all work with WUA. Note that the use pattern of WUA (it is only intended for PID and Attestation providers during issuance), it will most likely only be used a few times with a few Relying Parties (i.e. PID and attestation providers).


### 5.2 Relation to Risk Register
The purpose of WUA is to allow parties interacting with the Wallet Unit, to ensure they are interacting with a legitimate Wallet Unit. Therefore WUA has
impact on several of the risks listed in the risk register for European Digital Identity Wallets \[RiskRegister\]:

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 14%" />
<col style="width: 53%" />
</colgroup>
<thead>
<tr>
<th><strong>Risk type </strong></th>
<th><strong>Risk ID </strong></th>
<th><strong>Related risk titles </strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R1</td>
<td>Creation or use of an existing electronic identity</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R2</td>
<td>Creation or use of a fake electronic identity</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R3</td>
<td>Creation or use of fake attributes</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R4</td>
<td>Identify theft</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R6</td>
<td>Data disclosure</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R7</td>
<td>Data manipulation</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R9</td>
<td>Unauthorised transaction</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R14</td>
<td>Surveillance</td>
</tr>
</tbody>
</table>

The use of WUA is a mitigating mechanism with regard to some of the Technical Threats from the [Risk Register] (threats labelled TTX.Y in
its section III). This is primarily TT2. Errors and misconfigurations, TT3. Use of unreliable resources and TT5.Malicious actions. In relation to these
threats, WUA is used to assure that the Wallet Unit is not compromised.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R1. Creation or use of an existing electronic identity</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Creation or use of an existing electronic identity is defined as the creation of an electronic identity in a wallet that exists in the real world and is assigned to another user. By essence, this risk leads to the risks of Identity theft (R4), and Unauthorised transactions (R9).</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R2. Creation or use of a fake electronic identity</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Creation or use of a fake electronic identity is defined as the creation of an electronic identity in a wallet that does not exist
in the real world.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R3. Creation or use of fake attributes</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Creation or use of fake attributes is defined as the creation or use of attributes that cannot be validated to be issued by the claimed provider and cannot be trusted.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R4. Identity theft</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Identity theft is defined as the unauthorised acquisition of the wallet unit or loss of authentication factors enabling to
impersonate a person.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R6. Data disclosure</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Data disclosure is defined as the unauthorised exposure of personal
data including special categories of personal data. The privacy breach risk
is very similar when considered from a privacy rather than security viewpoint.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R7. Data manipulation</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Data manipulation is defined as the unauthorised alteration of data.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R9. Unauthorised transaction</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Unauthorised transactions are defined as operational activities conducted without the permission or knowledge of the
wallet user. In many cases, an unauthorised transaction can lead to Identity theft (R4) or Data disclosure (R6). It is also
related to unauthorised transactions, such as the misuse of cryptographic keys.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R14. Surveillance</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Surveillance, or monitoring, is defined as the unauthorised tracking
or observation of a wallet user's activities, communication, or data.
Surveillance is often related to inference, which is defined as the
deduction of sensitive or personal information from seemingly innocuous
data.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>SR1. Wholesale surveillance</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Wholesale surveillance is defined as the tracking or observation of
the activities of many users through their wallet's communication or
data. Wholesale surveillance is often associated with surveillance (R14)
and inference at a global scale, where information about many users is
combined to deduce sensitive or personal data about users or to identify
statistical trends that can be used to design further attacks.</td>
</tr>
</tbody>
</table>

More specifically, \[RiskRegister\] describes the following threats in relation to wallet unit attestations:

<table style="width:100%;">
<colgroup>
<col style="width: 13%" />
<col style="width: 51%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr>
<th><strong>ID<br />
</strong><em>Identifier</em></th>
<th><strong>Threat description<br />
</strong><em>Description of the identified threat</em> (*)</th>
<th><strong>Risk title<br />
</strong><em>Related risks</em></th>
</tr>
</thead>
<tbody>
<tr>
<td>TR10</td>
<td>An attacker can activate a new wallet on an invalid WSCD.</td>
<td>Creation or use of an existing electronic identity (R1) / Creation or use of a fake electronic identity (R2)
</td>
</tr>
<tr>
<td>TR12</td>
<td>An attacker can circumvent the verification by the PID provider that the wallet is controlled by the user and have a PID issued into a compromised wallet under the attacker’s control.</td>
<td>Creation or use of an existing electronic identity (R1) / Identify theft (R4) / Unauthorised transaction (R9)</td>
</tr>
<tr>
<td>TR13</td>
<td>	
An attacker can get a valid PID into an invalid wallet uni</td>
<td>	
Creation or use of an existing electronic identity (R1) / Identify theft (R4) / Unauthorised transaction (R9)</td>
</tr>
<td>TR22</td>
<td>An attacker can circumvent the verification by the (Q)EAA provider that the wallet is in control of the user and have a (Q)EAA issued into a compromised wallet under the attacker’s control.</td>
<td>Creation or use of fake attributes (R3)</td>
</tr>
<td>TR39</td>
<td>An attacker can unlawfully trace wallet users using unique/traceable identifiers.
</td>
<td>Data disclosure (R6) / Surveillance (R14)</td>
</tr>
<tr>
<td>TR46</td>
<td>An attacker can bypass or subvert the performance of checks by the wallet that verify whether the PID has been revoked by the PID provider to always return success.</td>
<td>Data manipulation (R7)</td>
</tr>
<tr>
<td>TR56</td>
<td>An attacker can propose an application that mimics a specific legitimate wallet to users.</td>
<td>Identity theft (R4)</td>
</tr>
<tr>
<td>TR84</td>
<td>A group of colluding relying parties or PID providers can derive the user’s identity data beyond data known to them.</td>
<td>Surveillance (R14)</td>
<tr>
<td>TR85</td>
<td>An attacker can track and trace a user by using person
identification data of the user where identification of the user
is not required.</td>
<td>Surveillance (R14)</td>
</tr>
<tr>
<td>TR107</td>
<td>An attacker can steal information from a user by spoofing a wallet.</td>
<td>	
Effect on various risks</td>
</tr>
<tr>
<td>TR112</td>
<td>An attacker can modify a legitimate wallet instance and propose it to users as a legitimate one.</td>
<td>Effect on various risks</td>
</tr>
</tbody>
</table>

R14, SR1, TR39, TR84, TR85 are particularly relevant to consider given the discussion in Chapter 5.1<TODO>, namely linkability of WUA.

<TODO update with further details>

## 6 Additions and Changes to the ARF

## 7 References

| Reference       | Description                                                                                                                                                                                                                                                                          |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [WebAuthN]      | Web Authentication: An API for accessing Public Key Credentials Level 2 W3C Recommendation, 8 April 2021, https://www.w3.org/TR/webauthn-2/                                                                                                                                          |
| [ARF_DevPlan]   | Architecture and Reference Framework Development plan 2025, European Commission, v1,0.                                                                                                                                                                                               |
| [Topic A]       | Topic A - Privacy Risks and Mitigations |
| [RiskRegister]  | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |
| [eIDAS 2.0]     | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework                                                                                        |
| [CIR.2024.2977] | Commission Implementing Regulation (EU) 2024/2977 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards person identification data and electronic attestations of attributes issued to European Digital Identity Wallets      |
| [CIR.2024.2979] | Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets      |
| [CIR.2024.2982] | Commission Implementing Regulation (EU) 2024/2982 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards protocols and interfaces to be supported by the European Digital Identity Framework      |
