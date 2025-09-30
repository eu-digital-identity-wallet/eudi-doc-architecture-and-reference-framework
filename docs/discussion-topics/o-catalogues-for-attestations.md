# Topic O - Catalogues for Attestations

Version 1.0, updated 29 Sep 2025
[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/557)

## 1. Introduction

### 1.1 Discussion Paper Topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group
on topic **O - Catalogues for Attestations**

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

> Requirements need to be defined to implement the catalogue of Attestation Rulebooks 
and attributes as outlined in ARF 1.4.1 Annex 2, Topics 25 and 26. Specifically, 
interfaces for registering a Rulebook, and for searching and requesting Rulebooks and attribute definitions, should be specified.

Following the *Commission Implementing Regulation (EU) 2025/1569 of 29 July 2025*
this document discusses  **catalogue of attributes** and 
**catalogue of schemes for the attestation of attributes**.

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

- Chapter 2 introduces catalogue of attributes and the catalogue of schemes for the attestation of attributes based on the existing legislation and the ARF.
- Chapter 3 lists the additions and changes that will be made to the ARF
as a result of discussing this topic with Member States.

## 2. Existing requirements related to catalogues for Attestations and Definitions.
Article 45e Article 45e of the [European Digital Identity Regulation] specifies that

> [...] the Commission shall, taking into account relevant international standards, 
by means of implementing acts, establish a list of reference standards and, where 
necessary, establish specifications and procedures for the catalogue of attributes, 
as well as schemes for the attestation of attributes and verification procedures 
for qualified electronic attestations of attributes for the purposes of paragraph 
1 of this Article.

It is clarified that the *scheme for the attestation of attributes* is not the
same as the *Attestation Rulebook*. Particularly:

- **Scheme for the attestation of attributes** is a machine-readable attestation definition
- **Attestation Rulebook** is a human-readable specification of the scheme for the attestation of attributes​

The *Commission Implementing Regulation (EU) 2025/1569* additionally defines
the **catalogue of schemes for the attestation of attributes**. The scope of these two catalogues
is specified in articles 7 and 8 of the implementing regulation. Particularly, with respect
to the catalogue of attributes the following are defined:

**Article 7 paragraph 3**

> Member States shall request the inclusion of attributes listed in Annex VI to Regulation (EU) 
No 910/2014 to the catalogue of attributes wherever those attributes rely on authentic sources for 
the purpose of the verification by qualified trust service providers.

**Article 7 paragraph 3**
 
> In addition, Member States may request the inclusion of attributes not listed in Annex VI to 
the catalogue of attributes wherever those attributes rely on authentic sources within the public sector. 
Private entities that are considered to be a primary source of information or recognised as authentic 
in accordance with Union or national law, including administrative practice, may request the inclusion
of attributes not listed in Annex VI to the catalogue of attributes wherever the requesting entity is 
responsible for those attributes.

Similarly, with respect to the catalogue of schemes for the attestation of attributes
the following are defined:

**Article 8 paragraph 3**

> Owners of a scheme for the attestation of attributes may request adding schemes to the catalogue of schemes [...]

Therefore, the two catalogues are distinct and serve different purposes. The catalogue 
of attributes is limited to attributes that rely on authentic sources within the public 
sector, with its primary objective being the discovery of verification points. Only specific
types of entities shall be allowed to add or modify an entry in this catalogue. In contrast, 
the catalogue of schemes for the attestation of attributes has a broader scope, as it 
allows any scheme owner to register their attestation scheme.

The ARF includes high-level requirements (HLR) for these catalogues, which however
are considered outdated and will be updated. For more details see Section 3 of this
document

### 2.1 Catalogues' contents
Articles 7 and 8 of the *Commission Implementing Regulation (EU) 2025/1569*
define the minimum parameters that a  request to include or modify an entry
in the catalogues shall contain. Specifically, a request to include or to modify 
an attribute in the catalogue of attributes shall contain at least:

* identification of the entity making the request
* where applicable, a reference to Union or national law or administrative practice 
under which the entity making the request is considered to be a primary source of 
information or recognised authentic source.
* if the request refers to an attribute already existing in the catalogue or is a new attribute
* a namespace for the identifier of the attributes, the value of which is unique within the catalogue of attributes
* an identifier of the attribute, unique within the namespace, and the version of the attribute
* semantic description of the attribute
* the data type of the attribute
* the verification point for the attribute at national level or a link to a description 
on how to initiate the verification requests.

Similarly,  a request to include or to modify a scheme in the catalogue of 
schemes for the attestation of attributes shall contain at least:

* the name of the scheme [...]
* the name and contact information of the scheme for the attestation of attributes owner
* the status and version of the scheme
* a reference to specific laws, standards or guidelines, where the issuance, 
validation, or use of an electronic attestation of attributes within the scope of the scheme is subject to them
* the format or formats of electronic attestation of attributes within the scope of the scheme;
* one or more namespaces, attribute identifiers, semantic descriptions and data types of each attribute 
that is part of an electronic attestation of attributes within the scope of the scheme, either by 
reference to an attribute in the catalogue of attributes in Article 7, or an attribute defined 
in an analogue way within the scope of the scheme
* a description of the trust model and the governance mechanisms applied under the scheme, including the revocation mechanisms;
*  any requirements concerning the providers [...] or the sources of information on which those providers rely 
when issuing electronic attestations of attributes [...]
* a statement whether electronic attestations of attributes within the scope of the 
scheme are to be issued as qualified electronic attestations of attributes, as 
electronic attestations of attributes issued by or on behalf of a public sector body 
responsible for an authentic source, or as both.

The contents of both catalogues SHALL be available in both human and machine- readable formats. 

## 3 Additions and changes to the ARF

### 3.1 High-Level Requirements to be added to Annex 2
The following High-Level Requirement is proposed to be added under Topic 12:

**ARB_30**
A Schema Provider for an Attestation Rulebook MAY generate a machine-readable version 
of the attestation schema and register it in the catalogue of schemes for the attestation of attributes.
The registration SHALL include a reference to the corresponding Attestation Rulebook.

The following High-Level Requirement is proposed to be added under Topic 25:

**CAT_11**
A request to include  or to modify an attribute in the catalogue of attributes SHALL indicate
how a verification point for an attribute can be used.


### 3.2 High-Level Requirements to be changed
The requirements specified in Topics 25 and 26 shall be removed, as they are considered outdated. 
In addition, the content of these topics shall be updated to reflect the conclusions of 
this discussion paper. Topic 25 shall also clarify that the scope of the catalogue of attributes is 
limited. Consequently, any references to Topic 25 that describe this catalogue as a general-purpose 
catalogue should be revised accordingly.

A list of the requirements that shall be removed follows:

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


### 3.3 Descriptions to be added to the ARF main document
The ARF includes in various locations the term `catalogue of published Attestation Rulebooks`
(e.g., section 3.15). This should be rephrased to `catalogue of schemes for the attestation of attributes`.

Similarly, Section 5.5 of the ARF has to be rewritten and adapted to the definitions set 
in Section 2 of this document.

Finally, Section 5.5 will be revised to clearly state that the catalogue of attributes 
will be used by QTSPs, and that each Member State remains free to implement its own verification 
mechanisms, including the use of OOTS.

## 4 References

| Reference | Description |
| --- | --- |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |

