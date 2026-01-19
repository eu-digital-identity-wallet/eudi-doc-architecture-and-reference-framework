# T - Support and Maintenance by the Wallet Provider

Version 1.0, 19 Nov 2025

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/583)

## 1. Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for European Digital Identity Cooperation Group
on topic **T - Support and Maintenance by the Wallet Provider**

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*Are specific requirements necessary to govern support and maintenance of the Wallet? For instance, guidelines could clarify what types of data the Wallet Provider is permitted or prohibited from collecting from Wallet Instances for support and maintenance purposes.*

Following the [European Digital Identity Regulation] (EU) 2024/1183 this document discusses high-level technical requirements and guidance and/or recommendations the ARF should include on Wallet Provider specific maintenance and support functions. It should be noted that the requirements covered here are different from certification-related security requirements - this paper focuses on post-certification maintenance and support that may mean active monitoring of the Wallet Instance and Wallet Unit elements and behaviour.

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

- Chapter 2 introduces support and maintenance expectations set on Wallet Providers based on the [European Digital Identity Regulation] and the ARF, and lists the Annex 2 HLRs found to relate (also, in addition to their home topic) with support and maintenance on the latest ARF version (2.6.0).
- Chapter 3 opens the discussion whether specific high-level requirements are desirable.
- Chapter 4 will list the additions and changes that will be made to the ARF as a result of discussing this topic with Member States.

## 2. Existing requirements related to Wallet Provider's support and maintenance duties

### 2.1 Regulatory requirements

The [European Digital Identity Regulation] specifies related to support and maintenance duties of the Wallet Providers as follows:

**Article 5a (10)**: "Providers of European Digital Identity Wallets shall ensure that users can easily request technical support and report technical problems or any other incidents having a negative impact on the use of European Digital Identity Wallets.

**Article 5a (14)** states on data minimisation and logical separation of any personal data and other data held by the Wallet Provider: "Users shall have full control of the use of and of the data in their European Digital Identity Wallet. The provider of the European Digital Identity Wallet shall neither collect information about the use of the European Digital Identity Wallet which is not necessary for the provision of European Digital Identity Wallet services, nor combine person identification data or any other personal data stored or relating to the use of the European Digital Identity Wallet with personal data from any other services offered by that provider or from third-party services which are not necessary for the provision of European Digital Identity Wallet services, unless the user has expressly requested otherwise. Personal data relating to the provision of the European Digital Identity Wallet shall be kept logically separate from any other data held by the provider of the European Digital Identity Wallet.

..."

### 2.2 Sections in the ARF related to Wallet Solution and Wallet Unit lifecycle management

The Trust model discussion in the ARF main text (Section 6) has the following lifecycle management related subsections, and although not directly mentioning the support duties of the Wallet Provider, may be relevant for this topic:

[Section 6.2.3](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#623-wallet-provider-suspension-or-cancellation) of the main document discusses what happens on Wallet Unit level if a Wallet Provider is cancelled or suspended. Informing duty by the Wallet Provider of such event for the Wallet Users is defined in Annex 2/[Topic 38](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2338-topic-38---wallet-unit-revocation) part B part of the ARF.

[Section 6.5](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#65-trust-throughout-a-wallet-unit-lifecycle) of the main document discusses Wallet Unit lifecycle related trust. Once a Wallet User has a Wallet Unit in Operational or Valid state, the Wallet Unit is managed by the User and the Wallet Provider, and this management includes at least revoking the Wallet Unit when necessary.

The ARF sub-section [6.5.4](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#654-wallet-unit-management) covers the details (**bold text** effect added by the editor):

The **Wallet Provider** is responsible at least to:

- perform **installation of a new version of the Wallet Solution as necessary** - this is mentioned in [Topic 40](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management) part C, WIAM_11.
- update the WUAs as necessary - covered in [Topic 9](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a239-topic-9---wallet-unit-attestation).
- revoke the Wallet Unit in case its security is compromised - covered in [Topic 38](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2338-topic-38---wallet-unit-revocation).

Management will also include **regular updates of the Wallet Instance application to ensure its continued security and functionality.**

No technical requirements are currently specified regarding e.g. automatic installation of Wallet Solution updates and their regularity, or on conducting constant monitoring on the health level of the overall Wallet Solution via analysis of the operational Wallet Instances in the installed base.

### 2.3 Existing high-level requirements in the ARF

The following HLRs were found relevant for the topic of support and maintenance (involving either the Solution management, informing the Wallet User or providing lifecycle support for the Wallet Solution) under existing Annex 2 topics.

#### 2.3.1 Topic 9

Topic 9 covers HLRs for Wallet Unit Attestation (WUA). WUA_03 below relates to (invisible to the Wallet User) readiness maintenance by the Wallet Provider (for ensuring a valid WUA at all times).

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WUA_03  | A Wallet Provider SHALL ensure that a non-revoked Wallet Unit at all times can present a WUA, when requested by a PID Provider or Attestation Provider. |

#### 2.3.2 Topic 38

Topic 38 covers HLRs addressing Wallet Unit revocation. HLRs having a link between the Wallet Provider and Wallet User have been picked for this topic discussion

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WURevocation_14 | A Wallet Provider SHALL inform a User without delay, and within 24 hours at most, in case the Wallet Provider decided to revoke the User's Wallet Unit. The Wallet Provider SHALL also inform the User about the reason(s) for the revocation. This information SHALL be understandable for the general public. It SHALL include (a reference to) technical details about any security breach if applicable. |
| WURevocation_16 | To inform a User about the revocation of their Wallet Unit, the Wallet Provider SHALL use a communication channel that is independent of the Wallet Unit. In addition, the Wallet Provider MAY use the Wallet Unit itself to inform the User. |

#### 2.3.3 Topic 40

Annex 2 [Topic 40](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2340-topic-40---wallet-instance-installation-and-wallet-unit-activation-and-management) discusses requirements related to the installation of a Wallet Instance by the User, the subsequent activation of the Wallet Unit by the User and the Wallet Provider, and the management of the Wallet Unit throughout its lifetime. Part C covers high-level technical requirements for Wallet Unit management in WIAM_11 - WIAM_21, of which the maintenance & support related are listed below in [Section 2.3](#23-existing-high-level-requirements-in-the-arf).

| **Index** | **Requirement specification**   |
|-----------|----------------------------------------------|
| WIAM_01 | To ensure that the User can trust the Wallet Solution, a Wallet Provider SHOULD make its certified Wallet Solution available for installation only via the official app store of the relevant operating system (e.g., Android, iOS). *Note: This allows the operating system of the device to perform relevant checks regarding the authenticity of the Wallet Unit.* |
| WIAM_02 | If a Wallet Provider makes its certified Wallet Solution available for installation through other means than the official OS app store, it SHALL implement a mechanism allowing the User to verify the authenticity of the Wallet Unit. Moreover, it SHALL provide clear instructions to the User on how to install the Wallet Instance, including at least: - instructions on the verification of the authenticity of the Wallet Instance to be installed, - instructions on bypassing of any operating system limitations on side-loading of apps, if applicable, and ensuring that these limitations are restored after the Wallet Instance has been installed. *Note: This requirement also applies for the installation of a Wallet Instance on a User device that is not a mobile device, and for which no official operating system app store may exist.* |
| WIAM_05 | During the activation process of a new Wallet Unit, the Wallet Provider SHALL process information about the User device and the available WSCAs and WSCDs, as far as necessary to issue a Wallet Unit Attestation to the Wallet Unit conform all requirements in [Topic 9](./../annexes/annex-2/annex-2-high-level-requirements.md#a239-topic-9---wallet-unit-attestation) section A. The Wallet Provider MAY process additional information necessary for managing the Wallet Unit, but it SHALL NOT process more information than it reasonably needs for legitimate purposes. The Wallet Provider SHALL request User consent (through the Wallet Instance) for all information and data it will process, both during activation and throughout the lifetime of the Wallet Unit. The Wallet Provider SHALL inform the User about the purposes of data processing, in accordance with the General Data Protection Regulation. |
| WIAM_06 | The Wallet Provider SHALL request the User, through the new Wallet Instance, to set up a User account at the Wallet Provider. The Wallet Provider SHALL explain to the User that this is necessary to enable the User to request revocation of the Wallet Unit in case of theft or loss. The Wallet Provider SHALL register one or more User authentication methods that the Wallet Provider will use to authenticate the User in the future. These methods SHALL be independent of the Wallet Unit and the User device. The Wallet Provider SHALL allow the User to register using an alias instead of true identity data. The Wallet Provider SHALL NOT use any registered User data for purposes other than User authentication, unless the User gives explicit consent to do so. The Wallet Provider SHALL register the relationship between the Wallet Unit and the corresponding User account. |
| WIAM_10a | During the activation process of a new Wallet Unit, the Wallet Provider SHALL offer the User a means to verify the formal certification information of their Wallet Solution. |
| WIAM_11 | During the lifetime of the Wallet Unit, the Wallet Provider SHALL update the Wallet Unit as necessary to ensure its continued security and functionality. |
| WIAM_13 | If the User uninstalls the Wallet Unit, the Wallet Unit SHALL ensure that all cryptographic key material in the WSCA(s) related to the Wallet Unit is securely destroyed. This includes all keys of the WUAs, PIDs and attestations stored in the Wallet Unit. *Note: Key deletion is a cryptographic key operation and requires User authentication, as specified in requirement WIAM_14.* |
| WIAM_13a | If a Wallet Unit supports the [W3C Digital Credentials API] and the User uninstalls the Wallet Unit, the Wallet Unit SHALL disclose the fact that it no longer stores any PID(s) or attestation(s) to the Digital Credentials API framework. |
| WIAM_15b | During installation of the Wallet Unit, the Wallet Unit SHALL enable the User to indicate if they want to use a Wallet Unit-specific PIN for User authentication, or use the OS-level User authentication mechanism. The Wallet Unit SHALL enable the User to change this preference during the lifetime of the Wallet Unit. |
| WIAM_21 | Whenever the WSCA/WSCD successfully authenticated the User according to WIAM_14, the Wallet Unit SHOULD check if there are any PIDs or attestations on the Wallet Unit that cannot be presented any longer to Relying Parties, for example because they have expired or because a once-only attestation (see [Topic 10](./../annexes/annex-2/annex-2-high-level-requirements.md#a2310-topic-10---issuing-a-pid-or-attestation-to-a-wallet-unit), section D, method A) was presented to a Relying Party already. The Wallet Unit SHOULD then request the WSCA/WSCD to destroy all cryptographic key material related to these PIDs or attestations. *Note: The reason for this recommendation is that probably, Wallet Providers will want to prevent an accumulation of unused private keys in the WSCA/WSCD, given that such devices typically do not have much storage space. However, deletion of private keys (and potentially other key material) is a cryptographic key operation and cannot be done without User authentication; see WIAM_14. At the same time, for usability reasons the User must not be involved in such 'cleaning up' processes, see also ISSU_42. The recommended solution is to take advantage of a User authentication event to also carry out any necessary cleaning operations.* |

## 3 Discussion

### 3.1 Non-functional requirements

The support and maintenance functions of the Wallet Provider are in the current ARF mostly implicit and embedded under technical topics that either link to issuance, revocation or lifecycle management of technical artefacts (functional requirements under various topics).

Some functions of a Wallet Provider related to sustained customer support, data protection and active engineering towards keeping the Wallet Instances of an Wallet Solution up to date are part of Wallet certification. This is covered via implementing acts and by the Member States' national certification schemes, and are beyond the mandate of the [European Digital Identity Regulation]. Thus, the ARF will not list non-functional requirements for the topic(s).

### 3.2 Wallet Instance maintenance related data collection

Wallet Solution maintenance requires monitoring of the solution functions by the Wallet Provider, including Wallet Instances used by the users. It is customary for the mobile application developers to collect limited bug and error reports at runtime for improvement purposes (the development team will receive these and prioritise error fixes according to professional error severity analysis). Error logs collected should never contain personal data of the User. Question of what data of the Wallet User, or of the Wallet Instance should be monitored for this purpose was discussed in the first meeting to collect suitable data points, and are documented in table 1.

In case the Wallet Instance is run mostly remote (at the Wallet Solution Provider server with associated HSM), the Wallet Instance can be just a 'viewer' app, and therefore multiple apps can be viewed as the same Wallet Instance. Nevertheless, the ARF defines (see topic 38, WURevocation_09) how the Wallet Provider must handle situation where one 'viewer app', one part of its components is no longer secure - The Wallet Unit is revoked entirely in case the data collected from a single device/app triggers need to revoke an individual app instance.

List of possible data types to be collected, reasons for collection and how the Wallet Instance monitoring should occur (frequency, mechanisms, should the collection require Wallet User's approval beyond standard app vendor practices) is collected in the following table, and is recommended to be added to [section 6.5.3.2](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/architecture-and-reference-framework-main.md#6532-wallet-provider-requests-data-about-the-users-device-from-the-wallet-instance) of the ARF:

| Data type                    |  Reason for monitoring (if applicable, regulation) |     Monitoring frequency etc.   |
|------------------------------|----------------------------------------------------|-----------------------------|
| Runtime errors  |  Uncaught errors in production code  | runtime and crash logs   |
| UX and telemetry information |  UX field analysis, may not be used to obtain behavioural data  | runtime logs - *user consent preferred*  |
| OS version and health data   | OS vulnerabilities   | At Wallet Unit activation (see ARF section 6.5.3.2) or OS update/upgrade and at continuous security posture monitoring (see [section 3.3.2](#332-security-posture-of-wallet-instance) of this paper) |
| Wallet SDK and SW library versions  | Wallet Instance code vulnerabilities   | At Wallet Unit roll out (as part of CI/CD process), at continuous security posture monitoring |
| User locale/localisation data  |  Catching localisation related errors  | runtime and crash logs - *user consent preferred*   |
| Wallet Instance version  | Old version related vulnerabilities or errors   | At Wallet Unit activation, at continuous security posture monitoring  |
| Supported WSCA/WSCDs  |  Cryptography related incompatibilities  |  At Wallet Unit activation, at continuous security posture monitoring  |
| WSCx capabilities supported  |  Cryptography configuration for EUDI Wallet use cases  | At Wallet Unit activation  |
| Unique device identifier such as IDFV or persisted UUID (iOS) or AndroidID (Android) |  Up-to-date list of Wallet Instance related device installations, potential malicious use (unrecognised identifier) | At Wallet Unit activation   |
| Sensor identifiers and patch levels  | Up-to-date sensor hardware   | At Wallet Unit activation, at continuous security posture monitoring |
| Hardware-level details on device  |  Identify known hardware-based problems or vulnerabilities  |  At Wallet Unit activation  |
| BLE radio presence  | Security of proximity use cases   | At Wallet Unit activation  |
| NFC support   | Security of proximity use cases   |  At Wallet Unit activation   |

Table 1. Data recommended for maintenance related Wallet Unit -level monitoring

#### 3.2.1 Crash logs

Device OS-dependent app crash logs will probably collect a rich set of data (many of listed items above) automatically. App developers should write custom crash logs for sending them to Wallet Provider's server for further analysis. For iOS developers see article [Acquiring crash reports and diagnostic logs](https://developer.apple.com/documentation/xcode/acquiring-crash-reports-and-diagnostic-logs), and respectively [Android vitals](https://support.google.com/googleplay/android-developer/answer/9844486?sjid=7862630290407449217-EU#zippy=) for Android/Google Play distributed apps. Beyond baseline tools, several third party tools exist for creating developer-friendly crash report analytics.

A new HLR on custom crash logs is suggested for inclusion under the topic (see [section 4.1](#41-high-level-requirements-to-be-added-to-annex-2), WPSM_02).

### 3.3 Monitoring data for the Wallet Unit's security posture

#### 3.3.1 Backgrounder - the PDS2 Directive

The need to track the security posture of a Wallet Unit was initially raised in [topic AA](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/aa-support-of-electronic-payments-SCA-with-wallet.md) discussion on strong customer authentication and related requirements from the regulation that applies to the European financial institutions, especially the Payment Service Providers (PSPs). The [RTS SCA] contains generic requirements for PSPs in Article 2 to have transaction monitoring mechanisms to detect unauthorised or fraudulent transactions:

>1. Payment service providers shall have transaction monitoring mechanisms in place that enable them to detect unauthorised or fraudulent payment transactions for the purpose of the implementation of the security measures referred to in points (a) and (b) of Article 1. Those mechanisms shall be based on the analysis of payment transactions taking into account elements which are typical of the payment service user in the circumstances of a normal use of the personalised security credentials.
>
>2. Payment service providers shall ensure that the transaction monitoring mechanisms take into account, at a minimum, each of the following risk-based factors:
(a) lists of compromised or stolen authentication elements;
(b) the amount of each payment transaction;
(c) known fraud scenarios in the provision of payment services;
(d) signs of malware infection in any sessions of the authentication procedure;
(e) in case the access device or the software is provided by the payment service provider, a log of the use of the access device or the software provided to the payment service user and the abnormal use of the access device or the software.

The ARF does not cover for fraud or risk signals collection from the Wallet Units or making them available to Relying Parties such as PSPs. Technically collection and delivery would be feasible and could be done at the Wallet Providers discretion, but the very intent of [European Digital Identity Regulation] to maximise privacy preservation in the EUDI ecosystem prevents this. Fraud signal detection for payment services is not in the ARF scope, and there is no intention to include a complete set of requirements related to this topic.  

#### 3.3.2 Security posture of Wallet Instance

Although complete fraud or risk signal collection is not in scope of the ARF, it is recommended for and in the interests of the Wallet Providers to keep an active understanding of individual Wallet Instance's security posture, if this can be done with a privacy-preserving approach, in a similar way used with other eID means (where e.g. user device IP address monitoring is conducted by the Relying Parties for the purpose of security anomaly detection).

A Wallet Unit is a unique configuration of a Wallet Solution that includes Wallet Instances. The Wallet Instance is the application installed and configured on a Wallet User’s device or environment. The presented data or tool types in this paper in some cases mainly affect Wallet Instances, while Wallet Units might contain of multiple Wallet Instances (and multiple WSCDs/WSCAs).

Security posture monitoring done by the Wallet Providers offloads part of the detection tasks from the PSPs when it comes to their regulatory tasks, and allows the Wallet Providers to take care of at-risk Wallet Instances through technical means: Although not monitored in runtime similar to the payment applications and service providers, the Wallet Instances with high-risk or critical security posture level should be revoked at the Wallet Provider's earliest convenience, following at least the requirements set in the ARF [Topic 38](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2-high-level-requirements.md#a2338-topic-38---wallet-unit-revocation), which guide the Wallet Provider to revoke all Wallet Instances of the Wallet Unit. A compromised Wallet Instance is thus seen in the ARF as compromising the entire Wallet Unit.

We suggest to add new high-level requirements on **security posture monitoring** for the Wallet Providers to **check regularly a relevant set of security information about the Wallet Instance** as part of the support and maintenance function.

A collection of fraud or risk signal related information used in context of mobile devices is collected below to table 2, with indication whether the data should be collected **by the Wallet Provider** under the proposed new HLRs on security posture monitoring.

| Data or tool type            |  Reason for security posture monitoring (if applicable, regulation) |     Monitoring at Wallet Instance   |
|------------------------------|----------------------------------------------------|-----------------------------|
| Device OS  | potential OS vulnerabilities  |  OK - see previous table  |
| Device type | potential type-specific vulnerabilities   | OK - see previous table    |
| Behavioural data  |  Unusual transaction detection, account takeovers (ATO)  | Not OK (privacy preservation)   |
| Device fingerprinting  | flag logins from unfamiliar devices, ATO   | Not relevant - WP has list of devices with active WIs   |
| Geolocation (IP address)  |  Network-layer anomaly detection, ATO  |  Not OK (privacy preservation)  |
| Geolocation (GNSS)  |  Geospatial anomaly detection, ATO  |  Not OK (privacy preservation)  |
| Active phone call detection  | Authorised push payment fraud / phishing / social engineering   | Not OK (privacy preservation)   |
| VPN detection  | attempted identity or location masking through VPN  | Not OK    |
| Incognito mode detection  | hiding malicious activity or multiple login attempts   |  Not relevant  |
| Device rooting/jailbreaking detection  |  Compromised device security as a whole  | OK   |
| Emulator detection  | Emulation of user device by fraudsters   | OK   |
| Malware detection | identify and neutralise malicious software | OK   |

Table 2. Information typically screened to execute fraud signal analysis on mobile devices

> Note that this paper takes no position over what information e.g. Relying Parties can and should monitor - either enforced through their domain-specific, enforcing regulation or internal security processes.

Several of the signals are related to User behaviour patterns and thus will have no real value to the Wallet Provider (to conclude on the security posture of the User's device). Taking into account this aspect, as well as expectation of strict Wallet User privacy preservation with their use of a Wallet Solution, the table 2 brings in the minimal *additional* list of monitorable security posture information compared to ones marked OK in table 1 earlier.

Other detection means are likely to be used by the Relying Parties such as payment service providers, which are able to monitor and check prior to providing access to the service not just the Wallet Instance they interact with, but related applications/services utilised as part of their use case. For example, malware detection (identifying a fraudulent/compromised Wallet, browser or other device software involved in the use case) and related blacklisting is very likely to happen also by the Relying Party's internal device posture check tools. In this case the ecosystem or business vertical should agree a common process for informing the Wallet Provider whose Wallet Instance has been compromised.

#### 3.3.3 Criteria for mandatory revocation and suspension

The Wallet Provider should based on previous section build analysis mechanisms that allow continuous detection of changes in signals relevant to the security posture of Wallet Instances it has deployed. A potential, 4-level security posture framework that could be applied is introduced in table 3.

| Level | Posture status  | Key indicators & checks | Wallet Provider policy response |
|-------|-----------------|-------------------------|-----------------|
| **Level 4** | **Critical** (Red)| Confirmed Root/Jailbreak, Active Debugger/Emulator Detected, Private Key Compromised, Critical OS Vulnerability (unpatched) exploited, Wallet Instance integrity check failed (tampering detected), Use of a compromised WSCD-protected private key detected (**see also Note 1**). | **Immediate Wallet Revocation (Threshold for Compromise)** via revocation of corresponding WUA(s). Force reinstallation of Wallet Instance on a vulnerability-free device. |
| **Level 3** | **High Risk** (Orange/Yellow) | High-risk, unpatched OS version detected, Failed biometric attempts exceeding high threshold, Unavailability of a local or local native WSCD due to connection error or repeated errors (**see also Note 1**). | **Threshold for administrative Suspension of the Wallet Unit** via revocation of corresponding (WUAs). Require step-up authentication (e.g., PIN re-entry), or force re-activation/re-enrollment of the Wallet Unit.  |
| **Level 2** | **Moderate Risk** (Yellow/Green) | Minor integrity checks failed (e.g., non-critical file modification), Wallet Instance running in background with high resource usage, Failed PIN attempts (low threshold). | **Allow use, but limit scope** (e.g., restrict high-value transactions/presentations), force re-authentication after inactivity. |
| **Level 1** | **Low Risk (Green)** | Successful device attestation, Wallet Instance integrity check passed, Current OS patch level. | **Full functionality** allowed, including presentation of high-assurance attestations (PID/QEAA). |

Table 3. Four-level Wallet Instance security posture framework.

> **Note 1**: If the issue is with a key managed by a remote WSCD, then at least all Wallet Units managed by that WSCD should be revoked, even if only one abuse has been identified. Similarly, for the part of the Wallet Instance that is implemented remotely, any issue should impact all the Wallet Units managed by that server.

In case of compromised Wallet Instance the Wallet Provider shall disable the Wallet Instance from conducting transactions. The minimum mechanism specified by the ARF is revocation of the Wallet Unit Attestation (WUA) within 24 hours from identifying a risk. The Wallet Providers may have also other (more real-time) tools to disable a Wallet Unit when needed.

Wallet Provider shall consider the Wallet Unit as "Compromised" and initiate Revocation when there is a high probability that the private keys used for attestation, authentication, or signing have been leaked or accessed by an unauthorised entity.

**Level 4 (Critical)** is the designated threshold for mandatory Wallet Unit Revocation.

Mandatory revocation should according to the framework occur immediately when the Wallet Provider detects any of the following:

1. **Confirmed Key Extraction/Leakage**: The system detects evidence that the cryptographic material (e.g., the private key corresponding to the Wallet Unit Attestation (WUA) or the keys securing credentials) has been accessed outside of the device's local or local native WSCD.

2. **Active Malicious Environment**: The application is running on a rooted/jailbroken device and is simultaneously being actively debugged, manipulated, or monitored by a known attack tool. The combination of root access and active manipulation suggests an imminent threat to key material.

3. **Unremedied High-Severity Breach**: If the device state falls into the High-Risk (Suspended) category (e.g., detected tampering) and the user or system fails to mitigate the issue within a pre-defined, short window.

4. **Security Component Failure**: Confirmed, irrecoverable failure of the secure hardware module (local or local native WSCD) where the key material is stored.

The new HLRs are proposed in Section 4 below.

## 4 Additions and changes to the ARF

### 4.1 High-Level Requirements to be added to Annex 2

A new topic is suggested for discussing the monitoring functions as part of support and maintenance functions of the Wallet Provider. The following HLRs are suggested to be included:

| **Index** | **Requirement specification** | **Proposal** |
|-----------|-------------------------------|--------------|
| WPSM_01   | The Wallet Provider SHALL monitor their installed base of operational Wallet Instances for maintenance purposes, and determine and document in a transparent manner the data it needs and is allowed to monitor in order to deliver the required support. Data or attributes that SHOULD be monitored include: runtime errors for uncaught errors in production code, UX and telemetry information for UX field analysis, OS version and health information for detection of OS level vulnerabilities, Wallet Instance SDK and software library version information for Wallet Instance code vulnerabilities, user locale/localisation data for catching localisation related errors, Wallet Instance version for catching errors or vulnerabilities due to outdated version, supported WSCA/WSDCs and their supported capabilities for detection of cryptography incompatibilities, unique device identifier such as IDFV or persisted UUID (iOS) or AndroidID (Android) for maintaing an up-to-date list of Wallet Instance related device installations and for detecting potential malicious use (unrecognised identifier), device sensor identifiers and patch levels for checking up-to-dateness of sensor hardware on device, hardware-level details on device to identify known hardware-based problems or vulnerabilities, BLE radio and NFC support in device for analysing the security and feasibility of proximity use cases with a given Wallet Instance. | NEW - Add as new 'base' HLR to new Wallet Provider Support and Maintenance topic.|
| WPSM_02   | Wallet Unit developers SHALL for maintenance purposes write custom crash logs for sending them for further analysis. | NEW  |
| WPSM_03   | The Wallet Provider SHALL monitor the security posture of operational Wallet Instances for the purpose of detecting critical security risks in the environment the Wallet Instance is run at, and determine and document in a transparent manner the data it needs and is allowed to monitor. Information that SHOULD be monitored for software and hardware level problems/vulnerabilities on device includes 1) detection of device rooting/jailbreaking, 2) emulator detection, 3) device OS version and health data, 4) Wallet Instance SDK and SW library versions, 5) Wallet Instance version, 6) Supported WSCA/WSCD and 7) Sensor identifiers and patch levels. | NEW  |

### 4.2 High-Level Requirements to be changed

#### 4.2.1 Topic 38

| **Index** | **Requirement specification** | **Proposal** |
|-----------|-------------------------------|--------------|
| WURevocation_09   |  During the lifetime of a Wallet Unit, the Wallet Provider SHALL regularly verify that the security of the Wallet Unit is not breached or compromised. If the Wallet Provider detects a security breach or compromise, the Wallet Provider SHALL analyse its cause(s) and impact(s). If the breach or compromise affects the trustworthiness or reliability of the Wallet Unit, the Wallet Provider SHALL administratively revoke or suspend the Wallet Unit and SHALL immediately revoke the corresponding WUA(s). The Wallet Provider SHALL do so at least in the following circumstances: - If the security of the Wallet Unit, or the security of the mobile device and OS on which the corresponding Wallet Instance is installed, or the security of a WSCA/WSCD it uses for managing cryptographic keys and sensitive data, is breached or compromised in a manner that affects its trustworthiness or reliability. - If the security of the Wallet Solution is breached or compromised in a manner that affects the trustworthiness or reliability of all corresponding Wallet Units. - If the security of the common authentication and data protection mechanisms used by the Wallet Unit is breached or compromised in a manner that affects their trustworthiness or reliability. - If the security of the electronic identification scheme under which the Wallet Unit is provided is breached or compromised in a manner that affects its trustworthiness or reliability. **Note to the first bullet: This corresponds to a Critical or High Risk level security posture risk status according to [refer to table 3 contents in the topic T -updated ARF] as analysed or detected for a Wallet Instance due to monitoring done according to WPSM_03.**   |   MODIFIED (addition of the text in **bold**)    |

#### 4.2.2 Topic 40

| **Index** | **Requirement specification** | **Proposal** |
|-----------|-------------------------------|--------------|
| WIAM_11   | During the lifetime of the Wallet Unit, the Wallet Provider SHALL **guide the user on how to** update the Wallet Unit as necessary to ensure its continued security and functionality. **If the user fails to do so under a given time frame, the Wallet Provider shall disable the Wallet Unit.** | MOVE as MODIFIED - Proposed to be moved as is into a new HLR (WPSM_04) under the wallet support and maintenance topic. |

### 4.3 Descriptions to be added to the ARF main document

A new short paragraph on runtime Wallet Instance -level monitoring as part of maintenance and security posture analysis is suggested for the ARF main text section 6.5.3.2, based on chapters 3.2 and 3.3 of the updated topic T discussion paper.

Details on monitorable Wallet Instance information (table 1 of the topic T discussion paper) is included into ARF section 6.5.3.2.

## 4 References

| Reference | Description |
| --------- | ------------|
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [RTS SCA]   |  [Commission Delegated Regulation (EU) 2018/389 of 27 November 2017 supplementing Directive (EU) 2015/2366 of the European Parliament and of the Council with regard to regulatory technical standards for strong customer authentication and common and secure open standards of communication](https://eur-lex.europa.eu/eli/reg_del/2018/389/oj/eng) |
| [Topic AA]  | [AA - Support of Electronic Payments Customer Authentication (SCA) with the Wallet](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/aa-support-of-electronic-payments-SCA-with-wallet.md) |
