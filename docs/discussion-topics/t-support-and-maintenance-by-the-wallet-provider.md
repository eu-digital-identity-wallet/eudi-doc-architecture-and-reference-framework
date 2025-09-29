# T - Support and maintenance by the Wallet Provider

Version 0.1, 01 Oct 2025
[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/583)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group
on topic **T - Support and maintenance by the Wallet Provider**

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*Are specific requirements necessary to govern support and maintenance of the Wallet? For instance, guidelines could clarify what types of data the Wallet Provider is permitted or prohibited from collecting from Wallet Instances for support and maintenance purposes.*

Following the [European Digital Identity Regulation] (EU) 2024/1183 this document discusses high-level technical requirements the ARF should include on Wallet Provider specific maintenance and support functions.

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

- Chapter 2 introduces support and maintenance expectations set on Wallet Providers based on the existing legislation and the ARF.
- Chapter 3 lists the existing HLRs on the latest ARF version (2.5.0)
- Chapter 4 will list the additions and changes that will be made to the ARF as a result of discussing this topic with Member States.

## 2. Existing requirements related to Wallet Provider's support and maintenance duties

### 2.1 Regulatory requirements

Article xx of the [European Digital Identity Regulation] specifies that

### 2.2 Sections in the ARF related to Wallet Solution and Wallet Unit lifecycle management

The Trust model discussion in the ARF main text (Section 6) has the following lifecycle management related subsections, and although not directly mentioning support duty of the Wallet Provider may be of relevance for this topic:

[Section 6.2.3](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#623-wallet-provider-suspension-or-cancellation) of the main document discusses what happens on Wallet Unit level if a Wallet Provider is cancelled or suspended. Informing duty by the Wallet Provider of such event for the Wallet Users is defined in Annex 2/[Topic 38](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2338-topic-38---wallet-unit-revocation) part B part of the ARF.

[Section 6.5](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#65-trust-throughout-a-wallet-unit-lifecycle) of the main document discusses Wallet Unit lifecycle related trust. Once a Wallet User has a Wallet Unit in Operational or Valid state, the Wallet Unit is managed by the User and **the Wallet Provider, and this management includes at least revoking the Wallet Unit when necessary** 

The ARF sub-section [6.5.4](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#654-wallet-unit-management) covers the details (**bold text** effect added by the editor):

The **Wallet Provider** is responsible at least to:

* perform **installation of a new version of the Wallet Solution as necessary** - this one has no topic in annex 2.
* update the WUAs as necessary - covered in [Topic 9](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a239-topic-9---wallet-unit-attestation).
* revoke the Wallet Unit in case its security is compromised - covered in [Topic 38](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2338-topic-38---wallet-unit-revocation).

Management will also include **regular updates of the Wallet Instance application to ensure its continued security and functionality.** 

No technical requirements are currently specified regarding automatic installation of Wallet Solution updates and their regularity.

Annex 2 [Topic 40](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management) discusses requirements related to the installation of a Wallet Instance by the User, the subsequent activation of the Wallet Unit by the User and the Wallet Provider, and the management of the Wallet Unit throughout its lifetime. Part C covers high-level technical requirements for Wallet Unit management in WIAM_11 - WIAM_21, of which the maintenance & support related are listed below in [Section 2.3](#23-existing-high-level-requirements-in-the-arf).

### 2.3 Existing high-level requirements in the ARF



## 4 Additions and changes to the ARF

### 4.1 High-Level Requirements to be added to Annex 2

TBA

### 4.2 High-Level Requirements to be changed

TBA

A list of the requirements that shall be removed follows:

**Topic xx**

TBA

### 4.3 Descriptions to be added to the ARF main document

TBA

## 5 References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |