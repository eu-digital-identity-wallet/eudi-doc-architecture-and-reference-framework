Version 1.0, updated 14 January 2025

# A - Privacy risks and mitigation

## 1 Introduction

### 1.1 Discussion Paper topic description

This document is the Discussion Paper for eIDAS Coordination Group
regarding Topic A: Privacy risks and mitigation.

The ARF Development Plan [ARF_DevPlan] describes this Topic as
follows:

*Starting from the risk registry, review and enhance the privacy
requirements related to tracking and tracing. This includes evaluating
current mitigations for privacy risks, identifying additional measures
to further minimise these risks, and exploring alternative solutions,
such as Zero-Knowledge Proofs (ZKP).*

A section will be added to the ARF to discuss:

1. the risks for User privacy due to possible collusion and/or data breaches involving Relying Parties and/or Attestation Providers

2. the countermeasures taken in the current version of the ARF

3. the ways in which Attestation Providers can further reduce these
 risks, for example by issuing short-lived attestations.

4. the ways in which these risks may be fully mitigated in the future,
 e.g. by means of ZKP-based proof mechanisms for attestations.

5. the risks for User privacy related to revocation checking.

In this version of the document, the feedback of Member States during
the meetings on 4 and 11 December 2024 was processed, including the comments up until 8 January 2025.

### 1.2 Related risks in the Risk Register

The risk register for European Digital Identity Wallets [RiskRegister]
contains the following risks regarding User tracking as a result of
collusion between Relying Parties or between a Relying Party and an
Attestation Provider or of a data breach of the parties:

<table>
<colgroup>
<col style="width: 31%" />
<col style="width: 14%" />
<col style="width: 53%" />
</colgroup>
<thead>
<tr>
<th><strong>Risk type </strong></th>
<th><strong>Risk ID </strong></th>
<th><strong>Related risk titles </strong></th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R6</td>
<td>Data disclosure</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R12</td>
<td>Transaction data disclosure</td>
</tr>
<tr>
<td><strong>High-level risks to the wallets</strong></td>
<td>R14</td>
<td>Surveillance</td>
</tr><tr>
<td><strong>System-related risks</strong></td>
<td>SR1 </td>
<td>Wholesale surveillance </td>
</tr>
</tbody>
</table>

Most of the Technical Threats from the [Risk Register] (threats labelled TTX.Y in
its section III) are also relevant threats to consider in the context of preventing
tracking and tracing. These threats may belong to attack chains leading to the risks
expressed in the table above.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R6. Data Disclosure</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Data disclosure is defined as the unauthorised exposure of personal
data including special categories of personal data. The privacy breach risk
is very similar when considered from a privacy rather than security viewpoint.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R12. Transaction data disclosure</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Transaction data disclosure is defined as the disclosure of information
related to information on a transaction between stakeholders.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>R14. Surveillance</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Surveillance, or monitoring, is defined as the unauthorised tracking
or observation of a wallet user's activities, communication, or data.
Surveillance is often related to inference, which is defined as the
deduction of sensitive or personal information from seemingly innocuous
data.</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong>SR1. Wholesale surveillance</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Wholesale surveillance is defined as the tracking or observation of
the activities of many users through their wallet's communication or
data. Wholesale surveillance is often associated with surveillance (R14)
and inference at a global scale, where information about many users is
combined to deduce sensitive or personal data about users or to identify
statistical trends that can be used to design further attacks.</td>
</tr>
</tbody>
</table>

More specifically, [RiskRegister] describes the following threats to a
Wallet:

<table style="width:100%;">
<colgroup>
<col style="width: 13%" />
<col style="width: 51%" />
<col style="width: 35%" />
</colgroup>
<thead>
<tr>
<th><strong>ID<br />
</strong><em>Identifier</em></th>
<th><strong>Threat description<br />
</strong><em>Description of the identified threat</em> (*)</th>
<th><strong>Risk title<br />
</strong><em>Related risks</em></th>
</tr>
</thead>
<tbody>
<tr>
<td>TR36</td>
<td>The electronic attestation of attributes about a person that is
presented in multiple transactions with a relying party, or across
different relying parties, unintentionally allows them to link multiple
transactions to the relevant person.</td>
<td>Data disclosure (R6)</td>
</tr>
<tr>
<td>TR39</td>
<td>An attacker can unlawfully trace wallet users using unique/traceable
identifiers.</td>
<td>Data disclosure (R6) and Surveillance (R14)</td>
</tr>
<tr>
<td>TR84</td>
<td>A group of colluding relying parties or PID providers can derive the
user's identity data beyond data known to them.</td>
<td>Surveillance (R14)</td>
</tr>
<tr>
<td>TR85</td>
<td>An attacker can track and trace a user by using person
identification data of the user where identification of the user is not
required.</td>
<td>Surveillance (R14)</td>
</tr>
</tbody>
</table>

Threads related to data breaches including those involving attackers,
are also be taken into account. See [Risk Register] on threads TR27, TR28,
TR29, TR30, TR31, TR33, TR34, TR35, TR37, TR40, TR50 to TR52, TR54,
TR61, TR83, TR102, TR103, TR105, TR107, TR110, TR130.

>Note that other threats, such as TR25, TR26, TR32, TR53, TR111 to TR117,
TR119, TR121, TR127, and TR133 from the [Risk Register] are also relevant
for scenarios where the wallet itself is compromised.

### 1.3 Key words

This document uses the capitalised key words 'SHALL', 'SHOULD' and 'MAY'
as specified in RFC 2119, i.e., to indicate requirements,
recommendations and options specified in this document.

In addition, 'must' (non-capitalised) is used to indicate an external
constraint, for instance a self-evident necessity or a requirement that
is mandated by an external document. The word 'can' indicates a
capability, whereas other words, such as 'will' and 'is' or 'are' are
intended as statements of fact.

### 1.4 Document structure

This document is structured as follows:

- Chapter 2 explains in detail the risks for User privacy due to collusion
 and/or data breaches involving Relying Parties and/or Attestation Providers.

- Chapter 3 discusses possible mitigation measures for Relying Party
 linkability.

- Chapter 4 discusses linkability threats related to revocation
 checking.

- Chapter 5 briefly discusses Zero-Knowledge Proofs as an alternative
 way to mitigate these risks. This topic will be discussed with the
 Cooperation Group later in more detail.

- Chapter 6 proposes a few High-Level Requirements to be added to the
 ARF. These are for discussion.

## 2 Risks for User privacy due to collusion

### 2.1 Linkability

This chapter describes in detail how the attestation formats relying on salted
hashed attributes for use in the EUDI Wallet ecosystem could be misused for
tracking the User's behaviour.

The attestation formats required to be supported in the ARF are
specified in ISO/IEC 18013-5 [ISO18013-5], "SD-JWT-based Verifiable
Credentials (SD-JWT VC)" [SD-JWT VC] and “W3C Verifiable Credentials
Data Model 1.1 (W3C VCDM 1.1)” [W3C VCDM 1.1]. Selective disclosure
of attributes is achievable, in particular by making use of so-called
salted-attribute hashes. For more information on this technique, see
[ETSI 119476]. In a nutshell, the idea is that an Attestation Provider
does not sign the attribute values directly, but instead signs a
collection of hash values, where each hash is calculated over the
concatenation of an attribute value and a unique salt. This allows the
User to present only a single attribute value (plus the associated
salt), while enabling the Relying Party to verify the Attestation
Provider signature and the fact that the presented attribute value is
indeed included in the signature via its hash.

A property of these attestation formats is that every attestation that
is presented to a Relying Party contains a number of elements having a
unique value. These elements include:

- The salt of every attribute that is presented,

- The hash values of all attributes, that were signed by the
 Attestation Provider,

- The attestation identifier or index used for revocation purposes (if
 applicable),

- The attestation public key used for device binding and User binding,
- The attestation public key used for device binding and User binding,

- The value of the Attestation Provider signature.
- The value of the Attestation Provider signature.

In addition, also timestamps, such as the signing or issuing time of the
attestation and the 'valid from' and 'valid until' timestamps may be
unique, if they are precise enough. For example, if the timestamps
include milliseconds, this will almost always be the case.

Apart from being unique in the whole EUDI Wallet ecosystem, the values
of these elements also are fixed, meaning that when the same attestation
is presented again, the Relying Party will receive the same values. This fact
enables malicious Relying Parties and Attestation Providers, or,
in case of a data breach, any malicious party (including third-parties)
with access to the corresponding data, to link attribute values that
were presented to different Relying Parties in different transactions.
If this happens, the reasonable expectation of Users that their separate
activities involving the EUDI Wallet will not be combined into a single
profile of their behaviour, is violated.

Linkability comes in two varieties, Relying Party linkability and
Attestation Provider linkability. These are discussed in the next
sections.

### 2.2 Relying Party linkability

Relying Party linkability means that a link can be established between
multiple presentations of attestations by the same User to one or more
Relying Party.
For example, a Relying Party that requests and receives age_over_18
attributes from multiple PIDs may store the salt it receives. By
comparing the received salt values, the Relying Party may find matching
salt values. It can then conclude that the corresponding attestations
must have been the same, and hence that it must have been interacting
with the same person.

The same principle also works with other elements, for example with one
of the hash values in the attestation proof. If the Relying Party uses
one of these elements, it will be able to see that it has received the
same attestation multiple times even if it requested (and received)
different attributes in each of these interactions.

The same mechanisms can obviously also be applied by multiple colluding
Relying Parties. By collecting and sharing values of unique attestation
elements, they will be able to recognise that the same attestation was
used at multiple Relying Parties. By combining the attribute values that
were presented during each of these interactions, they will be able to
build a profile of the User.

Also note that linkability of attestations can be a danger to the User's
privacy even if Relying Parties are not actively trying to track Users.
If a Relying Party (or multiple Relying Parties) is the victim of a data
breach by an attacker, and the data breach includes unique attestation
values, the attacker may be able to track Users based on these.

As will be made clear in the next chapter, an (honest) Attestation
Provider can partly or fully prevent Relying Party linkability of the
attestations it issues, at the cost of issuing multiple attestations to
the same User.

In addition, it should be noted that apart from technical and preventive
measures, also organisational and repressive measures can be used to
discourage Relying Parties from colluding and tracking Users. In
particular, Relying Parties found offending can have their access
certificate revoked, after which they will not be able to interact with
Wallet Unit.

### 2.3 Attestation Provider linkability

Attestation Provider linkability happens when a link can be established
between the User and their attestation presentations, or several attestation
presentations without the User, by combining the data stored by the Attestation
Provider, data collected by Relying Parties or other third-parties
accessing to data (including in case of a data breach or eavesdropping
from one of the legitimate parties). In this scenario, the Attestation
Provider stores all of the unique element values (i.e., salts, hashes,
public key, signature value) in all attestations it issues, together with
the user to which each of these values was issued.

Then, after it has received an attestation, a Relying Party notifies the
Attestation Provider about the value of any of the unique elements in
that attestation. This allows the Attestation Provider to identify the
corresponding User, and to track at which Relying Parties the User
presents their attestations.

Unlike for Relying Party linkability, Attestation Provider linkability
cannot be technically prevented for attestations using salted-attribute hashes. The
only way to technically mitigate this risk is by using Zero-Knowledge
Proofs instead, as described in section 5. However, like for Relying Party
linkability, organisational preventive, detective, and repressive measures can be used to
discourage Attestation Providers from colluding and tracking Users
and to mitigate Attestation Provider linkability. For example, Attestation Providers may purposely discard
the unique values of an attestation after it has been issued, or remove any links to the User to whom it has been issued. In
addition, many Attestation Providers are subject to regular audits,
which means that collusion and tracking can more easily be detected by relevant authorities. Finally, Attestation Providers that are found to be tracking their Users in an illegal manner can be fined, have their access certificates revoked, or be otherwise punished.

### 2.4 WUAs and Wallet Providers

The Wallet Unit Attestation (WUA) is an attestation issued to the Wallet
Unit by the Wallet Provider. In the context of this discussion paper,
there is no difference between WUAs and other types of attestations
(including PIDs). The same risks of linkability apply for all of them,
and the mitigation measures for Relying Party linkability described in
the next chapter can also be used by Wallet Provider to mitigate the
Relying Party linkability risks associated with presenting WUAs.

Therefore, in this discussion paper the term 'Attestation Provider'
includes Wallet Providers, in their specific responsibilities as issuers
of WUAs.

## 3 Possible mitigation measures for Relying Party linkability within the current ARF

### 3.1 Introduction

An (honest) Attestation Provider can mitigate Relying Party linkability
mitigated partly or fully by the following two measures:

1. Ensuring that all attestation unique elements discussed in section
 2.1 are unique across all attestations issued by the Attestation
 Provider (and not only per attestation). This can be achieved, for
 example, by ensuring that salt values and attestation identifiers
 are pseudo-random numbers generated by a cryptographically secure
 pseudo-random number generator (CSPRNG).

2. Limiting the number of times a Wallet Unit may present a single
 attestation.

Regarding the second point above: An Attestation Provider can employ and possibly combine
Regarding the second point above: An Attestation Provider can employ and possibly combine
at least four different methods to achieve this:

- Method A: Once-only attestations,
- Method A: Once-only attestations,

- Method B: Limited-time attestations,
- Method B: Limited-time attestations,

- Method C: Rotating batches of attestations,
- Method C: Rotating batches of attestations,

- Method D: Per-Relying Party attestations.
- Method D: Per-Relying Party attestations.

These methods are discussed in the next sections of this chapter. Based
on these discussions and an inventory of the opinion of Member States,
Chapter 6 contains a number of changes that will be made to the ARF.

>Note: other methods were discussed on batch attestations: provide attestations with different validity period within the batch, also including f.i. valid in future.
These methods are not included in the High Level Requirements.

### 3.2 Method A: Once-only attestations

#### 3.2.1 Description

In this approach, the Attestation Provider requires the Wallet Unit to
present each attestation only once.

#### 3.2.2 Advantages

If this approach is used, none of the unique values in the attestation
will be presented twice or more times to a Relying Party. Therefore, this
method fully mitigates Relying Party linkability.

#### 3.2.3 Technical impacts on Wallet Unit

If an attestation may be presented only once, in theory the Wallet Unit
could request a new attestation as soon as possible after an attestation
was presented to a Relying Party. However, this has obvious drawbacks
for both operational and privacy reasons. Therefore, the Wallet Unit
must store a batch of attestations, such that the User will be able to
use their Wallet Unit several times in (quick) succession, without the
need for the Wallet Unit to request fresh attestations from the
Attestation Provider in between.

To prevent the Wallet Unit from running out of unused attestations, it
must have a lower limit for the number of unused attestations it holds
and request a new batch from the Attestation Provider when the number of
unused attestations goes below this limit, as soon as it is able to.
This is called the 'saw-tooth model' in inventory management.

If this approach is used and the Wallet Unit is offline for a prolonged
period of time, the Wallet Unit may run out of unused attestations. To
prevent this, the Wallet Unit will warn the User that they should
connect their device to the internet, such that new attestations can be
issued.

If the Wallet Unit is not able to go online even after prompting the
User, it will finally run out of unused attestations. This means that
the User will no longer be able to present any attributes from that
attestation, which may be a much higher risk for the User than the risk
of being tracked. To prevent this, the Wallet Unit will use Method B, C or
D (if supported, see below) as a fallback. The fallback means that if
the Wallet Unit has run out of unused attestations and is not able to
request new ones, it will start re-using either a single attestation or
a batch of attestations, as described for these methods.

#### 3.2.4 Drawbacks

A drawback of this method is that the number of attestations to be
issued depends on the frequency of use. This has two effects:

1. The Attestation Provider probably gets a fairly accurate idea of how
 often the User uses their attestation, including how such usage is
 spaced in time. In other words, while this method prevents leakage
 of information to Relying Parties, it in fact leaks information on
 the use of the attestation to the Attestation Provider.

2. This method may imply unpredictability regarding the load on
 the Attestation Provider's systems. If a User uses their attestation
 frequently, the Attestation Provider will have to issue many
 attestations. On the flip side, if an attestation is seldom used,
 the Attestation Provider will have to issue very few attestations
 per year. This is because the validity period of the attestation can
 be chosen very long if an attestation is presented at most once
 anyway, without negative effects to the User's privacy.

Another drawback of this method is that the Attestation Provider is
dependent on the correct implementation by the Wallet Unit to ensure
that it is used correctly.

### 3.3 Method B: Limited-time attestations

#### 3.3.1 Description

In another approach, a Wallet Unit may present each attestation multiple
times, but only as long as it is valid. Moreover, the Wallet Provider
limits the length of the attestation validity to such an extent that it
is statistically unlikely that any of the unique values in the
attestation can be effectively used by colluding Relying Parties to
correlate and track the User.

#### 3.3.2 Advantages

The biggest advantages of this method are:

- The Wallet Unit does not need to support any dedicated
 functionality, like it must for once-only attestations,
 rotating-batch attestations, or per-RP attestations. This also
 implies that, to implement this method, the Attestation Provider is
 not dependent in any way on the Wallet Unit, which may also be seen
 as an advantage.

- This method will result in the issuance of a fixed number of
 attestations per year, regardless of usage. This means a predictable
 load for the Attestation Provider,

- Finally, the fixed number of attestations per year also implies that
 the Attestation Provider does not get any information about the
 frequency of use of their attestations.

#### 3.3.3 Technical impacts on Wallet Unit

None, as described above.

#### 3.3.4 Drawbacks

The main drawbacks of this method are

- The risk of Relying Party linkability is not zero, however short the
 attestation validity period is chosen. This may a both a real
 (technical) risk and a reputational risk, in the sense that it may
 be hard to counter accusations of a lack of privacy.

- It may be hard to estimate how often the User will present their
 attestation, or to determine what an acceptable level of risk to
 User privacy is. This is essentially a risk analysis to be done by
 the Attestation Provider, considering the average usage of their
 attestations.

- Since the Attestation Provider will not have usage information per
 User, it can only use estimated averages. However, there always will
 be Users will an above-average attestation usage. These Users will
 therefore be subject to a higher level of risk of tracking.

- The Attestation Provider may have to issue many attestations that
 will never get used, especially if the attestation validity period is short.

### 3.4 Method C: Rotating-batch attestations

#### 3.4.1 Description

Using this method, the Attestation Provider issues attestations in
batches to the Wallet Unit, like when using once-only attestations (method
A). However, in method C a Wallet Unit uses the attestations from a batch in
a random order, until it has used all attestations in the batch once.
Then it 'resets' the batch and starts using them again in a
random order.

A batch may consist, for instance, of 20 attestations. If so, any
attestation given will be presented unpredictably in 5% of all
transactions between a User and a Relying Party. This makes tracking
difficult as long as only a minority of Relying Parties is colluding or breached.
The level of privacy can be increased by issuing larger batches, at the
expense of having to generate more attestations.

In addition, the attestations in the batch have a validity period, and
cannot be used after the validity period is over. This means that the
Attestation Provider will need to replace the entire batch some time
before the validity period ends. By decreasing the length of the
validity period, the Attestation Providers increases the level of
protection against Relying Party linkability.in a manner that is
independent of the batch size.

This approach has been used, for example, in Cooperative Intelligent
Transport Systems (C-ITS).

The OpenID4VCI specification used for attestation issuance in the EUDI
Wallet ecosystem supports batch issuance.

#### 3.4.2 Advantages

If this approach is used, the number of attestations to be issued is
constant over time and does not depend on usage. Therefore, like method
B, this method does not leak information to the Attestation Provider and
ensures a constant and predictable load for the Attestation Provider's
systems.

Moreover, compared to method B this method increases the level of
privacy, especially for attestations that are used quite frequently. Or,
to put the same thing in a different way, if a batch of attestations is
used in a rotating fashion, the validity period of an attestation can be
longer without impacting the User's privacy.

#### 3.4.3 Technical impacts on Wallet Unit

The Wallet Unit must implement dedicated functionality to support this
method, for example to keep track of which attestations are used and
unused, and when a batch is fully used and must be reset.

#### 3.4.4 Drawbacks

This method has the following drawbacks:

- The risk of Relying Party linkability is not zero, however big the
 batch size and however short the attestation validity period is
 chosen. This may a both a real (technical) risk and a reputational
 risk, in the sense that it may be hard to counter accusations of a
 lack of privacy.

- The Attestation Provider is dependent on the correct implementation
 by the Wallet Unit to ensure that this method is used correctly.

- Also, the Attestation Provider must take a decision regarding batch
 size and validity period, balancing User privacy against load on
 their systems. Like for method B, this may be a difficult exercise,
 and the chosen sizes and validity periods will not fully guarantee
 the privacy of all Users.

- Moreover, every time the attestations expire, the Provider will need
 to issue a full batch of attestations, instead of just a single one.
 This is regardless of whether all attestations in the batch have
 actually been used or not. Therefore, this approach seems suitable
 only if the User presents attributes to Relying Parties frequently.

### 3.5 Method D: Per-Relying Party attestations

When this method is used, the Wallet Unit will present different
attestations to different Relying Parties. However, in case a Relying
Party requests attributes from this attestation multiple times, the
Wallet Unit SHALL present the same attestation to this Relying Party
each time.

In fact, this method can be seen as a mixture of methods A and B
described above: it uses method A for different Relying Parties, and
method B for recurring Relying Parties. This implies that all of the
respective advantages and disadvantages of these methods apply also for
this method. The 'weight' of these advantages and disadvantages will
depend on whether the User interacts a few times with a large number of
different Relying Parties, or, on the contrary, tends to interact a
larger number of times with only a small number of Relying Parties.

Regarding the technical impacts on the Wallet Unit, there is one
additional requirement compared to the ones listed above for method A.
This is that the Wallet Unit must keep track of which attestation it has
presented to which Relying Party. It is possible to do so, since
according to the ARF, the access certificates used by Relying Party to
authenticate themselves to Wallet Units contain a unique identifier of
the Relying Party. However, it represents an extra effort for the Wallet
Unit, and it may complicate attestation inventory management.

### 3.6 General note: Diminishing the costs of issuing multiple attestations

The mitigation measures discussed in this chapter all imply that the Wallet Unit
must manage multiple attestations. The operational costs of issuing and managing an attestation are determined to some extent by the requirement that, for security reasons, the Wallet Unit must generate a new cryptographic key pair for each attestation. It stores the private key in its WSCA/WSCD and sends the public key to the Attestation Provider for inclusion in the attestation. Key generation is an expensive operation for many WSCDs, and for some types of WSCD, the number of private keys that can be managed simultaneously is limited.

These operational challenges can be lessened in (at least) two ways:

- By allowing re-use of existing key pairs (under specific
 conditions).

- By relying on a Hierarchical Deterministic Key (HDK) function as
 described in clause 4.4.4.2 of [ETSI 119476]. Using a HDK
 function, the Attestation Provider only needs to keep track of a
 single public key and use it to derive unique per-attestation public
 keys. Each public key is then sent to the Wallet Unit, and the
 Wallet Unit can derive the corresponding private key in the
 WSCA/WSCD.

These two possibilities will be discussed in Topic B (Re-issuance and
batch issuance of PIDs and Attestations) and Topic C (Wallet Unit
Attestation (WUA) and key attestation), respectively. They will
therefore not be further discussed here.

### 3.7 Non-technical mitigation measures

The technical mitigation measures discussed in this chapter aim to fully or
partially prevent Relying Parties from linking attestations and thus track Users.
However, in addition to preventive measures, it is also important to look at
measures that can help to detect any such tracking by Relying Parties and
Attestation Providers, to correct it insofar possible, and to repress it by
appropriately punishing any party that is found to have broken applicable laws.
In fact, this was already mentioned in sections 2.2 and 2.3.
However, defining such measures is outside the scope of the ARF.

## 4 Ensuring User privacy when checking the revocation status of attestations

### 4.1 Introduction

For the revocation of PIDs and attestations (including WUAs), the ARF
specifies three methods:

- Only issue short-lived attestations having a validity period of 24
 hours or less, such that revocation will never be necessary,

- Use an Attestation Status List mechanism specified.
- Use an Attestation Status List mechanism specified.

- Use an Attestation Revocation List mechanism specified.
- Use an Attestation Revocation List mechanism specified.

The latter two methods imply that a Relying Party must regularly
download an Attestation Status List or Attestation Revocation List, to
be able to verify that the Attestation Provider has not revoked the
attestation. When discussing the risk of tracking Users, particular
attention should be given to this process.

### 4.2 General requirements

To the maximum extent feasible given operational constraints, the
Attestation Provider should not be able to learn anything about the
User's use of an attestation based upon interactions between Relying
Parties and the Attestation Provider related to attestation revocation
checking.

A Relying Party Instance therefore should not request the relevant
Attestation Status List or Attestation Revocation List each time an
attestation is presented to it by a Wallet Unit. Rather, the Relying
Party operating the Relying Party Instance should download each new
version of the list once, at a time and from a location unrelated to the
presentation of an attestation by a User. The Relying Party should then
distribute it to all of its Relying Party Instances using an Relying
Party-internal distribution mechanism (1).

>(1) Note that strict compliance to this recommendation would imply that
Relying Party Instances must always have locally available the latest
version of the complete ASL. This may not always be technically
feasible. Relying Parties must find a balance between User privacy and
optimisation of resource usage.

Downloading an Attestation Status List or Attestation Revocation List
SHALL NOT require the Relying Party or Relying Party Instance to
authenticate itself in any way.

### 4.3 Requirements specific for Attestation Status Lists

To ensure User privacy specifically when the Attestation Provider uses
Attestation Status Lists to enable revocation checking, this document
recommends the following:

