# Introduction 

## Discussion Paper topic description

This document is the Discussion Paper for eIDAS Coordination Group
regarding Topic B: Re-issuance and batch issuance of PIDs and
Attestations.

The ARF Development Plan \[ARF\_DevPlan\] describes this Topic as
follows:

*High-level requirements on re-issuance and batch issuance need to be
discussed, as this topic is currently not addressed in the ARF. For
example, requirements around authentication of the User and re-use of
existing private keys may be different for first-time issuance and
re-issuance, batch issuance or synchronous issuance of an attestation*

## Related risks in the Risk Register

The risk register for European Digital Identity Wallets \[RiskRegister\]
contains no risks regarding re-issuance. This is because the risk
register focuses on risks related to security and privacy, not on
operational issues such as the difference between first-time issuance
and re-issuance of attestations.

## Key words

This document uses the capitalized key words ‘SHALL’, ‘SHOULD’ and ‘MAY’
as specified in RFC 2119, i.e., to indicate requirements,
recommendations and options specified in this document.

In addition, ‘must’ (non-capitalized) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that
is mandated by an external document. The word ‘can’ indicates a
capability, whereas other words, such as ‘will’, ‘is’ or ‘are’ are
intended as statements of fact.

## Document structure

This document is structured as follows:

-   Chapter 2 discusses batch issuance and re-issuance of PIDs and
    attestations, as well as how these processes are supported by the
    \[OpenID4VCI\] specification.

-   Chapter 3 discusses some of the reasons for re-issuance.

-   Chapter 4 discusses some of the differences between first-time
    issuance and re-issuance, especially regarding User authentication
    towards PID Provider and Attestation Provider, regarding User
    authentication and key management by WSCAs, and regarding triggers
    for the re-issuance process.

-   Chapter 5 lists the additions and changes that will be made to the
    ARF as a result of discussing this topic with Member States.

# Re-issuance and batch issuance of PIDs and attestations

## Description

Version 1.5 of the ARF contains a large number of requirements regarding
the issuance of PIDs and attestations, primarily in Topic 10/23 and also
in Topic 9. These requirements do not distinguish between the first time
a PID or attestation is issued and re-issuance of a PID or attestation
that is already present in a Wallet Unit. Neither do these requirements
explicitly address the topic of batch issuance.

Re-issuance means the replacement of a PID or attestation that already
exists in a Wallet Unit by a PID or attestation having the same document
type. Re-issuance is always performed by the same PID Provider or
Attestation Provider that issued the existing PID or attestation. The
value of the attributes in the new attestation will typically be the
same as in the original attestation. However, this is not required, the
PID Provider or Attestation Provider may change one or more attribute
values.

Batch issuance means that instead of issuing a single PID or attestation
to a Wallet Unit, a PID Provider or attestation issues a batch of them.
All PIDs or attestations in a batch have the same document type,
attribute values and validity period. In general, if the original PID or
attestation was issued in a batch, then the PID Provider or Attestation
Provider will re-issue that PID or attestation in a batch as well.

## Support by OpenID4VCI

The ARF requires that Wallet Units, PID Providers, and Attestation
Providers use the \[OpenID4VCI\] specification for issuance of PIDs and
attestations. \[OpenID4VCI\] supports re-issuance of attestations
through so-called Refresh Tokens. These are tokens that are optionally
issued during the first-time issuance of a PID or attestation, next to
the Access Tokens used in OpenID4VCI to protect access to the PID
Provider or Attestation Provider. When the Wallet Unit needs to request
re-issuance of a PID or attestation, it must start the process by
exchanging the Refresh Token for a new Access Token.

Given the reasons for re-issuance discussed in the next chapter, it
seems reasonable to assume that re-issuance must be possible or any PID
or attestation issued to a Wallet Unit. Therefore, the ARF will require
that during first-time issuance, each Access Token is accompanied by a
corresponding Refresh Token, and that during each re-issuance, a new
Refresh Token is also issued to the Wallet Unit.

The \[OpenID4VCI\] specification also supports batch issuance of
attestations, by optionally including multiple public keys and proofs of
possession in the proofs parameter in the Credential Request.

