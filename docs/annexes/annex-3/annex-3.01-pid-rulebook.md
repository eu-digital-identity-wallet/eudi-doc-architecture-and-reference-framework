# ANNEX 3.1 - PID Rulebook 



*This is a working document that holds no legal value* *and does not
reflect any common agreement or position of the co-legislators. It
presents a state-of-play of ongoing work of the eIDAS Expert Group. This
document is being continuously updated and should not be considered
final.*

## 1 Introduction

### 1.1 Scope

This document is the Person Identification Data (PID) Rulebook. It
contains requirements specific to the PID use case within the EUDI
Wallet.

This PID Rulebook contains the following topics:

-   [Chapter 2](#2-pid-attribute-schema) specifies the PID attribute schema. This describes the
    structure, the type, the entity identifiers, and the logical
    organization of the mandatory and optional attributes of the PID. It
    also describes how Member States can specify any possible national
    attributes. Two encodings for these attributes are specified, one
    compliant with \[ISO18013-5\], the other compliant with \[SD-JWT VC\].

-   [Chapter 3](#3-trust-infrastructure-details) specifies details about the trust infrastructure necessary
    for PIDs, for both ISO/IEC 18013-5-compliant and SD-JWT-VC-compliant
    encodings. This information may be moved to another document in the
    future.

Further topics will be added if and when they are identified.

### 1.2 Key words

This document uses the capitalized key words 'SHALL', 'SHOULD' and 'MAY'
as specified in \[[RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119)\], i.e., to indicate requirements,
recommendations and options specified in this document.

In addition, 'must' (non-capitalized) is used to indicate an external
constraint, i.e., a requirement that is not mandated by this document,
but, for instance, by an external document. The word 'can' indicates a
capability, whereas other words, such as 'will', and 'is' or 'are' are
intended as statements of fact.

### 1.3 Terminology

This document uses the terminology specified in [Annex 1](../annex-1/annex-1-definitions.md).

## 2 PID attribute schema

### 2.1 Overview

This chapter describes the structure, type, attribute identifiers and
logical organisation of the mandatory and optional attributes of the PID
within the EUDI Wallet, as well as the PID metadata:

-   [Section 2.2](#22-attestation-type-and-namespace-iso-format) specifies the attestation type and namespace(s) for a
    PID in ISO/IEC 18013-5 format:

    -   [Section 2.2.1](#221-eu-wide-attestation-type-and-namespace-for-pid) specifies the PID attestation type and the EU-wide
        PID namespace within which the PID attributes defined in this
        document are specified.

    -   [Section 2.2.2](#222-domestic-pid-namespaces-for-national-attributes) describes how Member States can specify national
        attributes by defining a domestic PID namespace.

-   [Section 2.3](#23-sd-jwt-vc-type) specifies the SD-JWT VC Type to be used for PID
    attestations in SD-JWT VC format.

-   [Section 2.4](#24-pid-attributes) specifies the set of PID attributes.

-   [Section 2.5](#25-pid-attribute-encodings) specifies two different encodings for these attributes.
    The first encoding uses Concise Binary Object Representation (CBOR)
    and complies with ISO/IEC 18013-5:2021 \[ISO18013-5\]. The second
    encoding uses JSON and complies with \[SD-JWT VC\].

### 2.2 Attestation type and namespace (ISO format)

#### 2.2.1 EU-wide attestation type and namespace for PID

The concepts of attestation type and namespace, and the way in which
they are used, are specified in \[[Topic 12](../annex-2/annex-2-high-level-requirements.md#a2312-topic-12---attestation-rulebooks)\].

PID Providers SHALL use the attestation type "eu.europa.ec.eudi.pid.1"
for PIDs. This value follows the recommendation in ISO/IEC 18013-5 to
use the general format \[Reverse Domain\].\[Domain Specific Extension\].
Since the European Commission controls the domain ec.europa.eu, this
attestation type value will not collide with any attestation type
potentially defined by other organisations. The version number "1" in
this attestation type MAY be used to distinguish between the first
version of the ISO-compliant PID attribute (defined in this document)
and any future version.

Similarly, PID Providers SHALL use the value "eu.europa.ec.eudi.pid.1"
for the namespace of the first version of the PID attributes specified in [section 2.4](#24-pid-attributes). This namespace clearly indicates that any attributes defined
within it are Person Identification Data specified in the context of the
EUDI Wallet. Again, the version number "1" allows for future
extension(s) or change(s) of the PID attributes defined the next
section.

Note that the attestation type and namespace have the same value. This
is allowed according to ISO/IEC 18013-5.

PID Providers SHALL use this attestation type and namespace for the
ISO/IEC 18013-5 compliant attribute encoding specified in [section 2.5.2](#252-isoiec-18013-5-compliant-encoding) only.

#### 2.2.2 Domestic PID namespaces for national attributes

ISO/IEC 18013-5 specifies a mechanism called domestic namespaces,
allowing PID Providers to issue such national attributes to an EUDI
Wallet. To do so, a PID Provider SHALL define a domestic PID namespace.
Within that namespace, the PID Provider is free to define any attribute
it needs, for example, a national social security number or taxpayer
identification number (TIN).

If a PID Provider chooses to define a domestic namespace, it SHALL
append the applicable ISO 3166-1 alpha-2 country code or the ISO 3166-2
region code, separated by a period, to the EU-wide PID namespace,
excluding the version number. The PID Provider MAY include a version
number in the domestic namespace.

EXAMPLE: The first domestic PID namespace for Germany could be
"eu.europa.ec.eudi.pid.de.1".

PID Providers SHALL use the same domestic namespace for both ISO/IEC
18013-5-compliant PIDs and SD-JWT-compliant PIDs, see section 2.5.

A PID Provider that defines a domestic namespace SHALL publish the
namespace, including all attribute identifiers, their definition,
presence and encoding format, in a Rulebook complying with all
applicable requirements in \[[Topic 12](../annex-2/annex-2-high-level-requirements.md#a2312-topic-12---attestation-rulebooks)\].

### 2.3 SD-JWT VC Type

SD-JWT VC defines the Verifiable Credential Type (`vct`). A type comes
with associated metadata that, for instance, provides information about
the type itself, outlines a schema detailing the claims that are
optional or mandatory in the SD-JWT VC, and specifies their display
methods. Additionally, a type can inherit from another type, enabling
the creation of domestic types based on a broader EU-wide standard. The
information regarding a type can be automatically discovered.

The information provided in this document SHALL be specified as a
Verifiable Credential Type in the format defined by SD-JWT VC, including
a schema for PIDs, display (rendering) information, and other metadata
specified by SD-JWT VC. This base type SHALL be identified by the URN
`urn:eu.europa.ec.eudi:pid:1`. The version number "1" in this type MAY
be used to distinguish between the first version of the PID attribute
(defined in this document) and any future version.

Domestic PID types for national attributes SHALL be defined using URLs
and extend the EU-wide PID type. It is RECOMMENDED to implement a
national base type and an extension for each version of the type. More
than one domestic PID type MAY be defined per Member State. Domestic PID
types SHALL specify in their Type Metadata any additional fields/claims
and MAY define display information.

EXAMPLE: For Germany, two Verifiable Credential Types for PIDs could be
defined initially:

 * `https://example.bmi.bund.de/credential/pid/` as the national base
   type, where in the metadata of the type, the `extends` field would
   reference the EU-wide type `urn:eu.europa.ec.eudi:pid:1`. This base
   type would not define schema or display information, as these are
   defined in the concrete versions of the type.
 * `https://example.bmi.bund.de/credential/pid/1.0` as the first version
   of the national credential type, defining in its metadata schema and
   display information. The `extends` field would reference the base
   type `https://example.bmi.bund.de/credential/pid/`.

Domestic PID Type Metadata information SHALL be published at their
respective URLs as defined in the SD-JWT VC specification.

### 2.4 PID attributes

#### 2.4.1 Introduction

PID attributes are defined in Table 1 in [section 2.4.2](#242-overview).

Table 1 contains the following information:

-   The first column specifies the identifiers of the PID attributes.
    The attribute identifiers in this column SHALL be used in requests
    and responses according to \[ISO18013-5\] or \[OpenID4VP\], as
    applicable. There SHALL be at most one attribute with the same
    attribute identifier in each PID attribute.

> NOTE: Attribute values MAY be multi-value. If so, this is clearly
> indicated.

-   The second column describes the meaning of the attribute.

-   The third column specifies whether the presence of the attribute in
    a PID is mandatory (M), or optional (O).

> NOTE: If Table 1 indicates an attribute as mandatory, this solely
> means that the PID Provider SHALL ensure that this element is present
> in the PID. It does not imply that a Relying Party is required to
> request such an attribute when interacting with the Wallet Instance.
> Neither does it imply that the PID User cannot refuse to release a
> mandatory attribute if requested.

-   The fourth column indicates how the attributes SHALL be encoded,
    using the CDDL representation types defined in \[[RFC 8610](https://www.rfc-editor.org/rfc/rfc8610.html)\]. [Section 2.5](#25-pid-attribute-encodings) specifies how these representation types SHALL be serialized
    into CBOR and JSON data structures, respectively. Note the
    following:

    -   tstr, uint, bstr, bool and tdate are CDDL representation types
        defined in \[[RFC 8610](https://www.rfc-editor.org/rfc/rfc8610.html)\].

    -   All attributes having encoding format tstr SHALL have a maximum
        length of 150 characters.

    -   This document specifies full-date as full-date = #6.1004(tstr),
        where tag 1004 is specified in \[[RFC 8943](https://datatracker.ietf.org/doc/html/rfc8943)\].

    -   In accordance with \[[RFC 8949](https://datatracker.ietf.org/doc/html/rfc8949)\], section 3.4.1, a tdate
        attribute shall contain a date-time string as specified in \[[RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339)\]. In accordance with \[[RFC 8943](https://datatracker.ietf.org/doc/html/rfc8943)\], a full-date attribute
        shall contain a full-date string as specified in \[[RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339)\].

    -   The following requirements SHALL apply to the representation of
        dates in attributes, unless otherwise indicated:

        -   Fractions of seconds SHALL NOT be used;

        -   A local offset from UTC SHALL NOT be used; the time-offset
            defined in \[[RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339)\] SHALL be to "Z".

#### 2.4.2 Overview

| **Attribute identifier** | **Definition** | **Presence** | **Encoding format** |
|----------|-------------|--------------|---------------|
| family_name | Current last name(s) or surname(s) of the PID User. | M | tstr |
| given_name | Current first name(s), including middle name(s), of the PID User. | M | tstr |
| birth_date | Day, month, and year on which the PID User was born. | M | full-date |
| | Please note that the current specification does not yet foresee a solution for the situation when the date of birth of the User is incomplete or unknown. Work is ongoing to find a solution to this scenario, in alignment with current implementation of eIDAS nodes. | | |
| age_over_18 | Attesting whether the PID User is currently an adult (true) or a minor (false). | M | bool |
| age_over_NN | Additional current age attestations, NN < 18. | O | bool |
| age_in_years | The current age of the PID User in years. | O | uint |
| age_birth_year | The year when the PID User was born. | O | uint |
| | Please note that the current specification does not yet foresee a solution for the situation when the birth year of the User is unknown. Work is ongoing to find a solution to this scenario, in alignment with current implementation of eIDAS nodes. | | |
| family_name_birth | Last name(s) or surname(s) of the PID User at the time of birth. | O* | tstr |
| given_name_birth | First name(s), including middle name(s), of the PID User at the time of birth. | O* | tstr |
| birth_place | The country, state, and city where the PID User was born. | O* | tstr |
| birth_country | The country where the PID User was born, as an Alpha-2 country code as specified in ISO 3166-1. | O* | tstr |
| birth_state | The state, province, district, or local area where the PID User was born. | O* | tstr |
| birth_city | The municipality, city, town, or village where the PID User was born. | O* | tstr |
| resident_address | The full address of the place where the PID User currently resides and/or can be contacted (street name, house number, city etc.).  | O* | tstr |
| resident_country | The country where the PID User currently resides, as an Alpha-2 country code as specified in ISO 3166-1. | O* | tstr |
| resident_state | The state, province, district, or local area where the PID User currently resides. | O* | tstr |
| resident_city | The municipality, city, town, or village where the PID User currently resides. | O* | tstr |
| resident_postal_code | Postal code of the place where the PID User currently resides. | O* | tstr |
| resident_street | The name of the street where the PID User currently resides. | O* | tstr |
| resident_house_number | The house number where the PID User currently resides, including any affix or suffix. | O* | tstr |
| gender | PID User's gender, using a value as defined in ISO/IEC 5218. | O* | uint |
| nationality | Alpha-2 country code as specified in ISO 3166-1, representing the nationality of the PID User. | O* | See section 2.4.6 |
| issuance_date | Date (and possibly time) when the PID was issued. | M | tdate or full-date  |
| expiry_date | Date (and possibly time) when the PID will expire. | M | tdate or full-date  |
| issuing_authority | Name of the administrative authority that has issued this PID instance, or the ISO 3166 Alpha-2 country code of the respective Member State if there is no separate authority authorized to issue PIDs. | M | tstr |
| document_number | A number for the PID, assigned by the PID Provider. | O | tstr |
| administrative_number | A number assigned by the PID Provider for audit control or other purposes. | O | tstr |
| issuing_country | Alpha-2 country code, as defined in ISO 3166-1, of the PID Provider's country or territory. | M | tstr |
| issuing_jurisdiction | Country subdivision code of the jurisdiction that issued the PID, as defined in ISO 3166-2:2020, Clause 8. The first part of the code SHALL be the same as the value for issuing_country. | O | tstr |

**Table 1 PID attributes**

Note: For the attributes for which the presence is indicated as O\*, see
[section 2.4.7](#247-minimum-number-of-optional-attributes).

#### 2.4.3 Date of birth-related attributes

This document defines the following attributes related to the date of
birth of the PID User:

-   birth_date (mandatory)

-   age_birth_year (optional)

-   age_in_years (optional)

-   age_over_18 (mandatory)

-   age_over_NN, NN \<\> 18 (optional)

Having multiple attributes instead of only one allows having different
levels of granularity for requests and responses, and thus allows PID
Providers and Relying Parties to practice data minimization. For
example, in some use cases, a Relying Party only needs to establish that
the PID User is not a minor. In that case, requesting age_over_18
suffices. Releasing more specific information, such as the PID User's
age in years or birth year, would then constitute an unnecessary
infringement of the User's privacy.

This document specifies age_over_18 as a mandatory attribute and other
age_over_NN attributes as optional attributes. PID Providers are free to
add multiple age_over_NN attributes.

The requirements in clause 7.2.5 of ISO/IEC 18013-5 SHALL be applicable
for the age_over_18 and age_over_NN attributes in the PID set. This
document affirms that issuing more (rather than fewer) age_over_NN
attributes in a PID is beneficial for the PID User's privacy. Note that
the usage of the age_over_NN attribute is more complicated than it may
look at first sight. The examples in Annex D.2.2 of ISO/IEC 18013-5 will
help to understand how the age_over_NN attribute is to be used and
interpreted.

#### 2.4.4 Place of birth-related attributes

This document defines the following attributes related to the place of
birth of the PID User:

-   birth_place (optional)

-   birth_country (optional)

-   birth_state (optional)

-   birth_city (optional)

Having multiple attributes instead of a single one allows having
different levels of granularity for requests and responses, and thus
allows PID Providers and Relying Parties to practice data minimization.

#### 2.4.5 Address-related attributes

This document defines the following attributes related to the current
address of the PID Users

-   resident_address (optional)

-   resident_country (optional)

-   resident_state (optional)

-   resident_city (optional)

-   resident_postal_code (optional)

-   resident_street (optional)

-   resident_house_number (optional)

Having multiple attributes instead of only one allows different levels
of granularity for requests and responses, and thus allows PID Providers
and Relying Parties to practice data minimisation. For example, in some
contexts a Relying Party must verify only that the PID User is a
resident of a certain country. Releasing more specific address
information such as state, city or postal code would then constitute an
unnecessary infringement of the User's privacy.

Note that in most cases requesting a PID User's resident street and
house number will not make sense without simultaneously requesting at
least the resident city, as there will be many duplicate street names
and house numbers in a given country. These attributes have been added
primarily to assist in, for example, automated form filling.

#### 2.4.6 Nationality

The nationality or citizenship of the PID User is potentially a
multi-valued attribute, because a citizen can have more than one
nationality. However, his document defines an attribute nationality
taking as its value a single Alpha-2 country code. This implies that any
additional nationality of the PID User must be added by the respective
Member State as a domestic attribute, see [section 2.2.2](#222-domestic-pid-namespaces-for-national-attributes).

#### 2.4.7 Minimum number of optional attributes

PID Providers SHALL include at least four of the following six
attributes (whose presence is indicated as O\* in Table 1) in each PID,
for purposes of facilitating identity matching:

-   family_name_birth

-   given_name_birth

-   gender

-   nationality

-   A \'Place of birth' attribute, see below.

-   An 'Address' attribute, see below.

Regarding the 'Place of birth' attribute: if a PID Provider chooses to
include this attribute, it SHALL include one or more of the following
attributes defined in Table 1:

-   birth_place

-   birth_country

-   birth_state

-   birth_city

Regarding the 'Address' attribute: if a PID Provider chooses to include
this attribute, it SHALL include one or more of the following attributes
defined in Table 1:

-   resident_address

-   resident_country

-   resident_state

-   resident_city

-   resident_postal_code

-   resident_street

-   resident_house_number

### 2.5 PID attribute encodings

#### 2.5.1 Introduction 

\[[Topic 10](../annex-2/annex-2-high-level-requirements.md#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet)/[23](../annex-2/annex-2-high-level-requirements.md#a2310-topic-10---issuing-a-pid-or-attestation-to-the-eudi-wallet)\] specifies that PID must be issued in both the format
specified in ISO/IEC 18013-5:2021 \[ISO18013-5\] and the format
specified in \[SD-JWT VC\] must be used. For the latter, attributes must
be encoded in JSON. For the former, attributes must be encoded in CBOR.

This section therefore specifies two separate encodings for the PID data
model, an ISO/IEC 18013-5-compliant encoding in CBOR, and a
SD-JWT-VC-compliant encoding in JSON.

#### 2.5.2 ISO/IEC 18013-5-compliant encoding

##### 2.5.2.1 Encoding rules

If attributes specified in in Table 1 are encoded with CBOR, they SHALL
be encoded as specified in \[[RFC 8949](https://datatracker.ietf.org/doc/html/rfc8949)\].

The CDDL representation types used in Table 1 are specified in [section 2.4.1](#241-introduction-introduction-1) Rules to encode CDDL representation types with CBOR are specified
\[RFC 8610\] and \[[RFC 8949](https://datatracker.ietf.org/doc/html/rfc8949)\].

##### 2.5.2.2 Further stipulations

The value of all attributes (both PID attributes and PID metadata) SHALL
be valid at the value of the timestamp in the validFrom element in the
MSO from ISO/IEC 18013-5 clause 9.1.2.4.

Notes:

-   The value of the age_over_18, age_over_NN and age_in_years
    attributes, if present, changes whenever the PID User has a
    birthday. The value of many other attributes will also change over
    time. It is up to the PID Provider to ensure that the above
    requirement is complied with.

-   Server retrieval, as specified in ISO/IEC 18013-5, SHALL NOT be used
    for PIDs.

The issue_date attribute SHALL NOT be later than the validFrom element
in the MSO, as defined in clause 9.1.2.4 of ISO/IEC 18013-5.

If the Relying Party retrieved the issuing_country attribute, it SHALL
verify that the value of that element matches the countryName element in
the Subject field within the Document Signer certificate; see ISO/IEC
18013-5 Annex B.

If the Relying Party retrieved the issuing_jurisdiction attribute, it
SHALL verify that the value of that element matches the
stateOrProvinceName element, if it is present in the Subject field
within the Document Signer certificate; see ISO/IEC 18013-5 Annex B.

Attributes in Table 1 SHALL be released only as Issuer Signed Items, as
specified in \[ISO/IEC 18013-5\]. This means that these attributes SHALL
be signed by the PID Provider, not by the Wallet Instance.

At the discretion of the PID Provider, domestic attributes (see [section 2.2.2](#222-domestic-pid-namespaces-for-national-attributes)) MAY be signed either by the PID Provider or by the Wallet
Instance.

All attributes in Table 1 SHALL be made selectively disclosable.

#### 2.5.3 SD-JWT-compliant encoding

##### 2.5.3.1 Encoding rules

If attributes are encoded with JSON, they SHALL be encoded as specified
in \[RFC 8259\].

The CDDL representation types used in Table 1 are specified in [section 2.4.1](#241-introduction-introduction-1). Rules to encode CDDL representation types with JSON are specified
in \[[RFC 8949](https://datatracker.ietf.org/doc/html/rfc8949)\] section 6.1 Given the CDDL representation types used in
the current version of this document, the following rules are relevant:

-   A CDDL uint (i.e., an unsigned integer) becomes a JSON number.

-   A CDDL bstr (i.e., a byte string) is encoded in base64url without
    padding and becomes a JSON string.

-   A CDDL tstr (i.e., a UTF-8 text string) becomes a JSON string. Note
    that JSON requires escaping certain characters: quotation mark
    (U+0022), reverse solidus (U+005C), and the \"C0 control
    characters\" (U+0000 through U+001F). All other characters are
    copied unchanged into the JSON UTF-8 string.

-   A CDDL bool (i.e., a Boolean) becomes a JSON false or a JSON true,
    as applicable.

-   A CDDL tdate or full-date (which is a tagged item or 'tag') becomes
    a JSON string representing the content of the tag; the tag number is
    ignored.

Although not used in the current version of this document, the following
CDDL representation types are frequently used in general, and hence
rules to encode them with JSON may become relevant in future versions:

-   A CDDL array (i.e., a structure enclosed in square brackets \[ \])
    becomes a JSON array.

-   A CDDL nint (i.e., a negative integer) becomes a JSON number.

-   A CDDL map (i.e., a structure enclosed in curly brackets { })
    becomes a JSON object. Since this is possible directly only if all
    keys are UTF-8 strings, any CDDL maps defined in future versions of
    this document SHALL only use keys that are UTF-8 strings.

If other CDDL representation types will be used in future versions of
this document, the corresponding rules for encoding them with JSON will
be added here.


##### 2.5.3.2 Data Element Identifer to Claim Mapping

SD-JWT encoded PID attestations SHALL use claim names registered in the
JSON Web Token Claims Registry \[IANA-JWT-Claims\]. Table 2 below maps
the data element identifiers from Table 1 above to the corresponding
claim names. 

Note that a hierarchical claim name structure can be used in SD-JWT VC
encoded PID attestations as SD-JWT allows for individual selective
disclosure of objects and their properties. A hierarchical claim name
structure is indicated by the notation `parent.child` in Table 3.

Data element identifiers not listed in Table 3 are used as defined above.

| Data Element Identifier | Claim Name | Note |
|---|---|---|
| `birth_date` | `birthdate` |  |
| `age_over_18` | `age_equal_or_over.18` | Note: The `18` property name is a string.|
| `age_over_NN` | `age_equal_or_over.NN` | Note: The NN property name is a string. |
| `family_name_birth` | `birth_family_name` | |
| `given_name_birth` | `birth_given_name` | |
| `birth_place` | `place_of_birth.locality` | * |
| `birth_country` | `place_of_birth.country` | |
| `birth_state` | `place_of_birth.region` | |
| `birth_city` | `place_of_birth.locality` | |
| `resident_address` | `address.formatted` | |
| `resident_country` | `address.country` | |
| `resident_state` | `address.region` | |
| `resident_city` | `address.locality` | |
| `resident_postal_code` | `address.postal_code` | |
| `resident_street` | `address.street_address` | * |
| `resident_house_number` | `address.house_number` | * |
| `gender` | `gender` | Note: Data type mismatch - JWT claims use `male`, `female` and custom text values.* |
| `nationality` | `nationalities` | Note: Defined as an array, here containing only one entry.|
| `issuance_date` | `iat` | |
| `expiry_date` | `exp` | |

*Table 2: Data Element Identifier to Claim Name Mapping*

Fields marked with (*) indicate that there is not a one-to-one mapping
between the data element and a suitable pre-defined JWT claim.
This should be resolved in future versions of this document.

EXAMPLE: The following example shows a PID in SD-JWT VC format.

```json
{
    "vct": "https://memberstate.example/credential/pid",
    "vct#integrity": "sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM",

    "given_name": "Jean",
    "family_name": "Dupont",
    "birthdate": "1980-05-23",

    "age_equal_or_over": {
        "12": true,
        "14": true,
        "16": true,
        "18": true,
        "21": true,
        "65": false
    },
    "age_in_years": 44,
    "age_birth_year": 1980,

    "address": {
        "street_address": "123 Via Appia",
        "locality": "Rome",
        "region": "Lazio",
        "postal_code": "00100",
        "country": "IT"
    },

    "nationalities": ["FR"],

    "gender": "male",

    "place_of_birth": {
        "locality": "Leipzig",
        "region": "Saxony",
        "country": "DD"
    },

    "cnf": {
        "jwk": {
            "kty": "EC",
            "crv": "P-256",
            "x": "52aDI_ur05n1f_p3jiYGUU82oKZr3m4LsAErM536crQ",
            "y": "ckhZ-KQ5aXNL91R8Eufg1aOf8Z5pZJnIvuCzNGfdnzo"
        }
    },

    "issuing_authority": "DE",
    "issuing_country": "DE"
}
```

Note: The `cnf` claim is used for expressing key binding in SD-JWT VCs.
The example above shows a public key in JWK format.

Note: Additional technical claims are not shown here, including
references to the issuer, validity status information, and more.

##### 2.5.3.2 Further stipulations

PID attributes in Table 1 SHALL be released only in a VP Token, as
specified in \[OpenID4VP\]. This means that these attributes SHALL be
signed by the PID Provider, not by the Wallet Instance.

At the discretion of the PID Provider, domestic attributes (see [section 2.2.2](#222-domestic-pid-namespaces-for-national-attributes)) MAY be released in either a VP Token or an ID Token.

All attributes in Table 1 SHALL be made selectively disclosable.

## 3 Trust infrastructure details

### 3.1 Introduction 

To trust a signature or seal over a PID, the Relying Party needs a
mechanism to validate that the public key it uses to verify that
signature or seal is trusted. Both ISO/IEC 18013-5 and OpenID4VP provide
such mechanisms. However, in both cases, additional details need to be
specified to fully specify these mechanisms for PIDs within the EUDI
Wallet ecosystem.

### 3.2 ISO/IEC 18013-5-compliant PIDs

#### 3.2.1 OIDs for use in PID-related certificates

ISO/IEC 18013-5 specifies an X.509-based PKI for the purpose of trusting
public keys. This PKI has multiple roots; there is an independent
(self-signed) root certificate for every PID Provider. Annex B of the
standard specifies the formats of the X.509 certificates for all
participants in the ecosystem.

These certificate formats are mDL-specific, but only because they use
the following Object Identifier (OID): *id-mdl OBJECT IDENTIFIER ::= {
iso(1) standard(0) 18013 5 }*, as well as a number of child OIDs ('arcs')
of this OID, see Annex B.1.1 of ISO/IEC 18013-5. All other aspects of
these certificate profiles can be used for any type of mobile document
complying with the security mechanisms defined in ISO/IEC 18013-5,
including a PID within the EUDI Wallet ecosystem.

Note: the OID notation above is incorrect. The <http://oid-info.com/>
website officially registers this OID as *{iso(1) standard(0)
driving-licence(18013) part-5(5)}*. This does not impact the value of the
OID.

To make the certificate profiles applicable for PIDs in ISO/IEC
18013-5-compliant EUDI Wallets, this document specifies the following
OIDs (in ASN.1 notation):

-   *id-eudi OBJECT IDENTIFIER ::= {european-commission 2} <br> - - arc for EUDI Wallets*

-   *id-eudi-iso OBJECT IDENTIFIER ::= {id-eudi 0}
<br> \- \- arc for ISO/IEC 18013-5-compliant EUDI Wallets. The presence of
this arc allows SD-JWT-compliant implementations of the EUDI Wallet to
have their own arc 'next' to this one, if necessary.*

-  *id-eudi-iso-pid OBJECT IDENTIFIER ::= {id-eudi-iso 0} <br> - - arc for PID
    attributes within ISO-compliant EUDI Wallets.*

-   *id-eudi-iso-pid-kp OBJECT IDENTIFIER ::= {id- eudi-iso-pid 1} <br>- - arc for extended key purposes within certificates used for PID
attributes within ISO-compliant EUDI Wallets*

-   *id-eudi-iso-pid-kp-DS OBJECT IDENTIFIER ::= {id-eudi-iso-pid-kp 2} <br>- - arc for document signer certificates, used by PID Providers*

-   *id-eudi-iso-pid-kp-ReaderAuth OBJECT IDENTIFIER ::=
    {id-eudi-iso-pid-kp 6} <br>- - arc for mdoc reader authentication certificates, used by Relying
Parties requesting PIDs. Note that the use of this PID-specific OID
implies that an mdoc reader authentication certificate containing this
OID cannot be used to perform Relying Party authentication for any other
type of attestation within the EUDI Wallet. This is by design, as it
seems good for security to separate reader authentication per
attestation type. However, decisions regarding Relying Party
authentication will be detailed in the relevant technical specification.*

-   *id-eudi-iso-pid-kp-IACALink OBJECT IDENTIFIER ::=
    {id-eudi-iso-pid-kp 4} <br>- - arc for IACA Link certificates, used by PID Providers*

-   *id-eudi-iso-pid-kp-IACA OBJECT IDENTIFIER ::= {id-eudi-iso-pid-kp 7} <br> - - arc for IACA Root certificates, used by PID Providers*

These OIDs SHALL be used in certificates used for PID attributes within
the ISO-compliant EUDI Wallet ecosystem, in exactly the same way as the
corresponding OIDs specified in ISO/IEC 18103-5 are used within the
mobile driving license ecosystem.

Notes:

-   The numbers for the various extended key purposes are taken from
    ISO/IEC 18013-5.

-   These new OIDs will have to be officially registered.

-   The OID european-commission is already registered:
    *european-commission ::= {iso(1) identified-organization(3)
    european-commission(130)}*. The respective Registration Authority for
    this OID will have to be consulted to get approval for the proposed
    addition of an arc for the EUDI Wallet.

#### 3.2.2 PID Provider Trusted List

For authenticating PIDs, trust anchors will be used that are present in
a PID Provider Trusted List which complies with \[[Topic 31](../annex-2/annex-2-high-level-requirements.md#a2331-topic-31---pid-provider-wallet-provider-attestation-provider-and-access-certificate-authority-notification-and-publication)\].

### 3.3 SD-JWT-compliant PIDs

Details on the trust infrastructure for SD-JWT and OpenID4VP-compliant
PIDs will be detailed in a future version of this document.

## 4 References

See [Chapter 9](../../arf.md#9-references) of the main ARF 1.4.0 document.
