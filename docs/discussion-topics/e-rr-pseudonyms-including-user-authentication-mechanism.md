Version 1.0, updated 22 April 2026


[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/658)


# Topic E - Pseudonyms, including User authentication mechanism (Refinement Round)

### Legal notice: All legal information and excerpts documented in Section 2 is based on the European Digital Identity Regulation (EU) 2024/1183 and the current public consultation draft of the Commission Implementing Regulation for Relying Party registration. The latter is undergoing changes due to consultation process, and thus this document may need modification after the publication and approval of the final CIR.


## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the 2026 refinemend round (RR) version of Discussion Paper for the European Digital Identity Cooperation Group regarding Topic E: Pseudonyms including User Authentication Mechanism.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_This topic concerns the use of pseudonyms within the ARF, including associated user authentication mechanism, interaction with WebAuthn, account linking, and the use of pseudonym attestations. It also considers how pseudonyms relate to assurance levels and future privacy-enhancing technologies._

while the reason why Topic E is addressed in refinement round is​ as follows:

_Current ARF requirements leave open questions regarding when and how pseudonyms authentication should be used, the role of WebAuthn within or outside the wallet, and the implications for implementation consistency. There is also a need to clarify applicable LoA, standardize pseudonym attestation formats to avoid linkability, and clearly define what is in scope for 2026 deployments. As more advanced technologies such as ZKP mature, a staged refinement is required to provide near-term clarity while allowing for future evolution._


### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document. In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements related to pseudonyms - this part mostly the same as in the first discussion paper.
- Chapter 3 summarises the current state of discussion and the concept for implementation, as well as lists related HLRs. The ARF version referenced in this discussion paper is 2.8.0. 
- Chapter 4 discusses open issues and questions in reference to current approach and the long term strategy.
- Chapter 5 will, after completion of the refinement round, present additions and changes that will be made to HLRs as a result of the discussions.
- Chapter 6 will, after completion of the refinement round, present additions and changes that will be made to ARF main text or Technical Specifications as a result of the discussions.


## 2 Legal Requirements Related to Pseudonyms

The following legal texts impose requirements related to pseudonyms: 
- [European Digital Identity Regulation](https://eur-lex.europa.eu/eli/reg/2024/1183/oj),
- [CIR for protocols and interfaces](https://eur-lex.europa.eu/eli/reg_impl/2024/2982/oj/eng),
- [CIR for integrity and core functionalities](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng)

Below we recap the respective legal requirements from these sources.


### 2.1 The European Digital Identity Regulation about Pseudonyms

There are the following requirements in the [European Digital Identity Regulation] about pseudonyms in relation to Wallet Units:

1. Wallet Units must be able to generate pseudonyms and store them "encrypted" and "locally" within the Wallet Unit,
2. The User must be able to "choose" and "manage" pseudonyms,
3. Relying Parties must accept authentication with pseudonyms, when there are no legal requirements for identification.


Below are the actual excerpts, including the recitals and the articles that establish these requirements.

_Recital (19)_ 

_[...] Reliance on the legal identity should not hinder European Digital Identity Wallet users to access services under a pseudonym, where there is no legal requirement for legal identity for authentication. [...]_


_Recital (22)_

_European Digital Identity Wallets should include a functionality to generate user-chosen and managed pseudonyms, to authenticate when accessing online services._


_Recital (57)_

_Where very large online platforms within the meaning of Article 33(1) of Regulation (EU) 2022/2065 of the European Parliament and of the Council (15) require users to be authenticated in order to access online services, those platforms should be required to accept the use of European Digital Identity Wallets upon the voluntary request of the user. Users should be under no obligation to use a European Digital Identity Wallet to access private services and should not be restricted or hindered in their access to services on the grounds that they do not use a European Digital Identity Wallet. However, if users wish to do so, very large online platforms should accept them for that purpose, while respecting the principle of data minimisation and the right of the users to use freely chosen pseudonyms. Given the importance of very large online platforms, due to their reach, in particular as expressed in number of recipients of the service and economic transactions, the obligation to accept European Digital Identity Wallets is necessary to increase the protection of users from fraud and to secure a high level of data protection._


_Recital (60)_ 

_Unless specific rules of Union or national law require users to identify themselves, accessing services by using a pseudonym should not be prohibited._ 


_Article 5_

_Without prejudice to specific rules of Union or national law requiring users to identify themselves or to the legal effect given to pseudonyms under national law, the use of pseudonyms that are chosen by the user shall not be prohibited._


_Article 5a(4)(b)_

_European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, transparent, and traceable by the user, to [...] generate pseudonyms and store them encrypted and locally within the European Digital Identity Wallet;_ 


_Article 5b(9)_

_Relying parties shall be responsible for carrying out the procedure for authenticating and validating person identification data and electronic attestation of attributes requested from European Digital Identity Wallets. Relying parties shall not refuse the use of pseudonyms, where the identification of the user is not required by Union or national law._ 


_Article 5a(16)_

_The technical framework of the European Digital Identity Wallet shall: 
[...] 
(b) enable privacy preserving techniques which ensure unlikeability, where the attestation of attributes does not require the identification of the user.
[...]_


_Note: the term "pseudonyms" is also mentioned  in Article 32, Annex IV, V and VII. The use of pseudonyms in these contexts is completely independent from the notion of pseudonyms used by the Wallet Unit for authentication, as discussed in this paper._


### 2.2 CIR for Integrity and Core Functionalities about Pseudonyms

There are the following requirements in the [CIR for integrity and core functionalities] about pseudonyms in relation to Wallet Units:

1. [WebAuthn] is the technical specification for pseudonyms, the only as of now,
2. The pseudonyms the Wallet Unit generates must be unique for each Relying Party,
3. Inititation of pseudonym generation process comes from a Relying Party,
4. The pseudonyms can be used either stand-alone or in combination with presentation of attributes held in the Wallet Unit.

Below are the actual excerpts, including the recitals and the articles that establish these requirements.

_Recital (14)_

_The generation of wallet-relying party specific pseudonyms should enable wallet users to authenticate themselves without providing wallet-relying parties with unnecessary information. As set out in Regulation (EU) No 910/2014, wallet users are not to be hindered from accessing services under a pseudonym, where there is no legal requirement for legal identity for authentication. Therefore, the wallets are to include a functionality to generate user-chosen and managed pseudonyms, to authenticate when accessing online services. The implementation of the specifications set out in Annex V should enable these functionalities accordingly. Further, wallet-relying parties are not to request users to provide any data other than those indicated for the intended use of wallets in the relying party register. Wallet users should be enabled to verify the registration data of relying parties at any point in time._


_Article 14(1)_

_Wallet units shall support the generation of pseudonyms for wallet users in compliance with the technical specifications set out in Annex V._


_Article 14(2)_ 

_Wallet units shall support the generation, upon the request of a wallet-relying party, of a pseudonym which is specific and unique to that wallet-relying party and provide this pseudonym to the wallet-relying party, either standalone or in combination with any person identification data or electronic attribute attestation requested by that wallet-relying party._ 


_Annex V_ _(Note: the current text in [CIR for integrity and core functionalities])_

_Technical specifications for pseudonym generation referred to in Article 14 
Technical specifications: 
— WebAuthn – W3C Recommendation, 8 April 2021, Level 2, https://www.w3.org/TR/2021/REC-webauthn- 2-20210408/._


_Annex V_ _(Note: the new text proposed in the IA draft amending [CIR for integrity and core functionalities])_

_Technical specifications for pseudonym generation referred to in Article 14 
REQ-1: A wallet unit shall enable the user to store and generate a pseudonym by using any WebAuthn Authenticator of the user's choice. 
NOTE: WebAuthn is specified in Web Authentication: An API for accessing Public Key Credentials Level 2 – W3C Recommendation, 8 April 2021, https://www.w3.org/TR/2021/REC-webauthn-2-20210408/._


### 2.3 CIR for Protocols and Interfaces about Pseudonyms

The following requirements in the [CIR for protocols and interfaces] are applicable to pseudonyms in relation to Wallet Units:

1. The implementation of pseudonyms must enable that only the minimal necessary amount of data is transferred, only to the authorised relying parties.
2. The implementations of pseudonyms must enable unlinkability between different transactions and Relying Parties.
3. The implementations of pseudonyms must enable anonymity when authenticating with a pseudonym.

Below are the actual excerpts, including the recitals and the articles that establish these requirements.

_Recital (5)_ 

_[...] the technical infrastructure of the wallets should also be designed to ensure that only the minimal necessary amount of data is transferred only to the authorised relying parties, while keeping unlinkability between the different transactions. [...]_ 


_Article 3_ 

_Regarding the protocols and interfaces referred to in Articles 4 and 5, wallet providers shall ensure that wallet units: 
[...] 
(10) enable privacy preserving techniques which ensure unlinkability where the electronic attestations of attributes do not require the identification of the wallet user, when presenting attestations or person identification data across different wallet-relying parties._



## 3 State of Discussion and Current Concept  

### 3.1 Types of Pseudonyms

The following types of pseudonyms were considered in the initial discussion (see [Topic E initial discussion paper]):
- Verifiable Pseudonym: a pseudonym that allows a User to prove possession over the pseudonym and thereby authenticate as/under the pseudonym (perform pseudonymous authentication);
- Attested Pseudonym: a subtype of a Verifiable Pseudonym, allowing Relying Parties to verify that a third party has attested that the pseudonym is owned by a User;
- Scope Rate-Limited Pseudonym: a subtype of a Verifiable Pseudonym guaranteeing that the user is limited to control only a certain number of pseudonyms / pseudonymous authentications within the rate for a given scope. 

Additionally, other types of pseudonyms are possible, such as:
- Identity Derived Certified Pseudonym: a ZKP-based pseudonym, derived from an identity (a PID or an attestation), where ownership and link to the identity (PID/attestation) can be cryptographically verified, 
- Identity Derived Scope-Exclusive Pseudonym: same as Certified Pseudonym, where uniqueness can be cryptographically verified additionally. 



### 3.2 Use Cases

The following use cases were considered in the initial discussion (see [Topic E initial discussion paper](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/e-pseudonyms-including-user-authentication-mechanism.md)):
- Pseudonymous Authentication (Use Case A in the initial discussion) - where the User is authenticated to an RP with use of a pseudonym, previously generated and registered at the RP;
- Presentation of Attributes with Subsequent Pseudonymous Authentication (Use Case B in the initial discussion) - same as pseudonymous authentication, but where at generation/ registration of a new pseudonym some additional attributes are presented and registered by the RP (e.g. age over 18); 
- Pseudonymous Authentication with Presentation of Attributes (Use Case B')- Pseudonymous Authentication combined with presentation of attributes; similar to Use Case B, but where the attributes are presented at the time of a pseudonymous authentication; 
- Rate-Limited Participation (Use Case C in the initial discussion)- same as pseudonymous authentication, but where the number of allowed pseudonyms / pseudonymous authentication for a given RP is limited to a specific number;
- Linkable Pseudonymous Authentication (Use Case D in the initial discussion) - where the User is authenticated to multiple RPs with a single pseudonym.


### 3.3 Concept for Initial Implementation

The current concept defined in the ARF assumes use of WebAuthn/FIDO2-compliant authenticators to provide pseudonyms and pseudonymous authentication. In this implementation, the pseudonym is constituted by a public key and related "Credential ID" (as defined in [WebAuthn]) of a FIDO2 credential (being a PKI-based key-pair). Such a credential may have an alias, defined by the User at the Wallet Unit/Instance level. This alias may be FIDO2 credential's "User Name", as defined in [WebAuthn].

There are 3 possible implementations:

(1) Wallet Unit being itself an authenticator (based on WSCD or Wallet’s keystore or software-based),  
(2) Wallet Unit working with an external roaming authenticator,  
(3) Wallet Unit working with an external platform authenticator (embedded to the same device, but considered as external to the Wallet Unit).
 
The use of FIDO2 authenticators entails that each RP possess/uses a FIDO Server, to register FIDO2 credentials and authenticate User (with the FIDO2 credentials).

The FIDO2 credentials may be attested by a third party, confirming its origin; [WebAuthn] specifies five attestation options, which differ i.a. in respect to unlinkability and assurance characteristics:
- Basic Attestation,
- Attestation CA,
- Anonymisation CA,
- Self-Attestation,
- No Attestation
(see [Section 6.1](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/e-pseudonyms-including-user-authentication-mechanism.md#61-topic-a-privacy-risks-and-mitigations) of [Topic E Initial Discussion Paper]). 

This concept supports:
-  Verifiable and Attested pseudonym types,
-  Pseudonymous Authentication use cases (with and w/o presentation of attributes).

This concept does not support:
- Scope Rate-Limited Pseudonym types, 
- Rate-limited Participation and Linkable Pseudonymous Authentication use cases.

### 3.4 List of  HLRs

This section recaps all applicable HLRs, basing on ARF 2.8.0.

#### 3.4.1 Topic 11 - Pseudonyms

| **Index** |                **Requirement specification**                 | 
|-----------|--------------------------------------------------------------|
|     PA_01      | A Wallet Unit SHALL enable a User to generate a Pseudonym and register it at a Relying Party. _Note: For an attested pseudonym, pseudonym generation takes place by requesting the issuance of a pseudonym attestation. Pseudonym registration takes place by presenting the attestation._ |  
|     PA_02      | A Wallet Unit SHALL enable a User to authenticate with a Pseudonym towards a Relying Party if the Wallet Unit was used previously to register the Pseudonym for the same Relying Party |  
|     PA_03      | A Wallet Unit SHALL be able to perform the actions specified in the above two requirements independently of whether the interaction with the Relying Party is initiated on the same device hosting the Wallet Instance or on a device different from the one hosting the Wallet Instance. |  
|     PA_04      | A Wallet Unit SHALL enable the User to use multiple different Pseudonyms at a given Relying Party, unless it is explicitly designed as a scope rate-limited attestation.  |  
|     PA_05      | A Wallet Unit SHOULD enable a User to freely choose a User alias for each Pseudonym registered at a Relying Party. Setting an alias SHOULD be optional for the User. The User SHOULD be able to change the alias for any Pseudonym. |  
|     PA_06      | A Wallet Unit SHALL enable a User to choose which Pseudonym to authenticate with towards a Relying Party, if multiple Pseudonyms are registered for this Relying Party. The Wallet Unit SHOULD present the User with the aliases of the applicable Pseudonyms, if assigned, when making this choice. |
|     PA_07      | A Wallet Unit SHALL enable a User to delete a Pseudonym. |
|     PA_08      | A Wallet Unit SHALL enable the User to manage Pseudonyms within the Wallet Unit in a user-friendly and transparent manner. |
|     PA_09      | A Wallet Unit SHALL enable the User to see all existing pseudonyms, including the associated Relying Party (if any). |
|     PA_10      | A Relying Party SHALL be able to verify that a User is registering a Pseudonym using a non-revoked Wallet Unit.  |
|     PA_11      | A Relying Party SHALL be able to verify that a User is authenticating with a Pseudonym using a non-revoked Wallet Unit.  |
|     PA_12      | If Wallet Unit is used to register a Pseudonym at a Relying Party in combination with a PID, attestation or WUA being presented to the same Relying Party, then this Relying Party SHALL be able to verify that the same User performed both actions. |
|     PA_13      | The Relying Party SHALL be able to validate that the pseudonym presented to them belongs to the User presenting it.  |
|     PA_14      | A Wallet Unit SHALL store the information necessary for authenticating with a Pseudonym in a keystore. |
|     PA_15      | A Relying Party SHALL NOT be able to derive the User's true identity, or any data identifying the User, from the Pseudonym value received by the Relying Party. |
|     PA_16      | A Wallet Unit SHALL NOT reveal the same Pseudonym to different Relying Parties unless the User explicitly chooses otherwise. |
|     PA_17      | It SHALL NOT be possible to correlate Pseudonyms based on their values nor on other metadata sent by the Wallet Unit during registration and authentication, meaning that colluding Relying Parties SHALL NOT able to conclude that different Pseudonyms belong to the same User. |
|     PA_18      | The Wallet Unit SHALL ensure that Pseudonyms contain sufficient entropy to make the chance of colliding Pseudonyms (meaning two Users having the same Pseudonym value for the same Relying Party) negligible. |
|     PA_19      | A Wallet Unit SHALL NOT share the User's optionally assigned Pseudonym aliases with any Relying Party. |
|     PA_20      | The Wallet Unit SHALL verify the identity of a Relying Party when a User registers a Pseudonym or authenticates with a Pseudonym, provided the profile or extension of [W3C WebAuthn] meant in PA_21 enables the Wallet Unit to do this. In case the profile or extension does not enable this, the Wallet Unit SHALL trust the WebAuthn Client (i.e., the browser) to verify the Relying Party identity. _Note: [W3C WebAuthn] currently does not offer a way for an Authenticator (i.e., the Wallet Unit) to authenticate a Relying Party. Instead, the Client (i.e., the browser) will authenticate the Relying Party, using TLS._ |
|     PA_21      | The Commission SHALL create or reference a technical specification containing a profile or extension of the [W3C WebAuthn] specification compliant with the HLRs specified in this Topic. This specification SHALL contain all details necessary for Wallet Units and Relying Parties to generate, register, and use Pseudonyms. |
|     PA_22      | Wallet Providers MAY ensure that their Wallet Solution supports the HLRs defined for this topic by letting their Wallet Units perform the role of a WebAuthn authenticator following  the [W3C WebAuthn] specification and the technical specification referenced in requirement PA_21.  |
|     PA_23      | A protocol enabling scope rate-limited pseudonyms SHALL rely solely on algorithms included in the ECCG Agreed Cryptographic Mechanisms v2.0.  |
|     PA_24      | A protocol enabling scope rate-limited pseudonyms SHALL enable a Wallet Unit to allow a User to generate a scope rate-limited pseudonym, register this by a Relying Party, and prove that this is within the rate and scope restrictions determined by the Relying Party.  |
|     PA_25      | A protocol enabling scope rate-limited pseudonyms SHALL allow a Relying Party, when a User presents a scope rate-limited pseudonym, to verify that the rate is not exceeded for this User.  |
|     PA_26      | A protocol enabling scope rate-limited pseudonyms SHALL allow a Relying Party to choose the scope and rate when requesting a scope rate-limited pseudonym from a User. |
|     PA_27      | A protocol enabling scope rate-limited pseudonyms SHALL NOT allow any entity or collusion of entities not including the User, to link scope rate-limited pseudonyms of the same User when used across several different Relying Parties. This SHALL hold even if the scope and rate are identical across the different Relying Parties and both for registration and authentication of the scope rate-limited pseudonym. |
|     PA_28      | A protocol enabling scope rate-limited pseudonyms SHALL ensure that if the rate is larger than 1, a User's different pseudonyms SHALL be unlinkable for the same scope. This SHALL hold against any entity or collusion of entities, not including the User. Further, such protocol SHALL ensure that during registration or authentication with such pseudonym, it SHALL NOT be possible for the Relying Party to deduce any information about how many pseudonyms the User has already registered (except that it does not exceed the predetermined rate). |
|     PA_29      | A protocol enabling scope rate-limited pseudonyms SHALL ensure that no entity or collusion of entities, not including a User, is able to authenticate or register with a scope rate-limited pseudonym of this User. |
|     PA_30      | A Wallet Unit SHALL store cryptographic material necessary for authenticating as a scope rate-limited pseudonyms in either a WSCA/WSCD or in a keystore. |
|     PA_31      | A User's scope rate limited pseudonyms for a particular scope and rate SHALL be persistent over time even if they start using another Wallet Unit. |

#### 3.4.2 Other Topics

Herebelow is the list of HLRs relevant to the context, from the following topics:

- Topic 18 - Combined presentations of attributes,
- Topic 19 - User navigation requirements (Dashboard logs for transparency),
- Topic 40 - Wallet Instance installation and Wallet Unit activation and management,
- Topic 53 - Zero-Knowledge Proofs.


| **Index** |                **Requirement specification**                 | 
|-----------|--------------------------------------------------------------|
|     ACP_01	 | A Cryptographic Binding of Attestations scheme SHALL enable a WSCA/WSCD to prove that it manages two or more private keys, paired with two or more public keys provided to it by the Wallet Unit. Note: a)These public keys may be included in WUAs, PIDs, attestations, or pseudonyms. b) The proof may be transitive, so a proof that two keys are stored/managed in the same WSCA/WSCD may be done by proving these keys relate to each other via a third key (also stored in the WSCA/WSCD). . |
|    DASH_02	 | The Wallet Unit SHALL log all transactions executed through the Wallet Unit, including any transactions that were not completed successfully. This log SHALL include all types of transaction executed through the Wallet Unit: a) PID or attestation issuance and re-issuance transactions, b) PID or attestation presentation transactions, c) Wallet-to-Wallet transactions (see Topic 30), d) pseudonym registration or presentation transactions, e) signature or seal creation transactions (see Topic 16), f) data deletion requests sent to a Relying Party (see Topic 48), g) reports sent to a Data Protection Authority (see Topic 50), h) PID or attestation deletions by the User. Note: For the data to be logged for a data deletion request to a Relying Party or a report sent to a DPA, see Topic 48 and Topic 50, respectively. For other types of transaction, the data to be logged is specified in the requirements in this Topic. |
|      DASH_03c	 | For a pseudonym registration or presentation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) identifying information about the Relying Party, if known to the Wallet Unit, c) whether it is a pseudonym registration or pseudonym presentation transaction, d) in the case of non-completed transactions, the reason for such non-completion. Note: Regarding point b), see PA_20 in Topic 11.  |
|      DASH_03c	 | For a pseudonym registration or presentation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) identifying information about the Relying Party, if known to the Wallet Unit, c) whether it is a pseudonym registration or pseudonym presentation transaction, d) in the case of non-completed transactions, the reason for such non-completion. Note: Regarding point b), see PA_20 in Topic 11.  |
|      WIAM_15a	 |For the purpose of WIAM_15, the Wallet Instance SHALL enforce the activation of an OS-level User authentication mechanism with adequate security policies. _Note: ‘Adequate’ here means adequate for any operation excluding the issuance or presentation of PIDs, WUAs, and potentially other attestations at level of security High. This includes but is not limited to generating pseudonyms, accessing the transaction log (dashboard), data export and migration, requesting the erasure of personal data by a Relying Party, and reporting a Relying Party to a DPA_.  |
|      ZKP_04	 | A ZKP scheme SHOULD support the derivation of a verifiable User pseudonym, by combining an attribute value that is unique for the User with Relying Party-specific context (e.g., the Relying Party identifier) In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme SHALL provide support for the following functions: (i) generation of a request for the issuance of an attestation that includes a secret attribute unique to the User, without revealing this attribute to the Attestation Provider, (ii) generation of an attestation presentation that includes a verifiable pseudonym derived from the secret attribute, a Relying Party identifier, and context-related information. _Note: See section 4.1.5 of the Discussion Paper for Topic G._   |


