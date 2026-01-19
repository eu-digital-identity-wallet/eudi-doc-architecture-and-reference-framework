# K - Combined presentation of Attestations

Version 1.4, updated 19 Jun 2025

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/519)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group regarding
Topic K - Combined presentation of Attestations

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

Requirements for implementing “combined presentation” need to be clearly defined. 
Combined presentation involves a transaction in which a Relying Party requests 
multiple attributes associated with the same User from various attestations 
(PID and/or (Q)EAAs) in a single request and receives those attributes consolidated 
in a single response. The goal for the Relying Party is to verify that all received 
attributes belong to the same User.


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

- Chapter 2 presents legal requirements and High Level Requirements (HLRs) defined
in the Annex 2 of the ARF for the combined presentation of Attestations.
- Chapter 3 details the topic and introduces discussion items
- Chapter 4 lists the additions and changes that will be made to the ARF
as a result of discussing this topic with Member States.

## 2. Legal requirements and existing High Level Requirements 

According to the [European Digital Identity Regulation], article 5a (4):

> European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, 
transparent, and traceable by the user, to:
(a) securely request, obtain, select, **combine**, store, delete, share and present, under the sole 
control of the user, person identification data and, where applicable, in combination with electronic 
attestations of attributes, to authenticate to relying parties online and, where appropriate, 
in offline mode, in order to access public and private services, while ensuring that selective disclosure 
of data is possible; [...]

Annex 2 of ARF includes the following High Level Requirements (HLRs) for
to the combined presentation of Attestations:
### A. Functional requirements for ecosystem components <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| ACP_01 | Wallet Units SHALL support the features in [ISO18013-5] and/or [OpenID4VP] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_02 | Relying Parties SHOULD support the features in [ISO18013-5] and/or [OpenID4VP] (as applicable) that allow requesting and releasing attributes from multiple attestations in a single request and response. |
| ACP_04 | If a Wallet Unit determines it must release multiple attestations to a Relying Party in a combined presentation of attributes, it SHOULD request a proof from the WSCA that the WSCA manages all of the private keys of these attestations. |
| ACP_05 | If, as a result of ACP_04, the Wallet Unit receives such a proof from the WSCA, it SHALL include this proof in the response message containing the combined presentation of attributes and send it to the Relying Party. |
| ACP_06 | If a Relying Party receives a combined presentation of attributes including a proof as meant in ACP_04, it SHOULD verify this proof to validate that the attestations in this presentation were issued to the same User. |

### B. Process requirements <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|----------------|
| ACP_07 | During issuance of an attestation, an Attestation Provider SHOULD be able to request that the private key for the new attestation is managed by the same WSCD as the private key of a PID or another attestation already existing on the Wallet Unit, provided that the Attestation Provider has verified during the issuance process that the new attestation indeed belongs to the User of that existing PID or attestation. |
| ACP_08 | When receiving a combined presentation of attributes, a Relying Party SHOULD NOT refuse the attestations solely because a proof as meant in ACP_04 is absent. |

### C. Miscellaneous <!-- omit from toc -->

| **Index** | **Requirement specification** |
|-----------|-----------------|
| ACP_09 | The common [ISO18013-5] and [OpenID4VP] protocols, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a Wallet Unit to transfer a proof as meant in ACP_04 to a Relying Party. The Commission SHALL take measures to ensure that this is the case. |

## 3. Discussion

The concept of *combined presentation* refers to a process where a Relying Party 
requests multiple attributes concerning a single User, drawn from separate attestations 
(e.g., PID and/or (Q)EAAs), and receives a consolidated, verified response. The key 
functional goal is to enable the Relying Party to confirm that all presented attributes 
genuinely pertain to the same User without compromising trust, privacy, or data integrity.

The **combined presentation of attributes**, when designed with privacy in mind, 
becomes a powerful tool for protecting individuals from unnecessary exposure. Rather 
than relying on full identification for every transaction, we can instead implement 
solutions that enable Users to prove only what is strictly necessary—**without revealing who they are**. 
This aligns directly with the commitments laid out in the **EUDI framework**: access to digital 
services must be **privacy-protective by design** (recital 4), supported by **privacy-enhancing technologies** 
(recital 14), and uphold the principle of **unobservability** (recital 32).
In this light, **Article 5a(16)(b)** provides a clear obligation: when attributes are presented 
together, this must be done in a way that avoids unnecessary identification of the User. 
Instead, **privacy-preserving combined presentation** opens the door to new possibilities. It enables 
the transition of many real-world processes—currently performed under full identification—into more private 
digital equivalents. Consider, for example, eligibility checks for educational programs. A student should
 be able to prove they reside in a particular city and have qualifying grades **without revealing their name, gender, or exact address**.
The same logic applies more broadly: renting a car or a bicycle, or purchasing restricted goods like alcohol, 
often requires only proof of eligibility—not identity. With the right mechanisms in place, 
we can **minimize data exposure while maintaining trust** in the transaction.


### 3.1 Use Cases 

### Real-World Use Cases for Combined Presentation

Scenarios where a User is asked to present different attributes from various 
physical documents are common in the real world—and are also relevant in the digital domain. 
These scenarios can be addressed more efficiently through combined presentation 
allowing a Relying Party to receive a consolidated set of attributes 
from different attestations.

#### **University Admissions**

A university evaluating prospective students may request a digital presentation containing:

- **Citizenship or permanent residency in the European Union** (PID)
- **Academic credentials** (from diploma or qualification attestations),
- **Work or research experience** (from employment attestations or other EAAs).

These attributes typically originate from different issuers and must be validated as 
belonging to the same applicant. A combined presentation enables the university to 
efficiently pre-screen candidates based on custom admission criteria, while avoiding 
the processing of unnecessary data. If the evaluation is positive and the student is 
deemed admissable to the study they desire to follow, the registration can start, 
in which case the identification information can be requested in a new, combined presentation. 
This shows how secure combined presentation is a privacy preserving technology that 
can for example prevent discrimination, e.g., based on the cultural origin of a last name.

#### **Professional Licensing**

A regulatory body responsible for licensing professionals (e.g., doctors, lawyers, engineers) may require a presentation that includes:

- **Proof of identity** (PID),
- **Professional degrees and certifications** (from educational authorities),
- **Proof of prior licensure or work experience** (from previous employers or licensing bodies).

By accepting a combined presentation, the authority can streamline application reviews 
while ensuring all data belongs to the same applicant, supported by secure bindings 
across attestations.


#### **Rental or Loan Applications**

When applying for a loan or renting a property, a service provider may request attributes such as:

- **Identity verification** (from PID),
- **Proof of income or employment** (from employer attestations),
- **Creditworthiness or financial history** (from financial institutions or credit bureaus).

These data points are usually dispersed across documents and issuers. Combined presentation 
allows the User to share only the required attributes in a secure, verifiable, 
and privacy-preserving way—simplifying onboarding while reducing the risk of fraud 
or misrepresentation.


### 3.2 Identity Matching 
A preliminary requirement for the combined presentation of attestations is 
**identity matching**. The Relying Party shall be able to verify that all attributes 
included in the presentation originate from attestations that refer to the same 
User. Without such a mechanism, there is a risk of malicious combinations; for example, 
using a valid facial image from one User together with another person's `"age over 18"` 
attribute could enable fraud or unauthorized access.

Solutions for enabling Relying Parties to verify that all attributes 
included in a presentation originate from attestations that refer to the same 
User include the following:

- **Relying Party-Specific Identifiers**: Unique identifiers assigned by the Relying 
Party—such as customer or contract numbers—that can be used to associate multiple attestations 
with the same User.

- **Session-Based Binding**: It can be assumed that attributes presented in a single 
presentation response are belonging to the same User. 

- **Attribute-Based Binding**: Attestations may include a shared unique identifier 
(e.g., a PID number), which can serve as a binding reference across different attestations,
or redundant person identification data (such as name and date of birth), which can be used 
to related attestations to each other and to person, analogous to the present-day process, 
based on paper documents

- **Issuer-Attested Binding**: An Issuer may issue a dedicated attestation to the Wallet 
Unit explicitly confirming that two or more attestations relate to the same entity.

- **Cryptographic Binding**: The Wallet Unit generates a cryptographic binding
demonstrating that the private keys associated with the involved 
attestations are managed by the same WSCD.

We discuss in more detail the latter mechanism in Section 3.4.

### 3.3 Security consideration
#### Policies for Including Attributes
Each attestation may have its own **Embedded Disclosure Policy**. In parallel,
the **Relying Party Registration Certificate** may grant different access rights 
to different types of attestations. 
When a Relying Party requests a combined presentation containing attributes from 
multiple attestations, the **strictest applicable policy** must prevail. 

