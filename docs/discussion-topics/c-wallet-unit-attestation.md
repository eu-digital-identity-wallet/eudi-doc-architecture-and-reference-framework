Version 0.4, updated 14 March 2025

# C - Wallet Unit Attestation (WUA) and Key Attestation

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic C: Wallet Unit Attestation (WUA) and key attestation.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*Define high-level requirements for WUA as defined in the IAs of article 5a, and for the key attestation.*

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for functionality related to the Wallet Unit Attestation and key attestation.

- Chapter 3 discusses the high-level purpose of the Wallet Unit Attestation and introduces the two use cases for WUA.

- Chapter 4 relates the topic to other topics being discussed, and to previously identified risks.

- Chapter 5 presents the additions and changes that will be made to the ARF as a result of discussing this topic with Member States.

### Change log

- Changes for Version 0.3:
  - Added Chapter 3.1, describing the use cases WUA should support.
  - Updated revocation discussion in Chapter 3
  - Restructured the HLRs
  - Added, removed and changed HLR.
- Changes for Version 0.2:
  - Updated discussions on revocation and cryptographic binding
  - Changes to HLRs

Multiple legal texts impose direct requirements on the Wallet Unit Attestation, and impose requirements that are solved by using Wallet Unit Attestations: [CIR 2024/2977], [CIR 2024/2979], [CIR 2024/2982], and the [European Digital Identity Regulation]. This section recaps the respective legal requirements from these sources.

### 2.1 [European Digital Identity Regulation] about the Wallet Unit Attestation

 The [European Digital Identity Regulation] does not directly address the need for Wallet Unit Attestations. Rather, it requires that it should be possible to verify the authenticity and validity of a Wallet Unit.

Below are the actual excerpts from the Regulation, including the recitals and the Articles that establish these requirements.

**Recital (34)**

*The use of European Digital Identity Wallets as well as the discontinuation of their use should be the exclusive right and choice of users. Member States should develop simple and secure procedures for the users to request immediate revocation of validity of European Digital Identity Wallets, including in the case of loss or theft. Upon the death of the user or the cessation of activity by a legal person, a mechanism should be established to enable the authority responsible for settling the succession of the natural person or assets of the legal person to request the immediate revocation of European Digital Identity Wallets.*

**Article 5a European Digital Identity Wallets**

*... 4. European Digital Identity Wallets shall, in particular:\
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

### 2.2 [CIR 2024/2977] about the Wallet Unit Attestation

[CIR 2024/2977] specifies three main requirements related to the Wallet Unit Attestation:

1. PID issuers must ensure their data is cryptographically bound to the Wallet Unit during issuance.
2. PID issuers must verify that the Wallet Unit belongs to a trusted Wallet Solution.
3. Wallet Unit Attestations must support revocation.

Below are the actual excerpts from the CIR, including the recitals and the Articles that establish these requirements.

**Recital (10)**

*To protect the data of wallet users and to ensure the authenticity of electronic attestations of attributes, mechanisms
for the authentication of providers of electronic attestations of attributes, and for the verification of the authenticity
and validity of wallet units by that provider should apply prior to the issuance of the attestations to wallet units.*

**Article 3**

*5. Providers of person identification data shall ensure that person identification data that they issue is cryptographically bound to the wallet unit to which it is issued.*

*9. Before issuing person identification data to a wallet unit, providers of person identification data shall authenticate and validate the wallet unit attestation of the wallet unit and verify that the wallet unit belongs to a wallet solution the provider of person identification data accepts or use another authentication mechanism in accordance with an electronic identity scheme notified at assurance level high.*

**Article 5**

*4. Where providers of person identification data revoke person identification data issued to wallet units, they shall do so in each of the following circumstances:\
...\
(b) where the wallet unit attestation to which the person identification data was issued to has been revoked;*

### 2.3 [CIR 2024/2979] about the Wallet Unit Attestation

[CIR 2024/2979] specifies six main requirements related to the Wallet Unit Attestation:

1. Wallet Providers must ensure the Wallet Unit contains a Wallet Unit Attestation.
2. The WUA must contain a public key, where the corresponding private key is protected by a WSCD.
3. The WUA must be revocable only by the Wallet Provider that provided the WUA.
4. The Wallet Provider must have certain responsibilities in relation to the revocation of the WUA.
5. The WUA must contain information as to where revocation information can be found. This information must be made available in a privacy preserving manner.
6. In case a Wallet Unit requests the presentation of attributes from another Wallet Unit, relevant information contained in the WUA of the requesting Wallet Unit may be logged by the requested Wallet Unit.

Below are the actual excerpts from the CIR, including the recitals and the Articles that establish these requirements.

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

### 2.3 [CIR 2024/2982] about the Wallet Unit Attestation

[CIR 2024/2982] specifies four main requirements related to Wallet Unit Attestations:

1. Wallet Units must validate a WUA when interacting with other Wallet Units.
2. WUA information must be displayed to Users in certain cases.
3. Wallet Units must provide WUA to wallet-relying parties or Wallet Units upon request.
4. Wallet Units must provide a WUA to PID Providers or Attestation Providers upon request.

Below are the actual excerpts from the CIR, including the recitals and the Articles that establish these requirements.

**Recital (5)**

*In order to ensure transparency and trustworthiness of wallet-relying parties towards wallet users, the protocols and
interfaces used by the wallet solutions should provide wallet users with a reliable mechanism to authenticate wallet-
relying parties and other wallet units. Inversely, wallet providers should provide a mechanism to authenticate and
validate wallet units so that relying parties can receive assurances with respect to trustworthiness and authenticity
of the wallet units. Further, the technical infrastructure of the wallets should also be designed to ensure that only the
minimal necessary amount of data is transferred only to the authorised relying parties, while keeping unlinkability
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

## 3 Purpose of the WUA

The legal requirements quoted in Chapter 2 address different aspects related to the Wallet Unit Attestation. The aspects cover interaction with the User (i.e., requirements in relation to the User interface), interaction with other parties (i.e., what a WUA should be used for) and requirements on the WUA itself (i.e., essential information that should be contained in the WUA). This document will not go into requirements on the User interface, but will focus on how WUAs may be used in connection with other parties. The detailed information to be contained in the WUA will be described in a technical specification of the WUA.

**This document is ONLY intended to specify the high-level requirements related to the WUA. The technical specifications related to the WUA is to be developed by the Commission at a later point in time.**

The legal requirements in relation to the functional requirements of the WUA can be summarised as the following functional requirements:

1. Information contained in the WUA must allow Relying Parties, PID Providers and Attestation Providers, and other Wallet Units to validate the authenticity and revocation status of a Wallet Unit.
2. Wallet Providers must be able to revoke a Wallet Unit, by revoking the corresponding WUA(s).
3. Only the Wallet Provider of a Wallet Unit must be able to revoke that Wallet Unit.
4. It is the Wallets Provider's responsibility to create the WUA.
5. During issuance, PID Providers and Attestation Providers must be able to ensure their PIDs and attestations are cryptographically bound to the Wallet Unit.
6. The WUA must consider the privacy of the User, i.e., techniques from Topic A should be used.
7. Relying Parties on the one hand and PID Provider and Attestation Providers on the other hand require different information from the WUA.
8. The Wallet Unit must handle presentation of the WUA automatically, without the involvement of the User. 
9. The WUA must provide PID Providers and Attestation Providers assurance, that the private PID or attestation key is bound to the same WSCD as the WUA private key.

Based on these functional requirements, the following requirements with regard to the WUA itself can be derived:

1. The WUA must contain a public key, where the corresponding private key is protected by a WSCD.
2. The WUA must contain information allowing parties to check if a Wallet Unit has been revoked.
3. The WUA must contain information allowing parties to verify the validity of the Wallet Unit, i.e., the WUA must contain a signature from the Wallet Provider.
4. The WUA must support both long and short validity terms.

### 3.1 Use cases

The functional requirements described above can be summarised in two use cases related to the WUA:

- Use case 1 - Authenticity of the Wallet Unit: Many different entities in the EUDI Wallet ecosystem will need to verify the authenticity of a Wallet Unit, including its revocation status. These entities include PID Providers, Attestation Providers, and Relying Parties and other Wallet Units (for Wallet-to-Wallet interaction). This use case can be supported by basic meta information in the WUA, i.e. a revocation handle and a signature from the Wallet Provider.
- Use case 2 - Capabilities and keys of the Wallet Unit: Certain entities in the EUDI Wallet ecosystem (i.e. PID Providers and Attestation Providers) will need additional information on top of what is provided by use case 1. This information includes descriptions of the capabilities of the individual Wallet Unit, i.e. information on the WSCA/WSCD used.

Privacy is an issue in relation to WUA and entities should be restricted to Use case 1, unless they have an actual need for Use case 2. In practice, this means Relying Parties and other Wallet Units must not be allowed access to the information in the WUA suitable for Use case 2. Furthermore, the WUA should be treated as any other attestation with regard to privacy, i.e., the discussions and solutions of [Topic A - Privacy Risks and Mitigations] also apply for WUA.

Use case 2 can be achieved by implementing the WUA as a revocable signature on a public key, issued by the Wallet Provider. Additionally the WUA should contain relevant information on the Wallet Unit capabilities, including the properties of the WSCD/WSCA. These attributes must also be signed by the Wallet Provider and may be used to provide additional trust in the Wallet Unit. The signed attributes and public key (i.e. the WUA), may be seen as an attestation and can utilise other attestation specific requirements from the ARF if beneficial.

Use case 1 can be achieved similarly to Use case 2, except the WUA would not contain additional information/attributes on the Wallet Unit capabilities.

The WUA should use a format the entities of the EUDI Wallet ecosystem would expect, i.e. be compatible with the interfaces defined in the ARF.

This paper identifies two requirements in relation to WUA that warrant further discussion: cryptographic binding and revocation. These are discussed in the two next subsections.

### Cryptographic binding

[CIR 2024/2977], Article 3, states that:

*5. Providers of person identification data shall ensure that person identification data that they issue is cryptographically bound to the wallet unit to which it is issued.*

The meaning of 'cryptographically bound' is discussed in ARF section 6.6.3.8. The WUA is intended to support this functionality by providing a base of trust, i.e. an attestation on a public key and the capabilities of the Wallet Unit. This approach will provide a trusted foundation on which the Wallet Provider may choose to implement more advanced features. At the same time, this approach allows the WUA to be treated as "any other attestation".

### Revocation

[CIR 2024/2977], Article 5, states that:

*4. Where providers of person identification data revoke person identification data issued to wallet units, they shall do so in each of the following circumstances:\
...\
(b) where the wallet unit attestation to which the person identification data was issued to has been revoked;*

As the WUA is used to revoke Wallet Units, it plays an important role in relation to PID providers. The Wallet Provider is responsibly for providing the revocation functionality; however, how it is to be used is described in Topic 38, Wallet Unit Revocation and Topic 7, Attestation Revocation and revocation checking. In order to fulfil the requirement in [CIR 2024/2977], the PID providers must keep track of all Wallet Units (i.e. all WUAs they received from Wallet Units during PID issuance) to which PID has been issued and periodically (e.g. daily) monitor this list to check if a WUA has been revoked. For this to function, several properties are required:

- The validity period of the WUA used in connection with issuance (Use case 2) should be long, preferably as long as the expected lifetime of the Wallet Unit. In practice this may be hard to achieve, as the Wallet Provider would need to guess the expected lifetime of the Wallet Units.
- To mitigate the privacy risk of the long validity period of the WUA, the WUA should be a once-only attestation as specified in [Topic A].

These requirements are discussed in [Topic A], which discusses privacy risks related to the usage of attestations in general. These discussions also apply to the WUA. Note that the validity period of the WUA used in connection with Relying Parties can be shorter than in the issuance use case. This may make revocation easier to handle, however it will require more frequent interactions with the Wallet Provider, which could also raise privacy concerns.

## 4 Relation to Other Topics

Below we discuss how Wallet Unit Attestations relate to the other topics being discussed.