## 4 Discussion 

### 4.1 Open Issues in Current Concept

#### 4.1.1 Cryptographic Binding of Pseudonyms and Attributes
The current concept (as summarised in Section 4.2) does not natively support:
- Presentation of Attributes with Subsequent Pseudonymous Authentication, 
- Pseudonymous Authentication with Presentation of Attributes.

This means that the pseudonym registration / pseudonymous authentication and presentations of attributes are separate processes, supported by unrelated specifications (WebAuthn/FIDO2 vs OID4VP/ISO18013-5). In consequence, there is no mechanism specified providing cryptographic binding of a pseudonym and (presented) attributes as a proof that they belong to the same User or come from the same Wallet Unit.
The current approach in the ARF is that such binding may be ensured by the RP with own means. In addition, this approach may impact User experience and increase complexity of the process at the RP side.

Such binding is out of the [WebAuthn] scope. And if the [WebAuthn] credential is stored in the Wallet’s key store (and not in WSCD as attestations keys), then such binding is even more problematic. However, this could be a possible area of future improvement and work at SDOs.

Therefore the following questions arise:

**QUESTION 1: Is such cryptoraphic binding desired? If so, should SDO's take initiative to enable cryptographic binding mechanism inherently for WebAuthn/FIDO2-based implementation? 
Or should the ARF's concept evolve to use other types of pseudonyms (such as Pseudonym Attestation or ZKP-based pseudonyms) that may provide such capability instead?**

