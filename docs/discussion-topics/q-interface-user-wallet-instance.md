
Version 0.3, updated 15 September 2025

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/586)


# Topic Q - Interface between the User and the Wallet Instance

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic Q - Interface between the User and the Wallet Instance.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_This topic is to discuss and identify whether the ARF needs to contain high-level requirements regarding the UI of a Wallet Instance._

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 presents the legal requirements for complying with accessibility guidelines and regulations.
- Chapter 3 discusses topics related to  user interface requirements related to wallet units focusing on the accessibility aspects
- Chapter 4 presents the additions and changes that will be made to the ARF main document as a result of discussions. 


## 2 Legal Requirements for the Wallet Units' User Interface

### 2.1 The European Accessibility Act

The [European Accessibility Act Directive] requires the Wallets to follow general accessibility principles for digital products and services in the EU market that ensure all users (especially those with disabilities) will have equal access to all the features and functionalities offered.

Therefore, the Wallets must be inclusive and user friendly to support individuals with functional limitations, including those with physical, mental, intellectual, sensory, and age-related impairments, whether temporary or permanent.

To achieve this, the Wallets must meet specific guidelines and rules that impact decisions made on the user interface (UI) design and the user experience (UX) design.

The Directive (EU) 2016/2102 (Web Accessibility Directive) - specifies the established European standard EN 301 549 V1.1.2 (2015-04) as the primary and minimum guideline. Newer versions of the 301 549 exist, but they do not automatically change the legal obligations of the Member States with respect to the WAD.

