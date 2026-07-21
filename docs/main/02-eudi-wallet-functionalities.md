## 2 EUDI Wallet functionalities

### 2.1 Introduction

The EUDI Wallet ecosystem is designed as a secure, User-controlled digital
environment that enables Users to use their Wallet Unit to manage and present
their person identification data (PID) and attestations across both public and
private services in the EU. Its functionalities are built around security,
privacy, and User control, ensuring seamless interactions with Relying Parties
and other entities, while adhering to data
protection principles.

This chapter outlines the core functionalities of the Wallet, as defined
by the [European Digital Identity Regulation], and examines how the requirements
for its implementation align with real-world use cases where Users will use
their Wallet Unit.

The functionalities of a Wallet can be grouped into the following
categories:

- **Secure identification and authentication**, ensuring that Users can present
person identification data in a trusted environment.
- **Exchanging qualified and non-qualified User attributes** through secure and
verifiable electronic attestations of attributes.
- **Electronic signing of documents or data**, allowing Users to create
legally recognised qualified electronic signatures and seals.
- **Generate and use pseudonyms** for authentication, to enhance privacy and
prevent tracking.

These functionalities are discussed in the next four sections.

### 2.2 Identification and authentication

Using their Wallet, Users are able to:

- **Identify and authenticate** to online and offline services, while using
**selective disclosure** of attributes as well as **User approval**. This
ensures that only necessary and User-approved attributes are presented to
Relying Parties, which minimises exposure of personal information.
- **Securely authenticate Relying Parties or other Wallet Units**, making sure
that attributes are only presented to trusted entities.
- **Onboard seamlessly with PID Providers or attestation Providers** by
leveraging existing electronic identification schemes, for a smooth and secure
registration process.
- **Be informed** whether a Relying Party is registered to receive
the attributes it requests.
- **Access a transaction log via a dashboard**, allowing Users to:  
    - **Review past interactions** with Relying Parties and other Wallets.
    - **Request data erasure** under Regulation (EU) 2016/679, Article 17 (right to erasure), to maintain privacy.
    - **Report suspicious Relying Parties** to the relevant national data
    protection authority.

These identification and authentication functions are closely linked to the
concept of the Wallet as an **electronic identity (eID) means**. Article
3(42) of the [European Digital Identity Regulation] defines the European Digital Identity Wallet as an
electronic identification means. As explained in this ARF, a Wallet Provider provides a
Wallet Unit (a unique technical configuration of its generic Wallet Solution) to a User. The Wallet Unit, together with
the PID issued to it and operated under the relevant eID scheme, implements the
functionality of the European Digital Identity Wallet as the eID means.

Article 5a(5), point (d), requires that the European Digital Identity Wallet,
provided under the relevant eID scheme, meets the requirements for Level of Assurance
high. In this ARF, this is implemented through a Wallet Provider providing
a Wallet Unit to which a PID is issued by a PID Provider. The Wallet Unit is operated under an eID scheme at
Level of Assurance high.

The concept of Level of Assurance (LoA) is defined for electronic identification means
(and the corresponding eID scheme). In the context of the EUDI Wallet ecosystem, this means that the LoA concept only applies to PID. For other attestations held and managed in
the Wallet Unit, assurance and trust are expressed through other mechanisms
(e.g., the security controls required for issuance and lifecycle management) and
the [European Digital Identity Regulation] does not prescribe any specific level to be reached.

To reflect this, the ARF uses the term 'level of security' for non-PID
attestations, to indicate that different attestations may be subject to
different security requirements. Each Attestation Provider specifies the
required level of security for its attestations (including, where applicable,
requirements on issuance, storage, presentation, and lifecycle management).

### 2.3 Attribute exchange mechanism using attestations

Using their Wallet Unit, Users are able to:

- **Request, store, and present** personal identification data and electronic
attestations of attributes under their sole
control, ensuring secure usage in both online and offline scenarios.
- **Backup a list of their attributes, attestations, and configurations**,
guaranteeing compliance with data portability rights.
- **Prevent tracking by Relying Parties** when using attestations,
ensuring privacy-preserving interactions.

### 2.4 Qualified electronic signatures

Using their Wallet Unit, Users are able to:

- **Create qualified electronic signatures and seals** for legally binding
digital transactions.
- **Sign documents using qualified electronic signatures**, which are provided
by default and free of charge to natural persons using the Wallet (Regulation (EU) No 910/2014, Article 5a(5), point (g)). Member States may provide for proportionate measures to limit the free-of-charge use to non-professional purposes.

These functionalities are implemented by using the authentication and signing
capabilities of the Wallet as part of a local QSCD, or by involving a
remote QSCD managed by a QTSP (called a Qualified Electronic Signature Remote
Creation (QESRC) Provider). Local QSCDs are discussed in [Section 4.3.2][432-components-of-a-wallet-unit].
QESRC Providers are discussed in [Section 3.9][39-qualified-electronic-signature-remote-creation-qesrc-providers].

For high-level requirements regarding the creation of qualified electronic
signatures, see [Topic 16][topic-16].

### 2.5 Pseudonyms

#### 2.5.1 Overview

Using the Wallet, Users are able to present a pseudonym to a Relying Party
to authenticate in situations where it is not necessary for the Relying Party to
learn the User's identity. A pseudonym enables the Relying Party to recognise
the same User across sessions within a defined scope, while avoiding unnecessary
identification. This aligns with the general principle in [European Digital
Identity Regulation], Article 5, that the use of user-chosen pseudonyms shall
not be prohibited.

In the European Digital Identity Wallet context, Wallet Units must support the
generation of pseudonyms and store them encrypted and locally ([European Digital
Identity Regulation], Article 5a(4)(b)). In addition, Relying Parties
must not refuse the use of pseudonyms where identification of the user is not
required by Union or national law ([European Digital Identity Regulation], Article 5b(9)).

The [Discussion Paper for Topic E](../discussion-topics/e-pseudonyms-including-user-authentication-mechanism.md)
introduced four possible use cases for pseudonyms within
the EUDI Wallet ecosystem:

- A. Pseudonymous authentication,
- B. Attribute registration with subsequent authentication using a pseudonym,
- C. Rate-limited participation and
- D. Linkable pseudonymous authentication.

These use cases are described in the next sections. [Section 4.7][47-possible-implementations-of-pseudonyms] provides further
information on how pseudonyms can be implemented to support these use cases.

For high-level requirements, see [Topic 11][topic-11]
in Annex 2.

#### 2.5.2 Use case A: Pseudonymous authentication

A User authenticates to a Relying Party using a pseudonym when the Relying Party
does not need to know the User's identity. The Relying Party typically links the
pseudonym to an account and afterwards grants access to that account when the
User can successfully authenticate using that pseudonym.  To be reliable for
account access, pseudonyms must be unique within the relevant scope (i.e., no
collisions between different Users for the same Relying Party scope). A User may
hold multiple pseudonyms at the same Relying Party (e.g., multiple accounts).

#### 2.5.3 Use case B: Attribute registration with subsequent authentication using a pseudonym

This use case builds on use case A. In addition to pseudonymous authentication,
the User may wish to register verifiable attributes (e.g., by presenting a PID
or attestation) in the account. The Relying Party receives evidence that the
attributes provided are associated with the same User who controls the
pseudonym. Where available, a cryptographic binding mechanism, as discussed in
[Section 6.6.3.10.2][66310-relying-party-instance-verifies-combined-presentation-of-attributes],
can be used to strengthen the assurance of that association while avoiding
unnecessary disclosure.

#### 2.5.4 Use case C: Rate-limited participation

This use case builds on use case A or B, but adds the guarantee that a User can
register only a limited number of distinct pseudonyms (called the 'rate') for a
given scope, as defined by the Relying Party. This supports scenarios such as
limiting spam or bot registrations or enforcing "one participation per person"
patterns, while still avoiding disclosure of the User's identity.

#### 2.5.5 Use case D: Linkable pseudonymous authentication across multiple actors

In this use case, a single pseudonym is used to authenticate towards multiple
actors, so that these actors can recognise the User and (where intended)
exchange information based on that pseudonym for a specific purpose. A typical
example is an e-commerce flow where a User uses one pseudonym with a merchant
and later authenticates with the same pseudonym to a carrier for delivery or
pick-up. Because this introduces cross-party linkability, it should be supported
only where necessary for the use case and with appropriate safeguards and User
choice.

#### 2.5.6 Use case support

Commission Implementing Regulation (EU) 2024/2979 sets the baseline obligations
for pseudonyms: Wallet Units must support pseudonym generation and, upon request of a
wallet-relying party, generate a pseudonym that is specific and unique to that
wallet-relying party, and provide it to the wallet-relying party either
stand-alone or in combination with a requested PID or attestation (CIR
2024/2979, Article 14 (2)).

With regard to the use cases identified above, this implies the following:

- Wallet Units support use case A (Pseudonymous authentication), since this is
required in the CIR. The technical specifications in [W3C WebAuthn] can be used to implement this use case, although other mechanisms can be used as well.
- Use case B (Attribute registration with subsequent authentication using a
pseudonym) is partially supported, insofar as Article 14(2) enables Wallet Units
to provide the pseudonym in combination with a PID or attestation, but
additional technical specification work is needed to specify a common
cryptographic binding mechanism to bind the PID or attestation to the pseudonym.
- Use case C (Rate-limited participation) requires the specification of an
additional mechanism to ensure interoperability. [Section E in Topic 11](../annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a238-topic-11-pseudonyms)
contains a set of expectations for such a mechanism.
- Use case D (Linkable pseudonymous authentication) can be supported by issuing
pseudonyms in the form of an attestation, see [Section 4.7.3][473-attested-pseudonyms].
However, no common specification of pseudonym attestations is available currently.

Future ARF iterations will therefore develop and/or reference additional
technical specifications to support the use cases B - D in a
harmonised way (including conformance expectations), building on the baseline
established by CIR 2024/2979.

### 2.6 The role of Use Cases

#### 2.6.1 Overview

The development of the Architecture and Reference Framework (ARF) is strategically
driven by real-world use cases, ensuring that the User experience, value
proposition, and requirements of the EUDI Wallet ecosystem are
effectively addressed. To achieve this, the European Digital Identity
Cooperation Group initially created service blueprints for each use case, which
detail service touch points, components, and processes.

These blueprints serve a dual purpose: they play a crucial role in service
design, enhancing both User experience and operational efficiency, while also
identifying areas for improvement. As a foundational element, these blueprints
shape the development of common specifications, providing comprehensive yet
flexible solutions that can accommodate alternative approaches and optional
steps.

User journeys may vary based on the specific implementation approach,
influencing aspects such as data retrieval and User approval processes. The
Annexes contain detailed descriptions of these blueprints, ensuring transparency
and adaptability.

The European Digital Identity Cooperation Group has outlined service blueprints
for the following main use cases:

- Identification and authentication to access online services, see [Section 2.6.2][262-identification-and-authentication-to-access-online-services-using-pid],
- Qualified Electronic Signature, see [Section 2.4][24-qualified-electronic-signatures],
- Mobile Driving Licence, see [Section 2.6.3][263-mobile-driving-licence],
- Strong User Authentication for electronic payments, see [Section 2.6.4][264-strong-user-authentication-for-electronic-payments]
- A natural person representing another natural person, see [Section 2.6.5][265-natural-person-representing-another-natural-person].
- Additional use cases that will be introduced in the future, see [Section 2.6.6][266-examples-of-other-use-cases].

These blueprints, along with all relevant information on use cases
implementation, will be compiled in a standardised format within a dedicated
document titled the "Use Cases Manual", and distributed together with this document.

#### 2.6.2 Identification and authentication to access online services using PID

One of the main use cases of the EUDI Wallet ecosystem is secure User
identification and authentication. In this context, 'User identification' means that a User presents data from their PID, which is
issued and managed at Level of Assurance High, to various online services,
both public and private. 'Authentication' means that these services verify that the presented attributes originated from a trusted PID Provider and have not been changed. This capability is crucial, as it allows Relying
Parties to confidently verify the identity of Users they interact with.

