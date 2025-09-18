
Version 0.3, updated 17 September 2025

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/584)


# Topic S - Certificate Transparency

## 1 Introduction

### 1.1 Discussion Paper

This document is the discussion paper for the European Digital Identity 
Cooperation Group regarding Topic S – Certificate Transparency.

The ARF Development Plan [ARF_DevPlan] describes this Topic as for discussion.

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as 
specified in RFC 2119, i.e., to indicate requirements, recommendations and 
options specified in this document. In addition, 'must' (non-capitalised) is 
used to indicate an external constraint, for instance a self-evident necessity 
or a requirement that is mandated by an external document. The word 'can' 
indicates a capability, whereas other words,  such as 'will', 'is' or 'are' 
are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for Certificate Transparency 
- Chapter 3 discusses topics related to Certificate Transparency 
- Chapter 4 presents the additions and changes that will be made to the ARF main 
document as a result of discussions


## 2 High level and Legal Requirements for Certificate Transparency

### 2.1 Commission Implementing Regulation (EU) 2025/848

The Commission Implementing Regulation (EU) 2025/848 [CIR 2025/848] in Annex IV 
in section 3(j) it is stated regarding certificate policy and practice statement 
of a CA issuing access certificates that it should include:

- *a description, where relevant, on how a provider of wallet-relying party 
access certificates logs all wallet-relying party access certificates they 
have issued, in compliance with internet engineering task force (‘IETF’) 
request for comments (‘RFC’) 9162 Certificate Transparency version 2.0*

Note: “*…a provider of wallet-relying party access certificates*” – above is 
a CA authorized to issue access certificates.

### 2.2 ARF
The Annex 2 of the ARF includes the following high-level requirement in 
"Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and 
non-qualified EAAs, and Relying Parties"

> **Reg_13** The common Certificate Policy mentioned in Reg_12 SHALL require that 
an Access Certificate Authority logs all issued certificates for Certificate 
Transparency (CT). Note: This requirement is still under discussion and might 
be changed or removed in a future version of this ARF.

## 3 Discussion 

### 3.1 Certificate Transparency

A CA issuing access certificates SHALL register these in a CT log according to 
RFC 9162. Examples of CT log providers are Google and Cloudflare for SSL/TLS 
certificates issued for a domain or subdomain.

####  Certificate Transparency Logs

Certificate Transparency (CT) is an open framework designed to improve the 
security and accountability of the Public Key Infrastructure (PKI) used on the 
web. At its core, CT introduces public, verifiable logs that record every TLS 
certificate issued by Certificate Authorities (CAs). These logs serve as a 
global ledger, making the issuance of certificates visible to everyone rather 
than being a private matter between a CA and a website operator.

CT logs are **immutable** and **append-only**. This means that once a 
certificate is submitted to a log, it can never be removed or altered; new 
entries can only be appended. Each log is structured as a *Merkle tree*, 
allowing cryptographic proofs that a certificate has been included in the log 
and that the log’s history has not been tampered with.  

CAs submit newly issued certificates (or pre-certificates) to one or more CT 
logs, which then return a **Signed Certificate Timestamp (SCT)**. The SCT can 
be embedded in the certificate proving that the certificate is publicly 
recorded.

The key value of CT lies in **detection**. By making certificate issuance 
publicly auditable, CT enables the identification of certificates that should 
not have been issued. This could happen in cases where:
- A CA misbehaves by issuing certificates without proper validation.
- An attacker obtains unauthorized certificates due to a key breach.

Because all legitimate certificates must appear in CT logs, website operators, 
browsers, and third parties can detect suspicious or unauthorized certificates, 
thereby preventing large-scale attacks like domain impersonation.
Two important roles support CT’s accountability model:

- **Monitors** continuously watch CT logs for new certificates, typically 
focusing on specific domains or patterns. A domain owner can use monitors to 
detect if a CA has issued a certificate for their domain without authorization.
This early warning system helps organizations respond quickly to misissuance or 
compromise.

- **Auditors** verify the correctness of CT logs. They check that logs are 
consistent (no history has been rewritten) and that certificates claiming 
inclusion are indeed recorded. Auditors ensure that log operators cannot 
secretly remove or alter certificates, preserving the immutability and 
integrity of the system.


### 3.2 The Goals of the Discussion

The goal of the discussion is to establish how Certificate Transparency can be 
implemented. 

There are some questions to be discussed before proposing a set of HLRs. These 
questions are presented in the next sections.

This document is only intended to clarify or create the high-level requirements 
related to this topic. The necessary technical specifications will be developed 
by the European Commission after an agreement on the requirements has been 
reached.