#### Validity of Combined Presentation
The **validity period** of a combined presentation shall be determined by the 
**minimum validity** of the individual attestations whose attributes are included. 

#### Privacy Considerations
Although individual attributes may not be personally identifying or trackable on 
their own, their **combination across attestations** may create a **unique tracking vector**. 

Additionally, **Relying Party-Specific Identifiers** and **Attribute-Based Binding** may 
lead to the inclusion of attributes in an attestation that reveal more information 
about the User than necessary (e.g., the User’s PID number). To mitigate this, 
selective disclosure mechanisms SHALL be used to conceal such attributes when 
they are not required for the specific transaction.

### 3.4 Cryptographic Binding of attestations
This is an envisioned cryptographic mechanism that allows 
a Wallet Unit to prove that the private keys corresponding to two (or more) public keys 
are managed by the same WSCD.

Such a mechanisms can be used during attestation issuance, e.g., to prove that the public key 
included in a PID and the public key to be embedded in a newly requested attestation 
are both managed by the same WSCD, as well as, during presentation, e.g.,   
to prove that the public keys associated with two (or more) device-bound 
attestations are managed by the same WSCD.

This mechanism offers the following advantages

- **Simplified signature process**:  
  Proving possession of one of the private keys can be interpreted as proof of possession 
  for all associated keys, reducing the need for multiple presentation signatures.

- **Privacy-preserving correlation**:  
  Attestations can be linked without using identifying attributes that may 
  lead to tracking if not properly hidden during presentation. For example, including 
  a PID number in attestations could enable linking; Cryptographic Binding avoids this by
  offering cryptographic correlation.

This mechanism **does not, by itself, guarantee** that two attestations belong to the same User. 
For such assurance, a Provider must ensure that the device to which an attestation 
is bound is indeed controlled by the User to whom the attestation refers.
 

## 4 Additions and changes to the ARF

Topic 18 will be modified to capture the text of sections 3.3 - 3.4

### 4.1 High-Level Requirements to be added to Annex 2
The following requirements will be added in Topic 18

### REQUIREMENT ACP_10
A Cryptographic Binding of attestations scheme SHALL rely solely on algorithms standardised by a standardisation 
organisation recognised by the Commission or in a standard recognised by the Commission.

### REQUIREMENT ACP_11
A Cryptographic Binding of attestations scheme SHALL enable a proof that two or more public keys, 
each embedded in a separate device-bound attestation, are managed by the same WSCD.

### REQUIREMENT ACP_12
A Cryptographic Binding of attestations scheme MAY be implemented using a Zero-Knowledge Proof mechanism 
that satisfies the requirements specified in Topic G.

### REQUIREMENT ACP_13
A Cryptographic Binding of attestations scheme SHALL support attestation issuance flow as well as 
both remote and proximity presentation flows.

### REQUIREMENT ACP_14
An Attribute Schema Provider MAY specify an attribute in an Attestation Rulebook that MAY be issued
by the Attestation Provider to indicate whether a Cryptographic Binding of attestations scheme
was used during attestation issuance. 

### REQUIREMENT ACP_15
During issuance of an attestation, an Attestation Provider MAY be able to request 
that the private key for the new attestation is managed by the same WSCD as the private 
key of a PID or another attestation already existing on the Wallet Unit, provided 
that the Attestation Provider has verified during the issuance process that the new 
attestation indeed belongs to the User of that existing PID or attestation.


### 4.2 High-Level Requirements to be changed
Requirements (ACP_01 - ACP_09) will be removed. Requirements
ACP_01 and ACP_02 are already covered by the requirements set in Topic 1. The removal of 
requirements ACP_03 - ACP_09 is justified by the fact that they rely on cryptographic 
mechanisms that are currently unavailable or not sufficiently mature for practical deployment. 
As these requirements cannot be fulfilled in a secure and reliable manner with today’s technology, 
their inclusion would impose unrealistic expectations on implementers. Instead, alternative 
mechanisms—such as those described in **Section 3.2**—offer practical and implementable approaches 
that can achieve the intended security goals using currently available infrastructure. 
These alternatives are currently the only viable approach for implementing secure
combined presentation of attestations. Additionally, we introduce a new High-Level
Requirement describing the desirable properties of such a mechanism. 

### 4.3 Descriptions to be added to the ARF main document

## 5 References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |

