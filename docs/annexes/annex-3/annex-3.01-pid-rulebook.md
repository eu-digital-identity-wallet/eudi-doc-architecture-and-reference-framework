# Introduction

## Document scope

This document is the natural-person Person Identification Data (PID)
Rulebook and is part of the Architecture Reference Framework (ARF)
v1.5.0. It specifies how the mandatory and optional person
identification data for the natural person, as defined in Tables 1 and 2
in the Annex of the Commission Implementing Regulation on PID and EAA
[CIR 2024/2977], as well as the metadata specified in Table 5 of that
CIR, will be encoded as a within the EUDI Wallet ecosystem.
Additionally, this document specifies further optional PID attributes
that are not included in the CIR.

This document also specifies how a PID and all attributes in it are
encoded if the PID complies with [ISO/IEC 18013-5] and if it complies
with [SD-JWT VC].

Person identification data for the legal person is out of scope of this
document.

This PID Rulebook complies with all applicable requirements in Topic 12
(Attestation Rulebooks) in Annex 2 of the Architecture Reference
Framework v1.5.0.

## Document structure

This PID Rulebook is structured as follows:

- Chapter 2 contains generic high-level requirements, which are valid
 for all PIDs regardless of the encoding used.

- Chapter 3 describes the PID attributes and metadata on a generic
  level, regardless of the encoding used for the PID. Most of the
  content of this chapter is a direct copy of the Annex of Commission
  Implementing Regulation 2024/2977 on PID and EAA. However, a few
  additional attributes are specified in this chapter.

- Chapter 4 specifies how the PID attributes and metadata are encoded
  in case the PID complies with [ISO/IEC 18013-5].

-  Chapter 5 specifies how the PID attributes and metadata are encoded
  in case the PID complies with [SD-JWT VC]. In the current version
  of this PID Rulebook, this chapter is empty; it will be specified
  after further discussion with Member States.

## Key words

This document uses the capitalized key words 'SHALL', 'SHOULD' and 'MAY'
as specified in [RFC 2119], i.e., to indicate requirements,
recommendations and options specified in this document.

In addition, 'must' (non-capitalized) is used to indicate an external
constraint, i.e., a requirement that is not mandated by this document,
but, for instance, by an external document. The word 'can' indicates a
capability, whereas other words, such as 'will', and 'is' or 'are' are
intended as statements of fact.

## Terminology

This document uses the terminology specified in Annex 1 of the ARF
v1.5.0.

# Generic High-Level Requirements for PIDs



>PID_01</th>
<th><p>A PID Provider SHALL issue any PID in both the format specified
in ISO/IEC 18013-5 [ISO/IEC 18013-5] and the format specified in [SD-JWT
VC].</p>
<p>Note: CIR 2024/2977 mentions the W3C Verifiable Credentials Data
Model v1.1 [W3C VCDM v1.1] instead of [SD-JWT VC]. However, W3C VCDM is
not a complete specification of an attestation format. In particular, it
does not specify a specific proof method to be used. Without additional
specification, it is therefore impossible to implement a PID based on
[W3C VCDM v1.1]. This Rulebook considers [SD-JWT VC] to essentially be
such an additional specification.</p></th>
</tr>
</thead>
<tbody>
<tr>
<td>PID_02</td>
<td><p>PID Providers SHALL use the attestation type
“eu.europa.ec.eudiwallet.pid.1” for both ISO/IEC 18013-5-compliant and
SD-JWT VC-compliant PIDs.</p>
<p>Notes:</p>
<ul>
<li><p>This identifier follows uses the general format [Reverse
Domain].[Domain Specific Extension]. Since the European Commission
controls the domain ec.europa.eu, this attestation type identifier will
not collide with any attestation type identifiers defined by other
organisations in other Attestation Rulebooks.</p></li>
<li><p>The Commission may use the version number “1” in this identifier
to distinguish between the first version of the PID, defined in this
document, and any future version, which will then have an incremented
version number</p></li>
</ul></td>
</tr>
<tr>
<td>PID_03</td>
<td style="text-align: left;"><p>A PID Provider SHALL ensure that all of
the mandatory attributes listed in section 3.2 are present in any PID it
issues to a Wallet Unit.</p>
<p>Notes:</p>
<ul>
<li><p>When requesting PID attributes from a Wallet Unit, a Relying
Party is not necessarily required to request all mandatory
attributes.</p></li>
<li><p>A User is allowed to refuse to present a mandatory attribute, if
it is requested by a Relying Party.</p></li>
</ul></td>
</tr>
</tbody>
</table>