- To ensure the privacy of the User, the Attestation List Provider
 should randomly assign the index for each attestation. Note that
 randomly assigning indices within a bitstring or byte array is more
 complicated than creating random identifiers (e.g. serial numbers)
 for attestations, as is needed to implement an Attestation
 Revocation List. This is because duplicate indices and unnecessarily
 long bitstrings or byte arrays should be prevented.

- An Attestation List Provider should represent a sufficiently large
 number of attestations on each Attestation Status List to ensure
 herd privacy. In this context, herd privacy means that if a Relying
 Party requests a particular ASL, the Attestation List Provider is
 not able to deduce which attestation (likely) was presented to that
 Relying Party.

## 5 Mitigating linkability by using Zero-Knowledge Proofs

Zero-Knowledge Proofs (ZKP) offer strong potential as a
privacy-enhancing technique. This topic will be revisited in Topic G to
determine the foundational requirements needed for its future
integration, particularly focusing on defining specific requirements for
implementing ZKPs by using any type of WSCD/WSCA.

For further details, please see the 'Cryptographers' Feedback on the EU
Digital Identity's ARF'
[(here)](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/200),
and the Commission's response to it
[here.](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/211#discussioncomment-9882388)

## 6 Additions to the ARF

### 6.1 High-Level Requirements to be added to Annex 2

The High-Level Requirements in this section will be added to Annex 2 of
the ARF.

#### 6.1.1 Requirements to be added (likely) to Topic 10/23

##### REQUIREMENT 1

A PID Provider, Attestation Provider, or Wallet Provider SHALL
ensure that all PID, attestation or WUA unique elements, including
at least

- the salt used for hashing every attribute,

- the hash values of all attributes,

- the attestation identifier or index used for revocation purposes
 (if applicable),

- the attestation public key used for device binding and User
 binding,

- the value of the Attestation Provider signature,
- the value of the Attestation Provider signature,

have values that are unique across all PIDs, attestations, or WUAs
issued by that Provider.

>Note: This can be achieved, for example, by ensuring that salt values
and attestation identifiers are pseudo-random numbers generated by a
cryptographically secure pseudo-random number generator (CSPRNG).

##### REQUIREMENT 2

When issuing PIDs, attestations, or WUAs in a batch to a Wallet
Unit, a PID Provider, Attestation Provider or Wallet Provider SHALL
ensure that the timestamps in these PIDs, attestations, or WUAs do
not enable Relying Parties to conclude that they are part of the
same batch (and therefore belong to the same User).

>Note: This can be done, for example, by ensuring that a sufficiently
high number of batches, each issued to a different Wallet Unit, share
the same timestamp values (herd privacy).

##### REQUIREMENT 3

A Wallet Provider SHALL ensure that its Wallet Solution supports the
following methods for limiting the number of times a User can
present the same attestation to Relying Parties:

- Method A: Once-only attestations, as specified in requirement 5
 below.

- Method B: Limited-time attestations, as specified in requirement
 6 below.

In addition, a Wallet Provider MAY ensure that its Wallet Solution
supports the following methods:

- Method C: Rotating-batch attestations, as specified in requirement 7
 below.

- Method D: Per-Relying Party attestations, as specified in
 requirement 8 below.

>Note: Wallet Solutions, PID Providers, Attestation Providers, and Wallet Providers
are free to define and use other methods as well. However, such other methods are
out of scope of the ARF. For example, Member States have discussed adding a
variation of method B where attestations are issued in a batch, but with
overlapping validity periods rather than identical ones. Some of these attestations
would then become valid in the future. This could help reduce the risk of a Wallet
Unit not having a valid attestation after having been offline for a (long)
time. However, it was decided to not add this method.

##### REQUIREMENT 4

To the maximum extent possible, Wallet Providers, PID Providers, and
Attestation Providers SHALL:

- ensure that Users do not notice which of the methods referenced in requirement 3
 is used for their PIDs, attestations, or WUAs,
- ensure that no User action is needed for the re-issuance of PIDs or attestations.

>Note: The topic of re-issuance will be further discussed with Member
States in Topic B.

##### REQUIREMENT 5

When using Method A for a given type of PID, attestation, or WUA,

a. the Wallet Unit SHALL request the PID Provider, Attestation Provider, or Wallet
Provider to issue PIDs, attestations, or WUAs in batches to the Wallet Unit. All
PIDs, attestations, or WUAs in a batch SHALL have the same attribute values and
the same validity period.

b. the Wallet Unit SHALL present each PID or, attestation, or WUA only once
to a Relying Party, except when it has fallen back to Method B as specified below,
or to another available method.

c. the Wallet Unit SHALL have a lower limit for the number of
unused PIDs, attestations, or WUAs it holds, and SHALL request
the issuance of a new batch when this limit is reached. During
the first issuance of a new PID, attestation, or WUA, see
requirement 10, the PID Provider, Attestation Provider or Wallet Provider
SHALL inform the Wallet Unit about the value of the lower limit and the
size of the batch to be requested.

d. if the Wallet Unit must request a new batch of PIDs,
attestations, or WUAs, but is not able to do so because it is
offline, the Wallet Unit SHALL warn the User that they are about
to lose the possibility to present this PID or attestation to a
Relying Party (or any PID or attestation, in case of the WUA)
and request them to connect their device to the internet.

e. if the Wallet Unit has run out of unused PIDs, attestations, or
WUAs, but is not able to request a new batch because it is
offline, it SHALL fall back to method B (see requirement 6), or another available
method. This means that, when requested by a Relying Party,
the Wallet Unit SHALL again present one of the already used
PIDs, attestations of WUAs. The Wallet Unit SHALL return
to using method A as soon as it is able to go online and request a new
batch of PIDs, attestations or WUAs.

##### REQUIREMENT 6

When using Method B for a given type of PID, attestation, or WUA,

a. the Wallet Unit SHALL request the PID Provider, Attestation Provider,
or Wallet Provider to issue a single PID, attestation, or WUA to the Wallet Unit.

b. when requested to do so, the Wallet Unit SHALL present that PID,
attestation or WUA multiple times to the same Relying Party, or
to different Relying Parties.

c. the Wallet Unit SHALL request the PID Provider or Attestation
Provider to issue a new PID, attestation , or WUA some time
before the one existing in the Wallet Unit expires. The PID Provider,
Attestation Provider, or Wallet Provider SHALL inform the Wallet Unit about
the moment at which the Wallet Unit must request the issuance of
a new PID, attestation, or WUA, relative to the expiration date
of the existing one.

Notes:

- If method B is used with a batch instead of a single PID,
 attestation, or WUA, it may become method C (see requirement 7)
 or Method D (see requirement 8).

- It is the responsibility of Relying Parties to validate whether a
 presented PID, attestation, or WUA is temporally valid. There is no
 requirement that a Wallet Unit must not present a PID, attestation,
 or WUA if it is no longer valid.

##### REQUIREMENT 7

When using Method C for a given type of PID, attestation, or WUA,

a. The Wallet Unit SHALL request the PID Provider, Attestation
Provider, or Wallet Provider to issue PIDs, attestations, or
WUAs in batches to the Wallet Unit. All PIDs, attestations, or WUAs in a
batch SHALL have the same attribute values and the same validity period.

b. When a presentation of attributes is requested by Relying
Parties, the Wallet Unit SHALL present each PID, attestation, or
WUA in a batch once, in a random order.

c. When all PIDs, attestations, or WUAs in a batch have been presented
once, the Wallet Unit SHALL reset the batch, and start
presenting each PID, attestation, or WUA in the batch
again in a random order.

d. The Wallet Unit SHALL request the PID Provider, Attestation
Provider or Wallet Provider to issue a new batch of PIDs,
attestations, or WUAs, some time before the batch in the Wallet Unit
expires. The PID Provider, Attestation Provider or Wallet Provider SHALL
inform the Wallet Unit about the size of the batch and about the moment at
which the Wallet Unit must request the issuance of a new batch, relative
to the expiration date of the existing one.

##### REQUIREMENT 8

When using Method D for a given type of PID, attestation, or WUA,

a. The Wallet Unit SHALL present different PIDs, attestations, or
WUAs to different Relying Parties upon their request. This means
that it SHALL comply with requirement 5 (method A) for such
Relying Parties.

b. In case a given Relying Party requests attributes from
a given type of PID, attestation, or WUA multiple times, the
Wallet Unit MAY present the same PID, attestation or WUA to
this Relying Party. This means that it SHALL comply with requirement
6 (method B) or requirement 7 (method C) for such a Relying Party.

c. The Wallet Unit SHALL keep track of which PID, attestation, or
WUA it has presented to which Relying Party, using the unique
Relying Party identifier from the Relying Party access
certificate.

##### REQUIREMENT 9

A PID Provider, Attestation Provider or Wallet Provider SHALL have a
policy describing which of the methods specified in requirement 3 it
will use to limit the number of times a Wallet Unit may present a
single PID, attestation, or WUA to relying Parties. For each supported method,
the policy SHALL also specify how the values for respective parameters
for that method, such as validity period and batch size, will be
chosen. The goal of the policy SHALL be to ensure that the risk of
Relying Party linkability is mitigated to an acceptable level, given
the (expected) usage of the PID, attestation, or WUA by the User. To
determine what an acceptable level of risk is, the PID Provider,
Attestation Provider, or Wallet Provider SHALL carry out a risk
analysis regarding Relying Party linkability.

>Note: If a PID Provider, Attestation Provider or Wallet Provider issues
multiple attestation types, these requirements apply for each type of
attestation separately.

##### REQUIREMENT 10

The Commission SHALL create or reference a profile or extension of the OpenID4VCI
specification enabling a PID Provider, Attestation Provider, or Wallet Provider,
to indicate in their OpenID4VCI Issuer metadata which of the methods listed in
requirement 3 the Wallet Unit must use for the PID, attestation, or WUA issued.
Indicated methods SHALL be ordered by preference. This profile or extension SHALL
also enable the PID Provider, Attestation Provider, or Wallet Provider to set the
value of parameters to be used by the Wallet Unit for each method (if applicable).

>Note: For example, the parameters to be set for method A include the
lower limit for unused attestations and the batch size to be requested (see
requirement 5b).

##### REQUIREMENT 11

PID Providers and Attestation Providers SHALL indicate in their OpenID4VCI Issuer
metadata at least that either method A or method B must be used for this type of
attestation. PID Providers and Attestation Providers MAY additionally indicate that
it prefers using method C and/or method D over method A or method B. In such a case,
a Wallet Unit supporting method C and/or method D SHALL use that method, while a
Wallet Unit not supporting these methods SHALL use method A or method B, as
applicable.

>Example: An Attestation Provider indicates methods {D, C, A} in their metadata, in
that order. A Wallet Unit that supports methods C and D (as well as A and B) then
uses method D for this type of attestation. A Wallet Unit supporting methods
A, B and C uses method C. A Wallet Unit supporting only methods A and B uses
method A.

#### 6.1.2 Requirements to be added (likely) to Topic 1

##### REQUIREMENT 12

When receiving a PID, attestation, or WUA a Relying Party Instance
SHALL discard the values of all unique elements, including at least
the ones mentioned in requirement 1 above, as well as any timestamps,
as soon as they are no longer needed. The Relying Party Instance
SHALL NOT communicate these values to the Relying Party or to any
other party inside or outside the EUDI Wallet ecosystem.

#### 6.1.3 Requirements to be added (likely) to Topic 7

##### REQUIREMENT 13

A Relying Party Instance SHOULD NOT request the relevant Attestation
Status List or Attestation Revocation List each time an attestation
is presented to it by a Wallet Unit. Rather, the Relying Party
operating the Relying Party Instance SHOULD download each new
version of the list once, at a time and from a location unrelated to
the presentation of a PID or attestation by a User. The Relying
Party SHOULD then distribute the list to all of its Relying Party
Instances, using an Relying Party-internal distribution mechanism.

##### REQUIREMENT 14

A PID Provider, Attestation Provider or Wallet Provider SHALL NOT
require the Relying Party or Relying Party Instance to authenticate
itself before downloading an Attestation Status List or Attestation Revocation
List.

##### REQUIREMENT 15

When using an Attestation Status List for revocation, the
Attestation List Provider SHALL randomly assign the index for each
PID or attestation, to prevent this index from becoming a
correlator.

>Note: Randomly assigning indices within a bitstring or byte array is more
complicated than creating random identifiers (e.g. serial numbers)
for attestations, as is needed to implement an Attestation Revocation List.
This is because duplicate indices and unnecessarily long bitstrings
or byte arrays must be prevented.

##### REQUIREMENT 16

When using an Attestation Status List for revocation, the Attestation List
Provider SHALL represent a sufficiently large number of PIDs, attestations,
or WUAs on each Attestation Status List to ensure herd privacy.

>Note: In this context, herd privacy means that if a Relying Party
requests a particular ASL, the Attestation List Provider is not able to
deduce which PID or attestation (likely) was presented to that Relying
Party.

>Note: Complying with this requirement may be difficult in case the number
of PIDs, attestations, or WUAs to be represented on the list is small.
In such a case, as suggested in [RFC_ASL], decoy entries can be added
to the list to obfuscate the real number of referenced PIDs, attestations,
or WUAs.

#### 6.1.4 Requirements to be added (likely) to Topic 10

##### REQUIREMENT 17

After issuing a PID, attestation, or WUA a PID provider, Attestation Provider
or Wallet Provider SHALL discard the values of all unique elements, including
at least the ones mentioned in requirement 1 above, as well as any timestamps,
as soon as they are no longer needed. The Provider SHALL NOT communicate
these values to any other party inside or outside the EUDI Wallet ecosystem.

### 6.2 High-Level Requirements to be deleted

WUA_09: A Wallet Provider SHALL consider all relevant factors,
including the risk of a WUA public key becoming a vector to track the
User, when deciding on the validity period of a WUA. A Wallet Provider
MAY use short-lived WUAs to mitigate such risks.

WU_Revocation_04: The Wallet Provider SHALL manage the issuance
processes for WUAs in such a way that the WUAs cannot be misused by
colluding Relying Parties (and Attestation Providers) to track a User.

These two requirements can be deleted if the ones proposed in section
6.1 are added, because the proposed requirements include the Wallet
Provider and are much more detailed than the above two requirements.

### 6.3 Descriptions to be added to the ARF main document

A summary of the descriptions in chapter 2 will be added to section
6.1.3 of the ARF main document, version 1.7. A summary of the
descriptions in chapter 3 will be added to section 6.6.5 of the ARF main
document, version 1.7.

## 7 References

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr>
<th>Reference</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>[RiskRegister]</td>
<td>Annex 1 to the Commission Implementing Regulation laying down rules
for the application of Regulation (EU) No 910/2014 of the European
Parliament and of the Council as regards the certification of the
European Digital Identity Wallets, European Commission, October 2024,
draft</td>
</tr>
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
<td>SD-JWT-based Verifiable Credentials (SD-JWT VC),
draft-terbu-sd-jwt-vc-06, O. Terbu <em>et al.,</em> 13 November 2024,
draft</td>
</tr>
<tr>
<td>[ETSI 119476]</td>
<td>ETSI TR 119 476, Analysis of selective disclosure and zero-knowledge
proofs applied to Electronic Attestation of Attributes, v1.2.1,
2024-07</td>
</tr>
<tr>
<td>[W3C VCDM 1.1]</td>
<td>W3C Verifiable Credentials Data Model 1.1,
2024-07</td>
</tr>
<tr>
<td>[RFC_ASL]</td>
<td>Token Status List, draft-ietf-oauth-status-list-06, T. Looker et al., 3 December 2024, draft</td>
</tr></tbody>
</table>
