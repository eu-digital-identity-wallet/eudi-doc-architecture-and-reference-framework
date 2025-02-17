# D - Embedded Disclosure Policies

Version 0.5, updated 6 February 2025

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for eIDAS Coordination Group regarding
Topic D: Embedded Disclosure Policies.

The ARF Development Plan \[ARF\_DevPlan\] describes this Topic as follows:

*The high-level requirements for the embedded disclosure policy need to be further elaborated, 
with a focus on defining specific use cases where the policy should be applied and identifying 
the language to be used for expressing these policies.*

### 1.2 Related risks in the Risk Register

The risk register for European Digital Identity Wallets \[RiskRegister\]
contains the following risks that are related to the use of the Digital
embedded disclosure policies:

|Risk type | Risk id | Related risk titles|
|-------------|-------|-------------------|
|High-level risks to the wallets | R6 | Data disclosure|

| R6 Data disclosure |
|---|
|Data disclosure is defined as the unauthorised exposure of personal data including special categories of personal data. The privacy breach risk is very similar when considered from a privacy rather than security viewpoint. |

More specifically, \[RiskRegister\]  describes the following threats to a Wallet:

|ID | Threat description | Related risks |
|---------|-------|-------------------|
|TR30 | An attacker can defeat technical and procedural controls to extract data. |  Data disclosure (R6)  |
|TR32 | An attacker can obtain knowledge on the embedded disclosure policy for attributes and present attributes contained in the current request by wallet units. |  Data disclosure (R6)  |

## 1.3 Key words

This document uses the capitalized key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalized) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that is
mandated by an external document. The word 'can' indicates a capability, whereas
other words, such as 'will' and 'is' or 'are' are intended as statements of
fact.

## 1.4 Document structure
This document is structured as follows:

- Chapter 2 presents legal requirements for embedded disclosure policies. 
- Chapter 3 discusses implementation and deployment issues.
- Chapter 4 presents additional mechanisms for implementing embedded disclosure policies. 
- Chapter 5 lists the additions and changes that will be made to the ARF 
as a result of discussing this topic with Member States.

## 2 Legal requirements for embedded disclosure policies

Article 2 of Implementing Regulation (EU) 2024/2979 \[2024/2979\] defines embedded disclosure
policy as:

> a set of rules, embedded in an electronic attestation of attributes by its 
provider, that indicates the conditions that a wallet-relying party has to meet 
to access the electronic attestation of attributes

In article 10 of Implementing Regulation (EU) 2024/2979 it is defined:

> 1. Wallet providers shall ensure that electronic attestations of attributes 
with common embedded disclosure policies set out in Annex III can be processed 
by the wallet units that they provide.
>2. Wallet instances shall be able to process and present such embedded disclosure 
policies referred to in paragraph 1 in conjunction with data received from the 
requesting wallet-relying party.
>3. Wallet instances shall verify whether the wallet-relying party complies 
with the requirements of the embedded disclosure policy and inform the wallet user 
of the result.

Annex III of the same regulation defines the following list of common embedded 
disclosure policies:

>1. 'No policy' indicating that no policy applies to the electronic attestations 
of attributes.
> 2. 'Authorised relying parties only policy', indicating that wallet users may only 
disclose electronic attestations of attributes to authenticated relying parties 
which are explicitly listed in the disclosure policies.
>3. 'Specific root of trust' indicating that wallet users should only disclose 
the specific electronic attestation of attributes to authenticated wallet-relying 
parties with wallet-relying party access certificates derived from a specific 
root (or list of specific roots) or intermediate certificate(s)

Therefore, Wallet Units, as well as the mechanisms used for defining and
 evaluating policies, shall provide support for at least policies
  2. and 3. above. 

## 3 Discussion

### 3.1 Distribution of embedded disclosure policies

**Question 1**
How should embedded disclosure policies be distributed? Options are:

(a) Embedded disclosure policies are provided in Provider metadata (e.g., by extending
the "Credential Issuer Metadata" specified in section 11.2 of \[OID4VCI\]). This option 
does not require modifications to the attestation format. 

(b) Embedded disclosure policies are included in the attestations. This option requires 
modifications to the attestation format. As far as existing formats are concerned, 
including ISO mdoc and IETF SD-JWT, it is not straightforward how this can be 
implemented.


Policies can be integrated directly into metadata (or the attestation) or "linked"
using a URL and stored by the Provider. The former approach has the advantage of 
not requiring any communication with the Provider when evaluating a policy, which 
may introduce privacy risks and hinder integration with protocols such as the Digital 
Credential API. However, updating a policy would necessitate the revocation and 
re-issuance of credentials.