# PID attributes and metadata

## Introduction

Sections 3.2., 3.3 and 3.4 of this chapter lists the mandatory and
optional PID attributes and PID metadata defined in CIR 2024/2977,
respectively. Section 3.5 lists the optional PID attributes additionally
defined in this PID Rulebook.

The data identifiers and definitions given in sections 3.2, 3.3, and 3.4
are identical to those in CIR 2024/2977, except where explicitly
indicated that some further explanations have been added in this
Rulebook.

All data identifiers and definitions in this chapter are independent of
any encoding used. Consequently,

-  the data identifiers in these tables are not necessarily the same as
  the attribute identifiers used for PIDs complying with [ISO/IEC
  18013-5]. Section <span class="mark">X</span> specifies the
  attribute identifiers to be used for such PIDs.

-  the data identifiers in these tables are not necessarily the same as
  the attribute identifiers used for PIDs complying with [SD-JWT
  VC]. Section <span class="mark">X</span> specifies the attribute
  identifiers to be used for such PIDs.

## Mandatory attributes specified in CIR 2024/2977

<table>
<colgroup>
<col style="width: 21%" />
<col style="width: 78%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Data identifier</strong></th>
<th style="text-align: center;"><strong>Definition</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">family_name</td>
<td style="text-align: center;">Current last name(s) or surname(s) of
the user to whom the person identification data relates.</td>
</tr>
<tr>
<td style="text-align: center;">given_name</td>
<td style="text-align: center;">Current first name(s), including middle
name(s) where applicable, of the user to whom the person identification
data relates.</td>
</tr>
<tr>
<td style="text-align: center;">birth_date</td>
<td style="text-align: center;">Day, month, and year on which the user
to whom the person identification data relates was born.</td>
</tr>
<tr>
<td style="text-align: center;">birth_place</td>
<td style="text-align: center;">The country as an alpha-2 country code
as specified in ISO 3166-1, or the state, province, district, or local
area or the municipality, city, town, or village where the user to whom
the person identification data relates was born.</td>
</tr>
<tr>
<td style="text-align: center;">nationality</td>
<td style="text-align: center;">One or more alpha-2 country codes as
specified in ISO 3166-1, representing the nationality of the user to
whom the person identification data relates.</td>
</tr>
</tbody>
</table>

## Optional attributes specified in CIR 2024/2977

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Data identifier</strong></th>
<th style="text-align: center;"><strong>Definition</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">resident_address</td>
<td style="text-align: center;">The full address of the place where the
user to whom the person identification data relates currently resides or
can be contacted (street name, house number, city etc.).</td>
</tr>
<tr>
<td style="text-align: center;">resident_country</td>
<td style="text-align: center;">The country where the user to whom the
person identification data relates currently resides, as an alpha-2
country code as specified in ISO 3166-1.</td>
</tr>
<tr>
<td style="text-align: center;">resident_state</td>
<td style="text-align: center;">The state, province, district, or local
area where the user to whom the person identification data relates
currently resides.</td>
</tr>
<tr>
<td style="text-align: center;">resident_city</td>
<td style="text-align: center;">The municipality, city, town, or village
where the user to whom the person identification data relates currently
resides.</td>
</tr>
<tr>
<td style="text-align: center;">resident_postal_code</td>
<td style="text-align: center;">The postal code of the place where the
user to whom the person identification data relates currently
resides.</td>
</tr>
<tr>
<td style="text-align: center;">resident_street</td>
<td style="text-align: center;">The name of the street where the user to
whom the person identification data relates currently resides.</td>
</tr>
<tr>
<td style="text-align: center;">resident_house_number</td>
<td style="text-align: center;">The house number where the user to whom
the person identification data relates currently resides, including any
affix or suffix.</td>
</tr>
<tr>
<td style="text-align: center;">personal_administrative_number</td>
<td style="text-align: center;">A value assigned to the natural person
that is unique among all personal administrative numbers issued by the
provider of person identification data. Where Member States opt to
include this attribute, they shall describe in their electronic
identification schemes under which the person identification data is
issued, the policy that they apply to the values of this attribute,
including, where applicable, specific conditions for the processing of
this value.</td>
</tr>
<tr>
<td style="text-align: center;">portrait</td>
<td style="text-align: center;">Facial image of the wallet user
compliant with ISO 19794-5 or ISO 39794 specifications.</td>
</tr>
<tr>
<td style="text-align: center;">family_name_birth</td>
<td style="text-align: center;">Last name(s) or surname(s) of the User
to whom the person identification data relates at the time of
birth.</td>
</tr>
<tr>
<td style="text-align: center;">given_name_birth</td>
<td style="text-align: center;">First name(s), including middle name(s),
of the User to whom the person identification data relates at the time
of birth.</td>
</tr>
<tr>
<td style="text-align: center;">sex</td>
<td style="text-align: center;"><p>Values shall be one of the
following:</p>
<p>0 = not known;</p>
<p>1 = male;</p>
<p>2 = female;</p>
<p>3 = other;</p>
<p>4 = inter;</p>
<p>5 = diverse;</p>
<p>6 = open;</p>
<p>9 = not applicable.</p>
<p>For values 0, 1, 2 and 9, ISO/IEC 5218 applies.</p></td>
</tr>
<tr>
<td style="text-align: center;">email_address</td>
<td style="text-align: center;">Electronic mail address of the user to
whom the person identification data relates [in conformance with RFC
5322].</td>
</tr>
<tr>
<td style="text-align: center;">mobile_phone_number</td>
<td style="text-align: center;">Mobile telephone number of the User to
whom the person identification data relates, starting with the '+'
symbol as the international code prefix and the country code, followed
by numbers only.</td>
</tr>
</tbody>
</table>

## Mandatory metadata specified in CIR 2024/2977

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Data identifier</strong></th>
<th style="text-align: center;"><strong>Definition</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">expiry_date</td>
<td style="text-align: center;"><p>Date (and if possible time) when the
person identification data will expire.</p>
<p><strong>Further clarification added in this PID Rulebook:</strong>
This attribute, as well as the optional issuance_date attribute
specified in section 3.6, pertains to the administrative validity period
of the PID. It is up to the PID Provider to decide whether a PID has an
administrative validity period. However, if present, it in general is
different from the technical validity period of a PID. The technical
validity period is a mandatory element of all PIDs (and also
attestations) in the EUDI Wallet ecosystem. It typically is short, a few
days or weeks, to mitigate any challenges regarding tracking of Users by
malicious Relying Parties based on the repeated presentation of the same
PID. On the other hand, the administrative validity period is typically
at least a few years long.</p>
<p>During the administrative validity period of a PID, the PID Provider
will therefore provide multiple successive PIDs to a User, typically
without any actions being expected from the User. However, when the
administrative validity period of a PID ends, typically the User has to
apply for an entirely new PID.</p></td>
</tr>
<tr>
<td style="text-align: center;">issuing_authority</td>
<td style="text-align: center;">Name of the administrative authority
that issued the person identification data, or the ISO 3166 alpha-2
country code of the respective Member State if there is no separate
authority entitled to issue person identification data.</td>
</tr>
<tr>
<td style="text-align: center;">issuing_country</td>
<td style="text-align: center;">Alpha-2 country code, as specified in
ISO 3166-1, of the country or territory of the provider of the person
identification data.</td>
</tr>
</tbody>
</table>

## Optional metadata specified in CIR 2024/2977

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Attribute
identifier</strong></th>
<th style="text-align: center;"><strong>Definition</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">document_number</td>
<td style="text-align: center;">A number for the person identification
data, assigned by the provider of person identification data.</td>
</tr>
<tr>
<td style="text-align: center;">issuing_jurisdiction</td>
<td style="text-align: center;">Country subdivision code of the
jurisdiction that issued the person identification data, as specified in
ISO 3166-2:2020, Clause 8. The first part of the code shall be the same
as the value for the issuing country</td>
</tr>
<tr>
<td style="text-align: center;">location_status</td>
<td style="text-align: center;">The location of validity status
information on the person identification data where the providers of
person identification data revoke person identification data.</td>
</tr>
</tbody>
</table>