Given the discussions in \[Topic A\], it seems reasonable to assume that
many PID Providers or Attestations Provider will want to issue PIDs or
attestations in batches, and therefore to require that all Wallet
Solutions, PID Providers and Attestation Providers must support this
OpenID4CI feature.

Questions

1.  Would you agree that re-issuance of PIDs and attestation must always be possible? If not, what would be your proposal? Do you have any issues with the technical solution outlined above? Do you see other solutions?

2.  Would you agree that batch issuance of PIDs and attestation must always be possible? If not, what would be your proposal? Do you have any issues with the technical solution outlined above? Do you see other solutions?

# Reasons for re-issuance

## Overview

There may be different reasons for re-issuing a PID or attestation, for
example:

-   The current PID(s) or attestation(s) are near the end of their
    validity period, or the Wallet Unit is running out of once-only
    attestations. See section 3.2.

-   The value of one or more of the attributes in the PID or attestation
    has changed. See section 3.3.

-   The security architecture of the Wallet Solution may use PIDs and/or
    attestations that are issued just-in-time, at the moment that PID or
    attestation is being requested by a Relying Party. This is sometimes
    called synchronous issuing. See section 3.4.

The main reason for batch issuance of PIDs or attestations within the
EUDI Wallet ecosystem is to (partly) mitigate Relying Party linkability.
For this, see \[Topic A\].

## PID or attestation nearing its end of validity or Wallet Unit running out of PIDs or attestations

As specified in \[ISO/IEC 18013-5\] or \[SD-JWT VC\], each PID or
attestation contains metadata indicating its validity period.
Determining the length of the validity period is the responsibility of
the PID Provider or the Attestation Provider; neither these standards,
nor the ARF, nor the PID Rulebook specify anything about this. The
validity period chosen by the PID Provider or Attestation Provider will
depend on several factors, primarily the security architecture of the
Wallet Solution and the strategy chosen to mitigate Relying Party
linkability, as discussed in \[Topic A\].

Given the above factors, it can generally be assumed that the validity
period of a PID or attestations will be much shorter than its lifetime,
meaning the period of time that a User wants to keep that PID or
attestation in their Wallet Unit. That implies that new PIDs and
attestations will need to be issued periodically, to replace the ones
that are reaching their end of validity.