### 4.1 Privacy Risks and Mitigations

[Topic A - Privacy Risks and Mitigations](../discussion-topics/a-privacy-risks-and-mitigations.md) highlight that a WUA functions like any other attestation and therefore the risks and mitigations are the same:

- PID Providers and Attestation providers may assume the role of Relying Party with regard to RP-linkability: When presenting a WUA to a PID Provider or Attestation Provider, the Provider may record fixed values (hashes etc.) in all WUAs it receives and use these to track the User.
- The Wallet Provider may assume the role of Attestation Provider with regard to AP-linkability: If the Wallet Provider colludes with Relying Parties (including PID Providers and Attestation providers), User behaviour may be tracked.
- Using one of the one-time, limited-time, rotating batch or per-relying part attestations will all work with WUA. Note that the use pattern of WUA (it is only intended for PID and Attestation providers during issuance), it will most likely only be used a few times with a few Relying Parties (i.e. PID and attestation providers).

### 4.2 Relation to Risk Register

The purpose of WUA is to allow parties interacting with the Wallet Unit to ensure they are interacting with a legitimate Wallet Unit. Therefore the WUA has
impact on several of the risks listed in the risk register for European Digital Identity Wallets [RiskRegister]:

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
threats, the WUA is used to ensure that the Wallet Unit is not compromised.

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

More specifically, [RiskRegister] describes the following threats in relation to wallet unit attestations:

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
An attacker can get a valid PID into an invalid Wallet Unit</td>
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

## 5 Additions and Changes to the ARF

The existing High-Level Requirements described in ARF, Annex 2, Topic 9, cover multiple aspects of the WUA, and in particular about the so-called proof of association (PoA). These requirements make assumptions on the technology used, which in general complicates the topic. This discussion paper therefore proposes to delete certain details in the requirements and replace them by High-Level Requirements for the purpose and properties discussed in this paper. The details to be removed from ARF Annex 2 should then be moved to a separate document, as input for a technical specification.

In addition, some of the current HLRs in Topic 9 are general in nature and not specific to the WUA. This paper proposes that these HLRs are moved to another topic, e.g. Topic 40 on Wallet Unit Activation and Wallet Unit Management.

The following tables contain the HLRs we propose to keep as part of Topic 9 (WUA), the HLRs we propose to move to other topics in Annex 2 of the ARF, and the HLRs we propose to remove entirely. In view of the large number of changes, this paper proposes to re-number all HLRs afterwards. Note that this is different than the practice for other Topics, where requirements are not renumbered.

In addition, discussions of the WUA in the main part of the ARF will be updated accordingly.

Note that the new HLRs for WUAs explicitly aim to be technology neutral and postpone the technical specification about how this functionality is to be implemented to a technical specification that will be developed by the Commission. In the following, we define WUA as "data capable of achieving use case 1 and 2 from Section 3.1". In particular, the HLRs do not impose any restrictions on the format(s) used, whether the functionality will be implemented as one or more distinct attestations, as verifiable metadata transferred during the protocols for issuance and presentations or something else. These restrictions will be defined in the STS mentioned in WUA_08.

### 5.1 New HLRs for WUAs

### HLRs related to Use Cases

| **Index** | **Requirement specification** | **Proposal** |
|-----------|----------------------------------------------|--------------|
| WUA_08a | The WUA SHALL provide the PID Provider or Attestation Provider with information about the capabilities of the WSCA and WSCD of the Wallet Unit, such that they are able to take a well-grounded decision on whether to issue an attestation or PID to the Wallet Unit. | New |
| WUA_08b | The WUA SHALL enable Relying Parties, PID Providers and Attestation Providers to verify the authenticity and revocation status of the Wallet Unit. | New |
| WUA_08c | Wallet Providers SHALL ensure that a non-revoked Wallet Unit at all times can present WUAs, as requested by a Relying Party, PID Provider or Attestation Provider. | New |
| WUA_20 | During PID or attestation issuance, a Wallet Unit SHALL provide the PID Provider or Attestation Provider with information on a WSCA it is able to use for private key management and that comply with the PID Provider's or Attestation Provider's requirements. | Keep |
| WUA_21 | During PID or attestation issuance, a Wallet Unit SHALL provide the PID Provider or Attestation Provider with the WUA describing the properties of the WSCA that generated the new PID or attestation private key and protects it. | Keep |
| WUA_22 | If a Wallet Unit contains multiple WSCAs, it SHALL internally, securely, keep track of which PIDs and attestations are bound to each of these WSCAs. | Keep |
| WUA_24e | A Wallet Unit SHALL present a WUA only as part of either the issuance or in conjunction with presentation of PID or other Attestations. | New |
| WUA_08d | The WUA SHALL enable PID Providers to request a Wallet Provider to revoke a Wallet Unit. *Note: To comply with requirement WURevocation_11* | New |

