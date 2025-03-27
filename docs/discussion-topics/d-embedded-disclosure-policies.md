# D - Embedded Disclosure Policies

Version 1.1, updated 18 March 2025

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic D: Embedded Disclosure Policies.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*The high-level requirements for the embedded disclosure policy need to be further elaborated,
with a focus on defining specific use cases where the policy should be applied and identifying
the language to be used for expressing these policies.*

### 1.2 Related risks in the Risk Register

The risk register for European Digital Identity Wallets [RiskRegister]
contains the following risks that are related to the use of the Digital
embedded disclosure policies:

|Risk type | Risk id | Related risk titles|
|-------------|-------|-------------------|
|High-level risks to the wallets | R6 | Data disclosure|

| R6 Data disclosure |
|---|
|Data disclosure is defined as the unauthorised exposure of personal data including special categories of personal data. The privacy breach risk is very similar when considered from a privacy rather than security viewpoint. |

More specifically, [RiskRegister]  describes the following threats to a Wallet:

|ID | Threat description | Related risks |
|---------|-------|-------------------|
|TR30 | An attacker can defeat technical and procedural controls to extract data. | Data disclosure (R6) |
|TR32 | An attacker can obtain knowledge on the embedded disclosure policy for attributes and present attributes contained in the current request by wallet units. | Data disclosure (R6) |

## 1.3 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that is
mandated by an external document. The word 'can' indicates a capability, whereas
other words, such as 'will' and 'is' or 'are' are intended as statements of
fact.

## 1.4 Document structure

This document is structured as follows:

- Chapter 2 presents legal requirements for embedded disclosure policies.
- Chapter 3 discusses implementation and deployment issues and additional mechanisms for implementing embedded disclosure policies.
- Chapter 4 lists the additions and changes that will be made to the ARF
as a result of discussing this topic with Member States.

## 2 Legal requirements for embedded disclosure policies

Article 2 of Implementing Regulation (EU) 2024/2979 [2024/2979] defines an embedded disclosure policy as:

> a set of rules, embedded in an electronic attestation of attributes by its
provider, that indicates the conditions that a wallet-relying party has to meet
to access the electronic attestation of attributes

In article 10 of Implementing Regulation (EU) 2024/2979 it is defined:

>1. Wallet providers shall ensure that electronic attestations of attributes
with common embedded disclosure policies set out in Annex III can be processed
by the wallet units that they provide.
>2. Wallet instances shall be able to process and present such embedded disclosure
policies referred to in paragraph 1 in conjunction with data received from the
requesting Relying Party.
>3. Wallet instances shall verify whether the Relying Party complies
with the requirements of the embedded disclosure policy and inform the wallet user
of the result.

Annex III of the same regulation defines the following list of common embedded
disclosure policies:

>1. 'No policy' indicating that no policy applies to the electronic attestations
of attributes.
>2. 'Authorised relying parties only policy', indicating that wallet users may only
disclose electronic attestations of attributes to authenticated relying parties
which are explicitly listed in the disclosure policies.
>3. 'Specific root of trust' indicating that wallet users should only disclose
the specific electronic attestation of attributes to authenticated wallet-relying
parties with wallet-relying party access certificates derived from a specific
root (or list of specific roots) or intermediate certificate(s)

Therefore, Wallet Units, as well as the mechanisms used for defining and
evaluating policies, shall provide support for at least policies 2. and 3. above.

An important component related to the evaluation of embedded disclosure policies
is the *Wallet-Relying Party Registration Certificate* (WRPRC). The draft Implementing
Regulation for "the registration of wallet-relying parties
and the common mechanism for the identification and authentication of wallet-relying  
parties" introduces WRPRC and defines it as:

> a data object that indicates the attributes the relying party has registered to
intend to request from users

Therefore, a Wallet Unit in addition to the common embedded disclosure policies
shall verify that the requested attributes are included in the provided WRPRC.

## 3 Discussion

### 3.1 Distribution of embedded disclosure policies

The following two options can be considered for distributing embedded disclosure
policies:

(a) Embedded disclosure policies are provided in Provider metadata (e.g.,
by extending the "credentials\_configurations\_supported" field
 of the "credential issuer metadata" specified in
section 11.2 of \[OID4VCI\]). This option does not require modifications
to the attestation format.

(b) Embedded disclosure policies are included in the attestations. This option
requires modifications to the attestation format. As far as existing formats
are concerned, including ISO mdoc and IETF SD-JWT, it is not straightforward
how this can be implemented.

Option (a) is the preferred distribution method. It
is reminded that according to requirement [ISS\_32a] "An Attestation
Provider SHALL sign its metadata"

Policies can be integrated directly into metadata or "linked"
using a URL and stored by the Provider. The integrated approach does not require
any additional communication with the Provider but attestations shall be revoked
when a policy is updated. On the other hand, the integrated approach prevents a provider
from unilaterally changing an embedded disclosure policy. The linked approach also
may introduce privacy risks and management overhead, and may hinder integration with
protocols such as the Digital Credential API.

For these reasons the integrated approach is the preferred option.

### 3.2 Enforcing of EDPs and communication of results to RPs

Article 10, paragraph 3 of Implementing Regulation (EU) 2024/2979 requires Wallet
Units to "inform the wallet user of the (evaluation of the embedded disclosure policy) result." However,
it does not specify how this result should be enforced. Related to that, the ARF
includes the following requirement:

> EDP_07 The Wallet Unit SHALL enable the User, based on the outcome of the evaluation
of the embedded disclosure policy, to deny or allow the presentation of the requested
electronic attestation of attributes to the requesting Relying Party or the requesting
Wallet Unit.

If an attestation presentation is denied by the user,
generating an error that reveals the attestation's existence while denying presentation to the
Relying Party may leak information about the user. A Relying Party should
not be able to distinguish between a non-existent attestation and an existing
attestation for which presentation is denied. Measures shall also be considered
to prevent related timing attacks. It is noted that currently protocols
specified in the Implementing Acts do not consider such error response.

### 3.3 Authorisation of intermediaries

If Policy 2 defined in \[2024/20179\] is implemented based on Relying
Party identifiers included in WRPAC then the use of intermediaries  will be prevented.
It is reminded that according to requirement RPI_01 in Annex 2 of the ARF:

> [...] an intermediary obtains an access certificate containing its own name
and unique Relying Party identifier

On the other hand, according to requirement RPI_03 in Annex 2:

> For each of the Relying Parties that uses its services, an intermediary SHALL
obtain a registration certificate from a Registrar [...] (which) SHALL contain
that Relying Party's name and unique identifier, as well as the list of
attributes registered for that Relying Party.

Therefore, intermediaries can only be supported only if embedded disclosure
policies consider the Relying Party identifiers included in a WRPRC.

For this reason Policy 2 shall be implemented using Relying Party identifiers
included in the presented WRPRC.

### 3.4 Fine-grained policies based on Relying Party attributes

Advanced use cases may require embedded disclosure policies based on additional
Relying Party attributes, or
even user-related attributes and user context.
In these use cases authorisation rules should be expressed using a policy definition language.

On the other hand, for such a language to be practical, the semantics of attributes
used in policies would need to be defined at the EU level. This
is a complex and time-consuming process that would hinder the definition, standardization,
and eventual deployment of such a policy definition language. Mandating support for
such a language could create  barriers to the development and adoption of Wallet
Solutions. Therefore, this discussion paper does not propose any requirement for
such a language.

## 4 Additions and changes to the ARF

### 4.1 High-Level Requirements to be added to topic 43

The following High-Level Requirements will be added to Annex 2 of the ARF

#### REQUIREMENT 1

A Wallet Solution SHALL support  the implementation of the  'Authorised relying parties only policy'
using a  list of EU-wide unique identifiers of Relying Parties
(as specified in \[Reg\_32\]). Such an identifier SHALL be retrieved from the
presented Wallet-Relying Party Registration Certificate.

#### REQUIREMENT 2

A Wallet Solution SHALL support the implementation of the 'Specific Root of Trust'
policy using a list of root or intermediate certificates

#### REQUIREMENT 3

A PID or Attestation Provider SHALL integrate embedded disclosure policies (if any)
in attestation metadata in a way that is compatible with the issuance protocol
considered by the ARF. A Wallet Unit SHALL retrieve and store locally the corresponding
policies during PID or Attestation issuance.

#### REQUIREMENT 4

When the presentation of an attestation is denied by the User, the Wallet Unit SHALL behave
towards the Relying Party as if the attestation did not exist.

### 4.2 High-Level Requirements to be changed

**[ARB_22]**
Remove "(including, possibly, an embedded disclosure policy as defined in
Topic 43)". Final text:

> The Schema Provider for an Attestation Rulebook SHALL specify all technical
details necessary to ensure interoperability, security, and privacy of that attestation.
Note: An Attestation Rulebook may also specify requirements regarding how the Wallet Unit must display the attestation and the attributes in it to the User.

**[EDP_01]**
Remove ",as defined in the applicable Rulebook. Final text:

> A Wallet Unit SHALL enable an Attestation Provider to optionally include an
embedded disclosure policy in a QEAA, PuB-EAA, or non-qualified EAA. Note: The
[European Digital Identity Regulation] does not contain a requirement for PIDs to
be able to contain an embedded disclosure policy.

**[EDP_02]**
To be removed

**[EDP_03]**
The note will be removed. Additionally, "information" will be replaced with "information
included in the Relying Party Registration Certificate". Final text:

> An embedded disclosure policy created by an Attestation Provider SHALL only refer
to information included in the Relying Party Registration Certificate provided
in an authenticated manner to the Wallet Unit by the Relying Party or the requesting Wallet Unit.

### 4.3 Descriptions to be added to the ARF main document

To be done.

## 5 References

| Reference | Description |
| --- | --- |
|[2024/2979]| Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallet|
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [OID4VCI] | OpenID for Verifiable Credential Issuance - draft 15|
| [OID4VP] | OpenID for Verifiable Presentations - draft 23 |
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation (EU) 2024/2981 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets |
