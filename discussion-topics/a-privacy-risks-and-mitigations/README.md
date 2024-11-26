

# Topic A: Privacy risks and mitigations

## 1. Introduction

### 1.1. Discussion Paper topic description


*Starting from the risk registry, review and enhance the privacy
requirements related to tracking and tracing. This includes evaluating
current mitigations for privacy risks, identifying additional measures
to further minimize these risks, and exploring alternative solutions,
such as Zero-Knowledge Proofs (ZKP).*

*A section will be added to the ARF to discuss:*

1.  *the risks for User privacy, especially regarding tracking as a
    result of collusion between Relying Parties or between a Relying
    Party and an Attestation Provider*

2.  *the countermeasures taken in the current version of the ARF*

3.  *the ways in which Attestation Providers can further reduce these
    risks, for example by issuing short-lived attestations.*

4.  *the ways in which these risks may be fully mitigated in the future,
    e.g. by means of ZKP-based proof mechanisms for attestations.*

### 1.2. Related risks in the Risk Register

The risk register for European Digital Identity Wallets \[RiskRegister\]
contains the following risks regarding User tracking as a result of
collusion between Relying Parties or between a Relying Party and an
Attestation Provider:

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
<td>R14</td>
<td>Surveillance</td>
</tr>
<tr>
<td><strong>System-related risks</strong></td>
<td>SR1 </td>
<td>Wholesale surveillance </td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><strong><u>R14. Surveillance</u></strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Surveillance, or monitoring, is defined as the unauthorised tracking
or observation of a wallet user’s activities, communication, or data.
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
<th><strong><u>SR1. Wholesale surveillance</u> </strong></th>
</tr>
</thead>
<tbody>
<tr>
<td>Wholesale surveillance is defined as the tracking or observation of
the activities of many users through their wallet’s communication or
data. Wholesale surveillance is often associated with surveillance (R14)
and inference at a global scale, where information about many users is
combined to deduce sensitive or personal data about users or to identify
statistical trends that can be used to design further attacks.</td>
</tr>
</tbody>
</table>

More specifically, \[RiskRegister\] describes the following threats to a
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
<td>Data disclosure (R6) / Surveillance (R14)</td>
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

### 1.3. Key words

This document uses the capitalized key words ‘SHALL’, ‘SHOULD’ and ‘MAY’
as specified in RFC 2119, i.e., to indicate requirements,
recommendations and options specified in this document.

In addition, ‘must’ (non-capitalized) is used to indicate an external
constraint, i.e., a requirement that is not mandated by this document,
but, for instance, by an external document such as \[ARF\]. The word
‘can’ indicates a capability, whereas other words, such as ‘will’, and
‘is’ or ‘are’ are intended as statements of fact.

### 1.4. Document structure 

This document is structured as follows:

-   Chapter 2 explains in detail the risks for User privacy due to
    collusion between Relying Parties and/or Attestation Providers

-   Chapter 3 discusses possible mitigation measures for Relying Party
    linkability.

-   Chapter 4 briefly discusses Zero-Knowledge Proofs as an alternative
    way to mitigate these risks. This topic will be discussed with the
    Cooperation Group later in more detail.

-   Chapter 5 proposes a few High-Level Requirements to be added to the
    ARF. These are for discussion.

## 2. Risks for User privacy due to collusion

### 2.1. Linkability

This chapter describes in detail how the attestation formats currently
specified for use in the EUDI Wallet ecosystem could be misused for
tracking the User’s behaviour.

The attestation formats required to be supported in the ARF are
specified in ISO/IEC 18013-5 \[ISO18013-5\] and “SD-JWT-based Verifiable
Credentials (SD-JWT VC)” \[SD-JWT VC\]. Both of these formats enable
selective disclosure of attributes by making use of so-called
salted-attribute hashes. For more information on this technique, see
\[ETSI 119476\]. In a nutshell, the idea is that an Attestation Provider
does not sign the attribute values directly, but instead signs a
collection of hash values, where each hash is calculated over the
concatenation of an attribute value and a unique salt. This allows the
User to present only a single attribute value (plus the associated
salt), while enabling the Relying Party to verify the Attestation
Provider signature and the fact that the present d attribute value is
indeed included in the signature via its hash.

A property of these attestation formats is that every attestation that
is presented to a Relying Party contains a number of elements having a
unique value. These elements include:

-   The salt of every attribute that is presented,

-   The hash values of all attributes, that were signed by the
    Attestation Provider,

-   The attestation identifier or index used for revocation purposes (if
    applicable),

-   The attestation public key used for device binding and User binding,

-   The value of the Attestation Provider signature.

Apart from being unique in the whole EUDI Wallet ecosystem, the values
of these elements also are fixed, meaning that when the same attestation
is presented again, the Relying Party will receive the same values. This
fact enables malicious Relying Parties and Attestation Providers to link
attribute values that were presented to different Relying Parties in
different transactions. If this happens, the reasonable expectation of
Users that their separate activities involving the EUDI Wallet will not
be combined into a single profile of their behaviour, is violated.

Linkability comes in two varieties, Relying Party linkability and
Attestation Provider linkability. These are discussed in the next
sections.

### 2.2. Relying Party linkability

Relying Party linkability means that one or more malicious Relying Party
are able to link multiple presentations of the same attestation. For
example, a Relying Party that requests and receives age\_over\_18
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

The same principle can obviously also be applied by multiple colluding
Relying Parties. By collecting and sharing values of unique attestation
elements, they will be able to recognize that the same attestation was
used at multiple Relying Parties. By combining the attribute values that
were presented during each of these interactions, they will be able to
build a profile of the User.

As will be made clear in the next chapter, an (honest) Attestation
Provider can partly or fully prevent Relying Party linkability of the
attestations it issues, at the cost of issuing multiple attestations to
the same User.

In addition, it should be noted that apart from technical and preventive
measures, also organisational and repressive measures can be used to
discourage Relying Parties from colluding and tracking Users. In
particular, Relying Parties found offending can have their access
certificate revoked, after which they will not be able to interact with
Wallet Units anymore.

### 2.3. Attestation Provider linkability

Attestation Provider linkability means that one or more Relying Parties
collude with the provider of an attestation to track the User when using
that attestation. In this scenario, the Attestation Provider stores all
of the unique element values in all attestations (i.e., salts, hashes,
public key, signature value) issues, together with the user to which
each of these values was issued.

Then, after it has received an attestation, a Relying Party notifies the
Attestation Provider about the value of any of the unique elements in
that attestation. This allows the Attestation Provider to identify the
corresponding User, and to track at which Relying Parties the User
presents their attestations.

Unlike for Relying Party linkability, Attestation Provider linkability
cannot be prevented for attestations using salted-attribute hashes. The
only way to technically mitigate this risk is by using Zero-Knowledge
Proofs instead, as described in section 4. However, as for Relying Party
linkability, organisational and repressive measures can be used to
discourage Attestation Providers from colluding and tracking Users. In
addition, many Attestation Providers are subject to regular audits,
which means that collusion and tracking can more easily be detected.

## 3. Possible mitigation measures for Relying Party linkability within the current ARF

### 3.1 When issuing and presenting attestations

An (honest) Attestation Provider can mitigate Relying Party linkability
mitigated partly or fully by the following two measures:

1.  Ensuring that all attestation unique elements discussed in section
    2.1 are unique across all attestations issued by the Attestation
    Provider (and not only per attestation). This can be achieved, for
    example, by ensuring that salt values and attestation identifiers
    are pseudo-random numbers generated by a cryptographically secure
    pseudo-random number generator (CSPRNG).

2.  Limiting the number of times a Wallet Unit may present a single
    attestation.

Regarding the second point above: An Attestation Provider can employ at
least three different methods to achieve this: once-only attestations,
limited-time attestations, and rotating batches of attestations

#### 3.1.1 Method A: Once-only attestations

In this approach, the Attestation Provider requires the Wallet Unit to
present each attestation only once. This is the most privacy-friendly
solution; because it means that none of the unique values in the
attestation will be issued twice or more times to a Relying Party. This
fully mitigates Relying Party linkability.

If an attestation may be presented only once, each time the User
presents one of the attributes of that attestation to a Relying Party,
the Attestation Provider must issue a new attestation. Otherwise, the
Wallet Unit will eventually run out of attestations. Please note that
this does not imply that the Provider must do so immediately, or that
the Provider is able to do so without requesting the User’s permission.
Different solutions can be thought of; for example, the Wallet Unit
could have a lower limit for the number of unused attestations it holds
and request a new set when the number of attestations goes below this
limit, as soon as it is able to.[1]

In addition, if this approach is used, most likely the Wallet Unit will
need to store a couple of attestations, such that the User will be able
to use their Wallet Unit several times without the need for the Wallet
Unit to request fresh attestations from the Attestation Provider in
between. The latter may be impossible in some cases, for instance if the
Wallet Unit is used in a region with limited internet access.

A drawback of this method is that the number of attestations to be
issued depends on the frequency of use. This has two effects:

