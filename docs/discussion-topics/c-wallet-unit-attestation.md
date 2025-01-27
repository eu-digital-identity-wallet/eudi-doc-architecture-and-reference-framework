Version 0.1, updated 24 January 2025

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

- Chapter 4 present possible technical approaches and their consequences to WUA.

- Chapter 5 presents issues in relation to privacy. 

- Chapter 6 relates the topic to other topics being discussed and previously identified risks.

- Chapter 7 presents the additions and changes that will be made to the ARF as a result of discussing this topic with Member States. 

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

* 5. Providers of person identification data shall ensure that person identification data that they issue is cryptographically bound to the wallet unit to which it is issued.\
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
(c) ensure wallet users have the right to request revocation of their wallet unit attestations, using the authentication mechanisms referred to in point (b).*

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

The legal requirements of Chapter 2 address different aspects related to Wallet Unit Attestation. The aspects cover interaction with the user (i.e. requirements in relation to the user interface), interaction with other parties (i.e. what WUA should be used for) and the WUA itself (i.e. essential information that should be contained in the WUA). This document will not go into requirements on the user interface, but will focus on how WUA may be used in connection with other parties.

The legal requirements in relation to the functional requirements of WUA can be summarized as the following functionality:

1. WUA information must allow relying parties, PID and attestation providers and other Wallet Units to validate the authenticity and revocation status of a WU.
2. Wallet Providers must be able to revoke a Wallet Unit.
3. Only the Wallet Providers of a Wallet Unit must be able to revoke that Wallet Unit.
4. It is the Wallets Providers responsibility to create the WUA.
5. PID issuers must be able to ensure their data is cryptographically bound to the wallet unit during issuance.

Similarly, the following requirements wrt. the WUA itself can derived:
1. The WUA must contain information, allowing parties to verify the validity of the WU, e.g., it originates from a trusted Wallet Provider.
2. The WUA must contain information, allowing parties to check if a WU has been revoked.
3. The WUA must contain a public key, where the corresponding private key is protected by a WSCD. 

> Question: are there any missing requirements?

The majority of requirements are fairly straight forward and easy to understand, however there are two topics that warrant further investigation:

[CIR.2024.2977] Article 3 states that:
* 5. Providers of person identification data shall ensure that person identification data that they issue is cryptographically bound to the wallet unit to which it is issued.*

The wording, _cryptographically bound_, of this is requirement may be interpreted in different ways. This interpretation, and the consequences of the interpretation, is discussed in Chapter 4.


[CIR.2024.2977] Article 5 states that:
* 4. Where providers of person identification data revoke person identification data issued to wallet units, they shall do so in each of the following circumstances:\
...\
(b) where the wallet unit attestation to which the person identification data was issued to has been revoked;*

The text states that providers of PID are obligated to revoke PID issued to a Wallet Unit, if that Wallet Unit is revoked. This implies that providers of PID are obliged to maintain a record of Wallet Units that have been issued PID and monitor the revocation status of these Wallet Units. Depending on how the WUA is constructed and how the above mentioned _cryptographic binding_ is done, it may be possible to make a revocation of the Wallet Unit automatically revoke any issued PID.




## 4 Technical approach to WUA
>TODO Discuss how the requirements can be implemented on abstract level, highlight that ultimately it is the Wallet Providers responsibility 

### Introduce "basic approach"
Attestation on WU public key, signed by Wallet Provider.
discuss pros, cons and limitations

### Key binding
Sketch problem we're trying to solve
(Short) Introduction to proof of association + hierarchical keys as possible techniques to solve the above problem
Details to be found/specified in other specification/documentation

Ultimately the Wallet Providers responsibility: Key should come from "secure area" but is ultimately decided by wallet provider - text in Annex 2 Topic 9 wrt. WSCA

### Revocation
Introduce how this can be done. Discuss pros/cons/limitations. 

### Details on WUA can be found in Rulebook
Content of Rulebook -> Annex / chapter 6?

### Relation to Pseudonyms
WebAuthN expects x.509 certs in relation to attestation, compatibility with mdoc / sd-jwt/?





## 5 privacy Issues 
-WUA as identifier - Linkability
-Revocation may also allow for linkability

-WUA (originally?) only intended for PID/Attestation providers - also needed by RP for revocation checks - Needs to be handled
-Highlight Selective disclosure as suggested solution

### Clarification before final paper:
Is "cryptographic bound" relevant to discuss?
Can we assume batch issuance to be a common practice for solving linkability issues?
Should we discuss the level of detail in relation to revocation - linkability?
Should we discuss how webauthn attestations are handled?

Should the Rulebook be moved to STS work? It is mainly technical and not really something that's suitable for discussion.



## 6 Relation to Other Topics
%Not updated for WUA yet
Below we discuss how wallet unit attestations relate to the other topics being discussed.

### 6.1 Privacy Risks and Mitigations

Topic A - Privacy Risks and Mitigations discusses surveillance risks related to presenting Person Identification Data (PID) and (Qualified) Electronically Attested Attributes (Q)EAA.
Similar, concerns are relevant for the pseudonyms functionality defined by the [WebAuthN] specification.
In fact, from a linkability perspective, there are only minor differences between the attestations present in the registration flow of [WebAuthN] and other attestations such as PID and (Q)EAAs.

In Chapter 5.3 we discuss how this relates to the risks and threats identified in the [RiskRegister].

Below we consider two different types of linkability concerns for the attestation types summarized in Chapter 4.2.1 namely Relying Party Linkability and CA Linkability.
The latter form of linkability is similar to what is dubbed Attestation Provider Linkability in the discussion Paper for Topic A, but there is a mismatch between the use of the word "attestation" in the broader ARF framework and in [WebAuthN] and to avoid confusion we, therefore, use a different wording here.

#### 6.1.1 Linkability
content from pseudonyms might be relevant

### 6.2 Psedonyms

Special case of above

### 6.3 Relation to Risk Register
>copied from pseudonyms not updated for WUA yet
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

R14, SR1, TR39, and TR84 are particularly relevant to consider given the discussion in Chapter 5.1, namely linkability of attestations in [WebAuthN].

TR26, TR102, and TR105 are particularly relevant for the challenge described in Chapter 4.3, namely that the Relying Party is only authenticated by the Client and not by the Wallet Unit.

## 7 Additions and Changes to the ARF

## 8 References

| Reference       | Description                                                                                                                                                                                                                                                                          |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [WebAuthN]      | Web Authentication: An API for accessing Public Key Credentials Level 2 W3C Recommendation, 8 April 2021, https://www.w3.org/TR/webauthn-2/                                                                                                                                          |
| [ARF_DevPlan]   | Architecture and Reference Framework Development plan 2025, European Commission, v1,0.                                                                                                                                                                                               |
| [RiskRegister]  | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |
| [eIDAS 2.0]     | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework                                                                                        |
| [CIR.2024.2979] | Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets      |
