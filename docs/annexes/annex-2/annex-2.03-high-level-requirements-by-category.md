---
title: "European Digital Identity Wallet"
subtitle: "Architecture and Reference Framework"
...

# ANNEX 2.03 - High-Level Requirements by category<!-- omit from toc -->

## A.2 High-level requirements by category

### A.2.1 Introduction

This annex to the ARF main document includes high-level requirements (HLRs)
related to the EUDI Wallet ecosystem. The requirements define the responsible
actor that should implement each requirement. There are no requirements imposed
on the Users. All requirements in this Annex only apply in the context of the
EUDI Wallet ecosystem.

This Annex uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY' as
specified in RFC 2119, i.e., to indicate requirements, recommendations and
options specified in this annex.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, i.e., a requirement that is not mandated by this document, but, for
instance, by an external standard or specification. The word 'can' indicates a
capability, whereas other words, such as 'will', and 'is' or 'are', are intended
as statements of fact. Each requirement is anchorable via its identifier, e.g.
`#WP_01`.

---

## Part 1: Actor-Specific Requirements

### 1. Wallet Providers

*These requirements are the responsibility of the entities building and managing*
*the EUDI Wallet solutions. They cover the core functionalities, security, user*
*interface elements, and lifecycle management of the wallet.*

<div class="eudi-hlr" id="AS-WP-06-001" markdown>
<div class="eudi-hlr__id">AS-WP-06-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_01
{: .eudi-hlr__meta }

The Wallet Unit used by a User, as well as the Relying Party Instance used by the Relying Party, SHALL implement a mechanism for Relying Party authentication in PID or attestation presentation transactions. This mechanism SHALL: - enable the Wallet Unit to identify and authenticate the Relying Party, - enable the Wallet Unit to verify that the request from the Relying Party was not copied and replayed, - use an access certificate issued in accordance with [Topic 27][topic-27]].

*Note: Wallet Units and Relying Parties comply with this requirement if they comply with the requirements in this Topic.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-002" markdown>
<div class="eudi-hlr__id">AS-WP-06-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_01a
{: .eudi-hlr__meta }

A Wallet Unit SHALL retain full authority over the process meant in RPA_01. In particular, this process SHALL NOT be handled by a third party, including the browser and the operating system.

*Note: This requirement applies, in particular, in the context of the [W3C Digital Credentials API].*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-003" markdown>
<div class="eudi-hlr__id">AS-WP-06-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_02
{: .eudi-hlr__meta }

For performing Relying Party authentication, Wallet Units and Relying Party Instances SHALL support access certificates as specified in [ETSI TS 119 475] and [ETSI TS 119 411-8].

*Note: In [ISO/IEC 18013-5], the Relying Party authentication mechanism is called mdoc reader authentication and uses an X.509 certificate. For [OpenID4VP], [HAIP] specifies that Client Identifier Prefix `x509_hash` must be used to authenticate the Relying Party. This mechanism also uses an X.509 certificate.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-004" markdown>
<div class="eudi-hlr__id">AS-WP-06-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_03
{: .eudi-hlr__meta }

A Wallet Unit and a Relying Party Instance SHALL perform Relying Party authentication in all PID or attestation presentation transactions to Relying Parties, whether proximity or remote, using an access certificate.

*Note: The actions both entities perform differ. For example, while the Relying Party creates a signature over some data in the request, the Wallet Unit validates that signature.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-005" markdown>
<div class="eudi-hlr__id">AS-WP-06-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_04
{: .eudi-hlr__meta }

For the verification of access certificates, a Wallet Unit SHALL accept only the trust anchors in the LoTE(s) of all Access Certificate Authorities notified by Member States.

*Note: For more information about Access Certificate Authorities, please see [Topic 31][topic-31]].*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-006" markdown>
<div class="eudi-hlr__id">AS-WP-06-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_05
{: .eudi-hlr__meta }

If Relying Party authentication fails for any reason, the Wallet Instance SHALL inform the User that the identity of the Relying Party could not be verified and that therefore the request is not trustworthy.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-007" markdown>
<div class="eudi-hlr__id">AS-WP-06-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_06
{: .eudi-hlr__meta }

If Relying Party authentication succeeds, the Wallet Instance SHALL display to the User the trade names of the Relying Party and its Service, as included in the access certificate received from the Relying Party Instance, together with the attributes requested by the Relying Party. The Wallet Instance SHALL do so when asking the User for approval according to RPA_07.

*Note: a) A Relying Party Instance may be used for multiple Relying Party Services, provided it has received a separate access certificate for each, see Reg_10a. b) If the authenticated Relying Party is an intermediary acting on behalf of an intermediated Relying Party, the Wallet Instance does not display the trade names of the intermediary and its Service, but only those of the intermediated Relying Party; see RPI_07.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-008" markdown>
<div class="eudi-hlr__id">AS-WP-06-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_06a
{: .eudi-hlr__meta }

If Relying Party authentication fails for any reason, the Wallet Unit SHALL notify the User. In addition, the Wallet Unit SHALL either not present the requested attributes to the Relying Party, or give the User the choice to present the requested attributes or not.

*Note: It is up to the Wallet Provider to make a choice for one of these two options.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-009" markdown>
<div class="eudi-hlr__id">AS-WP-06-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_07
{: .eudi-hlr__meta }

A Wallet Unit SHALL ensure the User approved the presentation of any attribute(s) in the Wallet Unit to a Relying Party or Verifier Wallet Unit, prior to presenting these attributes. A Wallet Unit SHALL always allow the User to refuse presenting an attribute requested by the Relying Party or Verifier Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-010" markdown>
<div class="eudi-hlr__id">AS-WP-06-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_07a
{: .eudi-hlr__meta }

A Wallet Unit SHALL retain full authority over the process meant in RPA_07, RPA_07b, and RPA_07c. In particular, this process SHALL NOT be handled by a third party, including the browser and the operating system.

*Note: This requirement applies, in particular, in the context of the [W3C Digital Credentials API].*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-011" markdown>
<div class="eudi-hlr__id">AS-WP-06-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_07b
{: .eudi-hlr__meta }

In addition to RPA_07, in case the Wallet Unit warns the User about failed verifications regarding the Relying Party's access certificate or registration certificate, the Wallet Unit SHALL ensure that User approval is explicit. Silence or pre-ticked boxes SHALL NOT suffice.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-012" markdown>
<div class="eudi-hlr__id">AS-WP-06-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_07c
{: .eudi-hlr__meta }

In addition to RPA_07, in case a Relying Party requests the presentation of the portrait in a PID (see PID Rulebook), the Wallet Unit SHALL warn the User that the request involves the presentation of biometric data. The Wallet Unit SHALL ensure that User approval for presenting the portrait is explicit. Silence or a pre-ticked box SHALL NOT suffice.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-013" markdown>
<div class="eudi-hlr__id">AS-WP-06-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_08
{: .eudi-hlr__meta }

A Wallet Unit SHALL authenticate the User before allowing the User to give or refuse approval for releasing any attributes, in accordance with WIAM_14 or WIAM_15, as applicable.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-014" markdown>
<div class="eudi-hlr__id">AS-WP-06-014</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_09
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-015" markdown>
<div class="eudi-hlr__id">AS-WP-06-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_10
{: .eudi-hlr__meta }

When asking for User approval, the Wallet Unit SHALL show to the User the User-friendly description of the Relying Party's intended use and the link to the applicable privacy policy.

*Note: The User-friendly description of the Relying Party's intended use is included in the registration certificate. The link to the privacy policy is also included in the registration certificate. See [Topic 44][topic-44] for details.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-016" markdown>
<div class="eudi-hlr__id">AS-WP-06-016<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_10a
{: .eudi-hlr__meta }

The Wallet Unit SHOULD ensure that the User gives approval either to present all attributes requested in a presentation request, or none of them.

*Note: This means that a User should be asked either to approve the presentation of all requested attributes or to deny all of them. The Wallet Unit should not allow partial approval, since this would mean that the Relying Party cannot deliver the service, but nevertheless receives some User attributes. This would be a violation of the User's privacy. Note that a Relying Party is not allowed to request more data than is justified for the intended use. So if the User feels that the Relying Party is actually requesting more data than needed, that implies that the Relying Party is not trustworthy and should not receive any data.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-017" markdown>
<div class="eudi-hlr__id">AS-WP-06-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_11
{: .eudi-hlr__meta }

When the presentation of an attestation or a PID is denied by the User, the Wallet Unit SHALL behave towards the Relying Party as if the attestation or PID did not exist.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-06-018" markdown>
<div class="eudi-hlr__id">AS-WP-06-018<span class="kw-may">MAY</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_12
{: .eudi-hlr__meta }

When asking for User approval, the Wallet Unit MAY indicate to the User whether the attestation requested by a Relying Party is device-bound or not.

*Note: The intent of this indication is to warn the User that a non-device-bound attestation may be copied by the Relying Party and presented to a third party.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-001" markdown>
<div class="eudi-hlr__id">AS-WP-09-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_01
{: .eudi-hlr__meta }

A Key Attestation SHALL contain information about the certification of the WSCA/WSCD or a keystore available to the Wallet Unit, and SHALL comply with the relevant requirements in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).

*Note: A PID Provider or Attestation Provider can use this information to take a well-grounded decision on whether to issue a PID or attestation to the Wallet Unit.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-002" markdown>
<div class="eudi-hlr__id">AS-WP-09-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_02
{: .eudi-hlr__meta }

A Key Attestation SHALL enable PID Providers and Attestation Providers to verify the authenticity of a WSCD or keystore and to check whether the WSCD or keystore has been revoked.

*Note: A KA carries a revocation reference that is valid for the WSCD or keystore of the Wallet Unit. How this revocation reference is managed (individually or per type of WSCD/keystore) depends on the approach chosen by the Wallet Provider (see WUA_28), but this is not relevant for the PID Provider or Attestation Provider that receives the KA.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-003" markdown>
<div class="eudi-hlr__id">AS-WP-09-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_03
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that a non-revoked Wallet Unit at all times can present a temporally valid and non-revoked KA to a PID Provider or Attestation Provider during the issuance process of a PID or device-bound attestation.

*Note: a) Revocation refers to the attested WSCD/keystore, not to the KA itself. b) For example, the Wallet Provider could pro-actively issue new KAs to the Wallet Unit, so that the Wallet Unit is always in possession of a valid KA. Alternatively, the Wallet Provider could ensure that whenever the User opens the Wallet Unit, it checks whether it is possession of a valid KA, and requests the Wallet Provider to issue a new KA if needed. A third possibility is that the Wallet Unit does this check only when it starts the process of requesting the (re-)issuance of a PID or attestation. Other alternatives to comply with this requirement may be used as well.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-004" markdown>
<div class="eudi-hlr__id">AS-WP-09-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_04
{: .eudi-hlr__meta }

When issuing, presenting, or verifying a WIA or KA, Wallet Providers, Wallet Units, PID Providers, and Attestation Providers SHALL only use cryptographic algorithms included in the [ECCG Agreed Cryptographic Mechanisms v2.0].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-005" markdown>
<div class="eudi-hlr__id">AS-WP-09-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_05
{: .eudi-hlr__meta }

During issuance of a PID, the Wallet Unit SHALL provide the PID Provider with a valid KA describing the WSCA/WSCD that generated the new PID private key.

*Note: A PID private key is always generated and managed by the WSCA/WSCD, which by definition complies with requirements for Level of Assurance High.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-006" markdown>
<div class="eudi-hlr__id">AS-WP-09-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_05a
{: .eudi-hlr__meta }

During issuance of a device-bound attestation, a Wallet Unit SHALL retrieve the requirements of the Attestation Provider regarding key storage from the Credential Issuer metadata (see ISSU_27d). The Wallet Unit SHALL determine which of its WSCA/WSCD or keystore(s), if any, comply with these requirements. If a compliant WSCA/WSCD or keystore is available to the Wallet Unit, the Wallet Unit SHALL provide the Attestation Provider with a valid KA describing the selected WSCA/WSCD or keystore.

*Note: A KA describes the certification properties of the WSCA/WSCD or a keystore (see WUA_01) and contains one or more public key(s) corresponding to private key(s) generated by and stored in that WSCA/WSCD or keystore (see WUA_09).*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-007" markdown>
<div class="eudi-hlr__id">AS-WP-09-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_06
{: .eudi-hlr__meta }

If a Wallet Unit contains a WSCA/WSCD and one or more keystores, it SHALL, internally and securely, keep track of which PID(s) and attestation(s) are bound to which WSCA/WSCD or keystore.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-008" markdown>
<div class="eudi-hlr__id">AS-WP-09-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_07
{: .eudi-hlr__meta }

A Wallet Unit SHALL present a KA only to a PID Provider or Attestation Provider, as part of the issuance process of a PID or a key-bound attestation, and not to a Relying Party or any other entity.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-009" markdown>
<div class="eudi-hlr__id">AS-WP-09-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_08
{: .eudi-hlr__meta }

A WIA SHALL enable PID Providers to request a Wallet Provider to revoke a Wallet Unit, in accordance with requirement WURevocation_11, by including an identifier for the Wallet Instance in the WIA. The Wallet Provider SHALL ensure that this Wallet Instance identifier does not enable tracking of the User.

*Note: a) This is a legal requirement from [CIR 2024/2977]. b) Under [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md) V1.5, this Wallet Instance identifier is the URI and index to the Attestation Status List for WIAs.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-010" markdown>
<div class="eudi-hlr__id">AS-WP-09-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_09
{: .eudi-hlr__meta }

A KA SHALL contain one or more public keys, and the corresponding private keys SHALL be generated by and stored in the WSCA/WSCD or the keystore described in the KA.

*Note: By signing the KA, the Wallet Provider attests to the fact that the private key(s) corresponding to the public key(s) in the KA are generated by and stored in this WSCA/WSCD or keystore. This implies that the Wallet Provider has verified that this is actually the case. However, neither the ARF nor [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md) specify at which moment the WSCA/WSCD or keystore generated the private keys, or how the Wallet Provider verified that it did so.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-011" markdown>
<div class="eudi-hlr__id">AS-WP-09-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_09a
{: .eudi-hlr__meta }

During issuance of a PID or a device-bound attestation, the PID Provider or Attestation Provider SHALL bind the issued PID(s) or attestation(s) to one of the public keys attested in the KA received from the Wallet Unit.

*Note: This implements device binding, see ISSU_17 and ISSU_27.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-012" markdown>
<div class="eudi-hlr__id">AS-WP-09-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_10
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that the certificates they use for signing WIAs and KAs comply with all applicable requirements in [ETSI TS 119 412-6], in particular Clause 5.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-013" markdown>
<div class="eudi-hlr__id">AS-WP-09-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_10a
{: .eudi-hlr__meta }

An Attestation Provider issuing non-device-bound attestations SHALL indicate in its Credential Issuer metadata that it does not need a KA, as specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md). A Wallet Unit SHALL NOT send a KA to an Attestation Provider when requesting a non-device-bound attestation.

*Note: A Wallet Unit sends a WIA to the Attestation Provider regardless of whether the attestations it issues are device-bound or not.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-014" markdown>
<div class="eudi-hlr__id">AS-WP-09-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_10b
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that the presentation of a KA is cryptographically bound to the specific context it is intended to be used in.

*Note: As specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md), this is achieved by letting the signed KA itself contain a nonce provided by the PID Provider or Attestation Provider during the issuance process. Alternatively, the Wallet Unit presents the KA along with a Proof-of-Possession consisting of a signature over that nonce, created by the private key corresponding to one of the public keys attested in the KA.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-015" markdown>
<div class="eudi-hlr__id">AS-WP-09-015<span class="kw-may">MAY</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_11
{: .eudi-hlr__meta }

When asking for User approval to store an attestation (see ISSU_11), the Wallet Unit MAY indicate to the User whether the attestation requested by a Relying Party is device-bound or not.

*Note: The intent of this indication is to warn the User that a non-device-bound attestation may be copied by an attacker breaching the Wallet Unit's security. See also RPA_12.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-016" markdown>
<div class="eudi-hlr__id">AS-WP-09-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_11a
{: .eudi-hlr__meta }

During issuance of a PID or a device-bound attestation, the PID Provider or Attestation Provider SHALL verify the KA in accordance with the requirements in [OpenID4VCI] Appendix F.4. In addition, the PID Provider or Attestation Provider SHALL validate that the KA is not revoked.

*Note: If the verification of the KA is successful, the PID Provider or Attestation Provider can trust that all public keys in the KA are bound to the WSCD or keystore described in the KA (see WUA_09).*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-017" markdown>
<div class="eudi-hlr__id">AS-WP-09-017</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_11b
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-018" markdown>
<div class="eudi-hlr__id">AS-WP-09-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_12
{: .eudi-hlr__meta }

During issuance of a PID or a device-bound attestation, the PID Provider or Attestation Provider SHALL receive a proof that the Wallet Unit possesses the private keys corresponding to all public keys in the KA.

*Note: As specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md), this proof consists of the signature of the Wallet Provider over the KA in combination with the proof mentioned in WUA_10b.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-019" markdown>
<div class="eudi-hlr__id">AS-WP-09-019</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_13
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-020" markdown>
<div class="eudi-hlr__id">AS-WP-09-020</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_14
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-021" markdown>
<div class="eudi-hlr__id">AS-WP-09-021</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_15
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-022" markdown>
<div class="eudi-hlr__id">AS-WP-09-022</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_16
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-023" markdown>
<div class="eudi-hlr__id">AS-WP-09-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_16a
{: .eudi-hlr__meta }

A WSCA SHALL NOT enable export of private keys from a WSCD.

*Note: The WSCA is dedicated firmware and/or software implementing specific functions needed within the EUDI Wallet ecosystem. Within that context, there is no need for private key export. Therefore, a WSCA must not support it. However, a WSCD or a keystore may enable private key export via native firmware or software, for generic purposes.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-024" markdown>
<div class="eudi-hlr__id">AS-WP-09-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_17
{: .eudi-hlr__meta }

A Wallet Provider SHALL consider all relevant factors, including offline usage, interoperability, and the risk of a WIA or KA becoming a vector to track the User, when deciding on the validity period of a WIA or KA.

*Note: a) Regarding interoperability, see WUA_30, which limits the validity period of PIDs issued based on the revocation maintenance periods of the WIA and KA received during issuance. b) As specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md), a PID Provider or Attestation Provider may communicate its preferences regarding the minimum revocation maintenance period of the WIA and KA to the Wallet Unit. The Wallet Unit and the Wallet Provider should take this into account (see WUA_32). c) For the WIA specifically, a short technical validity period is required to ensure freshness. See WUA_33.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-025" markdown>
<div class="eudi-hlr__id">AS-WP-09-025</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_18
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-026" markdown>
<div class="eudi-hlr__id">AS-WP-09-026</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_19
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-027" markdown>
<div class="eudi-hlr__id">AS-WP-09-027</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_20
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-028" markdown>
<div class="eudi-hlr__id">AS-WP-09-028</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_20a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-029" markdown>
<div class="eudi-hlr__id">AS-WP-09-029</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_21
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-030" markdown>
<div class="eudi-hlr__id">AS-WP-09-030<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_22
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that a non-revoked Wallet Unit at all times can present a temporally valid and non-revoked WIA to a PID Provider or Attestation Provider during the issuance process of a PID or attestation.

*Note: a) This requirement applies to both device-bound and non-device-bound attestations. b) Revocation refers to the attested Wallet Instance, not to the WIA itself. c) For example, the Wallet Provider could pro-actively issue new WIAs to the Wallet Unit, so that the Wallet Unit is always in possession of a valid WIA. Alternatively, the Wallet Provider could ensure that whenever the User opens the Wallet Unit, it checks whether it is possession of a valid WIA, and requests the Wallet Provider to issue a new WIA if needed. A third possibility is that the Wallet Unit does this check only when it starts the process of requesting the (re-)issuance of a PID or attestation. Other alternatives to comply with this requirement may be used as well.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-031" markdown>
<div class="eudi-hlr__id">AS-WP-09-031</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_23
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-032" markdown>
<div class="eudi-hlr__id">AS-WP-09-032<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_24
{: .eudi-hlr__meta }

A Wallet Unit SHALL present a WIA only to a PID Provider or Attestation Provider, as part of the issuance process of a PID or an attestation, and not to a Relying Party or any other entity.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-033" markdown>
<div class="eudi-hlr__id">AS-WP-09-033<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_25
{: .eudi-hlr__meta }

During issuance of a PID or attestation, the PID Provider or Attestation Provider SHALL verify the WIA in accordance with the requirements in [OpenID4VCI] Appendix E. In addition, the PID Provider or Attestation Provider SHALL validate that the WIA is not revoked.

*Note: This requirement applies to both device-bound and non-device-bound attestations.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-034" markdown>
<div class="eudi-hlr__id">AS-WP-09-034<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_26
{: .eudi-hlr__meta }

A WIA SHALL enable PID Providers and Attestation Providers to verify the authenticity of a Wallet Instance and to check whether the Wallet Instance has been revoked.

*Note: A WIA carries the revocation reference for a Wallet Instance. The revocation status of the Wallet Instance is maintained in a status list referenced in the WIA.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-035" markdown>
<div class="eudi-hlr__id">AS-WP-09-035<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_27
{: .eudi-hlr__meta }

A WIA SHALL contain information about the Wallet Solution, including its identity, version, and certification, and SHALL comply with the relevant requirements in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).

*Note: This information allows PID Providers and Attestation Providers to verify that the Wallet Instance belongs to a trusted and certified Wallet Solution, as registered in the Wallet Provider Trusted List.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-036" markdown>
<div class="eudi-hlr__id">AS-WP-09-036<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_28
{: .eudi-hlr__meta }

A Wallet Provider SHALL select either the type-shared index approach or the per-KA index approach (as specified in Section 2.5.2 of [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md)) for managing the revocation status of the WSCD or keystore referenced in a Key Attestation.

*Note: a) Under the type-shared index approach, the revocation reference is shared across all Wallet Units using the same type of WSCD or keystore, so that a single revocation action covers all affected Wallet Units (e.g., when a security vulnerability is identified in a hardware component type). Under the per-KA index approach, each KA carries a revocation reference scoped to the specific Wallet Unit's WSCD or keystore instance, enabling individual revocation that may also be triggered by user request. b) The detailed requirements for each approach are specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-037" markdown>
<div class="eudi-hlr__id">AS-WP-09-037<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_28a
{: .eudi-hlr__meta }

If the per-KA index approach is used, the Wallet Provider SHALL ensure that the revocation reference in a KA cannot be used to link a Wallet Unit's interactions across different PID Providers or Attestation Providers.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-038" markdown>
<div class="eudi-hlr__id">AS-WP-09-038<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_29
{: .eudi-hlr__meta }

Throughout the entire validity period of an issued PID, the PID Provider SHALL verify the revocation status of both the Wallet Instance and WSCD using the information in the WIA and the KA (respectively) received during the issuance of that PID. If either is revoked, the PID Provider SHALL revoke the PID.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-039" markdown>
<div class="eudi-hlr__id">AS-WP-09-039<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_30
{: .eudi-hlr__meta }

The technical validity period of a PID SHALL be consistent with the period during which the Wallet Provider has committed to maintaining the revocation status of the Wallet Instance and the WSCD, as conveyed in the WIA and KA presented during issuance.

*Note: a) This reflects the revocation chaining requirement: PID Providers must be able to check whether the Wallet Instance has been revoked (via the WIA) and whether the WSCD referenced in the KA has been revoked (WUA_29) for the entire PID validity period.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-040" markdown>
<div class="eudi-hlr__id">AS-WP-09-040<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_31
{: .eudi-hlr__meta }

A Wallet Provider SHALL maintain the revocation status of a Wallet Instance during the entire revocation maintenance period indicated in the WIAs issued to that Wallet Instance.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-041" markdown>
<div class="eudi-hlr__id">AS-WP-09-041<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_31a
{: .eudi-hlr__meta }

A Wallet Provider SHALL maintain the revocation status of a WSCD or keystore during the entire revocation maintenance period indicated in the KAs issued to the Wallet Instance(s) using that WSCD or keystore.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-042" markdown>
<div class="eudi-hlr__id">AS-WP-09-042<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_32
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider having minimum requirements regarding the remaining revocation maintenance period for Wallet Instances (in WIAs) or WSCDs or keystores (in KAs) SHALL communicate these requirements to the Wallet Unit at the time of PID or attestation issuance, as specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).

*Note: This allows PID Providers and Attestation Providers to ensure that they receive WIAs and KAs with a sufficiently long remaining revocation maintenance period, enabling revocation chaining for the intended validity period of the PID or attestation to be issued.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-043" markdown>
<div class="eudi-hlr__id">AS-WP-09-043<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_33
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that WIAs have a short technical validity period as specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md), such that a WIA is fresh at the time of use.

*Note: As specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md), the technical validity period of a WIA SHALL be less than 24 hours. This ensures that the WIA reflects a recent integrity check of the Wallet Instance. The revocation maintenance period (see WUA_26 and WUA_31) is specified separately in the WIA and may be considerably longer than the technical validity period.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-044" markdown>
<div class="eudi-hlr__id">AS-WP-09-044<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_34
{: .eudi-hlr__meta }

During issuance of a PID, a PID Provider SHALL verify that the keys attested in the KA are stored in the WSCA/WSCD described in the KA.

*Note: PID private keys must be protected at Level of Assurance High, which requires key storage in a WSCA/WSCD. See also WUA_05, which requires the Wallet Unit to provide a KA describing the WSCA/WSCD that generated the PID private key.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-045" markdown>
<div class="eudi-hlr__id">AS-WP-09-045<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_35
{: .eudi-hlr__meta }

A Wallet Unit SHALL comply with all relevant requirements specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-046" markdown>
<div class="eudi-hlr__id">AS-WP-09-046<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_36
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL comply with all relevant requirements specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-09-047" markdown>
<div class="eudi-hlr__id">AS-WP-09-047<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WUA_37
{: .eudi-hlr__meta }

A Wallet Provider SHALL maintain, for each Wallet Unit it has activated, the set of WIAs and KAs it has issued to that Wallet Unit, in such a way that this association cannot be confused with that of any other Wallet Unit, including across different Wallet Solutions or different Wallet Solution versions. The Wallet Provider SHALL document the procedures, controls, and corresponding risk analysis implementing this requirement as part of the policy meant in WURevocation_03.

*Note: This requirement makes explicit at the HLR level the record-keeping duty already implicit in WURevocation_07, WURevocation_07a, WIAM_05, WIAM_06, and WIAM_10.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-001" markdown>
<div class="eudi-hlr__id">AS-WP-11-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable a User to generate a Pseudonym and register it at a Relying Party.

*Note: For an attested pseudonym, pseudonym generation takes place by requesting the issuance of a pseudonym attestation. Pseudonym registration takes place by presenting the attestation.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-002" markdown>
<div class="eudi-hlr__id">AS-WP-11-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_02
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable a User to authenticate with a Pseudonym towards a Relying Party if the Wallet Unit was used previously to register the Pseudonym for the same Relying Party

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-003" markdown>
<div class="eudi-hlr__id">AS-WP-11-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_03
{: .eudi-hlr__meta }

A Wallet Unit SHALL be able to perform the actions specified in the above two requirements independently of whether the interaction with the Relying Party is initiated on the same device hosting the Wallet Instance or on a device different from the one hosting the Wallet Instance.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-004" markdown>
<div class="eudi-hlr__id">AS-WP-11-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_04
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable the User to use multiple different Pseudonyms at a given Relying Party, unless it is explicitly designed as a scope rate-limited attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-005" markdown>
<div class="eudi-hlr__id">AS-WP-11-005<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_05
{: .eudi-hlr__meta }

A Wallet Unit SHOULD enable a User to freely choose a User alias for each Pseudonym registered at a Relying Party. Setting an alias SHOULD be optional for the User. The User SHOULD be able to change the alias for any Pseudonym.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-006" markdown>
<div class="eudi-hlr__id">AS-WP-11-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_06
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable a User to choose which Pseudonym to authenticate with towards a Relying Party, if multiple Pseudonyms are registered for this Relying Party. The Wallet Unit SHOULD present the User with the aliases of the applicable Pseudonyms, if assigned, when making this choice.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-007" markdown>
<div class="eudi-hlr__id">AS-WP-11-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_07
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable a User to delete a Pseudonym.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-008" markdown>
<div class="eudi-hlr__id">AS-WP-11-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_08
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable the User to manage Pseudonyms within the Wallet Unit in a user-friendly and transparent manner.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-009" markdown>
<div class="eudi-hlr__id">AS-WP-11-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_08a
{: .eudi-hlr__meta }

A Wallet Unit SHALL log Pseudonym registration and presentation transactions as specified in [Topic 19][topic-19].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-010" markdown>
<div class="eudi-hlr__id">AS-WP-11-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_09
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable the User to see all existing pseudonyms, including the associated Relying Party (if any).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-011" markdown>
<div class="eudi-hlr__id">AS-WP-11-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_10
{: .eudi-hlr__meta }

A Relying Party SHALL be able to verify that a User is registering a Pseudonym using a non-revoked Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-012" markdown>
<div class="eudi-hlr__id">AS-WP-11-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_11
{: .eudi-hlr__meta }

A Relying Party SHALL be able to verify that a User is authenticating with a Pseudonym using a non-revoked Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-013" markdown>
<div class="eudi-hlr__id">AS-WP-11-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_12
{: .eudi-hlr__meta }

If Wallet Unit is used to register a Pseudonym at a Relying Party in combination with a PID or attestation being presented to the same Relying Party, then this Relying Party SHALL be able to verify that the same User performed both actions.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-014" markdown>
<div class="eudi-hlr__id">AS-WP-11-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_13
{: .eudi-hlr__meta }

The Relying Party SHALL be able to validate that the pseudonym presented to them belongs to the User presenting it.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-015" markdown>
<div class="eudi-hlr__id">AS-WP-11-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_14
{: .eudi-hlr__meta }

A Wallet Unit SHALL store the information necessary for authenticating with a Pseudonym in either a WSCA/WSCD or in a keystore.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-016" markdown>
<div class="eudi-hlr__id">AS-WP-11-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_15
{: .eudi-hlr__meta }

A Relying Party SHALL NOT be able to derive the User's true identity, or any data identifying the User, from the Pseudonym value received by the Relying Party.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-017" markdown>
<div class="eudi-hlr__id">AS-WP-11-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_16
{: .eudi-hlr__meta }

A Wallet Unit SHALL NOT reveal the same Pseudonym to different Relying Parties, unless the User explicitly chooses otherwise.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-018" markdown>
<div class="eudi-hlr__id">AS-WP-11-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_17
{: .eudi-hlr__meta }

The Wallet Provider SHALL use method(s) and/or protocol(s) to implement pseudonyms which make it impossible to correlate Pseudonyms based on their values or on metadata sent by the Wallet Unit to Relying Parties during registration and authentication.

*Note: This implies that colluding Relying Parties will not be able to conclude that different Pseudonyms belong to the same User.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-019" markdown>
<div class="eudi-hlr__id">AS-WP-11-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_18
{: .eudi-hlr__meta }

The Wallet Unit SHALL ensure that Pseudonyms contain sufficient entropy to make the chance of colliding Pseudonyms (meaning two Users having the same Pseudonym value for the same Relying Party) negligible.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-020" markdown>
<div class="eudi-hlr__id">AS-WP-11-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_19
{: .eudi-hlr__meta }

A Wallet Unit SHALL NOT share the User's optionally assigned Pseudonym aliases with any Relying Party.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-021" markdown>
<div class="eudi-hlr__id">AS-WP-11-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_20
{: .eudi-hlr__meta }

The Wallet Unit SHALL verify the identity of a Relying Party when a User registers a Pseudonym or authenticates with a Pseudonym. If the profile or extension of [W3C WebAuthn] meant in PA_21 does not enable the Wallet Unit to do this, the Wallet Unit SHALL trust the WebAuthn Client (i.e., the browser) to verify the Relying Party identity.

*Note: [W3C WebAuthn] currently does not offer a way for an Authenticator (i.e., the Wallet Unit) to authenticate a Relying Party. Instead, the Client (i.e., the browser) will authenticate the Relying Party, using TLS. The notion of trust is that the Wallet Unit receives the Relying Party identity from the browser and uses it without further verifications.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-022" markdown>
<div class="eudi-hlr__id">AS-WP-11-022<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_21
{: .eudi-hlr__meta }

The Commission SHALL create or reference a technical specification containing a profile or extension of the [W3C WebAuthn] specification compliant with the HLRs specified in this Topic. This specification SHALL contain all details necessary for Wallet Units and Relying Parties to generate, register, and use Pseudonyms.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-023" markdown>
<div class="eudi-hlr__id">AS-WP-11-023<span class="kw-may">MAY</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_22
{: .eudi-hlr__meta }

Wallet Providers MAY ensure that their Wallet Solution supports the HLRs defined for this topic by letting their Wallet Units perform the role of a WebAuthn authenticator following the [W3C WebAuthn] specification and the technical specification referenced in referenced in PA_21.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-024" markdown>
<div class="eudi-hlr__id">AS-WP-11-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_23
{: .eudi-hlr__meta }

A protocol enabling scope rate-limited pseudonyms SHALL rely solely on algorithms included in the [ECCG Agreed Cryptographic Mechanisms v2.0].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-025" markdown>
<div class="eudi-hlr__id">AS-WP-11-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_24
{: .eudi-hlr__meta }

A protocol enabling scope rate-limited pseudonyms SHALL enable a Wallet Unit to allow a User to generate a scope rate-limited pseudonym, register this by a Relying Party, and prove that this is within the rate and scope restrictions determined by the Relying Party.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-026" markdown>
<div class="eudi-hlr__id">AS-WP-11-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_25
{: .eudi-hlr__meta }

A protocol enabling scope rate-limited pseudonyms SHALL allow a Relying Party, when a User presents a scope rate-limited pseudonym, to verify that the rate is not exceeded for this User.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-027" markdown>
<div class="eudi-hlr__id">AS-WP-11-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_26
{: .eudi-hlr__meta }

A protocol enabling scope rate-limited pseudonyms SHALL allow a Relying Party to choose the scope and rate when requesting a scope rate-limited pseudonym from a User.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-028" markdown>
<div class="eudi-hlr__id">AS-WP-11-028<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_27
{: .eudi-hlr__meta }

A protocol enabling scope rate-limited pseudonyms SHALL NOT allow any entity or collusion of entities not including the User, to link scope rate-limited pseudonyms of the same User when used across several different Relying Parties. This SHALL hold even if the scope and rate are identical across the different Relying Parties and both for registration and authentication of the scope rate-limited pseudonym

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-029" markdown>
<div class="eudi-hlr__id">AS-WP-11-029<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_28
{: .eudi-hlr__meta }

A protocol enabling scope rate-limited pseudonyms SHALL ensure that if the rate is larger than 1, a User's different pseudonyms SHALL be unlinkable for the same scope. This SHALL hold against any entity or collusion of entities, not including the User. Further, such protocol SHALL ensure that during registration or authentication with such a pseudonym, it SHALL NOT be possible for the Relying Party to deduce any information about how many pseudonyms the User has already registered (except that it does not exceed the predetermined rate).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-030" markdown>
<div class="eudi-hlr__id">AS-WP-11-030<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_29
{: .eudi-hlr__meta }

A protocol enabling scope rate-limited pseudonyms SHALL ensure that no entity or collusion of entities, not including a User, is able to authenticate or register with a scope rate-limited pseudonym of this User.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-031" markdown>
<div class="eudi-hlr__id">AS-WP-11-031<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_30
{: .eudi-hlr__meta }

A Wallet Unit SHALL store cryptographic material necessary for authenticating as a scope rate-limited pseudonyms in either a WSCA/WSCD or in a keystore.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-11-032" markdown>
<div class="eudi-hlr__id">AS-WP-11-032<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PA_31
{: .eudi-hlr__meta }

A User's scope rate limited pseudonyms for a particular scope and rate SHALL be persistent over time even if they start using another Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-001" markdown>
<div class="eudi-hlr__id">AS-WP-16-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_01
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that each User has the possibility to receive a qualified certificate for Qualified Electronic Signatures, bound to a QSCD, that is either local, external, or remotely managed in relation to the Wallet Instance.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-002" markdown>
<div class="eudi-hlr__id">AS-WP-16-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_02
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that each User who is a natural person has, at least for non-professional purposes, free-of-charge access to a Signature Creation Application which allows the creation of free-of-charge Qualified Electronic Signatures using the certificates referred to in QES_01. Wallet Providers SHALL ensure that: - The Signature Creation Application SHALL, as a minimum, be capable of signing or sealing User-provided data and Relying Party-provided data. - The Signature Creation Application SHALL be implemented as part of a Wallet Solution or external to it (by providers of trust services or by Relying Parties). - The Signature Creation Application SHALL be able to generate signatures or seals in formats compliant with at least the mandatory formats referred to in QES_08.

*Note: a) Signature Creation Application (SCA): see definition in [ETSI TS 119 432]. 2) If the SCA is external to the Wallet Solution, it may be for example a separate mobile application, or be hosted remotely, for instance by the QTSP or by a Relying Party.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-003" markdown>
<div class="eudi-hlr__id">AS-WP-16-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_03
{: .eudi-hlr__meta }

For the use of the qualified certificate referred to in QES_01, Wallet Providers SHALL ensure that a Wallet Unit implements secure authentication of the User, as well as signature or seal invocation capabilities, as a part of a local, external or remote QSCD.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-004" markdown>
<div class="eudi-hlr__id">AS-WP-16-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_04
{: .eudi-hlr__meta }

Wallet Providers SHALL enable their Wallet Units to interface with QSCDs using protocols and interfaces necessary for the implementation of secure User authentication and signature or seal functionality.

*Note: In a Relying Party-centric flow, the remote QTSP will likely be selected by the Relying Party, which implies the QSCD is managed by the remote QTSP. In a Wallet Unit-driven flow, the User should be able to choose the QSCD.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-005" markdown>
<div class="eudi-hlr__id">AS-WP-16-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_05
{: .eudi-hlr__meta }

Wallet Providers SHALL enable their Wallet Units to be used for User enrolment to a remote QES Provider (i.e., a QTSP offering remote QES), except where the Wallet Unit interfaces with local or external QSCDs.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-006" markdown>
<div class="eudi-hlr__id">AS-WP-16-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_06
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that their Wallet Solution supports at least one of the following options for remote QES signature creation: - remote QES creation through secure authentication to a QTSP signature web portal, - remote QES creation channelled by the Wallet Unit, - remote QES creation channelled by a Relying Party.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-007" markdown>
<div class="eudi-hlr__id">AS-WP-16-007</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_07
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-008" markdown>
<div class="eudi-hlr__id">AS-WP-16-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_08
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that their Wallet Units are able to create signatures or seals in accordance with the mandatory PAdES format as specified in [ETSI EN 319 142-1] V1.2.1 (2024-01). In addition, Wallet Providers SHOULD ensure that their Wallet Units are able to create signatures or seals in accordance with the following formats: - XAdES as specified in [ETSI EN 319 132-1] V1.3.1 (2024-07), - JAdES as specified in [ETSI TS 119 182-1] V1.2.1 (2024-07), - CAdES as specified in [ETSI EN 319 122-1] V1.3.1 (2023-06), and - ASiC as specified in [ETSI EN 319 162-1] V1.1.1 (2016-04) and [ETSI EN 319 162-2] V1.1.1 (2016-04).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-009" markdown>
<div class="eudi-hlr__id">AS-WP-16-009</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_09
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-010" markdown>
<div class="eudi-hlr__id">AS-WP-16-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_10
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit and is used to generate signatures or seals of the representation of the document or data to be signed or sealed, the Wallet Unit presents the representation of the document or data to be signed or sealed to the User.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-011" markdown>
<div class="eudi-hlr__id">AS-WP-16-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_11
{: .eudi-hlr__meta }

Where the Signature Creation Application is implemented as part of the Wallet Unit, a Wallet Unit SHALL compute the hash or digest of the document or data to be signed through its Signature Create Application component.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-012" markdown>
<div class="eudi-hlr__id">AS-WP-16-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_12
{: .eudi-hlr__meta }

A Wallet Unit SHALL be able to create a signature over a document or data to be signed, either by using a local QSCD or by interfacing with a remote QES Provider.

*Note: a local signing application is on-device. It may either be embedded in the Wallet Unit or be an external application.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-013" markdown>
<div class="eudi-hlr__id">AS-WP-16-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_13
{: .eudi-hlr__meta }

A Wallet Unit SHALL provide a log of transactions related to qualified electronic signatures or seals generated by or through the Wallet Unit, allowing the User to view the history of previously signed data or documents, according to requirement DASH_04 in [Topic 19][topic-19].

*Note: If the signature is generated by a remote Signature Creation Application, the Wallet is at minimum used to authenticate the User to the remote QTSP and to obtain the User's consent for the usage of the private signing key. The logs then record information about these processes.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-014" markdown>
<div class="eudi-hlr__id">AS-WP-16-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_14
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable the User to explicitly authorise the creation of a qualified electronic signature or seal through their Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-015" markdown>
<div class="eudi-hlr__id">AS-WP-16-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_15
{: .eudi-hlr__meta }

In remote signature creation scenarios, a Wallet Unit SHALL verify that the qualified electronic signature or seal creation device is part of a qualified service, which is carried out by a qualified trust service provider.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-016" markdown>
<div class="eudi-hlr__id">AS-WP-16-016<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_16
{: .eudi-hlr__meta }

A Wallet Unit SHOULD support multiple-signing scenarios, where multiple signatories are required to sign the same document or data.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-017" markdown>
<div class="eudi-hlr__id">AS-WP-16-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_17
{: .eudi-hlr__meta }

A Wallet Unit SHALL provide a signature creation confirmation upon the creation of a qualified electronic signature, informing the User about the outcome of the signature creation process.

*Note: See also QES_17a.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-018" markdown>
<div class="eudi-hlr__id">AS-WP-16-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_17a
{: .eudi-hlr__meta }

If the Signature Creation Application is external to the Wallet Unit, after the User authorises the usage of the private signing key, the Signature Creation Application SHALL return the outcome of the signature creation process to the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-019" markdown>
<div class="eudi-hlr__id">AS-WP-16-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_18
{: .eudi-hlr__meta }

Wallet Providers SHALL configure at least one default qualified signing service in the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-020" markdown>
<div class="eudi-hlr__id">AS-WP-16-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_19
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that, where the Signature Creation Application is implemented as part of the Wallet Unit, a Wallet Unit supports [ETSI TS 119 101] when using signing keys managed by the QSCD, whether locally, externally, or remotely in relation to the Wallet Instance.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-021" markdown>
<div class="eudi-hlr__id">AS-WP-16-021</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_20
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-022" markdown>
<div class="eudi-hlr__id">AS-WP-16-022</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_21
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-023" markdown>
<div class="eudi-hlr__id">AS-WP-16-023</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_22
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-024" markdown>
<div class="eudi-hlr__id">AS-WP-16-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_23
{: .eudi-hlr__meta }

QTSPs providing the remote QES part of a Wallet Solution SHALL support: 1. [ETSI TS 119 431-1] , 2. [ETSI TS 119 431-2] , 3. [ETSI TS 119 432]. Wallet Providers and QTSPs providing the remote QES part of a Wallet Solution SHALL comply with Sole Control Assurance Level (SCAL) 2 as defined in [CEN EN 419 241-1] .

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-025" markdown>
<div class="eudi-hlr__id">AS-WP-16-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_24
{: .eudi-hlr__meta }

QTSPs providing the Signature Creation Application as part of the remote QES part of a Wallet Solution SHALL support [ETSI TS 119 101].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-026" markdown>
<div class="eudi-hlr__id">AS-WP-16-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_24a
{: .eudi-hlr__meta }

Relying Parties providing the Signature Creation Application in a Relying Party-centric flow SHALL support [ETSI TS 119 101].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-027" markdown>
<div class="eudi-hlr__id">AS-WP-16-027</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_25
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-16-028" markdown>
<div class="eudi-hlr__id">AS-WP-16-028</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QES_26
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-18-001" markdown>
<div class="eudi-hlr__id">AS-WP-18-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACP_01
{: .eudi-hlr__meta }

A Cryptographic Binding of Attestations scheme SHALL enable a WSCA/WSCD or keystore to prove that it manages two or more private keys, paired with two or more public keys provided to it by the Wallet Unit.

*Note: a)These public keys may be included in WIAs and KAs, PIDs, attestations, or pseudonyms. b) The proof may be transitive, so a proof that two keys are stored/managed in the same WSCA/WSCD or keystore may be done by proving these keys relate to each other via a third key (also stored in the WSCA/WSCD or keystore).*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-18-002" markdown>
<div class="eudi-hlr__id">AS-WP-18-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACP_04
{: .eudi-hlr__meta }

A Cryptographic Binding of Attestations scheme SHALL be compatible with the requirements for attestation issuance in this document, in particular [Topic 10][topic-10], as well as with requirements for both remote and proximity presentation flows in this document, in particular [Topic 1][topic-1] and [Topic 24][topic-24].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-18-003" markdown>
<div class="eudi-hlr__id">AS-WP-18-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACP_05
{: .eudi-hlr__meta }

A Cryptographic Binding of Attestations scheme SHALL enable an Attestation Provider, during the issuance of an attestation, to request and obtain proof that the private key for the new attestation is managed by the same WSCA/WSCD or keystore as the private key of a PID or another attestation already existing on the Wallet Unit.

*Note: ACP_05 and ACP_06 may require an addition to the common OpenID4VCI protocol referenced in requirement ISSU_01, or an extension or profile thereof.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-001" markdown>
<div class="eudi-hlr__id">AS-WP-19-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL provide a user-friendly dashboard functionality to its User.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-002" markdown>
<div class="eudi-hlr__id">AS-WP-19-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_02
{: .eudi-hlr__meta }

The Wallet Unit SHALL log all transactions executed through the Wallet Unit, including any transactions that were not completed successfully. This log SHALL include all types of transaction executed through the Wallet Unit: a) PID or attestation issuance and re-issuance transactions, b) PID or attestation presentation transactions, c) Wallet-to-Wallet transactions (see [Topic 30][topic-30]), d) pseudonym registration or presentation transactions, e) signature or seal creation transactions (see [Topic 16][topic-16]), f) data deletion requests sent to a Relying Party (see [Topic 48][topic-48]), g) reports sent to a Data Protection Authority (see [Topic 50][topic-50]), h) PID or attestation deletions by the User.

*Note: For the data to be logged for a data deletion request to a Relying Party or a report sent to a DPA, see Topic 48 and Topic 50, respectively. For other types of transaction, the data to be logged is specified in the requirements in this Topic.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-003" markdown>
<div class="eudi-hlr__id">AS-WP-19-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_02a
{: .eudi-hlr__meta }

The Wallet Unit SHALL retain transactions in the log at least for the minimum retention period specified in applicable legislation. If the Wallet Unit must delete transactions from the log, for instance because of size limitations, the Wallet Unit SHALL notify the User via the dashboard before doing so, indicating the potential consequences for the User's data protection rights, and SHALL instruct the User how to export the transactions that are about to be deleted. See DASH_07.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-004" markdown>
<div class="eudi-hlr__id">AS-WP-19-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_02b
{: .eudi-hlr__meta }

The dashboard SHALL include a functionality to display to the User an overview of all transactions in the log.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-005" markdown>
<div class="eudi-hlr__id">AS-WP-19-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_02c
{: .eudi-hlr__meta }

The transaction log meant in DASH_02 SHALL comply with all relevant requirement in [Technical Specification 10](../../technical-specifications/ts10-data-portability-and-download-(export).md), including measures to ensure and/or verify its confidentiality, integrity, and authenticity.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-006" markdown>
<div class="eudi-hlr__id">AS-WP-19-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_03
{: .eudi-hlr__meta }

For a PID or attestation presentation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the trade name, unique identifier, and Service identifier of the corresponding Relying Party, and the Member State in which that Relying Party is established, c) the trade name, contact details (if available), unique identifier, and Service identifier of the intermediary, if an intermediary is involved in the transaction, d) the attestation type(s) and the identifier(s) of the attribute(s) that were requested, as well as those that were presented, e) in the case of non-completed transactions, the reason for such non-completion, f) the URL of the online service of the Relying Party's Registrar. g) the web form URL (if available), e-mail address (if available), and telephone number (if available) provided by the Relying Party for sending data deletion requests, see requirement RPRC_11 in [Topic 44][topic-44], h) the name and country of the Data Protection Authority supervising the Relying Party, as well as the web form URL (if available), e-mail address (if available), and telephone number (if available) provided by this DPA for reporting suspicious attribute presentation requests. i) information on the intended use and the URL to the applicable privacy policy.

*Note: a) If an intermediary is involved in the transaction, the Wallet Unit obtains the information under point b) from the registration certificate in the presentation request, and the information under point c) from the access certificate. In case no intermediary is involved, the Wallet Unit obtains the information under point b) from either the registration certificate or the access certificate, because it is identical in both certificates. b) The information in points g) and h) can be retrieved from the registration certificate. At least one of the options (URL, e-mail address, or telephone number) will be present. See RPRC_11 and RPRC_12.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-007" markdown>
<div class="eudi-hlr__id">AS-WP-19-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_03a
{: .eudi-hlr__meta }

For a PID or attestation presentation transaction or a Wallet-to-Wallet transaction executed through the Wallet Unit, the log SHALL NOT contain the value of any attributes presented to the Relying Party or the Verifier Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-008" markdown>
<div class="eudi-hlr__id">AS-WP-19-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_03b
{: .eudi-hlr__meta }

For a Wallet-to-Wallet transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the role of the Wallet Unit (Holder Wallet Unit or Verifier Wallet Unit), c) the attestation type(s) and the identifier(s) of the attribute(s) that were requested, as well as those that were presented, d) in the case of non-completed transactions, the reason for such non-completion.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-009" markdown>
<div class="eudi-hlr__id">AS-WP-19-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_03c
{: .eudi-hlr__meta }

For a pseudonym registration or presentation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) identifying information about the Relying Party, if known to the Wallet Unit, c) whether it is a pseudonym registration or pseudonym presentation transaction, d) in the case of non-completed transactions, the reason for such non-completion.

*Note: Regarding point b), see PA_20 in [Topic 11][topic-11].*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-010" markdown>
<div class="eudi-hlr__id">AS-WP-19-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_03d
{: .eudi-hlr__meta }

If a presentation request contains transactional data, the Wallet Unit SHALL log the value of this transactional data only to the extent explicitly required by the applicable Technical Specification associated with the requested SUA attestation, and in accordance with data minimisation principles. If the applicable Technical Specification does not explicitly specify that transactional data shall be logged, the Wallet Unit SHALL NOT log the value of any transactional data.

*Note: a) For the concepts of transactional data and SUA attestations and their related Technical Specifications, see [Topic 20][topic-20]. b) For example, for PSD2 Strong Customer Authentication transactions, the scope of transactional data to be included in the transaction log is defined in [Technical Specification 12](../../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) and includes the payment transaction identifier and merchant name.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-011" markdown>
<div class="eudi-hlr__id">AS-WP-19-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_04
{: .eudi-hlr__meta }

For a signature or seal creation transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the document or data signed or sealed (if available to the Wallet Unit), c) in the case of non-completed transactions, the reason for such non-completion.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-012" markdown>
<div class="eudi-hlr__id">AS-WP-19-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_05
{: .eudi-hlr__meta }

For a PID or attestation issuance or re-issuance transaction executed through the Wallet Unit, the log SHALL contain at least: a) the date and time of the transaction, b) the trade name, contact details (if available), unique identifier, and Service identifier of the corresponding PID Provider or Attestation Provider, c) the attestation type requested, as well as the attestation type issued, d) the number of attestations requested and issued (i.e., the size of the batch in case of batch issuance), e) in the case of non-completed transactions, the reason for such non-completion. f) for a re-issuance transaction, whether it was triggered by the User or by the Wallet Unit without involvement of the User, g) the URL of the associated Registrar's online service.

*Note: a) The Wallet Unit obtains the information under point b) from either the registration certificate or the access certificate, because it is identical in both certificates. b) Regarding point g): this URL can be retrieved from the access certificate.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-013" markdown>
<div class="eudi-hlr__id">AS-WP-19-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_05a
{: .eudi-hlr__meta }

For the deletion of a PID or attestation by the User, the log SHALL contain at least: a) the date and time of the deletion event, b) the attestation type of the deleted PID or attestation. c) The name and unique identifier of the corresponding PID Provider or Attestation Provider.

*Note: This requirement is not about deletion of transactions from the log, as per DASH_06a.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-014" markdown>
<div class="eudi-hlr__id">AS-WP-19-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_06
{: .eudi-hlr__meta }

The Wallet Provider SHALL ensure the confidentiality, integrity, and authenticity of all transactions included in the log.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-015" markdown>
<div class="eudi-hlr__id">AS-WP-19-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_06a
{: .eudi-hlr__meta }

Via the dashboard, the Wallet Unit SHALL enable the User to delete any transaction in the log. Before deleting any transactions, the Wallet Unit SHALL indicate to the User the potential consequences for the User's data protection rights.

*Note: This requirement applies even in case the minimum retention period specified in applicable legislation (see DASH_02a) is not yet over.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-016" markdown>
<div class="eudi-hlr__id">AS-WP-19-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_06b
{: .eudi-hlr__meta }

The Wallet Unit SHALL ensure that no entity other than the User can delete transactions from the log, except possibly for the reason mentioned in DASH_02a.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-017" markdown>
<div class="eudi-hlr__id">AS-WP-19-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_07
{: .eudi-hlr__meta }

The dashboard SHALL allow the User to export the details of one or more transactions in the log to a file, using the common format specified according to DASH_02c, while ensuring their confidentiality, authenticity and integrity. The file SHALL be stored in an external storage or remote storage location of the User's choice, from among the storage options supported by the Wallet Unit and SHALL use the common format and security measures specified according to DASH_02c.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-018" markdown>
<div class="eudi-hlr__id">AS-WP-19-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_08
{: .eudi-hlr__meta }

For a natural-person User, a Wallet Instance SHALL provide a User interface.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-019" markdown>
<div class="eudi-hlr__id">AS-WP-19-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_09
{: .eudi-hlr__meta }

The User interface referred to in DASH_08 SHALL provide a view with - the EU Digital Identity Wallet Trust Mark, - accompanying general information on the certification of Wallet Solutions, - links to the certification status information as defined in the [Technical Specification 1](../../technical-specifications/ts1-eudi-wallet-trust-mark.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-020" markdown>
<div class="eudi-hlr__id">AS-WP-19-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_09a
{: .eudi-hlr__meta }

Positioning of the view meant in DASH_09 in the Wallet UI navigation SHALL follow design guidelines provided by the European Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-021" markdown>
<div class="eudi-hlr__id">AS-WP-19-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_09b
{: .eudi-hlr__meta }

Regarding the EUDI Wallet Trust Mark, Wallet Providers and Wallet Units SHALL comply with all relevant requirements in [Technical Specification 1](../../technical-specifications/ts1-eudi-wallet-trust-mark.md), as well as with the relevant requirements in Article 14a of [CIR 2024/2979] and the Annexes mentioned therein.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-022" markdown>
<div class="eudi-hlr__id">AS-WP-19-022</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_10
{: .eudi-hlr__meta }

Empty

*Note: See requirement WIAM_12a in [Topic 40][topic-40].*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-023" markdown>
<div class="eudi-hlr__id">AS-WP-19-023</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_11
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-19-024" markdown>
<div class="eudi-hlr__id">AS-WP-19-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DASH_12
{: .eudi-hlr__meta }

The User interface referred to in DASH_08 SHALL enable the User, for each presentation transaction in the log, to easily request the Relying Party to delete any or all attributes presented to it in that transaction, or to send a report about that particular transaction to a DPA.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-001" markdown>
<div class="eudi-hlr__id">AS-WP-20-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL be able to process the transactional data included in a presentation request for the SUA attestation(s) specified in [Technical Specification 12](../../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md), according to all requirements in that Technical Specification.

*Note: Technical Specification 12 specifies a SUA attestation intended for performing SCA as specified in the PSD2 Regulation. The related Rulebook is called "SCA Attestation Rulebook".*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-002" markdown>
<div class="eudi-hlr__id">AS-WP-20-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_02
{: .eudi-hlr__meta }

Scheme Providers MAY specify Attestation Rulebooks (see [Topic 12][topic-12]) and associated technical specifications for SUA attestations other that the ones specified in [Technical Specification 12](../../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md)). The Attestation Rulebook or the technical specification of such of a SUA attestation SHALL specify the syntax and semantics of the transactional data associated with that attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-003" markdown>
<div class="eudi-hlr__id">AS-WP-20-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_02a
{: .eudi-hlr__meta }

The Technical Specification associated with a given SUA attestation SHALL specify all necessary requirements for Wallet Units to process transactional data intended for this SUA attestation, at least regarding a) rendering and displaying the data to the User when obtaining approval for presentation, b) processing (e.g., hashing) the data for inclusion in the device binding signature, and c) the scope of information to be logged about a SUA attestation presentation transaction by a Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-004" markdown>
<div class="eudi-hlr__id">AS-WP-20-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_03
{: .eudi-hlr__meta }

The Attestation Provider of a SUA attestation other than the one(s) specified in [Technical Specification 12](../../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) SHALL NOT issue such an attestation to a Wallet Unit that does not comply with all relevant requirements in the SUA Attestation Rulebook and the technical specification for that attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-005" markdown>
<div class="eudi-hlr__id">AS-WP-20-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_04
{: .eudi-hlr__meta }

In the response to a presentation request for a SUA attestation that includes transactional data, a Wallet Unit SHALL include (a representation of) that data, according to requirements included in the associated technical specification or Attestation Rulebook or in information provided to the Wallet Unit in the presentation request. In the latter case, the rules to interpret such information SHALL be included in the associated technical specification or Attestation Rulebook.

*Note: This requirement, as well as SUA_05, only applies if the requested SUA attestation is present on the Wallet Unit and if the User consents to signing the transactional data and presenting the requested attributes.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-006" markdown>
<div class="eudi-hlr__id">AS-WP-20-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_05
{: .eudi-hlr__meta }

The Wallet Unit SHALL include (a representation of) the transactional data received in a presentation request in the signature creation process used for device binding, using the private key of the requested SUA attestation and the mechanisms specified for key binding in [SD-JWT VC] or mdoc authentication in [ISO/IEC 18013-5], as applicable. For this process, the Wallet Unit SHALL comply with the applicable requirements in the technical specification and the Attestation Rulebook for the requested SUA attestation, see SUA_01 or SUA_02.

*Note: a) The resulting signature value constitutes a proof of transaction. This signature value, possibly in combination with other protocols items, fulfils the requirements for the authentication code required in [PSD2]. b) See also requirement OIA_02 in [Topic 1][topic-1].*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-007" markdown>
<div class="eudi-hlr__id">AS-WP-20-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_06
{: .eudi-hlr__meta }

The Wallet Unit SHALL render or adapt the dialogue message(s) displayed to the User (like font size and colour, background colour, text position, labels in the buttons to 'approve' or 'reject' a transaction), according to requirements in [Technical Specification 12](../../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-20-008" markdown>
<div class="eudi-hlr__id">AS-WP-20-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: SUA_07
{: .eudi-hlr__meta }

Upon receiving a presentation request with transactional data, the Wallet Unit SHALL validate if the transactional data is intended for the given attestation and that the transactional data conforms to the related technical specification and/or Attestation Rulebook. In case the validation result is positive, the Wallet Unit SHALL process the transactional data in compliance with the related technical specification.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-001" markdown>
<div class="eudi-hlr__id">AS-WP-30-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL be able to act as a Holder Wallet Unit, in accordance with all requirements in this Topic.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-002" markdown>
<div class="eudi-hlr__id">AS-WP-30-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_02
{: .eudi-hlr__meta }

When acting as a Holder Wallet Unit, if there is a contradiction between a requirement for Holder Wallet Units in this Topic and any requirement for Wallet Units in other Topics in this document, the requirement in this Topic SHALL take precedence. However, when acting as a Holder Wallet Unit, a Wallet Unit SHALL comply with all requirements for Wallet Units in other Topics in this document that do not contradict any requirement in this Topic.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-003" markdown>
<div class="eudi-hlr__id">AS-WP-30-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_03
{: .eudi-hlr__meta }

A Wallet Unit SHALL be able to act as a Verifier Wallet Unit, in accordance with all requirements in this Topic.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-004" markdown>
<div class="eudi-hlr__id">AS-WP-30-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_04
{: .eudi-hlr__meta }

When acting as a Verifier Wallet Unit, a Wallet Unit SHALL NOT comply with any requirement for Wallet Units in other Topics in this document.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-005" markdown>
<div class="eudi-hlr__id">AS-WP-30-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_05
{: .eudi-hlr__meta }

A Wallet Unit SHALL act as a Holder Wallet Unit only if the User selects a 'Holder Wallet Unit mode'. If the User closes the Wallet Unit, or after a period of non-activity, the Wallet Unit SHALL return to 'normal' mode.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-006" markdown>
<div class="eudi-hlr__id">AS-WP-30-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_06
{: .eudi-hlr__meta }

When entering the Holder Wallet Unit mode, a Wallet Unit SHALL inform its User that this mode should only be used for interactions with natural persons using a Wallet Unit, and that the User should not proceed if they are in fact interacting with a Relying Party.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-007" markdown>
<div class="eudi-hlr__id">AS-WP-30-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_07
{: .eudi-hlr__meta }

A Wallet Unit SHALL act as a Verifier Wallet Unit only if the User selects a 'Verifier Wallet Unit mode'. If the User closes the Wallet Unit, or after a period of non-activity, the Wallet Unit SHALL return to 'normal' mode.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-008" markdown>
<div class="eudi-hlr__id">AS-WP-30-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_09
{: .eudi-hlr__meta }

Holder Wallet Units SHALL comply with the requirements for mDLs and for mdocs in ISO/IEC 18013-5, unless specified differently in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-009" markdown>
<div class="eudi-hlr__id">AS-WP-30-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_10
{: .eudi-hlr__meta }

Verifier Wallet Units SHALL comply with the requirements for mDL readers and for mdoc readers in ISO/IEC 18013-5, unless specified differently in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-010" markdown>
<div class="eudi-hlr__id">AS-WP-30-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_11
{: .eudi-hlr__meta }

A Holder Wallet Unit SHOULD provide the Holder, through a user-friendly UI, with the option to inform the Verifier Wallet Unit about the attributes which the Verifier should include in the presentation request, by sending a presentation offer. If the Holder creates a presentation offer, the Holder Wallet Unit SHALL transfer it to the Verifier Wallet Unit as specified in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md).

*Note: TS9 specifies an extension of the device engagement structure specified in [ISO/IEC 18013-5].*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-011" markdown>
<div class="eudi-hlr__id">AS-WP-30-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_12
{: .eudi-hlr__meta }

A Holder Wallet Unit SHALL recommend the Holder to create a presentation offer, as this will increase the chance of success of the use case.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-012" markdown>
<div class="eudi-hlr__id">AS-WP-30-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_13
{: .eudi-hlr__meta }

A Verifier Wallet Unit SHALL provide the Verifier, through a user-friendly UI, with the possibility to select the attributes that will be included in the presentation request.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-013" markdown>
<div class="eudi-hlr__id">AS-WP-30-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_14
{: .eudi-hlr__meta }

For the purposes of W2W_13, if the Verifier Wallet Unit received a presentation offer, it SHALL present this offer to the Verifier, and enable the Verifier to include one or more of the attributes in the offer into the presentation request. However, the Verifier Wallet Unit SHALL NOT allow the Verifier to include any attribute not present in the offer.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-014" markdown>
<div class="eudi-hlr__id">AS-WP-30-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_15
{: .eudi-hlr__meta }

For the purposes of W2W_13, if the Verifier Wallet Unit did not receive a presentation offer, it SHALL present the Verifier with a list of attributes that can be included in the presentation request. The Verifier Wallet Unit MAY ask the Verifier some questions about the purpose of the use case to narrow down the list.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-015" markdown>
<div class="eudi-hlr__id">AS-WP-30-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_16
{: .eudi-hlr__meta }

A Verifier Wallet Unit SHALL authenticate the Verifier and SHALL obtain the Verifier's approval prior to sending a presentation request to a Holder Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-016" markdown>
<div class="eudi-hlr__id">AS-WP-30-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_17
{: .eudi-hlr__meta }

A Verifier Wallet Unit SHALL implement measures to limit the number of presentation requests it can send per unit of time, to prevent abuse of the Wallet-to-Wallet functionality by Relying Parties. The limitation strategy, for instance exponential backoff time between subsequent presentation requests or hard limits for the number of requests, SHALL be decided by the Wallet Provider, based on applicable requirements in [Technical Specification 9](../../technical-specifications/ts9-wallet-to-wallet-interactions.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-017" markdown>
<div class="eudi-hlr__id">AS-WP-30-017</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_18
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-018" markdown>
<div class="eudi-hlr__id">AS-WP-30-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_19
{: .eudi-hlr__meta }

When receiving a presentation response, a Verifier Wallet SHALL verify the received attestation according to requirements OIA_12 - OIA_15 in [Topic 1][topic-1].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-019" markdown>
<div class="eudi-hlr__id">AS-WP-30-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_20
{: .eudi-hlr__meta }

A Verifier Wallet Unit SHALL display all verified attributes to the Verifier.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-020" markdown>
<div class="eudi-hlr__id">AS-WP-30-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_21
{: .eudi-hlr__meta }

A Verifier Wallet Unit SHALL NOT persistently store any attestations or attributes received. A Verifier Wallet Unit SHOULD minimise the time the received presentation is stored in memory. A Verifier Wallet Unit SHALL comply with OIA_16 in [Topic 1][topic-1].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-021" markdown>
<div class="eudi-hlr__id">AS-WP-30-021<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_22
{: .eudi-hlr__meta }

Wallet Providers SHOULD take measures to prevent a User from taking screenshots while their Wallet Unit is acting as a Verifier Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-022" markdown>
<div class="eudi-hlr__id">AS-WP-30-022<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_23
{: .eudi-hlr__meta }

When sending a presentation request to a Holder Wallet Unit, a Verifier Wallet Unit SHALL include in that request a cryptographic proof that it is a genuine, non-revoked EUDI Wallet Unit operated by a recognised Wallet Provider, bound to the protocol session in which the presentation request is sent, if a common method to provide such a proof is established in a technical specification.

*Note: Such a specification is being developed within ETSI.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-023" markdown>
<div class="eudi-hlr__id">AS-WP-30-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_24
{: .eudi-hlr__meta }

Before presenting a received presentation request to the Holder, a Holder Wallet Unit SHALL authenticate the Verifier Wallet Unit by verifying the proof meant in W2W_23, if present.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-30-024" markdown>
<div class="eudi-hlr__id">AS-WP-30-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_25
{: .eudi-hlr__meta }

If the verification required by W2W_24 fails or cannot be performed, a Holder Wallet Unit SHALL notify the User. In addition, the Wallet Unit SHALL either not present the requested attributes to the Verifier Wallet Unit, or give the User the choice to present the requested attributes or not.

*Note: It is up to the Wallet Provider to make a choice for one of these two options.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-001" markdown>
<div class="eudi-hlr__id">AS-WP-31-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_02
{: .eudi-hlr__meta }

The common set of information to be notified about a PID Provider SHALL include at least: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. A business registration number from an official record, b. Identification data from that official record. 2. PID Provider trust anchors, i.e., public keys and name as per point 1) ii) above, supporting the authentication of PIDs issued by the PID Provider, 3. If applicable, trust anchors for PID revocation lists, i.e., public keys and name supporting the authentication of any Attestation Status Lists or Attestation Revocation Lists used to revoke PIDs issued by the PID Provider. 4. Trust anchors of Access Certificate Authorities for PID Providers, i.e., public keys and CA name, supporting the authentication of the PID Provider by Wallet Units at the service supply point(s) listed per point  5. below. 5. Service supply point(s), i.e., the URL(s) at which a Wallet Unit can start the process of requesting and obtaining a PID. 6. If applicable, the URL at which Relying Parties and other entities can retrieve the relevant Attestation Status Lists or Attestation Revocation Lists.

*Note: a) Regarding point 3 above, see section 6.3.2.4 of the ARF main document. b) Relating to point 4: PID Provider Access Certificate Authority trust anchors are notified separately from the Access Certificate Authority for Relying Parties (see Section G below), since PID Providers are -legally speaking- not Relying Parties. b) For the concept of an Access Certificate Authority, see also [Topic 27][topic-27]] and [Section 6.3.2 of the ARF main document][632-pid-provider-or-attestation-provider-registration-and-notification]. c) Regarding point 6: This could be the domain name only, as the full URL containing the ASL or ARL relevant for an individual PID will anyway be included in that PID.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-002" markdown>
<div class="eudi-hlr__id">AS-WP-31-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPNot_01
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-003" markdown>
<div class="eudi-hlr__id">AS-WP-31-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPNot_02
{: .eudi-hlr__meta }

The common set of information to be notified about a Wallet Provider SHALL include: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. Business registration number from an official record, and b. Identification data from the official record. 2. Wallet Provider trust anchors, i.e., public keys and name as per point 1. b. above, supporting the authentication of Key Attestations and Wallet Instance Attestations issued by the Wallet Provider. 3. Trust anchors for WIA and KA revocation lists, i.e., public keys and name supporting the authentication of any Attestation Status Lists used to revoke WIAs and KAs issued by the Wallet Provider. 4. Name and reference number of the certified Wallet Solution(s) provided by the Wallet Provider. 5. The URL at which PID Providers, Attestation Providers, and other entities can retrieve the relevant Attestation Status Lists for WIAs and KAs. 

*Note: a) See [Topic 9][topic-9]] and [Topic 38][topic-38]] for the definition of the KA and WIA. b) A Wallet Provider does not need an access certificate to interact with Wallet Units. c) Regarding point 3, see section 6.3.2.4 of the ARF main document. d) Regarding point 5: This could be the domain name only, as the full URL containing the ASL relevant for an individual WIA or KA will anyway be included in that WIA or KA.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-004" markdown>
<div class="eudi-hlr__id">AS-WP-31-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPNot_03
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that all WIAs and KAs they issue can be authenticated using the trust anchors notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-005" markdown>
<div class="eudi-hlr__id">AS-WP-31-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPNot_03a
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that all Attestation Status Lists used to revoke their WIAs and KAs can be authenticated using the trust anchors for WIA and KA revocation lists notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-006" markdown>
<div class="eudi-hlr__id">AS-WP-31-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPNot_04
{: .eudi-hlr__meta }

PID Providers, Attestation Providers, and other relevant actors SHALL accept Wallet Provider trust anchors and the trust anchors for WIA and KA revocation lists because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled Wallet Provider LoTE, which is sealed by the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-007" markdown>
<div class="eudi-hlr__id">AS-WP-31-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPNot_05
{: .eudi-hlr__meta }

The format of a Wallet Provider LoTE SHALL comply with [ETSI TS 119 602], including Annex E.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-008" markdown>
<div class="eudi-hlr__id">AS-WP-31-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPNot_06
{: .eudi-hlr__meta }

If a Wallet Provider is cancelled (see requirement GenNot_05 above), that Wallet Provider SHALL immediately revoke all of its Wallet Instances and all associated WSCDs and keystores, in accordance with the requirements in [Topic 38][topic-38]. If a Wallet Provider is suspended, that Wallet Provider and the Member State SHALL agree on the necessary precautionary measures that need to be taken, which MAY include the immediate revocation of the Wallet Instances and WSCDs or keystores for all or some of its valid Wallet Units.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-010" markdown>
<div class="eudi-hlr__id">AS-WP-31-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PuBPNot_02
{: .eudi-hlr__meta }

The common set of information to be notified by Member States about PuB-EAA Providers SHALL include at least: 1. Identification data: i. MS/Country of establishment, ii. Name as registered in an official record, iii. Where applicable: a. Registration number as in official record, and b. Official record identification data. iv. Identification data of the Union or national law under which a. Either the PuB-EAA Provider is established as the responsible body for the Authentic Source based on which the electronic attestation of attributes is issued, or b. The PuB-EAA Provider is the body designated to act on behalf of the responsible body referred to in point 1. iv. a. v.The conformity assessment report issued by a conformity assessment body, confirming that the requirements set out in paragraphs 1, 2 and 6 of [Article 45f](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e3902-1-1) are met. 2. PuB-EAA Provider trust anchors, i.e., public keys and name as per point 1) ii) above, supporting the authentication of PuB-EAAs issued by the PuB-EAA Provider, 3. If applicable, trust anchors for PuB-EAA revocation lists, i.e., public keys and name supporting the authentication of any Attestation Status Lists or Attestation Revocation Lists used to revoke PuB-EAAs issued by the PuB-EAA Provider. 4. Service supply point(s), i.e., the URL(s) at which a Wallet Unit can start the process of requesting and obtaining a PuB-EAA from the PuB-EAA Provider. 5. If applicable, the URL at which Relying Parties and other entities can retrieve the relevant Attestation Status Lists or Attestation Revocation Lists.

*Note: c) Regarding point 3, see section 6.3.2.4 of the ARF main document. d) Regarding point 5: This could be the domain name only, as the full URL containing the ASL or ARL relevant for an individual PuB-EAA will anyway be included in that PuB-EAA.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-018" markdown>
<div class="eudi-hlr__id">AS-MS-31-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_02
{: .eudi-hlr__meta }

The common set of information to be notified about an Access Certificate Authority or a Provider of registration certificates SHALL include: 1. Identification data: i) Member State or country of establishment, ii) Name as registered in an official record, iii) Where applicable: - A business registration number from an official record, - Identification data from that official record. 2. Trust anchors of the Access Certificate Authority or Provider of registration certificates, i.e., public keys and name as per point 1) ii), supporting the authentication of access certificates and registration certificates by Wallet Units. 3.Trust anchors for access certificate or registration certificate revocation lists, i.e., public keys and name supporting the authentication of any lists used to revoke access certificates or registration certificates issued by the Access Certificate Authority or Provider of registration certificates. 4. If applicable, the URL at which Relying Parties and other entities can retrieve the relevant CRL.

*Note: Regarding point 4: This could be the domain name only, as the full URL containing the CRL relevant for an individual certificate will anyway be included in that certificate.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-011" markdown>
<div class="eudi-hlr__id">AS-WP-31-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_01
{: .eudi-hlr__meta }

The European Commission SHALL establish technical specifications for the system enabling the publication by the Commission of the information notified by the Member States regarding PID Providers, Wallet Providers, PuB-EAA Providers, Access Certificate Authorities, and Providers of registration certificates.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-012" markdown>
<div class="eudi-hlr__id">AS-WP-31-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_02
{: .eudi-hlr__meta }

The European Commission SHALL establish technical specifications for the set of information to be published about PID Providers, Wallet Providers, PuB-EAA Providers, Access Certificate Authorities and Providers of registration certificates, based on the information notified by the Member States.

*Note: The information to be published MAY be different from the information to be notified for each of these entities.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-013" markdown>
<div class="eudi-hlr__id">AS-WP-31-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_06
{: .eudi-hlr__meta }

The Commission SHALL publish in the OJEU the locations of the LoTEs for PID Providers, PuB-EAA Providers, Wallet Providers, Access Certificate Authorities, and Providers of registration certificates.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-014" markdown>
<div class="eudi-hlr__id">AS-WP-31-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_08
{: .eudi-hlr__meta }

As part of the specifications referred to in TLPub_01, the European Commission SHALL establish technical specifications for ensuring the availability and authenticity of the full history regarding the information notified about PID Providers, Wallet Providers, PuB-EAA Providers, Access Certificate Authorities, and Providers of registration certificates.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-001" markdown>
<div class="eudi-hlr__id">AS-WP-34-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL include and keep up-to-date a Migration Object, containing the following information: - The contents of the log for all transactions executed through the Wallet Unit, as listed in requirement DASH_02. - A list of PIDs and attestations (except Key Attestations and Wallet Instance Attestations) present in the Wallet Unit, according to the requirements in this Topic.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-002" markdown>
<div class="eudi-hlr__id">AS-WP-34-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_02
{: .eudi-hlr__meta }

The Migration Object SHALL comply with all requirements in [Technical Specification 10](../../technical-specifications/ts10-data-portability-and-download-(export).md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-003" markdown>
<div class="eudi-hlr__id">AS-WP-34-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_03
{: .eudi-hlr__meta }

For each PID or device-bound attestation that is issued to it, a Wallet Unit SHALL add to the Migration Object all data necessary to request issuance of that PID or attestation once again. This SHALL include at least the attestation type and the PID Provider or Attestation Provider that issued the PID or attestation, as well as their service supply points. However, the Migration Object SHALL NOT contain attribute identifiers or attribute values, and SHALL NOT contain any private keys of the PID or device-bound attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-004" markdown>
<div class="eudi-hlr__id">AS-WP-34-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_03a
{: .eudi-hlr__meta }

For each non-device-bound attestation that is issued to it, a Wallet Unit SHALL add to the Migration Object one of the following: either all data necessary to request issuance of that attestation once again, as listed in Mig_03, or all data necessary to transfer the attestation to a new device without involvement of the Attestation Provider, including attribute identifiers and attribute values. The Wallet Unit SHALL enable the User to indicate if they want to store attribute identifiers and values in the Migration Object.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-005" markdown>
<div class="eudi-hlr__id">AS-WP-34-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_03b
{: .eudi-hlr__meta }

If the User deletes a PID or attestation from their Wallet Unit, the Wallet Unit SHALL delete the corresponding entry from the Migration Object.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-006" markdown>
<div class="eudi-hlr__id">AS-WP-34-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_04
{: .eudi-hlr__meta }

The Wallet Unit SHALL store the Migration Object in an external storage or remote storage location of the User's choice, from among the storage options supported by the Wallet Unit, in such a way that the User can still retrieve the object from a new Wallet Unit in case the existing Wallet Unit becomes unavailable.

*Note: a) It is up to the Wallet Provider to decide which external storage options or remote storage locations the Wallet Unit supports for storing the Migration Object. b) The new Wallet Unit may be either an instance of the same Wallet Solution as the old one, or an instance of a different Wallet Solution.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-007" markdown>
<div class="eudi-hlr__id">AS-WP-34-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_05
{: .eudi-hlr__meta }

The Wallet Unit SHALL store the Migration Object in such a way that its confidentiality, integrity, and authenticity is protected and that it is protected against use by others than the User.

*Note: This could be done, for example, by using password-based cryptography to encrypt the object.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-008" markdown>
<div class="eudi-hlr__id">AS-WP-34-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_06
{: .eudi-hlr__meta }

Directly after installation of a new Wallet Instance, the Wallet Instance SHALL enable the User to import a Migration Object from an external storage or remote storage location indicated by the User, from among the storage options supported by the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-009" markdown>
<div class="eudi-hlr__id">AS-WP-34-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_07
{: .eudi-hlr__meta }

When importing a Migration Object, for each PID and device-bound attestation listed in the Migration Object, the Wallet Unit SHALL enable the User to select that PID or attestation. When a PID or device-bound attestation is selected, the Wallet Unit SHALL request the respective PID Provider or Attestation Provider to issue a new PID or attestation of the same type to the new Wallet Unit. If the User selects a PID, the Wallet Unit SHALL request issuance of the PID first, before any of the other selected attestations.

*Note: a) Since no refresh tokens (see ISSU_65) will be available on the new Wallet Unit, this is a new issuance process, which will include User authentication by the PID Provider or Attestation Provider. b) The rationale for the last requirement is to ensure that if other Attestation Providers want to use a PID to do User authentication, the PID is actually available.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-010" markdown>
<div class="eudi-hlr__id">AS-WP-34-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_07a
{: .eudi-hlr__meta }

When importing a Migration Object, for each non-device-bound attestation listed in the Migration Object, the Wallet Unit SHALL enable the User to select that attestation. When an attestation is selected, the Wallet Unit SHALL, depending on whether the Migration Object contains attribute identifiers and attribute values (see Mig_03a), either restore the technical attestation directly from the Object or request the respective Attestation Provider to issue a new attestation of the same type to the new Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-011" markdown>
<div class="eudi-hlr__id">AS-WP-34-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_07b
{: .eudi-hlr__meta }

When importing a Migration Object, the Wallet Unit SHALL ask the User whether they want to restore the log from the Migration Object. When the User agrees, the Wallet Unit SHALL restore the log, and SHALL append future transactions to this log according to the requirements in [Topic 19][topic-19].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-012" markdown>
<div class="eudi-hlr__id">AS-WP-34-012</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_08
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-013" markdown>
<div class="eudi-hlr__id">AS-WP-34-013</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_09
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-014" markdown>
<div class="eudi-hlr__id">AS-WP-34-014</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_10
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-015" markdown>
<div class="eudi-hlr__id">AS-WP-34-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_11
{: .eudi-hlr__meta }

The processes and interfaces used for issuance of a PID or attestation as part of a migration process SHALL be the same as those used for a 'normal' issuance process, as specified in [Topic 10][topic-10].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-016" markdown>
<div class="eudi-hlr__id">AS-WP-34-016</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_12
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-017" markdown>
<div class="eudi-hlr__id">AS-WP-34-017</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_13
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-018" markdown>
<div class="eudi-hlr__id">AS-WP-34-018</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_14
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-019" markdown>
<div class="eudi-hlr__id">AS-WP-34-019</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_15
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-34-020" markdown>
<div class="eudi-hlr__id">AS-WP-34-020</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Mig_16
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-38-001" markdown>
<div class="eudi-hlr__id">AS-WP-38-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_01
{: .eudi-hlr__meta }

To enable a PID Provider or an Attestation Provider to verify the authenticity and the revocation status of a Wallet Unit it is interacting with, a Wallet Provider SHALL issue one or more Key Attestations (KA) and Wallet Instance Attestations (WIA) to the Wallet Unit, as specified in [Topic 9][topic-9].

*Note: The first of these KAs and WIAs will be issued during the activation phase of a Wallet Unit. During the lifetime of the Wallet Unit, the Wallet Provider will re-issue KAs and WIAs as needed.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-38-002" markdown>
<div class="eudi-hlr__id">AS-WP-38-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_02
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-005" markdown>
<div class="eudi-hlr__id">EW-DM-38-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_07
{: .eudi-hlr__meta }

To revoke the Wallet Instance of a Wallet Unit, a Wallet Provider SHALL, in the status list(s) for Wallet Instances, set the `revoked` status at all index positions mentioned in the WIAs issued to that Wallet Instance.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-007" markdown>
<div class="eudi-hlr__id">EW-DM-38-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_09
{: .eudi-hlr__meta }

During the lifetime of a Wallet Unit, the Wallet Provider SHALL regularly verify that the security of the Wallet Unit is not breached or compromised. If the Wallet Provider detects a security breach or compromise, the Wallet Provider SHALL analyse its cause(s) and impact(s). If the breach or compromise affects the trustworthiness or reliability of the Wallet Unit, the Wallet Provider SHALL revoke the Wallet Unit by revoking the Wallet Instance according to WURevocation_07. The Wallet Provider SHALL do so at least in the following circumstances: - If the security of the Wallet Unit, or the security of the mobile device and OS on which the corresponding Wallet Instance is installed, or the security of the WSCA/WSCD it uses for managing critical cryptographic assets, is breached or compromised in a manner that affects its trustworthiness or reliability. - If the security of the Wallet Solution is breached or compromised in a manner that affects the trustworthiness or reliability of all corresponding Wallet Units. - If the security of the common authentication and data protection mechanisms used by the Wallet Unit is breached or compromised in a manner that affects their trustworthiness or reliability. - If the security of the electronic identification scheme under which the Wallet Unit is provided is breached or compromised in a manner that affects its trustworthiness or reliability.

*Note: The first bullet corresponds to a Critical or High Risk level security posture risk status according to the table in [Section 6.5.4.2 of the ARF main document][6542-wallet-unit-revocation], as analysed or detected for a Wallet Instance due to monitoring done according to WPSM_03.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-008" markdown>
<div class="eudi-hlr__id">EW-DM-38-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_09a
{: .eudi-hlr__meta }

If a breach or compromise detected per WURevocation_09 affects the trustworthiness or reliability of a (type of) WSCA/WSCD or keystore, the Wallet Provider SHALL revoke the corresponding (type of) WSCA/WSCD or keystore according to WURevocation_07a.

*Note: Per WURevocation_09, a compromise of a type of WSCA/WSCD always leads to the revocation of both that type of WSCA/WSCD and of all Wallet Instances using a WSCA/WSCD of that type.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-009" markdown>
<div class="eudi-hlr__id">EW-DM-38-009</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_09b
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-010" markdown>
<div class="eudi-hlr__id">EW-DM-38-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_09c
{: .eudi-hlr__meta }

If a Wallet Provider revokes a keystore of a Wallet Unit, it SHOULD also revoke the entire Wallet Unit by revoking the Wallet Instance. If the Wallet Provider decides to not revoke the Wallet Instance, it SHALL create a risk analysis showing that this does not lead to unacceptable risks to the User, PID Providers and Attestation Providers, Relying Parties, or the Wallet Provider itself.

*Note: If the Wallet Provider does not revoke the Wallet Instance, only the attestations bound to the revoked keystore will be impacted. Other functionalities of the Wallet Unit, including the presentation of a PID, will remain available to the User.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-011" markdown>
<div class="eudi-hlr__id">EW-DM-38-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_10
{: .eudi-hlr__meta }

A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of the User registered during the Wallet Unit activation process, see [Topic 40][topic-40]. To do so, the Wallet Provider SHALL revoke the Wallet Instance (see WURevocation_07). The Wallet Provider SHALL authenticate the User before accepting a request to revoke the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-012" markdown>
<div class="eudi-hlr__id">EW-DM-38-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_11
{: .eudi-hlr__meta }

A Wallet Provider SHALL revoke a Wallet Unit upon the explicit request of a PID Provider, in case the natural person using the Wallet Unit has died. To do so, the Wallet Provider SHALL revoke the Wallet Instance (see WURevocation_07). To identify the Wallet Unit that is to be revoked, the PID Provider SHALL use a Wallet Instance identifier provided by the Wallet Provider in the WIA during PID issuance.

*Note: Under [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md), the Wallet Instance identifier used for revocation is conveyed in the WIA (see WUA_08). See also the notes to WUA_08.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-013" markdown>
<div class="eudi-hlr__id">EW-DM-38-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_12
{: .eudi-hlr__meta }

Before revoking a Wallet Unit per WURevocation_11, the Wallet Provider SHALL verify that the party requesting revocation is indeed a valid PID Provider listed in the LoTE of PID Providers.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-014" markdown>
<div class="eudi-hlr__id">EW-DM-38-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_13
{: .eudi-hlr__meta }

Before requesting a Wallet Provider to revoke a Wallet Unit per WURevocation_11, the PID Provider SHALL ensure that the revocation does not harm the interests of any of the stakeholders. The PID Provider SHALL include a documented policy ensuring that this is the case in the policy meant in WURevocation_03.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-015" markdown>
<div class="eudi-hlr__id">EW-DM-38-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_14
{: .eudi-hlr__meta }

A Wallet Provider SHALL inform a User without delay, and within 24 hours at most, in case the Wallet Provider decided to revoke the User's Wallet Unit. The Wallet Provider SHALL also inform the User about the reason(s) for the revocation. This information SHALL be understandable for the general public. It SHALL include (a reference to) technical details about any security breach if applicable. The Wallet Provider SHALL inform the User about the function(s) of the Wallet Unit that remain available to the User, if any, and functions that will not work any more. The Wallet Provider SHALL also inform the User about measures they can take to ensure they have a fully working Wallet Unit again as soon as possible, such as migrating to a different Wallet Solution.

*Note: Functions that remain available to the User may include viewing their own attributes in their Wallet Unit and accessing their account at the Wallet Provider.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-017" markdown>
<div class="eudi-hlr__id">EW-DM-38-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_16
{: .eudi-hlr__meta }

To inform a User about the revocation of their Wallet Unit, the Wallet Provider SHALL use a communication channel that is independent of the Wallet Unit. In addition, the Wallet Provider MAY use the Wallet Unit itself to inform the User.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-38-018" markdown>
<div class="eudi-hlr__id">AS-WP-38-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_18
{: .eudi-hlr__meta }

A PID Provider issuing revocable PIDs SHALL, for each of its valid PIDs, regularly verify whether the Wallet Instance on which that PID is residing has been revoked and whether the associated WSCD has been revoked, using the WIA and KA received during issuance of that PID. If either the Wallet Instance or the WSCD has been revoked, the PID Provider SHALL immediately revoke the respective PID.

*Note: a) This requirement aligns with WUA_29, which requires PID Providers to check the revocation status of both the WIA and KA throughout the PID validity period. b) This is a consequence of the legal requirement in [CIR 2024/2977], Article 5, 4.(b). c) See [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md) for how the PID Provider can do this verification.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-38-019" markdown>
<div class="eudi-hlr__id">AS-WP-38-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_19
{: .eudi-hlr__meta }

An Attestation Provider issuing revocable attestations MAY decide to revoke an attestation if the Wallet Provider revoked the Wallet Unit on which that attestation is residing, in the same manner as described in WURevocation_18. An Attestation Provider SHALL publish its policy in this regard.

*Note: Publishing its policy regarding revocation allows a Relying Party to decide if it can put sufficient trust in the attestations issued by that Attestation Provider.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-001" markdown>
<div class="eudi-hlr__id">AS-WP-40-001<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_01
{: .eudi-hlr__meta }

To ensure that the User can trust the Wallet Solution, a Wallet Provider SHOULD make its certified Wallet Solution available for installation only via the official app store of the relevant operating system (e.g., Android, iOS).

*Note: This allows the operating system of the device to perform relevant checks regarding the authenticity of the Wallet Unit.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-002" markdown>
<div class="eudi-hlr__id">AS-WP-40-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_02
{: .eudi-hlr__meta }

If a Wallet Provider makes its certified Wallet Solution available for installation through other means than the official OS app store, it SHALL implement a mechanism allowing the User to verify the authenticity of the Wallet Unit. Moreover, it SHALL provide clear instructions to the User on how to install the Wallet Instance, including at least: - instructions on the verification of the authenticity of the Wallet Instance to be installed, - instructions on bypassing of any operating system limitations on side-loading of apps, if applicable, and ensuring that these limitations are restored after the Wallet Instance has been installed.

*Note: This requirement also applies for the installation of a Wallet Instance on a User device that is not a mobile device, and for which no official operating system app store may exist.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-003" markdown>
<div class="eudi-hlr__id">AS-WP-40-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_03
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that a Wallet Instance starts a process to activate the new Wallet Unit with the Wallet Provider immediately after installation or when the User first opens the Wallet Instance. The Wallet Provider SHALL ensure that the Wallet Instance starts this process only with a secure backend of the Wallet Provider.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-004" markdown>
<div class="eudi-hlr__id">AS-WP-40-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_04
{: .eudi-hlr__meta }

During the activation process of a new Wallet Unit, the Wallet Provider SHALL verify that the new Wallet Instance is a genuine instance of its Wallet Solution.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-005" markdown>
<div class="eudi-hlr__id">AS-WP-40-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_05
{: .eudi-hlr__meta }

During the activation process of a new Wallet Unit, the Wallet Provider SHALL process information about the User device and the available WSCA/WSCD and keystore(s), as far as necessary to issue Key Attestations and Wallet Instance Attestations to the Wallet Unit conform all requirements in [Topic 9][topic-9]. The Wallet Provider MAY process additional information necessary for managing the Wallet Unit, but it SHALL NOT process more information than it reasonably needs for legitimate purposes. The Wallet Provider SHALL request User consent (through the Wallet Instance) for all information and data it will process, both during activation and throughout the lifetime of the Wallet Unit. The Wallet Provider SHALL inform the User about the purposes of data processing, in accordance with the General Data Protection Regulation.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-006" markdown>
<div class="eudi-hlr__id">AS-WP-40-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_06
{: .eudi-hlr__meta }

The Wallet Provider SHALL request the User, through the new Wallet Instance, to log in to an existing account at the Wallet Provider, or to set up a new User account if the User does not have an account yet. If a new account must be set up, the Wallet Provider SHALL explain to the User that setting up an account is necessary to enable the User to request revocation of the Wallet Unit in case of theft or loss. The Wallet Provider SHALL register one or more User authentication methods that the Wallet Provider will use to authenticate the User in the future. These methods SHALL be independent of the Wallet Unit and the User device. The Wallet Provider SHALL allow the User to register using an alias instead of true identity data. The Wallet Provider SHALL NOT use any registered User data for purposes other than User authentication, unless the User gives explicit consent to do so. The Wallet Provider SHALL register the relationship between the Wallet Unit and the corresponding User account.

*Note: The User may already have an account at the Wallet Provider, for example because they use a Wallet Unit of this Wallet Provider already on another device, or if they are migrating to a new device.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-007" markdown>
<div class="eudi-hlr__id">AS-WP-40-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_07
{: .eudi-hlr__meta }

A Wallet Provider SHALL activate a new Wallet Unit before a User can use it to have issued an PID or attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-008" markdown>
<div class="eudi-hlr__id">AS-WP-40-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_08
{: .eudi-hlr__meta }

A Wallet Provider SHALL only activate a new Wallet Unit if it has verified that the Wallet Unit includes a WSCA/WSCD that is certified to be compliant with applicable requirements for Level of Assurance High.

*Note: a) A WSCA/WSCD by definition complies with requirements for Level of Assurance High, see WIAM_14. b) In addition, the Wallet Unit can include one or more keystores.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-009" markdown>
<div class="eudi-hlr__id">AS-WP-40-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_08a
{: .eudi-hlr__meta }

If a Wallet Unit contains one or more keystores, the Wallet Provider SHALL assign a security level to every keystore, with the following possible values: `iso_18045_high`, `iso_18045_moderate`, `iso_18045_enhanced-basic`, `iso_18045_basic` or `none`, corresponding to the level of resistance for which the keystore was certified (respectively AVA_VAN.5, AVA_VAN.4, AVA_VAN.3, AVA_VAN.2 and no certification).

*Note: For the definition of these security levels, also see [OpenID4VCI] Annex D.2*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-010" markdown>
<div class="eudi-hlr__id">AS-WP-40-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_09
{: .eudi-hlr__meta }

If a WSCA/WSCD or keystore contains cryptographic assets related to multiple Wallet Units, the Wallet Provider SHALL ensure that a Wallet Unit can only access assets that are related to that Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-011" markdown>
<div class="eudi-hlr__id">AS-WP-40-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_10
{: .eudi-hlr__meta }

During the activation process of a new Wallet Unit, a Wallet Provider SHALL create and sign at least one Key Attestation for the WSCA/WSCD, at least one Key Attestation for each keystore, and at least one Wallet Instance Attestation, and issue them to the Wallet Unit. The Wallet Provider SHALL verify that the private key(s) corresponding to the public key(s) in each KA are protected by the respective WSCA/WSCD or keystore, under control of the User. The Wallet Provider SHALL take measures to verify the integrity of the Wallet Instance before issuing a Wallet Instance Attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-012" markdown>
<div class="eudi-hlr__id">AS-WP-40-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_10a
{: .eudi-hlr__meta }

During the activation process of a new Wallet Unit, the Wallet Provider SHALL offer the User a means to verify the formal certification information of their Wallet Solution.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-013" markdown>
<div class="eudi-hlr__id">AS-WP-40-013</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_11
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-014" markdown>
<div class="eudi-hlr__id">AS-WP-40-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_12
{: .eudi-hlr__meta }

All communication between the Wallet Provider and the Wallet Instance SHALL be mutually authenticated and SHOULD be encrypted.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-015" markdown>
<div class="eudi-hlr__id">AS-WP-40-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_12a
{: .eudi-hlr__meta }

A Wallet Provider SHALL NOT access the contents of a Wallet Instance, in particular to learn a) which attestations are present on the Wallet Unit, b) the status of these attestations, c) the value of attributes in these attestations, and d) the contents of the Wallet Unit log meant in DASH_02.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-016" markdown>
<div class="eudi-hlr__id">AS-WP-40-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_12b
{: .eudi-hlr__meta }

If the contents of a Wallet Unit specified in WIAM_12a are stored in a Wallet Instance on the User's device, the Wallet Instance SHALL ensure that the Wallet Provider cannot access the contents of the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-017" markdown>
<div class="eudi-hlr__id">AS-WP-40-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_12c
{: .eudi-hlr__meta }

If the contents of a Wallet Unit specified in WIAM_12a are stored in a Wallet Unit Service on the Wallet Provider backend, the Wallet Provider SHALL specify and implement strict controls to limit access by the Wallet Provider to the contents of the Wallet Unit.

*Note: In this situation, the Wallet Unit cannot fully prevent the Wallet Provider from accessing the Wallet Unit contents.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-018" markdown>
<div class="eudi-hlr__id">AS-WP-40-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_13
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable the User to 'factory reset' the Wallet Unit, which SHALL cause the deletion of all attestations, the log, and all other personal data, settings, and configurations from the Wallet Unit. If the User resets the Wallet Unit, the Wallet Instance SHALL request the associated WSCA/WSCD and keystore(s) to delete all cryptographic assets related to the Wallet Unit and to all PIDs and device-bound attestations on the Wallet Unit, if the WSCA/WSCD and the keystore(s) are connected to the User device.

*Note:  a) The User can use this option, for instance, in preparation to the planned uninstallation of the Wallet Instance. b) Deletion of PID or KA cryptographic assets requires User authentication, as specified in requirement WIAM_14. c) The Wallet Unit does not necessarily inform the Wallet Provider about the factory reset. d) It may happen there is no connection to the WSCA/WSCD or to a keystore at the moment the User resets the Wallet Instance. For instance, in case the WSCA/WSCD is an external smart card and the User does not present that card to the User device. Another example occurs when the WSCA/WSCD is a remote HSM and the User device is offline at that moment. In such cases, the cryptographic assets will remain present on the WSCA/WSCD or on the keystore, even though they will never be used again. If needed, it is up to the Wallet Provider to define how the Wallet Unit should handle such situations. For example, an HSM manager could address such cases by deciding to delete cryptographic keys in the HSM that are too old or haven't been used for too long, while being aware of the risks in doing so.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-019" markdown>
<div class="eudi-hlr__id">AS-WP-40-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_13a
{: .eudi-hlr__meta }

If the User resets the Wallet Unit, the Wallet Unit SHALL disclose the fact that it no longer stores any previously disclosed PID(s) or attestation(s) to the Digital Credentials API framework.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-020" markdown>
<div class="eudi-hlr__id">AS-WP-40-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_14
{: .eudi-hlr__meta }

A WSCA/WSCD managing the critical assets of a PID, such as private or secret cryptographic keys, SHALL authenticate the User at Level of Assurance High before performing any cryptographic operation involving any of these assets.

*Note: a) [CIR 2024/2981], Annex IV, section 2 (3) states "As a prerequisite to the certification under national certification schemes, the WSCD shall be assessed against the requirements of assurance level high as set out in Implementing Regulation (EU) 2015/1502." Therefore, a WSCA/WSCD by legal definition complies with requirements of LoA High. b) Note to WIAM_14 - WIAM_14b: Many actions of the Wallet Unit, such as processing a Relying Party presentation request and presenting an attestation, require multiple cryptographic operations, for example ephemeral key generation followed by key agreement and presentation signing and encryption. These requirements does not imply that a separate User authentication is necessary before each of these operations. Rather, a successful User authentication will be valid for all cryptographic operations necessary for a Wallet Unit action. It is up to the Wallet Provider to determine what constitutes a 'Wallet Unit action', finding a balance between security (more User authentications) and User convenience (fewer User authentications). During certification of the Wallet Solution, it will be verified that the solution provides an adequate level of security.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-021" markdown>
<div class="eudi-hlr__id">AS-WP-40-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_14a
{: .eudi-hlr__meta }

A WSCA/WSCD managing the critical assets of a KA SHALL authenticate the User at Level of Assurance High before performing any cryptographic operation involving any of these assets.

*Note: The WSCA/WSCD manages the private key(s) corresponding to the public key(s) attested in the KA.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-022" markdown>
<div class="eudi-hlr__id">AS-WP-40-022<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_14b
{: .eudi-hlr__meta }

A WSCA/WSCD managing the cryptographic assets of an attestation having a level of security High SHALL authenticate the User at level of security High before performing any cryptographic operation involving any of these assets.

*Note: a) The term 'Level of Assurance', as used in the European Digital Identity Regulation and in Implementing Regulation (EU) 2015/1502, is only applicable to electronic identity means, which in the context of the EUDI Wallet means only the PID. For that reason, this requirement uses the term 'level of security'. Levels of security are defined in standards or specifications different from CIR 2015/1502, for instance ISO/IEC 18045. b) During issuance of an attestation, the Attestation Provider in its Credential Issuer metadata indicates the level of security it requires for the key storage and user authentication for this type of attestation. See [OpenID4VCI] section 12.2.4 and Appendix D.2.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-023" markdown>
<div class="eudi-hlr__id">AS-WP-40-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_14c
{: .eudi-hlr__meta }

A Wallet Unit SHALL use either the WSCA/WSCD or a keystore to manage any cryptographic assets that are not considered to be critical assets.

*Note: a) The ARF uses the term 'keystore' to refer to a hardware-backed repository and service in which non-critical cryptographic assets are generated, stored, and used exclusively inside a dedicated hardware security boundary. b) Examples of non-critical cryptographic assets are private and secret keys of attestations having a level of security lower than High. c) As mentioned in WIAM_14 and WIAM_14b, the private and secret keys of PIDs and KAs are critical assets and therefore are stored in a WSCA/WSCD.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-024" markdown>
<div class="eudi-hlr__id">AS-WP-40-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_15
{: .eudi-hlr__meta }

Before performing any operation, including allowing a User to view attestations and attribute values, a Wallet Instance SHALL securely authenticate the User using a multi-factor authentication mechanism provided by the User device.

*Note: a) One of the authentication factors is the possession of the User device.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-025" markdown>
<div class="eudi-hlr__id">AS-WP-40-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_15a
{: .eudi-hlr__meta }

For the purpose of WIAM_15, the Wallet Instance SHALL enforce the activation of an OS-level User authentication mechanism with adequate security policies.

*Note: Adequate' here means adequate for any operation excluding the issuance or presentation of PIDs, KAs, and potentially other attestations at level of security High. This includes but is not limited to generating pseudonyms, accessing the transaction log (dashboard), data export and migration, requesting the erasure of personal data by a Relying Party, and reporting a Relying Party to a DPA.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-026" markdown>
<div class="eudi-hlr__id">AS-WP-40-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_15b
{: .eudi-hlr__meta }

The Wallet Unit SHALL enable the User to use a Wallet Unit-specific authentication method for User authentication, in addition to the User authentication mechanism provided by the User device per WIAM_15. The Wallet Provider SHALL either make the use of this additional authentication method mandatory for all Users, or leave it to each User to decide if they want to use it.

*Note: a) This authentication method may be implemented by the Wallet Instance, a (local) keystore, the WSCA/WSCD, or any other component of the Wallet Unit. b) As an optimisation to reduce the number of User authentication events, the Wallet Provider can choose to implement this additional authentication method in the WSCA/WSCD, in such a way that it complies with WIAM_14.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-027" markdown>
<div class="eudi-hlr__id">AS-WP-40-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_15c
{: .eudi-hlr__meta }

The Wallet Instance SHALL also use the User authentication mechanism provided by the User device (WIAM_15) and possibly the Wallet Unit-specific authentication method (WIAM_15b) to unlock the keystore mentioned in WIAM_14c, where applicable.

*Note: Apart from using the same mechanism, the intent of this requirement is also to minimize the number of User authentications needed (after the initial authentication per WIAM_15a) to enable the issuance or presentation of (non-PID) attestations. However, see WIAM_16 and WIAM_16a: the Wallet Provider may request another authentication if this is necessary for security.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-028" markdown>
<div class="eudi-hlr__id">AS-WP-40-028<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_16
{: .eudi-hlr__meta }

For the User authentication mechanism provided by the User device (WIAM_15), the Wallet Instance SHALL force the User device to enable a time-based control (e.g., a session timeout or re-authentication interval), to ensure that access is automatically revoked after a defined period of inactivity.

*Note: It is assumed that re-authentication is required by the User device when the device is locked by the User.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-029" markdown>
<div class="eudi-hlr__id">AS-WP-40-029<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_16a
{: .eudi-hlr__meta }

For the Wallet Unit-specific User authentication method (WIAM_15b), the Wallet Provider SHALL define and implement conditions after which user authentication shall again be required, including at least an idle timeout. The Wallet Unit SHOULD provide the User with the option to set the idle timeout to a duration shorter than the default timeout set by the Wallet Provider. The Wallet Provider SHOULD also consider other factors, including the device being locked by the User and the Wallet Instance losing focus.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-030" markdown>
<div class="eudi-hlr__id">AS-WP-40-030<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_17
{: .eudi-hlr__meta }

The Wallet Provider SHALL ensure that the Wallet Unit requests the User, during activation of the Wallet Unit, to set up the authentication factors for the User authentication mechanism implemented by the WSCA/WSCD meant in WIAM_14, the authentication mechanism implemented by the User device meant in WIAM_15 and WIAM_15a, and, if used, the Wallet Unit-specific authentication method meant in WIAM_15b.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-031" markdown>
<div class="eudi-hlr__id">AS-WP-40-031</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_18
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-032" markdown>
<div class="eudi-hlr__id">AS-WP-40-032<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_19
{: .eudi-hlr__meta }

A WSCA/WSCD and a keystore SHALL be able to prove possession of the private key corresponding to a public key on request of a Wallet Instance, for example by signing a challenge with that private key.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-033" markdown>
<div class="eudi-hlr__id">AS-WP-40-033<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_20
{: .eudi-hlr__meta }

A WSCA/WSCD SHALL protect a private key it generated during the entire lifetime of the key. This protection SHALL at least imply that the WSCA/WSCD prevents the private key from being extracted in the clear. If a WSCA/WSCD is able to export a private key in encrypted format, the resulting level of protection SHALL be equivalent to the protection level of the private key when stored in the WSCA/WSCD.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-40-034" markdown>
<div class="eudi-hlr__id">AS-WP-40-034<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WIAM_21
{: .eudi-hlr__meta }

Whenever the WSCA/WSCD successfully authenticated the User, the Wallet Unit SHOULD check if the WSCD contains cryptographic assets for technical PIDs or attestations that cannot be presented any longer to Relying Parties, for example because they have expired or because a once-only attestation (see [Topic 10][topic-10], section D, method A) was presented to a Relying Party already. The Wallet Unit SHOULD then request the WSCA/WSCD to destroy all cryptographic assets related to these technical PIDs or attestations. However, the Wallet Unit SHOULD NOT request the destruction of the private key belonging to the last technical PID or attestation corresponding to a logical PID or attestation.

*Note: a) The reason for this recommendation is that probably, Wallet Providers will want to prevent an accumulation of unused private keys in the WSCA/WSCD, given that such devices typically do not have much storage space. However, deletion of private keys (and potentially other cryptographic assets) is a cryptographic key operation and cannot be done without User authentication - see WIAM_14. At the same time, for usability reasons the User must not be involved in such 'cleaning up' processes, see also ISSU_42. The recommended solution is to take advantage of a User authentication event to also carry out any necessary cleaning operations. b) Method A (once-only attestations, see ISSU_ 37) includes a potential fallback to Method B (limited-time attestations) in case no unused technical PIDs or attestations are left. To ensure that falling back to Method B is always possible when needed, a Wallet Unit should ensure that for every logical PID or attestation it has, it is always in possession of at least one technical PID or attestation.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-001" markdown>
<div class="eudi-hlr__id">AS-WP-43-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable an Attestation Provider to optionally express an embedded disclosure policy for a QEAA, PuB-EAA, or non-qualified EAA.

*Note: The [European Digital Identity Regulation] does not contain a requirement for PIDs to be able to contain an embedded disclosure policy.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-002" markdown>
<div class="eudi-hlr__id">AS-WP-43-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_02
{: .eudi-hlr__meta }

A Wallet Unit SHALL support embedded disclosure policies implementing the 'Authorised relying parties only policy' described in Annex III of Implementing Regulation (EU) 2024/2979 and as specified in [ETSI TS 119 472-3]. If present, such an embedded disclosure policy SHALL contain a list of duplets, where each duplet consists of an EU-wide unique Relying Party identifier in combination with a Service identifier, as specified in Reg_32 and Reg_33. After receiving a presentation request, the Wallet Unit SHALL retrieve the unique identifier and Service identifier of the Relying Party from the registration certificate presented by the Relying Party, and compare them to the list of authorised identifier duplets in the policy for the requested attestation. If the identifier duplet is not included in this list, the Wallet Unit SHALL consider the evaluation of the embedded disclosure policy to have failed, and inform the User.

*Note: The Wallet Unit uses the Relying Party identifier and Service identifier in the registration certificate, not the identifiers in the access certificate. This is because if the Relying Party uses the services of an intermediary, the identifiers in the access certificate refer to the intermediary rather than the intermediated Relying Party. The intermediary is not relevant for the purposes of an EDP.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-003" markdown>
<div class="eudi-hlr__id">AS-WP-43-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_03
{: .eudi-hlr__meta }

A Wallet Unit SHALL support embedded disclosure policies implementing the 'Specific root of trust' policy described in Annex III of Implementing Regulation (EU) 2024/2979 and as specified in [ETSI TS 119 472-3]. If present, such an embedded disclosure policy SHALL contain a list of root or intermediate certificates used for signing Relying Party registration certificates. After receiving a presentation request, the Wallet Unit SHALL compare all certificates in the certificate chain that was used to sign the registration certificate provided by the Relying Party to the list of authorised root or intermediate certificates in the policy for the requested attestation. If none of these certificates are included in this list, the Wallet Unit SHALL consider the evaluation of the embedded disclosure policy to have failed, and inform the User.

*Note: See EDP_02 for why the Wallet Unit uses the certificate chain of the registration certificate rather than the one of the access certificate.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-004" markdown>
<div class="eudi-hlr__id">AS-WP-43-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_05
{: .eudi-hlr__meta }

An embedded disclosure policy SHOULD contain a link to a website of the Attestation Provider explaining the disclosure policy in layman's terms. If this is the case, the Wallet Unit SHALL display the link to the User and allow them to navigate to that website.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-005" markdown>
<div class="eudi-hlr__id">AS-WP-43-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_06
{: .eudi-hlr__meta }

The Wallet Unit SHALL evaluate an embedded disclosure policy in conjunction with the information received from the requesting Relying Party in the registration certificate, in order to determine if the Relying Party has permission from the Attestation Provider to access the requested attestation. The Wallet Unit SHALL perform this evaluation in compliance with the evaluation rules established in ETSI TS 119 472-3.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-006" markdown>
<div class="eudi-hlr__id">AS-WP-43-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_07
{: .eudi-hlr__meta }

The Wallet Unit SHALL enable the User, based on the outcome of the evaluation of the applicable embedded disclosure policy(s), to deny or allow the presentation of the requested attestation to the Relying Party.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-007" markdown>
<div class="eudi-hlr__id">AS-WP-43-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_08
{: .eudi-hlr__meta }

The format of an embedded disclosure policy SHALL comply with ETSI TS 119 472-3.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-43-008" markdown>
<div class="eudi-hlr__id">AS-WP-43-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_10
{: .eudi-hlr__meta }

During attestation issuance, a Wallet Unit SHALL retrieve and store the corresponding embedded disclosure policy, if any.

*Note: The intent of this requirement is that the Wallet Unit is able to evaluate an EDP during a presentation transaction, without needing to request it again from the Attestation Provider. This is necessary in particular during proximity presentations, which must be able to be done without an internet connection.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-48-001" markdown>
<div class="eudi-hlr__id">AS-WP-48-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL support the possibilities mentioned in DATA_DLT_02, allowing a User to request from a Relying Party the erasure of their attributes that were presented by that Wallet Unit to that Relying Party, in accordance with Article 17 of Regulation (EU) 2016/679.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-48-002" markdown>
<div class="eudi-hlr__id">AS-WP-48-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_04
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-48-003" markdown>
<div class="eudi-hlr__id">AS-WP-48-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_05
{: .eudi-hlr__meta }

A Wallet Unit SHALL include the initiation of a data deletion request in a log, so it can be displayed to the User via the dashboard as specified in [Topic 19][topic-19].

*Note: Because the request is sent by an external web browser, e-mail client, or phone client (see DATA_DLT_02), the Wallet Unit can only log the initiation of the request.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-48-004" markdown>
<div class="eudi-hlr__id">AS-WP-48-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_08
{: .eudi-hlr__meta }

Wallet Units, Relying Parties, and Registrars SHALL comply with the relevant requirements in [Technical Specification 7](../../technical-specifications/ts7-common-interface-for-data-deletion-request.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-50-001" markdown>
<div class="eudi-hlr__id">AS-WP-50-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL enable the User to start the process of reporting a suspicious presentation request to a DPA. When prompted by the User, a Wallet Unit SHALL provide the contact details of the DPA which supervises the Relying Party that made the suspicious request, available in the log for that request (see DASH_03). In addition, the Wallet Unit MAY also provide the contact details of the DPA of the region in which the Wallet Provider is residing, or of other DPAs, taken from the European Data Protection Board website (<https://www.edpb.europa.eu/about-edpb/about-edpb/members_en>).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-50-002" markdown>
<div class="eudi-hlr__id">AS-WP-50-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_02
{: .eudi-hlr__meta }

The Wallet Unit SHALL offer the User the option to report a suspicious request to a DPA via the transaction log presented in the dashboard, see [Topic 19][topic-19].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-50-003" markdown>
<div class="eudi-hlr__id">AS-WP-50-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_02a
{: .eudi-hlr__meta }

A Wallet Unit SHALL support at least the following possibilities to report a suspicious presentation request to a DPA, depending on what contact details are available for the DPA: a) Open a URL in an external browser to report the request in a web form provided by the DPA. b) Open an external e-mail client and start a draft e-mail to the DPA, with a suitable template text, c) open an external phone client and start a phone call.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-50-004" markdown>
<div class="eudi-hlr__id">AS-WP-50-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_04
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that a Wallet Unit allows its User to substantiate a report sent to a DPA, including by attaching relevant information to identify the Relying Party and the Users' claims in a machine-readable format.

*Note: The log kept by the Wallet Unit is standardised in [Technical Specification 10](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts10-data-portability-and-download-(export).md) and is machine-readable in order to enable data portability. An excerpt from this log therefore can be used to substantiate the report.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-50-005" markdown>
<div class="eudi-hlr__id">AS-WP-50-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_05
{: .eudi-hlr__meta }

A Wallet Unit SHALL log the fact that it initiated the sending of a report to a DPA (see RPT_DPA_02a), as specified in [Topic 19][topic-19].

</div>
</div>


<div class="eudi-hlr" id="AS-WP-50-006" markdown>
<div class="eudi-hlr__id">AS-WP-50-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_06
{: .eudi-hlr__meta }

Wallet Units, Data Protection Authorities, and Registrars SHALL comply with the relevant requirements in [Technical Specification 8](../../technical-specifications/ts8-common-interface-for-reporting-of-wrp-to-dpa.md).

</div>
</div>


<div class="eudi-hlr" id="AS-WP-51-001" markdown>
<div class="eudi-hlr__id">AS-WP-51-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PAD_01
{: .eudi-hlr__meta }

A Wallet Unit SHALL at any time enable the User to delete any PID or attestation from their Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-51-002" markdown>
<div class="eudi-hlr__id">AS-WP-51-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PAD_02
{: .eudi-hlr__meta }

If the User indicates that a logical PID or attestation must be deleted, and the Wallet Unit contains multiple physical PIDs or attestations corresponding to that logical PID or attestation, a Wallet Unit SHALL delete all of these physical PIDs and attestations simultaneously.

*Note: a) This situation may occur if the PID Provider or Attestation Provider issued a batch of physical PIDs or attestations to the Wallet Unit, rather than a single one. b) Physical PIDs or attestations correspond to a logical one if they have not only the same attestation type and Provider, but also the same attribute values. In principle, the same Provider can issue two attestations of the same type to the same Wallet Unit, for example two diplomas from the same university. This corresponds to the notion of a Credential Dataset in OpenID4VCI.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-51-003" markdown>
<div class="eudi-hlr__id">AS-WP-51-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PAD_03
{: .eudi-hlr__meta }

If the Wallet Unit deletes a PID or attestation on the User's request, the Wallet Unit SHALL NOT notify the respective PID Provider or Attestation Provider.

*Note: This is a matter of User privacy.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-51-004" markdown>
<div class="eudi-hlr__id">AS-WP-51-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PAD_04
{: .eudi-hlr__meta }

If the Wallet Unit deletes a PID or device-bound attestation on the User's request, the Wallet Unit SHALL ensure that all cryptographic assets in the WSCA/WSCD or keystores related to this PID or attestation are securely destroyed.

*Note: Key deletion for a PID key is a cryptographic key operation and requires User authentication, as specified in requirement WIAM_14.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-51-005" markdown>
<div class="eudi-hlr__id">AS-WP-51-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PAD_05
{: .eudi-hlr__meta }

If a Wallet Unit deletes, on the User's request, a PID or attestation previously disclosed to the Digital Credentials API framework, the Wallet Instance SHALL disclose the fact that it no longer stores this PID or attestation to the Digital Credentials API framework.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-51-006" markdown>
<div class="eudi-hlr__id">AS-WP-51-006</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PAD_06
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-WP-54-001" markdown>
<div class="eudi-hlr__id">AS-WP-54-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACC_01
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that their Wallet Units comply with applicable requirements and standards in [Directive 2016/2012 on the accessibility of websites and mobile applications of public sector bodies](http://data.europa.eu/eli/dir/2016/2102/oj).

*Note: Compliance with the European Standard [ETSI EN 301 549 V1.1.2](https://www.etsi.org/deliver/etsi_en/301500_301599/301549/01.01.02_60/en_301549v010102p.pdf) (2015-04) provides a presumption of conformity to the Accessibility Directive.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-54-002" markdown>
<div class="eudi-hlr__id">AS-WP-54-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACC_02
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that their Wallet Units comply with accessibility requirements for products and services established under [Directive (EU) 2019/882](http://data.europa.eu/eli/dir/2019/882/oj).

*Note: Compliance with the European Standard [ETSI EN 301 549 V1.1.2](https://www.etsi.org/deliver/etsi_en/301500_301599/301549/01.01.02_60/en_301549v010102p.pdf) (2015-04) potentially provides a presumption of conformity to this Directive.*

</div>
</div>


<div class="eudi-hlr" id="AS-WP-56-001" markdown>
<div class="eudi-hlr__id">AS-WP-56-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPSM_01
{: .eudi-hlr__meta }

A Wallet Provider SHALL monitor their installed base of operational Wallet Instances for maintenance purposes, and determine and document in a transparent manner the data it needs and is allowed to monitor in order to deliver the required support. Data or attributes that SHOULD be monitored include: 1) Runtime errors, for uncaught errors in production code, 2) UX and telemetry information, for UX field analysis, 3) OS version and health information, for detection of OS level vulnerabilities, 4) Wallet Instance SDK and software library version information, for Wallet Instance code vulnerabilities, 5) User locale/localisation data, for catching localisation related errors, 6) Wallet Instance version, for catching errors or vulnerabilities due to outdated versions, 7) Supported WSCA/WSCDs and keystores and their supported capabilities, for detection of cryptography incompatibilities, 8) Unique device identifier such as IDFV or persisted UUID (iOS) or AndroidID (Android), for maintaining an up-to-date list of Wallet Instance-related device installations and for detecting potential malicious use (unrecognised identifier), 9) Device sensor identifiers and patch levels, for checking if sensor hardware in the device is up-to-date. 10) hardware-level details about the device, to identify known hardware-based problems or vulnerabilities, 11) BLE and NFC support by device, for analysing the security and feasibility of proximity use cases with a given Wallet Instance.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-56-002" markdown>
<div class="eudi-hlr__id">AS-WP-56-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPSM_02
{: .eudi-hlr__meta }

Wallet Providers SHALL, for maintenance purposes, write custom crash logs for sending them for further analysis.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-56-003" markdown>
<div class="eudi-hlr__id">AS-WP-56-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPSM_03
{: .eudi-hlr__meta }

A Wallet Provider SHALL monitor the security posture of its operational Wallet Instances for the purpose of detecting critical security risks in the environment the Wallet Instance is run at, and determine and document in a transparent manner the data it needs and is allowed to monitor. Information that SHOULD be monitored for software and hardware level problems/vulnerabilities on device includes 1) detection of device rooting/jailbreaking, 2) emulator detection, 3) device OS version and health data, 4) Wallet Instance SDK and SW library versions, 5) Wallet Instance version, 6) Supported WSCA/WSCD and keystore(s) and 7) Sensor identifiers and patch levels.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-56-004" markdown>
<div class="eudi-hlr__id">AS-WP-56-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WPSM_04
{: .eudi-hlr__meta }

During the lifetime of the Wallet Unit, the Wallet Provider SHALL update the Wallet Unit as necessary to ensure its continued security and functionality.

</div>
</div>


---

### 2. Member States & Registrars

*These requirements are for the public bodies that establish the legal and trust*
*infrastructure. They focus on establishing registries, notifying the*
*Commission, and defining national policies.*

<div class="eudi-hlr" id="AS-MS-18-001" markdown>
<div class="eudi-hlr__id">AS-MS-18-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACP_02
{: .eudi-hlr__meta }

A Cryptographic Binding of Attestations scheme SHALL rely solely on algorithms included in the [ECCG Agreed Cryptographic Mechanisms v2.0].

</div>
</div>


<div class="eudi-hlr" id="AS-MS-25-001" markdown>
<div class="eudi-hlr__id">AS-MS-25-001</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CAT_01
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-25-002" markdown>
<div class="eudi-hlr__id">AS-MS-25-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CAT_01a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-25-003" markdown>
<div class="eudi-hlr__id">AS-MS-25-003</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CAT_01b
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-25-004" markdown>
<div class="eudi-hlr__id">AS-MS-25-004</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CAT_02
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-25-005" markdown>
<div class="eudi-hlr__id">AS-MS-25-005</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CAT_03
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-25-006" markdown>
<div class="eudi-hlr__id">AS-MS-25-006</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CAT_03b
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-25-007" markdown>
<div class="eudi-hlr__id">AS-MS-25-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CAT_04
{: .eudi-hlr__meta }

A request to include or to modify an attribute in the catalogue of attributes SHALL indicate how a QTSP can use the verification point for that attribute.

*Note: This could be, for instance, in the form of (a reference to) an endpoint description text.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-001" markdown>
<div class="eudi-hlr__id">AS-MS-27-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_01
{: .eudi-hlr__meta }

Member States SHALL provide processes and mechanisms for PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers, and Relying Parties to register in a registry.

*Note: Member States may choose to implement a single registry for all these roles, or a separate registry for each of these roles.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-002" markdown>
<div class="eudi-hlr__id">AS-MS-27-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_01a
{: .eudi-hlr__meta }

Member States SHALL register a common set of data about a) PID Providers, b) QEAA Providers, c) PuB-EAA Providers, d) non-qualified EAA Providers. and e) Relying Parties, according to the relevant requirements in [Technical Specification 6](../../technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md).

*Note: For PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers, the common set of data specified in [Technical Specification 6][ts6] include the attestation type(s) that the provider intends to issue to Wallet Units.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-003" markdown>
<div class="eudi-hlr__id">AS-MS-27-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_01b
{: .eudi-hlr__meta }

Member States SHALL collect the following information only for the purpose of transparency and SHALL NOT apply any pre-authorisation process on it: i) Contact information of the registering entity, ii) description of its services, iii) Attributes registered for each intended use (for Relying Parties), or types of attestation registered (for PID Providers and Attestation Providers), iv) Description of each intended use (for Relying Parties).

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-004" markdown>
<div class="eudi-hlr__id">AS-MS-27-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_02
{: .eudi-hlr__meta }

Member States SHALL make publicly available all necessary details and documentation about the registration processes for their registry.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-005" markdown>
<div class="eudi-hlr__id">AS-MS-27-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_03
{: .eudi-hlr__meta }

Member States SHALL publish the registry entries online, in a sealed or signed machine-readable common format suitable for automated processing, according to the relevant requirements in [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md), for the purpose of transparency to Users and other stakeholders.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-006" markdown>
<div class="eudi-hlr__id">AS-MS-27-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_04
{: .eudi-hlr__meta }

Member States SHALL make the registry entries available online, in a human-readable format. The website used for this purpose SHALL use a secure channel protecting the authenticity and integrity of the information in the registry during transport. Member States SHALL NOT require authentication or prior registration and authorisation of any person wishing to retrieve the information in the registry.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-007" markdown>
<div class="eudi-hlr__id">AS-MS-27-007</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_05
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-008" markdown>
<div class="eudi-hlr__id">AS-MS-27-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_06
{: .eudi-hlr__meta }

Member States SHALL support the common API specified in [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) to enable automated retrieval of registry entries from the Member States' registries.

*Note: [Technical Specification 5][ts5] specifies the use of a secure channel protecting the authenticity and integrity of the information in the registry during transport, and does not require authentication or prior registration and authorisation of any entity wishing to retrieve the information in the registry.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-009" markdown>
<div class="eudi-hlr__id">AS-MS-27-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_07
{: .eudi-hlr__meta }

A Member State SHALL enable a registered PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party to update the information registered on it, using a process comparable to the original registration process. For Relying Parties, this SHALL be possible using the API or user interface mentioned in Reg_24.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-010" markdown>
<div class="eudi-hlr__id">AS-MS-27-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_08
{: .eudi-hlr__meta }

A registered PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party SHALL make any updates necessary to ensure the continued correctness of the registered information without undue delay.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-011" markdown>
<div class="eudi-hlr__id">AS-MS-27-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_09
{: .eudi-hlr__meta }

Member States SHALL log all changes made on the information registered regarding a PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party, including at least initial registration, updates, deletion of information, and suspension or cancellation.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-012" markdown>
<div class="eudi-hlr__id">AS-MS-27-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_10
{: .eudi-hlr__meta }

A Member State SHALL ensure that an Access Certificate Authority notified according to [Topic 31][topic-31]] issues one or more access certificates to all PID Providers, QEAA Providers, PuB-EAA Providers, non-qualified EAA Providers and Relying Parties registered in one of the Member State's registries.

*Note: To be able to authenticate towards Wallet Units, each Relying Party Instance of a Relying Party and each service supply point of a PID Provider or Attestation Provider needs a separate access certificate, where the private key corresponding to the public key in the certificate is managed in the hardware and software of the Relying Party Instance or service supply point.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-013" markdown>
<div class="eudi-hlr__id">AS-MS-27-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_10a
{: .eudi-hlr__meta }

A registering entity SHALL register one or more Services, and SHALL receive at least one access certificate for each registered Service, complying with Reg_33 and Reg_34.

*Note: a) If the registering entity registers only one Service, all of its access certificates will contain an identical Service identifier and Service trade name. b) A single Relying Party Instance or service supply point may receive multiple access certificates, corresponding to multiple Services of the same Relying Party or Attestation Provider. This would enable the entity to use the same Relying Party Instance or supply point for multiple Services.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-014" markdown>
<div class="eudi-hlr__id">AS-MS-27-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_10b
{: .eudi-hlr__meta }

When issuing an access certificate to a PID Provider, Attestation Provider, or Relying Party, an Access Certificate Authority SHALL also send the signing certificate and, if present, any intermediate certificate(s) leading up to the corresponding trust anchor of the Access CA in the respective LoTE published by the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-015" markdown>
<div class="eudi-hlr__id">AS-MS-27-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_10c
{: .eudi-hlr__meta }

The registering entity SHALL receive at least one registration certificate for each registered Service, complying with RPRC_07a.

*Note: If the registering entity registers only one Service, all of its registration certificates will contain an identical Service identifier and Service trade name.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-016" markdown>
<div class="eudi-hlr__id">AS-MS-27-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_10d
{: .eudi-hlr__meta }

A Relying Party SHALL register which of its registered intended uses are applicable to each of its registered Services.

*Note: Another way to phrase this is to say that the Relying Party must register the intended use(s) of each of it registered Services separately.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-017" markdown>
<div class="eudi-hlr__id">AS-MS-27-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_10e
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL register which type(s) of attestation each of its registered Services intends to issue to Wallet Units.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-018" markdown>
<div class="eudi-hlr__id">AS-MS-27-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_11
{: .eudi-hlr__meta }

A Member State SHALL ensure that the issuance process of access certificates by their notified Access Certificate Authority(s) complies with [ETSI TS 119 411-8]. An Access Certificate Authority SHALL have a policy governing all aspects of access certificate issuance and management complying with this standard. 

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-019" markdown>
<div class="eudi-hlr__id">AS-MS-27-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_12
{: .eudi-hlr__meta }

An Access CA SHALL be able to revoke an access certificate, if it has a validity period of longer than 24 hours

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-020" markdown>
<div class="eudi-hlr__id">AS-MS-27-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_13
{: .eudi-hlr__meta }

An Access CA SHALL have a policy specifying under which conditions an access certificate it issued will be revoked.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-021" markdown>
<div class="eudi-hlr__id">AS-MS-27-021</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_14
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-022" markdown>
<div class="eudi-hlr__id">AS-MS-27-022</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_15
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-023" markdown>
<div class="eudi-hlr__id">AS-MS-27-023</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_16
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-024" markdown>
<div class="eudi-hlr__id">AS-MS-27-024</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_17
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-025" markdown>
<div class="eudi-hlr__id">AS-MS-27-025</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_18
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-026" markdown>
<div class="eudi-hlr__id">AS-MS-27-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_19
{: .eudi-hlr__meta }

A Member State SHALL approve a PID Provider according to a well-defined policy before including it in its PID Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of PID Providers in its Registry.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-027" markdown>
<div class="eudi-hlr__id">AS-MS-27-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_20
{: .eudi-hlr__meta }

A Member State SHALL identify PID Providers at a level of confidence proportionate to the risk arising from the potential harm a fraudulent PID Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-028" markdown>
<div class="eudi-hlr__id">AS-MS-27-028<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_20a
{: .eudi-hlr__meta }

A Registrar SHALL provide a method to suspend or cancel a registered PID Provider.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-029" markdown>
<div class="eudi-hlr__id">AS-MS-27-029<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_20b
{: .eudi-hlr__meta }

A Registrar SHALL have a policy for the suspension or cancellation of a registered PID Provider, which SHALL specify that a PID Provider is suspended or cancelled at least on request of the PID Provider or of a competent national authority.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-030" markdown>
<div class="eudi-hlr__id">AS-MS-27-030<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_21
{: .eudi-hlr__meta }

A Member State SHALL approve an Attestation Provider according to a well-defined policy before including it in its Attestation Provider Registry. To that end, a Member State SHALL define specific vetting processes and rules of acceptance for inclusion of Attestation Providers in its Registry. These processes and rules SHOULD consider any relevant differences between QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-031" markdown>
<div class="eudi-hlr__id">AS-MS-27-031<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_22
{: .eudi-hlr__meta }

A Member State SHALL identify Attestation Providers (i.e., QEAA Providers, PuB-EAA Providers and non-qualified EAA Providers) at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Attestation Provider could cause to Users and other stakeholders in the EUDI Wallet ecosystem.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-032" markdown>
<div class="eudi-hlr__id">AS-MS-27-032<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_22a
{: .eudi-hlr__meta }

A Registrar SHALL provide a method to suspend or cancel a registered Attestation Provider.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-033" markdown>
<div class="eudi-hlr__id">AS-MS-27-033<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_22b
{: .eudi-hlr__meta }

A Registrar SHALL have a policy for the suspension or cancellation of a registered Attestation Provider, which SHALL specify that an Attestation Provider is suspended or cancelled at least on request of the Attestation Provider or of a competent national authority.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-034" markdown>
<div class="eudi-hlr__id">AS-MS-27-034</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_23
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-035" markdown>
<div class="eudi-hlr__id">AS-MS-27-035<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_24
{: .eudi-hlr__meta }

A Member State SHALL enable a Relying Party to register remotely, using an API or user interface.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-036" markdown>
<div class="eudi-hlr__id">AS-MS-27-036<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_25
{: .eudi-hlr__meta }

A Member State SHALL identify a Relying Party at a level of confidence proportionate to the risk arising from the potential harm a fraudulent Relying Party could cause to Users and other stakeholders in the EUDI Wallet ecosystem.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-037" markdown>
<div class="eudi-hlr__id">AS-MS-27-037<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_26
{: .eudi-hlr__meta }

With respect to Reg_25, a Member State SHALL consider whether a registering entity intends to act as an intermediary.

*Note: According to the [European Digital Identity Regulation], an intermediary is a Relying Party.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-038" markdown>
<div class="eudi-hlr__id">AS-MS-27-038</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_27
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-039" markdown>
<div class="eudi-hlr__id">AS-MS-27-039</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_28
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-040" markdown>
<div class="eudi-hlr__id">AS-MS-27-040<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_29
{: .eudi-hlr__meta }

A Member State SHALL have a policy for the cancellation of a registered Relying Party, which SHALL specify that a Relying Party is cancelled at least on request of the Relying Party or of a competent national authority.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-041" markdown>
<div class="eudi-hlr__id">AS-MS-27-041</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_30
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-042" markdown>
<div class="eudi-hlr__id">AS-MS-27-042<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_31
{: .eudi-hlr__meta }

An access certificate SHALL contain a trade name for the entity (i.e., the PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party), in a format suitable for presenting to a User. This name SHALL be identical to the name for the entity registered according to [Technical Specification 6][ts6] and included in the entity's registration certificate(s) according to RPRC_06.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-043" markdown>
<div class="eudi-hlr__id">AS-MS-27-043<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_32
{: .eudi-hlr__meta }

An access certificate SHALL contain an EU-wide unique identifier for the entity (i.e., the PID Provider, QEAA Provider, PuB-EAA Provider, non-qualified EAA Provider, or Relying Party), which SHALL be identical to the identifier for the entity registered according to [Technical Specification 6](../../technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md) and included in the entity's registration certificate(s) according to RPRC_07.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-044" markdown>
<div class="eudi-hlr__id">AS-MS-27-044<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_32a
{: .eudi-hlr__meta }

The trade name meant in Reg_31 and the identifier meant in Reg_32 SHALL be the same in all access certificates issued to a given entity.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-045" markdown>
<div class="eudi-hlr__id">AS-MS-27-045<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_33
{: .eudi-hlr__meta }

An access certificate SHALL contain a Relying Party Service identifier, which SHALL be provided by the registering entity according to [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) and [Technical Specification 6](../../technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md), and SHALL be unique within the scope of that entity. Moreover, it SHALL be included in the entity's registration certificate according to RPRC_07a.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-046" markdown>
<div class="eudi-hlr__id">AS-MS-27-046<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_34
{: .eudi-hlr__meta }

An access certificate SHALL contain a trade name for the Relying Party Service, which SHALL be provided by the registering entity according to [Technical Specification 5](../../technical-specifications/ts5-common-formats-and-api-for-rp-registration-information.md) and [Technical Specification 6](../../technical-specifications/ts6-common-set-of-rp-information-to-be-registered.md), and SHALL be suitable for presenting to a User.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-047" markdown>
<div class="eudi-hlr__id">AS-MS-27-047<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_34a
{: .eudi-hlr__meta }

If the subject of the access certificate is an intermediary (see [Topic 52][topic-52]), the 'association to the wallet-relying party that is relying upon the intermediary ' mentioned in Annex I (16) of [CIR 2025/848] (and referenced in Annex IV, point 3(k) of that CIR) SHALL consist of the unique identifier of this Relying Party as meant in requirement Reg_32 and its Relying Party Service identifier as meant in Reg_33.

*Note: a) This implies that an intermediary receives a separate set of access certificates for each of its intermediated Relying Parties. b) The association is also included in the registration certificates of the intermediated Relying Parties, see RPRC_04.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-27-048" markdown>
<div class="eudi-hlr__id">AS-MS-27-048<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: Reg_35
{: .eudi-hlr__meta }

The access certificate format SHALL provide for the data elements to carry the elements mentioned in Reg_31 - Reg_34a.

*Note: The generic X.509 certificate structure has multiple suitable data elements which could be designated for these elements. *

</div>
</div>


<div class="eudi-hlr" id="AS-MS-28-001" markdown>
<div class="eudi-hlr__id">AS-MS-28-001</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: LP_01
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-29-001" markdown>
<div class="eudi-hlr__id">AS-MS-29-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RP_01
{: .eudi-hlr__meta }

Attestation Scheme Providers MAY create one or multiple Attestation Rulebooks for representation attestations issued to a natural person representing another natural person. Each Rulebook SHALL specify the unique attestation type of these representation attestations. The Rulebook SHALL also specify attributes used for defining a validity period, the nature of the representation, and the operations the representative is authorised to perform, thereby limiting the scope of its authorisation.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-001" markdown>
<div class="eudi-hlr__id">AS-MS-31-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: GenNot_01
{: .eudi-hlr__meta }

Member States SHALL notify all PID Providers, PuB-EAA Providers, Wallet Providers, Access Certificate Authorities, and Providers of registration certificates to the European Commission, using a common system provided by the Commission, complying with all relevant requirements in[Technical Specification 2](../../technical-specifications/ts2-notification-publication-provider-information.md).

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-002" markdown>
<div class="eudi-hlr__id">AS-MS-31-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: GenNot_02
{: .eudi-hlr__meta }

In addition to [Technical Specification 2][ts2] referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the notification of a PID Provider, PuB-EAA Provider, Wallet Provider, Access Certificate Authority, or Provider of registration certificates to the Commission.

*Note: The outcome of the notification procedure is the publication of the information notified by the Member State according to [Article 5a](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e1347-1-1) (18) in a machine and human readable manner using the common system mentioned in Section H, TLPub_01.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-003" markdown>
<div class="eudi-hlr__id">AS-MS-31-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: GenNot_03
{: .eudi-hlr__meta }

The common system mentioned in GenNot_01 SHALL enable: - A secure notification channel between Member States and the Commission for all notifications. - A notification, verification, and publication process and associated validation steps (with follow-up and monitoring) at the Commission side. - Collected data to be processed, consolidated, signed or sealed, and published in both a machine-processable LoTE and in a human-readable format, manually and/or automatically using e.g. a web service and/or API.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-004" markdown>
<div class="eudi-hlr__id">AS-MS-31-004</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: GenNot_04
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-005" markdown>
<div class="eudi-hlr__id">AS-MS-31-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: GenNot_05
{: .eudi-hlr__meta }

In addition to [Technical Specification 2][ts2] referred to in GenNot_01, the European Commission SHALL establish standard operating procedures for the suspension or cancellation of a PID Provider, PuB-EAA Provider, Wallet Provider, Access Certificate Authority, or Provider of registration certificates. These operating procedures SHALL include unambiguous conditions for suspension or cancellation. As an outcome of the suspension or cancellation procedure, the Commission SHALL change the status of the suspended or cancelled PID Provider, PuB-EAA Provider, Wallet Provider, Access Certificate Authority or Provider of registration certificates in the respective LoTE to Invalid.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-006" markdown>
<div class="eudi-hlr__id">AS-MS-31-006</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_01
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-007" markdown>
<div class="eudi-hlr__id">AS-MS-31-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_03
{: .eudi-hlr__meta }

PID Providers SHALL ensure that all PIDs they issue can be authenticated using the PID Provider trust anchors notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-008" markdown>
<div class="eudi-hlr__id">AS-MS-31-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_03a
{: .eudi-hlr__meta }

PID Providers SHALL ensure that all Attestation Status Lists or Attestation Revocation Lists used to revoke their PIDs can be authenticated using the trust anchors for PID revocation lists notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-009" markdown>
<div class="eudi-hlr__id">AS-MS-31-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_04
{: .eudi-hlr__meta }

PID Providers SHALL ensure that their access certificates can be authenticated using the applicable Access Certificate Authority trust anchors notified to the Commission.

*Note: [Topic 6][topic-6]] describes how access certificates will be used.*

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-010" markdown>
<div class="eudi-hlr__id">AS-MS-31-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_05
{: .eudi-hlr__meta }

Wallet Units, Relying Parties, and other relevant actors SHALL accept PID Provider trust anchors and the trust anchors for PID revocation lists because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PID Provider LoTE, which is sealed by the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-011" markdown>
<div class="eudi-hlr__id">AS-MS-31-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_06
{: .eudi-hlr__meta }

Wallet Units and other relevant actors SHALL accept Access Certificate Authority trust anchors because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled LoTE, which is signed or sealed by the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-012" markdown>
<div class="eudi-hlr__id">AS-MS-31-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PPNot_07
{: .eudi-hlr__meta }

The format of a PID Provider LoTE SHALL comply with [ETSI TS 119 602], including Annex D.

</div>
</div>


<div class="eudi-hlr" id="AS-WP-31-009" markdown>
<div class="eudi-hlr__id">AS-WP-31-009</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PuBPNot_01
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-013" markdown>
<div class="eudi-hlr__id">AS-MS-31-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PuBPNot_03
{: .eudi-hlr__meta }

The format of the PuB-EAA Provider LoTE SHALL comply with [ETSI TS 119 602], including Annex H.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-014" markdown>
<div class="eudi-hlr__id">AS-MS-31-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PuBPNot_04
{: .eudi-hlr__meta }

PuB-EAA Providers SHALL ensure that all PuB-EAAs they issue can be authenticated using the trust anchors notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-015" markdown>
<div class="eudi-hlr__id">AS-MS-31-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PuBPNot_05
{: .eudi-hlr__meta }

PuB-EAA Providers SHALL ensure that all Attestation Status Lists and Attestation Revocation Lists used to revoke their PuB-EAAs can be authenticated using the trust anchors for PuB-EAA revocation lists notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-016" markdown>
<div class="eudi-hlr__id">AS-MS-31-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PuBPNot_06
{: .eudi-hlr__meta }

Relying Parties and other relevant actors SHALL accept PuB-EAA Provider trust anchors and the trust anchors for PuB-EAA Provider revocation lists because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled PuB-EAA Provider LoTE, which is sealed by the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-017" markdown>
<div class="eudi-hlr__id">AS-MS-31-017</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_01
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-019" markdown>
<div class="eudi-hlr__id">AS-MS-31-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_03
{: .eudi-hlr__meta }

An Access Certificate Authority SHALL ensure that the access certificates it issues to Relying Parties, PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers can be authenticated using the trust anchors notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-020" markdown>
<div class="eudi-hlr__id">AS-MS-31-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_03a
{: .eudi-hlr__meta }

A Provider of registration certificates SHALL ensure that the registration certificates it issues to Relying Parties, PID Providers, QEAA Providers, PuB-EAA Providers, and non-qualified EAA Providers can be authenticated using the trust anchors notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-021" markdown>
<div class="eudi-hlr__id">AS-MS-31-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_03b
{: .eudi-hlr__meta }

Access Certificate Authorities or Providers of registration certificates SHALL ensure that all lists used to revoke their access certificates and registration certificates can be authenticated using the trust anchors for revocation lists notified to the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-022" markdown>
<div class="eudi-hlr__id">AS-MS-31-022<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_04
{: .eudi-hlr__meta }

The trust anchors of Access Certificate Authorities and Providers of registration certificates, as well as their CRL trust anchors, SHALL be accepted because of their secure notification by the Member States to the Commission and by their publication in the corresponding Commission-compiled LoTEs, which are signed or sealed by the Commission.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-023" markdown>
<div class="eudi-hlr__id">AS-MS-31-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_05
{: .eudi-hlr__meta }

The format of a LoTE for Access Certificate Authorities SHALL comply with [ETSI TS 119 602], including Annex F.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-024" markdown>
<div class="eudi-hlr__id">AS-MS-31-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_05a
{: .eudi-hlr__meta }

The format of a LoTE for Providers of registration certificates SHALL comply with [ETSI TS 119 602], including Annex G.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-026" markdown>
<div class="eudi-hlr__id">AS-MS-31-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_07
{: .eudi-hlr__meta }

If a Provider of registration certificates is suspended or cancelled (see requirement GenNot_05 above), that Provider SHALL immediately revoke all of its valid registration certificates (if any). Moreover, the corresponding Registrar SHALL prohibit all access to the registry entries published online per Reg_03 and Reg_04.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-027" markdown>
<div class="eudi-hlr__id">AS-MS-31-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_07
{: .eudi-hlr__meta }

The Commission SHALL publish in the OJEU the trust anchors to be used for verifying the signature or seal mentioned in TLPub_05.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-55-001" markdown>
<div class="eudi-hlr__id">AS-MS-55-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CT_01
{: .eudi-hlr__meta }

An Access CA issuing access certificates SHALL register these in a CT log according to RFC 9162, if such a log is available for access certificates.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-55-002" markdown>
<div class="eudi-hlr__id">AS-MS-55-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CT_02
{: .eudi-hlr__meta }

An Access CA issuing access certificates SHALL describe in its CPS how it logs all access certificates.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-55-003" markdown>
<div class="eudi-hlr__id">AS-MS-55-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CT_03
{: .eudi-hlr__meta }

In case a CT log provider for access certificates is available, all Access CAs SHALL act as monitors in the CT ecosystem. Access CAs SHOULD still monitor the CT logs in situations of temporary unavailability.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-55-004" markdown>
<div class="eudi-hlr__id">AS-MS-55-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CT_04
{: .eudi-hlr__meta }

An Access CA SHALL include at least one Signed Certificate Timestamp (SCT) in each access certificate.

</div>
</div>


<div class="eudi-hlr" id="AS-MS-55-005" markdown>
<div class="eudi-hlr__id">AS-MS-55-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CT_05
{: .eudi-hlr__meta }

When verifying an access certificate during PID or attestation issuance or presentation, a Wallet Unit SHALL also verify that the access certificate includes at least one valid Signed Certificate Timestamp (SCT).

</div>
</div>


<div class="eudi-hlr" id="AS-MS-55-006" markdown>
<div class="eudi-hlr__id">AS-MS-55-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: CT_06
{: .eudi-hlr__meta }

If an access certificate does not include a valid SCT, a Wallet Unit SHALL handle this as a failure or Relying Party authentication, in compliance with all requirements in [Topic 6][topic-6]] and in particular requirement RPA_06a.

</div>
</div>


---

### 3. Attestation & PID Providers

*These requirements are for the organizations that issue digital credentials to*
*the wallet. This includes requirements for identity verification, issuance*
*protocols, data formats, and revocation policies.*

<div class="eudi-hlr" id="AS-AP-07-001" markdown>
<div class="eudi-hlr__id">AS-AP-07-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_01
{: .eudi-hlr__meta }

A PID Provider, QEAA Provider, or PuB-EAA Provider SHALL use one of the following methods for revocation of an [ISO/IEC 18013-5]-compliant PID, QEAA, or PuB-EAA: - Only issue short-lived attestations having a validity period of 24 hours or less, such that revocation will never be necessary, - Use an Attestation Status List mechanism specified per VCR_11, or - Use an Attestation Revocation List mechanism specified per VCR_11.

*Note: The 24-hour period originates from [ETSI EN 319 411-1] V1.4.1, requirement REV-6.2.4-03A. This requires that the process of revocation must take at most 24 hours. Consequently, revocation may make no sense if the attestation is valid for less than 24 hours, because it may reach the end of its validity period before it is revoked.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-002" markdown>
<div class="eudi-hlr__id">AS-AP-07-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_01a
{: .eudi-hlr__meta }

A Wallet Provider SHALL use the method specified in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md) for maintaining the revocation status of the underlying objects referenced in a WIA or key attestation.

*Note: The 'underlying object' is the object that is actually revoked by revoking the WIA or key attestation, i.e., the Wallet Instance in case of a WIA and a WSCA/WSCD or keystore in case of a key attestation.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-003" markdown>
<div class="eudi-hlr__id">AS-AP-07-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_01b
{: .eudi-hlr__meta }

A PID Provider, QEAA Provider, or PuB-EAA Provider SHALL use one of the following methods for revocation of a [SD-JWT VC]-compliant PID, QEAA, or PuB-EAA: - Only issue short-lived attestations having a validity period of 24 hours or less, such that revocation will never be necessary or, - Use an Attestation Status List mechanism specified per VCR_11.

*Note: The 24-hour period originates from [ETSI EN 319 411-1] V1.4.1, requirement REV-6.2.4-03A. This requires that the process of revocation must take at most 24 hours. Consequently, revocation may make no sense if the attestation is valid for less than 24 hours, because it may reach the end of its validity period before it is revoked.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-004" markdown>
<div class="eudi-hlr__id">AS-AP-07-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_02
{: .eudi-hlr__meta }

For non-qualified EAAs, the relevant Rulebook SHALL specify whether that type of EAA must be revocable. If a non-qualified EAA type must be revocable, the relevant Rulebook SHALL determine which of the methods mentioned in VCR_01 or VCR_01b (as applicable) must be implemented by the relevant EAA Providers for the revocation of such an EAA.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-005" markdown>
<div class="eudi-hlr__id">AS-AP-07-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_03
{: .eudi-hlr__meta }

If a PID or attestation is revocable, the PID Provider of a given PID, or the Attestation Provider of a given attestation, SHALL be the only party in the EUDI Wallet ecosystem responsible for executing the revocation of that PID or attestation.

*Note: A PID Provider or Attestation Provider MAY outsource the operation of the revocation process to a third party.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-006" markdown>
<div class="eudi-hlr__id">AS-AP-07-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_03a
{: .eudi-hlr__meta }

The Wallet Provider of a given WIA or KA SHALL be the only party in the EUDI Wallet ecosystem responsible for maintaining the revocation status of the underlying object attested in that WIA or KA.

*Note: A Wallet Provider MAY outsource the operation of the revocation process to a third party.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-007" markdown>
<div class="eudi-hlr__id">AS-AP-07-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_04
{: .eudi-hlr__meta }

A PID Provider, Attestation Provider, or Wallet Provider that revoked a PID, attestation, WIA, or KA SHALL NOT reverse the revocation.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-008" markdown>
<div class="eudi-hlr__id">AS-AP-07-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_05
{: .eudi-hlr__meta }

If a PID, attestation, WIA, or KA is revocable, the PID Provider, Attestation Provider, or Wallet Provider SHALL have a policy specifying under which conditions a PID, attestation, WIA, or KA it issued will be revoked.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-009" markdown>
<div class="eudi-hlr__id">AS-AP-07-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_06
{: .eudi-hlr__meta }

If a PID or attestation is revocable, the PID Provider or Attestation Provider SHALL revoke a PID or attestation when its security has been compromised.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-010" markdown>
<div class="eudi-hlr__id">AS-AP-07-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_07
{: .eudi-hlr__meta }

A Wallet Provider SHALL revoke the Wallet Instance upon the explicit request of the User to revoke their Wallet Unit.

*Note: See also WURevocation_07 and _10.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-011" markdown>
<div class="eudi-hlr__id">AS-AP-07-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_07a
{: .eudi-hlr__meta }

If a PID is revocable, the PID Provider SHALL revoke that PID upon the explicit request of the User to whom the PID was issued.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-012" markdown>
<div class="eudi-hlr__id">AS-AP-07-012<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_07b
{: .eudi-hlr__meta }

If an attestation is revocable, the Attestation Provider SHOULD revoke that attestation upon the explicit request of the User to whom the attestation was issued.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-013" markdown>
<div class="eudi-hlr__id">AS-AP-07-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_07c
{: .eudi-hlr__meta }

If a PID is revocable, the PID Provider SHALL revoke that PID if the Wallet Unit on which it resides is revoked, in compliance with requirement WURevocation_18 in [Topic 38][topic-38].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-014" markdown>
<div class="eudi-hlr__id">AS-AP-07-014<span class="kw-may">MAY</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_07d
{: .eudi-hlr__meta }

If an attestation is revocable, the Attestation Provider MAY revoke that attestation if the Wallet Unit on which it resides is revoked, in compliance with requirement WURevocation_19 in [Topic 38][topic-38].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-015" markdown>
<div class="eudi-hlr__id">AS-AP-07-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_07e
{: .eudi-hlr__meta }

If a Wallet Provider uses the per-KA approach for key attestation revocation (see WUA_28), it SHALL revoke a WSCD or keystore upon the explicit request of the User to revoke their WSCD or keystore.

*Note: a) The most likely cause of such a request would be that the WSCD or keystore is a local external smart card and the User lost their WSCD or keystore. b) In contrast, under the type-shared index approach (see WUA_28), revoking the WSCD or keystore is not a per-Wallet Unit action that can be triggered by user requests. c) See also WURevocation_07a.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-016" markdown>
<div class="eudi-hlr__id">AS-AP-07-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_08
{: .eudi-hlr__meta }

If a PID is revocable, the PID Provider SHALL revoke a PID upon the death of the natural person who is the subject of the PID.

*Note: a) In addition, in these circumstances the PID Provider also requests the Wallet Provider to revoke the Wallet Unit, see WURevocation_11. b) The topic of Wallet Units for legal persons, possibly containing a legal-person PID, has has been removed from this ARF in view of the development of a separate business wallet.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-017" markdown>
<div class="eudi-hlr__id">AS-AP-07-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_09
{: .eudi-hlr__meta }

If a technical PID or attestation is revocable, the PID Provider or Attestation Provider SHALL revoke that PID or attestation if the value of one or more of the attributes in the corresponding logical PID or attestation was changed (including attributes being added or deleted) and the technical PID or attestation is still valid for at least 24 hours. Subsequently, if the User's contact details are known, the PID Provider or Attestation Provider SHOULD, via an out-of-band manner, notify the User about the revocation and ask the User to request re-issuance of the PID or attestation using their Wallet Unit.

*Note: If the value of the attributes is determined by a party different from the PID Provider or Attestation Provider, such as an Authentic Source, the Provider is responsible for ensuring that this third party notifies them about such changes.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-018" markdown>
<div class="eudi-hlr__id">AS-AP-07-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_10
{: .eudi-hlr__meta }

Wallet Providers SHALL implement the Attestation Status List and Attestation Revocation List mechanisms specified per VCR_11 in their Wallet Solutions.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-019" markdown>
<div class="eudi-hlr__id">AS-AP-07-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_11
{: .eudi-hlr__meta }

For [ISO/IEC 18013-5]-compliant PIDs and attestations, the PID Provider or Attestation Provider SHALL implement the Attestation Status List or Attestation Revocation List mechanism as specified in Annex 2 of (the amended) CIR [2024/2979).

*Note: a) 'Attestation Status List' and 'Attestation Revocation List' are specific mechanisms, these terms are defined in Annex 1. b) Attestation Revocation Lists are sometimes referred to as 'Identifier Lists'. c) The relevant texts in this CIR are copied from the forthcoming 2nd edition of ISO/IEC 18013-5, available [here](https://github.com/ISOWG10/ISO-18013/tree/main/Working%20Documents).*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-020" markdown>
<div class="eudi-hlr__id">AS-AP-07-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_11a
{: .eudi-hlr__meta }

For [SD-JWT VC]-compliant PIDs and attestations, the PID Provider or Attestation Provider SHALL implement the Attestation Status List mechanism as specified in [Token Status List].

*Note: No suitable specification of Attestation Revocation Lists in JSON format is available.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-021" markdown>
<div class="eudi-hlr__id">AS-AP-07-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_12
{: .eudi-hlr__meta }

If a Relying Party decides it needs to be able to verify the revocation status of PIDs or attestations, it SHALL support both the Attestation Status List mechanism and the Attestation Revocation List mechanism specified per VCR_11.

*Note: Per VCR_13, it is recommended but not mandatory for a Relying Party to verify whether a PID or attestation is revoked.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-022" markdown>
<div class="eudi-hlr__id">AS-AP-07-022<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_12a
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL support the mechanism specified per VCR_01a for verifying the revocation status of a WIA or KA.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-023" markdown>
<div class="eudi-hlr__id">AS-AP-07-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_13
{: .eudi-hlr__meta }

A Relying Party Instance SHOULD verify the revocation status of a revocable PID or attestation upon obtaining it from a Wallet Unit. When a Relying Party considers deviating from this recommendation by not performing revocation checking, it SHALL perform a risk analysis considering all relevant factors for the use case, including risks to the User, the PID Provider or Attestation Provider, and risks to the Relying Party itself.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-024" markdown>
<div class="eudi-hlr__id">AS-AP-07-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_14
{: .eudi-hlr__meta }

A Relying Party SHALL perform a risk analysis considering all relevant factors for the use case, including risks to the User and risks to the Relying Party itself, to determine whether it will accept or refuse a PID or attestation in case no reliable information regarding the revocation status of that PID or attestation is available.

*Note: Examples of conditions under which no reliable revocation information is available are 1) The attestation does not contain revocation information (because it is not revocable). 2) The Relying Party Instance is offline and any cached status information is no longer valid. 3) The latest attestation status lists or attestation identifier lists provided by the PID Provider or Attestation Provider (i.e., available online) are no longer valid. 4) The Relying Party Instance is offline, but the use case requires up-to-date revocation information (instead of trusting cached information that is still valid.)*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-025" markdown>
<div class="eudi-hlr__id">AS-AP-07-025<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_15
{: .eudi-hlr__meta }

A Relying Party Instance SHOULD NOT request the relevant Attestation Status List or Attestation Revocation List each time an attestation is presented to it by a Wallet Unit. Rather, the Relying Party operating the Relying Party Instance SHOULD download each new version of the list once, at a time and from a location unrelated to the presentation of a PID or attestation by a User. The Relying Party SHOULD then distribute the list to all of its Relying Party Instances, using an Relying Party-internal distribution mechanism. Each Relying Party Instance SHOULD cache the list, so that it can perform revocation checks without making an online request. The Relying Party SHOULD perform a risk analysis to determine the frequency with which it will download the revocation lists and the maximum caching period its Relying Party Instances will use.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-026" markdown>
<div class="eudi-hlr__id">AS-AP-07-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_16
{: .eudi-hlr__meta }

A PID Provider, Attestation Provider or Wallet Provider SHALL NOT require the Relying Party or Relying Party Instance to authenticate itself before downloading an Attestation Status List or Attestation Revocation List.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-027" markdown>
<div class="eudi-hlr__id">AS-AP-07-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_17
{: .eudi-hlr__meta }

When using an Attestation Status List for revocation, the PID Provider, Attestation Provider or Wallet Provider SHALL randomly assign the index for each PID or attestation, to prevent this index from becoming a correlator.

*Note: Randomly assigning indices within a bitstring or byte array is more complicated than creating random identifiers (e.g. serial numbers) for attestations, as is needed for an Attestation Revocation List. This is because duplicate indices and unnecessarily long bitstrings or byte arrays must be prevented.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-028" markdown>
<div class="eudi-hlr__id">AS-AP-07-028<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_18
{: .eudi-hlr__meta }

When using an Attestation Status List for revocation, the PID Provider, Attestation Provider, or Wallet Provider SHALL represent a sufficiently large number of PIDs, attestations, WIAs, or KAs on each Attestation Status List to ensure herd privacy.

*Note: In this context, herd privacy means that if an entity requests a particular status list, the PID Provider, Attestation Provider, or Wallet Provider is not able to deduce which PID, attestation, WIA, or KA (likely) was presented to that entity. Complying with this requirement may be difficult in case the number of PIDs, attestations, WIAs, or KAs to be represented on the list is small. In such a case, decoy entries can be added to the list to obfuscate the real number of referenced PIDs, attestations, WIAs, or KAs.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-07-029" markdown>
<div class="eudi-hlr__id">AS-AP-07-029<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: VCR_19
{: .eudi-hlr__meta }

A Wallet Instance SHOULD regularly check the revocation status of its PIDs and attestations. In addition, the Wallet Instance SHOULD regularly check whether itself or any WSCD or keystore it uses has been revoked. In case of any revocation, the Wallet Instance SHALL notify the User accordingly.

*Note: A Wallet Instance can check its own revocation status using its WIAs, and the revocation status of its WSCD and keystores using its key attestations.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-001" markdown>
<div class="eudi-hlr__id">AS-AP-10-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_01a
{: .eudi-hlr__meta }

PID Providers and Attestation Providers SHALL support the OpenID4VCI protocol specified in [OpenID4VCI], as profiled in Sections 4 and 6 of [HAIP], and with additions and changes as documented in this Annex (see e.g. this Topic and [Topic 9][topic-9]) and in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).

*Note: a) For clarity: in [HAIP] v1.0, Section 6 implies that PID Providers and Attestation Providers must comply with the applicable requirements in [OpenID4VCI] Annex A.2 when issuing an attestation in ISO/IEC 18013-5-compliant format, and with the applicable requirements in [OpenID4VCI] Annex A.3 when issuing an attestation in SD-JWT VC format. b) In addition to supporting [OpenID4VCI], PID Providers are allowed to support other protocols for issuing PIDs to (national) Wallet Units, provided these protocols comply with all relevant requirements in the Implementing Acts and the standards referenced therein. In many Member States, the PID Provider and the Wallet Provider are closely related, and can therefore bilaterally agree to support a different protocol for PID issuance. *

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-002" markdown>
<div class="eudi-hlr__id">AS-AP-10-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_02
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that their Wallet Solution supports the attestation formats specified in ISO/IEC 18013-5, see [ISO/IEC 18013-5], and in SD-JWT-based Verifiable Credentials (SD-JWT VC), see [SD-JWT VC], with additions and changes as documented in this Annex and in [ETSI TS 119 472-1].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-003" markdown>
<div class="eudi-hlr__id">AS-AP-10-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_03
{: .eudi-hlr__meta }

Wallet Units, PID Providers, and Attestation Providers SHALL support the [W3C Digital Credentials API](https://wicg.github.io/digital-credentials/) for the issuance of PIDs and attestations.

*Note: This requirement implies that the following conditions will be satisfied: a) the DC API specification will become a W3C Recommendation, b) this specification will comply with the principles outlined in [Section 4.4.3.1][4431-introduction] of the ARF main document, c) this specification will be broadly supported by relevant browsers and operating systems, and d) the [OpenID4VCI] standard will specify how to use OpenID4VCI with the DC API.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-004" markdown>
<div class="eudi-hlr__id">AS-AP-10-004</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_04
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-005" markdown>
<div class="eudi-hlr__id">AS-AP-10-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_05
{: .eudi-hlr__meta }

A Wallet Unit SHALL support a process to activate a newly issued PID, in accordance with the requirements for LoA High in [Commission Implementing Regulation (EU) 2015/1502](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R1502) Section 2.2.2. The Wallet Unit SHALL NOT allow a User to use a non-activated PID.

*Note: a) The goal of the activation process is to verify that the PID was delivered into the Wallet Unit and WSCA/WSCD of the User who is the subject of the PID. b) This requirement is not applicable for QEAAs, PuB-EAAs or non-qualified EAAs, since these are not identity means in the sense of Commission Implementing Regulation (EU) 2015/1502.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-006" markdown>
<div class="eudi-hlr__id">AS-AP-10-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_06
{: .eudi-hlr__meta }

After a Wallet Unit receives a PID or an attestation from a PID Provider or Attestation Provider, it SHALL verify that the PID or attestation it received matches the PID or attestation requested by the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-007" markdown>
<div class="eudi-hlr__id">AS-AP-10-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_07
{: .eudi-hlr__meta }

After a Wallet Unit receives a PID from a PID Provider, it SHALL validate the signature of the PID using a trust anchor of the PID Provider provided in a LoTE made available in accordance with [Topic 31][topic-31]].

*Note: The Wallet Provider and PID Provider may be the same entity. In such a case, the remote WSCD used by the Wallet Provider may be the same hardware HSM that is also used by the PID Provider to sign PIDs. In such a situation, this requirement may look superfluous, since the same HSM would generate the signature and verify it. However, this is not true, since for security reasons the PID Provider and Wallet Provider must use proper partitioning and logical key segregation within the HSM. Therefore, this requirement also applies in such a situation.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-008" markdown>
<div class="eudi-hlr__id">AS-AP-10-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_08
{: .eudi-hlr__meta }

After a Wallet Unit receives a QEAA from a QEAA Provider, it SHALL validate the qualified signature of the QEAA in accordance with Art. 32 of the [European Digital Identity Regulation]. For the verification, the Wallet Unit SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation].

*Note: a) Requirements ISSU_07 to ISSU_10 are equivalent to requirements OIA_12 to OIA_15 in [Topic 1][topic-1]. b) These requirements imply that a Wallet Unit must be aware whether the attestation it is requesting from an issuer is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. These requirements also imply that the Wallet Unit must store trust anchors in such a way that, when it receives an issued attestation, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-009" markdown>
<div class="eudi-hlr__id">AS-AP-10-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_09
{: .eudi-hlr__meta }

After a Wallet Unit receives a PuB-EAA from a PUB-EAA Provider, it SHALL validate the signature of a PuB-EAA using a trust anchor provided in a Pub-EAA Provider LoTE made available in accordance with [[Topic 31][topic-31]].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-010" markdown>
<div class="eudi-hlr__id">AS-AP-10-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_10
{: .eudi-hlr__meta }

After a Wallet Unit receives a non-qualified EAA from an EAA Provider, it SHALL validate the signature of the EAA if it has access to the trust anchors of the EAA Provider.

*Note: For a non-qualified EAA, an Attestation Rulebook may be available, see [[Topic 12][topic-12]], explaining how EAA Providers distribute their trust anchors. However, it is not required for Wallet Units to be in possession of the trust anchors of all non-qualified EAA Providers, even when an Attestation Rulebook is available.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-011" markdown>
<div class="eudi-hlr__id">AS-AP-10-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_10a
{: .eudi-hlr__meta }

A Wallet Provider SHALL perform regular trust anchor management, meaning it SHALL download the latest version of all applicable Trusted Lists and LoTEs. If it finds that new trusted entities have been added, or that new trust anchors have been added for existing trusted entities, it SHALL ensure that these trust anchors are properly stored in all relevant Wallet Units. Conversely, if the Wallet Provider finds that an existing trusted entity has been invalidated in the Trusted List or LoTE, or that some of the trust anchors of existing trusted entities have expired, been revoked, or otherwise been invalidated, it SHALL ensure that these trust anchors are removed from all Wallet Units.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-012" markdown>
<div class="eudi-hlr__id">AS-AP-10-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_10b
{: .eudi-hlr__meta }

For the retrieval and management of trust anchors, Wallet Providers and Wallet Units SHALL support both Trusted Lists complying with [ETSI TS 119 612] and LoTEs complying with [ETSI TS 119 602].

*Note: Trusted Lists complying with [ETSI TS 119 612] are used for the distribution of trust anchors of QEAA Providers. LoTEs complying with [ETSI TS 119 602] are used for the distribution of trust anchors of PID Providers, PuB-EAA Providers, Access Certificate Authorities, and Providers of registration certificates.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-013" markdown>
<div class="eudi-hlr__id">AS-AP-10-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_11
{: .eudi-hlr__meta }

A Wallet Unit SHALL request the User's approval before storing a PID or attestation obtained from a PID Provider or Attestation Provider. When requesting approval, the Wallet Instance SHALL display the contents of the PID or attestation to the User. The Wallet Instance SHALL also inform the User about the identity of the PID Provider or Attestation Provider, using the subject information in the PID Provider's or Attestation Provider's access certificate.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-014" markdown>
<div class="eudi-hlr__id">AS-AP-10-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_11a
{: .eudi-hlr__meta }

In case a PID or attestation is issued in batches, the Wallet Unit SHALL verify that all PIDs and attestations in a batch have the same attribute values and the same technical validity period.

*Note: PIDs and attestations are issued in batches when Method A, Method B, or Method D is used, see ISSU_37, ISSU_43, ISSU_51.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-015" markdown>
<div class="eudi-hlr__id">AS-AP-10-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_11b
{: .eudi-hlr__meta }

In case one or more of the verifications in ISSU_06 - ISSU_11a fail, the Wallet Unit SHALL immediately delete the PID or attestation it received. The Wallet Instance SHALL notify the User about the fact that issuance of the PID or attestation was not successful, including the reason for this failure.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-016" markdown>
<div class="eudi-hlr__id">AS-AP-10-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_12
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL offer its PIDs or attestations in all formats required in the PID Rulebook or the applicable Attestation Rulebook, see [Topic 12][topic-12]].

*Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT VC-format specified in [SD-JWT VC].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-017" markdown>
<div class="eudi-hlr__id">AS-AP-10-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_12a
{: .eudi-hlr__meta }

When a User instructs their Wallet Unit to request a PID or attestation from a PID Provider or Attestation Provider, the Wallet Unit SHALL request that PID or attestation in all formats offered by the PID Provider or Attestation Provider.

*Note: Examples include the mdoc format specified in [ISO/IEC 18013-5] and the SD-JWT VC-format specified in [SD-JWT VC].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-018" markdown>
<div class="eudi-hlr__id">AS-AP-10-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_12b
{: .eudi-hlr__meta }

The WSCA/WSCD or a keystore SHALL generate a new key pair for a new PID or attestation on request of the Wallet Instance, unless that PID or attestation is issued synchronously in a remote HSM architecture. This generation request MAY be done either prior to the issuance of any PID or attestation, or during the issuance process.

*Note: a) See also WUA_05 and WUA_05a. b) In case of synchronous issuing in a remote HSM architecture, re-use of an existing key pair within a limited period of time can be acceptable, based on the PID Provider's or Attestation Provider's issuance security policy. This is similar to a choice between Method A or Method B (see ISSU_37 and ISSU_38) when issuing PIDs or attestations non-synchronously.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-019" markdown>
<div class="eudi-hlr__id">AS-AP-10-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_12c
{: .eudi-hlr__meta }

The expiration date of a PID SHALL be no later than the end of the revocation maintenance periods of the WIA and the KA presented as part of the PID issuance process.

*Note: This requirement is an implication of WURevocation_18 in [Topic 38][topic-38] and WUA_29 - WUA_31. If the PID would be valid beyond the period for which the Wallet Provider has committed to maintaining the revocation status of the Wallet Instance and the WSCD, the PID Provider would not be able to fulfil its obligation to regularly check whether the Wallet Instance and WSCD have been revoked for the full PID validity period.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-020" markdown>
<div class="eudi-hlr__id">AS-AP-10-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_12d
{: .eudi-hlr__meta }

If an Attestation Provider supports revocation chaining for its attestations per WURevocation_19 in [Topic 38][topic-38], the expiration date of an attestation SHALL be no later than the end of the revocation maintenance periods of the WIA and the KA (if applicable) presented as part of the attestation issuance process.

*Note: See note in ISSU_12c.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-021" markdown>
<div class="eudi-hlr__id">AS-AP-10-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_13
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that at least one PID Provider is willing to issue a PID complying with [PID Rulebook][pid-rulebook] to Users of the Wallet Units it provides.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-022" markdown>
<div class="eudi-hlr__id">AS-AP-10-022<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_14
{: .eudi-hlr__meta }

A PID Provider SHALL ensure that all PIDs it issues to Wallet Units comply with the requirements specified in [PID Rulebook][pid-rulebook].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-023" markdown>
<div class="eudi-hlr__id">AS-AP-10-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_15
{: .eudi-hlr__meta }

A PID Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing PIDs.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-024" markdown>
<div class="eudi-hlr__id">AS-AP-10-024</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_16
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-025" markdown>
<div class="eudi-hlr__id">AS-AP-10-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_17
{: .eudi-hlr__meta }

A PID Provider SHALL implement device binding for all PIDs it issues, meaning it SHALL ensure that a PID is cryptographically bound to the WSCA/WSCD included in the Wallet Unit, as specified in [Topic 9][topic-9].

*Note: Device binding is called 'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT VC].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-026" markdown>
<div class="eudi-hlr__id">AS-AP-10-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_18
{: .eudi-hlr__meta }

A PID Provider SHALL verify the identity of the subject of the PID in compliance with Level of Assurance (LoA) High requirements.

*Note: These requirements will be determined by the relevant eID scheme.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-027" markdown>
<div class="eudi-hlr__id">AS-AP-10-027</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_18a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-028" markdown>
<div class="eudi-hlr__id">AS-AP-10-028<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_19
{: .eudi-hlr__meta }

For the verification of a WIA or KA, a PID Provider SHALL accept the Wallet Provider trust anchors it needs, as published by the Commission in the Wallet Provider LoTE.

*Note: a) The Wallet Provider LoTE is explained in [Topic 31][topic-31]. b) It is not mandatory for a PID Provider to store all Wallet Provider trust anchors. This is because it is not mandatory for a PID Provider to accept all certified Wallet Solutions in the EUDI Wallet ecosystem. Each PID Provider will choose which trust anchors they need to use.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-029" markdown>
<div class="eudi-hlr__id">AS-AP-10-029<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_19a
{: .eudi-hlr__meta }

A PID Provider SHALL support all Wallet Solutions recognised under the corresponding notified eID scheme, meaning that it is willing and able to issue a PID to a Wallet Unit on request of the User.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-030" markdown>
<div class="eudi-hlr__id">AS-AP-10-030<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_19b
{: .eudi-hlr__meta }

For the retrieval and management of trust anchors, PID Providers SHALL support LoTEs complying with [ETSI TS 119 602].

*Note: LoTEs complying with [ETSI TS 119 602] are used for the distribution of trust anchors of Wallet Providers.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-031" markdown>
<div class="eudi-hlr__id">AS-AP-10-031<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_20
{: .eudi-hlr__meta }

To inform its potential PID subjects about the Wallet Solution(s) they can use for requesting a PID, a PID Provider SHALL publish a list of supported Wallet Solutions in such a way that it can be easily found, for example on the PID Provider's website.

*Note: This a policy requirement rather than a technical requirement.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-032" markdown>
<div class="eudi-hlr__id">AS-AP-10-032<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_21
{: .eudi-hlr__meta }

Before issuing a PID, a PID Provider SHALL verify the Wallet Unit's WIA and KA using a trust anchor registered in the Wallet Provider LoTE. Moreover, it SHALL verify that the Wallet Instance referenced in the WIA has not been revoked, and that the WSCD referenced in the KA has not been revoked.

*Note: a) For WIAs and KAs, see [Topic 9][topic-9] and [Topic 38][topic-38]. b) [CIR 2024/2977], Article 3 (9), also allows another authentication mechanism in accordance with an electronic identity scheme notified at assurance level high. However, the ARF does not further specify such other authentication mechanisms, which means that in general they will not be interoperable.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-033" markdown>
<div class="eudi-hlr__id">AS-AP-10-033<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_22
{: .eudi-hlr__meta }

A PID Provider SHALL sign its Credential Issuer metadata as specified in section 12.2.3 of [OpenID4VCI]. To do so, the PID Provider SHALL use the private key corresponding to the public key in its access certificate. The PID Provider SHALL include its access certificate, as well as all intermediate certificate(s) leading up to the trust anchor of the corresponding Access Certificate Authority (see ISSU_33) in the LoTE, in the `x5c` parameter in the JOSE header of the JSON Web Signature for the metadata.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-034" markdown>
<div class="eudi-hlr__id">AS-AP-10-034</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_22a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-035" markdown>
<div class="eudi-hlr__id">AS-AP-10-035</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_22b
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-036" markdown>
<div class="eudi-hlr__id">AS-AP-10-036<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_23
{: .eudi-hlr__meta }

For the verification of a PID Provider's access certificates, a Wallet Unit SHALL accept all Access Certificate Authorities trust anchors published by the Commission in the relevant LoTE, and only those.

*Note: a) Access Certificate Authority LoTEs are explained in [[Topic 27][topic-27]]. b) A Wallet Unit does not have to be able to request a PID from all PID Providers in the ecosystem. It is up to each Wallet Provider to decide which PID Providers its Wallet Units will support.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-037" markdown>
<div class="eudi-hlr__id">AS-AP-10-037<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_23a
{: .eudi-hlr__meta }

A Wallet Provider SHALL support at least one PID Provider, meaning that its Wallet Units SHALL be capable of requesting the issuance of a PID from these PID Provider(s), and that the Wallet Provider has agreed with the PID Provider(s) that the PID Provider(s) will process such a request according to the agreed rules and procedures.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-038" markdown>
<div class="eudi-hlr__id">AS-AP-10-038<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_23b
{: .eudi-hlr__meta }

Prior to or during installation of a Wallet Instance, the Wallet Provider SHALL notify the User about the PID Provider(s) that are supported by the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-039" markdown>
<div class="eudi-hlr__id">AS-AP-10-039<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_23c
{: .eudi-hlr__meta }

For the verification of a PID Provider's registration certificates, a Wallet Unit SHALL accept the trust anchors of all Providers of registration certificates published by the Commission in the relevant LoTE, and only those.

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-040" markdown>
<div class="eudi-hlr__id">AS-AP-10-040<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_24
{: .eudi-hlr__meta }

A Wallet Unit SHALL authenticate and validate the access certificate of the PID Provider before requesting the issuance of a PID. The Wallet Unit SHALL verify that the access certificate is authentic and is valid at the time of validation, and that the issuer of the access certificate is included in an Access Certificate Authority LoTE.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-041" markdown>
<div class="eudi-hlr__id">AS-AP-10-041<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_24a
{: .eudi-hlr__meta }

Before requesting the issuance of a PID, the Wallet Unit SHALL verify that the PID Provider is indeed a registered PID Provider. To do so, the Wallet Unit SHALL inspect the `entitlement` member in the registration certificate of the PID Provider, provided in the Credential Issuer Metadata per [ETSI TS 119 472-3] section 4.2.3, and verify the authenticity of the registration certificate. If this procedure does not confirm that the PID Provider is indeed registered as a PID Provider, the Wallet Unit SHALL display a warning to the User, and SHALL NOT request the issuance of a PID.

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-042" markdown>
<div class="eudi-hlr__id">AS-AP-10-042<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_24b
{: .eudi-hlr__meta }

Before requesting the issuance of a PID, the Wallet Unit SHALL verify whether the PID Provider properly registered for the issuance of PIDs. To do so, the Wallet Unit SHALL inspect the `providesAttestations` member in the registration certificate of the PID Provider, provided in the Credential Issuer Metadata per [ETSI TS 119 472-3] section 4.2.3, and verify the authenticity of the registration certificate. If this procedure does not confirm that the PID Provider registered for the issuance of PIDs, the Wallet Unit SHALL display a warning to the User, and SHALL NOT request the issuance of a PID.

*Note: a) It may be argued that this verification is superfluous, since an entity registered as a PID Provider (ISSU_24a) by definition is registered for issuing PIDs. However, this verification was added to ensure that Wallet Unit can use the same verification process for PIDs as for other attestations (see ISSU_34b), as well as to ensure that in the future, it is possible to distinguish between different types of PID if needed, where not all PID Providers are registered to issue all types of PID. b) The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-043" markdown>
<div class="eudi-hlr__id">AS-AP-10-043<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_25
{: .eudi-hlr__meta }

An Attestation Provider SHALL ensure all attestations issued to Wallet Units comply with the requirements specified in the applicable Attestation Rulebook, as described in [Topic 12][topic-12]].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-044" markdown>
<div class="eudi-hlr__id">AS-AP-10-044<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_26
{: .eudi-hlr__meta }

An Attestation Provider SHALL support the OpenID4VCI protocol referenced in ISSU_01 for issuing attestations.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-045" markdown>
<div class="eudi-hlr__id">AS-AP-10-045<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_27
{: .eudi-hlr__meta }

An Attestation Provider SHOULD implement device binding for all attestations it issues. If an issued attestation is device-bound, the Attestation Provider SHALL ensure that the attestation is cryptographically bound to a WSCA/WSCD or a keystore available to the Wallet Unit, as specified in [Topic 9][topic-9].

*Note: a) Device binding is called 'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT VC]. b) Implementing mdoc authentication is mandatory in [ISO/IEC 18013-5] and therefore, it is mandatory for attestations complying with that standard. c) See ISSU_27d.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-046" markdown>
<div class="eudi-hlr__id">AS-AP-10-046<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_27a
{: .eudi-hlr__meta }

If the subject of the attestation is a natural person, an Attestation Provider SHALL verify the identity of the subject of the attestation, in compliance with applicable requirements and in accordance with relevant standards or Implementing Regulations.

*Note: Not every attestation has a natural person as its subject. For example, a holiday voucher may be valid for any User that can present it to a Relying Party and therefore has no subject. This is comparable to the concept of a 'bearer token'.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-047" markdown>
<div class="eudi-hlr__id">AS-AP-10-047<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_27b
{: .eudi-hlr__meta }

If applicable, an Attestation Provider SHALL ensure that the attributes attested in the attestation issued are valid for the identified attestation subject.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-048" markdown>
<div class="eudi-hlr__id">AS-AP-10-048<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_27c
{: .eudi-hlr__meta }

The Attestation Provider SHALL verify that the User requesting the attestation has the right to receive it.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-049" markdown>
<div class="eudi-hlr__id">AS-AP-10-049<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_27d
{: .eudi-hlr__meta }

An Attestation Provider issuing device-bound attestations SHALL indicate the desired level of security for the private key storage and for User authentication in its Credential Issuer metadata, according to [OpenID4VCI] section 12.2.4 and Appendix D.2.

*Note: See also WIAM_14b, WIAM_14c, and WUA_05 and WUA_05a.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-050" markdown>
<div class="eudi-hlr__id">AS-AP-10-050<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_28
{: .eudi-hlr__meta }

For the verification of a WIA or KA, an Attestation Provider SHALL accept all Wallet Provider trust anchors published by the Commission in the relevant LoTE, and only those.

*Note: The Wallet Provider LoTE is explained in [Topic 31][topic-31].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-051" markdown>
<div class="eudi-hlr__id">AS-AP-10-051<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_28a
{: .eudi-hlr__meta }

For the retrieval and management of trust anchors, Attestation Providers SHALL support LoTEs complying with [ETSI TS 119 602].

*Note: LoTEs complying with [ETSI TS 119 602] are used for the distribution of trust anchors of Wallet Providers.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-052" markdown>
<div class="eudi-hlr__id">AS-AP-10-052<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_29
{: .eudi-hlr__meta }

A QEAA Provider or PuB-EAA Provider SHALL support all Wallet Solutions, except in case the attestation in question is a Strong User Authentication (SUA) attestation as meant in [Topic 20][topic-20] and the Wallet Provider does not support processing of the transactional data associated with the SUA attestation. Except for such cases, a QEAA Provider or PuB-EAA Provider SHALL NOT discriminate between Wallet Solutions when processing a request for the issuance of an attestation.

*Note: This requirement is not applicable for non-qualified EAA Providers. For example, a non-qualified EAA Provider may choose to issue attestations in the format specified in [W3C VCDM v2.0], see ARB_01a. In that case, it will support only those Wallet Solutions that have implemented this attestation format.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-053" markdown>
<div class="eudi-hlr__id">AS-AP-10-053<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_30
{: .eudi-hlr__meta }

Before issuing a device-bound attestation, an Attestation Provider SHALL verify the Wallet Unit's key attestation using a trust anchor registered in the Wallet Provider LoTE. Moreover, it SHALL verify that the WSCD or keystore referenced in the KA has not been revoked.

*Note: This requirement applies specifically to the KA received during device-bound attestation issuance. The corresponding requirement for verifying the WIA is ISSU_30a.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-054" markdown>
<div class="eudi-hlr__id">AS-AP-10-054<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_30a
{: .eudi-hlr__meta }

Before issuing an attestation, an Attestation Provider SHALL: - verify that the Wallet Provider mentioned in the Wallet Unit's WIA is present in the Wallet Provider LoTE. - authenticate and validate the WIA using the trust anchor(s) registered for the Wallet Provider in that LoTE.

*Note: This requirement applies to both device-bound and non-device-bound attestations*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-055" markdown>
<div class="eudi-hlr__id">AS-AP-10-055</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_31
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-056" markdown>
<div class="eudi-hlr__id">AS-AP-10-056<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_32
{: .eudi-hlr__meta }

An Attestation Provider SHALL sign its Credential Issuer metadata as specified in section 12.2.3 of [OpenID4VCI]. To do so, the Attestation Provider SHALL use the private key corresponding to the public key in its access certificate. The Attestation Provider SHALL include its access certificate, as well as all intermediate certificate(s) leading up to the trust anchor of the corresponding Access Certificate Authority in the LoTE (see ISSU_33), in the `x5c` parameter in the JOSE header of the JSON Web Signature for the metadata.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-057" markdown>
<div class="eudi-hlr__id">AS-AP-10-057</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_32a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-058" markdown>
<div class="eudi-hlr__id">AS-AP-10-058<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_33
{: .eudi-hlr__meta }

For the verification of access certificates, a Wallet Unit SHALL accept all trust anchors of Access Certificate Authorities, as published by the Commission in the relevant LoTE, and only those.

*Note: The Access Certificate Authority LoTE is explained in [[Topic 27][topic-27]].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-059" markdown>
<div class="eudi-hlr__id">AS-AP-10-059<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_33a
{: .eudi-hlr__meta }

For the verification of the registration certificates of Attestation Providers, a Wallet Unit SHALL accept all trust anchors of Providers of registration certificates, as published by the Commission in the relevant LoTE, and only those.

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-060" markdown>
<div class="eudi-hlr__id">AS-AP-10-060<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_33b
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that its Wallet Units support all attestations conforming to attestation schemes registered in the catalogue of schemes for the attestation of attributes established by the Commission pursuant to Article 8 of Commission Implementing Regulation (EU) 2025/1569, where such attestations use a format and issuance protocol supported by Wallet Units pursuant to Commission Implementing Regulations (EU) 2024/2977, 2024/2979 and 2024/2982. 

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-061" markdown>
<div class="eudi-hlr__id">AS-AP-10-061<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_34
{: .eudi-hlr__meta }

A Wallet Unit SHALL authenticate and validate the access certificate of the Attestation Provider before requesting the issuance of an attestation. The Wallet Unit SHALL verify that the access certificate is authentic and is valid at the time of validation, and that the issuer of the access certificate is in the Access Certificate Authority LoTE, as documented in [[Topic 27][topic-27]].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-062" markdown>
<div class="eudi-hlr__id">AS-AP-10-062<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_34a
{: .eudi-hlr__meta }