1.  The Attestation Provider probably gets a fairly accurate idea of how
    often the User uses their attestation, including how such usage is
    spaced in time.

2.  This method may mean imply unpredictability regarding the load on
    the Attestation Provider’s systems. If a User uses their attestation
    frequently, the Attestation Provider will have to issue many
    attestations. On the flipside, if an attestation is seldomly used,
    the Attestation Provider will have to issue very few attestations
    per year. This is because the validity period of the attestation can
    be chosen very long if an attestation is presented at most once
    anyway, without negative effects to the User’s privacy.

The operational costs of issuing an attestation are determined to some
extent by the requirement that, for security reasons, the Wallet Unit
must generate a new cryptographic key pair for each attestation. It
stores the private key in its WSCA/WSCD and sends the public key to the
Attestation Provider for inclusion in the attestation. The operational
costs of issuing many attestation may be lessened in two ways:

-   By allowing re-use of existing key pairs under specific conditions.

-   By relying on a Hierarchical Deterministic Key (HDK) function as
    described in clause 4.4.4.2 of \[ETSI 119476\]. Using a HDK
    function, the Attestation Provider only needs to keep track of a
    single public key and use it to derive unique per-attestation public
    keys. Each public key is then sent to the Wallet Unit, and the
    Wallet Unit can derive the corresponding private key in the
    WSCA/WSCD.

Note: These two possibilities will be discussed in Topic B (Re-issuance
and batch issuance of PIDs and Attestations) and Topic C (Wallet Unit
Attestation (WUA) and key attestation), respectively. They will
therefore not be further discussed here.

#### 3.1.2 Method B: Limited-time attestations

In another approach, a Wallet Unit may present each attestation multiple
times, but only as long as it is valid. Moreover, the Wallet Provider
limits the length of the attestation validity to ensure that it is
statistically unlikely that any of the unique values in the attestation
can be effectively used by colluding Relying Parties to correlate and
track the User. This is essentially a risk estimate to be done by the
Attestation Provider, taking into account the average usage of their
attestations.

An advantage of this method is that the Wallet Unit does not need to
support any dedicated functionality, like it must for once-only
attestations and rotating-batch attestations. In other words, to
implement this method, the Attestation Provider is not dependent in any
way on the Wallet Provider. Moreover, this method will result in the
issuance of a fixed number of attestations per year, regardless of
usage. This means a predictable load for the Attestation Provider.

A drawback is that it may be hard to estimate how often the User will
present their attestation, or what an acceptable level of risk to User
privacy is.

#### 3.1.3 Method C: Rotating-batch attestations

A third approach, finally, is where the Attestation Provider issues
attestations in batches. A Wallet Units receives such a batch and uses
these alternatingly in a random order, until it has used all
attestations in the batch once. Then it ‘resets’ the batch and starts
using them again, again in a random order. A batch may consist, for
instance, of 20 attestations. If so, any attestation given will be
presented unpredictably in 5% of all transactions between a User and a
Relying Party. This makes tracking difficult as long as only a minority
of Relying Parties is colluding. Of course, the level of privacy can be
increased by issuing larger batches, at the expense of having to
generate more attestations. Another way to increase privacy is by using
a shorter validity period for the batch.

This approach has been used, for example, in Cooperative Intelligent
Transport Systems (C-ITS).

A drawback of this method is that the Wallet Unit must implement
dedicated functionality to support it. This implies that the Attestation
Provider is dependent on the correct implementation by the Wallet Unit
to ensure that its attestations do not allow Relying Party linkability.
Also, the Attestation Provider must take a decision regarding batch
size, again balancing User privacy against load on their systems.

If a batch of attestations is used in a rotating fashion, the validity
period of an attestation can be longer without impacting the User’s
privacy. However, every time the attestations expire, the Provider will
need to issue a full batch of attestations, instead of just a single
one. This is regardless of whether all attestations in the batch have
been used (once or multiple times) or not. Therefore, this approach
seems suitable only if the User presents attributes to Relying Parties
frequently.

On the plus side, the number of attestations to be issued is constant
over time and does not depend on usage.



### 3.2. When checking the revocation status of attestations

#### 3.2.1 Introduction

For the revocation of PIDs and attestations (including WUAs), the ARF
specifies three methods:

-   Only issue short-lived attestations having a validity period of 24
    hours or less, such that revocation will never be necessary,

-   Use an Attestation Status List mechanism specified.

-   Use an Attestation Revocation List mechanism specified.

The latter two methods imply that a Relying Party must regularly
download an Attestation Status List or Attestation Revocation List, to
be able to verify that the Attestation Provider has not revoked the
attestation. When discussing the risk of tracking Users, particular
attention should be given to this process.

#### 3.2.2 General requirements

To the maximum extent feasible given operational constraints, the
Attestation Provider should not be able to learn anything about the
User’s use of an attestation based upon interactions between Relying
Parties and the Attestation Provider related to attestation revocation
checking.

A Relying Party Instance therefore should not request the relevant
Attestation Status List or Attestation Revocation List each time an
attestation is presented to it by a Wallet Unit. Rather, the Relying
Party operating the Relying Party Instance should download each new
version of the list once, at a time and from a location unrelated to the
presentation of an attestation by a User. The Relying Party should then
distribute it to all of its Relying Party Instances using an Relying
Party-internal distribution mechanism[2].

Downloading an Attestation Status List or Attestation Revocation List
SHALL NOT require the Relying Party or Relying Party Instance to
authenticate itself in any way.

#### 3.2.3 Requirements specific for Attestation Status Lists

To ensure User privacy specifically when the Attestation Provider uses
Attestation Status Lists to enable revocation checking, this document
recommends the following:

-   To ensure the privacy of the User, the Attestation List Provider
    should randomly assign the index for each attestation. Note that
    randomly assigning indices within a bitstring or byte array is more
    complicated than creating random identifiers (e.g. serial numbers)
    for attestations, as is needed to implement an Attestation
    Revocation List. This is because duplicate indices and unnecessarily
    long bitstrings or byte arrays should be prevented.

<!-- -->

-   An Attestation List Provider should represent a sufficiently large
    number of attestations on each Attestation Status List to ensure
    herd privacy. In this context, herd privacy means that if a Relying
    Party requests a particular ASL, the Attestation List Provider is
    not able to deduce which attestation (likely) was presented to that
    Relying Party.

## 4. Mitigating linkability by using Zero-Knowledge Proofs

Zero-Knowledge Proofs (ZKP) offer strong potential as a
privacy-enhancing technique. This topic will be revisited in Topic G to
determine the foundational requirements needed for its future
integration, particularly focusing on defining specific requirements for
implementing ZKPs by using any type of WSCD/WSCA.

For further details, please see the 'Cryptographers' Feedback on the EU
Digital Identity’s ARF’
[(here)](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/200),
and the Commission's response to it
[here.](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/211#discussioncomment-9882388)

## 5. Proposed ARF requirements

The High-Level Requirements below are proposals and are mainly meant to
stimulate discussion.

1.  A PID Provider or Attestation Provider SHALL ensure that all
    attestation unique elements, such as

    -   The salt of every attribute that is presented,

    -   The hash values of all attributes, that were signed by the
        Attestation Provider,

    -   The attestation identifier or index used for revocation purposes
        (if applicable),

    -   The attestation public key used for device binding and User
        binding,

    -   The value of the Attestation Provider signature.

> have values that are unique across all attestations issued by that
> Provider.
>
> Note: This can be achieved, for example, by ensuring that salt values
> and attestation identifiers are pseudo-random numbers generated by a
> cryptographically secure pseudo-random number generator (CSPRNG).

1.  A PID Provider or Attestation Provider SHALL have a policy to limit
    the number of times a Wallet Unit may present a single attestation,
    in order to ensure that the risk of Relying Party linkability is
    mitigated to an acceptable level.

2.  A Wallet Provider SHALL ensure that its Wallet Units support the
    following method(s) for limiting the number of times a User can
    present the same attestation to Relying Parties:

    -   &lt;TBD&gt;

3.  The Commission SHALL create or reference a profile or extension of
    the OpenID4VCI specification allowing PID Providers or Attestation
    Provider to indicate which one of the methods listed in requirement
    3 the Wallet Unit must use for the PID or attestation issued.

4.  A PID Provider or Attestation Provider SHALL NOT require the Relying
    Party or Relying Party Instance to authenticate itself before
    downloading an Attestation Status List or Attestation Revocation
    List.

## 6. References

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 80%" />
</colgroup>
<thead>
<tr>
<th>Reference</th>
<th>Document</th>
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
<td>[ETSI 119476]</td>
<td>ETSI TR 119 476, Analysis of selective disclosure and zero-knowledge
proofs applied to Electronic Attestation of Attributes, v1.2.1,
2024-07</td>
</tr>
</tbody>
</table>

[1] This is called the ‘saw-tooth model’ in inventory management.

[2] Note that strict compliance to this recommendation would imply that
Relying Party Instances must always have locally available the latest
version of the complete ASL. This may not always be technically
feasible. Relying Parties must find a balance between User privacy and
optimization of resource usage.
