# Version 0.2, updated 18 September 2025


[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/582)


# AA - Support of Electronic Payments Customer Authentication (SCA) with the Wallet

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic AA: Support of Electronic Payments Customer Authentication (SCA) with the Wallet

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_Support of Electronic Payments Customer Authentication (SCA) with the Wallet needs to be discussed further. Intention is to draft and finalise the minimal needed high level technical requirements for the ARF._


### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the background and introduction the current discussion related to support of electronic payments customer authentication (SCA) with the Wallet.

- Chapter 3 presents the use cases in the scope of discussion.

- Chapter 4 presents and discuss new requirements.

- Chapter 5 refers to other topics related to support of electronic payments customer authentication (SCA) with the Wallet.

- Chapter 6 presents the additions and changes that will be made to the ARF main document as a result of discussions. 


## 2 Background

This topic (AA) is continuation of [Topic W (Transactional data for payments and other use cases)](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework-private/blob/main/docs/discussion-topics/w-transactional-data-for-payments-and-other-use-cases.md).

The legal requirements applicable to Topic AA, were collected and discussed in Topic W related process.

As an outcome of Topic W discussion, the set of new HLRs was introduced to ARF's [Topic 20].

The purpose of Topic AA is to discuss further, in delail, various aspect necessary to enable Wallet Solution Providers to build harmonised and interoperable solutions for Strong Customer Authentication in the context of PSD2 (payments and other use cases as defined by PSD2), basing on experience from the Large Scale Projects (EWC and Nobid).  


## 3 Use Cases

Under the [European Digital Identity Regulation], a requirement has been introduced for providers in the banking and financial services sector to allow their users to perform strong user authentication with an EU Digital Identity Wallet (Article 5f(2)).

At the same time, application of strong user authentication for this sector is governed by [PSD2] and [RTS SCA], which require Strong Customer Authentication (SCA) where the user:
+ initiates an electronic payment transaction, or
+ accesses its payment account online, or
+ carries out any action through a remote channel which may imply a risk of payment fraud or other abuses.


One important part of SCA is that the User’s consent is valid only for a specific action for which it has been requested, and must not be used to authorise another action (or the same action multiple times). This is known as "Dynamic Linking".

In the case of initiating an electronic payment transaction or a series thereof, payers can further give their consent either directly to their Account Servicing Payment Service Provider (ASPSP) (eg. bank), or via a payee or a Payment Initiation Service Provider (PISP)  (Artcile 64(2) of [PSD2]).

The ARF's [Topic 20] introduces the concept of dedicated SUA attestations issued into the User’s wallet by their ASPSP and then later presented in conjunction with transactional data to be signed by the Wallet Unit (for Dynamic Linking). 

In the PSD2 context, there will be two distinct usages for SUA attestations depending on the User’s counterparty: 

+ Interaction between the User and their ASPSP: Here, the ASPSP acts as both the Attestation Issuer and Relying Party, effectively creating a 2-party model (“**issuer-requested flow**”). In this scenario, **all three SCA use cases are permitted**;

+ Interaction between the User and a payee or PISP: Here, the Attestation Issuer differs from the Relying Party, creating a 3-party model (“**payee-requested flow**”). In this scenario, **only the payment initiation SCA use case is permitted**.


## 4 New requirements discussion 

This chapter contains various additional requirements for consideration and discussion, that may in result turn into the HLRs or may cause modification of existing ones in [Topic 20].


### 4.1 Process control

SUA attestation issuers should be able to express which of the three SCA use cases (as defined in chapter 3) are permitted for a given attestation. For this, it is proposed that issuers work with separate attestation types for the issuer-requested vs. payee-requested flows. They can then make information available in the attestation type’s metadata telling which transaction data types are allowed per attestation type.

In consequence, the Wallet Unit must, when receiving a presentation request for a SUA attestation, validate if the transaction data type is permitted for a given SUA attestation type and conforms to the transaction data type’s schema.


_**Question 1: Should the Wallet Unit be able to validate if the transaction data type is permitted for a given SUA attestation type and conforms to the transaction data type schema?**_


_Note: In the opinion of the ARF team, this is necessary that Wallet Unit is able to perform such validations, for any presentation request that involves transactional data. How the validation should be performed, will be specific per SUA attestation type, and should be specified in the related Attestation Rulebooks and/or Technical Specifications._


### 4.2 Dialog messages(s)

Depending on the transaction type, the User will be displayed corresponding dialog messages. The general concept of processing and rendering such messages is already contained in the existing SUA requirements in [Topic 20].

However there are additional aspects to be considered, specific for payment/PSD2 context.

The following chapters provide consideration on potential additional requirements. For each the general question apply:

_**Question 2: Which of the following requirements should turn into HLRs?**_


#### 4.2.1  Principle of Clarity and Unambiguity

Transaction data may contain elements not meant to be visually displayed to the user (e.g. a technical transaction id) and elements that are meant to be displayed. To comply with Article 5(1)(a) of [RTS SCA], the Wallet Units must display the latter to the User with absolute clarity and in an understandable manner (this includes localisation).

The following requirements are being considered:
+ Information Hierarchy: The Transaction Amount (including its ISO 4217 currency code or symbol) and the Payee's Name SHALL be the most prominent elements on the authorization screen. A clear visual hierarchy must be established through the strategic use of typography, such as increased font size, bold weight, and sufficient negative space, to draw the user's immediate and primary attention to this critical information.
+ Data Fidelity: The information displayed to the user SHALL be an exact, unaltered representation of the data received in the transaction_data object from the Relying Party. The truncation, abbreviation, or summarization of the Payee's name or the transaction amount is strictly prohibited to prevent any possibility of misinterpretation.
+ Focused Interface: The authorization screen SHALL be a dedicated, modal view focused exclusively on the transaction details and the required user action (consent or cancellation). It MUST be free of extraneous or distracting elements, such as advertisements, non-contextual notifications, or unrelated navigation options, which could obscure or detract from the payment information.
+ Payment Instrument Identification: The specific Payment Instrument being used for the transaction (e.g., "Visa ending in 1234" or "Savings Account") SHALL be clearly displayed. This ensures the Payer is fully aware of which financial account the transaction will be debited from. Information on the Payment Instrument may come as part of the transaction data or from the SUA attestation.

_Note: In the opinion of the ARF team, the above requirements could be included a related Attestation Rulebook or Technical Specification potentially, but there is no need do introduce them as HLRs._



#### 4.2.2  Principle of Explicit and Informed Consent

The user's action must constitute unambiguous consent to authorize a specific payment transaction, as required by Article 64 of [PSD2].

The following requirements are being considered:
+ Deliberate User Action: User consent SHALL be captured through an explicit and deliberate physical action (e.g., a tap on a button, a biometric verification). The interface MUST NOT utilize pre-selected checkboxes, toggles, or any design pattern that defaults to an affirmative consent state.
+ Contextual Call-to-Action: The primary interactive element for granting consent (i.e., the confirmation button) SHALL have a descriptive label that explicitly states the user's intent and reiterates the core transaction detail. For example: "Confirm and Pay €100.00" or "Authorize Transaction". Generic labels such as "OK," "Continue," or "Submit", or misleading labels such as  “Present attestation”, are non-compliant as they lack the necessary context. This also applies in cases where the SUA Attestation is presented together with other attestations.
+ Anti-fraud guidance: Wallets must be able to display a security hint on the transaction confirmation screen.
+ Unambiguous Action Dichotomy: The interface must present a clear and balanced choice between approving and canceling the transaction. The interactive elements for these two distinct actions SHALL be visually differentiated in terms of style, color, and/or placement to prevent accidental authorization. The cancellation option must be equally prominent and accessible.


_Note: In the opinion of the ARF team, the above requirements could be included in a related Attestation Rulebook or Technical Specification potentially, but there is no need do introduce them as HLRs._



#### 4.2.3 Principle of Information Integrity and Security (WYSIWYS)

To comply with Article 5(2) of the [RTS SCA], the interface must ensure the integrity of the displayed information throughout the authentication process, guaranteeing that what the user sees is precisely what is being cryptographically signed.

The following requirements are being considered:
+ Immutable Data Presentation: All elements of the transaction data presented to the user for authorization SHALL be rendered in a non-editable, read-only format. There must be no capability for the user or any other process to alter the displayed information on the authorization screen.
+ Secure Rendering Environment: The entire authorization screen must be rendered within a secure component of the EUDI Wallet application, isolated from other processes. This is to mitigate the risk of overlay attacks or other malicious software attempting to tamper with or obscure the displayed transaction details.
+ Visual Assurance of Dynamic Linking: The interface SHOULD provide a clear visual indicator (e.g., a padlock icon 🔒 or a security shield icon 🛡️) adjacent to the amount and payee fields. This serves as a visual affirmation to the user that these specific details are protected and are being dynamically linked to their authentication, reinforcing the WYSIWYS principle.
  

_Note: In the opinion of the ARF team, the "Visual Assurance" requirements could be potentially included in a related Technical Specification. Regarding the remaining two, these are security related ones. The security measures of the Wallet Solution are to be designed by the Provider and in principle will to be proven in the certification process, where the [CIR 2024/2979] lists relevant threats against which the Wallet Solution must provide countermeasures. In conclusion, there is no need do introduce above requirements as HLRs._


## 5 Relation to Other Discussion Topics 

The dialog messages shall follow accessibility rules, that are disucssed in Topic Q.



## 6 Additions and Changes to the ARF 

See sections 4 and 5 above. In addition, transactional data related aspects in the main text of the ARF will be updated accordingly.


## 7 References

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [Topic 20]                             | [ARF Annex 2 Topic 20 - Strong User authentication for electronic payments](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2320-topic-20---strong-user-authentication-for-electronic-payments) |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
| [European Digital Identity Regulation] | [Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng) |
| [CIR 2024/2979]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng)) |
| [CIR 2024/2981]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng) |
| [OID4VP] | [OpenID for Verifiable Presentations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) |
| [ISO/IEC - 18013-5]   |  [Mobile driving licence (mDL) application](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84) |
| [PSD2]   |  [Directive (EU) 2015/2366 of the European Parliament and of the Council of 25 November 2015 on payment services in the internal market, amending Directives 2002/65/EC, 2009/110/EC and 2013/36/EU and Regulation (EU) No 1093/2010, and repealing Directive 2007/64/EC](https://eur-lex.europa.eu/eli/dir/2015/2366/oj/eng) |
| [RTS SCA]   |  [Commission Delegated Regulation (EU) 2018/389 of 27 November 2017 supplementing Directive (EU) 2015/2366 of the European Parliament and of the Council with regard to regulatory technical standards for strong customer authentication and common and secure open standards of communication](https://eur-lex.europa.eu/eli/reg_del/2018/389/oj/eng) |