## Additional optional attributes specified in this Rulebook

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 73%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Attribute
identifier</strong></th>
<th style="text-align: center;"><strong>Definition</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">issuance_date</td>
<td style="text-align: center;">Date (and if possible time) when the
person identification data was issued and/or the administrative validity
period of the person identification data began. See also the
clarification for expiry_date in section 3.4.</td>
</tr>
<tr>
<td style="text-align: center;">age_over_18</td>
<td style="text-align: center;">Attesting whether the User to whom the
person identification data relates is currently an adult (true) or a
minor (false).</td>
</tr>
<tr>
<td style="text-align: center;">age_over_NN</td>
<td style="text-align: center;">Attesting whether the User to whom the
person identification data relates is at least NN years old. N &lt;&gt;
18.</td>
</tr>
<tr>
<td style="text-align: center;">age_in_years</td>
<td style="text-align: center;">The current age of the User to whom the
person identification data relates in years.</td>
</tr>
<tr>
<td style="text-align: center;">age_birth_year</td>
<td style="text-align: center;">The year when the User to whom the
person identification data relates was born.</td>
</tr>
</tbody>
</table>

# ISO/IEC 18013-5-compliant encoding of PID

## High-Level Requirements for ISO/IEC 18013-5-compliant PIDs

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<thead>
<tr>
<th>PID_ISO_01</th>
<th style="text-align: left;"><p>When issuing a PID compliant with
[ISO/IEC 18013-5], a PID Provider SHALL use the value
“eu.europa.ec.eudiwallet.pid.1” for the identifier of the namespace for
the PID attributes specified in section 4.2.</p>
<p>Notes:</p>
<ul>
<li><p>The version number “1” allows for future extension(s) or
change(s) of the ISO/IEC 18013-5-compliant PID attributes.</p></li>
<li><p>This namespace has the same value as the attestation type
specified in requirement PID_02. This is allowed according to ISO/IEC
18013-5.</p></li>
</ul></th>
</tr>
</thead>
<tbody>
<tr>
<td>PID_ISO_02</td>
<td style="text-align: left;"><p>When issuing a PID compliant with
[ISO/IEC 18013-5], a PID Provider MAY include attributes that are not
defined in this document. If so, these attributes SHALL be defined
within a domestic PID namespace as meant in requirement ARB_10 in Annex
2. The PID Provider SHALL generate the identifier for this domestic PID
namespace by appending the applicable ISO 3166-1 alpha-2 country code or
the ISO 3166-2 region code, separated by a period, to the PID namespace
specified in PID_ISO_01, excluding the version number. The PID Provider
MAY include a version number in the domestic PID namespace
identifier.</p>
<p>Note: For example, the identifier of the first domestic PID namespace
for Germany could be “eu.europa.ec.eudiwallet.pid.de.1”.</p></td>
</tr>
<tr>
<td>PID_ISO_03</td>
<td style="text-align: left;">A PID Provider that defines a domestic
namespace SHALL publish the namespace, including all attribute
identifiers, their definition, presence and encoding format, in an
Attestation Rulebook complying with all applicable requirements in Annex
2 [Topic 12].</td>
</tr>
<tr>
<td>PID_ISO_04</td>
<td style="text-align: left;">When issuing a PID compliant with [ISO/IEC
18013-5], a PID Provider SHALL encode both the attributes and the
metadata specified in CIR 2024/799 as (issuer-signed or device-signed)
data elements.</td>
</tr>
<tr>
<td>PID_ISO_05</td>
<td style="text-align: left;"><p>When issuing a PID compliant with
[ISO/IEC 18013-5], a PID Provider SHALL encode each attribute or
metadata in the PID as specified in the third column of the table in
section 4.2.1.</p>
<p>Note: For ISO/IEC 18013-5 compliant PIDs,</p></td>
</tr>
<tr>
<td>PID_ISO_06</td>
<td style="text-align: left;">When issuing a PID compliant with [ISO/IEC
18013-5], a PID Provider SHALL encode each attribute or metadata in the
PID in Concise Binary Object Representation (CBOR) according to [RFC
8949].</td>
</tr>
<tr>
<td>PID_ISO_07</td>
<td style="text-align: left;">When issuing a PID compliant with [ISO/IEC
18013-5], a PID Provider SHALL ensure that each PID contains at most one
attribute with the same attribute identifier.</td>
</tr>
<tr>
<td>PID_ISO_08</td>
<td style="text-align: left;"><p>When issuing a PID compliant with
[ISO/IEC 18013-5], a PID Provider SHALL ensure that the value of all
attributes and metadata in the PID is valid at the value of the
timestamp in the validFrom element in the MSO, see [ISO/IEC 18013-5]
clause 9.1.2.4.</p>
<p>Note: The value of the age_over_18, age_over_NN, and age_in_years
attributes, if present, changes whenever the User to whom the person
identification data relates has a relevant birthday. The value of many
other attributes will also change over time.</p></td>
</tr>
<tr>
<td>PID_ISO_09</td>
<td style="text-align: left;">When issuing a PID compliant with [ISO/IEC
18013-5], a PID Provider SHALL ensure that the issuance_date attribute,
if present, is not later than the validFrom element in the MSO, see
[ISO/IEC 18013-5] clause 9.1.2.4.</td>
</tr>
</tbody>
</table>

## Encoding of PID attributes and metadata

### Overview

The ISO/IEC 18013-5-compliant encoding of PID attributes and metadata is
specified in the table below. The table contains the following
information for all attributes:

-  The first column lists the data identifier specified in Chapter 3
  above.

-  The second column lists the corresponding attribute identifier to be
  used in presentation requests and responses according to
  [ISO18013-5].

-  The third column indicates the encoding of each attribute. This
  column uses CDDL representation types defined in [RFC 8610]. Note
  the following:

  -  tstr, uint, bstr, bool and tdate are CDDL representation types
    defined in [RFC 8610].

  -  All attributes having encoding type tstr SHALL have a maximum
    length of 150 characters.

  -  This document specifies full-date as full-date = \#6.1004(tstr),
    where tag 1004 is specified in [RFC 8943].

  -  In accordance with [RFC 8949], section 3.4.1, a tdate
    attribute shall contain a date-time string as specified in [RFC
    3339]. In accordance with [RFC 8943], a full-date attribute
    shall contain a full-date string as specified in [RFC 3339].

  -  The following requirements SHALL apply to the representation of
    dates in attributes, unless otherwise indicated:

    -  Fractions of seconds SHALL NOT be used;

    -  A local offset from UTC SHALL NOT be used; the time-offset
      defined in [RFC 3339] SHALL be to “Z”.

  -  RFC 8949, section 4.2, describes four rules for canonical CBOR.
    Three of those rules shall be implemented for all CBOR
    structures as follows:

    -  integers (major types 0 and 1) shall be as small as
      possible;

    -  the expression of the length in a bstr, tstr, array or map
      shall be as short as possible;

    -  indefinite-length items shall be made into definite-length
      items.

<table>
<colgroup>
<col style="width: 29%" />
<col style="width: 36%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th style="text-align: center;"><strong>Data identifier</strong></th>
<th style="text-align: center;"><strong>Attribute
identifier</strong></th>
<th style="text-align: center;"><strong>Encoding format</strong></th>
</tr>
<tr>
<th colspan="3" style="text-align: center;"><strong>Mandatory attributes
specified in CIR 2024/2977, see section 3.2</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: center;">family_name</td>
<td style="text-align: center;">family_name</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">given_name</td>
<td style="text-align: center;">given_name</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">birth_date</td>
<td style="text-align: center;">birth_date</td>
<td style="text-align: center;">full-date</td>
</tr>
<tr>
<td style="text-align: center;">birth_place</td>
<td style="text-align: center;">birth_place</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">nationality</td>
<td style="text-align: center;">nationality</td>
<td style="text-align: center;"><p>nationalities</p>
<p>See section 4.2.2</p></td>
</tr>
<tr>
<td colspan="3" style="text-align: center;"><strong>Optional attributes
specified in CIR 2024/2977, see section 3.3</strong></td>
</tr>
<tr>
<td style="text-align: center;">resident_address</td>
<td style="text-align: center;">resident_address</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">resident_country</td>
<td style="text-align: center;">resident_country</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">resident_state</td>
<td style="text-align: center;">resident_state</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">resident_city</td>
<td style="text-align: center;">resident_city</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">resident_postal_code</td>
<td style="text-align: center;">resident_postal_code</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">resident_street</td>
<td style="text-align: center;">resident_street</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">resident_house_number</td>
<td style="text-align: center;">resident_house_number</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">personal_administrative_number</td>
<td style="text-align: center;">personal_administrative_number</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">portrait</td>
<td style="text-align: center;">portrait</td>
<td style="text-align: center;">See section 4.2.3</td>
</tr>
<tr>
<td style="text-align: center;">family_name_birth</td>
<td style="text-align: center;">family_name_birth</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">given_name_birth</td>
<td style="text-align: center;">given_name_birth</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">sex</td>
<td style="text-align: center;">sex</td>
<td style="text-align: center;">uint</td>
</tr>
<tr>
<td style="text-align: center;">email_address</td>
<td style="text-align: center;">email_address</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">mobile_phone_number</td>
<td style="text-align: center;">mobile_phone_number</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;"><strong>Mandatory metadata
specified in CIR 2024/2977, see section 3.4</strong></td>
</tr>
<tr>
<td style="text-align: center;">expiry_date</td>
<td style="text-align: center;">expiry_date</td>
<td style="text-align: center;">tdate or full-date</td>
</tr>
<tr>
<td style="text-align: center;">issuing_authority</td>
<td style="text-align: center;">issuing_authority</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">issuing_country</td>
<td style="text-align: center;">issuing_country</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;"><strong>Optional metadata
specified in CIR 2024/2977, see section 3.5</strong></td>
</tr>
<tr>
<td style="text-align: center;">document_number</td>
<td style="text-align: center;">document_number</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">issuing_jurisdiction</td>
<td style="text-align: center;">issuing_jurisdiction</td>
<td style="text-align: center;">tstr</td>
</tr>
<tr>
<td style="text-align: center;">location_status</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;">See section 4.2.4</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;"><strong>Additional optional
attributes specified in this PID Rulebook, see section 3.6</strong></td>
</tr>
<tr>
<td style="text-align: center;">issuance_date</td>
<td style="text-align: center;">issuance_date</td>
<td style="text-align: center;">tdate or full-date</td>
</tr>
<tr>
<td style="text-align: center;">age_over_18</td>
<td style="text-align: center;">age_over_18</td>
<td style="text-align: center;">bool</td>
</tr>
<tr>
<td style="text-align: center;">age_over_NN</td>
<td style="text-align: center;">age_over_NN</td>
<td style="text-align: center;">bool</td>
</tr>
<tr>
<td style="text-align: center;">age_in_years</td>
<td style="text-align: center;">age_in_years</td>
<td style="text-align: center;">uint</td>
</tr>
<tr>
<td style="text-align: center;">age_birth_year</td>
<td style="text-align: center;">age_birth_year</td>
<td style="text-align: center;">uint</td>
</tr>
</tbody>
</table>

### Attribute nationality 

The attribute nationality takes as its value an array of Alpha-2 country
codes as specified in ISO 3166-1. Using CDDL encoding as specified in
RFC 8610, the encoding of this data element is:

nationalities = [

\+ CountryCode

]

CountryCode = tstr ; Alpha-2 country code specified in ISO 3166-1

Note: If the User to whom the person identification data relates has
multiple nationalities (and the PID Provider is willing to attest to
these multiple nationalities), the PID Provider can include all of the
nationalities in the nationalities array. A potential drawback of this
solution is that the User cannot selectively disclose only one or these
nationalities, since for ISO/IEC 18013-5-compliant attestations, always
the entire array will be presented if the User approves the presentation
of the nationality attribute. A potential solution to this challenge is
for the PID Provider to include only one nationality in the nationality
attribute, and for the remaining nationalities use one or more domestic
data attributes specified according to requirement PID\_ISO\_02.

### Attribute portrait

Commission Implementing Regulation 2024/2977 describes the optional
attribute portrait as “Facial image of the wallet user compliant with
ISO 19794-5 or ISO 39794 specifications.”

In order to ensure a single consistent encoding of the portrait, this
PID Rulebook additionally specifies the following:

-  The attribute portrait SHALL consist of a single portrait image in
  JPEG format.

-  The portrait image SHALL comply with the requirements for a Full
  Frontal Image Type in ISO/IEC 19794-5.

-  The image SHALL be encoded as binary data.

### Attribute location\_status 

The attribute location\_status SHALL NOT be present in ISO/IEC 18013-5
compliant PIDs. For such PIDs, revocation information is included in the
MSO, as specified in ISO/IEC 18013-5:2025.

# SD-JWT VC-based encoding of PID

## High-Level Requirements for SD-JWT VC-compliant PIDs

High-level requirements for SD-JWT VC-compliant PIDs will be added to a
later version of this PID Rulebook.

## Encoding of PID attributes

The encoding of PID attributes for SD-JWT VC-compliant PIDs will be
added to a later version of this PID Rulebook.

# References

See Chapter 9 of the main ARF 1.4.0 document.
