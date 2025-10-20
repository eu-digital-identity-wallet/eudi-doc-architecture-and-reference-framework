
Version 1.0, date 14 October 2025

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

The Regulation of the Wallet puts an obligation to comply with the European Accessibility Act Directive's accessibility requirements in Annex I. The Annex I contains functional accessibility requirements related to information, user interface and functionality design as well as support services. It requires the Wallets to comply with those requirements with the objective for products to be designed and produced in such a way as to maximise their foreseeable use by persons with disabilities and shall be accompanied where possible in or on the product by accessible information on their functioning and on their accessibility features.

Therefore, the Wallets must be inclusive accessible for persons with disabilities and user friendly to support individuals with functional limitations. The European Accessibility Act acknowledges that other persons, than those with disabilities, who experience functional limitations, such as elderly persons, pregnant women or persons travelling with luggage, would also benefit from this Directive. The concept of ‘persons with functional limitations’, as referred to in this Directive, includes persons who have any physical, mental, intellectual or sensory impairments, age related impairments, or other human body performance related causes, permanent or temporary, which, in interaction with various barriers, result in their reduced access to products and services, leading to a situation that requires those products and services to be adapted to their particular needs.
To achieve this, the Wallets must meet specific guidelines and rules that impact decisions made on the user interface (UI) design and the user experience (UX) design as well as in its functionality.

The European Accessibility Act does not specify any existing standard but rather provides for the possibility of developing harmonised standards to provide presumption of conformity with the directive. To that end the Commission has issued M587 requiring inter alia the update of EN 301 549 developed by CEN CENELEC and ETSI. It includes in its chapter dedicated to the web, accessibility requirements that are the ones of the Web Content Accessibility Guidelines (WCAG) developed by the World Wide Web Consortium (W3C).

Regarding the accessibility of Wallet Units for Users, the following legal requirements and standards apply:
- **[DIRECTIVE (EU) 2019/882 OF THE EUROPEAN PARLIAMENT AND OF THE COUNCIL](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32019L0882#rct_47)** on the accessibility requirements for products and services  (European Accessibility Act) and in particular the requirements in Annex I

- **[DIRECTIVE (EU) 2016/2102 OF THE EUROPEAN PARLIAMENT AND OF THE COUNCIL](https://eur-lex.europa.eu/eli/dir/2016/2102/oj)** on the accessibility of the websites and mobile applications of public sector bodies (WAD) and in particular the requirements in Article 4. 

- **[EN 301 549 V3.2.1 - Accessibility requirements for ICT products and services](https://www.etsi.org/deliver/etsi_en/301500_301599/301549/03.02.01_60/en_301549v030201p.pdf)** (harmonised version for the WAD and future versions harmonised for the European Accessibility Act and WAD)

### 2.2 Legal obligations by EU Member States
EU Member States have a legal obligation to transpose into national law the provisions of the European Accessibility Act Directive by adopting and implementing its requirements into their national laws by June 28, 2025. The Wallet EU legislation requires the Wallets to comply with the accessibility requirements of Annex I of the European Accessibility Act. Taking into account that each Wallet Unit implementation must adopt their national legislation, we need to harmonise the accessibility requirements of the Wallets in order to achieve a seamless cross-border use within the EU.


## 3 Discussion 

### 3.1 Ensuring conformance
To ensure conformance to the accessibility requirements of Annex I of the European Accessibility Act as requested by the Wallet regulation, it is expected that a revised version of EN 301 549 containing WCAG 2.2 for the web will provide presumption of conformity. 

It is recommended that Wallets undergo an accessibility audit which involves testing using automated tools and, where required, manual hands-on user testing.

### 3.2 Conformance beyond the WCAG
While the WCAG covers the technical standards concerning web content and the user interface (UI) layer, the European Accessibility Act's scope is broader and mandates a deeper responsibility on how the Wallet Units must be governed in terms of privacy, security and support.

It should be therefore made clear that compliance to the WCAG does not necessarily mean full compliance with the  accessibility requirements of Annex I of the European Accessibility Act. Hence it should be ensured that the Wallets comply with all the relevant provisions of  EN 301 549 including the chapters on functional performance criteria, generic requirements, ICT supporting real-time bidirectional communication and non-web software as well as information about products and services.


## 4  Additions and Changes to the ARF

**ARF 2.5.0**
A new Chapter 8 on Accessibility has been introduced.
+ The former accessibility content from Section 6.5.4 has been removed.
+ In Annex 2, a new Topic 54 on Accessibility has been created, and relevant content has been moved from Topic 40 to Topic 54.

The mentioned HLRs for Wallet unit accessibility are: 

| **Index** | **Requirement specification** |
|-----------|------------------|
| WIAM_21 | Wallet Providers SHALL ensure that their Wallet Units comply with requirements and standards outlined in [Directive 2016/2012 on the accessibility of websites and mobile applications of public sector bodies](http://data.europa.eu/eli/dir/2016/2102/oj). The compliance with the  European Standard EN 301 549 V1.1.2 (2015-04) provides presumption of conformity. |
| WIAM_22 | Wallet Providers SHALL ensure that their Wallet Units comply with accessibility requirements for products and services established under [Directive (EU) 2019/882](http://data.europa.eu/eli/dir/2019/882/oj). A possibility is envisaged to get presumption of conformity by complying with the revised version of EN 301 549. |


Besides these planned changes, further changes on this subject will follow the discussion's outcome.

## 5 References

| Reference                              | Description                                                  |
|----------------------------------------|----------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [Web Content Accessibility Guidelines (WCAG) 2 requirements and techniques]                         | A customizable quick reference to Web Content Accessibility Guidelines (WCAG) 2 requirements (success criteria) and techniques. |                                                |