In this use case, a User utilises their Wallet Unit to present specific
attributes from a PID to a Relying Party in order to access online services.
Before doing so, the Wallet Unit first authenticates the User. The User is
particularly mindful of the privacy and security implications of presenting data
when accessing online services. Their primary objective is to securely and
reliably access online services that require PID attributes, while maintaining
full control over how their personal data is presented.

#### 2.6.3 Mobile Driving Licence

A significant use case for the Wallet Unit involves allowing Users to request,
store, and present a mobile Driving Licence (mDL) as an attestation in their
Wallet Unit, allowing them mainly to prove their driving privileges. In this use
case, the User employs a Wallet Unit to present an mDL to a Relying Party, for
instance a police officer.

Like any other attestation type, an mDL can be presented in proximity as well as
online, over the internet.

For more details and high-level requirements for this use case, please see
[Topic 4][topic-4].

#### 2.6.4 Strong User Authentication for electronic payments

Users would like to be able to authenticate themselves and their electronic
payments securely and conveniently using their Wallet Units, so that
they can enjoy a seamless and protected shopping and payment experience.

A Wallet Unit facilitates complying with strong customer authentication (SCA)
requirements for electronic payments, ensuring a high level of security and
compliance with [Article 97 of the PSD2](https://eur-lex.europa.eu/eli/dir/2015/2366/oj#d1e5540-35-1)
(and with the future PSD3/PSR).

Note: Whereas the PSD2 speaks about 'strong *customer* authentication', the
[European Digital Identity Regulation], Article 5f(2), uses the term 'strong
*user* authentication'. The ARF assumes that this means that Wallet Units must
comply with the requirements for SCA in the PSD2.

[Commission Delegated Regulation (EU) 2018/389](https://eur-lex.europa.eu/eli/reg_del/2018/389/oj)
lays down the requirements for strong customer authentication (SCA), which needs
to be complied with when accessing a payment account online and for initiating
electronic payments, or carrying out any action through a remote channel which
may imply a risk of payment fraud or other abuses. The use of a Wallet Unit for
SCA will be in full compliance with those requirements. This implies that the
Wallet Unit must enable the User to authenticate payment information, such as
amount and payee, originating from a Relying Party, and to return the
authenticated data to the Relying Party.

In general, the life cycle of a Wallet Unit in the role of an authenticator for
Strong User Authentication comprises the following phases:

- **Registration**: The User registers the Wallet Unit as an authenticator for a
service. This process includes:
    - User identification and authentication, for example by presenting a PID,
    - User consent for the registration,
    - Linking a Wallet Unit with the service and a User account in that service.
      This happens by issuing a dedicated SUA attestation to the Wallet Unit,
      containing User attributes relevant for the service. The issuance process
      for this SUA attestation complies with all requirements for attestation
      issuance in this ARF. The SUA attestation is device-bound, which means it
      contains a public key and the associated private key is stored in a
      WSCA/WSCD or in a keystore.
- **Strong User Authentication**: A Relying Party sends a presentation request
to the Wallet Unit to request relevant attributes from the SUA attestation. This
presentation request includes transactional data. In the context of electronic
payments, the transactional data will include at least the payment amount and
the payee. After presenting the data to the User and obtaining the User's
approval, the Wallet Unit signs the transactional data. It does so by including
(a representation of) the transactional data in the signature creation process
used for device binding. Note that the syntax and semantics of the transactional
data, as well as rules for how the data must be presented to the User and how
the data will be prepared for inclusion in the device binding signature, will be
defined in the Attestation Rulebook (or a Technical Specification) for the SUA attestation.
- **De-registration**: Unlinking the Wallet Unit from the service and/or the
User's account in that service. This will involve deletion or revocation of the
SUA attestation.

For more information, please refer to [Sections 5.7.5][575-transactional-data-using-isoiec-18013-5-and-openid4vp]
and [6.6.3.8][6638-relying-party-instance-verifies-device-binding]. For
high-level requirements, see [Topic 20][topic-20].

#### 2.6.5 Natural person representing another natural person

The [European Digital Identity Regulation] considers the representation of one
natural person by another.

One common use case is the legal representation of minors or individuals with
diminished legal capacity. For example, parents or legal guardians must be
empowered to make decisions and act on behalf of their children and represent
them when accessing educational platforms, healthcare services, government
benefits, or other services. The EUDI Wallet ecosystem must therefore
accommodate such representation in a secure, verifiable manner.

Another significant use case is the management of affairs for elderly or
incapacitated individuals. In these cases, individuals can be assigned as legal
representatives to manage healthcare, financial, and personal matters. For
instance, a caregiver or relative could hold a delegation to access health
records or submit applications for social care services on behalf of the person
they represent.

Power of attorney is another use case of a natural person (the agent) acting on
behalf of another natural person (the principal).

It should therefore be possible to issue a dedicated representation attestation
for a natural person to a representative, in accordance with applicable national
and European legislation. For certain use cases (e.g., parent-child
relationships), the Attestation Provider of such attestations will be able to
retrieve the relevant information from Authentic Sources at the national level.
In other cases (e.g., power of attorney), the represented natural person may be
required to explicitly authorize the representative.

Representation attestations for a natural person issued to a representative have
a distinct attestation type. The Attestation Rulebook describing this
attestation type specifies the nature of the representation and clearly defines
the operations that the representative is authorized to perform, thereby
restricting the scope of their authority.

Furthermore, representation attestations (like any other attestations) are
either short-lived or revocable. In the case of revocable representation
attestations, all entities that, according to applicable law, are entitled to
revoke them have the capability to request the Attestation Provider to do so. It
is emphasized that the high-level requirements concerning attestation
revocation, as defined in [Topic 7][topic-7],
also apply to this attestation type.

A User holding a representation attestation is able to represent another natural
person when interacting with a Relying Party. The Relying Party is always aware
that it is interacting with a legal representative or agent. This is ensured by
the fact that the corresponding Wallet Unit presents an attestation having a
distinct type, specifically for representation attestations.

For more details and high-level requirements for this use case, please see
[Topic 29][topic-29].

#### 2.6.6 Examples of other use cases

##### 2.6.6.1 Health data

Easy access to health data is crucial in both national and cross-border
contexts. A Wallet Unit may enable access to patient summary, ePrescriptions,
etc.

##### 2.6.6.2 Educational attestations and professional qualifications

Providing credentials for qualification recognition procedures can be costly and
time-consuming for Users, Relying Parties (such as companies and employers), and
Attestation Providers (such as education and training providers or academic
institutions). A Wallet Unit may be a repository for educational credentials and
a means for presenting them by the User to relevant Relying Parties.

##### 2.6.6.3 Digital Travel Credential

Digital Travel Credential (DTC) Providers may issue DTCs to Wallet Units in a
supported format, to enable Relying Parties to identify Users, thus facilitating
a smooth travel experience and User journey. Relying Parties for a DTC may
include governments, transportation providers, hospitality agents, or any other
actors operating in a regulated environment which requires the use of a DTC.

##### 2.6.6.4 Central Bank Digital Currencies

In the future, a Wallet Unit could also be used for payments with Central Bank
Digital Currencies.

##### 2.6.6.5 Social Security

Documents related to social security are important for many EU citizens to prove
their rights and obligations under social security legislation in the EU.
Examples include:

- **Portable Document ("PDA1")** This is a statement of applicable legislation
which is useful to prove that a person pays social contributions in another EU
country, for example if they are a posted worker or work in several countries at
the same time.
- **Electronic Health Insurance Card ("EHIC")** This is a free card that provides
every citizen with access to medically necessary government-provided healthcare
during a temporary stay in one of the 27 EU countries, Iceland, Liechtenstein,
Norway, and Switzerland, under the same conditions and at the same cost (free in
some countries) as persons insured in that country. This includes, for example,
services related to chronic or existing illnesses, as well as in connection with
pregnancy and childbirth.