### HLRs related to Cryptographic Keys

| **Index** | **Requirement specification** | **Proposal** |
|-----------|----------------------|------------------|
| WUA_11 | A WUA SHALL contain a public key, and the corresponding private key SHALL be generated by the WSCA described in the WUA.| ~~*Note: A WUA key pair is generated as per WUA_10.*~~ |
| WUA_13b | The WSCA SHOULD be able to prove that two or more private keys, paired with two or more public keys, are stored in the same WSCA. *Note: these public keys may be included in WUAs, PIDs, attestations, or pseudonyms.* *Note: The proof may be transitive, so a proof that two keys are stored/managed in the same WSCA may be done by proving keys relate to each other via a third key (also stored in the WSCA)* | New basic HLR |
| WUA_19 | During PID or attestation issuance, the PID Provider or Attestation Provider SHALL verify that the WSCA described in the WUA received from the Wallet Unit has proven possession of the private key corresponding to the public key in the WUA ~~(see WUA_17)~~. The PID Provider or Attestation Provider SHALL also verify that the WSCA has proven possession of the new PID or attestation private key ~~(see WUA_14)~~. The PID Provider or Attestation Provider SHOULD verify that the new PID or attestation private key corresponding to the public key being attested to, is stored in the same WSCA as described in the WUA. *Notes: - See also WUA_13. - These three proofs MAY be implemented as a single cryptographic proof.* | Removed references to deleted HLRs |
| WUA_19a | The Wallet Unit SHALL enable PID Providers, Attestation Providers and Relying Parties to verify that the Wallet Unit presenting a WUA possesses the private key corresponding to the public key in the WUA. | New |
| WUA_24c | A Relying Party requesting the creation of a pseudonym according to [WebAuthn] SHOULD be able to verify that the private key belonging to the public key it receives as a pseudonym, is stored in the same WSCA as the WUA private key. | New |
| WUA_25 | ~~The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer the proofs of association and possession mentioned in WUA_19 to a PID Provider or Attestation Provider. *Note: These three proofs MAY be implemented as a single cryptographic proof.*~~ The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to verify that the private key corresponding to the public key in the WUA and the PID or attestation private key are stored in the same WSCA. | Changed: More general HLR |
| WUA_27 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to indicate in the Token Response: the WSCA to which the new PID or attestation key must be bound, for example by referring to a WSCA identifier listed in the WUA, or, alternatively, the existing PID or attestation public key with which the new attestation key must be associated. | Keep, this is needed in case the Wallet Unit has access to multiple WSCAs. |

### Privacy

| **Index** | **Requirement specification** | **Proposal** |
|-----------|------|---------------|
| WUA_09 | A Wallet Provider SHALL consider all relevant factors, including offline usage, interoperability and the risk of a WUA becoming a vector to track the User, when deciding on the validity period of a WUA. A Wallet Provider MAY use short-lived WUAs to mitigate such risks. | Keep |
| WUA_24 | A Wallet Unit SHALL release data related to the User device in a WUA only to a PID Provider or Attestation Provider, and not to a Relying Party or any other party. ~~*Note: The reason for this requirement is that the Relying Party does not need to know anything about the User's device. Therefore, such data must not be released to Relying Parties, as doing so might violate User privacy.*~~ *Note: Use case 2 (data related to the User device), must not be supported for Relying Parties.* | Changed note. |

### Miscellaneous

| **Index** | **Requirement specification** | **Proposal** |
|-----------|------------------------|--------------------|
| WUA_08 | The Commission SHALL create or reference technical specification for the WUA compliant with the HLRs for this topic. ~~The Commission SHALL take measures to ensure that the contents, format and encoding of Wallet Unit Attestations is specified in a technical specification. This technical specification SHALL be a Rulebook complying with all requirements in [Topic 12].~~ ~~Each WUA SHALL contain attributes describing the Wallet Unit and a single certified WSCA included in that Wallet Unit, in such a way that a PID Provider or Attestation Provider processing the WUA is able to take a well-grounded decision on whether to issue an attestation to that Wallet Unit. In addition, to comply with requirement WURevocation_11, the WUA SHALL contain a unique identifier of the Wallet Unit. *Note: In general, a PID Provider or Attestation Provider will also need information about the User. Such information is not contained in the WUA.*~~ | Changed. |
| WUA_13c | The Wallet Provider SHALL ensure that Wallet Units conform to all requirements specified in the technical specification mentioned in WUA_08. | New basic HLR |
| WUA_23 | The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a WUA to a PID Provider or Attestation Provider. | Keep |

## 5.2 HLRs to be Moved to Other Topics

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------|------|
| WUA_01 | A Wallet Provider SHALL activate a new Wallet Unit before a User can use it to have issued an PID or attestation. *Note: The WUA is issued as part of the activation.* | Move - General requirement on Wallet Unit functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_02 | A WSCA SHALL authenticate the User before performing any cryptographic operation involving a private or secret key of a Wallet Unit (i.e., a WUA key) or of a PID or an attestation stored in a Wallet Unit. For a PID key (which is part of the EUDI Wallet eID means), this WSCA SHALL be certified to be compliant with applicable requirements for level of assurance "high" in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. *Note: Many actions of the Wallet Unit, such as processing a Relying Party request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and message encryption. This requirement does not imply that separate User authentication is necessary before each of these. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.* | Move - General requirement on Wallet Unit functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_03 | A Wallet Unit SHALL authenticate the User before performing any operation excluding cryptographic operations. The Wallet Unit SHOULD rely on a WSCA to do so, per WUA_02. If this is infeasible, the Wallet Unit SHOULD use a User authentication mechanism implemented on OS level, such as a lock screen, but it MAY also use a separate User authentication mechanism implemented in the Wallet Instance. *Notes: - The goal of this requirement is to prevent any User interaction without User authentication, including, for example, using the user interface to see which attestations are present in the Wallet Unit or what are the values of specific User attributes. - Cryptographic operations are excluded in this requirement because they can only be performed after User authentication by the WSCA, according to WUA_02. - An example where using a WSCA for User authentication is not feasible is a Wallet Unit using a remote HSM as its WSCA and being without internet connection. - In general, using an OS-level User authentication mechanism instead of a separate mechanism implemented in the Wallet Instance is beneficial for security and User experience. Please note that this ARF assumes that a User device is a personal device, meaning that the User will not share it with other people. - An example where using an OS-level User authentication mechanism is not feasible is where the User has disabled such mechanisms (i.e., no lock screen is used). In that case, a Wallet Unit that is not able to use a WSCA for authentication must use a separate User authentication mechanism implemented in the Wallet Instance as a fallback.* | Move - General requirement on Wallet Unit functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management) |
| WUA_03b | For User authentication according to WUA_03, a Wallet Unit SHALL implement an idle timeout, after which User authentication SHALL again be required. The Wallet Unit SHOULD provide the User with the option to set the idle timeout to a duration shorter than the default timeout. | Move - General requirement on Wallet Unit functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_06 | A Wallet Provider SHALL only activate a new Wallet Unit if it has verified that: - The Wallet Unit includes at least one WSCA that is certified to be compliant with applicable requirements in this Topic, for level of assurance "high" in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. In addition, the Wallet Unit MAY include one or more other WSCAs. - The private key corresponding to the public key in the WUA (see WUA_07) is protected by the respective WSCA under control of the user. | Move - General requirement on Wallet Unit and Wallet Provider functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_06a | If a WSCA/WSCD contains cryptographic keys related to multiple Wallet Units, the Wallet Provider SHALL ensure that a Wallet Unit can only access keys that are related to that Wallet Unit. | New + Move - General requirement on Wallet Unit and Wallet Provider functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_07 | During the activation of a new Wallet Unit, a Wallet Provider SHALL create and sign at least one Wallet Unit Attestation, and issue them to the Wallet Unit. | Move - General requirement on Wallet Provider functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_28 | A WSCA SHALL be able to authenticate a User, in accordance with the requirements in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) section 2.2.1. | Move - General requirement on WSCA functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_29 | A WSCA SHALL be able to generate a new key pair on request of the Wallet Provider via the Wallet Instance. | Move - General requirement on WSCA functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_30 | A WSCA SHALL be able to prove possession of the private key corresponding to a public key on request of a Wallet Instance, for example by signing a challenge with that private key. | Move - General requirement on WSCA functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_32 | A WSCA SHALL protect a private key it generated during the entire lifetime of the key. This protection SHALL at least imply that the WSCA prevents the private key from being extracted in the clear. If a WSCA is able to export a private key in encrypted format, the resulting level of protection SHALL be equivalent to the protection level of the private key when stored in the WSCA. | Move - General requirement on WSCA functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_32a | If a WSCA is able to export a private key, this capability must be specified as an attribute in the WUA. | New + Move - General requirement on WSCA functionality. Should be moved to Topic 40 (Wallet Unit activation / Wallet Unit management)|
| WUA_13a | During PID or attestation issuance, a WSCA SHALL generate a new key pair for a new PID or attestation, on request of the PID Provider or Attestation Provider via the Wallet Instance. | New HLR for Topic 10 (Issuing a PID or attestation to a Wallet Unit) |
| WUA_9b | The expiration date of the issued PID or Attestation SHALL be no later than the expiration date of the WUA presented as part of the issuance process. | New HLR for Topic 10 |

