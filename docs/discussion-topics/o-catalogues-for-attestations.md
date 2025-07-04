# O - Catalogues for Attestations

Version 0.2, updated 3 Jul 2025
[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/557)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group regarding
Topic O - Catalogues for Attestations

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

Requirements need to be defined to implement the catalogue of Attestation Rulebooks 
and attributes as outlined in ARF 1.4.1 Annex 2, Topics 25 and 26. Specifically, 
interfaces for registering a Rulebook and for searching and requesting rulebooks and 
attribute definitions should be specified.


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

- Chapter 2 presents an overview of catalogues of attributes and catalogues of
attestation Rulebooks as discussed in the current version of the ARF.
- Chapter 3 lists the additions and changes that will be made to the ARF
as a result of discussing this topic with Member States.

## 2. Existing requirements related to catalogues for Attestations
Article 45e Article 45e of the [European Digital Identity Regulation] specifies that

> [...] the Commission shall, taking into account relevant international standards, 
by means of implementing acts, establish a list of reference standards and, where 
necessary, establish specifications and procedures for the catalogue of attributes, 
as well as schemes for the attestation of attributes and verification procedures 
for qualified electronic attestations of attributes for the purposes of paragraph 
1 of this Article.

Topic 12 of ARF 2.2 outlines the high-level requirements (HLR) for Rulebooks that 
define new types of attestations. Among other aspects, it introduces the concept 
of a catalogue to support the management and discovery of these Rulebooks and attributes. 

In line with the foundations laid out in Topic 12, Topics 25 and 26 further elaborate 
on the purpose and structure of the catalogue of Attestation Rulebooks and the catalogue of attributes. 

It is envisioned that Rulebooks can be registered and made available in a publicly 
accessible catalogue. Particularly, Topic 26 specifies that Schema Providers  for 
an Attestation Rulebook that is a QEAA or PuB-EAA
SHOULD register their Rulebooks in the catalogue of Attestation Rulebooks. The Schema 
Provider for an Attestation Rulebook that is a non-qualified EAA MAY also choose 
to register their Rulebooks in the catalogue of Attestation Rulebooks.

To enhance discoverability and technical integration, existing HLRs state the the catalogue will be made 
publicly available and machine-readable. It may be hosted in full or partially 
by the Commission and can include an e-discovery mechanism or links to external 
catalogues. The infrastructure supporting the catalogue will be designed for high 
availability and will avoid single points of failure, ensuring resilience and reliability.

Furthermore, it is required that he registration process will be self-service and open, 
requiring no prior approval from the registry. Similarly, the Commission will also 
publicly communicate the existence and maintenance of the catalogue, along with the 
procedures for proposing a new registration, updating existing records, or removing outdated ones. 
All such changes will be subject to versioning, archiving, and logging, ensuring full traceability 
and accountability throughout the lifecycle of each Rulebook. The specifications and
formats of these catalogues will be provided by TS11 - Specification of Interfaces 
and Formats for the Catalogue of Attestation Rulebooks and Attributes.

### 2.1 Existing high-level requirements

**Topic 25**


