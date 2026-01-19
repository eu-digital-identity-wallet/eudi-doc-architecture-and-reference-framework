# I - Natural person representing another natural person

Version 0.4, updated 20 May 2025

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/495)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group regarding
Topic I - Natural person representing another natural person.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

Outline the requirements how the Wallet will support the representation of another 
natural person need to be clearly defined. Considerations about representing minors should be done.

This paper focuses only in the case of a natural person representing another
natural person and *not in the case of a natural person representing a legal 
person*.


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

- Chapter 2 presents legal requirements for the representation of another 
natural person.
- Chapter 3 discusses uses cases of a natural person representing another natural
person, as well as attestation issuance, and attestation presentation for these use
cases.
- Chapter 4 lists the additions and changes that will be made to the ARF
as a result of discussing this topic with Member States.

## 2. Legal requirements for representation of another natural person 
Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11
April 2024 amending Regulation (EU) No 910/2014 as regards establishing the
European Digital Identity Framework [European Digital Identity Regulation]
article 3, 1 states:

> “electronic identification” means the process of using person identification 
data in electronic form uniquely representing either a natural or legal person, 
or **a natural person representing another natural person** or a legal person

Similarly, article 3, 3 states

> “person identification data” means a set of data that is issued in accordance 
with Union or national law and that enables the establishment of the identity of 
a natural or legal person, or of **a natural person representing another natural person 
or a legal person**.

Additionally, article 3, 4 states

> “electronic identification scheme” means a system for electronic identification 
under which electronic identification means are issued to natural or legal persons
or **natural persons representing other natural persons** or legal persons

Similarly, article 3, 5a states

> “user” means a natural or legal person, or **a natural person representing another natural 
person** or a legal person, that uses trust services or electronic identification means 
provided in accordance with this Regulation.

Article 5a, 5(f) of the same regulation states:

> ensure that the person identification data, which is available from the electronic 
identification scheme under which the European Digital Identity Wallet is provided, 
uniquely represents the natural person, legal person or **the natural person representing 
the natural** or legal person, and is associated with that European Digital Identity Wallet

Article 11a, 3c of the same regulation requires that the interoperability framework shall 
consist of:

> [...] a reference to a minimum set of person identification data necessary to uniquely 
represent a natural or legal person, or a **natural person representing another natural person** 
or a legal person, which is available from electronic identification schemes

Finally, ANNEX VI of the same regulation (MINIMUM LIST OF ATTRIBUTES) states:

> [...] 9. Powers and mandates to represent natural or legal persons

## 3 Discussion
The [European Digital Identity Regulation]
considers the representation of one natural person by another. 

One common use case is the legal representation of minors or individuals with 
diminished legal capacity. For example parents or legal guardians should be empowered 
to make decisions and act on behalf of their children and represent them when accessing 
educational platforms, healthcare services, government benefits, or other services. 
The EU Digital Identity Wallet should therefore accommodate such delegation in a secure, 
verifiable manner.

Another significant use case is the management of affairs for elderly or incapacitated 
individuals. In these cases individuals can be assigned as legal representatives to 
manage healthcare, financial, and personal matters.This could translate into a caregiver 
or relative holding a proper delegation to, for instance, access health records or 
submit applications for social care services on behalf of the person they represent.

Power of attorney is another use case of a natural person (the agent) acting on 
behalf of another natural person (the principal).



### 3.1 Attestation issuance
Based on the [European Digital Identity Regulation], it should be possible to issue 
an attestation for a natural person to a representative, in accordance with 
applicable national and European legislation. For certain use cases (e.g., parent-child 
relationships), a PID or attestation provider should be able to retrieve the relevant 
information from authentic sources at the national level or through designated 
intermediaries. In other cases (e.g., power of attorney), the represented natural 
person may be required to explicitly authorize the representative.

Attestation for a natural person issued to a representative SHALL be managed through a distinct attestation 
type. This attestation type SHALL specify the nature of the representation and 
SHALL clearly define the operations that the representative is authorized to perform, 
thereby restricting the scope of their authority. It SHALL NOT be possible to conceal 
this information.

Furthermore, this attestation type SHALL be either short-lived or revocable. In 
the case of revocable attestations, all entities that, according to applicable law, 
are entitled to revoke them SHALL have the capability to do so. It is emphasized 
that the high-level requirements concerning attestation revocation, as defined in 
Annex 2 of the ARF, also apply to this attestation type.

## 3.2 Attestation Presentation
A natural person should be able to represent another natural person when interacting 
with a Relying Party. The Relying Party SHALL always be made aware that it is 
interacting with a legal representative or agent. This is ensured by the fact that 
the corresponding Wallet Unit presents an attestation of a distinct type, specifically 
issued representations.

## 4 Additions and changes to the ARF

### 4.1 High-Level Requirements to be added to Annex 2
**Requirement 1**
The Commission SHALL create a Rulebook for attestations issued to a natural
person representing another natural person. The Rulebook SHALL include attributes
used for defining a validity period, the nature of the representation, and the operations 
the representative is authorized to perform, thereby limiting the scope of its authorization.

**Requirement 2**
An Attestation Provider issuing attestations to a natural
person representing another natural person  SHALL ensure 
that either the attestations are short-lived or that all entities which, according 
to applicable law, must have the ability to revoke such attestations are able to do so.



### 4.2 High-Level Requirements to be changed

### 4.3 Descriptions to be added to the ARF main document

## 5 References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [Topic_A] | Discussion Paper for the European Digital Identity Cooperation Group regarding Topic A: Privacy risks and mitigation, version 1.0 |
