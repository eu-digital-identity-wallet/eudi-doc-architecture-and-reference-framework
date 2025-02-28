Version 0.5, updated 11 February 2025

# E - Pseudonyms, including User authentication mechanism

## 1 Introduction

### 1.1 Discussion Paper Topic Description
This document is the Discussion Paper for eIDAS Coordination Group regarding Topic E: Pseudonyms, including User authentication mechanism.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*High-level requirements for pseudonyms in the ARF need to be further detailed, including
specifying the use cases where pseudonyms should be applied.*

### 1.2 Key Words
This document uses the capitalized key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalized) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to pseudonyms.

- Chapter 3 explains two identified use cases for pseudonyms as well as lists open questions related to these use cases.

- Chapter 4 presents the technical approach to pseudonyms as well as highlights its challenges.

- Chapter 5 relates the topic to other topics being discussed and previously identified risks.

- Chapter 6 presents the additions and changes that will be made to the ARF as a result of discussing this topic with Member States.

## 2 Legal Requirements for Pseudonyms

There are two legal texts that impose direct requirements on the pseudonym functionality of the Wallet Units: [CIR.2024.2979] and [eiDAS 2.0].
Below we recap the respective legal requirements from these sources.

### 2.1 [eIDAS 2.0] about Pseudonyms
There are two main requirements in [eIDAS 2.0] about Pseudonyms in relation to Wallet Units:
1. Wallet Units must be able to generate pseudonyms and store them encrypted.
2. Relying Parties must accept identification via pseudonyms when there are no legal requirements for identification.

Below are the actual excerpts from the law including the recitals that establish these requirements.

**Recital (19)**

*... Reliance on the legal identity should not hinder European Digital Identity Wallet users to access services under a pseudonym, where there is no legal requirement for legal identity for authentication. ...*

**Recital (22)**

*European Digital Identity Wallets should include a functionality to generate user-chosen and managed pseudonyms, to authenticate when accessing online services.*

**Recital (57)**

*Where very large online platforms within the meaning of Article 33(1) of Regulation (EU) 2022/2065 of the European Parliament and of the Council require users to be authenticated in order to access online services, those platforms should be required to accept the use of European Digital Identity Wallets upon the voluntary request of the user. Users should be under no obligation to use a European Digital Identity Wallet to access private services and should not be restricted or hindered in their access to services on the grounds that they do not use a European Digital Identity Wallet. However, if users wish to do so, very large online platforms should accept them for that purpose, while respecting the principle of data minimisation and the right of the users to use freely chosen pseudonyms. ...*

**Recital (60)**

*Unless specific rules of Union or national law require users to identify themselves, accessing services by using a pseudonym should not be prohibited.*

**Article 5 Pseudonyms in electronic transaction**

*Without prejudice to specific rules of Union or national law requiring users to identify themselves or to the legal effect given to pseudonyms under national law, the use of pseudonyms that are chosen by the user shall not be prohibited.*

**Article 5a European Digital Identity Wallets**

*... 4.  European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, transparent, and traceable by the user, to:\
...\
(b) generate pseudonyms and store them encrypted and locally within the European Digital Identity Wallet;\
...*

**Article 5b European Digital Identity Wallet-Relying Parties**

*9. ... Relying parties shall not refuse the use of pseudonyms, where the identification of the user is not required by Union or national law. ...*


Additionally, pseudonyms are mentioned in Article 32 and Annex IV about the validation of qualified electronic signatures and certificates. Note that the use of pseudonyms in this article is orthogonal to the notion of pseudonyms used for authentication as discussed in this discussion paper.

### 2.2 [CIR.2024.2979] about Pseudonyms

[CIR.2024.2979] specifies three main requirements for pseudonyms:
1. [WebAuthn] defines the technical specification for pseudonyms.
2. The pseudonyms the wallet generates must be unique for each Relying Party.
3. The pseudonyms can be used either stand alone or in combination with other attested attributes.

Below are the actual excerpts from the law including the recitals that establish these requirements.

**Recital (14)**

*The generation of wallet-relying party specific pseudonyms should enable wallet users to authenticate themselves without providing wallet-relying parties with unnecessary information. As set out in Regulation (EU) No 910/2014, wallet users are not to be hindered from accessing services under a pseudonym, where there is no legal requirement for legal identity for authentication. Therefore, the wallets are to include a functionality to generate user-chosen and managed pseudonyms, to authenticate when accessing online services. The implementation of the specifications set out in Annex V should enable these functionalities accordingly. Further, wallet-relying parties are not to request users to provide any data other than those indicated for the intended use of wallets in the relying party register. Wallet users should be enabled to verify the registration data of relying parties at any point in time.*

**Article 14**

*1. Wallet units shall support the generation of pseudonyms for wallet users in compliance with the technical specifications set out in Annex V.\
2. Wallet units shall support the generation, upon the request of a wallet-relying party, of a pseudonym which is specific and unique to that wallet-relying party and provide this pseudonym to the wallet-relying party, either standalone or in combination with any person identification data or electronic attribute attestation requested by that wallet-relying party.*

**Annex V:**

*TECHNICAL SPECIFICATIONS FOR PSEUDONYM GENERATION REFERRED TO IN ARTICLE 14\
\
Technical specifications:\
\
— WebAuthn – W3C Recommendation, 8 April 2021, Level 2, https://www.w3.org/TR/2021/REC-webauthn-2-20210408/.*


## 3 Use Cases

Below, we elaborate on the use cases inferred from the above legal requirements.
The distinction between the two use cases follows from Article 14 2. [CIR.2024.2979].

Both use cases are described in an online non-proximity-based setting where the pseudonyms are presented towards services over the internet.

### 3.1 Use Case A: Pseudonymous Authentication

Pseudonyms can be used to authenticate a user when it is not necessary for a Relying Party to learn the identity of a user.

Concretely, the use case is as follows:
1. A user registers a pseudonym at a Relying Party using their Wallet Unit.
2. The user can afterwards do a series of interactions with this Relying Party.
3. If the user at a later point wishes to build upon previous interactions with this Relying Party they should then be able to authenticate with the pseudonym used for registering. Thereby, the user "logs in" to the same account at the Relying Party.
The user uses their Wallet Unit to perform this authentication.

### 3.2 Use Case B: Presentation of Attributes with Subsequent Authentication using Pseudonyms

Similarly, to above a user wishes to create an account with an associated pseudonym that can be used for subsequent authentication at later sessions.
However, in this scenario the user would like to register verifiable attributes in the form of either Person Identification Data (PID), Qualified Electronic Attestation of Attributes (QEAAs), or Electronic Attestation of Attributes (EAAs) while registering.

Concretely, the use case goes as follows:
1. A user registers a pseudonym and presents PID or (Q)EAAs to a Relying Party using their Wallet Unit.
2. The user can afterward do a series of interactions with this Relying Party.
3. If the user at a later point wishes to build upon previous interactions with this Relying Party they should then be able to authenticate with the pseudonym used for registering. Thereby, the user "logs in" to the same account at the Relying Party.
The user uses their Wallet Unit to perform this authentication.

### 3.3 Questions Related to Use Cases

Below, we list open questions that must still be clarified related to the above two use cases.

**Question 1:** Should any other use cases be supported?

**Question 2:** For both use cases: Should both cross-device and same-device flows be supported?
I.e., should registration and authentication with pseudonyms be possible both when a user initiates the interactions with the Relying Party from the same device and with a device different from the one hosting the Wallet Unit? The answer to this question will impose requirements on the interfaces between the Wallet Unit and the client a user initiates the interaction with.

**Question 3:** For Use Case A: Should a single user be able to use their Wallet Unit to present several different pseudonyms to a single Relying Party? High-Level Requirements must be defined that enforces the answer to this question.

**Question 4:** For both use cases: What assurances must be given to the Relying Party? Such possible assurance exists on at least three levels:

1. No assurances are given to the Relying Party. I.e., the Relying Party is not even guaranteed that it is interacting with the Wallet Unit.
2. The Relying Party is assured that the private key corresponding to the pseudonym being stored/authenticated *was* originally stored in a Wallet Unit.
3. The Relying Party is assured that the private key corresponding to the pseudonym being stored/authenticated *is* stored in a non-revoked Wallet Unit.
4. For use case B: The Relying Party is assured that the private key corresponding to the pseudonym used to authenticate is stored on the same Wallet Unit as originally presented PID/(Q)EA.

Note that, because the technical implementation of pseudonyms must rely on [WebAuthn], the possibility for achieving such assurances is to use attestations (for an explanation of this see Chapter 4).
Therefore, higher assurances comes with a trade-off in terms of surveillance risks.
For a further discussion of these risks see Chapter 5.1.

## 4 High-Level Approach to Pseudonyms

As specified in [CIR.2024.2979], [WebAuthn] defines the technical specification for pseudonyms.

Passkeys are a widely used type of credential which are created and asserted using the [WebAuthn] API.

### 4.1 Introduction to Passkeys

Passkeys are to be seen as an alternative to passwords.
The idea is that a user, when registering a user account at a service generates a public-private key pair, registers the public key at the service, and can then subsequently use the private key to authenticate towards the service at later points in time.
In a bit more detail, the flow for using such passkeys follows the following blueprint.

**Registration:**
1. The user generates a public-private keypair and stores both public and private keys at their secure device (referred to as an authenticator).
2. The user registers the public key at the desired service.

**Authentication:**
1. When a user wishes to authenticate towards a service, the service will send them a challenge consisting of a random value.
2. The user uses the private key stored on their secure device to sign the challenge and sends this back to the service.
3. The service verifies that the signature on the challenge verifies using the preregistered public key. If the signature verifies and the origin matches as expected, the user is considered authenticated and thereby granted access to the service.

### 4.2 Overview of [WebAuthn]

[WebAuthn] defines an API for the creation and use of passkeys. Conceptually, in addition to the user, there are four different logical components in this specification:

- **Relying Party Server:** The Relying Party that wishes to offer a service based on authentication using passkeys.
- **Relying Party Client:** The program provided by the Relying Party that runs in the client of the user and communicates with the Relying Party Server.
- **Client:** The client that the user uses to interact with the Relying Party's server and their Authenticator.
- **Authenticator:** The device controlled by the user to create, store, and use the passkeys.

[WebAuthn] defines a model dividing the responsibilities between these different entities and defines an interface between the Relying Party Client and the Client. Additionally, it defines a challenge/response protocol to authenticate with passkeys.
The interface is referred to as the *WebAuthn API*.
However, [WebAuthn] does not specify how the Authenticator and the Client must communicate.
We briefly discuss the relation to Topic F in Chapter 5.

The Wallet Unit will act as an Authenticator in this setting.

Note that the Relying Party Client and the Client are two programs that are executed on the same physical machine.

[WebAuthn] relies on several different types of identifiers including:

- **Relying Party ID:** An identifier unique to the Relying Party which must be a valid domain string. This what the user will identify the Relying Party by and let the Authenticator learn which Relying Party is asking for registration/authentication.
- **Credential ID:** A unique identifier chosen by the Authenticator for each passkey.
- **User ID:** An identifier unique to each user that is assigned by the Relying Party. This will be provided to the Authenticator when registering a new passkey and subsequently provided by the Authenticator when authenticating towards Relying Party. The Authenticator will keep track of which passkeys are available for which User IDs and Relying Party IDs. The Relying Party keeps track of a User Name for each User ID.
- **User Name:** An alias that may be chosen by the user or the Relying Party and assigned to a specific passkey on the Authenticator. This allows the user to easily distinguish and select which passkey they want to authenticate with if several are present.

Below we elaborate on how the different components work together to allow the registration and subsequent authentication using passkeys.

#### 4.2.1 Registration

The flow for registering a passkey in [WebAuthn] is the following:

1. The Relying Party Server creates a challenge and sends this along with the User ID, the Relying Party ID, and the User Name to the Relying Party Client.
2. The Relying Party Client forwards the information to the Client using the WebAuthnAPI.
3. The Client checks that the Relying Party ID is consistent with the caller's origin and forwards the information to the Authenticator along with other contextual data.
4. The Authenticator authenticates the user (for example using a PIN or via biometrics). It then generates a new key pair with a new Credential ID and set the scope of this to the specific Relying Party ID and User ID. Finally, the Authenticator generates and "attestation" (explained below) and sends this as well as the public key and its Credential ID to the Client
5. The Client then forwards the information to the Relying Party Client that again forwards it to the Relying Party Server.
6. The Relying Party Server verifies the attestation and registers the received public key for this User ID.

Note that Authenticator stores the public key pair in a way such that it is scoped uniquely to a specific Relying Party aligning with the requirements of [CIR.2024.2979], Article 14 2, which states that the pseudonyms must be unique to each Relying Party.

The term attestation is here used differently than elsewhere in the ARF.
In this context, the attestation is not about attributes of the user, but rather about attributes of the Authenticator and is to ensure the Relying Party that they are talking with an Authenticator with certain attributes.
The attestation often takes the form of a signature on the challenge as well as some other contextual data.

In [WebAuthn], four different types of attestations are mentioned:

- **Basic Attestation:** The Authenticator has a single master public/private key stored.
This is used to sign all attestations and a certificate on the public key is included in the attestation data to allow the Relying Party to verify the signature.

- **Attestation CA:** Similar to the above in the sense that the Authenticator has a single master public/private key stored. However, instead of using this to attest pass keys, they use this to authenticate towards a Certificate Authority (CA), which is then configured to issue certificates to the Authenticator on multiple attestation key pairs.

- **Anonymization CA:** Similar to the above except that it is explicit that the Authenticator requests a certificate for a new attestation key pair per generated passkey.

- **Self Attestation:** The attestation is signed with the private key of the newly generated key pair in the passkey.
  Note that this does not give any guarantees for the Relying Party about which authenticator they are interacting with.

- **No Attestation Statement:** No attestation is given.
  Note that this does not give any guarantees for the Relying Party about which authenticator they are interacting with.

We note that Article 5a 5 a viii of [eIDAS 2.0] states  "*European Digital Identity Wallets shall, in particular support common protocols and interfaces: ... for relying parties to verify the authenticity and validity of European Digital Identity Wallets;...*". The latter two forms of attestation do not align with this requirement.


In Chapter 5.1, we discuss how the other relates to previously identified privacy risks about user surveillance (see also Topic A).

#### 4.2.2 Authentication

The flow for authenticating using a passkey following [WebAuthn] is:

1. The Relying Party Server creates a challenge and sends this along with its Relying Party ID to the Relying Party Client.
2. The Relying Party Client Client forwards the information to the browser using the WebAuthnAPI.
3. The Client checks that the Relying Party ID is consistent with the caller's origin and forwards the information to the Authenticator along with other contextual data.
4. The Authenticator authenticates the user (for example using a PIN or via biometrics).
   It then prompts the user to select one of the passkeys scoped to this Relying Party ID. For this step the User Name can be presented to the user.
   Finally, the private key of the chosen key pair is used to sign the challenge as well as some contextual data including the User ID, Credential ID, and the Relying Party ID.
   This is then sent to the Client.
5. The Client then forwards the information to the Relying Party Client that again forwards it to the Relying Party Server.
6. The Relying Party Server verifies the signature with its stored public key for this User ID and Credential ID and depending on the outcome of this verification considers the user authenticated.

### 4.3 Challenges

Below we list challenges related to the use of [WebAuthn] as the technical specification for pseudonyms.

- Attestations may be linkable (see discussion in Chapter 5.1 and also Topic A) depending on the chosen type of attestation.
- The information about the Relying Party is verified only by the Client and not by the Authenticator itself.
  This may be a problem as in Article 5a 5 a vii [eIDAS 2.0] it is stated that "*European Digital Identity Wallets shall, in particular ... ensure that the relying parties can be authenticated and identified by implementing authentication mechanisms in accordance with Article 5b;...*".

## 5 Relation to Other Topics

Below we discuss how pseudonyms relate to the other topics being discussed.

### 5.1 Privacy Risks and Mitigations

Topic A - Privacy Risks and Mitigations discusses surveillance risks related to presenting Person Identification Data (PID) and (Qualified) Electronic Attestations of Attributes (Q)EAA.
Similar, concerns are relevant for the pseudonyms functionality defined by the [WebAuthn] specification.
In fact, from a linkability perspective, there are only minor differences between the attestations present in the registration flow of [WebAuthn] and other attestations such as PID and (Q)EAAs.

In Chapter 5.3 we discuss how this relates to the risks and threats identified in the [RiskRegister].

Below we consider two different types of linkability concerns for the attestation types summarized in Chapter 4.2.1 namely Relying Party Linkability and CA Linkability.
The latter form of linkability is similar to what is dubbed Attestation Provider Linkability in the discussion Paper for Topic A, but there is a mismatch between the use of the word "attestation" in the broader ARF framework and in [WebAuthn] and to avoid confusion we, therefore, use a different wording here.

#### 5.1.1 Relying Party Linkability

Relying Party Linkability is the ability for Relying Parties to link together multiple authentications performed by a user using a Wallet Unit.
Note that it is inherent for the use cases that the same Relying Party must be able to link together multiple presentations of a pseudonym as it must be unique per Relying Party.
However, two or more Relying Parties should not be able to infer any information about whether they have interacted with one or multiple users by comparing multiple authentications using pseudonyms.

To prevent this, it is necessary to ensure there are no unique (per Wallet Unit) presented to multiple different Relying Parties. Depending on the attestation form used for Registration (see Chapter 4.2.1) this may or may not be the case for [WebAuthn].

If *Basic Attestations* are used where each wallet unit holds only one attestation key pair and corresponding certificate, the public key of this attestation key pair may be exactly such unique value that is presented to multiple Relying Parties.
In [WebAuthn] it is suggested to ensure that multiple different Authenticators hold the same attestation key pair thereby no longer making it a unique value for correlation.
We note that letting several different units share the same private key is against best practices, as it increases the risk of keys being compromised.

If an *Attestation CA* is used to issue certificates on multiple attestation keys, the degree to which Relying Parties can correlate the different certificates can be reduced. However, as long as attestation keys are used more than once, the Relying Parties can still deduce *some information* by correlating registrations of Pseudonyms.
The mitigation is similar to the proposals of Method B and Method C (Limited-time Attestations and Rotating-batch Attestations) from the discussion paper on topic A.

If an *Anonymization CA* is used to issue certificates on single-use-only attestation keys, Relying Parties are not able to correlate information about multiple presentations.
We refer to this as being *Relying Party unlinkable*.

Neither *Self Attestation* nor *No Attestation* allows Relying Parties to correlate information about multiple presentations of pseudonyms. That is they are Relying Party unlinkable.

#### 5.1.2 CA Linkability

Certificate Authority (CA) linkability is the ability to track a user's interactions at several different Relying Parties by combining the information from those Relying Parties with information from CAs (in case such exists).

Note that all the attestation types that are Relying Party linkable also are CA linkable by definition as the information available to CAs and Relying Parties is a superset of the information available only to multiple Relying Parties.

Both the types *Attestation CA* and *Anonymization CA* are CA linkable as CAs can store which public key that issue certificates to and share with which Wallet Unit. By correlating this with the information available at the Relying Parties it is possible to track how the different Wallet Unit uses the pseudonym functionality.

Neither *Self Attestation* nor *No Attestation* includes any information from a CA and Relying Parties are not able to correlate information about multiple presentations of pseudonyms with this form of attestation type. That is they are both also CA unlinkable.

#### 5.1.3 Drawbacks of Different Attestation Types

In the table below we summarize information from previous chapters w.r.t. drawbacks of the different attestation types.

| Attestation Type   | Drawbacks                                                   |
|--------------------|-------------------------------------------------------------|
| Basic Attestations | Relying Party and CA linkable                               |
| Attestation CA     | CA linkable and to some degree still Relying Party linkable |
| Anonymization CA   | CA linkable                                                 |
| Self Attestation   | No assurances for Relying Parties                           |
| No Attestation     | No assurances for Relying Parties                           |

### 5.2 Wallet Unit Attestations
>Note that Topic C - Wallet Unit Attestation has not yet been drafted and the following is based on assumptions on content

Topic C - Wallet Unit Attestations (WUA) And Key Attestations discusses how the Wallet Unit can document its functional and security capabilities, e.g., support for secure hardware, revocation status, etc.

Certain WUA elements are somewhat sensitive, as they may allow for linkability, and are only intended for PID and Attestation Providers, when performing issuance. Other parts of the WUA is used to prove that the Wallet Unit has not been revoked. This information is less sensitive and is intended for Relying Parties.

When a Wallet Unit and Relying Party performs registration of a pseudonym, key material will be stored on the Wallet Unit. This can be seen as a special case of issuance, in which the Relying Party acts the issuer and will be interested in what security guarantees the Wallet Unit can provide. Topic C should distinguish between a Relying Party acting as a Relying Party and Pseudonym issuer.

There are two main areas of Topic C that are particularly relevant in relation to Pseudonyms:

- **Wallet Trust Evidence:** Part of the WUA contains information on functional and cryptographic capabilities of the Wallet Unit (currently known as WTE). HLR WTE_24 *A Wallet Instance SHALL release a WTE only to a PID Provider or Attestation Provider, and not to a Relying Party or any other party.* states that an RP must not receive WTE information from the WU, however this prohibits a number of the HLRs related to issuance. Essentially, only the *Self Attestation* and *No Attestation* attestation types mentioned in Chapter 4.2.1 can be supported without access to WTE.

- **Revocation:** Pseudonyms are local to each Relying Party, which makes revocation somewhat easy: The Relying Party can simply invalidate the pseudonym locally and the Wallet Unit will no longer be able to access that Relying Party. This revocation will not affect other functionality of the Wallet Unit, e.g., other Pseudonyms, PID and attestations will remain valid. In addition to local revocation, it may be desireable for the Relying Party to be able to revoke the entire Wallet Unit. If this functionality is to be supported, there must be some kind of attestation (see Chapter 4.2.1) in place.

#### 5.2.1 Questions Related to Wallet Unit Attestation

Below, we list open questions that must still be clarified related to the interaction with WUA.

**Question 1:** Should a Relying Party be able to revoke more than just local pseudonyms?




### 5.3 Digital Credentials API

As stated in Chapter 4, [WebAuthn] does not specify the interface between the Wallet Units (i.e., Authenticators) and the Client used by the user to initiate the usage of the pseudonyms.
Discussion Topic F must also take into account providing a seamless integration for the use of pseudonyms.

### 5.4 Relation to Risk Register

As pseudonyms may be used to provide authentication, a large number of the risks listed
in the risk register for European Digital Identity Wallets \[RiskRegister\] are (at least indirectly)
related to the use of pseudonyms:

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

Some of the Technical Threats from the [Risk Register] (threats labelled TTX.Y in
its section III) are also relevant threats to consider in the context of pseudonyms. This is primarily
TT5. Malicious actions, in which threats, such as TT5.1 Interception of information or TT5.3 Replay of messages, may lead to the risks
expressed in the table above.

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

Pseudonyms can be used to support many different functionalities. In particular, at least: 
1. User authentication via. a pseudonym as envisioned in Use Case A and B. 
2. Pseudonyms with attested attributes that can be presented to Relying Parties, using the attributes. This can further come in at least two variants namely self-attested attributes and third-party attested attributes each being useful in different settings.

Below we propose changes and additions to the ARF both related to High Level Requirements (HLRs) for the topic and for the ARF main document only to ensure user authentication via pseudonyms.
There are no hindrances for member states or other actors to define for example additional attestation types that can be used to support for example pseudonyms with attested attributes. 
The below is merely a proposal for the minimal HLRs that must be fulfilled by all actors in the EUDI Wallet ecosystem related to the pseudonym and user authentication functionality.

### 6.1 Additions and Changes to HLRs
The below HLRs will be added to the Annex II, Topic 11 of the ARF.

#### 6.1.1 HLRs related to Use Cases

##### Requirement 1

A Wallet Unit SHALL enable a User to generate a Pseudonym and register this at a Relying Party.

> Rationale: This is necessary to support Use Case A and B.

##### Requirement 2

A Wallet Unit SHALL enable a User to authenticate with a Pseudonym towards a Relying Party if the Wallet Unit was used to previously register the Pseudonym for the same Relying Party.

> Rationale: This is necessary to support Use Case A and B.

> Note that requirement is only mandatory for Pseudonyms that was registered with the same wallet unit. There are however no hindrances for Wallet Providers to add backup of pseudonyms to their wallet solution and thereby support this functionality also for pseudonyms registered with different Wallet Units. 

##### Requirement 3

A Wallet Unit SHALL be able to perform the actions specified in the above two requirements independently of whether the interaction with the Relying Party is initiated on the same device as the Wallet Unit or on a device different from the Wallet Unit.

> Rationale: Both cross device and same-device flows must be possible.

##### Requirement 4

A Wallet Unit SHALL enable the User to use multiple different Pseudonyms at a given Relying Party.

> Rationale: It should be possible for a User to use their EUDIW both in a work and personal context and more Pseudonyms should therefore be possible.

##### Requirement 5

Wallet Unit SHOULD enable a User to freely choose a User alias for each Pseudonym registered at a Relying Party.
Setting an alias SHOULD be optional for the User.
The User SHOULD be able to change the alias for any Pseudonym.

>Rationale: Setting an alias helps the User to recognize and distinguish Pseudonyms, which otherwise may be meaningless sequences of symbols.

##### Requirement 6

A Wallet Unit SHALL enable a User to choose which Pseudonym to authenticate with towards a Relying Party if multiple Pseudonyms are registered for this Relying Party. The Wallet Unit SHOULD present the User with the alias of their of Pseudonyms, if assigned, when they make this choice.

> Rationale: A User should be able to freely choose which Pseudonym to use if multiple are available.

##### Requirement 7

A Wallet Unit SHOULD enable a User to delete a Pseudonym.

> Rationale: A User should be enableed to choose if they no longer wishes to have a Pseudonym associated with their Wallet Unit.

#### 6.1.2 HLRs related to Relying Parties

##### Requirement 8

A Relying Party SHALL be able to verify that a User is registering a Pseudonym using a non-revoked Wallet Unit.

> Rationale: A Relying Party should be able to achieve a high level of trust in authentication performed using this Pseudonym when this is a requirement.

##### Requirement 9

A Relying Party SHALL be able to verify that a User is authenticating with a Pseudonym using a non-revoked Wallet Unit.

> Rationale: A Relying Party should be able to achieve a high level of trust in authentication performed using this Pseudonym when this is a requirement.

##### Requirement 10
If Wallet Unit is used to register a Pseudonym at a Relying Party in combination with PID/(Q)EAAs/WUA being presented to the same Relying Party, then this Relying Party SHALL be able to verify that the same User performed both actions.

> Rationale: A Relying Party should be able to be assured that they can trust subsequent authentications with the Pseudonym to have the properties as presented int he PID/(Q)EAAs/WUAs.

> Note: The above *only* states the high-level requirement. Later technical specifications will define how this can be accomplished.

#### 6.1.3 HLRs related to Privacy
Note that the requirements WTE\_03 and WTE\_04 from Topic 9 ensures that a Wallet Unit must authenticate a User before Pseudonyms are, viewed, created or used to authenticate towards Relying Parties. We therefore do not think it is necessary to add further requirements realted to this. 

The placement of these HLRs will be discussed in Topic C.

Further, note that RPA\_01 and RPA\_03 from Topic 6 ensures that Wallet Units SHALL authenticate Relying Parties also in the Pseudonym use case. It is therefore not necessary to specify further HLRs related to this.

##### Requirement 11
A Wallet Unit SHALL store the information necessary for authenticating with a Pseudonym in their WSCD.

> Rationale: It is made explicit in Article 5a 4. b of [eiDAS 2.0] that the Pseudonyms must be stored encrypted.

##### Requirement 12

A Relying Party SHALL NOT be able to derive the User’s true identity, or any data identifying the User, from the Pseudonym value received by the Relying Party.

> Rationale: This is what makes a Pseudonym a Pseudonym, as opposed to an identifier.

##### Requirement 13

A Wallet Unit SHALL always release a different value for the Pseudonym of a given User to different Relying Parties unless the User explicitly chooses otherwise.

> Rationale: This is important to ensure that colluding Relying Parties cannot use the Pseudonyms  to track the User.

##### Requirement 14

It SHALL NOT be possible to correlate Pseudonyms based on their values nor on other data sent by the Wallet Unit during registration and authentication, meaning that colluding Relying Parties SHALL NOT able to conclude that different Pseudonyms belong to the same User.

> Rationale: If this was possible, it would defeat the purpose of using different Pseudonyms and would allow colluding Relying Parties to track the User.

##### Requirement 15

The Wallet Unit SHALL ensure that Pseudonyms contain sufficient entropy to make the chance of colliding Pseudonyms (meaning two Users having the same Pseudonym value for the same Relying Party) negligible.

> Rationale: If Pseudonym collision could occur in practice, User recognition by the Relying Party would fail, because the wrong User would be matched to another account and thereby the Relying Party could reveal sensitive information to a wrong User.

##### Requirement 16

A Wallet Unit MUST NOT share the user's optionally assigned Pseudonym aliases with any Relying Party.

> Rationale: The aliases are a convenience thing for users and they should be allowed to choose them as they like without having to consider whether it contains sensitive data or not.

### Requirement 17

The Wallet Unit SHOULD be able verify the identity of a Relying Party when a User is registering a Pseudonym or authenticates with a Pseudonym. 

> Rationale: The user should be able to trust whom they are using their Wallet Units to authenticate towards. 

#### 6.1.3 HLRs for Interoperability

##### Requirement 18

The Commission SHALL create or reference a profile or extension of the WebAuthn specification compliant with the HLRs for this topic.

> Rationale: It must be ensured that the HLRs are conformed to an in an interoperable manner.

##### Requirement 19

Wallet Providers SHALL ensure that their Wallet Solution supports WebAuthn with additions and changes as documented in this document and future technical specifications created by or on behalf of the Commission.

> Rationale: This ensures that Relying Parties can implement a uniform interface to let any User register and authenticate with Pseudonyms if they have an EUDIW.

#### 6.2 HLRs to be Removed

##### Requirement PA_01 from Topic 11

PA_01 states:

*Pseudonym Providers, Pseudonym attestations, and Wallet Instances SHALL comply with all applicable requirements in [Pseudonym Rulebook].*

> Rationale for removal: Pseudonym providers are no longer used for the Pseudonyms functionality.

## 7 References

| Reference       | Description                                                                                                                                                                                                                                                                          |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [WebAuthn]      | Web Authentication: An API for accessing Public Key Credentials Level 2 W3C Recommendation, 8 April 2021, https://www.w3.org/TR/webauthn-2/                                                                                                                                          |
| [ARF_DevPlan]   | Architecture and Reference Framework Development plan 2025, European Commission, v1,0.                                                                                                                                                                                               |
| [RiskRegister]  | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |
| [eIDAS 2.0]     | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework                                                                                        |
| [CIR.2024.2979] | Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets      |
