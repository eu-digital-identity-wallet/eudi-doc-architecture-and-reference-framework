# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semverdoc.org/).

## [2.7.3] - 2025-11-12

Changes:
 - Updated links to new annex 2 file names.
 
 ## [2.7.2] - 2025-11-11

Changes:
 - Updated annexes 2 orders for pdf creation.

## [2.7.1] - 2025-11-10

Changes:
 - Updated broken links.

## [2.7.0] - 2025-11-10

Changes:

- The original Annex 2 has been removed. All high-level requirements in Annex 2 are now included in a .csv file, which allows for easy sorting and filtering of requirements. Insofar relevant, the texts in the introduction to each Topic in Annex 2 have been moved to suitable sections in the ARF main document.
  
  For the convenience of readers, Annex 2 is also included as a new .md file, which was generated from the .csv file. This new file contains the high-level requirements in the same order as the original Annex 2 file, and also contains the same Topic numbers and section indicators. However, Topics in the original file that did not contain any high-level requirements have been removed.
- The latest version of the Discussion Paper for Topic F resulted in a number of changed High-Level Requirements in Annex 2 and in Section 4.4.3.1.
- The Discussion Paper for Topic P was integrated into Section 4.5.
- The Discussion Paper for Topic Q was integrated into Topic 54.
- The Discussion Paper for Topic R was integrated into Sections 2.2, 4.3.2 and 6.5.3.3, and into Topic 40. Moreover, the distinction between the WSCA/WSCD and a keystore, which was introduced in this Topic, has been made throughout the ARF main document and Annex 2. A definition of 'keystore' was added to Annex 1.
- The Discussion Paper for Topic S was integrated into Sections 6.3.2.3 and 6.4.2. In addition, in Annex 2, a new Topic 55 was created for the high-level requirements on Certificate Transparency for access certificates.
- All figures in the ARF have been re-created using and the source files (in XML format) are made available in the GitHub repository of the ARF.
- Several issues raised via Confluence and GitHub have been resolved.

Apart from these changes, a limited number of editorial mistakes were corrected.

## [2.6.0] - 2025-10-13

Changes:

- The Discussion Paper for Topic O, and into Topic 25 and Topic 26 in Annex 2.
- The Discussion Paper for Topic Z was integrated into Sections 6.6.2.3.3 and 6.6.3.8, among others. Moreover, multiple requirements in Annex 2 where changed or slightly adapted to account for the fact that device binding is now recommended, not mandatory.

Apart from these changes, a limited number of editorial mistakes were corrected.

## [2.5.0] - 2025-09-12

Changes:

- The **PID rulebook** and **mDL rulebook** (previously in Annex 3) have been
moved to the [attestation rulebooks repository](https://github.com/eu-digital-identity-wallet/eudi-doc-attestation-rulebooks-catalog/).
- A new **Chapter 8 on Accessibility** has been introduced.  
    - The former accessibility content from Section 6.5.4 has been removed.  
    - In Annex 2, a new **Topic 54 on Accessibility** has been created, and
    relevant content has been moved from Topic 40 to Topic 54.  
- Several issues raised via Confluence and GitHub have been resolved.

In addition, a limited number of editorial corrections have been made.  

## [2.4.0] - 2025-07-18

Changes:

- the discussion Paper for Topic U was integrated into Section 6.5.3.6, and into
Topic 19 and Topic 40.
- the discussion Paper for Topic H was integrated into Topic 19.
- a number of issues raised via Confluence or GitHub were solved.

Apart from these changes, a limited number of editorial mistakes were corrected.

## [2.3.0] - 2025-07-04

Changes:

- added results of "Topic K - Combined presentation of Attestations"
- processed comments on Relying Party Registrars, WUA compatibility issues
against OID4VCI, some other comments from 1.8.0 and 1.10.0
- fixed missing reference links to STS Roadmap issues
- added a paragraph on accessibility
- reflected the existence of the new Rulebook template

## [2.2.0] - 2025-06-20

Changes:

- added results of "Topic L - User requesting data deletion to relying parties"
- added results of "Topic M - User reporting unlawful or suspicious request of
data to DPAs"
- added results of "Topic N - Export and data portability"
- added results of "Topic I - Natural person representing another natural person"
- added results of "Topic W - Transactional data for payment and other use cases
- added results of "Topic J - Wallet to Wallet interaction"

## [2.1.0] - 2025-06-06

Changes:

- corrections and clarifications were made regarding the optional issuance and
use of registration certificates, and the optional use of information registered
by a Registrar,
- all references to the possible use of a WUA on the presentation interface
between Wallet Units and Relying Parties were removed,
- added remark on DC-API - Topic F will be additionally discussed in ARF
development iteration 3
- CDDL syntax updated PID rulebook in section 3.1.5

Editorial changes and fixing typos.

## [2.0.0] - 2025-05-28

Processed comments provide in the Coordination Group meeting on 21 May 2025.

- added remark on WUA - Work is still in progress on [TS3](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications-private/blob/main/docs/technical-specifications/ts3-wallet-unit-attestation.md),
- added remark on Pseudonyms - Topic E will be revised in ARF development
iteration 3,
- added remark on ZKP - Topic G will be revisited in ARF development iteration 3,
- added remark the use of the [W3C Digital Credentials API] is optional (section
4.4.3.1),
- added the planning of a new topic Z, for discussion on device-bound
Attestations and section 1.7,
- updates on Relying Party registration to align with [CIR 2025/848](https://data.europa.eu/eli/reg_impl/2025/848/oj).

Editorial changes and fixing typos.

## [1.10.0] - 2025-05-02

Added changes due to adopted Commission Implementing Regulation for Relying
Party registration ([CIR 2025/848](https://data.europa.eu/eli/reg_impl/2025/848/oj))
regarding registration of Wallet Relying Parties.

Editorial changes and fixing typos.

### Sections/topics with changes

- Main document
    - section 3.11, section 4.4,1, section 4.4.3.1, section 4.4.3.3, section
    4.6.4, section 4.6.6, section 6.1, section 6.3.1, section 6.3.2.1, section
    6.3.2.3, section 6.3.3, section 6.4.1, section 6.4.2, section 6.4.3, section
    6.6.2.2, section 6.6.2.7.2, section 6.6.3.3, section 6.6.3.4, section
    6.6.3.5, section 6.6.3.13,

- Annex 2
    - Topic 3: PID_04, PID, 06, PID_07, PID_16
    - Topic 6: RPA_06, RPA_06a, RPA_06c, RPA_06d,
    - Topic 10: ISSU_24, ISSU_24a, ISSU_27, ISSU_34, ISSU_34a,
    - Topic 19: DASH_03, DASH_05,
    - Topic 31:  GenNot_01, GenNot_02, GenNot_05, RPnot_02, RPACANot_01,
    RPACANot_02, RPACANot_04, RPACANot_06, RPACANot_07, TLPub_01, TLPub_02,
    TLPub_08
    - Topic 40: WIAM_15,
    - Topic 43: EDP_02, EDP_02a,
    - Topic 44: RPRC_01, RPRC_02, RPRC_03, RPRC_03a, RPRC_03b, RPRC_07, RPRC_09,
    RPRC_10, RPRC_11
    - Topic 52: RPI_01 to RPI_10

- [Annex 3](docs/annexes/annex-3/annex-3.01-pid-rulebook.md) (PID rulebook)
    - The attribute place_of_birth is now better defined for both the mdoc and
    SD-JWT formats.

## [1.9.0] - 2025-04-16

Processed comments on ARF 1.8.0.
Editorial changes and fixing typos.

## [1.8.0] - 2025-03-26

Added results of "Topic C - Wallet Unit Attestation (WUA) and key attestation"
Added results of "Topic D - Embedded Disclosure Policies"
Added results of "Topic G - Zero Knowledge Proof"
Added results of "Topic V - PID rulebook"
Adding links to "Standards and Technical Specifications"
Editorial changes and fixing typos.

## [1.7.1] - 2025-03-20

Editorial changes and fixing typos.

## [1.7.0] - 2025-03-17

Added results of "Topic E - Pseudonyms, including User authentication mechanism"
Added results of "Topic F - Digital Credential API"
Editorial changes and fixing typos.

## [1.6.1] - 2025-03-10

Editorial changes and fixing typos.

## [1.6.0] - 2025-03-03

Added results of "Topic A - Privacy risks and mitigation"
Added results of "Topic B - Re-issuance and batch issuance of PIDs and Attestations"
Editorial changes and fixing typos.

## [1.5.1] - 2025-02-10

Editorial changes and fixing typos.

## [1.5.0] - 2025-02-04

This version of the ARF is aligned with the adopted Implementing Acts, covering
articles 5a and 5c of the eIDAS Regulation.

This version of the ARF also includes changes in response to comments provided
on Github and by other stakeholders. Over more than 275 comments lead to changes
in the ARF.

## [1.4.1] - 2024-09-11

Editorial corrections.

## [1.4.0] - 2024-05-20

The Annex structure has been updated. Each Annex is now located in a separate folder.

## [1.0.0] - 2023-02-10

Initial release.