A similar reason for re-issuing PIDs and attestations occurs when the
PID Provider or Attestation Provider uses once-only attestations (as
defined in \[Topic A\], which can be presented only once to a Relying
Party. In that case, the Wallet Unit will regularly need new PIDs or
attestations, to avoid running out.

Re-issuance of PIDs or attestations for these reasons is a purely
technical matter. To the maximum extent possible, the User should not
notice that a PID or attestation has been re-issued, nor should they
have to take any action to ensure that re-issuance happens in time.
These conditions are very different from a first-time issuance of a PID
or attestation, where the User must take the initiative to request the
PID or attestation, and is potentially involved in the process in other
ways as well. These aspects are discussed in chapter 4.

## A change in attribute values

During the lifetime of a PID or attestation, the value of some of the
attributes may change. For example, at the date of birth of the User, an
age attestation attribute (i.e., an attribute indicating whether the
User has reached a certain age) may have to be changed from value False
to value True. In another example, the User of a mobile driving licence
may have passed the examination for a different vehicle category, or,
conversely, have lost the right to drive because of medical reasons or
severe traffic violations.

Re-issuance of a PID or attestation for this reason will have an impact
on the User, because they will notice that their attribute values have
been changed. For transparency reasons, it seems necessary to require
that the Wallet Unit notifies the User about such a change.

## Synchronous issuing

A third reason for re-issuing a PID or attestation is where the PID
Provider or Attestation Provider uses synchronous issuing. In such an
architecture, the Wallet Unit requests the issuance of a new PID or
attestation after it has received a request for that PID or attestation
from a Relying Party. In such an architecture, the PID or attestation is
very short-lived and is used only once.

Within the scope of this document, this reason for re-issuance is very
similar to the reasons discussed in section 3.2. Users should not notice
that a PID or attestation is being re-issued, nor should they have to
take any action to ensure that re-issuance happens.

# Differences between first-time issuance and re-issuance or batch issuance

## User authentication by PID Provider or Attestation Provider

In \[Topic A\] a high-level requirement was established that, to the
maximum extent possible, Users will not be involved in managing the
re-issuance of new attestations. This is an important principle.
Requiring that the User is involved in re-issuance processes would mean
that a User is requested to perform actions that they did not initiate,
and for which they probably don’t understand the reason. This would lead
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

Questions

3.  What do you think about the requirement that Users must not be involved in re-issuance
    processes for PIDs and attestations?

4.  What solutions do you see for ensuring that a re-issued PID or attestations is bound to same WSCD as the PID or attestation it is replacing? Do you agree with requiring that a Refresh Token used by the Wallet
    Unit to start the re-issuance process of a PID or attestation must
    be bound with the private key belonging to a PID or attestation
    currently present in the WSCA, by using the DPoP mechanism in RFC
    9449?

## User authentication and key management by the WSCA

The ARF v1.4 (and v1.5 as well) contains a requirement (WTE\_02 /
WUA\_02) stating that “a WSCA SHALL authenticate the User before
performing any cryptographic operation involving a private or secret key
of (…) a PID or an attestation in a Wallet Unit.”

If Users must not be aware of re-issuance processes for their existing
PIDs and attestations, this requirement may be problematic. This is
because the ARF assumes that each PID or attestation is bound to a key
pair that is generated by the WSCA. Therefore, for every new PID or
attestation, the WSCA must generate a new key pair. And key pair
generation is a cryptographic operation that, per the requirement above,
requires User authentication.

A solution for this challenge could be sought in several directions:

1.  By changing requirement WUA\_02, such that it does not apply to key
    generation operations.

2.  By allowing re-use of existing key pairs, meaning that the PID
    Provider or Attestation uses the same public key in multiple PIDs or
    attestations.

3.  By relying on a Hierarchical Deterministic Key (HDK) function as
    described in clause 4.4.4.2 of \[ETSI 119476\]. Using a HDK
    function, the PID Provider or Attestation Provider only needs to
    obtain a single public key from the WSCA. This happens during
    first-time issuance of a PID or attestation, where the User is
    involved in the process anyway and a request to authenticate will
    not come unexpectedly. During re-issuance, the PID Provider or
    Attestation Provider then uses this public key to derive unique
    per-attestation public keys from the received public key, without
    involvement of the Wallet Unit or the WSCA. These newly derived
    public keys are then sent to the Wallet Unit, and the WSCA can
    derive the corresponding private keys from the existing private key
    (i.e. the one generated during first-time issuance). The WSCA then
    uses these private keys as normal during a presentation of
    attributes.

Option 1 may not count as a good solution. Cryptographic key generation
by the WSCA is a sensitive operation, and it seems unwise to allow this
to happen without User authentication, if we can avoid that. Also, it is
not clear whether all types of WSCA (such a remote HSMs but also
embedded secure element) can be made to operate in such a way that they
require User authentication before signing and key agreement operations,
but not before key generation operations.

Option 2 might be usable in some situations, for example for synchronous
issuing as discussed in section 3.4 above. However, it needs to be
remembered that presenting the same public key multiple times will
enable Relying Parties to track Users, as discussed in \[Topic A\]. If
PID Provider or Attestation Providers follow this approach, they must
make sure that this does not make their PIDs and attestations vulnerable
to Relying Party linkability.

Option 3 seems promising, but Hierarchical Deterministic Keys have not
been part of the ARF before. If we want to require support from Wallet
Units and Attestation Providers for this technology, it needs to be
further investigated.

Questions

5. Do you see other options for dealing with User authentication in re-issuance scenarios?

6.  What do you think about option 1?

7.  What do you think about option 2? Should we allow the re-use of
    public keys in the ARF? If so, under what conditions?

8.  What do you think about option 3? Should we add the use of HDK in
    the ARF? If so, how exactly? Mandatory, optional? Do you know of any
    relevant limitations to HDK?

Requirement WUA\_02 may also be problematic for batch issuance, if it
means that User authentication is required before generation of an
individual key pair. That would mean that for a batch of 20 PIDs or
attestations, the User would be required to authenticate 20 times. This
is clearly not acceptable from a user experience point of view,
especially not since the User is not even aware of the concept of batch
issuance, nor of the reasons for it.

However, ARF 1.5.0 already contains the following note to requirement
WUA\_02: “Many actions of the Wallet Instance, such as processing a
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
an adequate level of security.”

We could add a requirement to the ARF that a request for (first-time)
batch issuance must be possible with at most one User authentication.

Questions

9.  What do you think about User authentication in batch-issuance scenarios?

## Triggers for the issuance process

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
which will cause the Wallet Unit to contact the Wallet Provider’s
backend to look for any updates or other actions. But PID Providers and
Attestation Providers are different from Wallet Providers, generally
speaking, and will typically not have this option.

Therefore, it seems better to require that the Wallet Unit triggers the
process of re-issuing a PID or attestation, for example when the
existing PID or attestation is near the end of its validity period, or
when the Wallet Unit is running out of once-only PIDs or attestations.
\[Topic A\] already contains the appropriate requirements.

Note that these requirements do not apply when synchronous issuance is
used. In that case, the Wallet Unit triggers the re-issuance of a PID or
attestation when attributes from that PID or attestation are requested
by a Relying Party.

Finally, the situation where re-issuance is necessary because of a
change in the value of one or more of the attributes. This is more
complicated, because the Wallet Unit does not have a way to know when
this happens. There basically seem to be three options:

1.  The Wallet Unit sends at regular intervals a request to the PID
    Provider or Attestation Provider, to see if an updated version of
    the PID or attestation is available.

2.  The PID Provider or Attestation Provider contacts the Wallet
    Provider to trigger the Wallet Unit to request re-issuance of the
    PID or attestation.

3.  The PID Provider or Attestation Provider contacts the User via an
    out-of-band communication channel to inform them that they need to
    request an update of their PID or attestation.

Option 1 has obvious drawbacks, in particular:

-   (Potentially) millions of Wallet Units sending such information
    requests, in most cases probably for nothing.

-   Moreover, the PID Provider or Attestation would have to determine
    the frequency of such requests, which is not trivial. Too low a
    frequency may mean that the User does not receive the updated
    version of their PID or attestation in time i.e., before the new
    values become valid. Too high a frequency increases the load on the
    systems of the PID Provider or Attestation Provider unnecessarily.

-   Finally, such a request, and also the PID Provider or Attestation
    Provider endpoint to which it can be addressed, have not been
    specified yet.

Option 2 requires direct communication between the Wallet Provider and
the PID Provider or Attestation Provider. The ARF v1.5 does not foresee
such communication, primarily since it means that the Wallet Provider
gets information about the PIDs and attestations present on each of
their Wallet Units. From an architecture point of view, this would
therefore be a major change. However, the Commission has received
feedback several times stating that in the long run, when the EUDI
Wallet ecosystem is successful and a PID Provider or Attestation
Provider will have millions of subscribers, the current issuance model
will be unsustainable anyway. This is because remotely issuing and
managing millions of attestations, residing on mobile devices that are
controlled by their User, requires specialized knowledge and a dedicated
infrastructure that will not be easy to deploy for many PID Providers or
Attestation Providers. If true, this would mean that these Providers
will outsource this task to the Wallet Providers. They will send the
PIDs or attestations containing the new attribute values to the Wallet
Provider, and the Wallet Provider would be responsible for delivering
these PIDs or attestations to the respective Wallet Unit in time.
Obviously, the attribute values would be encrypted, such that the Wallet
Provider cannot read them.

Option 3 violates the principle that the User is not involved in the
re-issuance of PIDs or attestations. In this case, however, that is
defensible, since the User will (have to) note the changed attribute
value anyway. This approach nevertheless has some drawbacks as well:

-   It is only usable if during the first-time issuance of the PID or
    attestation, the PID Provider or Attestation Provider captured
    contact information of the User, such as a telephone number or
    e-mail address. This may not be the case for all attestations.

-   The User may have objections to the update of their PID or
    attestations. Section 3.3 already gave the example of a User having
    lost the right to drive because of medical reasons or severe traffic
    violations. Such a User may refuse to trigger the re-issuance
    process because they want to continue using their existing PID or
    attestation with the ‘old’ values. Obviously, the PID Provider or
    Attestation Provider can (and should) revoke the existing PID or
    attestation. But this implies that they should have a policy
    determining how they will deal with situations like this.

Questions

10.  Do you agree that the Wallet Unit should trigger the re-issuance
    process for the cases where the existing PIDs or attestations are
    about to expire, or where the Wallet Unit is running low on
    once-only PIDs or attestations? If not, what other solution do you
    see?

11.  What do you think about the first option for the situation where
    re-issuance is necessary because of a change in the value of one or
    more of the attributes?

12.  What do you think about the second option? Would the issuance model
    sketched above, where the Wallet Provider is involved in the
    logistics of the issuance process, be acceptable to you?

13.  What do you think about the third option?

14.  Can you think of any other option?

# Additions and changes to the ARF 

## High-Level Requirements to be added to Annex 2

The following High-Level Requirements will be added to Annex 2 of the
ARF v1.8:

&lt;To be added after discussion of this Discussion Paper with Member
States.&gt;

## High-Level Requirements to be changed

&lt;A future version of this document will analyse the requirements on
issuance in v1.5 of the ARF and determine whether they need to be
changed (and if so, how) in the light of the conclusions reached for
this Discussion Paper.&gt;

### Topic 10/23

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 38%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th>Requirement</th>
<th>Valid for re-issuance of PID or attestation?</th>
<th>Valid for a PID or attestation issued as part of a batch?</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

### Topic 9

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 38%" />
<col style="width: 43%" />
</colgroup>
<thead>
<tr>
<th>Requirement</th>
<th>Valid for re-issuance of PID or attestation?</th>
<th>Valid for a PID or attestation issued as part of a batch?</th>
</tr>
</thead>
<tbody>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

## Descriptions to be added to the ARF main document

A summary of the descriptions in chapters 2, 3, and 4 will be added to
the ARF main document, version 1.8.

# References

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr>
<th>[RiskRegister]</th>
<th>Annex 1 to the Commission Implementing Regulation laying down rules
for the application of Regulation (EU) No 910/2014 of the European
Parliament and of the Council as regards the certification of the
European Digital Identity Wallets, European Commission, October 2024,
draft</th>
</tr>
</thead>
<tbody>
<tr>
<td>[ARF_DevPlan]</td>
<td>Architecture and Reference Framework Development plan 2025, European
Commission, v0.91, final draft</td>
</tr>
<tr>
<td>[ISO18013-5]</td>
<td>ISO/IEC 18013-5, Personal identification — ISO-compliant driving
licence — Part 5: Mobile driving licence (mDL) application, First
edition, 2021-09</td>
</tr>
<tr>
<td>[SD-JWT VC]</td>
<td><p>SD-JWT-based Verifiable Credentials (SD-JWT VC)</p>
<p>draft-terbu-sd-jwt-vc-06, O. Terbu <em>et al.,</em> 13 November 2024,
draft</p></td>
</tr>
<tr>
<td>[OpenID4VCI]</td>
<td> Lodderstedt, T. <em>et al.</em>, "OpenID for Verifiable Credential
Issuance", OpenID Foundation. Available:
&lt;<u>https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0.html</u>&gt;</td>
</tr>
<tr>
<td>[RFC 9449]</td>
<td>OAuth 2.0 Demonstrating Proof of Possession (DPoP), D. Fett <em>et
al</em>., September 2023</td>
</tr>
<tr>
<td>[Topic A]</td>
<td>Topic A: Privacy risks and mitigations - eIDAS Cooperation Group
Discussion Paper</td>
</tr>
</tbody>
</table>
