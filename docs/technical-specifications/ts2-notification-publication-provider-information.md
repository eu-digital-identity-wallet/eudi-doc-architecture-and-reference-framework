<img align="right" height="50" src="https://raw.githubusercontent.com/eu-digital-identity-wallet/eudi-srv-web-issuing-eudiw-py/34015dc3c6f52529a99e673df1d4fa69d50f7ff5/app/static/ic-logo.svg"/><br/>

# Specification of systems enabling the notification and subsequent publication of Provider information

## Abstract

The present document specifies the data model and systems enabling the notification and subsequent publication of Provider information.

### [GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/427)

## Versioning

| Version | Date | Description |
|---------|-------------|--------------------------------------------------------------|
| `0.1` | 16.01.2025 | Initial version for first discussions. |
| `0.2` | 10.02.2025 | Version with first feedback integrated. |
| `0.3` | 09.03.2025 | Version with more comments integrated. |

## 1. Introduction and Overview

The present document specifies selected technical and procedural aspects related to the **notification and
subsequent publication of Provider information** according to (EU) No 910/2014 and the Commission Implementation Regulation
(CIR) [(EU) 2024/2980](https://eur-lex.europa.eu/eli/reg_impl/2024/2980/oj) of 28 November 2024 laying down rules for the application of Regulation
(EU) No 910/2014 of the European Parliament and of the Council as regards **notifications to the Commission
concerning the European Digital Identity Wallet (EUDIW) ecosystem**.

This document also covers the notification of "Public Body Authentic Source
Electronic Attestation of Attributes (PuB-EAA) Providers" according to Article 45f Nr. 3 of (EU) No 910/2014 together with the
envisioned notification procedure according to the [Draft of the CIR for PuB-EAA](https://tinyurl.com/IA-45def-draft).

To this extent the present document addresses the following types of Providers and notifications:

1. **Registrars and Registers of Wallet-Relying Parties** (see Article 5a Nr. 18 (a) of (EU) No 910/2014 and
 Annex II 1. of CIR (EU) 2024/2980,
2. **Wallet Providers** and mechanism to validate authenticity and validity of Wallet Units (see Article 5a Nr. 18 (b)
 of No 910/2014 and Annex II 2. of CIR (EU) 2024/2980),
3. **Providers of Person Identification Data (PID)** and mechanisms enabling the authentication and validation of PID
 (see Article 5a Nr. 18 (c) of (EU) No 910/2014 and Annex II 3. of CIR (EU) 2024/2980),
4. **Providers of Wallet-Relying Party Access Certificates** (see Annex II 4. of CIR (EU) 2024/2980)
5. **Public Body Authentic Source Electronic Attestation of Attributes (PuB-EAA) Providers** (see Article 45f Nr. 3 of
 (EU) No 910/2014) and Annex III of [Draft of the CIR for PuB-EAA](https://tinyurl.com/IA-45def-draft)),

The following notification procedures are out of scope of the present document, as they are well
established already:

* Notification of **eID Schemes** according to Article 9 of (EU) No 910/2014
* Notification of **Conformity Assessment Bodies** according to Article 20 (b) 1b of the amended Regulation (EU) No 910/2014
* Notification of **Supervisory Bodies for the European Digital Identity Wallet Framework** according to Article 46a of (EU) No 910/2014
* Notification of **Supervisory Bodies for Trust Services according** to Article 46b of (EU) No 910/2014
* Notification of **Single Points of Contact** according to Article 46c of (EU) No 910/2014
* Notification of **Qualified Trust Service Providers** according to Article 21 of (EU) No 910/2014 to the national Supervisory
 Body and the related management of **Trusted lists** according to Article 22 of (EU) No 910/2014.

## 2. Data Model

The present data model has been created based on the existing implementing act CIR [(EU) 2024/2980](https://eur-lex.europa.eu/eli/reg_impl/2024/2980/oj) and
and the published drafts of the forthcoming implementing acts [Draft of the CIR for PuB-EAA](https://tinyurl.com/IA-45def-draft) and [Draft of the CIR for RP-Registration](https://tinyurl.com/IA-5b-draft),
while keeping the [SEMIC Style Guide](https://semiceu.github.io/style-guide/1.0.0/index.html) in mind and aligning it with the [Core Business Vocabulary](https://semiceu.github.io/Core-Business-Vocabulary/releases/2.2.0/) as much
as reasonable.

![EUDI-Providers](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/technical-specifications/img/EUDI-Providers.png)

As outlined in the above figure, it contains the following **main classes**:

* **Provider**
* **WRPRegistrar**
* **WalletProvider**
* **PIDProvider**
* **PubEEAProvider**
* **TrustServiceProvider** with its subclass **WRPAccCertProvider**
* **WalletRelyingParty**

These classes are defined using the following **auxiliary classes**

* **Claim**
* **Document**
* **Identifier**
* **Law**
* **Policy**
* **TrustService**

### 2.1 Provider

The ``Provider`` class is the central class of the data model from which the other classes for the individual
provider classes derive. It contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|---------------|--------------|-----------------------------------|--------|
| `type` | [1..1] | *string* | specifies the **type** of the provider in form of a URI according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html), whereas the following URIs are defined in the present document: <ul><li> http://data.europa.eu/eudi/WRPRegistrar</li> <li>http://data.europa.eu/eudi/PIDProvider</li> <li> http://data.europa.eu/eudi/PubEEAProvider</li> <li>http://data.europa.eu/eudi/WRPAccCertProvider</li> <li>http://data.europa.eu/eudi/WalletRelyingParty</li></ul> |
| ``legalName`` | [1..*] | *string* | specifies the **legal name** of the provider. |
| ``regNum`` | [0..*] | [*Identifier*](#283-identifier) | specifies a **registration number** of the provider, if applicable. |
| ``country`` | [1..1] | *string* | specifies the alpha-2 **country code** according to ISO 3166-1 of the country in which the provider is established, or the string "EU" for providers operating on a European level. |
| ``email`` | [1..*] | *string* | specifies an **email address** according to [RFC5322](https://www.rfc-editor.org/rfc/rfc5322.html) of the provider for matters related to EUDI. |
| ``phone`` | [1..*] | *string* | specifies a **phone number** of the provider for matters related to EUDI starting with the ‘+’ symbol as the international code prefix and the country code, followed by numbers only as specified in [RFC2806](https://www.rfc-editor.org/rfc/rfc2806.html). |
| ``infoURI`` | [0..*] | *string* | specifies the URL of a **webpage for information** about the provided service, where applicable. |
| ``policy`` | [1..*] | [*Policy*](#285-policy) | specifies the type and URL of a webpage where the relevant **service policy** (e.g. registration policy or trust service policy) or **privacy policy** or **terms and conditions statement** of the provider are located, where applicable. |
| ``x5c`` | [0..1] | *string* | specifies an **X.509 certificate chain** according to [RFC 7515](https://www.rfc-editor.org/rfc/rfc7515.html), which is compliant to [RFC 3647](https://www.rfc-editor.org/rfc/rfc3647.html) and [RFC 5280](https://www.rfc-editor.org/rfc/rfc5280.html), if used by the provider for all its services. In case of a ``TrustServiceProvider`` this element is not present, as the relevant certificate chains are assigned to the individual ``TrustService``. |

### 2.2 WRPRegistrar

According to Article 5a Nr. 18 (a) of (EU) No 910/2014, the Member States are required to notify the European Commission
about the **Registrars for Wallet-Relying Parties**, which are responsible for establishing and maintaining the lists of
relying parties (**Registries of Wallet-Relying Parties**), that rely on European Digital Identity Wallets in
accordance with Article 5b(5) of (EU) No 910/2014 and the location of that lists.

According to Annex II 1. of CIR (EU) 2024/2980, the EU Member States shall provide for each register and registrar the following information to
the European Commission:

* (a) the name of the register;
* (b) at least one URL where the register is available for access, which shall use state of the art transport layer encryption;
* (c) the name of the registrar that is responsible for that register;
* (d) where applicable, the registration number of the registrar;
* (e) the Member State in which the registrar is established;
* (f) the contact email and contact phone number of the registrar, for matters related to the register;
* (g) where applicable, the URL of a webpage for additional information about the registrar and the register;
* (h) the URL of the webpage where the registration policy that applies to the register and related information are located;
* (i) one or more certificates compliant with IETF RFC 3647 which can be used to verify the signature or seal created by the registrar on the register data and for which the certified identity data include the name of the registrar, and where applicable, the registration number of the registrar, as provided in points (c) and (d), respectively.

The ``WRPRegisterProvider`` class is used for this kind of notification and inherits all attributes from the ``Provider``
class. In addition to the attributes of the ``Provider`` class it contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|---------------|--------------|----------|-------------|
| `register` | [1..1] | *string* | specifies the **name of the register**. |
| `registerURI` | [1..*] | *string* | specifies the **URL where the register is available for access**. |

### 2.3 WalletProvider

According to Article 5a Nr. 18 (b) of (EU) No 910/2014, the Member States are required to notify to the European Commission
about the **Wallet Providers**, which are the bodies responsible for the provision of European Digital Identity Wallets in accordance with Article 5a(1).
In line with Article 5a Nr. 18 (e) the notified information shall also include information about the mechanism for the validation of the authenticity
and validity of European Digital Identity Wallets.

According to Annex II 2. of CIR (EU) 2024/2980, the EU Member States shall provide for each wallet provider the following information to
the European Commission:

* (a) the name of the wallet provider;
* (b) where applicable, the registration number of the wallet provider;
* (c) where applicable, the name of the body responsible for the provision of the wallet solution;
* (d) the Member State in which the wallet provider is established;
* (e) the contact email and contact phone number of the wallet provider, for matters related to the wallet solutions
 it provides;
* (f) where applicable, the URL of the webpage for additional information about the wallet provider and the wallet solution;
* (g) the URL of the webpage where the policies, terms and conditions of the wallet provider that apply to the provision
 and use of the wallet solution it provides are located;
* (h) one or more certificates compliant with IETF RFC 3647 that can be used to authenticate and validate the
 components of the wallet unit the wallet provides, and for which the certified identity data includes the name,
 and where applicable, the registration number of the wallet provider, as specified in points (a) and (b), respectively;
* (i) for each wallet solution provided by the wallet provider, the name and the reference number of the wallet solution
 it provides, as the Commission shall publish this information in the Official Journal of the European Union pursuant
 to Article 5d of Regulation (EU) No 910/2014.

The ``WalletProvider`` class is used for this kind of notification and inherits all attributes from the ``Provider``
class. In addition to the attributes of the ``Provider`` class it contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|---------------|--------------|----------|---|
| `solProvider` | [0..1] | *string* | specifies the **name of the body responsible** for the provision of the wallet solution, if applicable. |
| `walletName` | [1..1] | *string* | specifies the **name of the wallet solution**. |
| `refNum` | [1..1] | *string* | specifies the **reference number** of the wallet solution. |

### 2.4 PIDProvider

According to Article 5a Nr. 18 (c), the Member States are required to notify to the European Commission the
**Provider of Person Identification Data (PID)**, which are responsible for ensuring that the PID is associated with
the European Digital Identity Wallet in accordance with Article 5a(5), point (f). In line with Article 5a Nr. 18 (d) the
notified information shall contain information, which allows to validate the PID.

According to Annex II 3. of CIR (EU) 2024/2980, the EU Member States shall provide for each PID-Provider the
following information to the European Commission:

* (a) the name of the provider of person identification data;
* (b) where applicable, a registration number of the provider of person identification data;
* (c) where applicable, the name of the body responsible for ensuring that the person identification data is associated with the wallet unit;
* (d) the Member State in which the provider of person identification data is established;
* (e) the contact email and contact phone number of the provider of person identification data, for matters related to the person identification data it provides;
* (f) where applicable, the URL of the webpage that contains additional information about the person identification data provider;
* (g) the URL of the webpage that contains the policies, terms and conditions of the provider of person identification data that apply to the provision and use of the person identification data it provides;
* (h) one or more certificates compliant with IETF RFC 3647 that can be used to verify the signature or seal created by the provider of person identification data on the person identification data it provides, and for which the certified identity data include the name, and where applicable, the registration number of the person identification data provider, as specified in points (a) and (b), respectively.

The ``PIDProvider`` class is used for this kind of notification and inherits all attributes from the ``Provider``
class. In addition to the attributes of the ``Provider`` class it contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|--------------|--------------|----------|----|
| `PIDIssuer` | [0..1] | *string* | specifies the **name of the body responsible** for ensuring that the person identification data is associated with the wallet unit. |

### 2.5 PubEEAProvider

> **NOTE 1 (CIR for PuB-EEA-Provider-handling is still draft):**
> This section should be treated with some caution, as the implementing act according to the Articles 45d, 45e and 45f of
> (EU) No. 910/2014 is currently only available as [Draft of the CIR for PuB-EAA](https://tinyurl.com/IA-45def-draft)
> and may therefore change until final publication and endorsement.

According to Article 45f (3) of (EU) No 910/2014) the Member States shall notify **Public Sector Body Authentic Source Electronic Attestation of Attributes (PuB-EAA) Providers**
according to Article 3 (46) of (EU) No 910/2014) to the Commission. That notification shall include a conformity assessment report issued by a
conformity assessment body confirming that the requirements set out in Article 45f (1), (2) and (6) of (EU) No 910/2014) are met. The Commission shall
make available to the public, through a secure channel, the list of public sector bodies referred to in Article 3 (46) (EU) No 910/2014) in
electronically signed or sealed form suitable for automated processing. Further details are outlined in Annex III of [Draft of the CIR for PuB-EAA](https://tinyurl.com/IA-45def-draft)).

The ``PubEEAProvider`` class is used for this kind of notification and inherits all attributes from the ``Provider``
class. In addition to the attributes of the ``Provider`` class it contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|-------------|--------------|-----------------------------|-----------------|
| `EEAIssuer` | [0..1] | [*Provider*](#21-provider) | specifies the details of the *EEA issuer**, if it is not identical to the public sector body, which is responsible for the authentic source indicated in the ``Provider`` class. |
| `law` | [1..*] | [*Law*](#284-law) | specifies the **legal basis** on which the public sector body has been made responsible for the authentic source. |
| `car` | [1..*] | [*Document*](#282-document) | contains the **conformity assessment report** mentioned in Article 45f (3) of (EU) No 910/2014 consisting of one or more ``Document`` elements. |

### 2.6 WRPAccCertProvider

The ``WRPAccCertProvider`` class is used for the notification of issuers of access certificates
for wallet-relying parties as required by Annex II 4. of CIR [(EU) 2024/2980](https://eur-lex.europa.eu/eli/reg_impl/2024/2980/oj).

It simply inherits the attributes from the ``TrustServiceProvider`` class, which in turn inherits
the attributes from the ``Provider`` class and adds a of one or more `trustSrv` attributes,
as specified in the following table:

| Attribute | Multiplicity | Type | Description |
|-----------------------|--------------|-------------|---|
| `trustSrv` | [1..*] | [*TrustService*](#286-trustservice) | specifies the **details of the trust service**. |

According to Article 5a Nr. 18 (d) of (EU) No 910/2014 the EU Member States shall notify the European Commission about
the mechanism for the validation of the identity of the Wallet-Relying Parties. As stipulated by the implementing acts
according to Article 5a (23) (EU) 2024/1183, i.e. within [(EU) 2024/2977](http://data.europa.eu/eli/reg_impl/2024/2977/oj), [(EU) 2024/2979](http://data.europa.eu/eli/reg_impl/2024/2979/oj), [(EU) 2024/2980](http://data.europa.eu/eli/reg_impl/2024/2980/oj)
and [(EU) 2024/2982](http://data.europa.eu/eli/reg_impl/2024/2982/oj), the validation of the identity of the Wallet-Relying Parties is envisioned to take place using
so called "Wallet-Relying Party Access Certificates", which are defined to be certificates for electronic seals or signatures
authenticating and validating the wallet-relying party issued by specific providers, which are mandated by the EU Member
State.

According to Annex II 4. of CIR (EU) 2024/2980, the EU Member States shall notify the following information
for each Provider of Wallet-Relying Party Access Certificates to the European Commission:

* (a) the name of the provider of wallet-relying party access certificates;
* (b) where applicable, a registration number of the provider of wallet-relying party access certificates;
* (c) the Member State in which the provider of wallet-relying party access certificates is established;
* (d) the contact email and contact phone number of the provider of wallet-relying party access certificates,
 for matters related to the access certificates it provides to wallet-relying parties;
* (e) where applicable, the URL of the webpage of the provider of wallet-relying party access certificates that
 contains additional information about the provider and the access certificates it provides to wallet-relying parties;
* (f) the URL of the webpage that contains the policies, terms and conditions that apply to the provision and use of
 the access certificates it provides to wallet-relying parties;
* (g) one or more certificates compliant with IETF RFC 3647 that can be used to verify the signature or seal created
 by the provider of wallet-relying party access certificates on the access certificate it provides to wallet-relying
 parties, with, where applicable, the information required to distinguish wallet-relying party access certificates
 from other certificates.

### 2.7 WalletRelyingParty

As stipulated in Article 5b (1) of (EU) No. 910/2014, the **Wallet-Relying Parties** shall register in the
Member State where they are established.

Article 5b (2) of (EU) No. 910/2014 makes clear, that the "registration process shall be cost-effective
and proportionate-to-risk". According to Article 5b (5) of (EU) No. 910/2014 the "Member States
shall make the information referred to in paragraph 2 publicly available online in electronically signed
or sealed form suitable for automated processing" and Article 5b (7) of (EU) No. 910/2014 stipulates that
the "Member States shall provide a common mechanism for allowing the identification and
authentication of relying parties, as referred to in Article 5a (5), point (c)" of (EU) No. 910/2014.

As clarified by the already endorsed implementing acts according to Article 5a (23) (EU) 2024/1183, i.e.
within [(EU) 2024/2977](http://data.europa.eu/eli/reg_impl/2024/2977/oj), [(EU) 2024/2979](http://data.europa.eu/eli/reg_impl/2024/2979/oj), [(EU) 2024/2980](http://data.europa.eu/eli/reg_impl/2024/2980/oj) and [(EU) 2024/2982](http://data.europa.eu/eli/reg_impl/2024/2982/oj), the
"common mechanism allowing the identification and authentication of relying parties" is to use
X.509-based "Wallet-Relying Party Access Certificates" issued by a suitable Certification Authority
(cf. [``WRPAccCertProvider``](#26-wrpacccertprovider)).

>**NOTE 2: (Member States are invited to cooperate with respect to registration)**
> While Article 5b of (EU) No. 910/2014 has assigned the responsibility for the registration
> to the Member States, the stipulations in the paragraphs (2) ("cost-effective"), (5) ("suitable for
> automated processing") and (7) ("common mechanism") seem to suggest, that normalised data structures,
> a joint solution development and a close collaboration among the Member States and further EUDI
> stakeholders may be appropriate here. Therefore, the present document also outlines the data structure
> of the ``WalletRelyingParty`` class, even if there is no notification procedure, which directly involves
> Wallet-Relying Parties.

> **NOTE 3 (CIR for Registration of Wallet-Relying Parties is still draft):**
> This section should be treated with some caution, as the implementing act according to the Article 5b of
> (EU) No. 910/2014 is currently only available as [Draft of the CIR for RP-Registration](https://tinyurl.com/IA-5b-draft),
> and may therefore change until final publication and endorsement.

According to Article 3 and Annex I of [Draft of the CIR for RP-Registration](https://tinyurl.com/IA-5b-draft)
the registration of Wallet-Relying Parties captures the following information:

1. The name of the wallet-relying party as stated in an official record together with identification data of that official record.
2. Where applicable, one or more identifiers of the wallet-relying party, as stated in an official record together with identification
 data of that official record, expressed as:

 (a) an Economic Operators Registration and Identification (EORI) number as referred to in Commission Implementing Regulation (EU) No 1352/20131;

 (b) the registration number as registered in a national business register;

 (c) a Legal Entity Identifier (LEI) as referred to in Commission Implementing Regulation (EU) No 2022/18602;

 (d) a VAT registration number;

 (e) an excise number as specified in Article 2(12) of Council Regulation (EC) No 389/20123;

 (f) a tax reference number;

 (g) a European Unique Identifier (EUID) as referred to in Commission Implementing Regulation (EU) 2020/22444.

3. The physical address where the wallet-relying party is registered.

4. For the indication of the Member State in which the registering wallet-relying party is established, the ISO 3166-1 Alpha 2
 codes shall be used, with the following exception: the Country Code for Greece shall be ‘EL’.

5. Detailed contact information of the wallet-relying party, one or more, including:

 (a) a website for providing help desk and support;

 (b) a phone number where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;

 (c) a digital address where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;

 (d) an e-mail address where the wallet-relying party can be contacted for matters pertaining to its registration and intended use of the wallet units;

6. A description of the type of services provided.

7. A list of the attributes that the relying party intends to request, expressed as a friendly name and a technical name including the namespace that the attributes
 are grouped under in a machine-readable format for automated processing, with an indication if they are mandatory or optional.

8. A description of the intended use of the attributes to be requested by the wallet-relying party from wallet units, including an indication
 if the intended use of the attribute are for purposes to fulfil specific rules of the Union or National law requiring the relying party to identify users.

9. An indication whether the wallet-relying party is a public sector body.

10. Where applicable, every entitlement of the wallet-relying party, that shall be expressed as follows:

 (a) ‘Service_Provider’ to express the entitlement of the wallet-relying party as a provider of services;

 (b) ‘QEAA_Provider’ to express the entitlement of the wallet-relying party as a qualified trust service provider issuing qualified
 electronic attestations of attributes;

 (c) ‘Non_Q_EAA_Provider’ to express the entitlement of the wallet-relying party as a Trust service provider issuing non-qualified electronic attestations of attributes;

 (d) ‘PUB_EAA_Provider’ to express the entitlement of the wallet-relying party as a provider of electronic attestations of attributes issued by or on behalf of a
 public sector body responsible for an authentic source;

 (e) ‘PID_Provider’ to express the entitlement of the wallet-relying party as a provider of person identification data;

 (f) ‘QCert_for_ESeal_Provider’ to express the entitlement of the wallet-relying party as a qualified trust service provider
 issuing qualified certificates for electronic seals;

 (g) ‘QCert_for_ESig_Provider’ to express the entitlement of the wallet-relying party as a qualified trust service provider
 issuing qualified certificates for electronic signatures;

 (h) ‘rQSealCDs_Provider’ to express the entitlement of the wallet-relying party as a qualified trust service provider providing a
 qualified trust service for the management of a remote qualified electronic signature creation device;

 (i) ‘rQSigCDs_Provider’ to express the entitlement of the wallet-relying party as a qualified trust service provider providing a qualified trust
 service for the management of a remote qualified electronic seal creation device;

 (j) ‘ESig_ESeal_Creation_Provider’ to express the entitlement of the wallet-relying party as a (non-qualified) trust service provider of remote
 creation of electronic signatures or electronic seals as a non-qualified trust service;

 (k) ‘WAC_Provider’ to express the entitlement of the wallet-relying party as a qualified trust service provider issuing qualified certificate
 for web authentication.

The ``WalletRelyingParty`` class is used for this kind of notification and inherits all attributes from the ``Provider``
class. In addition to the attributes of the ``Provider`` class it contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|-------------------|--------------|-----------------------|------|
| `physicalAddress` | [1..*] | *string* | specifies the **physical address** of the Wallet-Relying Party. |
| `supportURI` | [1..1] | *string* | specifies the **support URI** for the service provided by the Wallet-Relying Party. |
| `srvDescription` | [1..1] | *string* | contains a **description of the service** provided by the Wallet-Relying Party. |
| `requestedClaim` | [1..*] | [*Claim*](#281-claim) | specifies the set of potentially **requestable claims** which may be requested by the Wallet-Relying Party within its services. In line with the data minimisation principle according to Article 5 (1) (c) of [(EU) 2016/679](https://eur-lex.europa.eu/eli/reg/2016/679/oj) the Wallet-Relying Party may only request the appropriate subset of claims necessary for a specific use case. |
| `isPSB` | [1..1] | *boolean* | indicates, whether the Wallet-Relying Party **is a public sector body** or not. |
| `entitlement` | [1..*] | *string* | specifies the **set of entitlements** of the Wallet-Relying Party in form of a URI according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html), whereas the following URIs are defined in the present document: <ul><li> http://data.europa.eu/eudi/entitlement/Service_Provider</li> <li> http://data.europa.eu/eudi/entitlement/QEAA_Provider</li><li> http://data.europa.eu/eudi/entitlement/Non_Q_EAA_Provider</li><li> http://data.europa.eu/eudi/entitlement/PUB_EAA_Provider</li><li> http://data.europa.eu/eudi/entitlement/PID_Provider</li><li> http://data.europa.eu/eudi/entitlement/QCert_for_ESeal_Provider</li><li> http://data.europa.eu/eudi/entitlement/QCert_for_ESig_Provider</li><li> http://data.europa.eu/eudi/entitlement/rQSealCDs_Provider</li><li> http://data.europa.eu/eudi/entitlement/rQSigCDs_Provider</li><li> http://data.europa.eu/eudi/entitlement/ESig_ESeal_Creation_Provider</li> <li>http://data.europa.eu/eudi/entitlement/WAC_Provider</li> </ul> |

### 2.8 Auxiliary Classes

#### 2.8.1 Claim

The ``Claim`` class is used within the definition of the [``WalletRelyingParty``](#27-walletrelyingparty) class. It contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|-------------------|--------------|-------------------|--------|
| `friendlyName` | [1..1] | *string* | is the **user-friendly name** of the claim, which can be used for display purposes. |
| `URI` | [1..1] | *string* | is the **URI** according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html), which **uniquely identifies the claim type** under consideration. <br/>The claim names defined in the Annex of (EU) 2024/2977 shall be prepended by the string ``http://data.europa.eu/eudi/claim/``. The claim ``family_name`` defined in the Annex of (EU) 2024/2977 is identified by the URI ``http://data.europa.eu/eudi/claim/family_name`` for example. |
| `required` | [0..1] | *boolean* | indicates, whether there are one or more legal acts, which **require or recommend to access the claim** or not. If this attribute is missing, the default ``false`` is assumed. |
| `isRequiredByLaw` | [0..*] | [*Law*](#284-law) | specifies the **legal act(s) according to which accessing the claim is required or recommended**. This attribute shall be present, if and only if ``required`` is ``true``. |

#### 2.8.2 Document

The ``Document`` class is used within the definition of the [``WalletRelyingParty``](#25-pubeeaprovider) class. It contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|-----------|--------------|----------|--------------|
| `type` | [1..1] | *string* | is the **MIME type** of the document according to IETF RFC 2046. |
| `content` | [1..1] | *string* | is the **content of the document** encoded as specified by its MIME type. |

#### 2.8.3 Identifier

The ``Identifier`` class is used within the definition of the [``Provider``](#21-provider) class.
It contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|--------------|--------------|----------|------------------|
| `type` | [1..1] | *string* | is the **type** of the identifier specified by a URI according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html), whereas the following URIs are defined in the present document: <ul><li>http://data.europa.eu/eudi/id/EORI-No - Economic Operator Registration and Identification Number (**EORI-No**) according to [(EU) No 1352/2013](http://data.europa.eu/eli/reg_impl/2013/1352/oj)</li> <li>http://data.europa.eu/eudi/id/LEI - Legal Entity Identifier (**LEI**) according to [(EU) No 2022/1860](http://data.europa.eu/eli/reg_impl/2022/1860/oj) and ISO 17442</li><li>http://data.europa.eu/eudi/id/EUID - European Unique Identifier (**EUID**) according to [(EU) 2020/2244](http://data.europa.eu/eli/reg_impl/2020/2244/oj) and [(EU) 2021/1042](http://data.europa.eu/eli/reg_impl/2021/1042/oj)</li> <li>http://data.europa.eu/eudi/id/VATIN - Value Added Tax Identification Number (**VATIN**) according to the [Council Directive 2006/112/EC](http://data.europa.eu/eli/dir/2006/112/oj)</li> <li>http://data.europa.eu/eudi/id/TIN - [Taxpayer Identification Number (**TIN**)](https://taxation-customs.ec.europa.eu/online-services/online-services-and-databases-taxation/taxpayer-identification-number-tin_en)</li> <li><http://data.europa.eu/eudi/id/Excise> - **Excise Number** according to Art. 2 (12) of the Council Regulation [(EC) No. 389/2012](http://data.europa.eu/eli/reg/2012/389/oj) |

)</li> </ul>. |
| `identifier` | [1..1] | *string* | is the **identifier**, which identifies the ``Provider`` under consideration. |

> **NOTE 4 (National business registration number is part of EUID):**
> Annex I Nr. 2 of [Draft of the CIR for RP-Registration](https://tinyurl.com/IA-5b-draft) also lists
> the identifier option "registration number as registered in a national business register". However, this option seems
> to be superfluous, as this is already covered by the EUID case, as this identifier is constructed to
> contain the mentioned national business registration number.

#### 2.8.4 Law

The ``Law`` class is used within the definition of the [``Claim``](#281-claim) and [``PubEEAProvider``](#25-pubeeaprovider)
classes. It contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|---------------|--------------|----------|-----------|
| `lang` | [1..1] | *string* | is the two-letter Alpha-2 **language code** according to ISO 639 (Set 1). |
| `legalBasis` | [1..1] | *string* | specifies the **legal basis** according to which a [``PubEEAProvider``](#25-pubeeaprovider) is established as such or the access to a specific [``Claim``](#281-claim) is defined to be required or recommended. |

#### 2.8.5 Policy

The ``Policy`` class is used within the definition of the [``Provider``](#21-provider) class. It contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|-------------|--------------|----------|---------------|
| `type` | [1..1] | *string* | specifies the **type of the policy** in form of a URI according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html), whereas the following URIs are defined in the present document: <ul><li>http://data.europa.eu/eudi/policy/trust-service-practice-statement - is a **Trust Service Practice statement** according to clause 6.1 of [ETSI EN 319 401](https://www.etsi.org/deliver/etsi_en/319400_319499/319401/03.01.01_60/en_319401v030101p.pdf).</li><li>http://data.europa.eu/eudi/policy/terms-and-conditions - is a **Terms and Conditions** statement according to clause 6.2 of [ETSI EN 319 401](https://www.etsi.org/deliver/etsi_en/319400_319499/319401/03.01.01_60/en_319401v030101p.pdf).</li><li>http://data.europa.eu/eudi/policy/privacy-statement - is a **Privacy Statement** to fulfil the information requirements of Article 12 ff [(EU) 2016/679](http://data.europa.eu/eli/reg/2016/679/oj).</li><li>http://data.europa.eu/eudi/policy/privacy-policy - is a **Privacy Policy** according to the clauses 3.14 and 5.6 of ISO/IEC 29100.</li><li>http://data.europa.eu/eudi/policy/registration-policy - is a **Registration Policy** according to Article 4 of [Draft of the CIR for RP-Registration](https://tinyurl.com/IA-5b-draft).</li> </ul> |
| `policyURI` | [1..1] | *string* | specifies the **policy URI** in form of a URL according to [RFC1738](https://www.rfc-editor.org/rfc/rfc1738.html) where the policy is published. |

#### 2.8.6 TrustService

The **TrustService** class is used within the definition of the [TrustServiceProvider](#286-trustservice) class. It contains the attributes specified in the following table:

| Attribute | Multiplicity | Type | Description |
|------------------|--------------|----------|------------|
| `type` | [1..1] | *string* | specifies the **Service type identifier** of the Trust Service in Form of a URI according to [RFC3986](https://www.rfc-editor.org/rfc/rfc3986.html), whereas the set of admissible URIs is defined in clause 5.5.1 of [ETSI TS 119 612](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf). |
| `srvName` | [1..1] | *string* | specifies the **TSP trade name** of the Trust Service according to clause 5.4.2 of [ETSI TS 119 612](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf). |
| `x5c` | [1..1] | *string* | specifies the **Service digital identity** of the Trust Service according to clause 5.5.3 of [ETSI TS 119 612](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf) in Form of an X.509 certificate (chain) encoded in Base 64. |
| `status` | [1..1] | *string* | specifies the **Service current status** of the Trust Service according to clause 5.5.4 point i) of [ETSI TS 119 612](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf). |
| `statusDate` | [1..1] | *string* | specifies the **Current status starting date and time** of the Trust Service according to clause 5.5.5 of [ETSI TS 119 612](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf) using the format defined in ISO 8601-1. |
| `srvURI` | [1..*] | *string* | specifies the **Service supply points** of the Trust Service according to clause 5.5.7 of [ETSI TS 119 612](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf). |
| `srvQualifier` | [0..*] | *string* | specifies the **Service information extensions** of the Trust Service according to clause 5.5.9 of [ETSI TS 119 612](https://www.etsi.org/deliver/etsi_ts/119600_119699/119612/02.03.01_60/ts_119612v020301p.pdf). |

## 3. Notification System

> **NOTE 5 (Specification of the Notification System will follow):**
> The specification of the Notification System will follow in a future revision of the present document. It is envisioned that the
> specification will cover at least contain (1) an overview of the **System Architecture** and (2) the main **Components and Interfaces**.

### 3.1 System Architecture

### 3.2 Components and Interfaces

## Annex A

### A.1 JSON-Schema (normative)

The file [``EUDI-Providers.json``](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework-private/blob/provider-notification/docs/technical-specifications/api/EUDI-Providers.json) contains the JSON-Schema definitions corresponding to the Data Model specified in [clause 2](#2-data-model) above.

### A.2 OpenAPI-Specifications (normative)

> **NOTE 6 (OpenAPI-Specification will follow):** The [OpenAPI](https://spec.openapis.org/oas/latest.html)-specification of the
> JSON- and REST-based interfaces described in [clause 3.2](#32-components-and-interfaces) will follow in a future revision of the present document.

### A.3 XML-Schema (informative)

The file [``EUDI-Providers.xsd``](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework-private/blob/provider-notification/docs/technical-specifications/api/EUDI-Providers.xsd) contains the XML-Schema definitions corresponding to the Data Model specified in [clause 2](#2-data-model) above.