## 5.3 HLRs to be Deleted

| **Index** | **Requirement specification** | **Proposal** |
|-----------|--------------|------|
| WUA_10 | ~~A WSCA SHALL generate a new key pair for a new WUA on request of the Wallet Provider via the Wallet Instance. The WSCA SHALL register the new key as a WUA key in an internal registry. The WSCA SHALL register the WUA key as an independent (i.e., non-associated) key in an internal registry. *Note: A WUA key can be associated later with a PID or attestation key when that PID or attestation key is created, see WUA_13.*~~ | Remove: Contains too much technical information and assumptions on the design of the proof of association. |
| WUA_12 | ~~In case the Wallet Provider must update the WUA because the information in the WUA is outdated, the Wallet Provider SHALL ensure that the Wallet Unit only releases the latest version of a WUA to an Attestation Provider.~~ | Remove: Re-issuance of WUA is covered in Topic B. |
| WUA_13 | ~~During PID or attestation issuance, a WSCA SHALL generate a new key pair for a new PID or attestation, on request of the PID Provider or Attestation Provider via the Wallet Instance. The PID Provider or Attestation Provider SHALL indicate a single WUA public key (see WUA_10) with which the new PID or attestation key must be associated. This indication can either be direct, by providing the WUA public key value, or indirect, by providing a public key value that has been associated with the WUA key previously. In the latter case, the WSCA SHALL look up the associated WUA key in its internal registry. The WSCA SHALL register the new key in an internal registry as an attestation key. The WSCA SHALL register the association between the new private key and the WUA private key in an internal registry. Notes: Direct indication of the WUA is used in case a PID Provider or Attestation Provider indicates during issuing that the new PID or attestation must be associated with a WUA public key, see WUA_15 and WUA_16.Indirect indication of the WUA key is used in case an Attestation Provider indicates during issuing that the new attestation must be associated with an existing PID or attestation, see WUA_16.In case of re-issuance of an existing (short-lived) PID or attestation, or in case of synchronous issuing in a remote HSM architecture, re-use of an existing key pair for the new PID or attestation may be acceptable and it may not be necessary to generate a new key pair for each new PID or attestation. Requirements regarding re-issuance processes will be added in a future version of this document.~~ | Remove |
| WUA_14 | ~~During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to the new PID or attestation public key, on request of the PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key.~~ | Remove |
| WUA_15 | ~~A PID Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new PID must be associated. This SHALL be a WUA public key.~~ | Remove |
| WUA_16 | ~~An Attestation Provider SHALL indicate to a WSCA (via the Wallet Instance) the public key to which the new attestation must be associated. This SHALL be either a WUA public key or the public key of a PID or attestation that already exists in the Wallet Unit. *Note: if the Attestation Provider indicates a PID or attestation public key, this is an indirect indication of a WUA key, see WUA_13.*~~ | Remove |
| WUA_17 | ~~During PID or attestation issuance, a WSCA SHALL prove possession of the private key corresponding to a WUA public key on request of a PID Provider or Attestation Provider via the Wallet Instance, for example by signing a challenge with that private key.~~ | Remove |
| WUA_18 | ~~During PID or attestation issuance, a WSCA SHOULD be able to prove that one or more public keys stored in the same WSCA are associated on request of the PID Provider or Attestation Provider. The WSCA SHALL generate this proof only if the corresponding private keys are protected by the same WSCA and the WSCA has internally registered an association between these private keys. *Notes: - It is possible that some private keys in a WSCA are not associated with each other, even though they are managed within the same WSCA. - If two keys are associated, this implies that they are both associated with the same WUA key.*~~ | Partial delete/keep/change: removed assumption on technology |
| WUA_26 | ~~The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a public key to a PID Provider or Attestation Provider, to be included in the new PID or attestation.~~ | Delete: This is already covered by OpenID4VCI |
| WUA_31 | ~~A WSCA SHALL register each newly generated key pair as either a WUA key or an attestation key, depending on information provided by the Wallet Instance in the key generation request. The internal registry used by the WSCA for this purpose SHALL be protected against modification by external parties.~~ | Delete: Too technical and makes too many assumptions on the design of the PoA. |
| WUA_33 | ~~A WSCA SHALL associate each newly generated attestation key with a WUA key indicated by the Wallet Instance. The WSCA SHALL record the association between these keys in an internal registry, which SHALL be protected against modification by external parties.~~ | Delete: Too technical and makes too many assumptions on the design of the PoA. |
| WUA_34 | ~~For the purposes of WUA_33, a Wallet Instance SHALL indicate the WUA key either directly, by WUA public key value, or indirectly, by value of a public key that is already associated to the intended WUA key. In the latter case, the WSCA SHALL look up the intended WUA key in its registry.~~ | Delete: Too technical and makes too many assumptions on the design of the PoA. |
| WUA_35 | ~~A WSCA SHALL consider two keys to be associated if they are associated to a common WUA key.~~ | Delete: Too technical and makes too many assumptions on the design of the PoA. |
| WUA_36 | ~~A WSCA SHOULD be able to generate a proof of association for two or more public keys. The WSCA SHALL generate such a proof if and only if the corresponding private keys are protected by that WSCA, and the WSCA has internally registered an association between these private keys.~~ |Delete: Too technical and makes too many assumptions on the design of the PoA. |

## 6 References

| Reference | Description |
|-----------------|----------------|
| [WebAuthn] | Web Authentication: An API for accessing Public Key Credentials Level 2 W3C Recommendation, 8 April 2021, <https://www.w3.org/TR/webauthn-2/> |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v1.0. |
| [Topic A] | Topic A - Privacy Risks and Mitigations |
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [CIR 2024/2977] | Commission Implementing Regulation (EU) 2024/2977 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards person identification data and electronic attestations of attributes issued to European Digital Identity Wallets |
| [CIR 2024/2979] | Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets |
| [CIR 2024/2982] | Commission Implementing Regulation (EU) 2024/2982 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards protocols and interfaces to be supported by the European Digital Identity Framework |
