Version 0.9, updated 17 February 2025

# B - Re-issuance and batch issuance of PIDs and Attestations

## 1 Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for the European Digital Identity Cooperation Group
regarding Topic B: Re-issuance and batch issuance of PIDs and
Attestations.

The ARF Development Plan \[ARF\_DevPlan\] describes this Topic as
follows:

*High-level requirements on re-issuance and batch issuance need to be
discussed, as this topic is currently not addressed in the ARF. For
example, requirements around authentication of the User and re-use of
existing private keys may be different for first-time issuance and
re-issuance, batch issuance or synchronous issuance of an attestation*

### 1.2 Related risks in the Risk Register

The risk register for European Digital Identity Wallets \[RiskRegister\]
contains no risks regarding re-issuance. This is because the risk
register focuses on risks related to security and privacy, not on
operational issues such as the difference between first-time issuance
and re-issuance of attestations.

However, the risks mentioned in [Topic A] are related to the topic of this
document as well. This is because regular re-issuance of PIDs and attestations
can prevent Relying Party linkability risks discussed in [Topic A].

### 1.3 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY'
as specified in RFC 2119, i.e., to indicate requirements,
recommendations and options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that
is mandated by an external document. The word 'can' indicates a
capability, whereas other words, such as 'will', 'is' or 'are' are
intended as statements of fact.

### 1.4 Definitions

For the purpose of this document, the following definitions apply:

- *Administrative validity period of an attestation*: the dates from and/or up to which the attributes in the attestation are valid, which are represented as attribute(s) in the attestation.

> Note: some attestations do not have an administrative validity period (e.g., a diploma).

- *Technical validity period of an attestation*: the dates (and possibly times) from and up to which the attestation is valid, which are represented as metadata of the attestation.

 > Note: All PIDs and attestations have a technical validity period, which is chosen based on a risk analysis, e.g. with regard to User privacy.

### 1.5 Document structure

This document is structured as follows:

- Chapter 2 discusses batch issuance and re-issuance of PIDs and
 attestations, as well as how these processes are supported by the
 \[OpenID4VCI\] specification.

- Chapter 3 discusses some of the reasons for re-issuance.

- Chapter 4 discusses some of the differences between first-time
 issuance and re-issuance, especially regarding User authentication
 towards PID Provider and Attestation Provider, regarding User
 authentication and key management by WSCAs, and regarding triggers
 for the re-issuance process.

- Chapter 5 lists the additions and changes that will be made to the
 ARF as a result of discussing this topic with Member States.

## 2 Re-issuance and batch issuance of PIDs and attestations

### 2.1 Description

The ARF contains a large number of requirements regarding
the issuance of PIDs and attestations, primarily in Topic 10/23 and also
in Topic 9. These requirements do not distinguish between the first time
a PID or attestation is issued and re-issuance of a PID or attestation
that is already present in a Wallet Unit. Neither do these requirements
explicitly address the topic of batch issuance.

Re-issuance means the replacement of a PID or attestation that already
exists in a Wallet Unit by a PID or attestation having the same document
type. Re-issuance is always performed by the same PID Provider or
Attestation Provider that issued the existing PID or attestation and it is initiated by the Wallet Unit. The
value of the attributes in the new attestation will typically be the
same as in the original attestation. However, this is not required; the
PID Provider or Attestation Provider may change one or more attribute
values. Re-issuance, as described in this document, is only applied within
the administrative validity period of a document. As an example, a mobile driving licence (mDL) is issued in the form of attestations which have a technical validity period shorter than the administrative validity period of the licence itself. Re-issuance is used for obtaining fresh attestations as needed during the administrative validity period, to ensure that the User can always share a valid mDL. However, when the administrative validity period ends, there will be a process for obtaining a new administrative driving license. This is however out of scope of this document.

Batch issuance means that instead of issuing a single PID or attestation
to a Wallet Unit, a PID Provider or Attestation Provider issues a batch of them.
All PIDs or attestations in a batch have the same document type,
attribute values and validity period. In general, if the original PID or
attestation was issued in a batch, then the PID Provider or Attestation
Provider will re-issue that PID or attestation in a batch as well.

### 2.2 Support by OpenID4VCI

The ARF requires that Wallet Units, PID Providers, and Attestation
Providers use the \[OpenID4VCI\] specification for issuance of PIDs and
attestations (See requirement ISSU\_01 in Annex 2). \[OpenID4VCI\] supports re-issuance of attestations
through so-called Refresh Tokens. These are tokens that are optionally
issued during the first-time issuance of a PID or attestation, next to
the Access Tokens used in OpenID4VCI to protect access to the PID
Provider or Attestation Provider. When the Wallet Unit needs to request
re-issuance of a PID or attestation, it must start the process by
exchanging the Refresh Token for a new Access Token.

Given the reasons for re-issuance discussed in the next chapter, it
seems reasonable to assume that re-issuance shall be possible for any PID
or attestation issued to a Wallet Unit.

The \[OpenID4VCI\] specification also supports batch issuance of
attestations, by optionally including multiple public keys and proofs of
possession in the proofs parameter in the Credential Request. The ARF explicitly
requires support for this functionality (ISSU\_04).

Given the discussions in \[Topic A\], it seems reasonable to assume that
batch issuance is in many cases desirable. 

## 3 Reasons for re-issuance

### 3.1 Overview

There may be different reasons for re-issuing a PID or attestation, for
example:

- The current PID(s) or attestation(s) are near the end of their
 technical validity period, or the Wallet Unit is running out of once-only
 attestations. See section 3.2.

- The value of one or more of the attributes in the PID or attestation
 has changed. See section 3.3.

- The security architecture of the Wallet Solution may use PIDs and/or
 attestations that are issued just-in-time, at the moment that PID or
 attestation is being requested by a Relying Party. This is sometimes
 called synchronous issuing. See section 3.4.

The main reason for batch issuance of PIDs or attestations within the
EUDI Wallet ecosystem is to (partly) mitigate Relying Party linkability.
For this, see \[Topic A\].

### 3.2 PID or attestation nearing its end of technical validity or Wallet Unit running out of PIDs or attestations

As specified in \[ISO/IEC 18013-5\] or \[SD-JWT VC\], each PID or
attestation contains metadata indicating its technical validity period.
Determining the length of the technical validity period is the responsibility of
the PID Provider or the Attestation Provider; neither these standards,
nor the ARF, nor the PID Rulebook specify anything about this. The
technical validity period chosen by the PID Provider or Attestation Provider will
depend on several factors, primarily the security architecture of the
Wallet Solution and the strategy chosen to mitigate Relying Party
linkability, as discussed in \[Topic A\].

Given the above factors, it can generally be assumed that the technical validity
period of a PID or attestations will be much shorter than the lifetime of the corresponding document,
meaning the period of time that a User wants to keep that PID or
attestation in their Wallet Unit. That implies that new PIDs and
attestations will need to be issued periodically, to replace the ones
that are reaching their end of technical validity.

A similar reason for re-issuing PIDs and attestations occurs when the
PID Provider or Attestation Provider uses once-only attestations (as
defined in \[Topic A\]), which can be presented only once to a Relying
Party. In that case, the Wallet Unit, or rather the User, will regularly need new PIDs or
attestations to avoid running out.

Re-issuance of PIDs or attestations for these reasons is a purely
technical matter. To the maximum extent possible, the User should not
notice that a PID or attestation has been re-issued, nor should they
have to take any action to ensure that re-issuance happens in time.
Nevertheless, re-issuance events should be logged as stated in DASH\_02, and
a User should be able to access this log (DASH\_02b). Additionally a Wallet Unit
may offer the user the option to receive a notification of re-issuance.

These conditions are very different from a first-time issuance of a PID
or attestation, where the User must take the initiative to request the
PID or attestation, and is potentially involved in the process in other
ways as well. These aspects are discussed in chapter 4.

### 3.3 A change in attribute values

During the lifetime of a PID or attestation, the value of some of the
attributes may change. For example, at the date of birth of the User, an
age attestation attribute (i.e., an attribute indicating whether the
User has reached a certain age) may have to be changed from value False
to value True. In another example, the User of a mobile driving licence
may have passed the examination for a different vehicle category. In this case, the PID Provider or Attestation Provider shall re-issue the PID or attestation with the correct attribute values, and shall revoke the existing attestation.

Re-issuance of a PID or attestation for this reason will have an impact
on the User, because they will notice that their attribute values have
been changed. In this case Users should be informed. Additionally, an Attestation
Provider may state in their terms of conditions that re-issuance of an
attestation may be used.

### 3.4 Synchronous issuing

A third reason for re-issuing a PID or attestation is where the PID
Provider or Attestation Provider uses synchronous issuing. In such an
architecture, the Wallet Unit requests the issuance of a new PID or
attestation after it has received a request for that PID or attestation
from a Relying Party. In such an architecture, the PID or attestation is
very short-lived and is used only once.

Within the scope of this document, this reason for re-issuance is very
similar to the reasons discussed in section 3.2. Users should not notice
that a PID or attestation is being re-issued, nor should they have to
take any action to ensure that re-issuance happens. However, they may
be offered the option to receive notifications. Similarly, re-issuance events should be logged.

## 4 Differences between first-time issuance and re-issuance or batch issuance

### 4.1 User authentication by PID Provider or Attestation Provider

In \[Topic A\] a high-level requirement was established that, to the
maximum extent possible, Users will not be involved in managing the
re-issuance of new attestations. This is an important principle.
Requiring that the User is involved in re-issuance processes would mean
that a User is requested to perform actions that they did not initiate,
and for which they probably don't understand the reason. This would lead
at least to a bad user experience, and most likely also to operational
problems, such as Users not cooperating. Users may start to distrust
their Wallet Unit if it unexpectedly keeps asking the User to
authenticate, or if they are not able to present their PIDs or
attestations because they (perhaps unknowingly) blocked a request for
re-issuance.

The requirement of non-involvement of Users in re-issuance processes has
implications for PID Providers and Attestation Providers. One of these
implications is that the requirements regarding User authentication will
be different for first-time issuance and re-issuance. At least for PID
Providers, and for many Attestation Providers as well, it is required to
identify and authenticate the User during a first-time issuance process.
For PID Providers, it is even required to authenticate the User on Level
of Assurance High. However, for re-issuance process, performing User
authentication is not possible if the User must not be involved.

If the User is not authenticated during re-issuance process, there is a
risk that the PID Provider or Attestation Provider issue the new PID or
attestation to the wrong person. To prevent this, they will have to
implement alternative security mechanisms. One option for this is to
require that the Refresh Tokens used by \[OpenID4VCI\] are bound to the
same WSCA to which the existing PID or attestation is bound. This can be
done by requiring that OAuth 2.0 Demonstrating Proof of Possession
(DPoP) \[RFC 9449\] is used for these tokens, and that the public key in
the DPoP proof matches the public key in (one of) the PID(s) or
attestation(s) issued to the Wallet Unit previously.

Such a mechanism is common in managing certificate signing requests in
Public Key Infrastructures. It means that PID Providers or Attestation
Providers can be sure that the new PID or attestation will be bound to
the same WSCA, and thus to the same User, as the existing one.

For first-time batch issuance of PIDs or attestations, it seems
reasonable to require that the User needs to authenticate towards the
PID Provider or attestation provider only once, regardless of the size
of the batch, i.e., the number of PIDs or attestations issued
simultaneously to the Wallet Unit.

### 4.2 User authentication and key management by the WSCA

The ARF v1.5 contains a requirement (WUA\_02) stating that "a WSCA SHALL authenticate the User before
performing any cryptographic operation involving a private or secret key
of (...) a PID or an attestation in a Wallet Unit."

If Users must not be aware of re-issuance processes for their existing
PIDs and attestations, this requirement may be problematic. This is
because the ARF assumes that each PID or attestation is bound to a key
pair that is generated by the WSCA. Therefore, for every new PID or
attestation, the WSCA must generate a new key pair. And key pair
generation is a cryptographic operation that, per the requirement above,
requires User authentication.

A solution for this challenge could be sought in several directions:

1. By changing requirement WUA\_02, such that it does not apply to key
 generation operations.

2. By allowing re-use of existing key pairs, meaning that the PID
 Provider or Attestation uses the same public key in multiple PIDs or
 attestations.

3. By relying on a Hierarchical Deterministic Key (HDK) function as
 described in clause 4.4.4.2 of \[ETSI 119476\].
 Using a HDK function, the PID Provider or Attestation Provider only
 needs to obtain a single public key from the WSCA, along with
 non-sensitive metadata required to apply HDK. This happens during
 first-time issuance of a first PID or attestation, where the User is involved in
 the process anyway and a request to authenticate will not come unexpectedly.
 During re-issuance or (batch) issuance of associated PID or attestations,
 the PID Provider or Attestation Provider then uses this public
 key to derive unique per-attestation public keys from the received public key,
 without involvement of the Wallet Unit or the WSCA. These newly derived
 public keys are then sent to the Wallet Unit, along with non-sensitive
 metadata required to apply HDK, and the WSCA can effectively derive
 the corresponding private keys from the existing private
 key (i.e. the one generated during first-time issuance). The WSCA then
 uses these private keys as normal during a presentation of
 attributes.

4. By using WSCA to authenticate Users before using the Wallet Unit.
Requirement WUA\_03 states that "A Wallet Unit SHALL authenticate the User
before performing any operation excluding cryptographic operations. The Wallet
Unit MAY rely on a WSCA to do so (...)". Therefore, the WSCA may perform
the necessary cryptographic operations immediately after authenticating the
user on the Wallet Unit behalf.

Option 1 may not count as a good solution. Cryptographic key generation
by the WSCA is a sensitive operation, and it seems unwise to allow this
to happen without User authentication, if we can avoid that. Also, it is
not clear whether all types of WSCA (such a remote HSMs but also
embedded secure element) can be made to operate in such a way that they
require User authentication before signing and key agreement operations,
but not before key generation operations.

Option 2 entails multiple risks and should be avoided.

Option 3 seems promising, but Hierarchical Deterministic Keys have not
been part of the ARF before. If we want to require support from Wallet
Units and Attestation Providers for this technology, it needs to be
further investigated. High Level Requirements for this option will be
provided in a future specification.

Option 4 is not achievable if the WSCA/WSCD is a remote HSM and the Wallet Unit does not have internet connection. That means that a User would not be able to open their Wallet Unit in such case. However, these conditions will probably not occur very often, relatively speaking. This paper therefore recommends Wallet Providers to implement this approach.

Requirement WUA\_02 may also be problematic for batch issuance, if it
means that User authentication is required before generation of an
individual key pair. That would mean that for a batch of 20 PIDs or
attestations, the User would be required to authenticate 20 times. This
is clearly not acceptable from a user experience point of view,
especially not since the User is not even aware of the concept of batch
issuance, nor of the reasons for it.

However, ARF 1.5.0 already contains the following note to requirement
WUA\_02: "Many actions of the Wallet Instance, such as processing a
Relying Party request and presenting an attestation, require multiple
cryptographic operations, for example ephemeral key generation followed
by key agreement and message encryption. This requirement does not imply
that separate User authentication is necessary before each of these
operations. Rather, a successful User authentication will be valid for
all cryptographic operations necessary for a Wallet Unit action. It is
up to the Wallet Provider to determine what constitutes a 'Wallet Unit
action', finding a balance between security (more User authentications)
and User convenience (fewer User authentications). During certification
of the Wallet Solution, it will be verified that the solution provides
an adequate level of security."

This Discussion Paper adds the additional requirement that (first-time) batch issuance of PIDs or attestations shall require only a single User authentication

### 4.3 Triggers for the issuance process

The process of first-time issuance of a PID or attestation is triggered
by the User, who wants to obtain a PID or attestation and triggers the
Wallet Unit to start the process specified in \[OpenID4VCI\]. If we take
the requirement that Users are not involved in re-issuance processes
absolutely, trusting on the User to trigger re-issuance is not an
option. That leaves two parties that could potentially do this: the PID
Provider or Attestation Provider, or the Wallet Unit.

However, it is not clear how the PID Provider or Attestation Provider
can trigger the Wallet Unit to start the re-issuance processes. A Wallet
Provider will typically be able to send a push message to a Wallet Unit,
which will cause the Wallet Unit to contact the Wallet Provider's
backend to look for any updates or other actions. But PID Providers and
Attestation Providers are different from Wallet Providers, generally
speaking, and will typically not have this option.

Therefore, it seems better to require that the Wallet Unit triggers the
process of re-issuing a PID or attestation, for example when the
existing PID or attestation is near the end of its validity period, or
when the Wallet Unit is running out of once-only PIDs or attestations.
\[Topic A\] already contains the appropriate requirements.

A Wallet Unit shall also give the User the option to manually initiate a re-issuance process for any of the PIDs or attestations in their Wallet Unit. This may be useful, for example, if the User knows that their Wallet Unit will go offline for an extended period of time.

Note that these requirements do not apply when synchronous issuance is
used. In that case, the Wallet Unit triggers the re-issuance of a PID or
attestation when attributes from that PID or attestation are requested
by a Relying Party.

Finally, there are situations where re-issuance of a PID or attestation is necessary because of a
change in the value of one or more of the attributes. This is more
complicated, because the Wallet Unit does not have a way to know when
this happens. There basically seem to be three options:

1. The Wallet Unit sends at regular intervals a request to the PID
 Provider or Attestation Provider, to see if an updated version of
 the PID or attestation is available.

2. The PID Provider or Attestation Provider contacts the Wallet
 Provider to trigger the Wallet Unit to request re-issuance of the
 PID or attestation.

3. The PID Provider or Attestation Provider contacts the User via an
 out-of-band communication channel to inform them that they need to
 request an update of their PID or attestation.

4. A PID Provider or Attestation Provider revokes the attestation if attribute values
 are out-of-date. Thus the Wallet Unit should monitor the revocation status
 of its PIDs and attestations and notify the User if a PID or attestation is revoked. This enable the User to trigger a re-issuance process.

Option 1 has obvious drawbacks, in particular:

- (Potentially) millions of Wallet Units sending such information
 requests, in most cases probably for nothing.
- Moreover, the PID Provider or Attestation Provider would have to determine
 the frequency of such requests, which is not trivial. Too low a
 frequency may mean that the User does not receive the updated
 version of their PID or attestation in time, i.e., before the new
 values become valid. Too high a frequency increases the load on the
 systems of the PID Provider or Attestation Provider unnecessarily.
- Finally, such a request, and also the PID Provider or Attestation
 Provider endpoint to which it can be addressed, have not been
 specified yet.

Note that Option 4 is probably a solution to these drawbacks.

Option 2 requires direct communication between the Wallet Provider and
the PID Provider or Attestation Provider. The ARF does not foresee
such communication, primarily since it means that the Wallet Provider
gets information about the PIDs and attestations present on each of
their Wallet Units. From an architecture point of view, this would
therefore be a major change. Furthermore, this option introduces
privacy risks. On the other hand, the Commission has received
feedback stating that in the long run, when the EUDI
Wallet ecosystem is successful and a PID Provider or Attestation
Provider will have millions of subscribers, the current issuance model
will be unsustainable anyway. This is because remotely issuing and
managing millions of attestations, residing on mobile devices that are
controlled by their User, requires specialised knowledge and a dedicated
infrastructure that will not be easy to deploy for many PID Providers or
Attestation Providers. If true, this would mean that these Providers
will outsource this task to the Wallet Providers. They will send the
PIDs or attestations containing the new attribute values to the Wallet
Provider, and the Wallet Provider would be responsible for delivering
these PIDs or attestations to the respective Wallet Unit in time.
Obviously, the attribute values would be encrypted, such that the Wallet
Provider cannot read them.

In conclusion, this option should not yet be
considered. It should be re-examined at a later stage if such an interface is needed.

Option 3 violates the principle that the User is not involved in the
re-issuance of PIDs or attestations. In this case, however, that is
defensible, since the User will (have to) note the changed attribute
value anyway. This approach nevertheless has some drawbacks as well:

- It is only usable if during the first-time issuance of the PID or
 attestation, the PID Provider or Attestation Provider captured
 contact information of the User, such as a telephone number or
 e-mail address. This may not be the case for all attestations.
- The User may have objections to the update of their PID or
 attestation. For example, a User may have
 lost the right to drive because of medical reasons or severe traffic
 violations. Such a User may refuse to trigger the re-issuance
 process because they want to continue using their existing PID or
 attestation with the 'old' values. Obviously, the PID Provider or
 Attestation Provider can (and shall) revoke the existing PID or
 attestation.

The use of this option, as long as it does not involve the Wallet Unit for
delivering such a notification, is left to PID Providers and Attestation Providers as an implementation choice.

Option 4 is the recommended approach. Option 4 is similar to Option 1
but it does not suffer from the absence of an appropriate PID Provider or Attestation
Provider endpoint. However, depending on the revocation reason, re-issuance
of an attestation may not succeed. Wallet Units should be able to handle this
condition.

### 4.4 Handling existing PIDs or attestations after re-issuance of new ones

In general, re-issuance of a PID or attestation will take place when the existing PID or attestation is still valid.
If that were not the case, there would be a time window where User does not have any valid PIDs or attestations that they can present to Relying Parties.

After successful re-issuance of a PID or attestation, the Wallet Unit must delete the
existing PID or attestation, meaning the one that the re-issued PID or attestation
intends to replace. This is for a simple reason: the value of some of the attributes
in the new PID or attestation may be different from the value in the existing one.
And obviously, the Wallet Unit must not present attestations containing attribute
values that the Wallet Provider no longer wants to attest to. The Wallet Unit shall ensure
that the correct attestation is replaced.

## 5 Additions and changes to the ARF

### 5.1 High-Level Requirements to be added to Annex 2

The following High-Level Requirements will be added to Annex 2 of the ARF.

#### 5.1.1 Requirements to be added (likely) to Topic 10/23

##### Requirement 1

A Wallet Unit SHALL give its User the option to manually initiate a re-issuance process for any of the PIDs or attestations in their Wallet Unit.

##### Requirement 2

After a successful re-issuance, a Wallet Unit SHALL compare the attribute values of the re-issued PID or attestation with those of the existing PID or attestation, and SHALL notify the User in case of any differences.

##### Requirement 3

The Wallet Unit SHALL gracefully handle situations in which re-issuance of a PID or attestation is refused by the PID Provider or Attestation Provider, for example by attempting a retry after an appropriate delay.

##### Requirement 4

A Wallet Provider SHALL ensure that its Wallet Solution supports PID or attestation
first-time batch issuance with a single User authentication.

##### Requirement 5

A Wallet Provider SHALL ensure that a Wallet Unit, after successful re-issuance of a PID or attestation, deletes the correct pre-existing PID or attestation, meaning the one that the re-issued PID or attestation intends to replace.

##### Requirement 6

PID Providers, Attestation Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the re-issuance of all PIDs and attestations.

##### Requirement 7

PID Providers, Attestation Providers, and Wallet Units SHALL support the features of [OpenID4VCI] enabling the batch issuance of all PIDs and attestations.

##### Requirement 8

The common OpenID4VCI protocol referenced in requirement ISSU_01, or an EUDI Wallet-specific extension or profile thereof, SHALL enable a PID Provider or Attestation Provider to verify that a re-issued PID or attestation is bound to the same WSCD to which the existing PID or attestation is bound. *Note: This can be
done, for instance, by requiring that OAuth 2.0 Demonstrating Proof of Possession
(DPoP) \[RFC 9449\] is used for each Refresh Tokens, and that the public key in
the DPoP proof is identical to the public key in the existing PID or
attestation issued to the Wallet Unit previously.*

#### 5.1.2 Requirements to be added (likely) to Topic 7

##### Requirement 9

In case a PID Provider or Attestation Provider must change an attribute in an issued PID or attestation, it SHALL revoke that PID or attestation. Subsequently, if the User's contact details are known, the PID Provider SHOULD, via an out-of-band manner, notify the User about the revocation and ask the User to request re-issuance of the attestation using their Wallet Unit.

##### Requirement 10

A Wallet Unit SHOULD regularly check the revocation status of its PIDs, attestations, and WUAs, and notify the User if a PID or attestation, or the Wallet Unit itself, is revoked.

#### 5.1.2 Requirements to be added (likely) to Topic 19

##### Requirement 11

A Wallet Unit SHALL log issuance and re-issuance transactions as stated in requirement DASH_02. The Wallet Unit SHALL log the date and time of the transaction,the corresponding PID Provider or Attestation Provider, the attestation type requested and the outcome of the transaction (success or failure). For a re-issuance transaction, the Wallet Unit SHALL additionally log whether it was triggered by the User or by the Wallet Unit without involvement of the User.

### 5.2 High-Level Requirements to be changed

WUA_03 says: "A Wallet Unit SHALL authenticate the User before performing any operation excluding cryptographic operations. The Wallet Unit MAY rely on a WSCA to do so, per WUA_02, but MAY also rely on a User authentication method implemented in the Wallet Instance." The second sentence will be changed to "The Wallet Unit SHOULD rely on a WSCA to do so, per WUA_02, but MAY rely on a User authentication method implemented in the Wallet Instance in case using a WSCA is not feasible." A note will be added to explain that a Wallet Unit using a remote HSM and being without internet connection is an example.

### 5.3 Descriptions to be added to the ARF main document

- A summary of the descriptions in chapter 2 will be added to section
6.6.2 of the ARF main document.
- A summary of the descriptions in chapter 3 will be added in the description of possible states of a PID or attestation included in section 4.6.5 of the ARF main document.
- A summary of the descriptions in chapter 4 related to batch issuance will be
added in section 6.6.2 of the ARF main document.
- A summary of the descriptions in chapter 4 related to re-issuance will
be included in a new section that be will be
added after section 6.6.2 of the ARF main document.

## 6 References

| Reference | Description |
| --- | --- |
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |
| [ARF_DevPlan] | Architecture and Reference Framework Development plan 2025, European Commission, v0.91, final draft |
| [ISO18013] | ISO/IEC 18013-5, Personal identification — ISO-compliant driving licence — Part 5: Mobile driving licence (mDL) application, First edition, 2021-09 |
| [SD-JWT VC] | SD-JWT-based Verifiable Credentials (SD-JWT VC) draft-terbu-sd-jwt-vc-06, O. Terbu *et al.*, 13 November 2024, draft |
| [OpenID4VCI] | Lodderstedt, T. *et al.*, "OpenID for Verifiable Credential Issuance", OpenID Foundation. Available at: <https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html> |
| [RFC 9449] | OAuth 2.0 Demonstrating Proof of Possession (DPoP), D. Fett *et al*., September 2023 |
| [Topic A] | Topic A: Privacy risks and mitigations - eIDAS Cooperation Group Discussion Paper |