#### 4.1.2 Support of Scope Rate Limited Pseudonyms

The current concept (summarised in Section 4.2) does not support the Scope Rate Limited Pseudonym type or the related Rate Limited Participation use case - WebAuthn/FIDO2 specification is not designed for this purpose.

**QUESTION 2: Should SDO's take initiative to enable Scope Rate-Limited Pseudonyms inherently for WebAuthn/FIDO2-based implementation? 
Or should the ARF's concept evolve to use other types of pseudonyms/solutions that would support such scenario instead?**

#### 4.1.3 Support of Linkable Pseudonymous Authentication

The current concept (summarised in Section 4.2) does not (directly) support the Linkable Pseudonymous Authentication use case - WebAuthn/FIDO2 specification is not designed for it. A work around could be to use a shared FIDO server by a group of RPs (sectorally linkable pseudonyms).

At the same time, linkable pseudonyms could be potentially implemented with other means, eg. use of Attested Pseudonyms.

**QUESTION 3: Should SDO's take initiative to enable Linkable Pseudonymous Authentication use case inherently for WebAuthn/FIDO2-based implementation?
Or should the ARF's concept evolve to use other types of pseudonyms/solutions (such as Pseudonym Attestation or ZKP-based pseudonyms) that would support such scenario instead?**

#### 4.1.4 Credential Attestation

As indicated in Section 4.3, there are five possible attestation schemes. Therefore it is desirable to indicate (profile) which of them are to be used or allowed.

**QUESTION 4: Which attestation options should or should not be allowed?**

### 4.2 Long-Term Strategy Discussion

#### 4.2.1 Use Cases, Anonymity and Unlinkability

Pseudonyms can be used in various contexts and use cases, such as:
- Pseudonymous Authentication (Use Case A)
- Presentation of Attributes with Subsequent Pseudonymous Authentication (Use Case B) 
- Pseudonymous Authentication with Presentation of Attributes (Use Case B') 
- Rate-Limited Participation (Use Case C);
- Sectoral Linkable Pseudonymous Authentication (Use Case D).

The use cases differ i.a. depending on the desired level of privacy protection and unlinkability:
- unlinkability accross RPs,
- unlinkability accross sectors (linkability inside a sector),
- unlinkability accross transactions,
- unlinkability from issuers,
- unlinkability from infrastructure players (eg. revocation status service providers, intermediaries).

Therefore it is desirable to define which use cases are relevant and should / shouldn't be supported mandatorily by the EUDI Wallets. 

**QUESTION 5: What use cases are relevant / shall be supported by the wallets? Are there any other use cases to be considered, not mentioned above?**

#### 4.2.2 Possible Implementations of Pseudonyms

The following possible implementation options of pseudonyms in the Wallet Solutions exist:
- WebAuthn/FIDO2 credentials,
- Attested Pseudonyms,
- ZKP-based Pseudonyms.

They differ between each other in reference to supported types of pseudonyms, use cases and unlinkability level (and possibly in other privacy-related characteristics). 
The following table presents basic characteristics of each option.

| Implementation                         | Characteristics                     |  Supported Use Cases and Pseudonym Types    | Comments    |
|----------------------------------------|-------------------------------------|---------------------------------------------|-------------|
|     WebAuthn/FIDO2 credentials         |  FIDO2 key pair, where the public-key (or its Credential ID parameter) is the pseudonym. Requires use of FIDO2 Server by an RP. The pseudonym is unique to and linkable by the RP. Ensures unlinkability across RPs and from infrastructure players. No cryptographic binding to attributes in the wallet. | Pseudonymous Authentication, Sectoral Linkable Pseudonymous Authentication (if a shared FIDO Server is used)  | Todays concept in ARF, specification available ([WebAuthn]) |
|     Attested Pseudonym         |  An EAA that contains pseudonym as an attribute. Limited, implementation dependent unlinkability. Cryptographic binding to (other) attributes in the wallet. | Pseudonymous Authentication, Presentation of Attributes with Subsequent Pseudonymous Authentication, Pseudonymous Authentication with Presentation of Attributes, Rate-Limited Participation, Sectoral Linkable Pseudonymous Authentication; plus Once-Only and Rotating Batch options| No dedicated specification.  |
|     ZKP-based Pseudonyms         |  A ZKP proof derived from a PID or an attestation. Enables unlinkability across RPs. Cryptographic binding to (other) attributes in the wallet. | Pseudonymous Authentication, Presentation of Attributes with Subsequent Pseudonymous Authentication, Pseudonymous Authentication with Presentation of Attributes, Rate-Limited Participation, Sectoral Linkable Pseudonymous Authentication  | Concept mentioned in ARF, no specification ready (W3C VCDM with BBS Cryptosuites may fit, but under development).  |

It is desirable to define which implementations are relevant and should or might not supported by the EUDI Wallets. 

**QUESTION 6: What implementations are relevant? Which shall be supported by the wallets? Are there any other implementation options to be considered, not mentioned above?** 

**QUESTION 7: What standards are necessary to support the desired implementation options?**

## 5 Proposals of Changes of HLRs

There are no change proposals at this stage. They may be defined as a result of the discussion this paper supports.


## 6 Additions and Changes to the ARF 

There are no change proposals at this stage. They may be defined as a result of the discussion this paper supports.


## 7 References

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [European Digital Identity Regulation] | [Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework](https://eur-lex.europa.eu/eli/reg/2024/1183/oj) |
| [CIR for protocols and interfaces] | [Commission Implementing Regulation (EU) 2024/2982 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards protocols and interfaces to be supported by the European Digital Identity Framework](https://eur-lex.europa.eu/eli/reg_impl/2024/2982/oj/eng) |
| [CIR for integrity and core functionalities] | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng) |
| [WebAuthn] | Web Authentication: An API for accessing Public Key Credentials Level 2 W3C Recommendation, 8 April 2021, https://www.w3.org/TR/webauthn-2/ |
| [Topic E Initial Discussion Paper] |   [E - Pseudonyms, including User authentication mechanism](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/e-pseudonyms-including-user-authentication-mechanism.md)  |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
