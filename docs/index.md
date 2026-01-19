# European Digital Identity Wallet

![Digital Identity for all Europeans - A personal digital wallet for EU citizens and residents](./media/top-banner-arf.png)

The [eIDAS Regulation](https://digital-strategy.ec.europa.eu/en/policies/eidas-regulation)
allows EU Member States to notify and recognise each other's national electronic
ID systems. Since 2018, any scheme that has been notified must be recognised
across the EU. But there's no obligation for every country to create its own
electronic ID or to make it work with others. This has led to big differences
from one Member State to another.  

The new [European Digital Identity Regulation](https://eur-lex.europa.eu/eli/reg/2014/910/2024-10-18)
is designed to fix these gaps. It makes the rules more effective and also opens
them up to the private sector. Every Member State will now offer people and
businesses a **European Digital Identity Wallet**. These wallets will let users connect
different parts of their national digital identity in one secure app. They can
be provided directly by governments or by private companies, as long as they are
officially recognised.  

The EU Digital Identity Wallet will be:

* **made available to anyone who wants to use it**: Any EU citizen, resident,
  and business in the EU who would like to make use of the EU Digital Identity
  will be able to do so.
* **used widely**: EU Digital Identity Wallets will be used as a way to
  identify users when providing them with access to public and private digital
  services across the EU.
* **controlled by users**: The EU Digital Identity Wallets will enable people
  to choose and keep track of their identity, data and certificates which they
  share with third parties. Anything which is not necessary to share will not
  be shared.

Consumers should also be able to access services online without having to use
private platforms or unnecessarily sharing personal data. They will have full
control of the data they share.

## Architecture and Reference Framework

On 3 June 2021, the European Commission adopted a Recommendation ([COMMISSION
RECOMMENDATION (EU) 2021/946 of 3 June 2021 on a
[Common Union Toolbox](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-toolbox)
for a coordinated approach towards a [European Digital Identity Framework](https://eur-lex.europa.eu/eli/reco/2021/946),
 [OJ L 210/51, 14.6.2021](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ%3AL%3A2021%3A210%3AFULL))
calling on Member States to work closely together with the Commission towards
the development of a Toolbox including a technical Architecture and Reference
Framework (hereinafter the ARF), a set of common standards and technical
specifications and a set of common guidelines and best practices.

The Recommendation specifies that these outcomes will serve as a basis for the
implementation of the [European Digital Identity Regulation](https://eur-lex.europa.eu/eli/reg/2014/910/2024-10-18),
without the process of developing the Toolbox interfering with, or prejudging
the legislative process.

The Recommendation establishes a structured framework for cooperation between
Member States, the Commission, and, where relevant, private sector operators to
develop the Toolbox. The European Digital Identity Cooperation Group (EDICG),
formerly known as the eIDAS Expert Group, is responsible for:

* exchange best practices and cooperate with the Commission on emerging
policy initiatives in the field of digital identity wallets, electronic
identification means and trust services;
* advising the Commission in the preparation of draft implementing and delegated
acts;
* supporting Supervisory Bodies in the implementation of the [European Digital
Identity Regulation];
* organising peer reviews of electronic identification schemes;
* engaging with the Commission and other relevant stakeholders to develop a
[Common Union Toolbox](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-toolbox);

The European Digital Identity Cooperation Group's page can be found
[at the official page](https://digital-strategy.ec.europa.eu/en/policies/european-digital-identity-cooperation-group).

The European Digital Identity Cooperation Group has since further developed the
concepts and specifications for the European Digital Identity Framework. The
current ARF version is based on the [legal text adopted](https://eur-lex.europa.eu/eli/reg/2014/910/2024-10-18)
by the co-legislators, including the adopted Commission Implementing Regulations:

- [CIR 2024/2977](https://data.europa.eu/eli/reg_impl/2024/2977/oj)
regarding PID and EAA,
- [CIR 2024/2979](https://data.europa.eu/eli/reg_impl/2024/2979/oj)
regarding integrity and core functionalities,
- [CIR 2024/2980](https://data.europa.eu/eli/reg_impl/2024/2980/oj)
regarding ecosystem notifications,
- [CIR 2024/2981](https://data.europa.eu/eli/reg_impl/2024/2981/oj)
regarding certification of Wallet Solutions,
- [CIR 2024/2982](https://data.europa.eu/eli/reg_impl/2024/2982/oj)
regarding protocols and interfaces,
- [CIR 2025/846](https://data.europa.eu/eli/reg_impl/2025/846/oj)
regarding cross border identity matching,
- [CIR 2025/847](https://data.europa.eu/eli/reg_impl/2025/847/oj)
regarding security breaches of European Digital Identity Wallets,
- [CIR 2025/848](https://data.europa.eu/eli/reg_impl/2025/848/oj)
regarding registration of Wallet Relying Parties,
- [CIR 2025/849](https://data.europa.eu/eli/reg_impl/2025/849/oj)
regarding the list of certified European Digital Identity Wallets,
- [CIR 2025/1566](http://data.europa.eu/eli/reg_impl/2025/1566/oj)
regarding the verification the identity and attributes of a QC or QEAA holder,
- [CIR 2025/1567](http://data.europa.eu/eli/reg_impl/2025/1567/oj)
regarding management of remote QSCDs as qualified trust services,
- [CIR 2025/1568](http://data.europa.eu/eli/reg_impl/2025/1568/oj)
regarding peer reviews of eID schemes,
- [CIR 2025/1569](http://data.europa.eu/eli/reg_impl/2025/1569/oj)
regarding QEAAs and EAAs provided by or on behalf of a public sector body
responsible for an authentic source,
- [CIR 2025/1570](http://data.europa.eu/eli/reg_impl/2025/1570/oj)
regarding notification of information on certified QSCDs,
- [CIR 2025/1571](http://data.europa.eu/eli/reg_impl/2025/1571/oj)
regarding the formats and procedures for annual reports by supervisory bodies,
- [CIR 2025/1572](http://data.europa.eu/eli/reg_impl/2025/1572/oj)
regarding the format and procedures for notification of intention and
verification with regard to the initiation of qualified trust services,
- [CIR 2025/1929](http://data.europa.eu/eli/reg_impl/2025/1929/oj) regarding the binding of date and time to data and establishing the accuracy of the time sources for the provision of qualified electronic time stamps,
- [CIR 2025/1942](http://data.europa.eu/eli/reg_impl/2025/1942/oj) regarding qualified validation services for qualified electronic signatures and qualified validation services for qualified electronic seals,
- [CIR 2025/1943](http://data.europa.eu/eli/reg_impl/2025/1943/oj) regarding reference standards for qualified certificates for electronic signatures and qualified certificates for electronic seals,
- [CIR 2025/1944](http://data.europa.eu/eli/reg_impl/2025/1944/oj) regarding reference standards for processes for sending and receiving data in qualified electronic registered delivery services and as regarding interoperability of those services,
- [CIR 2025/1945](http://data.europa.eu/eli/reg_impl/2025/1945/oj) regarding the validation of qualified electronic signatures and of qualified electronic seals and the validation of advanced electronic signatures based on qualified certificates and of advanced electronic seals based on qualified certificates,
- [CIR 2025/1946](http://data.europa.eu/eli/reg_impl/2025/1946/oj) regarding qualified preservation services for qualified electronic signatures and for qualified electronic seals,
- [CIR 2025/2160](http://data.europa.eu/eli/reg_impl/2025/2160/oj) regarding reference standards, specifications and procedures for the management of risks to the provision of non-qualified trust services,
- [CIR 2025/2162](http://data.europa.eu/eli/reg_impl/2025/2162/oj) regarding the accreditation of conformity assessment bodies performing the assessment of qualified trust service providers and the qualified trust services they provide, the conformity assessment report and the conformity assessment scheme, 
- [CID 2025/2164](http://data.europa.eu/eli/dec_impl/2025/2164/oj) regarding the version of the standard on which the common template for the trusted lists is based.


## Contents of the repository

This repository contains:

* "[Architecture and Reference Framework](./architecture-and-reference-framework-main.md)"
the main narrative text that describes the European Digital Identity Wallet and
its ecosystem.
* "[Annexes](./annexes/README.md)" the list of annexes that provide additional
information to the main narrative text. In particular, the annexes provide normative
high-level requirements.
* "[Technical Specifications](./technical-specifications/README.md)" the list
of specifications that will be developed to support the implementation of the
European Digital Identity Wallet.
* "[Discussion Topics](./discussion-topics/README.md)" the list of discussion
topics that are open for public consultation. The topics are organised into
three iterations, each focusing on a specific set of subjects to be included in
a major document release.

The latest **authoritative version** is tagged as [release/tag in this repository](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework/releases).

## Contributing

Please read [CONTRIBUTING.md](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/CONTRIBUTING.md)
for details on our code of conduct, and the process for submitting pull requests
to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available,
see the [tags on this repository](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework/tags).

## Authors

See the list of [contributors](https://github.com/eu-digital-identity-wallet/architecture-and-reference-framework/graphs/contributors)
who participated in this project.

## License

See the [LICENCE](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/LICENCE)
file for details.

## European Digital Identity

* [EUDI Wallet website](https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/694487738/EU+Digital+Identity+Wallet+Home)
* [Contact the European Commission](https://commission.europa.eu/about-european-commission/contact_en)
* [Follow the European Commission on social media](https://european-union.europa.eu/contact-eu/social-media-channels_en#/search?page=0&institutions=european_commission)
* [Resources for partners](https://commission.europa.eu/resources-partners_en)