### 3.3 Questions for Discussion 

Below is a list of questions to be addressed before drafting HLRs related to 
Certificate Transparency:

**Question 1:** Will current CT log providers (e.g. Google and Cloudflare), 
currently primarily for TLS certificates, accept to handle other certificates 
such as access certificates?

Currently, Certificate Transparency (CT) logs, operated by providers such as 
Google and Cloudflare, are primarily used to record TLS certificates in the 
Web PKI. For the EUDI ecosystem, a similar level of transparency and 
accountability will be necessary when dealing with other types of certificates, 
such as access certificates. To achieve this, **existing CT log providers 
should agree to accept certificates issued by CAs trusted within the EUDI 
ecosystem**.   

Alternatively, the **European Commission could establish its own CT log** 
infrastructure to ensure availability and trustworthiness for EUDI use cases. 
However, the security of any CT log does not stem only from its operator. For a 
log to be reliable, it must be accompanied by **multiple independent auditors 
and monitors**, each interacting with the log from different vantage points. 
This distributed oversight ensures that the log remains immutable and 
append-only, and that no unauthorized modifications or omissions go unnoticed. 
Finally, drawing from the Web PKI best practice, it is important that
 **each certificate be registered in at least two independent CT logs**. 



**Question 2:** How Wallet Instance shall verify the inclusion of an access 
certificate in a Certificate Transparency Log?


In the Web PKI, browsers do not directly interact with Certificate Transparency 
(CT) logs to verify the inclusion of a certificate. Instead, they **trust the 
Signed Certificate Timestamp (SCT)** provided by the log, effectively treating 
the log as a trusted third party. This design choice is primarily motivated 
by **privacy concerns**: if a browser queried the log directly, the log operator 
would learn which websites a user visits. The same privacy considerations apply 
within the **EUDI Wallet architecture**. If a Wallet Instance were to contact 
a CT log to verify the inclusion of an access certificate, the log provider 
would gain visibility into the Relying Parties with which the Wallet interacts.
One possible alternative is for a **Wallet Solution to download the entire 
log** and verify certificate inclusion locally, thereby avoiding direct 
interactions with the log provider. However, the **size and scalability of 
such logs are currently unpredictable**, and this approach may prove 
impractical depending on how large the logs grow in practice.  


**Question 3:** If the complete log is publicly visible, does this pose any 
vulnerability, e.g. subdomains? Here is an example of a CT log for the 
Swedish Tax Authority https://crt.sh/?q=skatteverket.se that is publicly available. 

It should be noted that Web PKI CT logs are already used by malicious entities
for detecting new domains (see for example, Kondracki et al. "Uninvited Guests: 
Analyzing the Identity and Behavior of Certificate Transparency Bots", in Usenix 
Security, 2022)

**Question 4** How should a malicious log entry be handled in the context of 
Certificate Transparency?

It is important to recognize that **Certificate Transparency (CT) logs do 
not prevent the issuance or logging of malicious certificates**. Instead, their 
purpose is to **make such misissuance detectable** by ensuring that every 
certificate is publicly recorded in an immutable and append-only log. Because 
of this immutability, once a certificate has been submitted, **it 
cannot be removed from the log**, even if it is later identified as malicious 
or unauthorized. This characteristic is essential for ensuring the integrity of 
the log, but it also creates the need for strong operational responses. To gain 
the full benefits of CT, an **efficient detection and revocation mechanism** 
must be in place. Detection ensures that malicious or misissued certificates 
are quickly identified, while revocation mechanisms ensure that these 
certificates can no longer be used to impersonate domains or services. Without 
such measures, the visibility provided by CT would not translate into 
effective protection.

There might be other questions to be considered regarding Certificate Transparency?

## 4  High Level Requirements

Currently no High-Level Requirements for Certificate Transparency are included in the ARF.

### 4.1 Possible HLRs

| **Reference** | **Requirement specification** |
|-----------|------------------|
| CT_01 | A CA issuing access certificates SHALL register these in a CT log according to RFC 9162. |
| CT_02 | ...?|

### 4.2 Proposed ARF changes 
It is planned to introduce a new section in the ARF on Certificate Transparency. This new section will describe aspects of CA’s issuing access certificates.

Besides these planned changes, further changes on this subject will follow the discussion's outcome.

Besides these planned changes, further changes on this subject will follow the discussion's outcome.

## 5 References

| **Reference** | **Description**|
|-------------------|------------------|
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v2.5.0 |
| [CIR 2025/848] | Commission Implementing Regulation (EU) 2025/848 |