Before requesting the issuance of an attestation, the Wallet Unit SHALL verify that the Attestation Provider is a registered QEAA Provider, PuB-EAA Provider, or EAA Provider. To do so, the Wallet Unit SHALL inspect the `entitlement` member in the registration certificate of the Attestation Provider, provided in the Credential Issuer Metadata per [ETSI TS 119 472-3] section 4.2.3, and verify the authenticity of the registration certificate. If this procedure does not confirm that the Attestation Provider is indeed registered as a QEAA Provider, PuB-EAA Provider, or EAA Provider, the Wallet Unit SHALL display a warning to the User, and SHALL NOT request the issuance of an attestation.

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-063" markdown>
<div class="eudi-hlr__id">AS-AP-10-063<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_34b
{: .eudi-hlr__meta }

Before requesting the issuance of an attestation, the Wallet Unit SHALL verify whether the Provider properly registered for the issuance of the type of attestation that the User wants to obtain. To do so, the Wallet Unit SHALL inspect the `providesAttestations` member in the registration certificate of the Attestation Provider, provided in the Credential Issuer Metadata per [ETSI TS 119 472-3] section 4.2.3, and verify the authenticity of the registration certificate. If this procedure does not confirm that the Attestation Provider registered for the relevant type of attestation, the Wallet Unit SHALL display a warning to the User, and SHALL NOT request the issuance of an attestation. 

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-064" markdown>
<div class="eudi-hlr__id">AS-AP-10-064<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_35
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL ensure that all unique elements in a PID or attestation have a negligible chance of having the same value across all PIDs or attestations issued by that Provider. This SHALL include at least a) the salt used for hashing every attribute, b) the hash values of all attributes, c) the attestation identifier or index used for revocation purposes (if applicable), d) the attestation public key used for device binding (if applicable), and e) the value of the Attestation Provider signature.

*Note: a) The list of unique elements is based on [ISO/IEC 18013-5] and [SD-JWT VC]. b) This requirement can be achieved, for example, by ensuring that salt values, indexes and attestation identifiers are pseudo-random numbers generated by a cryptographically secure pseudo-random number generator (CSPRNG).*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-065" markdown>
<div class="eudi-hlr__id">AS-AP-10-065<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_35a
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that all unique elements in a WIA or KA have a negligible chance of having the same value across all WIAs and KAs issued by that Wallet Provider and intended to be presented to different PID Providers or Attestation Providers. This SHALL include at least a) the attestation index for revocation, unless the per-KA index approach meant in WUA_28 is used, b) the WIA or KA public key, and c) the value of the Wallet Provider signature over the WIA or KA.

*Note: In other words, the following do not have to be unique: i) WIAs presented to the same PID Provider or Attestation Provider, and ii) the revocation index in a KA under the type-shared index approach (see WUA_28). However, under the per-KA index approach (see WUA_28), the KA revocation index is unique per KA or per KA-issuer pair and is subject to this requirement.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-066" markdown>
<div class="eudi-hlr__id">AS-AP-10-066<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_35b
{: .eudi-hlr__meta }

After issuing a PID, attestation, KA, or WIA, a PID Provider, Attestation Provider or Wallet Provider SHALL discard the values of all unique elements, including at least the ones mentioned in requirement ISSU_35 or ISSU_35a (as applicable) above, as well as any timestamps, as soon as they are no longer needed. The Provider SHALL NOT communicate these values to any other party inside or outside the EUDI Wallet ecosystem.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-067" markdown>
<div class="eudi-hlr__id">AS-AP-10-067<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_36
{: .eudi-hlr__meta }

When issuing PIDs, attestations, or WIAs or KAs in a batch to a Wallet Unit, a PID Provider, Attestation Provider, or Wallet Provider SHALL ensure that the timestamps in these PIDs, attestations, or WIAs and KAs do not enable Relying Parties to conclude that they are part of the same batch (and therefore belong to the same User).

*Note: a) This can be done, for example, by making timestamps sufficiently imprecise that a high number of batches, each issued to a different Wallet Unit, share the same timestamp values (herd privacy). b) This requirement does not apply to timestamps included in the attestation as selectively disclosable attributes, see ISSU_36a.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-068" markdown>
<div class="eudi-hlr__id">AS-AP-10-068<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_36a
{: .eudi-hlr__meta }

If the exact time of the issuance of an attestation or the beginning or end of its validity period is relevant for the use case, the applicable Attestation Rulebook SHALL specify one or more selectively disclosable attribute(s) containing a timestamp with the required precision.

*Note: a) An example of this may be a vehicle registration attestation indicating the date and time (down to the second) at which a car changed ownership and therefore legal responsibility. b) This requirement ensures that requirement ISSU_36 can be complied with without running into challenges related to the use case.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-069" markdown>
<div class="eudi-hlr__id">AS-AP-10-069<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_37
{: .eudi-hlr__meta }

A Wallet Provider SHALL ensure that its Wallet Solution supports the following methods for limiting the number of times a User can present the same technical PID or attestation to Relying Parties: Method A (Once-only attestations, as specified in requirement ISSU_43 - ISSU_47) and Method B (Limited-time attestations, as specified in requirement ISSU_48 - ISSU_50). In addition, a Wallet Provider MAY ensure that its Wallet Solution supports Method C (Rotating-batch attestations, as specified in requirement ISSU_51 - ISSU_54) or Method D (Per-Relying Party attestations, as specified in requirement ISSU_55 - ISSU_57).

*Note: Wallet Solutions, PID Providers, Attestation Providers, and Wallet Providers are free to define and use other methods as well. However, such other methods are out of scope of the ARF.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-070" markdown>
<div class="eudi-hlr__id">AS-AP-10-070<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_38
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL have a policy describing which method(s) (i.e, A, B, C, and/or D) it will use to limit the number of times a Wallet Unit may present a single technical PID or attestation. For each supported method, the policy SHALL also specify how the values for respective parameters for that method, such as technical validity period and batch size, will be chosen. The goal of the policy SHALL be to ensure that the risk of linkability is mitigated to an acceptable level, given the (expected) usage of the logical PID or attestation by the User. To determine what an acceptable level of risk is, the PID Provider or Attestation Provider SHALL carry out a risk analysis regarding linkability.

*Note: a) If an Attestation Provider issues multiple attestation types, these requirements apply for each type of attestation separately. b) [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md) specifies that WIAs and KAs shall be sent to a PID Provider or Attestation Provider only once. In other words, for WIAs and KAs, the use of Method A is mandatory.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-071" markdown>
<div class="eudi-hlr__id">AS-AP-10-071<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_39
{: .eudi-hlr__meta }

PID Providers and Attestation Providers SHALL include the `credential_reuse_policy` parameter, specified in section 4.2.4.2 of [ETSI TS 119 472-3], in their Credential Issuer Metadata to specify which of the methods A, B, C, or D the Wallet Unit must use for the logical PID or attestation issued. Indicated methods SHALL be ordered by preference.

*Note: See also ISSU_40.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-072" markdown>
<div class="eudi-hlr__id">AS-AP-10-072<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_39a
{: .eudi-hlr__meta }

Wallet Units SHALL support the `credential_reuse_policy` Credential Issuer Metadata parameter specified in section 4.2.4.2 of [ETSI TS 119 472-3] and SHALL present each technical PID and attestation in accordance with the values set for this parameter by the relevant PID Provider or Attestation Provider.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-073" markdown>
<div class="eudi-hlr__id">AS-AP-10-073<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_40
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL indicate in their OpenID4VCI Issuer metadata that either method A or method B must be used for a given type of PID or attestation. In addition, a PID Provider or Attestation Provider MAY indicate that it prefers using method C and/or method D over method A or method B, by including the methods in the metadata in the appropriate order. In such a case, a Wallet Unit supporting method C and/or method D SHALL use that method, while a Wallet Unit not supporting these methods SHALL use method A or method B, as applicable.

*Note: a) This requirement implies that a PID Provider or Attestation Provider must not include both method A and method B in its metadata. b) Example: An Attestation Provider indicates methods {D, C, A} in its metadata, in that order. A Wallet Unit that supports methods C and D (as well as A and B) then uses method D for this type of attestation. A Wallet Unit supporting methods A, B and C uses method C. A Wallet Unit supporting only methods A and B uses method A.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-074" markdown>
<div class="eudi-hlr__id">AS-AP-10-074<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_40a
{: .eudi-hlr__meta }

When implementing any of the methods mentioned in ISSU_37, a Wallet Unit, PID Provider, or Attestation Provider SHALL comply with the applicable requirements in [ETSI TS 119 472-3], section 4.2.4.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-075" markdown>
<div class="eudi-hlr__id">AS-AP-10-075<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_41
{: .eudi-hlr__meta }

To the maximum extent possible, Wallet Providers, PID Providers, and Attestation Providers SHALL ensure that Users do not notice which of the methods A, B, C, or D is used for their PIDs and attestations.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-076" markdown>
<div class="eudi-hlr__id">AS-AP-10-076<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_42
{: .eudi-hlr__meta }

To the maximum extent possible, Wallet Providers, PID Providers, and Attestation Providers SHALL ensure that no User action is needed for the re-issuance of WIAs or KAs, PIDs, or attestations.

*Note: For the topic of re-issuance, see also the [Discussion Paper for Topic B](../../discussion-topics/b-re-issuance-and-batch-issuance-of-pids-and-attestations.md).*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-077" markdown>
<div class="eudi-hlr__id">AS-AP-10-077<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_43
{: .eudi-hlr__meta }

If Method A is used, the Wallet Unit SHALL request the PID Provider or Attestation Provider to issue technical PIDs or attestations in batches to the Wallet Unit. All PIDs or attestations in a batch SHALL have the same attribute values and the same technical validity period.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-078" markdown>
<div class="eudi-hlr__id">AS-AP-10-078<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_44
{: .eudi-hlr__meta }

If Method A is used, the Wallet Unit SHALL present each technical PID or attestation only once to a Relying Party that requests the corresponding logical PID or attestation, except when it has fallen back to Method B as specified in ISSU_47.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-079" markdown>
<div class="eudi-hlr__id">AS-AP-10-079<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_45
{: .eudi-hlr__meta }

If Method A is used, the Wallet Unit SHALL have a lower limit for the number of unused technical PIDs or attestations it holds for each logical PID or attestation, and SHALL request the issuance of a new batch when this limit is reached. The PID Provider or Attestation Provider SHALL inform the Wallet Unit about the value of the lower limit and the size of the batch to be requested, using the `credential_reuse_policy` Credential Issuer Metadata parameter specified in section 4.2.4.2 of [ETSI TS 119 472-3].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-080" markdown>
<div class="eudi-hlr__id">AS-AP-10-080<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_46
{: .eudi-hlr__meta }

If Method A is used and the Wallet Unit must request a new batch of technical PIDs or attestations but is not able to do so (for instance because it is offline), the Wallet Unit SHALL warn the User that they are about to lose the possibility to present the corresponding logical PID or attestation to Relying Parties, and request them to connect their device to the internet.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-081" markdown>
<div class="eudi-hlr__id">AS-AP-10-081<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_47
{: .eudi-hlr__meta }

If Method A is used and the Wallet Unit has run out of unused technical PIDs or attestations, but is not able to request a new batch, it SHALL fall back to method B (see ISSU_48 - ISSU_50). This means that, when requested by a Relying Party or Attestation Provider, the Wallet Unit SHALL again present one of the already used technical PIDs or attestations. The Wallet Unit SHALL return to using method A as soon as it is able to go online and request a new batch of PIDs or attestations.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-082" markdown>
<div class="eudi-hlr__id">AS-AP-10-082<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_48
{: .eudi-hlr__meta }

If Method B is used, the Wallet Unit SHALL request the PID Provider or Attestation Provider to issue a single technical PID or attestation to the Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-083" markdown>
<div class="eudi-hlr__id">AS-AP-10-083<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_49
{: .eudi-hlr__meta }

If Method B is used, the Wallet Unit SHALL present a technical PID or attestation multiple times to the same Relying Party or to different Relying Parties, when a Relying Party requests the corresponding logical PID or attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-084" markdown>
<div class="eudi-hlr__id">AS-AP-10-084<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_50
{: .eudi-hlr__meta }

If Method B is used, the Wallet Unit SHALL request the PID Provider or Attestation Provider to re-issue a technical PID or attestation some time before the one existing in the Wallet Unit expires. The PID Provider or Attestation Provider SHALL inform the Wallet Unit about the moment at which the Wallet Unit must request the re-issuance of a technical PID or attestation, relative to the expiration date of the existing one. To do so, the PID Provider or Attestation Provider SHALL use the `credential_reuse_policy` Credential Issuer Metadata parameter specified in section 4.2.4.2 of [ETSI TS 119 472-3].

*Note: It is the responsibility of the Relying Party receiving a PID or attestation to validate whether a presented technical PID or attestation is temporally valid. A Wallet Unit is allowed to present a PID or attestation even if its expiration date is in the past.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-085" markdown>
<div class="eudi-hlr__id">AS-AP-10-085<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_51
{: .eudi-hlr__meta }

If Method C is used, the Wallet Unit SHALL request the PID Provider or Attestation Provider to issue technical PIDs or attestations in batches to the Wallet Unit. All PIDs or attestations in a batch SHALL have the same attribute values and the same technical validity period.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-086" markdown>
<div class="eudi-hlr__id">AS-AP-10-086<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_52
{: .eudi-hlr__meta }

If Method C is used, the Wallet Unit SHALL present each technical PID or attestation in a batch once to a Relying Party that requests the corresponding logical PID or attestation, in a random order. When all PIDs or attestations in a batch have been presented once, the Wallet Unit SHALL reset the batch, and start presenting each PID or attestation in the batch again, in a random order. The Wallet Unit SHALL continue doing this until it receives a new batch, see ISSU_54.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-087" markdown>
<div class="eudi-hlr__id">AS-AP-10-087</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_53
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-088" markdown>
<div class="eudi-hlr__id">AS-AP-10-088<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_54
{: .eudi-hlr__meta }

If Method C is used, the Wallet Unit SHALL request the PID Provider or Attestation Provider to re-issue a batch of technical PIDs or attestations some time before the batch in the Wallet Unit expires. The PID Provider or Attestation Provider SHALL inform the Wallet Unit about the size of the batch and about the moment at which the Wallet Unit must request the re-issuance of a batch, relative to the expiration date of the existing batch. To do so, the PID Provider or Attestation Provider SHALL use the `credential_reuse_policy` Credential Issuer Metadata parameter specified in section 4.2.4.2 of [ETSI TS 119 472-3].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-089" markdown>
<div class="eudi-hlr__id">AS-AP-10-089<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_55
{: .eudi-hlr__meta }

If Method D is used, the Wallet Unit SHALL present a different technical PID or attestation to each different Relying Party that requests the corresponding logical PID or attestation. This means that it SHALL comply with all requirements for Method A for such Relying Parties.

*Note: This means the Wallet Unit presents an unused technical attestation to each new Relying Party that request the logical attestation, and it requests a new batch of technical attestations if the number of remaining unused attestations goes below the lower limit. If for some reason requesting a new batch is not successful and the Wallet Unit runs out of unused technical attestations, it re-uses one of the already used technical attestations.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-090" markdown>
<div class="eudi-hlr__id">AS-AP-10-090<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_56
{: .eudi-hlr__meta }

If Method D is used and a given Relying Party requests attributes from a given logical PID or attestation multiple times, the Wallet Unit MAY present the same technical PID or attestation to this Relying Party each time. If it does, it SHALL comply with all requirements for Method B for such a Relying Party.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-091" markdown>
<div class="eudi-hlr__id">AS-AP-10-091</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_56a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-092" markdown>
<div class="eudi-hlr__id">AS-AP-10-092<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_57
{: .eudi-hlr__meta }

If Method D is used, the Wallet Unit SHALL keep track of which technical PID or attestation it has presented to which Relying Party.

*Note: To do so, the Wallet Unit can use the unique RP identifier contained in the registration certificate of the presentation requests it receives.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-093" markdown>
<div class="eudi-hlr__id">AS-AP-10-093</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_57a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-094" markdown>
<div class="eudi-hlr__id">AS-AP-10-094<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_58
{: .eudi-hlr__meta }

A Wallet Unit SHALL give its User the option to manually initiate a re-issuance process for any of the logical PIDs or attestations in their Wallet Unit. If the User uses this option, the Wallet Unit SHALL attempt to start the re-issuance process immediately, and SHALL notify the User if it did not succeed in requesting re-issuance.

*Note: a) This requirement does not apply for KAs or WIAs, since Users must not be involved in their management. b) In the case of a PID or an attestation bound to the WSCA/WSCD, the Wallet Unit will request the User to authenticate to the WSCA/WSCD (see WIAM_14). In case of an attestation bound to a keystore, no additional User authentication is needed, see WIAM_15c.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-095" markdown>
<div class="eudi-hlr__id">AS-AP-10-095<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_59
{: .eudi-hlr__meta }

After a successful re-issuance, a Wallet Unit SHALL compare the attribute values of the re-issued technical PID or attestation with those of the existing technical PID or attestation, and SHALL notify the User in case of any differences.

*Note: a) This requirement does not apply for KAs or WIAs, since Users must not be involved in their management. b) The point of this requirement is to allow the User to detect errors in the attribute values in the new attestation. The follow-up process in case of errors is not defined. Presumably, the User can contact the Attestation Provider to discuss the fact that it apparently holds false attribute values for the User, and as a result, the Attestation Provider may decide to revoke the attestation.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-096" markdown>
<div class="eudi-hlr__id">AS-AP-10-096<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_60
{: .eudi-hlr__meta }

A Wallet Unit SHALL gracefully handle situations in which re-issuance of a PID, attestation, KA, or WIA fails or is refused by the PID Provider, Attestation Provider, or Wallet Provider, for example by attempting a retry after an appropriate delay.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-097" markdown>
<div class="eudi-hlr__id">AS-AP-10-097<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_61
{: .eudi-hlr__meta }

A Wallet Unit SHALL support PID or attestation first-time batch issuance with a single User authentication, regardless of the size of the batch.

*Note: See also requirement WIAM_14.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-098" markdown>
<div class="eudi-hlr__id">AS-AP-10-098<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_62
{: .eudi-hlr__meta }

If a technical PID or attestation was successfully re-issued because the value of one or more of its attributes was changed (including attributes being added or deleted), a Wallet Unit SHALL no longer present the (now obsolete) pre-existing technical PID or attestation, and SHOULD delete it.

*Note: a) It is up to the Wallet Unit, possibly using metadata provided by the PID Provider or Attestation Provider using the [OpenID4VCI] protocol, to determine the technical PID or attestation to be deleted. b) Additionally, per requirement VCR_09, the PID Provider or Attestation Provider revokes the pre-existing technical PID or attestation.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-099" markdown>
<div class="eudi-hlr__id">AS-AP-10-099<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_63
{: .eudi-hlr__meta }

PID Providers and Attestation Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the re-issuance of PIDs and attestations.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-100" markdown>
<div class="eudi-hlr__id">AS-AP-10-100<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_64
{: .eudi-hlr__meta }

PID Providers, Attestation Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the batch issuance of technical PIDs or attestations.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-101" markdown>
<div class="eudi-hlr__id">AS-AP-10-101<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_65
{: .eudi-hlr__meta }

A PID Provider or an Attestation Provider of device-bound attestations SHALL verify that a re-issued technical PID or device-bound attestation is issued to the same Wallet Unit as the existing PID or attestation.

*Note: A PID Provider or Attestation Provider can do so by issuing a device-bound refresh token to the Wallet Instance during the original issuance of the PID or attestation, and requiring that the Wallet Instance uses it to obtain a fresh access token during re-issuance. See [OpenID4VCI] section 14.5. The PID Provider or Attestation Provider needs to be able to trust that the Wallet Instance handles the refresh tokens in a secure way, so that an attacker cannot use them from another Wallet Instance. This requires trust in the (continued) security and integrity of both the original Wallet Instance and the other Wallet Instance. This trust is provided by providing the PID Provider or Attestation Provider with a valid KA for the new Wallet Unit during re-issuance, and by enabling the PID Provider or Attestation Provider to verify that the original Wallet Unit has not been revoked.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-102" markdown>
<div class="eudi-hlr__id">AS-AP-10-102</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_66
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-103" markdown>
<div class="eudi-hlr__id">AS-AP-10-103<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_67
{: .eudi-hlr__meta }

A PID Provider SHALL have a policy governing all aspects of PID issuance and management, in line with clauses 6 and 7 of [ETSI TS 119 471], incorporating the amendments introduced by [CIR 2025/1569] and subject to the necessary adaptations to a PID. The policy SHALL comply with at least the extended normalised certificate policy ('NCP+') requirements as specified in [ETSI EN 319 411-1], insofar applicable for the issuance of PIDs rather than public key certificates.

*Note: A common dedicated policy for issuing PIDs may be developed in the future. If so, this requirement will be changed to refer to it.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-104" markdown>
<div class="eudi-hlr__id">AS-AP-10-104<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_68
{: .eudi-hlr__meta }

PID Providers SHALL ensure that the certificates they use for signing PIDs comply with all applicable requirements in [ETSI TS 119 412-6], in particular Clause 4.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-105" markdown>
<div class="eudi-hlr__id">AS-AP-10-105<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_69
{: .eudi-hlr__meta }

A QEAA Provider SHALL have a policy governing all aspects of QEAA issuance and management, in line with clauses 6 and 7 of [ETSI TS 119 471], incorporating the amendments introduced by [CIR 2025/1569]. The policy SHALL comply with at least the policy for qualified certificates issued to a natural person where the private key and the related certificate reside on a QSCD ('QCP-n-qscd') or qualified certificates issued to a legal person where the private key and the related certificate reside on a QSCD ('QCP-l-qscd') requirements as specified in [ETSI EN 319 411-2], insofar applicable for the issuance of QEAAs rather than public key certificates.

*Note: A common dedicated policy for issuing QEAAs may be developed in the future. If so, this requirement will be changed to refer to it.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-106" markdown>
<div class="eudi-hlr__id">AS-AP-10-106<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_70
{: .eudi-hlr__meta }

QEAA Providers SHALL ensure that the certificates they use for signing QEAAs comply with all applicable requirements in [ETSI TS 119 412-6], in particular Clause 7.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-107" markdown>
<div class="eudi-hlr__id">AS-AP-10-107<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_71
{: .eudi-hlr__meta }

Providers of non-qualified EAAs SHALL ensure that the certificates they use for signing EAAs comply with all applicable requirements in [ETSI TS 119 412-6], in particular Clause 6.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-108" markdown>
<div class="eudi-hlr__id">AS-AP-10-108<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_72
{: .eudi-hlr__meta }

A PuB-EAA Provider SHALL have a policy governing all aspects of PuB-EAA issuance and management, in line with clauses 6 and 7 of [ETSI TS 119 471], incorporating the amendments introduced by [CIR 2025/1569] and subject to the necessary adaptations to a PuB-EAA. The policy SHALL comply with at least the extended normalised certificate policy ('NCP+') requirements as specified in [ETSI EN 319 411-1], insofar applicable for the issuance of PuB-EAAs rather than public key certificates.

*Note: A common dedicated policy for issuing PuB-EAAs may be developed in the future. If so, this requirement will be changed to refer to it*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-10-109" markdown>
<div class="eudi-hlr__id">AS-AP-10-109<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_73
{: .eudi-hlr__meta }

PuB-EAAs Providers SHALL ensure that the certificates they use for signing PuB-EAAs comply with all applicable requirements in [ETSI TS 119 412-6], in particular Clause 8.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-12-001" markdown>
<div class="eudi-hlr__id">AS-AP-12-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_01
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL specify that one or more of the following two common format(s) must be used for these attestations: - The format specified in ISO/IEC 18013-5, see [ISO/IEC 18013-5]. - The format specified in SD-JWT-based Verifiable Credentials (SD-JWT VC), see [SD-JWT VC].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-18-001" markdown>
<div class="eudi-hlr__id">AS-AP-18-001<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACP_03
{: .eudi-hlr__meta }

A Cryptographic Binding of Attestations scheme SHOULD be implemented using a Zero-Knowledge Proof mechanism that satisfies the requirements specified in [Topic 53][topic-53].

</div>
</div>


<div class="eudi-hlr" id="AS-AP-18-002" markdown>
<div class="eudi-hlr__id">AS-AP-18-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACP_06
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-18-003" markdown>
<div class="eudi-hlr__id">AS-AP-18-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ACP_07
{: .eudi-hlr__meta }

Before making a request according to ACP_05, an Attestation Provider SHALL verify that the new attestation indeed belongs to the User of the existing PID or attestation.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-28-001" markdown>
<div class="eudi-hlr__id">AS-AP-28-001</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: LP_02
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-001" markdown>
<div class="eudi-hlr__id">AS-AP-42-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_01
{: .eudi-hlr__meta }

In accordance with [ETSI TS 119 478] and [Technical Specification 11][ts11], Member States SHALL define: - discovery mechanisms that enable QTSPs to request information about Authentic Sources or designated intermediaries recognised at the national level. This includes information regarding the attributes of a natural or legal person for which the Authentic Source or designated intermediary is considered a primary source, or for which it is recognised as authentic in accordance with Union law or national law, including administrative practices. - procedures for QTSPs to request the verification of attributes from Authentic Sources.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-002" markdown>
<div class="eudi-hlr__id">AS-AP-42-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_02
{: .eudi-hlr__meta }

An Authentic Source in the public sector, or its designated intermediary, SHALL implement an interface complying with [ETSI TS 119 478] and [Technical Specification 11][ts11] for receiving verification requests and sending responses. For each received request, the Authentic Source SHALL - identify and authenticate the requestor in such a way that it can subsequently determine whether the requestor is a QTSP issuing qualified electronic attestation of attributes, for example by means of a lookup in the QTSP Trusted List. - authenticate the User and obtain their approval, if it is legally obliged to do so, in addition to the User authentication and approval already performed by the QTSP according to QTSPAS_08. - verify whether the attribute values claimed by the QTSP match the values held by the Authentic Source and, finally, - respond with one of the following for each attribute: +'match', if the attribute value held for this User by the Authentic Source is identical to the value claimed by the QTSP, + 'no match', if the attribute value held for this User by the Authentic Source is not identical to the value claimed by the QTSP, including if the Authentic Source is the authentic source for this attribute but does not hold a value for this User, +'unknown', if the Authentic Source is not the authentic source for this attribute.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-003" markdown>
<div class="eudi-hlr__id">AS-AP-42-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_03
{: .eudi-hlr__meta }

An Authentic Source or designated intermediary SHALL respond to a verification request for attributes by any QTSP issuing qualified electronic attestation of attributes.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-004" markdown>
<div class="eudi-hlr__id">AS-AP-42-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_04
{: .eudi-hlr__meta }

An Authentic Source or designated intermediary SHALL implement the technical specifications mentioned in QTSPAS_01, so that the QTSP will receive the result of the verification of the requested attributes as described in QTSPAS_02. If the verification is deferred, the response to the QTSP SHALL include the maximum time that it will take to verify the requested attributes, and a unique identifier that the QTSP SHALL use to obtain the result of the verification.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-005" markdown>
<div class="eudi-hlr__id">AS-AP-42-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_05
{: .eudi-hlr__meta }

A QTSP SHALL send an attribute verification request directly to the Authentic Source or designated intermediary recognised at national level, after discovering it using the mechanisms specified the technical specifications mentioned in QTSPAS_01.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-006" markdown>
<div class="eudi-hlr__id">AS-AP-42-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_06
{: .eudi-hlr__meta }

Member States SHALL specify the processes and mechanisms to designate the Authentic Sources or intermediaries recognised at national level in accordance with Union or national law, allowing these Authentic Sources or intermediaries to verify the attributes presented to them by QTSPs.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-007" markdown>
<div class="eudi-hlr__id">AS-AP-42-007</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_07
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-008" markdown>
<div class="eudi-hlr__id">AS-AP-42-008</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_07a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-AP-42-009" markdown>
<div class="eudi-hlr__id">AS-AP-42-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: QTSPAS_08
{: .eudi-hlr__meta }

A QTSP SHALL obtain approval from the User to verify the authenticity of the attributes, before requesting the verification of those attributes by the relevant Authentic Source or designated intermediary.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-43-001" markdown>
<div class="eudi-hlr__id">AS-AP-43-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_11
{: .eudi-hlr__meta }

An Attestation Provider SHALL revoke an attestation if a corresponding embedded disclosure policy is added, changed, or deleted.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-44-001" markdown>
<div class="eudi-hlr__id">AS-AP-44-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_13
{: .eudi-hlr__meta }

During the registration process for PID Providers, QEAA Providers, PuB-EAA Provider, or non-qualified EAA Providers, as specified in [Topic 27][topic-27], a Provider of registration certificates associated to the Member State Registrar SHALL create and sign or seal a separate registration certificate for each of the registered Services of the registering entity, and issue it to the registering entity. Each registration certificate SHALL comply with the requirements in the technical specification mentioned in RPRC_01.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-44-002" markdown>
<div class="eudi-hlr__id">AS-AP-44-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_14
{: .eudi-hlr__meta }

A PID Provider, QEAA Provider, PuB-EAA Provider, or non-qualified EAA Provider SHALL distribute the registration certificates it received during registration to all service supply points having an access certificate containing the same Service identifier.

*Note: A service supply point is a system at which a Wallet Unit can start the process of requesting and obtaining a PID or attestation.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-44-003" markdown>
<div class="eudi-hlr__id">AS-AP-44-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_15
{: .eudi-hlr__meta }

The contents of a registration certificate issued to a PID Provider, a QEAA Provider, a PuB-EAA Provider, or a non-qualified EAA Provider SHALL contain the type(s) of attestation that the applicable Service of this entity intends to issue to Wallet Units.

</div>
</div>


<div class="eudi-hlr" id="AS-AP-44-004" markdown>
<div class="eudi-hlr__id">AS-AP-44-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_22
{: .eudi-hlr__meta }

A PID Provider or Attestation Provider SHALL include the registration certificate of the applicable Service in its Credential Issuer metadata used in the common OpenID4VCI protocol referenced in ISSU_01 and the extension thereof in [ETSI TS 119 472-3]. The registration certificate SHALL be included in the metadata by value, not by reference.

*Note: This ensures that no external requests are necessary to validate the PID Provider or Attestation Provider, and that issuance transactions are atomic and self-contained.*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-44-005" markdown>
<div class="eudi-hlr__id">AS-AP-44-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_22a
{: .eudi-hlr__meta }

Before requesting the issuance of a PID or an attestation, a Wallet Unit SHALL verify the format, authenticity, and validity of the registration certificate it obtained from a PID Provider's or Attestation Provider's metadata, according to the technical specification meant in RPRC_01. If the certificate is absent, malformed, inauthentic, or expired, the Wallet Unit SHALL warn the User that it could not obtain or validate the information registered about the PID Provider or Attestation Provider, and SHALL NOT request the issuance of a PID or attestation.

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-44-006" markdown>
<div class="eudi-hlr__id">AS-AP-44-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_22b
{: .eudi-hlr__meta }

Before requesting the issuance of a PID or an attestation, a Wallet Unit SHALL verify that the registration certificate contains the same unique identifier as the access certificate in the PID Provider's or Attestation Provider's metadata. If this is not the case, the Wallet Unit SHALL warn the User that it could not validate the information registered about the PID Provider or Attestation Provider, and SHALL NOT request the issuance of a PID or attestation 

*Note: a) If the registration certificate does not comply with this requirement, a fraudulent entity acting as a PID Provider or Attestation Provider may be trying to use a registration certificate that was issued to another PID Provider or Attestation Provider. b) The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-44-007" markdown>
<div class="eudi-hlr__id">AS-AP-44-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_23
{: .eudi-hlr__meta }

Before requesting the issuance of a PID or an attestation, a Wallet Unit SHALL verify that the type of attestation it wants to request from a PID Provider or Attestation Provider is included in the registration certificate of that Provider. If that is not the case, the Wallet Unit SHALL warn the User that the PID Provider or Attestation Provider is not registered for issuing the desired attestation type, and SHALL NOT request the issuance of a PID or attestation.

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="AS-AP-53-001" markdown>
<div class="eudi-hlr__id">AS-AP-53-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_04
{: .eudi-hlr__meta }

A ZKP scheme SHOULD support the derivation of a verifiable User pseudonym, by combining an attribute value that is unique for the User with Relying Party-specific context (e.g., the Relying Party identifier) In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme SHALL provide support for the following functions: (i) generation of a request for the issuance of an attestation that includes a secret attribute unique to the User, without revealing this attribute to the Attestation Provider, (ii) generation of an attestation presentation that includes a verifiable pseudonym derived from the secret attribute, a Relying Party identifier, and context-related information.

*Note: See section 4.1.5 of the Discussion Paper for Topic G.*

</div>
</div>


---

### 4. Relying Parties

*These requirements are for the services and entities that accept and use the*
*EUDI Wallet. They cover how they must register, authenticate themselves to the*
*wallet, request user attributes, and handle user data.*

<div class="eudi-hlr" id="EW-PIO-01-024" markdown>
<div class="eudi-hlr__id">EW-PIO-01-024<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_12
{: .eudi-hlr__meta }

For both proximity and remote presentation flows, a Relying Party SHALL validate the signature of a PID using a trust anchor provided in a PID Provider LoTE made available in accordance with [Topic 31][topic-31]].

</div>
</div>


<div class="eudi-hlr" id="AS-RP-01-002" markdown>
<div class="eudi-hlr__id">AS-RP-01-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_16
{: .eudi-hlr__meta }

When receiving a PID or attestation, a Relying Party Instance SHALL discard the values of all unique elements, including at least the ones mentioned in requirement ISSU_35 in [Topic 10][topic-10], as well as any timestamps, as soon as they are no longer needed. The Relying Party Instance SHALL NOT communicate these values to the Relying Party or to any other party inside or outside the EUDI Wallet ecosystem.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-01-003" markdown>
<div class="eudi-hlr__id">AS-RP-01-003<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_17
{: .eudi-hlr__meta }

A Relying Party Instance SHOULD verify the device-binding signature or Message Authentication Code provided in the presentation response of the Wallet Unit during the presentation of a PID or device-bound attestation, following the steps specified per [ISO/IEC 18013-5] or [SD-JWT VC], as applicable.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-06-001" markdown>
<div class="eudi-hlr__id">AS-RP-06-001</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPA_02a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-RP-48-001" markdown>
<div class="eudi-hlr__id">AS-RP-48-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_02
{: .eudi-hlr__meta }

A Wallet Unit SHALL support at least the following possibilities to send a data erasure request to a Relying Party: a) Open a URL in an external browser to ask for the deletion of data in a web form provided by the Relying Party, b) Open an external mail client and start a draft e-mail to the Relying Party, with a suitable template text, c) open an external phone client and start a phone call. Depending on whether a Relying Party URL, e-mail address, and/or phone number was logged for the relevant attestation presentation transaction (see requirement DASH_03 in [Topic 19][topic-19]), the Wallet Unit SHALL offer the User to use one or more of these possibilities.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-48-002" markdown>
<div class="eudi-hlr__id">AS-RP-48-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_02a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-RP-48-003" markdown>
<div class="eudi-hlr__id">AS-RP-48-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_03
{: .eudi-hlr__meta }

A Wallet Instance SHALL provide a function where the User may select one Relying Party to which a data deletion request must be submitted.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-48-004" markdown>
<div class="eudi-hlr__id">AS-RP-48-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_06
{: .eudi-hlr__meta }

For the initiation of a data deletion request, the log SHALL contain at least: - Date and time of the initiation of the request, - Name and unique identifier of the Relying Party to which the request was made, - Attributes requested to be deleted.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-48-005" markdown>
<div class="eudi-hlr__id">AS-RP-48-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: DATA_DLT_07
{: .eudi-hlr__meta }

Before executing a data deletion request, a Relying Party SHALL authenticate the requesting User (or the request itself), using appropriate authentication mechanisms of its own choosing. The Relying Party SHOULD use the authentication or signature facilities offered by the User's Wallet Unit for this purpose.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-001" markdown>
<div class="eudi-hlr__id">AS-RP-52-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_01
{: .eudi-hlr__meta }

An intermediary SHALL register as a Relying Party, in accordance with all requirements in [Topic 27][topic-27], while indicating it intends to act as an intermediary.

*Note: a) This implies that an intermediary obtains an access certificate containing its own trade name and unique Relying Party identifier, and Service trade name and identifier. b) An intermediary may also obtain a registration certificate according to [Topic 44][topic-44], but this certificate will not be used for intermediated transactions. c) An entity that registered as an intermediary may also register as a Relying Party in its own capacity. In such a case, it will receive one or more registration certificates for its Services and intended use(s), (see RPRC_09), and will use one of these certificates when interacting with a Wallet Unit.*

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-002" markdown>
<div class="eudi-hlr__id">AS-RP-52-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_02
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-003" markdown>
<div class="eudi-hlr__id">AS-RP-52-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_03
{: .eudi-hlr__meta }

An intermediary SHALL ensure that each intermediated Relying Party that will use its services to interact with Wallet Units, is registered at a Registrar in the Member State where the intermediated Relying Party is established, according all requirements in [Topic 44][topic-44]. The intermediary SHALL also ensure that it receives the necessary registration certificates for the intermediated Relying Party, as specified in RPRC_09. Each of these registration certificates SHALL show that the intermediated Relying Party uses the services of the intermediary. 

*Note: A Registrar is free to design a suitable process to achieve these goals. For example, it may decide an intermediary can register the intermediated Relying Parties at the Registrar, and receive the registration certificates in return. Alternatively, the Registrar could request the intermediated Relying Parties ro register themselves and indicate the intermediary they will be using, in which case they will receive the registration certificates and must send them to the intermediary. Alternative processes can be used as well.*

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-004" markdown>
<div class="eudi-hlr__id">AS-RP-52-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_04
{: .eudi-hlr__meta }

Before registering the relationship between an intermediary and an intermediated Relying Party and issuing a registration certificate showing that the intermediated Relying Party uses the services of the intermediary, a Registrar SHALL ensure it obtains legally valid evidence that this Relying Party will indeed use the services of this intermediary to interact with Wallet Units. 

*Note: A Registrar is free to decide which evidence it needs and how it obtains this evidence. For example, the Registrar may require either the intermediary or the intermediated Relying Party to provide a signed copy of the contract between both parties. Alternatively, the Registrar could ask an authorised representative of the Relying Party to sign off on a registration that was done by the intermediary, or could ask for a mandate from the intermediated Relying Party to the intermediary to register the Relying Party.*

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-005" markdown>
<div class="eudi-hlr__id">AS-RP-52-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_05
{: .eudi-hlr__meta }

When an intermediated Relying Party asks its intermediary to request some attributes from a Wallet Unit, it SHALL indicate which single registration certificate the intermediary must include in the presentation request.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-006" markdown>
<div class="eudi-hlr__id">AS-RP-52-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_06
{: .eudi-hlr__meta }

When requested by an intermediated Relying Party, an intermediary SHALL request a presentation of attributes from a specific Wallet Unit. In the request, the intermediary SHALL include the applicable intermediary's access certificate meant in requirement RPI_01 and the registration certificate of the Relying Party, indicated per RPI_05.

*Note: The applicable access certificate contains the association to this specific intermediated Relying Party, see Reg_34a. *

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-007" markdown>
<div class="eudi-hlr__id">AS-RP-52-007</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_06a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-008" markdown>
<div class="eudi-hlr__id">AS-RP-52-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_07
{: .eudi-hlr__meta }

In case a Wallet Unit receives a presentation request from an intermediary on behalf of an intermediated Relying Party, it SHALL NOT display the trade names of the intermediary and the intermediary Service to the User when asking for User approval, as described in RPA_07.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-009" markdown>
<div class="eudi-hlr__id">AS-RP-52-009</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_07a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-010" markdown>
<div class="eudi-hlr__id">AS-RP-52-010</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_07b
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-011" markdown>
<div class="eudi-hlr__id">AS-RP-52-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_08
{: .eudi-hlr__meta }

When a Wallet Unit presents to an intermediary any User attributes from a PID or attestation, the intermediary SHALL, after successfully carrying out the verifications in RPI_09, forward these attributes only to the Relying Party on behalf of which the presentation request was made. If any of the verifications in RPI_09 fail, the intermediary SHALL NOT forward any attributes to the Relying Party, nor to any other entity.

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-012" markdown>
<div class="eudi-hlr__id">AS-RP-52-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_09
{: .eudi-hlr__meta }

When a Wallet Unit presents to an intermediary any attributes from a PID or attestation, the intermediary SHALL verify the authenticity of the PID or attestation, its revocation status, device binding and User binding, as well as any combined presentation of attributes, if applicable, as specified in this ARF and if agreed with the Relying Party.

*Note: The ARF does not mandate that a Relying Party must carry out all of these verifications. Therefore, the intermediary and any Relying Party using its services must agree on what verifications the intermediary will carry out.*

</div>
</div>


<div class="eudi-hlr" id="AS-RP-52-013" markdown>
<div class="eudi-hlr__id">AS-RP-52-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPI_10
{: .eudi-hlr__meta }

The intermediary SHALL delete any PIDs or attestations it obtained from the Wallet Unit, including any User attributes, completely and immediately after it has sent the User attributes to the intermediated Relying Party. If the intermediary does not send any User attributes to the intermediated Relying Party, for example because one of the verifications in RPI_09 failed, the intermediary SHALL delete the PIDs or attestations completely and immediately as soon as it has completed all necessary verifications.

</div>
</div>


---

## Part 2: Ecosystem-Wide Rules

### 5. Protocols & Interoperability

*These requirements define the common communication standards and protocols that*
*ensure the entire system works together seamlessly across borders. This covers*
*how different components talk to each other.*

<div class="eudi-hlr" id="EW-PIO-01-001" markdown>
<div class="eudi-hlr__id">EW-PIO-01-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_01
{: .eudi-hlr__meta }

For proximity presentation flows, a Wallet Unit SHALL support the transmission mechanism specified in [ISO/IEC 18013-5] to receive and respond to presentation requests for person identification data (PID) and attestations by Relying Parties.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-002" markdown>
<div class="eudi-hlr__id">EW-PIO-01-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_01a
{: .eudi-hlr__meta }

For remote presentation flows, a Wallet Unit SHALL support the following transmission mechanisms: - The API-mediated mechanisms specified in OIA_08, OIA_08a, and OIA_08b, - The mechanisms based on redirects specified in OIA_03b and OIA_03c.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-003" markdown>
<div class="eudi-hlr__id">EW-PIO-01-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_02
{: .eudi-hlr__meta }

A Wallet Unit SHALL support proving cryptographic device binding between the WSCA/WSCD or a keystore included in the Wallet Unit and a PID or attestation, in accordance with [SD-JWT VC] or [ISO/IEC 18013-5].

*Note: Such a mechanism is called 'mdoc authentication' in [ISO/IEC 18013-5] and 'key binding' in [SD-JWT VC].*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-004" markdown>
<div class="eudi-hlr__id">EW-PIO-01-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_03
{: .eudi-hlr__meta }

When issuing, presenting, or verifying an attestation, Wallet Units, PID Providers, Attestation Providers, and Relying Parties SHALL only use cryptographic algorithms included in the [ECCG Agreed Cryptographic Mechanisms v2.0].

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-005" markdown>
<div class="eudi-hlr__id">EW-PIO-01-005</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_03a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-006" markdown>
<div class="eudi-hlr__id">EW-PIO-01-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_03b
{: .eudi-hlr__meta }

For remote presentation flows using redirects and [OpenID4VP], when the format of the requested attestation complies with [ISO/IEC 18013-5], Relying Parties and Wallet Units SHALL comply with the requirements in [HAIP] Sections 5, 5.1 and 5.3.1, as well as with the 'ISO mdocs' profile in Section 6 and with Sections 7 and 8.

*Note: a) '[HAIP] Section 5' refers only to the requirements directly under the Section 5 heading. This does not include sections 5.1, 5.2, and 5.3. b) For clarity: in [HAIP] v1.0, the 'ISO mdocs' profile implies that Relying Parties and Wallet Units must comply with the applicable requirements in [OpenID4VP] Annex B.2. c) This requirement and OIA_03c both correspond to the profile for transmission via redirects specified in [ETSI TS 119 472-2] Section 1, but are more specific with regard to format of the attestation.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-007" markdown>
<div class="eudi-hlr__id">EW-PIO-01-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_03c
{: .eudi-hlr__meta }

For remote presentation flows using redirects and [OpenID4VP], when the format of the requested attestation complies with [SD-JWT VC], Relying Parties and Wallet Units SHALL comply with the requirements in [HAIP] Sections 5, 5.1, and 5.3.2, as well as with the 'IETF SD-JWT VCs' profile in Section 6 and with Sections 7 and 8

*Note: a) '[HAIP] Section 5' refers only to the requirements directly under the Section 5 heading. This does not include sections 5.1, 5.2, and 5.3. b) For clarity: in [HAIP] v1.0 Section 6, the 'IETF SD-JWT VCs' profile implies that Relying Parties and Wallet Units must comply with the requirements in [OpenID4VP] Annex B.3, as well as with the requirements in Section 6.1.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-008" markdown>
<div class="eudi-hlr__id">EW-PIO-01-008<span class="kw-may">MAY</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_03d
{: .eudi-hlr__meta }

For remote presentation flows using redirects and [ISO/IEC 18013-7], Relying Parties and Wallet Units MAY comply with the requirements in [ISO/IEC 18013-7] Annex A.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-009" markdown>
<div class="eudi-hlr__id">EW-PIO-01-009</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_04
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-010" markdown>
<div class="eudi-hlr__id">EW-PIO-01-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_05
{: .eudi-hlr__meta }

After verifying and processing a PID or attestation request, the Wallet Unit SHALL display to the User the identity of the requesting Relying Party and the requested attributes.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-011" markdown>
<div class="eudi-hlr__id">EW-PIO-01-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_06
{: .eudi-hlr__meta }

A Wallet Unit SHALL present the requested attributes only after having received the User's approval.

*Note: See also OIA_07.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-012" markdown>
<div class="eudi-hlr__id">EW-PIO-01-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_07
{: .eudi-hlr__meta }

A Wallet Unit SHALL support selective disclosure of attributes from PIDs and attestations to be presented to the requesting Relying Parties.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-013" markdown>
<div class="eudi-hlr__id">EW-PIO-01-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08
{: .eudi-hlr__meta }

For remote presentation flows using the [W3C Digital Credentials API] and [OpenID4VP], when the format of the requested attestation complies with [ISO/IEC 18013-5], Relying Parties and Wallet Units SHALL comply with the requirements in [HAIP] Sections 5, 5.2 and 5.3.1, as well as with the 'ISO mdocs' profile in Section 6 and with Sections 7 and 8. 

*Note: a) '[HAIP] Section 5' refers only to the requirements directly under the Section 5 heading. b) For clarity: in [HAIP] v1.0, the 'ISO mdocs' profile implies that Relying Parties and Wallet Units must comply with the applicable requirements in [OpenID4VP] Annex B.2. c) This requirement and OIA_08a both correspond to the profile for API-mediated transmission specified in [ETSI TS 119 472-2] Section 1, but are more specific with regard to format of the attestation.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-014" markdown>
<div class="eudi-hlr__id">EW-PIO-01-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08a
{: .eudi-hlr__meta }

For remote presentation flows using the [W3C Digital Credentials API] and [OpenID4VP], when the format of the requested attestation complies with [SD-JWT VC], Relying Parties and Wallet Units SHALL comply with the requirements in [HAIP] Sections 5, 5.2 and 5.3.2, as well as with the 'IETF SD-JWT VCs' profile in Section 6 and with Sections 7 and 8.

*Note: a) '[HAIP] Section 5' refers only to the requirements directly under the Section 5 heading. b) For clarity: in [HAIP] v1.0 Section 6, the 'IETF SD-JWT VCs' profile implies that Relying Parties and Wallet Units must comply with the requirements in [OpenID4VP] Annex B.3, as well as with the requirements in Section 6.1.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-015" markdown>
<div class="eudi-hlr__id">EW-PIO-01-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08b
{: .eudi-hlr__meta }

For remote presentation flows using the [W3C Digital Credentials API] and [ISO/IEC 18013-7], Relying Party Instances and Wallet Units SHALL comply with the requirements in [ISO/IEC 18013-7] Annex C.

*Note: The latter restriction applies even if such disclosure would enhance the services provided by the operating system to the Wallet Unit, for example, attestation selection in the context of the Digital Credentials API.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-016" markdown>
<div class="eudi-hlr__id">EW-PIO-01-016<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08c
{: .eudi-hlr__meta }

Wallet Units SHOULD NOT support using a redirects-based transmission mechanism for cross-device presentation flows.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-017" markdown>
<div class="eudi-hlr__id">EW-PIO-01-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08d
{: .eudi-hlr__meta }

If a Relying Party uses a redirects-based transmission mechanism for cross-device presentation flows, it SHALL implement adequate mitigations for the challenges described in [Section 4.4.3.1][4431-introduction] of the ARF main document.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-018" markdown>
<div class="eudi-hlr__id">EW-PIO-01-018<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08e
{: .eudi-hlr__meta }

A Wallet Unit SHALL, by default (see OIA_08f), disclose the presence of all stored attestations (meaning their attestation type) to the Digital Credentials API framework, but it SHALL NOT disclose the presence of attributes in these attestations, nor their values.

*Note: The latter restriction applies even if such disclosure would enhance the services provided by the operating system to the Wallet Unit, for example, attestation selection in the context of the Digital Credentials API.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-019" markdown>
<div class="eudi-hlr__id">EW-PIO-01-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08f
{: .eudi-hlr__meta }

A Wallet Unit SHALL provide a global User setting to disable the disclosure of stored attestations to the Digital Credentials API framework, as described in OIA_08e. When this setting is set to disable disclosure, the Wallet Unit SHOULD subsequently enable the User to select individual attestations to be disclosed to the DC API.

*Note: If this setting is set to disable disclosure and the User does not subsequently select any individual attestations to be disclosed, the Wallet Unit will not disclose any attributes at all. As a result, presentation requests sent using the DC API will likely fail.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-020" markdown>
<div class="eudi-hlr__id">EW-PIO-01-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_08g
{: .eudi-hlr__meta }

In cross-device presentation flows using the [W3C Digital Credentials API], a Wallet Unit SHALL verify that the Relying Party Instance is in close physical proximity to the Wallet Unit. For this proximity check the Wallet Unit SHALL use a secure, direct, and user-mediated local communication channel, such as a short-range wireless communication technology.

*Note: In [CTAP] terms, this proximity check is the BLE proximity engagement, present in both the Hybrid transport specified in [CTAP] v2.2 and in [CTAP] v2.3. Where both devices support it, the underlying operating systems, browsers, mediating APIs, or any other technical layer outside the control of the Wallet Unit, should prefer performing both the proximity check and the data transfer over a local short-range channel (as enabled by [CTAP] v2.3) over the use of a Hybrid tunnel service first defined in [CTAP] v2.2.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-021" markdown>
<div class="eudi-hlr__id">EW-PIO-01-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_09
{: .eudi-hlr__meta }

For remote presentation flows the Wallet Unit SHALL ensure that the attributes included in the presented attestation are accessible only to the Relying Party Instance, by encrypting the presentation response.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-022" markdown>
<div class="eudi-hlr__id">EW-PIO-01-022<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_10
{: .eudi-hlr__meta }

For both proximity and remote presentation flows, if a Wallet Unit contains multiple PIDs having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and a Relying Party requests a PID having that encoding, the Wallet Unit SHALL ask the User which of these PIDs they want to present, unless the Wallet Unit can decide from context.

*Note: This requirement is not about multiple technical PIDs corresponding to a single logical PID, but to different logical PIDs whose technical PIDs have the same encoding. Probably, these logical PIDs are issued by different PID Providers.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-023" markdown>
<div class="eudi-hlr__id">EW-PIO-01-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_11
{: .eudi-hlr__meta }

For both proximity and remote presentation flows, if a Wallet Unit contains multiple attestations having the same encoding (e.g. ISO/IEC 18013-5 or SD-JWT VC-compliant) and the same attestation type, and a Relying Party requests an attestation having that type and encoding, the Wallet Unit SHALL ask the User which of these attestations they want to present, unless the Wallet Unit can decide from context.

*Note: a) Attestation types are explained in [Topic 12][topic-12]]. b) See note to OIA_10, which applies mutatis mutandis.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-025" markdown>
<div class="eudi-hlr__id">EW-PIO-01-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_13
{: .eudi-hlr__meta }

For both proximity and remote presentation flows, a Relying Party SHALL validate the qualified signature of a QEAA in accordance with Art.32 of the [European Digital Identity Regulation]. For the verification, the Relying Party SHALL use a trust anchor provided in a QEAA Provider Trusted List made available in accordance with [Art. 22](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv%3AOJ.L_.2014.257.01.0073.01.ENG#d1e2162-73-1) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-026" markdown>
<div class="eudi-hlr__id">EW-PIO-01-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_14
{: .eudi-hlr__meta }

For both proximity and remote presentation flows, a Relying Party SHALL validate the signature of a PuB-EAA using a trust anchor provided in a Pub-EAA Provider LoTE made available in accordance with [Topic 31][topic-31]].

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-027" markdown>
<div class="eudi-hlr__id">EW-PIO-01-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_15
{: .eudi-hlr__meta }

For both proximity and remote presentation flows, a Relying Party SHALL validate the signature of a non-qualified EAA using a trust anchor provided according to the mechanism(s) specified in the applicable Attestation Rulebook, see [Topic 12][topic-12]].

*Note: a) OIA_12 - OIA_15 imply that a Relying Party Instance must know if the attestation it is requesting from a Wallet Instance is a PID, a QEAA, a PuB-EAA, or a non-qualified EAA. These requirements also imply that the Relying Party Instance must store trust anchors in such a way that, at the time of verification, it is able to distinguish between trust anchors usable either for PIDs, for QEAAs, for PuB-EAAs, or for non-qualified EAAs.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-028" markdown>
<div class="eudi-hlr__id">EW-PIO-01-028<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_15a
{: .eudi-hlr__meta }

A Relying Party SHALL perform regular trust anchor management, meaning it SHALL download the latest version of all applicable Trusted Lists and LoTEs. If it finds that new trusted entities have been added, or that new trust anchors have been added for existing trusted entities, it SHALL ensure that these trust anchors are properly stored in all relevant Relying Party Instances. Conversely, if the Relying Party finds that an existing trusted entity has been invalidated in the Trusted List or LoTE, or that some of the trust anchors of existing trusted entities have expired, been revoked, or otherwise been invalidated, it SHALL ensure that these trust anchors are removed from all Relying Party Instances.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-01-029" markdown>
<div class="eudi-hlr__id">EW-PIO-01-029<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: OIA_15b
{: .eudi-hlr__meta }

For the retrieval and management of trust anchors, Relying Parties and Relying Party Instances SHALL support both Trusted Lists complying with [ETSI TS 119 612] and LoTEs complying with [ETSI TS 119 602].

*Note: Trusted Lists complying with [ETSI TS 119 612] are used for the distribution of trust anchors of QEAA Providers. LoTEs complying with [ETSI TS 119 602] are used for the distribution of trust anchors of PID Providers, PuB-EAA Providers, Access Certificate Authorities, and Providers of registration certificates.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-10-001" markdown>
<div class="eudi-hlr__id">EW-PIO-10-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ISSU_01
{: .eudi-hlr__meta }

Wallet Providers SHALL ensure that their Wallet Solution supports the OpenID4VCI protocol specified in [OpenID4VCI], as profiled in Sections 4 and 6 of [HAIP], and with additions and changes as documented in this Annex (see e.g. this Topic and [Topic 9][topic-9]) and in [Technical Specification 3](../../technical-specifications/ts3-wallet-unit-attestation.md).

*Note: For clarity: in [HAIP] v1.0, Section 6 implies that Wallet Units must comply with the applicable requirements in [OpenID4VCI] Annex A.2 when requesting the issuance of an attestation in ISO/IEC 18013-5-compliant format, and with the applicable requirements in [OpenID4VCI] Annex A.3 when requesting the issuance of an attestation in SD-JWT VC format.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-24-001" markdown>
<div class="eudi-hlr__id">EW-PIO-24-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ProxId_01
{: .eudi-hlr__meta }

To enable identification using proximity flows, Wallet Units SHALL support device retrieval as specified in ISO/IEC 18013-5 for presenting PID or attestation attributes. Wallet Units SHALL comply with the requirements for mDLs and mdocs ISO/IEC 18013-5.

*Note: Nominally, ISO/IEC 18013-5 is intended only for mDLs and mDL readers. The corresponding standard for mobile documents in general (including Wallet Units with the EUDI Wallet ecosystem) will be ISO/IEC 23220-4, which is based on ISO/IEC 18013-5. However, the latter standard is not finished yet and therefore cannot be referenced at the moment. To guarantee interoperability between Wallet Units and Relying Party Instances in proximity scenarios, it is necessary to make choices from among the possibilities specified in ISO/IEC 18013-5. Making the same choices as for mDLs ensure this.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-24-002" markdown>
<div class="eudi-hlr__id">EW-PIO-24-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ProxId_01a
{: .eudi-hlr__meta }

If a Relying Party supports using proximity flows, its Relying Party Instances SHALL support device retrieval as specified in ISO/IEC 18013-5 for requesting PID or attestation attributes. Such Relying Party Instances SHALL comply with the requirements for mDL readers and mdoc readers in ISO/IEC 18013-5.

*Note: See note to ProxId_01. Support for proximity flows by Relying Parties is not mandatory.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-24-003" markdown>
<div class="eudi-hlr__id">EW-PIO-24-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ProxId_02
{: .eudi-hlr__meta }

Wallet Units, PID Providers, Attestation Providers, Wallet Providers, and Relying Parties SHALL NOT support server retrieval as specified in ISO/IEC 18013-5 for requesting and presenting PID or attestation attributes.

*Note: Using server retrieval, a Relying Party would request User attributes directly from a PID Provider or Attestation Provider, after having received an authentication and/or authorisation token from the User's Wallet Unit.*

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-24-004" markdown>
<div class="eudi-hlr__id">EW-PIO-24-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ProxId_03
{: .eudi-hlr__meta }

A Wallet Unit SHALL present the presentation request and the identity of the Relying Party to the User when processing the request.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-24-005" markdown>
<div class="eudi-hlr__id">EW-PIO-24-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ProxId_04
{: .eudi-hlr__meta }

A Wallet Unit SHALL request its User to approve the presentation of attributes from their Wallet Unit for proximity identification before presenting them to the Relying Party or Verifier Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-24-006" markdown>
<div class="eudi-hlr__id">EW-PIO-24-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ProxId_05
{: .eudi-hlr__meta }

A Wallet Unit SHALL transmit the requested User attributes to the requesting Relying Party Instance securely in accordance with ISO/IEC 18013-5 for proximity flows.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-24-007" markdown>
<div class="eudi-hlr__id">EW-PIO-24-007</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ProxId_06
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-29-001" markdown>
<div class="eudi-hlr__id">EW-PIO-29-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RP_02
{: .eudi-hlr__meta }

An Attestation Provider issuing representation attestations to a natural person representing another natural person SHALL ensure that either the attestations are short-lived or that all entities which, according to applicable law, must have the ability to request revocation of such attestations, are able to do so.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-30-001" markdown>
<div class="eudi-hlr__id">EW-PIO-30-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: W2W_08
{: .eudi-hlr__meta }

A Verifier Wallet Unit and a Holder Wallet Unit SHALL support attestation presentation only in proximity, meaning they SHALL support only [ISO/IEC 18013-5] to communicate.

</div>
</div>


<div class="eudi-hlr" id="EW-PIO-43-001" markdown>
<div class="eudi-hlr__id">EW-PIO-43-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_09
{: .eudi-hlr__meta }

An Attestation Provider SHALL include an embedded disclosure policy (if any) by value in the Issuer metadata related to the attestation, in compliance with [OpenID4VCI] and [ETSI TS 119 472-3].

</div>
</div>


---

### 6. Data Models & Attestation Rules

*These requirements define the structure and meaning of the data being*
*exchanged. This includes HLRs for PIDs, Attestation Rulebooks, and Catalogues,*
*ensuring that the information exchanged is consistent and understandable across*
*the entire ecosystem.*

<div class="eudi-hlr" id="EW-DM-03-01" markdown>
<div class="eudi-hlr__id">EW-DM-03-01<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_01
{: .eudi-hlr__meta }

PIDs and PID Providers SHALL comply with all requirements in [PID Rulebook][pid-rulebook].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-02" markdown>
<div class="eudi-hlr__id">EW-DM-03-02<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_02
{: .eudi-hlr__meta }

A PID Provider SHALL issue any PID in both the format specified in ISO/IEC 18013-5 [ISO/IEC 18013-5] and the format specified in [SD-JWT VC].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-03" markdown>
<div class="eudi-hlr__id">EW-DM-03-03<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_03
{: .eudi-hlr__meta }

During issuance of a PID, the PID Provider MAY enable the User to opt out from receiving a portrait attribute in their PID. If the User opts out, the PID Provider SHALL include the `portrait` attribute in the PID as an empty JSON `string` or CBOR `bstr`, as applicable given the format of the PID.

*Note: As described in the PID Rulebook and in the Regulation amending [CIR 2024/2977], inclusion of the `portrait` attribute in the PID is mandatory only from 24 months after the entry into force of that Regulation. *

</div>
</div>


<div class="eudi-hlr" id="AS-RP-03-01" markdown>
<div class="eudi-hlr__id">AS-RP-03-01<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_03a
{: .eudi-hlr__meta }

If a Relying Party obtains the `portrait` attribute from a User's PID, it SHALL NOT retain the portrait, unless its processing is necessary for the purposes of identification and authentication in compliance with Union data protection law or where this is provided for by Union or national law, in compliance with Union data protection law. The Relying Party SHALL NOT transfer the portrait to third countries or international organisations unless permitted by Union data protection law.

*Note: See [CIR 2024/2977].*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-04" markdown>
<div class="eudi-hlr__id">EW-DM-03-04<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_04
{: .eudi-hlr__meta }

PID Providers SHALL use "eu.europa.ec.eudi.pid.1" as the attestation type for ISO/IEC 18013-5-compliant PIDs.

*Note: a) This identifier uses the general format [Reverse Domain].[Domain Specific Extension]. Since the European Commission controls the domain ec.europa.eu, this attestation type identifier will not collide with any attestation type identifiers defined by other organisations in other Attestation Rulebooks. b) The version number 1 in this identifier is used to distinguish between the first version of the PID, defined in the [PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md), and any future version, which will then have an incremented version number.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-05" markdown>
<div class="eudi-hlr__id">EW-DM-03-05<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_05
{: .eudi-hlr__meta }

When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL use the value "eu.europa.ec.eudi.pid.1" for the identifier of the namespace for the PID attributes specified in [Section 4.2 of the PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md).

*Note: a) The version number 1 allows for future extension(s) or change(s) of the ISO/IEC 18013-5-compliant PID attributes. b) This namespace has the same value as the attestation type specified in requirement PID_04. This is allowed according to ISO/IEC 18013-5.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-06" markdown>
<div class="eudi-hlr__id">EW-DM-03-06<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_06
{: .eudi-hlr__meta }

When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider MAY include attributes that are not defined in the [PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md). If so, these attributes SHALL be defined within a domestic PID namespace as meant in requirement ARB_10 in [Topic 12][topic-12]. The PID Provider SHALL generate the identifier for this domestic PID namespace by appending the applicable ISO 3166-1 alpha-2 country code or the ISO 3166-2 region code, separated by a period, to the PID namespace identifier specified in PID_05, excluding the version number. The PID Provider MAY include a version number in the domestic PID namespace identifier.

*Note: For example, the identifier of the first domestic PID namespace for Germany could be "eu.europa.ec.eudi.pid.de.1".*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-07" markdown>
<div class="eudi-hlr__id">EW-DM-03-07<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_07
{: .eudi-hlr__meta }

A PID Provider that defines a domestic namespace SHALL publish the namespace, including all attribute identifiers, their definition, presence and encoding format, in an Attestation Rulebook complying with all applicable requirements in [Topic 12][topic-12].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-08" markdown>
<div class="eudi-hlr__id">EW-DM-03-08<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_08
{: .eudi-hlr__meta }

When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL include both the attributes and the metadata specified in [CIR 2024/2977] in the PID as issuer-signed data elements.

*Note: This implies that technically speaking, there is no difference between these attributes and metadata.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-09" markdown>
<div class="eudi-hlr__id">EW-DM-03-09<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_09
{: .eudi-hlr__meta }

When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL encode each attribute or metadata in the PID as specified in the third column of the tables in [Section 4.2.1 of the PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md).

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-10" markdown>
<div class="eudi-hlr__id">EW-DM-03-10<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_10
{: .eudi-hlr__meta }

When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL encode each attribute or metadata in the PID in Concise Binary Object Representation (CBOR) according to [RFC 8949].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-11" markdown>
<div class="eudi-hlr__id">EW-DM-03-11<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_11
{: .eudi-hlr__meta }

When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that each PID contains at most one attribute with the same attribute identifier.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-12" markdown>
<div class="eudi-hlr__id">EW-DM-03-12<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_12
{: .eudi-hlr__meta }

When issuing a PID compliant with [ISO/IEC 18013-5], a PID Provider SHALL ensure that the value of all attributes and metadata in the PID is valid at the value of the timestamp in the validFrom element in the MSO, see [ISO/IEC 18013-5] clause 9.1.2.4.

*Note: The value of the age_over_18, age_over_NN, or age_in_years attributes, if present, changes whenever the User to whom the person identification data relates has a relevant birthday. The value of many other attributes will also change over time.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-13" markdown>
<div class="eudi-hlr__id">EW-DM-03-13<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_13
{: .eudi-hlr__meta }

If a PID Provider issues PIDs compliant with [ISO/IEC 18013-5] and containing the `issuance_date` or `expiry_date` attributes, the PID Provider SHALL have a policy for determining the value of these attributes relative to the `validFrom` and `validUntil` elements in the MSO, see [ISO/IEC 18013-5] clause 9.1.2.4.

*Note: See the notes to the `issuance_date` and `expiry_date` attributes in [PID Rulebook][pid-rulebook]. Examples of aspects to be considered in the policy may include (but are not limited to) the following:  1)  If an `issuance_date` or `expiry_date` is encoded as a `full-date` (rather than a `tdate`), it has no time element. However, `validFrom` and `validUntil` contain a time element, which is expressed in UTC. Therefore, comparing `expiry_date` to `validUntil`, for instance, may give ambiguous results in case the local time is not equal to UTC. The policy should ensure that situations are avoided where the User can legitimately expect (based on the values of `issuance_date` and `expiry_date` shown by the Wallet Unit when displaying the PID) that they can use their PID, while in reality its technical validity period (as determined by `validFrom` and `validUntil`) has not yet begun or has ended. 2) The exact meaning of `issuance_date` and `expiry_date` depends on local law and regulations. For example, in some jurisdictions an identity document whose `expiry_date` is in the past may by law still be used for identification for some purposes. However, this requires that the PID is still valid according to the `validFrom` and `validUntil` timestamps in the MSO. 3) A local requirement may exist stating that `issuance_date` and `expiry_date` must be identical to the dates on an existing physical document of the User.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-14" markdown>
<div class="eudi-hlr__id">EW-DM-03-14<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_14
{: .eudi-hlr__meta }

A PID Provider issuing [SD-JWT VC]-compliant PIDs SHALL include the vct claim in their PIDs, where the vct claim SHALL be a URN within the `urn:eudi:pid:` namespace. The type indicated by the vct claim SHALL be `urn:eudi:pid:1` for the type defined in this document or a domestic type that extends it.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-15" markdown>
<div class="eudi-hlr__id">EW-DM-03-15</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_15
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-16" markdown>
<div class="eudi-hlr__id">EW-DM-03-16<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_16
{: .eudi-hlr__meta }

A PID Provider that defines a domestic type SHALL publish information about the type, including all claim identifiers, their definition, presence and encoding format, in an Attestation Rulebook complying with all applicable requirements in [Topic 12][topic-12].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-17" markdown>
<div class="eudi-hlr__id">EW-DM-03-17<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_17
{: .eudi-hlr__meta }

When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL include both the attributes and the metadata specified in [CIR 2024/2977] in the PID as claims.

*Note: This implies that technically speaking, there is no difference between these attributes and metadata.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-18" markdown>
<div class="eudi-hlr__id">EW-DM-03-18<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_18
{: .eudi-hlr__meta }

When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL encode each attribute or metadata in the PID as specified in the tables in [Section 5.2 of the PID Rulebook](../annex-3/annex-3.01-pid-rulebook.md).

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-19" markdown>
<div class="eudi-hlr__id">EW-DM-03-19<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_19
{: .eudi-hlr__meta }

When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL ensure that the value of all attributes and metadata in the PID is valid at the value of the timestamp in the nbf claim, if present.

*Note: The value of the age-related claims, if present, changes whenever the User to whom the person identification data relates has a relevant birthday. The value of many other attributes will also change over time.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-20" markdown>
<div class="eudi-hlr__id">EW-DM-03-20<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_20
{: .eudi-hlr__meta }

If a PID Provider issues PIDs compliant with [SD-JWT VC] and containing the `date_of_issuance` or `date_of_expiry` claims, the PID Provider SHALL have a policy for determining the value of these claims relative to the `nbf` and `exp` claims in the SD-JWT VC, see [SD-JWT VC] section 3.2.2.2.

*Note: See the notes to the `date_of_issuance` and `date_of_expiry` attributes in [PID Rulebook][pid-rulebook]. Examples of aspects to be considered in the policy may include (but are not limited to) the following: 1) `date_of_issuance` and `date_of_expiry` claims do not have a time element. However, `nbf` and `exp` express a time relative to UTC. Therefore, comparing `date_of_expiry` to `exp`, for instance, may give ambiguous results in case the local time is not equal to UTC. The policy should ensure that situations are avoided where the User can legitimately expect (based on the value of `date_of_issuance` and `date_of_expiry` shown by the Wallet Unit when displaying the PID) that they can use their PID, while in reality its technical validity period (as determined by `nbf` and `exp`) has not yet begun or has ended. 2) The exact meaning of `date_of_issuance` and `date_of_expiry` depends on local law and regulations. For example, in some jurisdictions an identity document whose `date_of_expiry` is in the past may by law still be used for identification for some purposes. However, this requires that the PID is still valid according to the `nbf` and `exp` timestamps in the SD_JWT VC. 3) A local requirement may exist stating that `date_of_issuance` and `date_of_expiry` must be identical to the dates on an existing physical document of the User.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-03-21" markdown>
<div class="eudi-hlr__id">EW-DM-03-21<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: PID_21
{: .eudi-hlr__meta }

When issuing a PID compliant with [SD-JWT VC], a PID Provider SHALL make all claims (i.e., all top-level properties, all nested properties, and all array entries) selectively disclosable individually, except those claims defined as non-selectively disclosable in [SD-JWT VC].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-04-001" markdown>
<div class="eudi-hlr__id">EW-DM-04-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: mDL_01
{: .eudi-hlr__meta }

mDLs and mDL Providers SHALL comply with all requirements in [mDL Rulebook][mdl-rulebook].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-001" markdown>
<div class="eudi-hlr__id">EW-DM-12-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_01a
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify that one or more of the following three common format(s) must be used for these attestations: - The format specified in ISO/IEC 18013-5, see [ISO/IEC 18013-5]. - The format specified in SD-JWT-based Verifiable Credentials (SD-JWT VC), see [SD-JWT VC]. - The format specified in W3C Verifiable Credentials Data Model, see [W3C VCDM v2.0].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-002" markdown>
<div class="eudi-hlr__id">EW-DM-12-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_01b
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing attestations using the format specified in [SD-JWT VC] SHALL ensure that these attestations comply with the 'IETF SD-JWT VC Profile' specified in [HAIP] Section 6.1.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-003" markdown>
<div class="eudi-hlr__id">EW-DM-12-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_02
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook SHALL analyse whether it must be possible for a User to present that type of attestation when the Wallet Unit and the Relying Party are in proximity and attestations are presented without using the internet. If so, the Attestation Rulebook SHALL specify that the attestations must be issued in the ISO/IEC 18013-5-compliant mdoc format.

*Note: In theory, it is possible to use SD-JWT VC-compliant attestations in proximity use cases. In practice, however, the only protocol available to request and present SD-JWT VC-compliant attestations between a Wallet Unit and a Relying Party Instance is OpenID4VP. That protocol cannot be used without internet connectivity.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-004" markdown>
<div class="eudi-hlr__id">EW-DM-12-004<span class="kw-may">MAY</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_03
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook MAY specify in the Attestation Rulebook that that type of attestation must be issued in the [SD-JWT VC]-compliant format, provided the [SD-JWT VC] specification has been approved by an EU standardisation body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-005" markdown>
<div class="eudi-hlr__id">EW-DM-12-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_04
{: .eudi-hlr__meta }

If an Attestation Rulebook specifies that a type of attestation can be issued in a format compliant with [W3C VCDM v2.0], the Scheme Provider for that Attestation Rulebook SHALL ensure the Rulebook references one or more documents specifying in detail how a Relying Party can request attributes from a such an attestation, and how a User can selectively disclose attributes from such an attestation. Moreover, these referenced documents SHALL be approved by an EU standardisation body or by the European Digital Identity Cooperation Group established pursuant to [Article 46e](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e4536-1-1)(1) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-006" markdown>
<div class="eudi-hlr__id">EW-DM-12-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_05
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook SHALL specify a value for the attestation type, which SHALL be unique within the scope of the EUDI Wallet ecosystem.

*Note: In ISO/IEC 18013-5, the attestation type is called 'document type' and is included as a `docType` key-value pair in both the mdoc request and the mdoc response. Also, a method for generating unique attestation type values is recommended. In OpenID4VP, the attestation type is included in the `meta` property of a Credential Query in a presentation request. In [SD-JWT VC], the attestation type is called 'SD-JWT VC type' and is included as a `vct` claim in the SD-JWT VC.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-007" markdown>
<div class="eudi-hlr__id">EW-DM-12-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_06
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook SHALL define all attributes that an attestation of that type may contain. This definition SHALL first describe the semantics of each attribute in an encoding-independent manner and SHALL subsequently for each attribute specify an ISO/IEC 18013-5-compliant format, an SD-JWT VC-compliant format, or both, as needed given the choices made according to ARB_01 - ARB_04.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-008" markdown>
<div class="eudi-hlr__id">EW-DM-12-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_06a
{: .eudi-hlr__meta }

For ISO/IEC 18013-5-compliant attestations, the Attestation Rulebook SHALL define each attribute within an attribute namespace. An attribute namespace SHALL fully define the identifier, the syntax, and the semantics of each attribute within that namespace. An attribute namespace SHALL have an identifier that is unique within the scope of the EUDI Wallet ecosystem, and each attribute identifier SHALL be unique within that namespace.

*Note: In ISO/IEC 18013-5, namespaces are discussed and a method for generating unique namespace identifiers is recommended.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-009" markdown>
<div class="eudi-hlr__id">EW-DM-12-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_06b
{: .eudi-hlr__meta }

For [SD-JWT VC]-compliant attestations, the Scheme Provider for the Attestation Rulebook SHALL ensure that each claim name is either: - included in the IANA registry for JWT claims, - is a Public Name as defined in [RFC 7519], or is a Private Name specific to the attestation type.

*Note: [SD-JWT VC] does not discuss how to avoid conflicting claim names. Since SD-JWTs are a special kind of JWTs, the methods specified in RFC 7519 are applicable.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-010" markdown>
<div class="eudi-hlr__id">EW-DM-12-010<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_07
{: .eudi-hlr__meta }

When determining the attributes to be included in a new attestation type, the Scheme Provider for the applicable Attestation Rulebook SHOULD consider referring to attributes that are already included in the catalogue of attributes specified in [Topic 25][topic-25] or specified in an attestation scheme included in the catalogue of attestation schemes specified in [Commission Implementing Regulation 2025/1569](http://data.europa.eu/eli/reg_impl/2025/1569/oj), rather than unnecessarily re-defining all attributes.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-011" markdown>
<div class="eudi-hlr__id">EW-DM-12-011<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_08
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook SHOULD, when specifying a new attribute, take into consideration existing conventions for attribute identifier values and attribute syntaxes.

*Note: These conventions may depend on the format of the attestation, i.e., CBOR for ISO/IEC 18013-5-compliant attestations or JSON for SD-JWT VC-compliant attestations.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-012" markdown>
<div class="eudi-hlr__id">EW-DM-12-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_09
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook SHALL specify, for each attribute in the attestation, whether the presence of that attribute is mandatory, optional, or conditional.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-013" markdown>
<div class="eudi-hlr__id">EW-DM-12-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_10
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook for an ISO/IEC 18013-5 compliant attestation MAY define a domestic namespace to specify attributes that are specific to that Rulebook and are not included in the applicable EU-wide or sectoral namespace. All requirements for namespaces in this Topic SHALL also apply for domestic namespaces.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-014" markdown>
<div class="eudi-hlr__id">EW-DM-12-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_11
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook an attribute as meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point a) and [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point a) of the [European Digital Identity Regulation]. This attribute SHALL reference the technical specification meant in ARB_25.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-015" markdown>
<div class="eudi-hlr__id">EW-DM-12-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_12
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include an attribute in the Rulebook indicating that the attestation is an EAA. This attribute SHALL reference the technical specification meant in ARB_25.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-016" markdown>
<div class="eudi-hlr__id">EW-DM-12-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_13
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point b) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-017" markdown>
<div class="eudi-hlr__id">EW-DM-12-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_14
{: .eudi-hlr__meta }

The Scheme Provider for an attestation Rulebook describing a type of attestation that is a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point b) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-018" markdown>
<div class="eudi-hlr__id">EW-DM-12-018<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_15
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point b) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-019" markdown>
<div class="eudi-hlr__id">EW-DM-12-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_16
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point c) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e46-55-1) point c) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-020" markdown>
<div class="eudi-hlr__id">EW-DM-12-020<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_17
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point c) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-021" markdown>
<div class="eudi-hlr__id">EW-DM-12-021<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_18
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point e) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point e) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-022" markdown>
<div class="eudi-hlr__id">EW-DM-12-022<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_19
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes representing the set of data meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point e) of the [European Digital Identity Regulation].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-023" markdown>
<div class="eudi-hlr__id">EW-DM-12-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_20
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL include in the Rulebook one or more attributes or metadata representing the location meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point h) or [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point h) of the [European Digital Identity Regulation]. This location SHALL indicate at least the URL at which a machine-readable version of the trust anchor to be used for verifying the QEAA or PuB-EAA can be found or looked up.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-024" markdown>
<div class="eudi-hlr__id">EW-DM-12-024<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_21
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD include in the Rulebook one or more attributes or metadata representing the location at which a machine-readable version of the trust anchor to be used for verifying the EAA can be found or looked up.

*Note: What this location indicates precisely is dependent on the nature of the mechanism used for distributing trust anchors - see requirement ARB_26.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-025" markdown>
<div class="eudi-hlr__id">EW-DM-12-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_22
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook SHALL specify all technical details necessary to ensure interoperability, security, and privacy of that attestation.

*Note: An Attestation Rulebook may also specify requirements regarding how the Wallet Unit must display the attestation and the attributes in it to the User.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-026" markdown>
<div class="eudi-hlr__id">EW-DM-12-026<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_23
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA or a PuB-EAA SHALL specify which of the revocation mechanisms specified in [Topic 7][topic-7] SHALL be supported by that attestation.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-027" markdown>
<div class="eudi-hlr__id">EW-DM-12-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_24
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHALL specify whether that type of EAA must be revocable. If an EAA type must be revocable, the relevant Rulebook SHALL determine which of the revocation mechanisms specified in [Topic 7][topic-7] SHALL be supported by that attestation.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-028" markdown>
<div class="eudi-hlr__id">EW-DM-12-028<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_24a
{: .eudi-hlr__meta }

If an attestation is revocable, the relevant Attestation Rulebook SHALL specify the URL at which Relying Parties and other entities can retrieve the relevant Attestation Status Lists or Attestation Revocation Lists. 

*Note: This could be the domain name only, as the full URL containing the ASL or ARL relevant for an individual attestation will anyway be included in that attestation.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-029" markdown>
<div class="eudi-hlr__id">EW-DM-12-029<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_25
{: .eudi-hlr__meta }

An Attribute Schema Provider SHALL include in its Attestation Rulebook the attribute `attestation_legal_category`, specified in the [Attestation Rulebook Template](https://github.com/eu-digital-identity-wallet/eudi-doc-attestation-rulebooks-catalog/blob/main/template/attestation-rulebook-template.md), with the appropriate value as specified in the Template.

*Note: This attribute contains the indication meant in [Annex V](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-54-1) point a) and [Annex VII](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32024R1183#d1e40-56-1) point a).*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-030" markdown>
<div class="eudi-hlr__id">EW-DM-12-030<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_26
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a non-qualified EAA SHOULD define in the Rulebook the mechanism(s) allowing a Relying Party to obtain, in a trustworthy manner, the trust anchor(s) of the EAA Providers issuing this type of EAA.

*Note: [Technical Specification 11][ts11], section 4.3.1, recommends the use of the List of trusted entities (LoTE) data model as defined in [ETSI TS 119 602] for non-qualified EAAs.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-031" markdown>
<div class="eudi-hlr__id">EW-DM-12-031</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_27
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-032" markdown>
<div class="eudi-hlr__id">EW-DM-12-032<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_28
{: .eudi-hlr__meta }

An Attribute Scheme Provider MAY specify an attribute in an Attestation Rulebook that indicates whether the Attestation Provider during attestation issuance requested a cryptographic binding (as specified in [Topic 18][topic-18]) between the new attestation and an existing PID or attestation. If present in a Rulebook, the identifier for this attribute SHALL be `cryptographically_bound_to`, and its contents SHALL be an attestation type or vct (see ARB_05).

*Note: The meaning of this attribute, if present, is that this attestation is cryptographically bound to one or more attestations of the given attestation type or vct on this Wallet Unit. If a Relying Party receives this attribute from a Wallet Unit, it can subsequently request the Wallet Unit to send a proof of cryptographic binding between the attestation and an attestation indicated in the `cryptographically_bound_to` attribute.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-033" markdown>
<div class="eudi-hlr__id">EW-DM-12-033<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_29
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook describing a type of attestation that is a QEAA, PuB-EAA, or non-qualified EAA SHOULD ensure that the structure and contents of the Attestation Rulebook follow the descriptions in the [Attestation Rulebook template](https://github.com/eu-digital-identity-wallet/eudi-doc-attestation-rulebooks-catalog/blob/main/template/attestation-rulebook-template.md).

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-034" markdown>
<div class="eudi-hlr__id">EW-DM-12-034<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_30
{: .eudi-hlr__meta }

If an Attestation Rulebook specifies a [SD-JWT VC]-compliant attestation, the Scheme Provider for that Attestation Rulebook SHALL specify for all claims (i.e., all top-level properties, all nested properties, and all array entries) whether an Attestation Provider MUST, MAY, or MUST NOT make that claim selectively disclosable.

*Note: a) This requirement does not apply to claims defined as non-selectively disclosable in [SD-JWT VC]. b) There will be use cases where a specific claim must not be disclosed without simultaneously disclosing one or more other claims. Such cases should be solved by making all of these claims members of the same JSON object (or elements of the same JSON array). That JSON object (or array) is then the claim that must be selectively disclosable, while the nested properties (or individual array elements) must not be selectively disclosable. c) This requirement does not apply to [ISO/IEC 18013-5]-compliant attestations, since in such attestations, by definition all data elements are selectively disclosable, while none of the key-value pairs or array elements inside a data element (if any) are selectively disclosable.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-035" markdown>
<div class="eudi-hlr__id">EW-DM-12-035<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_31
{: .eudi-hlr__meta }

If an Attestation Rulebook specifies a [SD-JWT VC]-compliant attestation, the Scheme Provider for that Attestation Rulebook SHOULD consider defining a Type Metadata Document for it, as defined in Chapter 6 of [SD-JWT VC]. If the Scheme Provider defines such a document, it SHOULD contain the Claim Selective Disclosure Metadata (defined in Section 9.3 of [SD-JWT VC]) for each of the claims, in order to specify if that claim is selectively disclosable (see requirement ARB_30).

*Note: Although a Type Metadata Document is a highly technical document, defining it has a number of advantages for developers, Attestation Providers, Relying Parties, and Wallet Units, as spelled out in Chapter 6 of [SD-JWT VC].*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-036" markdown>
<div class="eudi-hlr__id">EW-DM-12-036</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_32
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-037" markdown>
<div class="eudi-hlr__id">EW-DM-12-037<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_33
{: .eudi-hlr__meta }

If a Scheme Provider for an Attestation Rulebook registers an attestation scheme in the catalogue of attestation schemes meant in [Commission Implementing Regulation 2025/1569](http://data.europa.eu/eli/reg_impl/2025/1569/oj), Article 8, the registration SHALL include a reference to the corresponding Attestation Rulebook.

*Note: By definition, an attestation scheme is machine-readable, whereas an Attestation Rulebook is human-readable.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-12-038" markdown>
<div class="eudi-hlr__id">EW-DM-12-038<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ARB_34
{: .eudi-hlr__meta }

The Scheme Provider for an Attestation Rulebook SHALL specify whether that attestation is device-bound or not.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-28-001" markdown>
<div class="eudi-hlr__id">EW-DM-28-001</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: LP_03
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="AS-MS-31-025" markdown>
<div class="eudi-hlr__id">AS-MS-31-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPACANot_06
{: .eudi-hlr__meta }

If an Access Certificate Authority is suspended or cancelled (see requirement GenNot_05 above), that Access Certificate Authority SHALL immediately revoke all of its temporally valid access certificates.

*Note: This implies that if an intermediary obtained its access certificates from an Access Certificate Authority that is suspended or cancelled, any intermediated Relying Party depending on that intermediary will not be able to request attributes from Wallet Units, even though its registration is still valid. Such an intermediated Relying Party will either have to transit to another intermediary (which has access certificates issued by an active Access Certification Authority) or wait until the original intermediary obtains new access certificates either from another Access CA or from the original one, once that CA can continue its operations.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-31-002" markdown>
<div class="eudi-hlr__id">EW-DM-31-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_03
{: .eudi-hlr__meta }

The publication of the information referred to in TLPub_01 SHALL take place over a secure channel protecting the authenticity and integrity of the published information.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-31-003" markdown>
<div class="eudi-hlr__id">EW-DM-31-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_04
{: .eudi-hlr__meta }

The technical system mentioned in TLPub_01 SHALL NOT require authentication or prior registration and authorisation of any entity wishing to retrieve the published information.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-31-004" markdown>
<div class="eudi-hlr__id">EW-DM-31-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: TLPub_05
{: .eudi-hlr__meta }

The information referred to in TLPub_01 SHALL be published in an electronically signed or sealed form that is suitable for automated processing, and in a human-readable format, e.g., through introspection and display facilities, over an authenticated channel.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-001" markdown>
<div class="eudi-hlr__id">EW-DM-38-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_03
{: .eudi-hlr__meta }

A Wallet Provider SHALL have a policy governing all aspects of WIA and KA issuance and management, in line with clauses 6 and 7 of [ETSI TS 119 471], incorporating the amendments introduced by [CIR 2025/1569] and subject to the necessary adaptations to WIAs and KAs. The policy SHALL distinguish between WIAs, KAs for WSCA/WSCDs, and KAs for keystores. For KAs describing a WSCA/WSCD, the policy SHALL comply with at least the extended normalised certificate policy ('NCP+') requirements as specified in [ETSI EN 319 411-1], insofar applicable for the issuance of KAs rather than public key certificates. For KAs describing a keystore, the policy SHALL comply with at least the normalised certificate policy ('NCP') requirements as specified in [ETSI EN 319 411-1], insofar applicable for the issuance of KAs rather than public key certificates.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-002" markdown>
<div class="eudi-hlr__id">EW-DM-38-002</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_04
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-003" markdown>
<div class="eudi-hlr__id">EW-DM-38-003</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_05
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-004" markdown>
<div class="eudi-hlr__id">EW-DM-38-004</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_06
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-023" markdown>
<div class="eudi-hlr__id">EW-DM-38-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_07a
{: .eudi-hlr__meta }

To revoke a WSCD or keystore of a Wallet Unit, the Wallet Provider SHALL, in the status list(s) for WSCDs and keystores, set the `revoked` status at all index positions mentioned in the KAs describing that WSCD or keystore.

*Note: For this requirement, it does not matter whether each index in the status list(s) for WSCDs and keystores refers to a type of WSCD or keystore or to an individual WSCD or keystore.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-006" markdown>
<div class="eudi-hlr__id">EW-DM-38-006</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_08
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-016" markdown>
<div class="eudi-hlr__id">EW-DM-38-016</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_15
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-018" markdown>
<div class="eudi-hlr__id">EW-DM-38-018</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_17
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-019" markdown>
<div class="eudi-hlr__id">EW-DM-38-019</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_19a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-020" markdown>
<div class="eudi-hlr__id">EW-DM-38-020</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_19b
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-021" markdown>
<div class="eudi-hlr__id">EW-DM-38-021</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_20
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-38-022" markdown>
<div class="eudi-hlr__id">EW-DM-38-022</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: WURevocation_21
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-43-001" markdown>
<div class="eudi-hlr__id">EW-DM-43-001</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: EDP_04
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-001" markdown>
<div class="eudi-hlr__id">EW-DM-44-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_01
{: .eudi-hlr__meta }

Providers of registration certificates SHALL comply with all relevant requirements in [ETSI TS 119 475].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-002" markdown>
<div class="eudi-hlr__id">EW-DM-44-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_01a
{: .eudi-hlr__meta }

A Provider of registration certificates SHALL be able to revoke a registration certificate, if it has a validity period of longer than 24 hours, in accordance with the applicable requirements in [ETSI TS 119 475].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-003" markdown>
<div class="eudi-hlr__id">EW-DM-44-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_01b
{: .eudi-hlr__meta }

A Provider of registration certificates SHALL have a policy specifying under which conditions a registration certificate it issued will be revoked.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-004" markdown>
<div class="eudi-hlr__id">EW-DM-44-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_02
{: .eudi-hlr__meta }

When signing a registration certificate, the Provider of registration certificates SHALL include the signing certificate and, if present, any intermediate certificate(s) leading up to the corresponding trust anchor of the Provider in the LoTE, in the `x5c` parameter in the JOSE header of the registration certificate.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-005" markdown>
<div class="eudi-hlr__id">EW-DM-44-005<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_02a
{: .eudi-hlr__meta }

For the verification of the registration certificates of Relying Parties, a Wallet Unit SHALL accept all trust anchors of Providers of registration certificates, as published by the Commission in the relevant LoTE, and only those.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-006" markdown>
<div class="eudi-hlr__id">EW-DM-44-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_03
{: .eudi-hlr__meta }

The contents of a registration certificate SHALL include at least the information required in Annex V of the [CIR 2025/848](https://data.europa.eu/eli/reg_impl/2025/848/oj) regarding registration of wallet-relying parties.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-007" markdown>
<div class="eudi-hlr__id">EW-DM-44-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_04
{: .eudi-hlr__meta }

If the subject of the registration certificate uses the services of an intermediary (see [Topic 52][topic-52]), the 'association to the intermediary' mentioned in Annex I (15) of [CIR 2025/848] (and referenced in Annex V, point 3(j) of that CIR) SHALL consist of the unique identifier of this intermediary, as meant in requirement Reg_32 and the intermediary's Relying Party Service identifier as meant in Reg_33.

*Note: a) These identifiers are identical to those in the access certificate of the intermediary. b) The association is also included in the respective access certificate of the intermediary, see Reg_34a.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-008" markdown>
<div class="eudi-hlr__id">EW-DM-44-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_04a
{: .eudi-hlr__meta }

The registration certificate format SHALL provide for the data elements to carry the Relying Party Service identifier mentioned in Reg_33 and the Relying Party Service trade name mentioned in Reg_34. 

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-009" markdown>
<div class="eudi-hlr__id">EW-DM-44-009<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_05
{: .eudi-hlr__meta }

If the subject of the registration certificate is not a Relying Party (i.e. in the terms of CIR 2025/848, a Service Provider), the certificate SHALL NOT contain the intended use as meant in Annex I (9) and (10) of CIR 2025/848.

*Note: A PID Provider or Attestation Provider may request attributes from the Wallet Unit during issuance, for example to identify and authenticate the User. If so, it registers as both a Service Provider and an Attestation Provider, and consequently its registration certificate contains its intended use.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-010" markdown>
<div class="eudi-hlr__id">EW-DM-44-010<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_06
{: .eudi-hlr__meta }

The contents of a registration certificate SHALL include a trade name for the subject of the certificate, in a format suitable for presenting to a User, which SHALL be identical to the trade name in the access certificates of the entity, see Reg_31.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-011" markdown>
<div class="eudi-hlr__id">EW-DM-44-011<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_07
{: .eudi-hlr__meta }

The contents of a registration certificate SHALL include an EU-wide unique identifier for the subject of the certificate, which SHALL be identical to the identifier in the access certificates of that entity, see Reg_32.

*Note: a) A Wallet Unit needs an identifier for a Relying Party at least to allow the User to send a report of suspicious Relying Party presentation requests to a data protection authority according to [Topic 50][topic-50].*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-012" markdown>
<div class="eudi-hlr__id">EW-DM-44-012<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_07a
{: .eudi-hlr__meta }

The contents of a registration certificate SHALL contain an identifier and a trade name for the Relying Party Service, which SHALL be identical to the Service identifier and trade name in one or more of the access certificates of that entity, see Reg_33 and Reg_34.

*Note: There must be at least one Relying Party Instance or service supply point that is able to use a given registration certificate.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-013" markdown>
<div class="eudi-hlr__id">EW-DM-44-013<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_08
{: .eudi-hlr__meta }

The EU-wide unique identifier meant in RPRC_07 SHALL be identical in all registration certificates issued for a given entity.

*Note: In case the registration certificates issued to an intermediated Relying Party are held and presented by an intermediary, the entity meant in this requirement is the intermediated Relying Party. An intermediary may obtain and hold registration certificates with a different unique identifier for other intermediated Relying Parties.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-014" markdown>
<div class="eudi-hlr__id">EW-DM-44-014<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_09
{: .eudi-hlr__meta }

During the registration process for Relying Parties, as specified in [Topic 27][topic-27], a Provider of registration certificates associated to the Member State Registrar SHALL create and sign or seal a separate registration certificate for each combination of intended use and Relying Party Service, as registered by the Relying Party per Reg_10d, and issue it to the Relying Party. The Provider of registration certificates SHALL do so in an automated manner and without undue delay. Each registration certificate SHALL comply with the requirements in the technical specification mentioned in RPRC_01. 

*Note: Example clarifying 'each combination of intended use and Relying Party Service': If a Relying Party registers Service A having intended use 1 and 2, Service B having intended uses 2, 3, 4 and 5, and Service C having intended use 4, it would receive seven registration certificates. *

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-015" markdown>
<div class="eudi-hlr__id">EW-DM-44-015<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_10
{: .eudi-hlr__meta }

A Relying Party SHALL distribute the registration certificates it received during registration to its Relying Party Instances. The Relying Party SHALL ensure that the registration certificate(s) sent to a Relying Party Instance contain the same Service identifier as the access certificate of that Relying Party Instance.

*Note: It is up to the Relying Party to determine if all of its Relying Party Instances need all of the registration certificates, or that some Relying Party Instances are used only for a subset of the Relying Party's Services, and consequently only need the registration certificates containing the corresponding Service identifiers.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-016" markdown>
<div class="eudi-hlr__id">EW-DM-44-016<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_11
{: .eudi-hlr__meta }

The contents of a registration certificate issued to a Relying Party SHALL contain at least one of the following: a) the URL of a web form provided by the Relying Party, which Users can use to send data deletion requests, b) an e-mail address of the Relying Party, on which the Relying Party is prepared to receive data deletion requests from Users, c) a telephone number of the Relying Party, on which the Relying Party is prepared to receive data deletion requests from Users.

*Note: See [Topic 48][topic-48] for more information about data deletion requests.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-017" markdown>
<div class="eudi-hlr__id">EW-DM-44-017<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_12
{: .eudi-hlr__meta }

The contents of a registration certificate issued to a Relying Party SHALL contain the name and country of the Data Protection Authority supervising the Relying Party. In addition, the registration certificate SHALL contain at least one of the following: a) the URL of a web form provided by the DPA, which Users can use to report suspicious attribute presentation requests. b) an e-mail address of the DPA, on which the DPA is prepared to receive reports about suspicious attribute presentation requests from Users, c) a telephone number of the DPA, on which the DPA is prepared to receive reports about suspicious attribute presentation requests from Users.

*Note: See [Topic 50][topic-50] for more information about reporting suspicious attribute presentation requests.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-018" markdown>
<div class="eudi-hlr__id">EW-DM-44-018</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_16
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-019" markdown>
<div class="eudi-hlr__id">EW-DM-44-019<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_17
{: .eudi-hlr__meta }

A Wallet Unit SHALL verify the format, authenticity, and validity of the registration certificate it received from a Relying Party in a presentation request, according to the technical specification meant in RPRC_01. If the certificate is absent, malformed, inauthentic, or expired, the Wallet Unit SHALL, when asking for User approval according to RPA_07, warn the User that it could not obtain or validate the information registered about the Relying Party and its Service. In addition, the Wallet Provider SHALL determine, based on its risk analysis and security policy, whether and under which conditions the Wallet Unit will allow the User to approve the presentation of the requested attributes despite specific failed verifications.

*Note: The requirement for Wallet Units to verify and validate registration certificates only applies as of 24 months after entry into force of the Regulation amending [CIR 2024/2982].*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-020" markdown>
<div class="eudi-hlr__id">EW-DM-44-020<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_17a
{: .eudi-hlr__meta }

A Wallet Unit SHALL verify that the registration certificate contains the same unique Relying Party identifier and the same Service identifier as the access certificate in the presentation request. If this is not the case, the Wallet Unit SHALL, when asking for User approval according to RPA_07, warn the User that it could not validate the information registered about the Relying Party and its Service. In addition, the Wallet Provider SHALL determine, based on its risk analysis and security policy, whether and under which conditions the Wallet Unit will allow the User to approve the presentation of the requested attributes despite this failed verification.

*Note: a) There are two ways in which a registration certificate can comply with this requirement: either the access certificate and the registration certificate were issued to the same entity, or the access certificate was issued to an intermediary (see [Topic 52][topic-52]), and the registration certificate indicates that the intermediated Relying Party uses the services of this intermediary. b) If the registration certificate does not comply with this requirement, a fraudulent entity acting as a Relying Party may be trying to use a registration certificate that was issued to another Relying Party.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-021" markdown>
<div class="eudi-hlr__id">EW-DM-44-021</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_18
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-022" markdown>
<div class="eudi-hlr__id">EW-DM-44-022</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_18a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-023" markdown>
<div class="eudi-hlr__id">EW-DM-44-023<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_19
{: .eudi-hlr__meta }

A Relying Party Instance SHALL include a single registration certificate applicable for its current Service and intended use in each presentation request to a Wallet Unit, according to the applicable standard's extension mentioned in RPRC_20. The registration certificate SHALL be included in the request by value, not by reference. The Relying Party Instance SHALL do so both in proximity and remote presentation flows.

*Note: a) This ensures that no external requests are necessary to validate the Relying Party. b) A Relying Party Instance may be used for multiple Relying Party Services, provided it has a separate access certificate for each of these Services, see RPA_06 and Reg_10b.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-024" markdown>
<div class="eudi-hlr__id">EW-DM-44-024</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_19a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-025" markdown>
<div class="eudi-hlr__id">EW-DM-44-025<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_20
{: .eudi-hlr__meta }

Relying Party Instances and Wallet Units SHALL support the extension for [ISO/IEC 18013-5] or the extension for [OpenID4VP], as applicable. as specified in [ETSI TS 119 472-2] and amended by Annex 2 of (the amended) [CIR 2024/2982], for transferring a single Relying Party registration certificate from a Relying Party Instance to a Wallet Unit.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-026" markdown>
<div class="eudi-hlr__id">EW-DM-44-026</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_20a
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-44-027" markdown>
<div class="eudi-hlr__id">EW-DM-44-027<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPRC_21
{: .eudi-hlr__meta }

After receiving a presentation request from a Relying Party, a Wallet Unit SHALL verify that all attributes requested in the request are included in the list of attributes in the registration certificate included in the same request. If the outcome of the verification is negative, the Wallet Unit SHALL, when asking for User approval according to RPA_07, warn the User that the Relying Party is requesting more information than it has registered. In addition, the Wallet Provider SHALL determine, based on its risk analysis and security policy, whether the Wallet Unit must a) enable the User to approve (or reject) the presentation of all requested attributes, including the non-registered ones, b) enable the User to approve (or reject) the presentation of the registered attributes only, or c) reject the presentation of all requested attributes.

*Note: This ensures that Wallet Providers comply with the 'general access policy' described in [CIR 2025/848].*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-50-001" markdown>
<div class="eudi-hlr__id">EW-DM-50-001</div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_03
{: .eudi-hlr__meta }

Empty

</div>
</div>


<div class="eudi-hlr" id="EW-DM-50-002" markdown>
<div class="eudi-hlr__id">EW-DM-50-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: RPT_DPA_05a
{: .eudi-hlr__meta }

For a report sent to a DPA, the log SHALL contain at least: a) the date and time when the report was sent, b) the name and country of the DPA, and c) the channel and contact information used for initiating sending the report, i.e., the URL, e-mail address, or phone number of the DPA.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-001" markdown>
<div class="eudi-hlr__id">EW-DM-53-001<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_01
{: .eudi-hlr__meta }

A ZKP scheme SHALL provide support for the following generic functions, while hiding all attributes of PIDs or attestations: (i) generation of a proof that an (some) attribute(s) having a specific value is (are) included in a PID or attestation, (ii) generation of a proof that a PID or attestation is within its validity period, (iii) generation of a proof that a PID or attestation has not been revoked, and (iv) generation of a proof that a PID or device-bound attestation is bound to a key stored in the WSCA/WSCD or in a keystore of the Wallet Unit. Additionally, a ZKP scheme SHOULD provide support for the following function, which SHOULD be used only when hiding the PID Provider or Attestation Provider is necessary: (v) generation of a proof that a PID or attestation has been issued by a trusted PID Provider or Attestation Provider, without revealing the PID Provider or Attestation Provider.

*Note: See section 4.1.1 of the Discussion Paper for Topic G.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-002" markdown>
<div class="eudi-hlr__id">EW-DM-53-002<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_02
{: .eudi-hlr__meta }

A ZKP scheme SHALL support proving possession of attestation of a given type.

*Note: See section 4.1.2 and 4.1.3 of the Discussion Paper for Topic G.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-003" markdown>
<div class="eudi-hlr__id">EW-DM-53-003<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_03
{: .eudi-hlr__meta }

A ZKP scheme SHOULD support the privacy-preserving binding of an attestation to a PID. In addition to the generic functions defined in ZKP_01, for this use case, a ZKP scheme SHALL provide support for the following functions: (i) generation of a proof that the Wallet Unit stores an attestation and a PID and that the attestation includes a specific attribute, having a specific value, which is also present in the PID.

*Note: See section 4.1.4 of the Discussion Paper for Topic G.*

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-004" markdown>
<div class="eudi-hlr__id">EW-DM-53-004<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_05
{: .eudi-hlr__meta }

A ZKP scheme SHALL be usable in both remote and proximity presentation flows. While the inclusion of ZKP will introduce computational and verification delays, these delays SHALL NOT critically undermine or defeat the purpose of the Relying Party service (e.g. because of a critical impact on the User experience of the Wallet Unit).

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-005" markdown>
<div class="eudi-hlr__id">EW-DM-53-005<span class="kw-should">SHOULD</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_06
{: .eudi-hlr__meta }

A ZKP scheme SHOULD be able to generate proofs for already issued PIDs and attestations in the formats specified in [ISO/IEC 18013-5] or [SD-JWT VC].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-006" markdown>
<div class="eudi-hlr__id">EW-DM-53-006<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_07
{: .eudi-hlr__meta }

A ZKP scheme SHALL NOT introduce any additional communication or information that could be used to track or link User activity during, before, or after proof generation.

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-007" markdown>
<div class="eudi-hlr__id">EW-DM-53-007<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_08
{: .eudi-hlr__meta }

A ZKP scheme SHALL rely solely on algorithms included in the [ECCG Agreed Cryptographic Mechanisms v2.0].

</div>
</div>


<div class="eudi-hlr" id="EW-DM-53-008" markdown>
<div class="eudi-hlr__id">EW-DM-53-008<span class="kw-shall">SHALL</span></div>
<div class="eudi-hlr__body" markdown>

Legacy ID: ZKP_09
{: .eudi-hlr__meta }

Use of a ZKP scheme SHALL NOT prevent the Wallet Unit's ability to provide User authentication with Level of Assurance High.

</div>
</div>


---

## A.2.2 Backward Reference: Original Topics

This section provides the titles and descriptions of the original topics from
which the High-Level Requirements were sourced and restructured.

- **Topic 1 - Accessing Online Services with a Wallet Unit**: One of the main
use cases of the EUDI Wallet ecosystem is to enable Users to access online
services and to enable Relying Parties offering such services to, where needed,
identify and authenticate Users with a high level of assurance.
- **Topic 2 - Mobile Driving Licence within the EUDI Wallet ecosystem**: A User
can obtain their mobile Driving Licence (mDL) from an mDL Provider and store it
in a Wallet Unit. The User can then present the mDL to a Relying Party upon
request to prove their driving rights conveniently, securely, and in compliance
with the Driving Licences Directive.
- **Topic 3 - PID Rulebook**: The Person Identification Data (PID) Rulebook
contains requirements specific to the PID within the EUDI Wallet ecosystem.
- **Topic 4 - mDL Rulebook**: The mobile driving licence (mDL) Rulebook contains
requirements specific to the mDL use case within the EUDI Wallet ecosystem.
- **Topic 6 - Relying Party authentication and User approval**: Relying Party
authentication is a process whereby a Relying Party proves its identity to a
Wallet Unit, in the context of a transaction in which the Relying Party requests
the Wallet Unit to release some attributes.
- **Topic 7 - Attestation revocation and revocation checking**: This Topic
contains the high-level requirements (HLRs) relating to the (possible)
revocation of PIDs, QEAAs, PuB-EAAs, non-qualified EAAs, and WUAs by their
providers.
- **Topic 9 - Wallet Unit Attestation**: When a User's Wallet Unit interacts
with other actors in the EUDI Wallet ecosystem, in particular PID Providers,
Attestation Providers, or Relying Parties, these actors may want to verify if
the Wallet Unit is authentic and has not been revoked.
- **Topic 10 - Issuing a PID or attestation to a Wallet Unit**: PID Providers
and Attestation Providers issue PIDs and attestations to Wallet Units. This
Topic lists the high-level technical requirements related to PID and attestation
issuance.
- **Topic 11 - Pseudonyms**: Wallet Units will support generating pseudonyms for
Users in compliance with the W3C WebAuthn API specification.
- **Topic 12 - Attestation Rulebooks**: This Topic describes the high-level
requirements for the Attestation Rulebooks that will specify the details of new
types of attestations.
- **Topic 16 - Signing documents with a Wallet Unit**: A Wallet Unit SHALL
enable its User to create qualified electronic signatures or seals.
- **Topic 17 - Identity matching**: Users would like to use their PID in their
Wallet Unit to access their existing online account(s), even if their PID
attribute values are not exactly the same as those in their account(s).
- **Topic 18 - Combined presentations of attributes**: The concept of combined
presentation refers to a process where a Relying Party requests multiple
attributes concerning a single User, drawn from separate attestations, and
receives a consolidated response.
- **Topic 19 - User navigation requirements (Dashboard logs for transparency)**:
The User is accessing a dashboard of the Wallet Unit, which provides a record of
all transactions executed through the Wallet Unit.
- **Topic 20 - Strong User authentication for electronic payments**: The
[European Digital Identity Regulation] requires Wallet Units to provide a
functionality of strong User authentication (SUA), among others in the context
of payments.
- **Topic 24 - User identification in proximity scenarios**: In this use case,
the User is using their Wallet Unit for identification purposes in proximity
scenarios.
- **Topic 25 - Unified definition and controlled vocabularies for attributes**:
This Topic defines high-level requirements regarding the catalogue for
Attestation Rulebooks.
- **Topic 27 - Registration of PID Providers, Providers of QEAAs, PuB-EAAs, and
non-qualified EAAs, and Relying Parties**: PID Providers, QEAA Providers,
PuB-EAA Providers, non-qualified EAA Providers, and Relying Parties register
with a Registrar in their Member State.
- **Topic 28 - Wallet Unit for legal persons**: This topic is focused on
identifying high-level requirements for a legal-person Wallet Unit.
- **Topic 29 - Representation paradigm**: It should be possible to issue a
dedicated representation attestation for a natural person to a representative,
in accordance with applicable national and European legislation.
- **Topic 30 - Interaction between Wallet Units**: A User can request another
User to present an attestation, where both Users use their Wallet Unit.
- **Topic 31 - Notification and publication**: PID Providers, PuB-EAA Providers,
Wallet Providers, Access Certificate Authorities, and Providers of registration
certificates must be notified by a Member State to the Commission.
- **Topic 33 - Wallet Unit backup and restore**: Backup and restore
functionality is needed in case the User has lost access to their current Wallet
Unit.
- **Topic 34 - Migrate to a different Wallet Solution**: Data portability means
that a User can migrate to a different Wallet Solution.
- **Topic 35 - PID issuance service blueprint**: This Topic analyses the User
journeys for PID issuance to a Wallet Unit.
- **Topic 38 - Wallet Unit revocation**: This Topic discusses Wallet Unit
revocation.
- **Topic 40 - Wallet Instance installation and Wallet Unit activation and
management**: This Topic discusses requirements related to the installation of a
Wallet Instance by the User, the subsequent activation of the Wallet Unit, and
the management of the Wallet Unit throughout its lifetime.
- **Topic 42 - Requirements for QTSPs to access Authentic Sources**: This Topic
discusses the ability of QTSPs to verify attributes by electronic means at the
request of the User, wherever those attributes rely on Authentic Sources within
the public sector.
- **Topic 43 - Embedded disclosure policies**: This topic is focused on
identifying high-level requirements for disclosure policies which may be
embedded in an attestation.
- **Topic 44 - Registration certificates**: This topic identifies high-level
requirements for registration certificates.
- **Topic 48 - Blueprint for requesting data deletion to Relying Parties**: A
User requests the deletion of their personal attributes from Relying Parties
with which they have interacted through their Wallet Unit.
- **Topic 50 - Blueprint to report unlawful or suspicious request of data**: A
User reports a Relying Party to the competent national data protection authority
for an unlawful or inappropriate request for attributes.
- **Topic 51 - PID or attestation deletion**: This topic lists high-level
requirements related to a User deleting a PID or attestation from their Wallet
Unit.
- **Topic 52 - Relying Party intermediaries**: This topic lists high-level
requirements regarding intermediaries, which form a special class of Relying
Party.
- **Topic 53 - Zero-Knowledge Proofs**: This topic lists high-level requirements
for a Zero-Knowledge Proof scheme to be used within the EUDI Wallet ecosystem.
- **Topic 54 - Accessibility**: It is essential to ensure that Wallet Units are
inclusive by design and fully aligned with the applicable European legal and
technical frameworks on accessibility.