| **Index** | **Requirement specification** |
|-----------|-------------------|
| CAT_01 | The Commission SHALL establish a catalogue of attributes used within the EUDI Wallet ecosystem. *Note: The catalogue of attributes does not need to be a separate catalogue, but could be combined with the Attestation Rulebooks catalogue mentioned in CAT_05.* |
| CAT_01a | The Commission SHALL enable any entity to request the registration in the catalogue of one or more attribute(s) of an attestation used within the EUDI Wallet ecosystem. |
| CAT_01b | The Schema Provider for an Attestation Rulebook that is a QEAA or PuB-EAA SHOULD request the registration of all attributes in that QEAA or PuB-EAA in the catalogue of attributes. The Schema Provider for an Attestation Rulebook that is a non-qualified EAA MAY request the registration of the attributes in that EAA in the catalogue. |
| CAT_02 | Empty |
| CAT_03 | The Commission SHALL make the catalogue of attributes publicly available and machine-readable. *Note: The requirement for availability implies setting up the required means for high availability and avoiding a single point of failure.* |
| CAT_03b | The Commission SHALL consider the following semantic artifacts for inclusion in the catalogue of attributes: - [Representation Powers and Mandates (RPaM) Ontology](https://joinup.ec.europa.eu/collection/isa-action-201612-semantic-interoperability-representation-powers-and-mandates-0/solution/representation-powers-and-mandates-ontology#:~:text=The%20ultimate%20objective%20of%20the,structured%20and%20machine%2Dreadable%20format) - [SEMPER \| DE4A](https://www.de4a.eu/semper) - [SEMIC Core Vocabularies](https://interoperable-europe.ec.europa.eu/collection/semic-support-centre/core-vocabularies#What%20are%20the%20Core%20Vocabularies) - [IANA Registry for JSON Web Token Claims](https://www.iana.org/assignments/jwt/jwt.xhtml) (for JSON-based attributes only) - [ISO/IEC 23220-2](https://www.iso.org/standard/86782.html) (for CBOR-based attributes only) |
| CAT_04 | The Commission SHALL make publicly available the existence and maintenance of the catalogue of attributes mentioned in CAT_01, including processes to propose the registration to public and private parties, allowing to register attributes, and conditions for updating and/or removing attributes. These processes SHALL include archiving and logging changes of the history of the catalogue of attributes in an appropriate way, including versioning. *Note: There are layers on top of the attributes that need maintenance as well. So, maintenance in this case is more generic and encompasses more than just the attribute itself.* |

**Topic 26**

| **Index** | **Requirement specification** |
|-----------|---------------|
| CAT_05 | The Commission SHALL establish a catalogue of Attestation Rulebooks used within the EUDI Wallet ecosystem. *Note: For Attestation Rulebooks, see Topic 12.* |
| CAT_05a | The Commission SHALL enable any entity to register an Attestation Rulebook used within the EUDI Wallet ecosystem. |
| CAT_05b | The Schema Provider for an Attestation Rulebook that is a QEAA or PuB-EAA SHOULD register its Rulebook in the catalogue of Attestation Rulebooks. The Schema Provider for an Attestation Rulebook that is a non-qualified EAA MAY register its Rulebook. |
| CAT_06 | The Commission SHALL make the catalogue publicly available and machine-readable, by hosting the catalogue, or parts of it, including an e-discovery mechanism and/or by referencing to other catalogues. *Note: The requirement for availability implies setting up the required means for high availability and avoiding a single point of failure.* |
| CAT_07 | The Commission SHALL enable a self-registration process of Attestation Rulebooks, without pre-approval by the registry, for both public and private entities. |
| CAT_09 | The Commission SHALL make publicly available the existence and maintenance of the Attestation Rulebooks catalogue mentioned in CAT_01, including processes to propose the registration to public and private parties, allowing to register an Attestation Rulebook, and conditions for updating and/or removing Attestation Rulebooks. These processes SHALL include archiving and logging changes of the history of the Attestation Rulebooks catalogue in an appropriate way, including versioning. |
| CAT_10 | The body registering an Attestation Rulebook SHALL include a unique reference to this body and the way to contact it, or how to find information for doing so. *Notes: - Topic 12 describes an option for Member State-specific (i.e., domestic) Rulebooks, extending a EU-wide Rulebook. - Rulebooks may also be shared between interested parties in an out-of-band manner.* |

### 2.3 Discussion
**Question 1**

What is the relationship between the two catalogues (catalogue of attributes and catalogue of attestations)? Should they exist independently, 
or can they be combined? A note in [CAT_01] states:  
*"[...] The catalogue of attributes does not need to be a separate catalogue, but 
could be combined with the Attestation Rulebooks."*  
Is this note still valid?

---

**Question 2**

What is the relationship between the catalogue of attributes and other registries? 
For example, [ARB_06b] requires that:  
*“For [SD-JWT VC]-compliant attestations, the Schema Provider for the Attestation 
Rulebook SHALL ensure that each claim name is either included in the IANA registry 
for JWT claims, or is a Public Name as defined in [RFC 7519].”*

Possible interpretations of the role of the catalogue of attributes include:

* It will serve as an **alternative registry** (e.g., instead of registering with IANA).
* It will be a **complementary registry** (e.g., registration with both IANA and the catalogue of attributes is required).
* It will be the **only mandatory registry** (e.g., registration with IANA is optional).

---

**Question 3**

How should attributes with the same semantics and identifier but from different 
namespaces be handled?  
For example, `first_name` may exist in `eu.europa.ec.eudi.pid.1`, `org.iso.18013.5.1.
mDL`, etc.

* There should be a separate entry for each identifier–namespace pair, and reuse 
across namespaces should be encouraged.

---

**Question 4**

Do we need machine-readable catalogues?  
Some existing requirements highlight the need for “high availability and avoiding a 
single point of failure.” But in what way could a catalogue be considered a single 
point of failure? Will it be used during issuance or the presentation process?

* Probably not. The catalogue should serve as an **informational resource**, and 
Wallet Units should **not be required** to interact with it at runtime.
* A machine-readable catalogue could be very useful for both the Provider and the 
RP, e.g., a very generic Provider can be envisioned where the attestation to be 
issued is configured based on the machine-readable catalogue. Similarly, a very generic 
Wallet could leverage the use of machine-readable catalogue

---

**Question 5**

Is CAT_07 valid as written? Is fully self-service registration without approval a 
desirable feature? What does “self-registration” truly mean in this context? Should 
the process be automated?

* It is likely that **some manual review and approval** will be necessary.

---

**Question 6**

Is there a need for registry structures, such as hierarchy or grouping? For example, 
IANA supports “groups of registries” and “subregistries.”

* This might be beneficial—for instance, in cases where **country-specific 
extensions** to a Rulebook are defined. However, it may also introduce **unnecessary 
complexity**.
* **Grouping attestations** could improve usability (similar to IANA), but this 
raises questions: **Who will manage the groups?**




## 3 Additions and changes to the ARF

### 3.1 High-Level Requirements to be added to Annex 2
### 3.2 High-Level Requirements to be changed

### 3.3 Descriptions to be added to the ARF main document

## 4 References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |

