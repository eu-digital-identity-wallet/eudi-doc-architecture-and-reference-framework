Version 0.2, updated 23 April 2026

# Topic J - Wallet to Wallet Interactions (Revision Round)

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the 2026 revision round (RR) version of the Discussion Paper for the European Digital Identity Cooperation Group regarding Topic J: Wallet to Wallet Interactions.

The ARF Development and Maintenance Workplan 2026 [ARF_DevPlan] describes the objective of this topic as follows:

*Refine requirements for wallet-to-wallet interaction, including authentication, data protection, and user experience considerations.*

This paper is scoped to a single question: whether cryptographic device authentication of the Verifier Wallet Unit within the same protocol session as the presentation request should be introduced for Wallet to Wallet (W2W) interactions.

### 1.2 Key Words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document.
In addition, 'must' (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word 'can' indicates a capability, whereas other words, such as 'will', 'is' or 'are' are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- [Chapter 2](#2-background) describes the current treatment of Verifier Wallet Unit authentication in the technical specification and recalls the relevant legal provisions.

- [Chapter 3](#3-cryptographic-device-authentication-within-the-same-protocol-session) defines the specific question analysed in this paper, lists arguments that have been raised both for and against introducing cryptographic device authentication of the Verifier Wallet Unit within the same protocol session as the presentation request, and proposes a concrete candidate phrasing of the corresponding high-level requirement for Member State discussion.

- [Chapter 4](#4-technical-approaches) illustrates the kind of technical complexity that adopting such a requirement would entail, by outlining four technical approaches together with their respective advantages and disadvantages.

- [Chapter 5](#5-proposed-additions-and-changes-to-hlrs-in-arf-annex-2) is reserved for proposed additions and changes to the High-Level Requirements in ARF Annex 2, to be populated in a future version of this paper following the Member State discussion.

- [Chapter 6](#6-references) lists references.

## 2 Background

### 2.1 Current Situation

W2W interactions are interactions between two natural persons in physical proximity, in which one User (the Holder) presents person identification data or attestations to another User (the Verifier). Technically, the Holder Wallet Unit acts as an mdoc and the Verifier Wallet Unit acts as an mdoc reader, both as defined in [ISO/IEC 18013-5].

[ISO/IEC 18013-5] defines an optional mdoc reader authentication mechanism (`ReaderAuth`) by which the reader signs the session transcript with a private key bound to an X.509 certificate. The mdoc validates this signature and the certificate chain before disclosing any attributes. In interactions between a Wallet Unit and a Wallet-Relying Party (WRP), this mechanism is used together with the access certificate the WRP obtains during registration.

In W2W interactions, [Technical Specification 9] currently specifies in STS9_30 that the `ReaderAuth` field SHALL NOT be included in mdoc requests. Consequently, the Holder Wallet Unit does not perform a cryptographic check that the requesting device is a genuine, non-revoked EUDI Wallet Unit operated by a recognised Wallet Provider. The reasoning recorded in [Technical Specification 9], Annex A.2 is that Wallet Units do not currently hold X.509 certificates suitable for `ReaderAuth`, and that the security objectives related to the Verifier in W2W can be addressed by out-of-band measures: the physical proximity of the parties, rate limiting (STS9_31, STS9_32), non-persistence of received presentations (STS9_35), and a prohibition on communicating presentation contents to third parties (STS9_37).

In addition, [Technical Specification 9], Annex A.2.1 notes that the parties may opt to perform a *reversed prior flow*: before the main W2W interaction proceeds, the Holder and Verifier swap roles and run the ISO/IEC 18013-5 protocol so that the Verifier presents a PID to the Holder. Because a PID can only be issued to, and presented from, a genuine EUDI Wallet Unit -- the PID is issued by a certified PID Provider and is cryptographically bound to keys held in the Wallet Unit's WSCA/WSCD -- successful validation of the presented PID provides the Holder with a high-assurance indication that the Verifier is operating a genuine EUDI Wallet Unit, and at the same time reveals the Verifier's identity. This mechanism is available as an optional, out-of-band technique within the current specification. It should be noted that, because the reversed round and the main W2W flow are two separate protocol runs, the Verifier authentication is not cryptographically bound to the subsequent request: in principle, a malicious Verifier could authenticate using a genuine EUDI Wallet Unit in the reversed round and then issue the actual presentation request from a different application.

### 2.2 Legal Provisions Relevant to Verifier Wallet Unit Authentication

The following provision of the [European Digital Identity Regulation] is directly relevant to this discussion.

Article 5a(4):

*European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, transparent, and traceable by the user, to: ... (c) securely authenticate another person's European Digital Identity Wallet, and receive and share person identification data and electronic attestations of attributes in a secured way between the two European Digital Identity Wallets ...*

## 3 Cryptographic Device Authentication Within the Same Protocol Session

### 3.1 Scope

This chapter considers whether **cryptographic device authentication** of the Verifier Wallet Unit, performed **within the same protocol session** as the Verifier's presentation request, should be introduced in W2W interactions.

*Cryptographic device authentication* is understood here as a mechanism by which the Holder Wallet Unit can verify, by cryptographic means, that the Verifier device is a genuine, non-revoked EUDI Wallet Unit operated by a recognised Wallet Provider. This is narrower than the out-of-band measures discussed in Section 2.1 (physical proximity, rate limiting, non-persistence, and reversed-flow), which do not provide cryptographic assurance.

*Within the same protocol session* distinguishes the analysis from the reversed prior flow described in Section 2.1. In the reversed prior flow, the Verifier is authenticated through a separate, earlier protocol run, so the authentication is not cryptographically bound to the subsequent presentation request. The arguments presented in this chapter concern mechanisms that bind the Verifier Wallet Unit authentication to the session in which the request is made.

Section 3.2 below proposes a candidate phrasing for the corresponding high-level requirement; Sections 3.3 and 3.4 summarise the arguments that have been raised in favour of and against introducing such a requirement.

### 3.2 Proposed High-Level Requirement for Discussion

Candidate phrasings of the high-level requirements corresponding to the question scoped above are the following:

> *When sending a presentation request to a Holder Wallet Unit, a Verifier Wallet Unit SHALL include a cryptographic proof of its authenticity and validity.*

> *Before presenting a received presentation request to its User, a Holder Wallet Unit SHALL cryptographically verify, within the same protocol session as the presentation request, that the Verifier Wallet Unit is a genuine, non-revoked EUDI Wallet Unit operated by a recognised Wallet Provider.*

> *If this verification fails or cannot be performed, the Holder Wallet Unit SHALL notify the User. In addition, the Wallet Unit SHALL either not present the requested attributes to the Verifier Wallet Unit, or give the User the choice to present the requested attributes or not. Note: It is up to the Wallet Provider to make a choice for one of these two options.*

All three requirements are tentatively phrased as mandatory (SHALL).

The wording is deliberately mechanism-agnostic: it fixes the assurance objective (genuine, non-revoked Verifier Wallet Unit, verified within the same protocol session), while leaving the concrete technical realisation to the technical specification. Chapter 4 illustrates four approaches that would meet these requirements and the technical complexity each would involve. The exact phrasing, the HLR indices, and whether any of these SHALLs should be weakened to SHOULD once a technical approach is selected are open questions for Member State discussion.

### 3.3 Arguments Raised in Favour

The following arguments have been raised in support of introducing cryptographic device authentication of the Verifier Wallet Unit within the same protocol session:

1. **Enforcement of other data minimization measures.** Rate limiting, non-persistence of presentations, and other behavioural controls are enforceable only on a genuine Wallet Unit. A device that is not a genuine Wallet Unit is not bound by these controls. Cryptographic device authentication of the Verifier Wallet Unit ensures that the device on the receiving end is one to which these obligations apply.

2. **Informed consent.** Confirming, prior to disclosure, that the Verifier device is a genuine EUDI Wallet Unit operated by a recognised Wallet Provider gives the Holder a basis on which to make an informed decision. This information can be presented in the approval UI alongside the description of the requested attributes.

### 3.4 Arguments Raised Against

The following arguments have been raised against introducing a mandatory cryptographic device authentication mechanism within the same protocol session, as recorded in [Technical Specification 9], Annex A.2:

1. **Out-of-band controls may be sufficient.** W2W interactions take place in physical proximity between natural persons. The Holder can observe the Verifier's device and behaviour, and the parties may already know each other. Combined with rate limiting and non-persistence requirements, and the option to do a reversed presentation flow may be considered sufficient to deter mass abuse.

2. **Ecosystem complexity.** Introducing a cryptographic device authentication mechanism requires additional infrastructure (for example, a new type of X.509 certificates for Wallet Units and the supporting issuance and revocation services, or extensions to the underlying ISO standard). This adds complexity to an ecosystem that already involves multiple credential and trust management mechanisms.

3. **Operational burden on Wallet Providers.** Any cryptographic mechanism implies additional operational obligations on Wallet Providers (issuance, lifecycle management, revocation services, or support for new protocol elements).

4. **Limits of authentication.** A cryptographic device authentication mechanism confirms that the Verifier device is a genuine Wallet Unit, but cannot by itself prevent a registered Relying Party from operating a Wallet Unit to receive W2W presentations, nor prevent out-of-band capture of disclosed attributes (for example by photograph or transcription). Complementary controls remain necessary in either case.

5. **Practical difficulty of using a fake Wallet Unit.** Using a non-genuine Wallet Unit as a Verifier in a W2W interaction is not straightforward in practice. While generic mdoc reader applications are available in mobile app stores, they typically cannot handle a presentation offer, are limited to requesting a predefined set of attributes (which may not include the PID), may not offer the data export capabilities an attacker would need, and do not visually resemble an EUDI Wallet -- which matters in a proximity setting where the Holder can see the Verifier's screen. An application that does implement these features, especially one that mimics the appearance of a genuine EUDI Wallet, would likely be taken down from the app store after a complaint by a Member State. An attacker would therefore need to build a bespoke application, which requires software development skills or funding. While this does not eliminate the threat, it raises the barrier to the point where the attack is not available to casual adversaries.

## 4 Technical Approaches

The purpose of this chapter is to illustrate the kind of technical complexity that adopting a high-level requirement for cryptographic device authentication of the Verifier Wallet Unit within the same protocol session would entail. Four approaches have been identified for implementing such a requirement. Each is described below together with the infrastructure, standards impact, protocol changes, and operational obligations it would imply. The chapter does not recommend an approach, nor is the list necessarily exhaustive; its purpose is to give a concrete picture of the work involved should such a requirement be introduced.

### 4.1 Approach A: Wallet Unit Authentication Certificate (WUAC)

#### 4.1.1 Description

In this approach, each Wallet Provider issues a dedicated X.509 certificate -- referred to as a Wallet Unit Authentication Certificate (WUAC) -- to each of its Wallet Units. The WUAC is used only to populate the `ReaderAuth` field in mdoc requests during W2W interactions. The certificate profile is compatible with the mdoc reader authentication certificate profile defined in [ISO/IEC 18013-5], Annex B, Table B.6.

The trust anchor for WUAC validation is the Wallet Provider's CA certificate, which is published in the Wallet Provider List of Trusted Entities (LoTE) -- the same mechanism used to publish trust anchors for Wallet Unit Attestation (WIA and KA) signing (see WUA_10 in Topic 9). A Holder Wallet Unit accepts WUACs whose certificate chain validates against any Wallet Provider CA in a LoTE the Wallet Unit subscribes to.

The W2W interaction flow is updated as follows. After the BLE session is established and before the mdoc request is sent, the Verifier Wallet Unit signs the session transcript with the WUAC private key and includes the signature and the WUAC in the `ReaderAuth` field of the mdoc request. The Holder Wallet Unit, on receiving the request, validates: (a) the WUAC certificate chain against the LoTE trust anchors; (b) the WUAC revocation status; and (c) the signature over the session transcript. If any of these checks fail, the interaction is aborted. Otherwise, the Holder is prompted to approve the disclosure, and the approval UI indicates that the Verifier has been authenticated as a valid EUDI Wallet Unit and identifies the Wallet Provider.

This approach changes STS9_30 from a prohibition on `ReaderAuth` to a mandate to include it.

#### 4.1.2 Advantages

1. **Cryptographic enforcement of Verifier Wallet Unit genuinity.** The Holder Wallet Unit gains an automated mechanism to verify, before any user prompt, that the Verifier is a valid, non-revoked EUDI Wallet Unit.

2. **Full ISO/IEC 18013-5 compliance.** The approach uses the existing `ReaderAuth` mechanism without modification. No changes to the standard are required. Wallet implementations that already support `ReaderAuth` for WRP (Wallet-Relying Parties) interactions can reuse the same code path with a different certificate type.

3. **Reuse of existing LoTE-based trust anchor distribution.** The Wallet Provider's certificate used for signing Wallet Unit Attestations (WIAs and KAs) is already published in the Wallet Provider LoTE. The same LoTE can be used to distribute trust anchors for WUAC validation, so no new trust anchor distribution channel is needed.

#### 4.1.3 Disadvantages

1. **Additional operational burden on Wallet Providers.** Wallet Providers must issue and manage WUACs as a second class of credential alongside JWT-based WUAs (WIAs and KAs). This entails operating an additional certificate issuance endpoint and handling WUAC renewal on Wallet Units.

2. **CRL infrastructure required.** [ISO/IEC 18013-5], Annex B requires a CRL Distribution Points extension in reader authentication certificates. Wallet Providers must therefore operate and maintain a publicly accessible CRL endpoint for WUACs. This is infrastructure that does not exist for JWT-based WUAs (WIAs and KAs), whose revocation is handled through the attestation status list mechanism. The CRL must be accessible to all Holder Wallet Units that may need to validate a WUAC, including across borders and Wallet Provider boundaries.

3. **Certificate lifecycle management.** Short-lived WUACs require frequent re-issuance. Wallet Units must obtain renewed certificates before expiry, which requires connectivity at intervals aligned with the validity period. A rotation and renewal strategy -- including behaviour during offline periods -- must be defined.

4. **Linkability risk from certificate reuse.** A WUAC reused across multiple W2W sessions is linkable by its public key and signature. The Subject contains only the Wallet Provider and Wallet Solution names, so individual Users within the same Wallet Solution cannot be distinguished from one another through the certificate fields alone. However, an observer who participates in or collects multiple sessions can determine that the same Wallet Unit was involved. The risk can be mitigated by issuing a fresh WUAC with a new key pair for each session, at the cost of increased issuance frequency and an online round-trip before each interaction.

### 4.2 Approach B: Verifier PID Presentation as Extension to ISO/IEC 18013-5

#### 4.2.1 Description

In this approach, the W2W protocol is extended so that the Verifier Wallet Unit presents its own PID to the Holder Wallet Unit together with the presentation request. This requires an extension to [ISO/IEC 18013-5] to allow a presentation to be carried in the same flow as a request, in addition to the response. Compared with the reversed prior flow described in Section 2.1, this approach provides a stronger guarantee: because the Verifier PID presentation is carried within the same protocol session as the mdoc request, the Verifier authentication is cryptographically bound to the subsequent request. In the reversed prior flow, by contrast, the Verifier authentication and the main W2W interaction are two separate protocol runs, which leaves open the possibility that a malicious Verifier authenticates using one application (for example, a genuine EUDI Wallet Unit) and then sends the actual presentation request from a different application.

When the request arrives at the Holder Wallet Unit, the embedded PID presentation is validated against the PID Provider trust anchors in the corresponding LoTE. If validation succeeds, the Holder is prompted to approve the disclosure, and the approval UI displays the Verifier's identity (as derived from the validated PID). If validation fails, the interaction is aborted. The approach can be specified as mandatory (a Verifier PID presentation is always required) or as a Holder-initiated option (the Holder Wallet Unit can require the Verifier to present a PID before proceeding).

Because PIDs are issued only to genuine EUDI Wallet Units and, under the revocation chaining requirement from Topic C, the PID Provider is obligated to revoke a PID when the underlying Wallet Instance or WSCD/keystore is revoked, successful validation of a non-revoked PID also guarantees the Holder that the Verifier device is a genuine, non-revoked EUDI Wallet Unit. A Verifier PID presentation therefore authenticates both the Verifier as a person and the Verifier device as a genuine Wallet Unit in a single step.

It should be noted that the Verifier can make a PID presentation without disclosing any PID attributes. The issuer signature and the device authentication are sufficient for the Holder Wallet Unit to verify that the Verifier holds a valid, non-revoked PID -- and therefore operates a genuine EUDI Wallet Unit -- without learning anything about the Verifier's identity. The Verifier can thus choose to present zero attributes (proving only device genuinity), a minimal set of attributes, or a fuller set, depending on the use case and the Verifier's willingness to disclose.

#### 4.2.2 Advantages

1. **No new certificate infrastructure.** The approach does not require Wallet Providers to issue or manage a new class of certificate, and no new CRL or OCSP services are required.

2. **Authentication of the Verifier as a person.** The Holder learns the identity of the Verifier (subject to selective disclosure of the PID), which is a stronger basis for the consent decision than knowing only that the device is a genuine Wallet Unit.

3. **No additional linkability.** The privacy properties of the PID presentation are governed by the existing PID specification and selective disclosure mechanisms; no new linkability vector is introduced beyond what a normal PID presentation already involves.

#### 4.2.3 Disadvantages

1. **Requires an extension to ISO/IEC 18013-5.** Carrying a Verifier PID presentation in the same flow as the mdoc request is not part of the current standard, so adoption of this approach depends on a corresponding extension to ISO/IEC 18013-5.

2. **Higher protocol complexity.** Combining a request and a presentation in one flow increases the complexity of the W2W exchange and of the wallet implementations.

3. **Increased user interaction.** The Verifier must approve a PID presentation in order to make a request. This adds a step to every W2W interaction in which the Verifier acts. Moreover, for selective disclosure to be meaningful, the Verifier must be given the opportunity to indicate which PID attributes to include in the presentation. The Verifier must also be able to refuse presenting any PID attributes altogether.

4. **Verifier privacy.** A Verifier PID presentation requires the Verifier to disclose person identification data in order to make a request, which may be disproportionate for use cases where the Verifier does not need to be identified personally (for example, casual age verification at the door of a private event). Since PIDs are selectively disclosable, the Verifier Wallet Unit can in principle give the Verifier the option to choose which PID attributes to include in the presentation, which mitigates this concern.

5. **Verifier PID is disclosed before the Holder is authenticated.** The Verifier Wallet Unit transmits the Verifier's PID together with the presentation request, i.e., before the Holder Wallet Unit has been cryptographically authenticated as a genuine, non-revoked EUDI Wallet Unit. The Verifier therefore discloses person identification data to a device whose genuinity has not been established at the point of disclosure.

### 4.3 Approach C: Session-Bound Reversed Prior Flow

#### 4.3.1 Description

This approach starts from the reversed prior flow described in Section 2.1 and addresses its session-binding weakness by cryptographically tying the two protocol runs together. As in the reversed prior flow, the Verifier first presents a PID to the Holder in a reversed ISO/IEC 18013-5 protocol run; the main W2W interaction (in which the Holder presents to the Verifier) then follows as a second run. The difference is that a session-binding mechanism ensures the Holder Wallet Unit can verify that the same application performed both runs, preventing a malicious Verifier from authenticating with a genuine EUDI Wallet Unit in the first run and then switching to a different application for the second.

Two candidate session-binding mechanisms have been identified:

1. **Proof of knowledge of the first session's key material.** After the first (reversed) protocol run, the Verifier Wallet Unit retains the session key SKDevice (see [ISO/IEC 18013-5], Section 9.1.1.5) it derived when acting as the mdoc. In the second (main) protocol run, the Verifier Wallet Unit includes a proof of knowledge of this key -- for example, an HMAC keyed with SKDevice -- in the device request. The Holder Wallet Unit, which also derived SKDevice during the first run (acting as the mdoc reader), verifies this HMAC before proceeding. (Note: this is not a zero-knowledge proof; both parties derived the same session keys during the first run.) Because SKDevice is derived via ECDH from the ephemeral private keys of both parties, a second application on the Verifier's device cannot obtain it even if it intercepts the plaintext device engagement or session establishment messages, which contain only public keys. This requires specifying an additional field in the device request.

2. **Reuse of the same ephemeral public key across both runs.** The Verifier Wallet Unit uses the same ephemeral public key when acting as the mdoc in the first run and as the mdoc reader in the second run. The Holder Wallet Unit checks that the key matches. This avoids introducing new protocol fields, but the reuse of an ephemeral key across two different protocol runs is cryptographically unorthodox and requires further scrutiny.

*Note: The session-binding mechanisms described above are preliminary proposals. Further cryptographic analysis is required to establish their soundness, in particular regarding the security properties of the key material reused or derived across the two protocol runs.*

As with Approach B, the PID revocation chaining argument applies: successful validation of a non-revoked PID in the first run guarantees the Holder that the Verifier device is a genuine, non-revoked EUDI Wallet Unit, and simultaneously identifies the Verifier as a person. As noted in Section 4.2.1, the Verifier can also make a PID presentation without disclosing any attributes, proving only device genuinity without revealing the Verifier's identity.

#### 4.3.2 Advantages

1. **No new certificate infrastructure.** The approach does not require Wallet Providers to issue or manage a new class of certificate, and no new CRL or OCSP services are required.

2. **Authenticates both the Verifier Wallet Unit and the Verifier as a person.** Like Approach B, the PID presentation authenticates the Verifier device as genuine (via revocation chaining) and identifies the Verifier (via the PID).

3. **Smaller protocol extension than Approach B.** The extension is limited to a session-binding field or a key-reuse constraint between two standard ISO/IEC 18013-5 runs, rather than embedding a full presentation in the mdoc request.

4. **Reuses existing wallet logic.** Both protocol runs are standard ISO/IEC 18013-5 sessions; the only addition is the session-binding verification.

#### 4.3.3 Disadvantages

1. **Difficult user flow.** Both Wallet Units need to know they are participating in a two-phase reversed prior flow. This is not visible from the ISO/IEC 18013-5 protocol messages themselves; the respective Users must explicitly tell their Wallet Units (for example, by selecting a specific mode). The resulting interaction -- select reversed-flow mode, Verifier presents PID, switch roles, Verifier sends request -- is considerably more complex than a single-run W2W flow and may be confusing for Users.

2. **Two sequential protocol runs increase interaction time.** The W2W interaction requires two full ISO/IEC 18013-5 sessions to be established and completed, including two separate BLE handshakes and device engagements. This roughly doubles the time required compared to a single-run approach.

3. **Verifier must approve a PID disclosure.** As in Approach B, the Verifier must approve the PID presentation in the first (reversed) run. This adds a step to every W2W interaction.

4. **Verifier privacy.** As in Approach B, the Verifier is required to disclose person identification data in order to make a request. Selective disclosure of PID attributes can mitigate this concern.

5. **Verifier PID is disclosed before the Holder is authenticated.** The Verifier presents the PID in the first (reversed) run, at which point the Holder Wallet Unit has not been cryptographically authenticated as a genuine EUDI Wallet Unit.

6. **Requires a protocol extension for the session-binding mechanism.** Although smaller than the extension required by Approach B, the session-binding mechanism (whether a new field or a key-reuse constraint) requires specification and implementation work.

### 4.4 Approach D: Wallet Instance Attestation as Reader Authentication Material

#### 4.4.1 Description

In this approach, the Verifier Wallet Unit authenticates itself to the Holder Wallet Unit by presenting its Wallet Instance Attestation (WIA) -- the JWT issued by the Wallet Provider as defined in [Technical Specification 3] -- together with a signature over the ISO/IEC 18013-5 session transcript, produced with the private key corresponding to the public key in the WIA's `cnf` claim. This is structurally analogous to the Proof-of-Possession pattern that accompanies a WIA during credential issuance, repurposed as a reader authentication mechanism in the proximity context.

The Holder Wallet Unit validates the WIA signature against the Wallet Provider trust anchors published in the Wallet Provider LoTE (the same LoTE already used for WIA validation during credential issuance), validates the Wallet Instance status via the status list mechanism defined in [Technical Specification 3], and verifies the session-transcript signature using the `cnf` public key. If any of these checks fails, the interaction is aborted; otherwise, the approval UI indicates that the Verifier has been authenticated as a valid EUDI Wallet Unit and identifies the Wallet Provider.

**Wire-format sketch.** Carrying a WIA and a session-transcript signature in a W2W mdoc request requires an extension to [ISO/IEC 18013-5]. Three candidate placements have been identified:

- **(i) A new optional field in the device request.** The WIA and the session-transcript signature are carried in a new CBOR field added to the device request (for example, `verifierWalletAttestation`), separate from the existing `ReaderAuth` field. The `ReaderAuth` field remains unused in W2W (STS9_30 is relaxed from an absolute prohibition to: "SHALL NOT include `ReaderAuth`; MAY include `verifierWalletAttestation`"). A CBOR decoder implementing vanilla [ISO/IEC 18013-5] tolerates unknown map keys and ignores the new field; vanilla mdoc readers do not populate it. A W2W-capable Holder Wallet Unit that supports the extension processes the field and applies the requirements of [Section 3.2](#32-proposed-high-level-requirement-for-discussion).

- **(ii) A new unprotected COSE header inside `ReaderAuth`.** The prohibition on `ReaderAuth` in W2W is lifted, and the WIA is carried in a new unprotected COSE header (for example, labelled `wia`) inside the `ReaderAuth` COSE_Sign1 structure. The COSE_Sign1 signature is computed with the `cnf` private key over the session transcript, as [ISO/IEC 18013-5] already specifies. The validation path, however, differs: instead of chaining the signing key to an X.509 root via `x5chain`, the Holder Wallet Unit chains it to the Wallet Provider via the WIA.

- **(iii) WIA bound to a reader-auth certificate via `cnf.x5c`.** The Wallet Provider issues a WIA whose `cnf` claim is a JWK that includes the standard `x5c` member ([RFC 7517], Section 4.7) carrying an X.509 reader-authentication certificate. The Verifier Wallet Unit signs the session transcript with the corresponding private key, populates `x5chain` in the unprotected COSE header of `ReaderAuth` with the same certificate, and adds an EUDI-defined `wia` attribute (for example, an additional unprotected COSE header) carrying the WIA JWT itself. A vanilla mdoc reader validates `ReaderAuth` along the standard [ISO/IEC 18013-5] path: it chains `x5chain` to a configured trust anchor and verifies the signature. An EUDI-aware Holder Wallet Unit additionally validates the WIA against the Wallet Provider trust anchors in the LoTE, confirms that `cnf.x5c` matches the certificate in `x5chain`, and checks the WIA's status via the attestation status list defined in [Technical Specification 3]. The reader-authentication certificate profile is at the discretion of the EUDI ecosystem: the recommended profile in [ISO/IEC 18013-5], Annex B.1.7 may be followed (which mandates `CRLDistributionPoints`), or a leaner profile may be defined that uses the WIA's attestation status list as the revocation channel and omits CRL DP. Since B.1.7 is recommended, not mandatory, for `ReaderAuth` (per [ISO/IEC 18013-5], Annex B.1.1), the latter remains conformant to clause 9.1.4 of [ISO/IEC 18013-5].

The three placements differ along two dimensions: whether they preserve interoperability with wallets implementing vanilla [ISO/IEC 18013-5], and whether they require the Wallet Provider to issue X.509 reader-authentication certificates.

Placement (i) avoids the X.509 trust hierarchy entirely and depends purely on the WIA. Vanilla mdocs ignore the additive field and fall back to the unauthenticated W2W behaviour described in the current [Technical Specification 9]. Placement (ii) keeps the WIA inside `ReaderAuth` but omits `x5chain`, leaving a vanilla mdoc with no certificate to validate; vanilla interoperability is therefore not preserved in practice. Placement (iii) populates both `x5chain` and a `wia` attribute: a vanilla mdoc reader validates `ReaderAuth` exactly as today, while an EUDI-aware reader additionally consumes the WIA. Placement (iii) gives the strongest vanilla interoperability. It requires the Wallet Provider to issue an X.509 reader-authentication certificate alongside each WIA, but the marginal operational cost over the existing WIA issuance is modest, since the WIA infrastructure (signing key, issuance pipeline, lifecycle, trust-anchor publication via the Wallet Provider LoTE, and the attestation status list as revocation channel) is reused. Because B.1.7 is recommended rather than mandatory for `ReaderAuth`, an EUDI-defined certificate profile that relies on the WIA's attestation status list as the revocation channel and omits CRL Distribution Points remains conformant to clause 9.1.4 of [ISO/IEC 18013-5], so no separate CRL service is required. See disadvantage 5 in [Section 4.4.3](#443-disadvantages) for a fuller discussion.

The choice between placements (i) and (iii) reflects the same trade-off that distinguishes Approach A from a pure-WIA approach, exposed here as two placements within Approach D: avoid X.509 issuance entirely, or extend the existing WIA issuance pipeline to also produce a bound X.509 reader-authentication certificate so that vanilla [ISO/IEC 18013-5] readers can validate `ReaderAuth`. Placement (ii) is retained for completeness but is dominated by placement (iii) once `cnf.x5c` is used to bind the WIA to a certificate.

**Relationship to [Technical Specification 3].** [Technical Specification 3] currently scopes WIAs to the flows by which Wallet Units obtain PIDs and Attestations from credential issuers. Using a WIA as reader authentication material in a W2W proximity context is a new usage and requires a corresponding update to [Technical Specification 3] to permit this use. No new type of WIA is required: the binding between the WIA and the Verifier Wallet Unit's private key (via the `cnf` claim) combined with the session-transcript signature ensures that a WIA captured from a credential-issuance flow cannot be replayed as reader authentication in a W2W interaction, since a party that does not hold the `cnf` private key cannot produce the required signature over the session transcript.

#### 4.4.2 Advantages

1. **Reuses existing Wallet Unit Attestation infrastructure.** WIAs are already issued by Wallet Providers for credential issuance. No new class of credential, no new trust model, and no new CA hierarchy is introduced.

2. **No new CRL infrastructure required.** WIA revocation is handled via the existing attestation status list mechanism mandated for Wallet Unit Attestations. In contrast to Approach A, no public CRL endpoint needs to be operated for W2W reader authentication.

3. **Reuse of LoTE-based trust anchor distribution.** Wallet Provider signing keys used to sign WIAs are already published in the Wallet Provider LoTE, so no new trust anchor distribution channel is needed.

4. **Low Verifier privacy impact.** No personal data of the Verifier is disclosed. The authentication asserts only that the device is a genuine Wallet Unit operated by a recognised Wallet Provider.

5. **Vanilla ISO/IEC 18013-5 interoperability under placements (i) and (iii).** Under placement (i), the WIA-bearing field is additive and vanilla decoders ignore it; vanilla mdocs fall back to unauthenticated W2W behaviour as in the current [Technical Specification 9], and a W2W-capable Holder Wallet Unit processing a request from a vanilla reader sees no WIA, so the [Section 3.2](#32-proposed-high-level-requirement-for-discussion) SHOULDs trigger the user warning. Under placement (iii), vanilla mdoc readers validate `ReaderAuth` exactly as [ISO/IEC 18013-5] specifies, with the `x5chain` certificate chaining to a configured trust anchor; EUDI-aware readers additionally validate the WIA. Placement (ii) does not preserve vanilla interoperability and is retained only for completeness.

#### 4.4.3 Disadvantages

1. **Requires an extension to ISO/IEC 18013-5.** Even under the backward-compatible placement (i), the device-request schema is extended with a new optional field, and the semantics of the extension need to be standardised alongside [ISO/IEC 18013-5].

2. **Requires an extension to [Technical Specification 3].** The scope of [Technical Specification 3] needs to be widened so that WIAs are permitted for use as W2W reader authentication material, in addition to their current use in credential issuance.

3. **Linkability risk from WIA reuse.** A WIA reused across multiple W2W sessions is linkable by the Wallet Provider signature and by the `cnf` public key. As in Approach A, this risk can be mitigated by obtaining a fresh WIA with a new key pair for each session, at the cost of increased issuance frequency and an online round-trip before each interaction.

4. **Limits of authentication.** As with Approach A, the mechanism confirms that the Verifier device is a genuine Wallet Unit but does not authenticate the Verifier as a person, and cannot prevent out-of-band capture of disclosed attributes.

5. **Under placement (iii), Wallet Providers also issue X.509 reader-authentication certificates.** Placement (iii) requires the Wallet Provider to embed an X.509 reader-authentication certificate in the WIA's `cnf.x5c`. The marginal cost relative to existing WIA issuance is modest: a Wallet Provider already operates a signing key, an issuance pipeline, a short-lived credential lifecycle, a trust-anchor publication mechanism (the Wallet Provider LoTE), and a revocation channel (the attestation status list defined in [Technical Specification 3]). Placement (iii) reuses all of these. What is added is the cert profile and DER-encoded X.509 generation alongside the WIA, both ship-once design artefacts rather than ongoing infrastructure. Concretely, no new revocation feed is needed: the WIA's attestation status list serves as the revocation channel for the bound certificate. Since [ISO/IEC 18013-5] Annex B.1.7 is recommended (not mandatory) for `ReaderAuth`, an EUDI-defined certificate profile that omits `CRLDistributionPoints` and relies on the WIA's status list is conformant to clause 9.1.4. The genuinely additional concern is exposing the Wallet Provider's CA root to vanilla mdoc readers (which consume X.509-style trust lists rather than the Wallet Provider LoTE); this is a trust-framework-level coordination question, the same one Approach A would face, and it is the principal difference in cost between placement (i) and placement (iii). Vanilla mdoc readers may in practice still expect B.1.7-compliant certificates, which limits how aggressively the profile can be slimmed down without sacrificing interoperability.

### 4.5 Comparison

The four approaches differ along several dimensions. The following table summarises the comparison.

Offline capability has not been included as a criterion. The Wallet Units initially deployed are expected to use a remote HSM as their WSCD, so Wallet Unit operation requires network connectivity in any case; the distinction between online and offline presentations therefore does not initially apply in practice.

| Criterion | Approach A (WUAC) | Approach B (Verifier PID in request) | Approach C (Session-bound reversed flow) | Approach D (WIA as reader auth) |
|---|---|---|---|---|
| What is authenticated | The Verifier Wallet Unit (genuinity) | Both the Verifier Wallet Unit (genuinity, via PID revocation chaining) and the Verifier as a person | Both the Verifier Wallet Unit (genuinity, via PID revocation chaining) and the Verifier as a person | The Verifier Wallet Unit (genuinity) |
| Standards impact | None (uses existing `ReaderAuth`) | Requires extension of ISO/IEC 18013-5 | Small extension (session-binding field or key-reuse constraint) | Additive extension of ISO/IEC 18013-5 (vanilla compatibility under placements (i) and (iii)) and a small extension of [Technical Specification 3]. Under placement (iii) the reader-auth certificate profile is at the EUDI ecosystem's discretion, since B.1.7 is recommended (not mandatory) for `ReaderAuth`. |
| New infrastructure for Wallet Providers | Yes (WUAC issuance endpoint and CRL service) | No | No | Depends on placement: under (i)/(ii), no new infrastructure; under (iii), the existing WIA issuance pipeline is extended to also produce an X.509 reader-authentication certificate bound via `cnf.x5c`, with the WIA's attestation status list serving as the revocation channel. |
| Reuse of existing LoTE-based trust anchor distribution | Yes | Yes | Yes | Yes |
| Reuse of existing wallet logic | `ReaderAuth` code path already used for WRP interactions | Existing attestation presentation and validation logic | Existing ISO/IEC 18013-5 protocol (run twice) | Existing WIA issuance and validation logic; a new reader-authentication path is added |
| Protocol complexity | Low (one additional field in the mdoc request) | Higher (request and presentation combined in one flow) | Higher (two sequential protocol runs + session binding) | Moderate (new additive field carrying WIA plus transcript signature) |
| User interaction complexity | Low (no additional steps for the User) | Moderate (Verifier must approve a PID presentation) | High (two-phase flow; both Users must select a specific mode and switch roles) | Low (no additional steps for the User) |
| Verifier privacy impact | Low (no personal data of the Verifier disclosed) | High (PID disclosure required; mitigable through selective disclosure) | High (PID disclosure required; mitigable through selective disclosure) | Low (no personal data of the Verifier disclosed) |
| Linkability of the Verifier | Moderate; mitigable through fresh certificates per session | Same as for a normal PID presentation | Same as for a normal PID presentation | Moderate; mitigable through fresh WIAs per session |
| Verifier discloses data before the Holder is authenticated | No (no Verifier data disclosed) | Yes (Verifier PID is sent together with the request) | Yes (Verifier PID is presented in the reversed first run) | No (no Verifier data disclosed) |

Whether any of the approaches should be mandatory, optional, or conditional, and whether a combined model is appropriate, are open questions for Member State discussion.

## 5 Proposed Additions and Changes to HLRs in ARF Annex 2

This chapter turns the candidate phrasings presented in [Section 3.2](#32-proposed-high-level-requirement-for-discussion) into concrete proposed HLRs for ARF Annex 2. The HLRs are formulated at the SHOULD level, consistent with the position developed in [Section 3.2](#32-proposed-high-level-requirement-for-discussion); their strength may be revisited once a technical approach is selected.

### 5.1 New HLRs to be added to Topic 30

The following three HLRs are proposed for addition to Topic 30 (Interaction between Wallet Units) of Annex 2 of ARF v2.8.0. Indexing continues from the current last entry in that version (W2W_22).

| **Index** | **Requirement specification** |
| -- | -- |
| W2W_23 | When sending a presentation request to a Holder Wallet Unit, a Verifier Wallet Unit SHALL include in that request a cryptographic proof of its authenticity and validity, bound to the protocol session in which the presentation request is sent. |
| W2W_24 | Before presenting a received presentation request to the Holder, a Holder Wallet Unit SHALL, within the same protocol session as the presentation request, cryptographically verify that the Verifier Wallet Unit is a genuine, non-revoked EUDI Wallet Unit operated by a recognised Wallet Provider. |
| W2W_25 | If the verification required by W2W_24 fails or cannot be performed, a Holder Wallet Unit SHALL notify the User. In addition, the Wallet Unit SHALL either not present the requested attributes to the Verifier Wallet Unit, or give the User the choice to present the requested attributes or not. Note: It is up to the Wallet Provider to make a choice for one of these two options. |

These HLRs are mechanism-agnostic: they fix the assurance objective (genuine, non-revoked Verifier Wallet Unit, verified within the same protocol session) without prescribing how the cryptographic proof is constructed. [Chapter 4](#4-technical-approaches) describes four candidate mechanisms and their respective trade-offs.

### 5.2 Existing HLRs

No existing HLR in Topic 30 requires modification. The three HLRs above are additive and do not conflict with W2W_01 to W2W_22. 

## 6 References

| Reference | Description |
|---|---|
| [ARF_DevPlan] | Architecture and Reference Framework Maintenance and Development Workplan for 2026, European Commission |
| [European Digital Identity Regulation] | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework |
| [ISO/IEC 18013-5] | ISO/IEC 18013-5:2021, Personal identification - ISO-compliant driving licence - Part 5: Mobile driving licence (mDL) application |
| [RFC 7517] | Jones, M., "JSON Web Key (JWK)", RFC 7517, May 2015 |
| [Technical Specification 3] | Specification of Wallet Unit Attestations (WUA) used in issuance of PID and Attestations, v1.5, 2026-03-15 |
| [Technical Specification 9] | Specification of Wallet to Wallet Interactions, v1.0.1, 2026-01-30 |