EN 301 549 v2.1.2 (which was referenced in the Official Journal in 2018) [was replaced by v3.2.1 in August 2021](https://digital-strategy.ec.europa.eu/en/policies/latest-changes-accessibility-standard#requirements-not-wcag) and an even newer version v4.1.1 is scheduled to be published in May 2026.

As its technical framework, the EN 301 549 includes the Web Content Accessibility Guidelines (WCAG) developed by the World Wide Web Consortium (W3C).

In summary, regarding the accessibility of Wallet Units for Users, the following legal requirements and standards apply:

- **[DIRECTIVE (EU) 2019/882](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32019L0882#rct_47)** - European Accessibility Act - Accessibility requirements for products and services

- **[DIRECTIVE (EU) 2016/2102](https://eur-lex.europa.eu/eli/dir/2016/2102/oj)** - Web Accessibility Directive - Accessibility of the websites and mobile applications of public sector bodies 

- **[Europan Standard EN 301 549](https://www.etsi.org/deliver/etsi_en/301500_301599/301549/03.02.01_60/en_301549v030201p.pdf)** - Accessibility requirements for ICT products and services

- **[Web Content Accessibility Guidelines (WCAG) 2 requirements and techniques](https://www.w3.org/WAI/WCAG22/quickref/?versions=2.1)**

### 2.2 Legal obligations by EU Member States
EU Member States have a legal obligation to comply with the European Accessibility Act Directive by adopting and implementing its requirements into their national laws by June 28, 2025. Taking into account that each Wallet Unit implementation must adopt their national legislation, we need to harmonise the accessibiilty requirements of the Wallets in order to achieve a seamless cross-border use within the EU.


## 3 Discussion 

### 3.1 Conformance to the WCAG

Directive EN 301 549 v3.2.1 references WCAG 2.1 in order to ensure conformance for digital products and services and is currently under revision. While the [upcoming version 4.1.1 is scheduled to be published in May 2026](https://portal.etsi.org/eWPM/index.html#/schedule?WKI_ID=64282), its contents are not publically availabe yet. However, sources suggest it will incorporate WCAG 2.2 criteria.

WCAG 2.2 adds new success criteria that build upon WCAG 2.1, with a stronger focus on users with cognitive, low-vision, and motor disabilities, particularly on mobile devices. It introduces concepts like minimum pointer target sizes and consistent help mechanisms to address these needs, while also including more specific rules for focus visibility and reducing complex drag gestures.

**Why WCAG 2.2 is Encouraged (but not required by the European Accessibility Act)**

+ **Updated and improved:** While WCAG 2.1 AA is the current baseline, WCAG 2.2 has been published with updated guidelines and improvements.
+ **Proactive Approach:** Adopting WCAG 2.2 demonstrates a proactive approach to accessibility, going beyond the basic legal requirements.
+ **Better User Experience:** Following WCAG 2.2 guidelines can lead to a better and more comprehensive experience for users with various disabilities.
+ **Future-Proofing:** Aligning with the newer standard prepares Wallets for potential future changes and ensures long-term accessibility.

#### 3.1.1 Levels of conformance
As specified by the WCAG all digital applications must focus on the following principles:

+ **Principle 1 – Perceivable:** Information and user interface components must be presentable to users in ways they can perceive.
+ **Principle 2 – Operable:** User interface components and navigation must be operable.
+ **Principle 3 – Understandable:** Information and the operation of the user interface must be understandable.
+ **Principle 4 – Robust:** Content must be robust enough that it can be interpreted by a wide variety of user agents, including assistive technologies.

For each of those principles there are three levels of conformance with the WCAG:

+ **Level A:** Basic accessibility
+ **Level AA:** Most commonly targeted and often a legal standard, and
+ **Level AAA:** Most stringent level, providing the broadest accessibility but not always practical or absolutely necessary.

Each higher level includes all the criteria of the previous level, with Level AAA providing the maximum level of access to the widest range of users.

It should be noted that in Directive EN 301 549, WCAG Level AAA is included for informative purposes only (i.e. “optional / to consider when possible”), not as a normative obligation.


#### 3.1.2 Ensuring conformance
To ensure conformance to the WCAG, it is recommended that Wallets undergo a usability/accessibility audit which involves testing using automated tools and, where required, manual hands-on user testing, throughout the development lifecycle.

The European Accessibility Act does not require mobile app providers to provide proof of an accessibility/usability audit before releasing a product. However, Wallet providers are responsible for ensuring compliance and must be able to demonstrate it if asked (via documentation and accessibility statements), but the system is based on self-declaration, not pre-approval. Authorities in each Member State can request such documentation.

#### 3.1.3 Conformance beyond the WCAG
While the WCAG covers the technical standards concerning web content and the user interface (UI) layer, the European Accessibility Act's scope is broader and mandates a deeper responsibility on how the Wallet Units must be governed in terms of privacy, security and support.

It should be therefore made clear that compliance to the WCAG does not necessarily mean full compliance with the European Accessibility Act.


## 4  Additions and Changes to the ARF


**ARF 2.5.0**
A new Chapter 8 on Accessibility has been introduced.
+ The former accessibility content from Section 6.5.4 has been removed.
+ In Annex 2, a new Topic 54 on Accessibility has been created, and relevant content has been moved from Topic 40 to Topic 54.

The mentioned HLRs for Wallet unit accessibility are: 

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_21 | Wallet Providers SHALL ensure that their Wallet Units comply with requirements and standards outlined in [Directive 2016/2012 on the accessibility of websites and mobile applications of public sector bodies](http://data.europa.eu/eli/dir/2016/2102/oj), including European Standard EN 301 549 V1.1.2 (2015-04). |
| WIAM_22 | Wallet Providers SHALL ensure that their Wallet Units comply with accessibility requirements for products and services established under [Directive (EU) 2019/882](http://data.europa.eu/eli/dir/2019/882/oj). |


Besides these planned changes, further changes on this subject will follow the discussion's outcome.

## 5 References

| Reference                              | Description                                                  |
|----------------------------------------|----------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [Web Content Accessibility Guidelines (WCAG) 2 requirements and techniques]                         | A customizable quick reference to Web Content Accessibility Guidelines (WCAG) 2 requirements (success criteria) and techniques. |                                                |