The latter option, on the other hand, simplifies policy updates. Nevertheless, it 
requires Wallet Units to periodically communicate with the provider. 
Moreover, this approach may pose challenges in offline scenarios.

**Question 2** Policies should be integrated or linked? Shall 
ARF make a requirement about that or leave it as an option to the provider?

### 3.2 Enforcing of EDPs and communication of results to RPs

Article 10, paragraph 3 of Implementing Regulation (EU) 2024/2979 requires Wallet
Units to "inform the wallet user of the (evaluation of the embedded disclosure policy) result." However,
it does not specify how this result should be enforced. Related to that ARF 1.5.0
includes the following requirement:

> EDP_07 The Wallet Unit SHALL enable the User, based on the outcome of the evaluation 
of the embedded disclosure policy, to deny or allow the presentation of the requested 
electronic attestation of attributes to the requesting Relying Party or the requesting 
Wallet Unit.

If an evaluation of the embedded disclosure policy results in "deny" and this result is enforced,
generating an error that reveals the attestation's existence while denying presentation to the
Relying Party may leak information about the user. A Relying Party should
not be able to distinguish between a nonexistent attestation and an existing
attestation for which presentation is denied. It is noted that currently protocols
specified in the Implementing Acts do not consider such error response. 

**Question 3**
Do you agree that generating an authorization error may be a privacy threat and
countermeasures should be considered?

**Question 3a**
Shall Wallet Units be required to generate the same output (towards the Relying Party)
in case an attestation does not exist and in case an attestation exists but 
presentation is denied?



## 4. Extended approaches
Embedded disclosure policies can be extended beyond the list of the common embedded
disclosure policies defined in \[2024/20179\]. In this section we discuss possible 
approaches. These approaches are motivated
by the fact the Wallet Units should implement more advanced authorization decision processes
to support *Wallet-Relying Party Registration Certificates*.

The draft Implementing Regulation for "the registration of wallet-relying parties 
and the common mechanism for the identification and authentication of wallet-relying 
parties" introduces "wallet-relying party registration certificate" (WRPRC) and defines
it as:

> a data object that indicates the attributes the relying party has registered to 
intend to request from users

Therefore, a Wallet Unit in addition to the common embedded disclosure policies 
should verify that the requested attributes are included in the WRPRC

### 4.1 Relying Party authorization based on WRPRCs 
If Policies 2 and 3 considered by \[2024/20179\] are implemented based on Relying
Party identifiers included in WRPAC and root of trusts for WRPAC respectively, this 
will prevent the use of intermediaries. It is reminded that according to requirement  
RPI_01 of ARF 1.5.0:

> [...] an intermediary obtains an access certificate containing its own name 
and unique Relying Party identifier

On the other hand, according to requirement RPI_03 of ARF 1.5.0:

> For each of the Relying Parties that uses its services, an intermediary SHALL 
obtain a registration certificate from a Registrar [...] (which) SHALL contain
that Relying Party's name and unique identifier, as well as the list of
attributes registered for that Relying Party

Therefore, intermediaries can only be supported only if embedded disclosure policies
consider the Relying Party identifiers included in a WRPRC and the corresponding
root of trusts. 

**Question 5**
Shall the ARF require common embedded policies 2 and 3 to consider Relying Party
identifiers from WRPRCs and root of trusts for WRPRCs respectively?

### 4.2 Fine-grained policies based on Relying Party attributes
Implementing embedded disclosure policies as simple whitelists hinders policy
management, prevents fine-grained policies, and limits the expressiveness of a policy. 
An embedded disclosure policy may consider additional Relying Party attributes, or
even user related attributes and user context,
and define authorization rules using a policy definition language. 
Such an approach can provide 
Attestation Providers with more fine-grained control over which
Relying Parties can access an attestation and under which conditions. 

The expectations of such a policy definition language are (to be expressed as HLR):
* It shall be standardized
* It shall allow rules for authorization based on Relying Party attributes, User attributes,
and contextual attributes 
* It shall enable conditions and logical operations
* It shall enable filtering of Relying Party certificates based on roots of trust
* It shall enable definition of which attestation attributes can be accessed
if a rule if satisfied.


**Question 6**
What other expectations  do you have from a policy definition language

 

## 5 Additions and changes to the ARF
### 5.1 High-Level Requirements to be added to Annex 2
The following High-Level Requirements will be added to Annex 2 of the ARF v1.11

### 5.2 High-Level Requirements to be changed

### 5.3 Descriptions to be added to the ARF main document


## 6 References

| Reference | Description |
| --- | --- |
|[2024/2979]| Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallet|
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [OID4VCI] | OpenID for Verifiable Credential Issuance - draft 15|
| [OID4VP] | OpenID for Verifiable Presentations - draft 23 |
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation (EU) 2024/2981 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets |


