---
title: "European Digital Identity Wallet"
subtitle: "ARF Annex 3.01 - PID Rulebook"
...

# ANNEX 3.01 - PID Rulebook

## 1 Introduction

### 1.1 Document scope

This document is the natural-person Person Identification Data (PID) Rulebook
and is part of the Architecture Reference Framework (ARF). It specifies
how the mandatory and optional person identification data for the natural
person, as defined in Tables 1 and 2 in the Annex of the Commission Implementing
Regulation on PID and EAA [CIR 2024/2977], as well as the metadata specified in
Table 5 of that CIR, will be encoded within the EUDI Wallet ecosystem.
Additionally, this document specifies further optional PID attributes that are
not included in the CIR.

This document also specifies how a PID and all attributes in it are encoded if
the PID complies with [ISO/IEC 18013-5] and if it complies with [SD-JWT VC].

Person identification data for the legal person is out of scope of this document.

This PID Rulebook complies with all applicable requirements in Topic 12
(Attestation Rulebooks) in Annex 2 of the Architecture Reference Framework.

### 1.2 Document structure

This PID Rulebook is structured as follows:

- [Chapter 2](#2-generic-high-level-requirements-for-pids) contains generic
high-level requirements, which are valid for all PIDs regardless of the encoding
used.
- [Chapter 3](#3-pid-attributes-and-metadata) describes the PID attributes and
metadata on a generic level, regardless of the encoding used for the PID. Most
of the content of this chapter is a direct copy of the Annex of Commission
Implementing Regulation 2024/2977 on PID and EAA. However, a few additional
attributes are specified in this chapter.
- [Chapter 4](#4-isoiec-18013-5-compliant-encoding-of-pid) specifies how the PID
attributes and metadata are encoded in case the PID complies with [ISO/IEC
18013-5].
- [Chapter 5](#5-sd-jwt-vc-based-encoding-of-pid) specifies how the PID
attributes and metadata are encoded in case the PID complies with [SD-JWT VC].

### 1.3 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in [RFC 2119], i.e., to indicate requirements, recommendations and
options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, i.e., a requirement that is not mandated by this document, but, for
instance, by an external document. The word 'can' indicates a capability,
whereas other words, such as 'will', and 'is' or 'are' are intended as
statements of fact.

### 1.4 Terminology

This document uses the terminology specified in Annex 1 of the ARF.

## 2 Generic High-Level Requirements for PIDs

The requirements in the table below are valid for all PIDs in the EUDI Wallet
ecosystem, regardless of the encoding used.

| **Index** | **Requirement specification** |
|-----------|--------------|
| PID_01 | A PID Provider SHALL issue any PID in both the format specified in ISO/IEC 18013-5 [ISO/IEC 18013-5] and the format specified in [SD-JWT VC]. *Note: CIR 2024/2977 mentions the W3C Verifiable Credentials Data Model v1.1 [W3C VCDM v1.1] instead of [SD-JWT VC]. However, W3C VCDM is not a complete specification of an attestation format. In particular, it does not specify a specific proof method to be used. Without additional specification, it is therefore impossible to implement a PID based on [W3C VCDM v1.1]. This Rulebook considers [SD-JWT VC] to essentially be such an additional specification.* |
| PID_02 | PID Providers SHALL use “eu.europa.ec.eudi.pid.1” as the attestation type for ISO/IEC 18013-5-compliant PIDs. *Notes: - This identifier uses the general format [Reverse Domain].[Domain Specific Extension]. Since the European Commission controls the domain ec.europa.eu, this attestation type identifier will not collide with any attestation type identifiers defined by other organisations in other Attestation Rulebooks. - The Commission may use the version number “1” in this identifier to distinguish between the first version of the PID, defined in this document, and any future version, which will then have an incremented version number.* |
| PID_03 | A PID Provider SHALL ensure that all of the mandatory attributes listed in [Section 3.2](#32-mandatory-attributes-specified-in-cir-20242977) are present in any PID it issues to a Wallet Unit. *Notes: - When requesting PID attributes from a Wallet Unit, a Relying Party is not necessarily required to request all mandatory attributes. - A User is allowed to refuse to present a mandatory attribute, if it is requested by a Relying Party.* |

## 3 PID attributes and metadata

### 3.1 Introduction

Sections 3.2, 3.3, 3.4 and 3.5 of this chapter list the mandatory and optional
PID attributes and PID metadata defined in CIR 2024/2977, respectively. Section
3.6 lists the optional PID attributes additionally defined in this PID Rulebook.

The data identifiers and definitions given in Sections 3.2, 3.3, 3.4, and 3.5
are identical to those in CIR 2024/2977, except where explicitly indicated that
some further explanations have been added in this Rulebook.

All data identifiers and definitions in this chapter are independent of any
encoding used. Consequently,

- the data identifiers in these tables are not necessarily the same as the
attribute identifiers used for PIDs complying with [ISO/IEC 18013-5]. [Chapter
4](#4-isoiec-18013-5-compliant-encoding-of-pid) specifies the data element
identifiers to be used for PIDs in [ISO/IEC 18013-5] format
- the data identifiers in these tables are not necessarily the same as the claim
names used for PIDs complying with [SD-JWT VC]. [Chapter
5](#5-sd-jwt-vc-based-encoding-of-pid) specifies the attribute identifiers to be
used for such PIDs.

### 3.2 Mandatory attributes specified in CIR 2024/2977

| **Data Identifier** | **Definition** |
|------------------------|--------------|
| family_name | Current last name(s) or surname(s) of the user to whom the person identification data relates. |
| given_name | Current first name(s), including middle name(s) where applicable, of the user to whom the person identification data relates. |
| birth_date | Day, month, and year on which the user to whom the person identification data relates was born. |
| birth_place | The country as an alpha-2 country code as specified in ISO 3166-1, or the state, province, district, or local area or the municipality, city, town, or village where the user to whom the person identification data relates was born. |
| nationality | One or more alpha-2 country codes as specified in ISO 3166-1, representing the nationality of the user to whom the person identification data relates. |

### 3.3 Optional attributes specified in CIR 2024/2977

| **Data Identifier** | **Definition** |
|------------------------|--------------|
| resident_address | The full address of the place where the user to whom the person identification data relates currently resides or can be contacted (street name, house number, city etc.). |
| resident_country | The country where the user to whom the person identification data relates currently resides, as an alpha-2 country code as specified in ISO 3166-1. |
| resident_state | The state, province, district, or local area where the user to whom the person identification data relates currently resides. |
| resident_city | The municipality, city, town, or village where the user to whom the person identification data relates currently resides. |
| resident_postal_code | The postal code of the place where the user to whom the person identification data relates currently resides. |
| resident_street | The name of the street where the user to whom the person identification data relates currently resides. |
| resident_house_number | The house number where the user to whom the person identification data relates currently resides, including any affix or suffix. |
| personal_administrative_number | A value assigned to the natural person that is unique among all personal administrative numbers issued by the provider of person identification data. Where Member States opt to include this attribute, they shall describe in their electronic identification schemes under which the person identification data is issued, the policy that they apply to the values of this attribute, including, where applicable, specific conditions for the processing of this value. |
| portrait | Facial image of the wallet user compliant with ISO 19794-5 or ISO 39794 specifications. **Further clarification added in this PID Rulebook:** See requirement PID_04 below. |
| family_name_birth | Last name(s) or surname(s) of the User to whom the person identification data relates at the time of birth. |
| given_name_birth | First name(s), including middle name(s), of the User to whom the person identification data relates at the time of birth. |
| sex | Values shall be one of the following: 0 = not known; 1 = male; 2 = female; 3 = other; 4 = inter; 5 = diverse; 6 = open; 9 = not applicable. For values 0, 1, 2 and 9, ISO/IEC 5218 applies. |
| email_address | Electronic mail address of the user to whom the person identification data relates, in conformance with [RFC 5322]. |
| mobile_phone_number | Mobile telephone number of the User to whom the person identification data relates, starting with the '+' symbol as the international code prefix and the country code, followed by numbers only. |

| **Index** | **Requirement specification** |
|-----------|--------------|
| PID_04 | The attribute portrait SHALL consist of a single portrait image in JPEG format. The portrait image SHALL comply with the quality requirements for a Full Frontal Image Type in ISO/IEC 19794-5 clauses 8.2, 8.3, and 8.4. However, the attribute portrait SHALL NOT comply with the format requirements in ISO/IEC 19794-5 clauses 8.1 and 8.5, meaning it SHALL NOT contain any of the headers or blocks specified in clause 5 except for the image data itself (a JPEG). |

### 3.4 Mandatory metadata specified in CIR 2024/2977

| **Data Identifier** | **Definition** |
|------------------------|--------------|
| expiry_date | Date (and if possible time) when the person identification data will expire. **Further clarification added in this PID Rulebook:** This attribute, as well as the optional issuance_date attribute specified in [Section 3.6](#36-additional-optional-attributes-specified-in-this-rulebook), pertains to the administrative validity period of the PID. It is up to the PID Provider to decide whether a PID has an administrative validity period. However, if present, it in general is different from the technical validity period of a PID. The technical validity period is a mandatory element of all PIDs (and also attestations) in the EUDI Wallet ecosystem. It typically is short, a few days or weeks at most, if not shorter, to mitigate challenges regarding tracking of Users by malicious Relying Parties based on the repeated presentation of the same PID. On the other hand, the administrative validity period is typically at least a few years long. During the administrative validity period of a PID, the PID Provider will therefore provide multiple successive PIDs to a User, typically without any actions being expected from the User. However, when the administrative validity period of a PID ends, typically the User has to apply for an entirely new PID.|
| issuing_authority | Name of the administrative authority that issued the person identification data, or the ISO 3166 alpha-2 country code of the respective Member State if there is no separate authority entitled to issue person identification data. |
| issuing_country | Alpha-2 country code, as specified in ISO 3166-1, of the country or territory of the provider of the person identification data. |

### 3.5 Optional metadata specified in CIR 2024/2977

| **Data Identifier** | **Definition** |
|------------------------|--------------|
| document_number | A number for the person identification data, assigned by the provider of person identification data. |
| issuing_jurisdiction | Country subdivision code of the jurisdiction that issued the person identification data, as specified in ISO 3166-2:2020, Clause 8. The first part of the code shall be the same as the value for the issuing country. |
| location_status | The location of validity status information on the person identification data where the providers of person identification data revoke person identification data. |

### 3.6 Additional optional attributes specified in this Rulebook

| **Data Identifier** | **Definition** |
|------------------------|--------------|
| issuance_date | Date (and if possible time) when the person identification data was issued and/or the administrative validity period of the person identification data began. See also the clarification for expiry_date in [Section 3.4](#34-mandatory-metadata-specified-in-cir-20242977). |
| age_over_18 | Attesting whether the User to whom the person identification data relates is currently an adult (true) or a minor (false). If present, the requirements in clause 7.2.5 of ISO/IEC 18013-5 are applicable for this attribute. |
| age_over_NN | Attesting whether the User to whom the person identification data relates is at least NN years old. N <> 18. Multiple instances of this attribute may be present, provided the value of NN is different in each of them. If present, the requirements in clause 7.2.5 of ISO/IEC 18013-5 are applicable for these attributes. |
| age_in_years | The current age of the User to whom the person identification data relates in years. |
| age_birth_year | The year when the User to whom the person identification data relates was born. |
| trust_anchor | This attribute indicates at least the URL at which a machine-readable version of the trust anchor to be used for verifying the PID can be found or looked up. *Note: This attribute corresponds to the location meant in Annex V point h) or Annex VII point h) of the [European Digital Identity Regulation], which is mandatory for QEAAs. This PID Rulebook adds this as an optional attribute for PIDs as well, so PID Providers are able to ensure that PIDs can be validated by Relying Parties in the same manner as QEAAs.* |

## 4 ISO/IEC 18013-5-compliant encoding of PID

### 4.1 High-Level Requirements for ISO/IEC 18013-5-compliant PIDs

The requirements in the table below are valid for PIDs in the EUDI Wallet
ecosystem that are compliant with [ISO/IEC 18013-5].

| **Index** | **Requirement specification** |
|-----------|--------------|
| PID_ISO_01 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL use the value “eu.europa.ec.eudi.pid.1” for the identifier of the namespace for the PID attributes specified in [Section 4.2](#42-encoding-of-pid-attributes-and-metadata). *Notes: - The version number “1” allows for future extension(s) or change(s) of the ISO/IEC 18013-5-compliant PID attributes. - This namespace has the same value as the attestation type specified in requirement PID_02. This is allowed according to ISO/IEC 18013-5.* |
| PID_ISO_02 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider MAY include attributes that are not defined in this document. If so, these attributes SHALL be defined within a domestic PID namespace as meant in requirement ARB_10 in Annex 2. The PID Provider SHALL generate the identifier for this domestic PID namespace by appending the applicable ISO 3166-1 alpha-2 country code or the ISO 3166-2 region code, separated by a period, to the PID namespace specified in PID_ISO_01, excluding the version number. The PID Provider MAY include a version number in the domestic PID namespace identifier. *Note: For example, the identifier of the first domestic PID namespace for Germany could be “eu.europa.ec.eudi.pid.de.1”.* |
| PID_ISO_03 | A PID Provider that defines a domestic namespace SHALL publish the namespace, including all attribute identifiers, their definition, presence and encoding format, in an Attestation Rulebook complying with all applicable requirements in Annex 2 [Topic 12]. |
| PID_ISO_04 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL include both the attributes and the metadata specified in CIR 2024/2977 in the PID as (issuer-signed or device-signed) data elements. *Note: This implies that technically speaking, there is no difference between these attributes and metadata.* |
| PID_ISO_05 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL encode each attribute or metadata in the PID as specified in the third column of the tables in [Section 4.2.1](#421-overview). |
| PID_ISO_06 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL encode each attribute or metadata in the PID in Concise Binary Object Representation (CBOR) according to [RFC 8949]. |
| PID_ISO_07 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that each PID contains at most one attribute with the same attribute identifier. |
| PID_ISO_08 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that the value of all attributes and metadata in the PID is valid at the value of the timestamp in the validFrom element in the MSO, see [ISO/IEC 18013-5] clause 9.1.2.4. *Note: The value of the age_over_18, age_over_NN, or age_in_years attributes, if present, changes whenever the User to whom the person identification data relates has a relevant birthday. The value of many other attributes will also change over time.* |
| PID_ISO_09 | When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that the issuance_date attribute, if present, is not later than the validFrom element in the MSO, see [ISO/IEC 18013-5] clause 9.1.2.4. |

### 4.2 Encoding of PID attributes and metadata

#### 4.2.1 Overview

The ISO/IEC 18013-5-compliant encoding of PID attributes and metadata is
specified in the table below. The table contains the following information for
all attributes:

- The first column lists the data identifier specified in
[Chapter 3](#3-pid-attributes-and-metadata) above.
- The second column lists the corresponding attribute identifier to be used in
presentation requests and responses according to [ISO/IEC 18013-5].
- The third column indicates the encoding of each attribute. This column uses
CDDL representation types defined in [RFC 8610]. The following notes and
requirements apply:
    - tstr, uint, bstr, bool and tdate are CDDL representation types defined in
  [RFC 8610].
    - Regarding type tstr: this document confirms that, as specified in RFC
    8949, a tstr SHALL be encoded in UTF-8 and SHALL support the full Unicode
    range.
    - All attributes having encoding type tstr SHALL have a maximum length of
    150 characters.
    - This document specifies full-date as full-date = #6.1004(tstr), where tag
    1004 is specified in [RFC 8943].
    - In accordance with [RFC 8949], section 3.4.1, a tdate attribute SHALL
    contain a date-time string as specified in [RFC 3339]. In accordance with
    [RFC 8943], a full-date attribute SHALL contain a full-date string as
    specified in [RFC 3339].
    - The following requirements apply to the representation of dates in
    attributes, unless otherwise indicated:
        - Fractions of seconds SHALL NOT be used;
        - A local offset from UTC SHALL NOT be used; the time-offset defined in
        [RFC 3339] SHALL be to "Z".
    - RFC 8949, section 4.2, describes four rules for canonical CBOR. Three of
    those rules SHALL be implemented for all CBOR structures in PIDs, as
    follows:
        - integers (major types 0 and 1) SHALL be as small as possible;
        - the expression of the length in a bstr, tstr, array or map SHALL be as
        short as possible;
        - indefinite-length items SHALL be made into definite-length items.

| **Data Identifier** | **Attribute identifier** | **Encoding format** |
|------------------------|--------------|------------------|
| family_name | family_name | tstr |
| given_name | given_name | tstr |
| birth_date | birth_date | full-date, see [Section 4.2.4](#424-attribute-birth_date). |
| birth_place | birth_place | tstr |
| nationality | nationality | nationalities, see [Section 4.2.2](#422-attribute-nationality). |
| resident_address | resident_address | tstr |
| resident_country | resident_country | tstr |
| resident_state | resident_state | tstr |
| resident_city | resident_city | tstr |
| resident_postal_code | resident_postal_code | tstr |
| resident_street | resident_street | tstr |
| resident_house_number | resident_house_number | tstr |
| personal_administrative_number | personal_administrative_number | tstr |
| portrait | portrait | bstr |
| family_name_birth | family_name_birth | tstr |
| given_name_birth | given_name_birth | tstr |
| sex | sex | uint |
| email_address | email_address | tstr |
| mobile_phone_number | mobile_phone_number | tstr |
| expiry_date | expiry_date | tdate or full-date |
| issuing_authority | issuing_authority | tstr |
| issuing_country | issuing_country | tstr |
| document_number | document_number | tstr |
| issuing_jurisdiction | issuing_jurisdiction | tstr |
| location_status | - | See [Section 4.2.3](#423-attribute-location_status). |
| issuance_date | issuance_date | tdate or full-date |
| age_over_18 | age_over_18 | bool |
| age_over_NN | age_over_NN | bool |
| age_in_years | age_in_years | uint |
| age_birth_year | age_birth_year | uint |
| trust_anchor | trust_anchor | tstr |

#### 4.2.2 Attribute nationality

The attribute nationality takes as its value an array of Alpha-2 country codes
as specified in ISO 3166-1. Using CDDL notation as specified in RFC 8610, the
encoding of this data element is:

nationalities = [
\+ CountryCode
]

CountryCode = tstr ; Alpha-2 country code specified in ISO 3166-1

Note: If the User to whom the person identification data relates has multiple
nationalities (and the PID Provider is willing to attest to these multiple
nationalities), the PID Provider can include all of the nationalities in the
nationalities array. A potential drawback of this solution is that the User
cannot selectively disclose only one of these nationalities, since for ISO/IEC
18013-5-compliant attestations, always the entire array will be presented if the
User approves the presentation of the nationality attribute. A potential
solution to this challenge is for the PID Provider to include only one
nationality in the nationality attribute, and for the remaining nationalities
to use one or more domestic data attributes specified according to requirement
PID_ISO_02.

#### 4.2.3 Attribute location_status

For ISO/IEC 18013-5-compliant PIDs, the attribute location_status SHALL be
absent, since revocation information will be added to the MSO.

#### 4.2.4 Attribute birth_date

For PIDs compliant with ISO/IEC 18013-5, dates are encoded as specified in RFC
8943. This encoding does not contain provisions for encoding partial dates. This
may cause challenges in case the birth date of a User is not (fully) known. To
deal with such cases, a PID Provider could adopt a policy to choose appropriate
values for the unknown date elements. However, mandating such a policy is out of
scope of this document.

## 5 SD-JWT VC-based encoding of PID

### 5.1 High-Level Requirements for SD-JWT VC-based PIDs

The requirements in the table below are valid for PIDs in the EUDI Wallet
ecosystem that are compliant with [SD-JWT VC].

| **Index** | **Requirement specification** |
|-----------|-------------------------------|
| PID_SVC_01 | A PID Provider issuing [SD-JWT VC]-compliant PIDs SHALL include the vct claim in their PIDs, where the vct claim SHALL be a URN within the `urn:eudi:pid:` namespace. The type indicated by the vct claim SHALL be `urn:eudi:pid:1` for the type defined in this document or a domestic type that extends it. |
| PID_SVC_02 | A catalog linked in the PID Rulebook SHALL associate all SD-JWT VC types for PIDs with SD-JWT VC type metadata which will include the same information as the PID Rulebook applicable to the type.  |
| PID_SVC_03 | A PID Provider that defines a domestic type SHALL publish information about the type, including all claim identifiers, their definition, presence and encoding format, in an Attestation Rulebook complying with all applicable requirements in Annex 2 [Topic 12]. |
| PID_SVC_04 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL include both the attributes and the metadata specified in CIR 2024/2977 in the PID as claims. *Note: This implies that technically speaking, there is no difference between these attributes and metadata.* |
| PID_SVC_05 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL encode each attribute or metadata in the PID as specified in the tables in [Section 5.2](#52-encoding-of-pid-attributes). |
| PID_SVC_06 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL ensure that the value of all attributes and metadata in the PID is valid at the value of the timestamp in the nbf claim, if present. *Note: The value of the age-related claims, if present, changes whenever the User to whom the person identification data relates has a relevant birthday. The value of many other attributes will also change over time.* |
| PID_SVC_07 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL ensure that the date_of_issuance claim, if present, is not later than the value of the timestamp in the nbf claim, if present. |
| PID_SVC_08 | When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL make all claims (i.e., all top-level properties, all nested properties, and all array entries) selectively disclosable individually, except those claims defined as non-selectively disclosable in [SD-JWT VC]. |


### 5.2 Encoding of PID attributes

Following Requirement ARB_06b, SD-JWT VC-encoded PID attestations use claim names that are either registered in the JSON Web
Token Claims Registry [IANA-JWT-Claims], are Public Names as defined in [RFC 7519], or are Private Names specific
to the attestation type. The tables below maps the data
identifiers defined above to the corresponding claim names.

Note that a hierarchical claim name structure can be used in SD-JWT VC encoded
PIDs as SD-JWT allows for individual selective disclosure of objects
and their properties. A hierarchical claim name structure is indicated by the
notation `parent.child` in the tables below.

The following IANA registered claim names are to be used for PIDs:

| **Data Identifier** | **Attribute identifier** | **Encoding format** | **Reference/Notes** | 
|---------------------|--------------------------|---------------------|---------------------|
| family_name | family_name | string | Section 5.1 of [OIDC] | 
| given_name | given_name | string | Section 5.1 of [OIDC] | 
| birth_date | birthdate | string, ISO 8601-1 [ISO8601‑1] YYYY-MM-DD format | Section 5.1 of [OIDC] | 
| birth_place | place_of_birth.country | string | Section 4.1 of [EKYC]; for the country | 
| birth_place | place_of_birth.region | string | Section 4.1 of [EKYC]; for the state, province or other region | 
| birth_place | place_of_birth.locality | string | Section 4.1 of [EKYC]; for the city or other locality | 
| nationality | nationalities | array of strings | Section 4.1 of [EKYC]; using alpha-2 country codes as defined in [Section 3.2](#32-mandatory-attributes-specified-in-cir-20242977) | 
| resident_address | address.formatted | string | Section 5.1 of [OIDC] | 
| resident_country | address.country | string | Section 5.1 of [OIDC] | 
| resident_state | address.region | string | Section 5.1 of [OIDC] | 
| resident_city | address.locality | string | Section 5.1 of [OIDC] | 
| resident_postal_code | address.postal_code | string | Section 5.1 of [OIDC] | 
| resident_street | address.street_address | string | Section 5.1 of [OIDC] | 
| resident_house_number | address.house_number | string | Section 5.1 of [OIDC] | 
| family_name_birth | birth_family_name | string | Section 4.1 of [EKYC] | 
| given_name_birth | birth_given_name | string | Section 4.1 of [EKYC] | 
| email_address | email | string | Section 5.1 of [OIDC] | 
| mobile_phone_number | phone_number | string | Section 5.1 of [OIDC] | 
| portrait | picture | string; data URL containing the base64-encoded portrait in JPEG format according to PID_04  | Section 5.1 of [OIDC] |

Note: The standard JWT claims nbf and exp are used to express the technical validity of the SD-JWT VC PID.

The following Private Names specific to the attestation type defined here are to be used for PIDs:

| **Data Identifier** | **Attribute identifier** | **Encoding format** | **Notes** | 
|---------------------|--------------------------|---------------------|-----------|
| expiry_date | date_of_expiry | string | ISO 8601-1 [ISO8601‑1] YYYY-MM-DD format, as defined in Section 5.4.4.2 of [EKYC Schema] |
| issuance_date | date_of_issuance | string | ISO 8601-1 [ISO8601‑1] YYYY-MM-DD format, as defined in Section 5.4.4.2 of [EKYC Schema] |
| personal_administrative_number | personal_administrative_number | string | |
| sex | sex | number | numeric encoding as described in [Section 3.3](#33-optional-attributes-specified-in-cir-20242977); gender from [OIDC] uses a different value range and is therefore not used | 
| issuing_authority | issuing_authority | string | |
| issuing_country | issuing_country | string | |
| document_number | document_number | string | | 
| issuing_jurisdiction | issuing_jurisdiction | string | |
| location_status | - | See [Section 5.2.2](#522-attribute-location_status) | |
| age_over_18 | age_equal_or_over.18 | boolean (see note below) | |
| age_over_NN | age_equal_or_over.NN | boolean (see note below) | |
| age_in_years | age_in_years | number | |
| age_birth_year | age_birth_year | number | |
| trust_anchor | trust_anchor | string | |

Note: Instead of separate claims for (for example) age_over_16, age_over_18, age_over_65, etc., a single claim age_equal_or_over is used. This claim is an object with properties for each age as follows:

```json
"age_equal_or_over": {
    "16": true,
    "18": true,
    "65": false
}
```

#### 5.2.2 Attribute location_status

For SD-JWT VC-compliant PIDs, the PID issuer will add validity status
information, if needed, as specified in [SD-JWT VC]. This PID Rulebook does not
specify a separate attribute for including the location of validity status
information.

### 5.3 Note on VCT

SD-JWT VC defines the Verifiable Credential Type (`vct`). A type comes
with associated metadata that, for instance, provides information about
the type itself, outlines a schema detailing the claims that are
optional or mandatory in the SD-JWT VC, and specifies their display
methods. Additionally, a type can extend another type, enabling
the creation of domestic types based on a common EU-wide type, while preserving
the mandatory claims from the base type. Domestic
types MAY however define additional claims and display information. Details
are defined in [SD-JWT VC].

This document defines the base type to be "urn:eudi:pid:1". As a convention, all
PIDs must use types in the namespace "urn:eudi:pid:".

SD-JWT VC specifies Type Metadata as a machine-readable format for information
regarding a type, including the information on claims such as what is contained
in this document. Requirement PID_SVC_02 requires that the information on the
common EU-wide type as well as on any domestic types is published and
accessible in a catalog.

### 5.4 Example


EXAMPLE: The following example shows the payload of a PID in SD-JWT VC format before the encoding into the SD-JWT format.

```json
{
    "vct": "urn:eudi:pid:de:1",

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

    "sex": 5,

    "place_of_birth": {
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


## 6 Further requirements

### 6.1 Embedded disclosure policies

Requirements regarding the inclusion of an embedded disclosure policy into a
PID, if any, will be added in a future version of this PID Rulebook.

### 6.2 Displaying the PID to the User

Requirements regarding how a Wallet Unit should display the PID and the PID
attributes to the User, if any, will be added in a future version of this PID
Rulebook.

## 7 References

See [Chapter 9](../../architecture-and-reference-framework-main.md#9-references) of the ARF main document.
