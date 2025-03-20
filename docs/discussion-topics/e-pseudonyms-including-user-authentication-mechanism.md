Version 0.7, updated 4 March 2025

[Link to GitHub discussion](https://www.github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/375)

# E - Pseudonyms, including User authentication mechanism

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic E: Pseudonyms, including User authentication mechanism.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*High-level requirements for pseudonyms in the ARF need to be further detailed, including
specifying the use cases where pseudonyms should be applied.*

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHALL NOT', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, prohibitions, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to pseudonyms.

- Chapter 3 explains two identified use cases for pseudonyms and lists open questions related to these use cases.

- Chapter 4 presents the technical approach to pseudonyms and highlights its challenges.

- Chapter 5 relates the topic to other topics being discussed and previously identified risks.

- Chapter 6 presents the additions and changes that will be made to the ARF as a result of discussing this topic with Member States.

## 2 Legal Requirements for Pseudonyms

There are two legal texts that impose direct requirements on the pseudonym functionality of the Wallet Units: the [European Digital Identity Regulation] and [CIR.2024.2979], the Implementing Act on PID and EAA.

Below we recap the respective legal requirements from these sources.

### 2.1 The [European Digital Identity Regulation] about Pseudonyms

#### 2.1.1 Articles

There are two main requirements in the [European Digital Identity Regulation] about Pseudonyms in relation to Wallet Units:

1. Wallet Units must be able to generate pseudonyms and store them encrypted and locally within the Wallet Unit.
2. Relying Parties must accept identification via pseudonyms when there are no legal requirements for identification.

Below are the actual Articles from the Regulation that establish these requirements.

**Article 5 Pseudonyms in electronic transaction**

*Without prejudice to specific rules of Union or national law requiring users to identify themselves or to the legal effect given to pseudonyms under national law, the use of pseudonyms that are chosen by the user shall not be prohibited.*

**Article 5a European Digital Identity Wallets**

*... 4. European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, transparent, and traceable by the user, to:\
...\
(b) generate pseudonyms and store them encrypted and locally within the European Digital Identity Wallet;\
...*

**Article 5b European Digital Identity Wallet-Relying Parties**

*9. ... Relying parties shall not refuse the use of pseudonyms, where the identification of the user is not required by Union or national law. ...*

Note: Additionally, pseudonyms are mentioned in Article 32 and Annex IV about the validation of qualified electronic signatures and certificates. However, the use of pseudonyms in this context is completely independent from the notion of pseudonyms used by the Wallet Unit for authentication, as discussed in this discussion paper.

#### 2.1.2 Recitals

In addition to the Articles listed in the previous section, pseudonyms are also mentioned in the following recitals:

**Recital (19)**

*... Reliance on the legal identity should not hinder European Digital Identity Wallet users to access services under a pseudonym, where there is no legal requirement for legal identity for authentication. ...*

**Recital (22)**

*European Digital Identity Wallets should include a functionality to generate user-chosen and managed pseudonyms, to authenticate when accessing online services.*

**Recital (57)**

*Where very large online platforms within the meaning of Article 33(1) of Regulation (EU) 2022/2065 of the European Parliament and of the Council require users to be authenticated in order to access online services, those platforms should be required to accept the use of European Digital Identity Wallets upon the voluntary request of the user. Users should be under no obligation to use a European Digital Identity Wallet to access private services and should not be restricted or hindered in their access to services on the grounds that they do not use a European Digital Identity Wallet. However, if users wish to do so, very large online platforms should accept them for that purpose, while respecting the principle of data minimisation and the right of the users to use freely chosen pseudonyms. ...*

**Recital (60)**

*Unless specific rules of Union or national law require users to identify themselves, accessing services by using a pseudonym should not be prohibited.*

### 2.2 [CIR.2024.2979] about Pseudonyms

#### 2.2.1 Articles

[CIR.2024.2979] specifies three main requirements for pseudonyms:

1. [WebAuthn] defines the technical specification for pseudonyms.
2. The pseudonyms the wallet Unit generates must be unique for each Relying Party.
3. The pseudonyms can be used either stand-alone or in combination with other attested attributes.

Below are the actual Articles from the CIR that establish these requirements:

**Article 14**

*1. Wallet units shall support the generation of pseudonyms for wallet users in compliance with the technical specifications set out in Annex V.\
2. Wallet units shall support the generation, upon the request of a wallet-relying party, of a pseudonym which is specific and unique to that wallet-relying party and provide this pseudonym to the wallet-relying party, either standalone or in combination with any person identification data or electronic attribute attestation requested by that wallet-relying party.*

**Annex V:**

*TECHNICAL SPECIFICATIONS FOR PSEUDONYM GENERATION REFERRED TO IN ARTICLE 14\
\
Technical specifications:\
\
— WebAuthn – W3C Recommendation, 8 April 2021, Level 2, https://www.w3.org/TR/2021/REC-webauthn-2-20210408/.*

#### Recitals

In addition to the Articles listed in the previous section, pseudonyms are also mentioned in the following recitals:

**Recital (14)**

*The generation of wallet-relying party specific pseudonyms should enable wallet users to authenticate themselves without providing wallet-relying parties with unnecessary information. As set out in Regulation (EU) No 910/2014, wallet users are not to be hindered from accessing services under a pseudonym, where there is no legal requirement for legal identity for authentication. Therefore, the wallets are to include a functionality to generate user-chosen and managed pseudonyms, to authenticate when accessing online services. The implementation of the specifications set out in Annex V should enable these functionalities accordingly. Further, wallet-relying parties are not to request users to provide any data other than those indicated for the intended use of wallets in the relying party register. Wallet users should be enabled to verify the registration data of relying parties at any point in time.*

## 3 Use Cases

This chapter elaborates on the use cases inferred from the above legal requirements. The distinction between the two use cases follows from Article 14 (2) in [CIR.2024.2979].

Both use cases are described in a remote setting, where the pseudonyms are presented towards Relying Parties over the internet.

### 3.1 Use Case A: Pseudonymous Authentication

Pseudonyms can be used to authenticate a User when it is not necessary for a Relying Party to learn the identity of a user.

Concretely, the use case is as follows:

1. A User registers a pseudonym at a Relying Party, using their Wallet Unit.
2. The User can afterwards do a series of interactions with this Relying Party.
3. If the User at a later point wishes to build upon previous interactions with this Relying Party, they should then be able to authenticate with the pseudonym used when registering. Thereby, the User "logs in" to the same account at the Relying Party. The User uses their Wallet Unit to perform this pseudonymous authentication.

### 3.2 Use Case B: Presentation of Attributes with Subsequent Authentication using Pseudonyms

Similar to use case A above, a User wishes to create an account with an associated pseudonym that can be used for subsequent authentication at later sessions. However, in this scenario the User additionally would like to register verifiable attributes in the form of either Person Identification Data (PID), Qualified Electronic Attestation of Attributes (QEAAs), Electronic Attestation of Attributes issued by or on behalf of a public sector body responsible for an authentic source (PuB-EAA), or non-qualified Electronic Attestation of Attributes (EAAs) while registering.

Concretely, the use case goes as follows:

1. A User registers a pseudonym at a Relying Party, using their Wallet Unit.
2. In the same interaction, the User also presents attributes from a PID or attestation in their Wallet Unit to the Relying Party.
3. The User can afterward do a series of interactions with this Relying Party.
4. If the User at a later point wishes to build upon previous interactions with this Relying Party, they should then be able to authenticate with the pseudonym used when registering. Thereby, the User "logs in" to the same account at the Relying Party. The User uses their Wallet Unit to perform this pseudonymous authentication.

### 3.3 Questions Related to Use Cases

Below, we list questions that have been discussed at the focus meetings along with a summary of the discussions.

**Question 1:** Should any other use cases be supported?

> It should be possible to register attributes to the pseudonym later than at registration. 

**Question 2:** For both use cases: Should both cross-device and same-device flows be supported?
I.e., should registration and authentication with pseudonyms be possible both when a user initiates the interactions with the Relying Party from the same device and with a device different from the one hosting the Wallet Unit? The answer to this question will impose requirements on the interfaces between the Wallet Unit and the client a user initiates the interaction with.

> Yes: Both cross-device and same-device flows should support pseudonyms

**Question 3:** For Use Case A: Should a single user be able to use their Wallet Unit to present several different pseudonyms to a single Relying Party? High-Level Requirements must be defined that enforces the answer to this question.

> Yes: It should be possible for a user to have several pseudonyms at the same Relying Party.

**Question 4:** For both use cases: What assurances must be given to the Relying Party? Such possible assurance exists on at least three levels:

1. No assurances are given to the Relying Party. I.e., the Relying Party is not even guaranteed that it is interacting with the Wallet Unit.
2. The Relying Party is assured that the private key corresponding to the pseudonym being stored/authenticated *was* originally stored in a Wallet Unit.
3. The Relying Party is assured that the private key corresponding to the pseudonym being stored/authenticated *is* currently stored in a non-revoked Wallet Unit.
4. For use case B: The Relying Party is assured that the private key corresponding to the pseudonym used to authenticate is stored on the same Wallet Unit as the originally presented PID or attestation.

> There should be some assurance that keys are stored securely and option 4.

Note that, because the technical implementation of pseudonyms must rely on [WebAuthn], the possibility for achieving such assurances is to use attestations (for an explanation of this see [Chapter 4](#4-high-level-approach-to-pseudonyms)).
Therefore, higher assurances comes with a trade-off in terms of surveillance risks.
For a further discussion of these risks see [Chapter 5.1](#51-topic-a-privacy-risks-and-mitigations)).

## 4 High-Level Approach to Pseudonyms

### 4.1 Introduction to Passkeys

As specified in [CIR.2024.2979], [WebAuthn] defines the technical specification for pseudonyms.

Passkeys are a widely used type of credential which are created and asserted using the [WebAuthn] API.

Passkeys are to be seen as an alternative to passwords.
The idea is that a User, when registering a user account at a service, uses a secure device to generate a public-private key pair, registers the public key at the service, and can then subsequently use the private key to authenticate towards the service at later points in time.

In a bit more detail, the flow for using such passkeys follows the following blueprint:

**Registration:**

1. The User generates a public-private key pair and stores both the public and the private key at their secure device (referred to as an authenticator).
2. The User registers the public key at the desired Relying Party service.

**Authentication:**

1. When the User wishes to authenticate towards a service, the service will send them a challenge consisting of a random value.
2. The User uses the private key stored on their secure device to sign the challenge and sends this back to the service.
3. The service verifies that the signature on the challenge can be verified using the registered public key. If the signature verifies and the origin matches the expected origin, the User is considered authenticated and thereby granted access to the service.

### 4.2 Introduction to [WebAuthn]

#### 4.2.1 Overview

[WebAuthn] defines an API for the creation and use of Passkeys. Conceptually, in addition to the User, there are four different logical components in this specification:

- **Relying Party Server:** The Relying Party that wishes to offer a service based on authentication using Passkeys.
- **Relying Party Client:** The program provided by the Relying Party that runs in the Client of the User and communicates with the Relying Party Server. The Relying Party Client is typically some JavaScript code, provided by the Relying Party, that runs on the Client (i.e., browser).
- **Client:** The client that the User uses to interact with the Relying Party's server and with the User's authenticator. The Client can be thought of as the browser that the User uses to access the Relying Party's service.
- **Authenticator:** The device controlled by the User to create, store, and use the Passkeys. In the context of the EUDI Wallet, the Wallet Unit is the Authenticator.

Note that the Relying Party Client and the Client are two programs that are executed on the same physical machine.

[WebAuthn] defines a model dividing the responsibilities between these different entities and defines an interface between the Relying Party Client and the Client. Additionally, it defines a challenge/response protocol to authenticate with Passkeys. The interface is referred to as the *WebAuthn API*.

However, [WebAuthn] does not specify how the Authenticator and the Client must communicate. In this context, [Chapter 5](#5-relation-to-other-topics) briefly discuss the relation to [Topic F (Digital Credential API)](./f-digital-credential-api.md) .

[WebAuthn] relies on several different types of identifiers, including:

- **Relying Party ID:** An identifier unique to the Relying Party, which must be a valid domain string. This what the User will identify the Relying Party by and let the Authenticator learn which Relying Party is asking for registration/authentication.
- **Credential ID:** A unique identifier chosen by the Authenticator for each Passkey.
- **User ID:** An identifier unique to each User, which is assigned by the Relying Party. This will be provided to the Authenticator when registering a new Passkey. Subsequently, it will be provided by the Authenticator when authenticating towards the Relying Party. The Authenticator will keep track of which Passkeys are available for which User IDs and Relying Party IDs. The Relying Party keeps track of a User Name for each User ID.
- **User Name:** An alias that may be chosen by the User or the Relying Party and assigned to a specific Passkey on the Authenticator. This allows the User to easily distinguish and select which Passkey they want to authenticate with, if several are present in the Authenticator for the given Relying Party.

The next sections elaborate on how the different components work together to allow the registration and subsequent authentication using Passkeys.

#### 4.2.2 Registration

The flow for registering a Passkey in [WebAuthn] is the following:

0. The User requests (out of band of WebAuthn) the Relying Party to create a new Pseudonym.
1. The Relying Party Server creates a challenge and sends this along with the User ID, the Relying Party ID, and the User Name to the Relying Party Client.
2. The Relying Party Client forwards the information to the Client using the WebAuthnAPI.
3. The Client checks that the Relying Party ID is consistent with the caller's origin and forwards the information to the Authenticator along with other contextual data.
4. The Authenticator authenticates the User (for example using a PIN or via biometrics). It then generates a new key pair with a new Credential ID and set the scope of this to the specific Relying Party ID and User ID. Finally, the Authenticator may generate an attestation (explained in [Section 4.2.3](#423-pseudonym-attestation)) and sends this, as well as the public key and its Credential ID, to the Client.
5. The Client then forwards the information to the Relying Party Client that again forwards it to the Relying Party Server.
6. The Relying Party Server verifies the attestation and registers the received public key for this User ID.

Note that the Authenticator stores the public key in a way such that it is scoped uniquely to a specific Relying Party, aligning with the requirements of [CIR.2024.2979], Article 14 (2), which states that the pseudonyms must be unique to each Relying Party.

#### 4.2.3 Pseudonym attestation

The term 'attestation' is here used differently than elsewhere in the ARF.
In this context, the attestation is not about attributes of the User, but rather about attributes of the Authenticator. The attestation serves to ensure the Relying Party that they are talking with an Authenticator with certain attributes. The attestation often takes the form of a signature on the challenge as well as some other contextual data.

In [WebAuthn], five different types of attestations are mentioned:

- **Basic Attestation:** The Authenticator stores a single master public and private key. The private key is used to sign all attestations and a certificate on the public key is included in the attestation data to allow the Relying Party to verify the signature.

- **Attestation CA:** Similar to the above, in the sense that the Authenticator stores a single master public and private key stored. However, instead of using this to attest Passkeys, the Authenticator uses this to authenticate towards a Certificate Authority (CA), which is then configured to issue certificates to the Authenticator on multiple attestation key pairs.

- **Anonymisation CA:** Similar to the second bullet above, except that it is explicit that the Authenticator requests a certificate for a new attestation key pair per generated Passkey.

- **Self Attestation:** The attestation is signed with the private key of the newly generated key pair in the Passkey. Note that this does not give any guarantees for the Relying Party about the authenticator they are interacting with.

- **No Attestation Statement:** No attestation is given. Note that this does not give any guarantees for the Relying Party about the Authenticator they are interacting with.

Please note that Article 5a (5) a) viii) of the [European Digital Identity Regulation] states "*European Digital Identity Wallets shall, in particular support common protocols and interfaces: ... for relying parties to verify the authenticity and validity of European Digital Identity Wallets;...*". The latter two forms of attestation do not align with this requirement. [Section 5.1](#51-topic-a-privacy-risks-and-mitigations)) discusses how the other three possibilities relate to previously identified privacy risks about user surveillance (see also [Topic A](./a-privacy-risks-and-mitigations.md)).

#### 4.2.4 Authentication

The flow for authentication using a Passkey following [WebAuthn] is:

1. The Relying Party Server creates a challenge and sends this along with its Relying Party ID to the Relying Party Client.
2. The Relying Party Client forwards the information to the Client using the WebAuthn API.
3. The Client checks that the Relying Party ID is consistent with the caller's origin and forwards the information to the Authenticator along with other contextual data.
4. The Authenticator authenticates the User (for example using a PIN or via biometrics). It then prompts the User to select one of the Passkeys scoped to this Relying Party ID, if there are multiple. For this step the User Name can be presented to the User. Finally, the Authenticator uses the private key of the chosen key pair (= Passkey) to sign the challenge as well as some contextual data including the User ID, Credential ID, and the Relying Party ID. The Authenticator then sends this to the Client.
5. The Client forwards the information to the Relying Party Client, which again forwards it to the Relying Party Server.
6. The Relying Party Server verifies the signature with the stored public key for this User ID and Credential ID, and, depending on the outcome of this verification, considers the User to be authenticated.

### 4.3 Challenges

This section list challenges related to the use of [WebAuthn] as the technical specification for pseudonyms:

1. Attestations may be linkable; see discussion in [Section 5.1](#51-topic-a-privacy-risks-and-mitigations) and also [Topic A](./a-privacy-risks-and-mitigations.md). This risk depends on the chosen type of attestation.
2. The information about the Relying Party is verified only by the Client and not by the Authenticator itself. This may be a problem, as in Article 5a (5) a) vii) of the [European Digital Identity Regulation] it is stated that "*European Digital Identity Wallets shall, in particular ... ensure that the relying parties can be authenticated and identified by implementing authentication mechanisms in accordance with Article 5b;...*".

## 5 Relation to Other Topics

This chapter discusses how pseudonyms relate to other topics being discussed.

### 5.1 Topic A: Privacy Risks and Mitigations

#### 5.1.1 Introduction

[Topic A - Privacy Risks and Mitigations](./a-privacy-risks-and-mitigations.md) discusses surveillance risks related to presenting PIDs and attestations. Similar concerns are relevant for the Pseudonym functionality defined by the [WebAuthn] specification. In fact, from a linkability perspective, there are only minor differences between the attestations present in the registration flow of [WebAuthn] and other attestations such as PID and (Q)EAAs. [Section 5.4](#54-relation-to-risk-register) discusses how this relates to the risks and threats identified in the [RiskRegister].

The subsections below consider two different types of linkability concerns for the attestation types summarised in [Section 4.2.3](#423-pseudonym-attestation), namely Relying Party linkability and CA linkability. Note that the latter form of linkability is similar to what is dubbed Attestation Provider linkability in the discussion Paper for Topic A, but there is a mismatch between the use of the word "attestation" in the broader ARF framework and in [WebAuthn] and to avoid confusion a different wording is used here.

#### 5.1.2 Relying Party Linkability

Relying Party linkability is the ability for Relying Parties to link together multiple authentications performed by a User using a Wallet Unit.
Note that it is inherent for the use cases that the **same** Relying Party shall be able to link together multiple presentations of a pseudonym, as it must be unique per Relying Party. However, **different** Relying Parties should not be able to infer any information about whether they have interacted with one or multiple Users by comparing multiple authentications using pseudonyms.

To prevent Relying Party linkability, it is necessary to ensure that no unique (per Wallet Unit) value is presented to multiple different Relying Parties. Depending on the type of attestation used for registration (see [Section 4.2.3](#423-pseudonym-attestation), this may or may not be the case for [WebAuthn].

If *Basic Attestations* are used, where each Wallet Unit holds only one attestation key pair and corresponding certificate, the public key of this attestation key pair may be such a unique value that is presented to multiple Relying Parties. [WebAuthn] suggests to ensure that multiple different Authenticators hold the same attestation key pair, thereby no longer making it a unique value for correlation. However, please note that this implies letting several different Wallet Units share the same private key. This is against best security practices, as it implies private keys must be transferred to or from Wallet Units, which increases the risk of keys being compromised.

If an *Attestation CA* is used to issue certificates on multiple attestation keys, the degree to which Relying Parties can correlate the different certificates can be reduced. However, as long as an Authenticator uses a single attestation key more than once to sign a Pseudonym, the Relying Parties can still deduce some information by correlating attestation public keys. This mitigation is similar to the proposals of Method B and Method C (Limited-time Attestations and Rotating-batch Attestations) from the discussion paper on topic A.

If an *Anonymisation CA* is used to issue certificates on single-use-only attestation keys, Relying Parties are not able to correlate information about multiple presentations. This can be referred to as being *Relying Party-unlinkable*.

Neither *Self Attestation* nor *No Attestation* allows Relying Parties to correlate information about multiple presentations of pseudonyms, as no attestation public key is released to the Relying Party. That is, they are Relying Party-unlinkable.

#### 5.1.3 CA Linkability

Certificate Authority (CA) linkability is the ability for a CA to track a User's interactions at several different Relying Parties by combining the information from those Relying Parties with information hold by the CA.

Note that all attestation types that are Relying Party-linkable also are CA-linkable by definition, as the information available to CAs and Relying Parties is a superset of the information available only to multiple Relying Parties.

Both the types *Attestation CA* and *Anonymisation CA* are CA-linkable as CAs can store which public key they issue certificates to and share with which Wallet Unit. By correlating this with the information available at the Relying Parties, it is possible to track how a Wallet Unit uses the pseudonym functionality.

Neither *Self Attestation* nor *No Attestation* includes any information from a CA and Relying Parties are therefore not able to correlate information about multiple presentations of pseudonyms with this form of attestation type. That is, they are both also CA-unlinkable.

#### 5.1.4 Drawbacks of Different Attestation Types

The table below summarises information from the previous sections with regard to drawbacks of the different attestation types.

| Attestation Type | Drawbacks |
|--------------------|---------------------------------------|
| Basic Attestations | Relying Party-linkable and CA-linkable |
| Attestation CA     | CA-linkable and to some degree Relying Party-linkable |
| Anonymisation CA   | CA-linkable |
| Self Attestation   | No assurances for Relying Parties |
| No Attestation     | No assurances for Relying Parties |

### 5.2 Topic C: Wallet Unit Attestations

[Topic C - Wallet Unit Attestations (WUA) and Key Attestations](./c-wallet-unit-attestation.md) discusses how the Wallet Unit can document its functional and security capabilities, e.g., support for secure hardware, revocation status, etc.

Certain WUA attributes are somewhat sensitive, as they may allow for linkability, and are only intended for PID Providers and Attestation Providers when performing issuance. Other metadata in the WUA is used to prove that the Wallet Unit has not been revoked. This information is less sensitive and is intended for Relying Parties.

When a Wallet Unit and a Relying Party perform registration of a pseudonym, key material will be stored on the Wallet Unit (in its role as Authenticator). During this registration, the WUA may be used in connection with the pseudonym attestation (discussed in [Section 4.2.3](#423-pseudonym-attestation)). Topic C should consider what information can be presented to a Relying Party, when registering a pseudonym.

There are two main areas of Topic C that are particularly relevant in relation to Pseudonyms:

- **Wallet Unit Attestation:** Part of the WUA contains information on functional and cryptographic capabilities of the Wallet Unit. Requirement WUA_24 says *A Wallet Unit SHALL release data related to the User device in a WUA only to a PID Provider or Attestation Provider, and not to a Relying Party or any other party.* This requirement effectively prohibits a number of the High-Level Requirements related to issuance of pseudonyms. Essentially, only the *Self Attestation* and *No Attestation* attestation types mentioned in [Section 4.2.3](#423-pseudonym-attestation) can be supported without access to the User device-related data in the WUA.

- **Revocation / invalidation of pseudonyms:** Pseudonyms are local to each Relying Party, which makes revocation somewhat easy: The Relying Party can simply invalidate the pseudonym locally and the Wallet Unit will no longer be able to access that Relying Party. This revocation will not affect other functionality of the Wallet Unit, e.g., other Pseudonyms, PID and attestations will remain valid. In addition to local revocation, it was discussed at a Focus meeting, if it should be possible for a Relying Party to also revoke the entire Wallet Unit. The outcome of this discussion, was that it should not be possible for Relying Parties to request the revocation of a Wallet Unit.

### 5.3 Topic F: Digital Credentials API

As stated in [Chapter 4](#4-high-level-approach-to-pseudonyms), [WebAuthn] does not specify the interface between the Wallet Unit (i.e., Authenticator) and the Client used by the User to initiate the usage of the pseudonyms.

[Discussion Topic F](./f-digital-credential-api.md) must also take into account providing a seamless integration for the use of pseudonyms.

### 5.4 Relation to Risk Register

As pseudonyms may be used to provide authentication, a large number of the risks listed in the risk register for European Digital Identity Wallets [RiskRegister] are (at least indirectly) related to the use of pseudonyms:

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 14%" />
<col style="width: 53%" />
</colgroup>
<thead>
<tr>
<th><strong>Risk type </strong></th>
<th><strong>Risk ID </strong></th>
<th><strong>Related risk titles </strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R2</td>
<td>Creation or use of a fake electronic identity</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R4</td>
<td>Identify theft</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R5</td>
<td>Data theft</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R6</td>
<td>Data disclosure</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R9</td>
<td>Unauthorised transaction</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R10</td>
<td>Transaction manipulation</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R14</td>
<td>Surveillance</td>
</tr>
</tbody>
</table>

Some of the Technical Threats from the [Risk Register] (threats labelled TTX.Y in its section III) are also relevant threats to consider in the context of pseudonyms. This is primarily TT5. Malicious actions, in which threats, such as TT5.1 Interception of information or TT5.3 Replay of messages, may lead to the risks expressed in the table above.

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
<th><strong>R5. Data theft</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Data theft is defined as the unauthorised extraction of data. Data theft is also associated to threats, such as data interception
(unauthorised capture of data in transit) and data decryption (unauthorised decoding of encrypted data), which are likely to
lead in some cases to Data disclosure (R6).</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R6. Data Disclosure</strong></th>
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
<th><strong>R10. Transaction manipulation</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Transaction manipulation is defined as the unauthorised alteration of operations in the wallet. Transaction manipulation is
an attack on integrity, and it is related to a data integrity breach.</td>
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

More specifically, \[RiskRegister\] describes the following threats in relation to pseudonyms:

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
<td>TR1</td>
<td>An attacker can revoke pseudonyms without justified reason.</td>
<td>Creation or use of a fake electronic identity (R2)
</td>
</tr>
<tr>
<td>TR26</td>
<td>PID, (Q)EAAs or pseudonyms can be presented to a wrong relying party.</td>
<td>Data disclosure (R6)</td>
</tr>
<tr>
<td>TR39</td>
<td>An attacker can unlawfully trace wallet users using unique/traceable
identifiers.</td>
<td>Data disclosure (R6) and Surveillance (R14)</td>
</tr>
<td>TR51</td>
<td>An attacker can convince a user to share personal data (i.e. PID, EAA-s, pseudonyms, electronic signatures, logs and other data) with the attacker or with a third party that the user did not intend to do so.</td>
<td>Data theft (R5) / Data disclosure (R6)</td>
</tr>
<td>TR55</td>
<td>An attacker can bypass the user authentication method to use
a pseudonym generated by a wallet unit.
</td>
<td>Identity theft (R4)</td>
</tr>
<tr>
<td>TR84</td>
<td>A group of colluding relying parties or PID providers can derive the
user's identity data beyond data known to them.</td>
<td>Surveillance (R14)</td>
</tr>
<tr>
<td>TR85</td>
<td>An attacker can track and trace a user by using person
identification data of the user where identification of the user
is not required.</td>
<td>Surveillance (R14)</td>
</tr>
<tr>
<td>TR91</td>
<td>A relying party can replay elements from a previous session in
another session.</td>
<td>Transaction manipulation (R10)</td>
</tr>
<tr>
<td>TR102</td>
<td>An attacker can impersonate relying parties during the
connection to relying parties.</td>
<td>Unauthorised transaction (R9) / Data
disclosure (R6)</td>
</tr>
<tr>
<td>TR105</td>
<td>An attacker can perform man-in-the-middle attacks.</td>
<td>Unauthorised transaction (R9) / Data
disclosure (R6) / Surveillance (R14)</td>
</tr>
</tbody>
</table>

>Note that there is no threat corresponding to TR68-71 (Attacker can revoke without consent/reason) in relation to pseudonyms.

R14, SR1, TR39, and TR84 are particularly relevant to consider given the discussion in Chapter 5.1, namely linkability of attestations in [WebAuthn].

TR26, TR102, and TR105 are particularly relevant for the challenge described in Chapter 4.3, namely that the Relying Party is only authenticated by the Client and not by the Wallet Unit.

## 6 Additions and Changes to the ARF

This chapter proposes changes and additions to the ARF, including both High Level Requirements (HLRs) for Annex 2 Topic 11 (Pseudonyms) and changed to the ARF main document only to ensure user authentication via pseudonyms.

### 6.1 Additions and Changes to HLRs

The below HLRs will be added to the Annex 2, Topic 11 of the ARF.

#### 6.1.1 HLRs related to Use Cases

##### Requirement 1

A Wallet Unit SHALL enable a User to generate a Pseudonym and register this at a Relying Party.

> Rationale: This is necessary to support Use Case A and B.

##### Requirement 2

A Wallet Unit SHALL enable a User to authenticate with a Pseudonym towards a Relying Party if the Wallet Unit was used previously to register the Pseudonym for the same Relying Party.

> Rationale: This is necessary to support Use Case A and B.

> Note that requirement is only mandatory for Pseudonyms that were registered with the same Wallet Unit. However, Wallet Providers MAY add backup of pseudonyms to their Wallet Solution and thereby support this functionality also for pseudonyms registered with different Wallet Units.

##### Requirement 3

A Wallet Unit SHALL be able to perform the actions specified in the above two requirements independently of whether the interaction with the Relying Party is initiated on the same device hosting the Wallet Instance or on a device different from the one hosting the Wallet Instance.

> Rationale: Both cross-device and same-device flows must be possible.

##### Requirement 4

A Wallet Unit SHALL enable the User to use multiple different Pseudonyms at a given Relying Party.

> Rationale: It should be possible for a User to use their Wallet Unit in multiple contexts, for example work and personal accounts.

##### Requirement 5

A Wallet Unit SHOULD enable a User to freely choose a User alias for each Pseudonym registered at a Relying Party. Setting an alias SHOULD be optional for the User. The User SHOULD be able to change the alias for any Pseudonym.

>Rationale: Setting an alias helps the User to recognise and distinguish Pseudonyms, which otherwise may be meaningless sequences of symbols.

##### Requirement 6

A Wallet Unit SHALL enable a User to choose which Pseudonym to authenticate with towards a Relying Party, if multiple Pseudonyms are registered for this Relying Party. The Wallet Unit SHOULD present the User with the aliases of the applicable Pseudonyms, if assigned, when making this choice.

> Rationale: A User should be able to freely choose which Pseudonym to use if multiple are available.

##### Requirement 7

A Wallet Unit SHOULD enable a User to delete a Pseudonym.

> Rationale: A User should be enabled to choose if they no longer wishes to have a Pseudonym associated with their Wallet Unit.

##### Requirement 8

A Wallet Unit SHOULD enable to the User to manage pseudonyms within the Wallet Unit in a user-friendly and transparent manner. Users SHOULD be informed about when and with which Relying Party their pseudonyms were used and be able to view a complete transaction log (including canceled or unsuccessful transactions).

> Rationale: Users should be able to have full control over the pseudonyms functionality.

##### Requirement 9

A Wallet Unit SHOULD enable the User to see all existing pseudonyms, including the associated Relying Party.

> Rationale: Users should be able to have full control over the pseudonyms functionality.

#### 6.1.2 HLRs related to Relying Parties

##### Requirement 10

A Relying Party SHALL be able to verify that a User is registering a Pseudonym using a non-revoked Wallet Unit.

> Rationale: A Relying Party should be able to achieve a high level of trust in authentication performed using this Pseudonym when this is a requirement.

##### Requirement 11

A Relying Party SHALL be able to verify that a User is authenticating with a Pseudonym using a non-revoked Wallet Unit.

> Rationale: A Relying Party should be able to achieve a high level of trust in authentication performed using this Pseudonym when this is a requirement.

##### Requirement 12

If Wallet Unit is used to register a Pseudonym at a Relying Party in combination with a PID, attestation or WUA being presented to the same Relying Party, then this Relying Party SHALL be able to verify that the same User performed both actions.

> Rationale: A Relying Party should be able to be assured that they can trust subsequent authentications with the Pseudonym to have the properties as presented in the PID, attestation, or WUA.

> Note: The above *only* states the high-level requirement. Later technical specifications will define how this can be accomplished.

##### Requirement 13

The Relying Party SHALL be able to validate that the pseudonym presented to them belongs to the User presenting it.

> Rationale: To support both use cases it is necessary that *only* the rightful owner of a Pseudonym (i.e., the user having generated it) can use it to authenticate.

#### 6.1.3 HLRs related to Privacy

Note that the requirements WUA_02 and WUA_03 from Topic 9 ensures that a Wallet Unit must authenticate a User before Pseudonyms are viewed, created, or used to authenticate towards Relying Parties. We therefore do not think it is necessary to add further requirements related to this.

The placement of these HLRs will be discussed in Topic C.

Further, note that RPA_01 and RPA_03 from Topic 6 ensures that Wallet Units SHALL authenticate Relying Parties also in the Pseudonym use case. It is therefore not necessary to specify further HLRs related to this.

##### Requirement 14

A Wallet Unit SHALL store the information necessary for authenticating with a Pseudonym in their WSCD.

> Rationale: It is made explicit in Article 5a 4. b of [European Digital Identity Regulation] that the Pseudonyms must be stored encrypted.

##### Requirement 15

A Relying Party SHALL NOT be able to derive the User’s true identity, or any data identifying the User, from the Pseudonym value received by the Relying Party.

> Rationale: This is what makes a Pseudonym a Pseudonym, as opposed to an identifier.

##### Requirement 16

A Wallet Unit SHALL NOT reveal the same Pseudonym to different Relying Parties unless the User explicitly chooses otherwise.

> Rationale: This is important to ensure that colluding Relying Parties cannot use the Pseudonyms to track the User.

##### Requirement 17

It SHALL NOT be possible to correlate Pseudonyms based on their values nor on other metadata sent by the Wallet Unit during registration and authentication, meaning that colluding Relying Parties SHALL NOT able to conclude that different Pseudonyms belong to the same User.

> Rationale: If this was possible, it would defeat the purpose of using different Pseudonyms and would allow colluding Relying Parties to track the User.

##### Requirement 18

The Wallet Unit SHALL ensure that Pseudonyms contain sufficient entropy to make the chance of colliding Pseudonyms (meaning two Users having the same Pseudonym value for the same Relying Party) negligible.

> Rationale: If Pseudonym collision could occur in practice, User recognition by the Relying Party would fail, because the wrong User would be matched to another account and thereby the Relying Party could reveal sensitive information to a wrong User.

##### Requirement 19

A Wallet Unit MUST NOT share the user's optionally assigned Pseudonym aliases with any Relying Party.

> Rationale: The aliases are a convenience thing for users and they should be allowed to choose them as they like without having to consider whether it contains sensitive data or not.

##### Requirement 20

The Wallet Unit SHOULD be able verify the identity of a Relying Party when a User is registering a Pseudonym or authenticates with a Pseudonym.

> Rationale: The user should be able to trust whom they are using their Wallet Units to authenticate towards.

#### 6.1.3 HLRs for Interoperability

##### Requirement 21

The Commission SHALL create or reference a profile or extension of the WebAuthn specification compliant with the HLRs for this topic.

> Rationale: It must be ensured that the HLRs are conformant to a clear specification in an interoperable manner.

##### Requirement 22

Wallet Providers SHALL ensure that their Wallet Solution supports WebAuthn with additions and changes as documented in this document and future technical specifications created by or on behalf of the Commission.

> Rationale: This ensures that Relying Parties can implement a uniform interface to let any User register and authenticate with Pseudonyms if they have an EUDI Wallet.

#### 6.2 HLRs to be Removed

##### Requirement PA_01 from Topic 11

PA_01 states:

*A Wallet Unit SHALL be able to generate pseudonyms for its User, in compliance with the W3C WebAuthn API specification [W3C WebAuthn].*

> Rationale for removal: The requirements above make this requirement superfluous.

## 7 References

| Reference | Description |
|-----------------|-----------------|
| [WebAuthn] | Web Authentication: An API for accessing Public Key Credentials Level 2 W3C Recommendation, 8 April 2021, https://www.w3.org/TR/webauthn-2/ |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v1.0.|
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [CIR.2024.2979] | Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets |
