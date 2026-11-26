Version 0.95, updated 25 November 2026

[Link to GitHub discussion](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/discussions/660)

# Topic AA - Support of Electronic Payments Customer Authentication (SCA) with the Wallet (Refinement Round)

## 1 Introduction

### 1.1 Discussion Paper Topic Description

This document is the 2026 refinement round (RR) version of Discussion Paper for the European Digital Identity Cooperation Group regarding Topic AA: Support of Electronic Payments Customer Authentication (SCA) with the Wallet.

The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

_This topic concerns the use of the EUDI Wallet for payment-related authentication scenarios, including support for transaction authorization and related extensions._

while the reason why Topic AA is addressed in the refinement round is​ as follows:

_Although payment use cases are not mandatory for initial EUDI Wallet deployment, there is a strong market demand and clear relevance for future use. Supporting SCA is likely to require additional wallet capabilities and careful definitions of transaction types and user interaction flows. Refinement is needed to establish a clear and reusable framework that can support payments as well as other transaction authorization scenarios such as QeS._

### 1.2 Key Words

This document uses the capitalised key words "SHALL", "SHOULD" and "MAY" as specified in RFC 2119, i.e., to indicate requirements, recommendations and options specified in this document. In addition, "must" (non-capitalised) is used to indicate an external constraint, for instance a self-evident necessity or a requirement that is mandated by an external document. The word "can" indicates a capability, whereas other words, such as "will", "is" or "are" are intended as statements of fact.

### 1.3 Document Structure

The document is structured as follows:

- Chapter 2 provides the background of the current discussion related to support of electronic payments customer authentication (SCA) with the Wallet.
- Chapter 3 presents the legal requirements for functionality related to electronic payments authentication (SCA) with the Wallet - this part is the same as in [Topic W Discussion Paper](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/w-transactional-data-for-payments-and-other-use-cases.md), amended with the latest PSR proposal ([PSR Provisional Agreement]) requirements.
- Chapter 4 summarises the current concept related to electronic payments authentication (SCA) with the Wallet and lists current HLRs. The ARF version referenced in this discussion paper is 3.0.0. 
- Chapter 5 provides discussion items for the refinement round discussion
- Chapter 6 will, as a result of the refinement round discussion, provide a list of suggested changes and/or new High-Level Requirements proposals.
- Chapter 7 will, after completion of the refinement round, present additions and changes that will be made to the ARF main document as a result of the discussions. It will also provide an assessment of necessary changes related to the Technical Specifications.

### 1.4 Acronyms

The table below presents the key acronyms used in this document.

| **Acronym** |                **Meaning**                           | 
|-------------|------------------------------------------------------|
|     SUA     | Strong User Authentication, as defined in [European Digital Identity Regulation]        | 
|     SCA     | Strong Customer Authentication, as defined in [PSD2]        | 
|     PSP     | Payment Service Provider, as defined in [PSD2]        | 
|     PISP    | Payment Initiation Service Provider, as defined in [PSD2]     | 
|     ASPSP   | Account Servicing Payment Service Provider, as defined in [PSD2]          | 
|     AISP    | Account Information Service Provider, as defined in [PSD2]         | 
|     PSD     | Payment Services Directive         | 
|     PSR     | Payment Services Regulation         | 
|     RTS     | Regulatory Technical Standards      |
|     MIT     | Merchant-Initiated Transaction, as defined in [PSR Provisional Agreement]  |
|     EBA     | European Banking Authority     |


## 2 Background

This topic (AA Refinement Round) is continuation of [Topic W (Transactional data for payments and other use cases)](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/w-transactional-data-for-payments-and-other-use-cases.md) and [Topic AA Support of Electronic Payments Customer Authentication (SCA) with the Wallet](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/aa-support-of-electronic-payments-SCA-with-wallet.md).

The legal requirements applicable to Topic AA were collected and discussed in Topic W related process.

As an outcome of Topic W and Topic AA the set of new or modified HLRs was introduced to [Topic 20] of the ARF.

The purpose of Topic AA Refinement Round is to discuss in further detail, various aspects necessary to enable Wallet Providers to build harmonised and interoperable solutions for Strong Customer Authentication in the context of PSD2 and the future PSR, based on the experience from the Large Scale Pilots, especially from the current ones carried out by the WeBuild and Aptitude consortiums.

## 3 Legal requirements 

### 3.1 European Digital Identity Regulation

The [European Digital Identity Regulation] (Article 5f(2)) requires Wallets to support and provide a Strong User Authentication (SUA) function that can be used to authenticate the User accessing or using an online service that requires identification and strong authentication (by EU or national law or by contractual obligation).
The online services might be of any type, provided by public or private Service Providers in particular in the areas of transport, energy, banking, financial services, social security, health, drinking water, postal services, digital infrastructure, education or telecommunications (but not limited to these). Examples of use cases include logging to an online service, giving a consent to an action which poses a higher risk of fraud (e.g. password change, change of a payment transaction limits) or authentication of a payment.

Therefore Wallet Solutions shall provide functionality that enables Relying Parties (which are various service providers) to use Wallet Units as a means of SUA, including for the payment authentication use case.

_Note: See also [Digital Identity Wallet Frequently Asked Questions](https://ec.europa.eu/digital-building-blocks/sites/spaces/EUDIGITALIDENTITYWALLET/pages/713526976/FAQ):_ 

_Is there a requirement for all wallets to offer SCA (strong customer authentication) to facilitate online payments by the end of 2027?_

_Yes, indeed. The objective of the European Digital Identity Regulation is to offer all EU citizens a secure and trustworthy means of identification, authentication and to share digital documents. The Regulation also requires Member States to offer European Digital Identity Wallets to all EU citizens by end 2026 and obliges private service providers to accept the wallet for SCA (strong customer authentication) by end 2027. Consequently, all wallets must be able to offer this possibility._



Below are the actual excerpts from the Regulation, including the recitals and the articles that establish these requirements.


**Recital (62)**

_Secure electronic identification and the provision of attestation of attributes should offer additional flexibility and solutions for the financial services sector to allow the identification of customers and the exchange of specific attributes necessary to comply with, for example, customer due diligence requirements under a future Regulation establishing the Anti Money Laundering Authority, with suitability requirements stemming from investor protection law, or to support the fulfilment of strong customer authentication requirements for online identification for the purposes of account login and of initiation of transactions in the field of payment services._

**Article 3 (Definitions)**

(51) _"strong user authentication" means an authentication based on the use of at least two authentication factors from different categories of either knowledge, something only the user knows, possession, something only the user possesses or inherence, something the user is, that are independent, in that the breach of one does not compromise the reliability of the others, and is designed in such a way as to protect the confidentiality of the authentication data;_

**Article 5f(2)**

_Where private relying parties that provide services, with the exception of microenterprises and small enterprises as defined in Article 2 of the Annex to Commission Recommendation 2003/361/EC, are required by Union or national law to use strong user authentication for online identification or where strong user authentication for online identification is required by contractual obligation, including in the areas of transport, energy, banking, financial services, social security, health, drinking water, postal services, digital infrastructure, education or telecommunications, those private relying parties shall, no later than 36 months from the date of entry into force of the implementing acts referred to in Article 5a(23) and Article 5c(6) and only upon the voluntary request of the user, also accept European Digital Identity Wallets that are provided in accordance with this Regulation._

### 3.2 PSD2

The [PSD2] introduces and defines requirements for the application of Strong Customer Authentication (SCA). This is an example of a law that mandates the use of SUA, and therefore Relying Parties which are Payment Service Providers (usually banks), and some other entities in some cases (as defined by [PSD2]), fall under the obligation set out in Article 5f(2) of [European Digital Identity Regulation]. 

Therefore Wallet Solutions shall provide functionality that enables Relying Parties to use Wallet Units as a means of SCA.

To complement [PSD2], a dedicated so called "regulatory technical standard" (commonly referred to as "RTS") has been adopted [RTS SCA]. It defines technical requirements for the implementation and use of SCA.

The main requirements related to SCA can be summarised as follows:
- SCA requires the use of (at least) two elements from three categories (knowledge, possession, inherence);  there is no requirement that they must be from different categories,
- means of SCA and the procedure shall be agreed between the payer and the PSP,
- the use case where the SCA shall be applied are: access to a payment account online, initiation of an electronic payment transaction, carrying out any action through a remote channel which may imply a risk of payment fraud or other abuses,
- for electronic remote payment transactions, SCA shall apply "dynamic linking" - a procedure that links the transaction to a specific transaction data (amount, payee), with the use of an authentication code specific to this transaction, and the use of cryptography,
- there are only generic requirements related to display message to the User - to make the User aware of the transaction being consented (amount and payee).
- SCA can be realised prior or after the execution of the payment transaction,
- SCA can be realised via PSP, payee or PISP.

Below are the actual excerpts from the [PSD2] and [RTS SCA], including the recitals and the articles that establish these requirements.

**PSD2 Article 4**

_(30) "strong customer authentication" means an authentication based on the use of two or more elements categorised as knowledge (something only the user knows), possession (something only the user possesses) and inherence (something the user is) that are independent, in that the breach of one does not compromise the reliability of the others, and is designed in such a way as to protect the confidentiality of the authentication data;_

**PSD2 Article 64(1)**  
(Consent and withdrawal of consent) 

_Member States shall ensure that a payment transaction is considered to be authorised only if the payer has given consent to execute the payment transaction. A payment transaction may be authorised by the payer prior to or, if agreed between the payer and the payment service provider, after the execution of the payment transaction._ 

**PSD2 Article 64(2)**  
(Consent and withdrawal of consent) 

_Consent to execute a payment transaction or a series of payment transactions shall be given in the form agreed between the payer and the payment service provider. Consent to execute a payment transaction may also be given via the payee or the payment initiation service provider._ 

**PSD2 Article 64(4)** 
(Consent and withdrawal of consent) 

_The procedure for giving consent shall be agreed between the payer and the relevant payment service provider(s)._ 

**PSD2 Article 72(1)**  
(Evidence on authentication and execution of payment transactions) 

_Member States shall require that, where a payment service user denies having authorised an  executed payment transaction or claims that the payment transaction was not correctly executed, it is for the payment service provider to prove that the payment transaction was authenticated, accurately recorded, entered in the accounts and not affected by a technical breakdown or some other deficiency of the service provided by the payment service provider._ 

**PSD2 Article 72(2)**  
(Evidence on authentication and execution of payment transactions) 

_If the payment  transaction  is  initiated through a  payment  initiation  service provider, the  burden  shall  be  on  the  payment  initiation service provider to prove that within its sphere of competence, the payment transaction was authenticated,  accurately recorded and  not  affected  by  a  technical breakdown or  other  deficiency  linked  to  the  payment  service  of which it is in charge._

**PSD2 Article 97(1)** 
(Authentication) 

_Member States shall ensure that a payment service provider applies strong customer authentication where the payer: 
(a) accesses its payment account online; 
(b) initiates an electronic payment transaction; 
(c) carries out any action through a remote channel which may imply a risk of payment fraud or other abuses._ 

**PSD2 Article 97(2)**  
(Dynamic linking) 

_Member States shall  ensure that, for electronic remote  payment  transactions, payment service providers apply strong customer authentication  that  includes elements which  dynamically link the transaction to a specific amount  and  a specific payee._ 

**RTS Recital (4)**
(Dynamic linking) 

_Dynamic linking is possible through the generation of authentication codes which is subject to a set of strict security requirements. To remain technologically neutral a specific technology for the implementation of authenti­cation codes should not be required. Therefore authentication codes should be based on solutions such as generating and validating one-time passwords, digital signatures or other cryptographically underpinned validity assertions using keys or cryptographic material stored in the authentication elements, as long as the security requirements are fulfilled._

**RTS Article 2(1)** 

_Payment service providers shall have transaction monitoring mechanisms in place that enable them to detect unauthorised or fraudulent payment transactions for the purpose of the implementation of the security measures referred to in points (a) and (b) of Article 1._
_Those mechanisms shall be based on the analysis of payment transactions taking into account elements which are typical of the payment service user in the circumstances of a normal use of the personalised security credentials._

**RTS Article 2(2)**

_Payment service providers shall ensure that the transaction monitoring mechanisms take into account, at a minimum, each of the following risk-based factors:_

_(a) lists of compromised or stolen authentication elements;_

_(b) the amount of each payment transaction;_

_(c) known fraud scenarios in the provision of payment services;_

_(d) signs of malware infection in any sessions of the authentication procedure;_

_(e) in case the access device or the software is provided by the payment service provider, a log of the use of the access device or the software provided to the payment service user and the abnormal use of the access device or the software._

**RTS Article 4(1)** 
(Authentication code)  

_Where payment service providers apply strong customer authentication in accordance with Article 97(1) of Directive (EU) 2015/2366, the authentication shall be based on two or more elements which are categorised as knowledge, possession and inherence and shall result in the generation of an authentication code. [...]_  

**RTS Article 4(2)** 
(Authentication code)  

_For the purpose of paragraph 1, payment service providers shall adopt security measures ensuring that each of the following requirements is met:  
(a) no information on any of the elements referred to in paragraph 1 can be derived from the disclosure of the authentication code;  
(b) it is not possible to generate a new authentication code based on the knowledge of any other authentication code previously generated;  
(c) the authentication code cannot be forged._ 

**RTS Article 4(3)** 
(Authentication code)  

_Payment service providers shall ensure that the authentication by means of generating an authentication code includes each of the following measures:  
(a) where the authentication for remote access, remote electronic payments and any other actions through a remote channel which may imply a risk of payment fraud or other abuses has failed to generate an authentication code for the purposes of paragraph 1, it shall not be possible to identify which of the elements referred to in that paragraph was incorrect; [...]_ 
 
**RTS Article 5(1)** 
(Dynamic linking)  

_Where payment service providers apply strong customer authentication in accordance with Article 97(2) of Directive (EU) 2015/2366, in addition to the requirements of Article 4 of this Regulation, they shall also adopt security measures that meet each of the following requirements: 
(a) the payer is made aware of the amount of the payment transaction and of the payee; 
(b) the authentication code generated is specific to the amount of the payment transaction and the payee agreed to by the payer when initiating the transaction; 
(c) the authentication code accepted by the payment service provider corresponds to the original specific amount of the payment transaction and to the identity of the payee agreed to by the payer;_

### 3.3 PSR

The Payment Services Regulation (PSR) aims to replace [PSD2] in the scope related to SCA. The first PSR text proposal ([PSR Proposal]) was published in 2023 and has since been a subject to further work within the legislative process of the European Union. As a result, a new proposal was presented in May 2026 ([PSR Provisional Agreement]). 
In general, PSR keeps the same concept of SCA as [PSD2] and [RTS SCA], but introduces some minor changes to the application of SCA. The main aspects and changes to SCA can be summarised as follows:

- the definition of SCA provides an exception whereby the authentication elements can be from the same category if that category is "inherence"; EBA is tasked with developing guidelines on this,
- adding new cases explicitly requiring application of SCA (tokenised payment instrument creation, change of a spending limit, password or contact information, mobile application activation, proximity payments that require an internet connection),
- introduction of the term "mobile application", which refers to a means of payment initiation or of giving consent by a User, 
- provision of requirements related to the activation of the mobile application (delay in activation, use of a different channel, SCA),
- requirement to display the payee's commercial trade name and legal name in the transaction information displayed to the User (in addition to the amount),
- adding accessibility requirements,
- stating that carrying out an SCA process is not in itself a sufficient evidence of the authorisation of a transaction,
- adding liability of technical service providers (which may include SCA providers/operators) for the payment transaction, proportionate to their failure,
- requiring an outsourcing agreement with technical service providers providing SCA,
- forbidding ASPSPs (banks) from creating obstacles for PISPs and AISPs with regard to the application of SCA (such obstacles could be e.g. requiring more SCA steps, or limiting SCA methods), 
- introduction of a concept of the Merchant-Initiated Transactions (MITs), where the payment initiation and SCA can be applied together at check-out on the merchant side,
- adding possible liability shifts to: PSPs of payees (if they fail to "develop or amend" systems necessary for SCA), "another PSP" or an "intermediary" (if they participate in the process),
- extending/detailing transaction monitoring requirements - allowing i.a. the collection of "environmental and behavioural characteristics", session data (e.g. device internet protocol address-range), and User's device data (e.g. an identifier),
- transaction monitoring requirements imposed on both sides: the payer's and the payee's PSPs,
- option for AISPs to apply their own SCA (which entails a shift of liability),
- acknowledges Wallet Units as a means of SCA and obligation for PSPs to accept them.

Below are the actual excerpts from the [PSR Provisional Agreement], including the recitals and the articles that establish these requirements.

_Note: The following excerpts come from the latest proposal ([PSR Provisional Agreement]), which is subject to further legislative work and therefore may change._

**Recital (22)** 

_Despite the fact that Near-Field Communication (NFC) enables the initiation of a payment transaction, considering it as a fully-fledged "payment instrument" would pose some challenges, for example for the application of strong customer authentication for contactless payments at the point of sale and of the payment service provider’s liability regime. NFC should therefore rather be considered as a functionality of a payment instrument and not as a payment instrument as such._

**Recital (73c)**

_To ensure the effectiveness of the spending limits, it is important that any increase in the limits that is requested by the payment service user through a remote channel take effect only
after a delay period. If such a delay period is not in place a fraudster could convince a victim to adjust the victims’ spending limits and then immediately be able to defraud a victim of a much higher value. A delay period would give the payment service user time to realise that they have been contacted and manipulated by a fraudster. The delay period should by default be set at 4 hours by the payment service provider. The payment service user should be able to adjust the delay period upwards or downwards or opt out of the application of such a delay period with such actions being subject to the delay period in place. The application of strong customer authentication should be required when the payment service user requests an increase in spending limit through a remote channel._

**Recital (73e)**

_As payment services become increasingly digital, many payment service providers are offering payment service users the possibility of using mobile applications to initiate payment services. While these mobile applications are useful and beneficial to payment service users, they also pose a fraud risk. To prevent this risk, the process of activating a mobile application on a device should require the use of different communication channels, where there is an existing customer relationship between the payment service user and the payment service provider, and the application of strong customer authentication. When establishing the customer relationship, the payment service provider and the payment service user should agree on a delay for the activation of a subsequent mobile application to take effect in order to allow the payment service user to intervene if they are not the one activating the mobile application. To allow for a convenient process of establishing a customer relationship, also known as onboarding, this delay period should specifically not apply when the mobile application is used to establish the customer relationship between the payment service user and the payment service provider. The payment service provider should set a delay period of 4 hours. The payment service user should afterwards have the right to adjust or opt out of the application of such a delay period, in which case the application of strong customer authentication should be required. Any adjustment of the timeframe of the delay period requested by the payment service user should itself be subject to the delay period proposed by the payment service provider, and could be upwards or downwards from the period of 4 hours. The payment service provider should also notify the payment service user in a secure manner, and through different communication channels, of the activation of a mobile application linked to their payment account on a device if there is an existing customer relationship between the payment service provider and the payment service user. The purpose of the notification is to increase the vigilance of the payment service user and should enable the payment service user to alert the payment service provider if they have not installed the mobile application themselves. In that case, the payment service provider should ensure that the mobile application does not allow access to the payment account of the payment service user or the initiation of payment transactions. This should not apply to the activation of a mobile application on a device of the payment service user, if done by the payment service provider at its physical premises, and it should not apply to the initial establishment of the customer relationship between the payment service provider and the payment service user because no funds nor a payment account of the payment service user are available through the payment service provider at the point of establishing the customer relationship and because it would not be possible for the payment service provider to contact the specific payment service user, given that, at the point of onboarding, the payment service provider has not yet verified contact information for the payment service user._

**Recital (76a)** 

_Where a payment service user denies having authorised an executed payment transaction or claims that the payment transaction was not correctly executed, the use of a payment
instrument in the form agreed by the payment service provider and the payment service user should not in itself necessarily be considered sufficient to prove that the payment transaction
was authorised by the payer. The authentication or the use of the strong customer authentication recorded by the payment service provider, including the payment initiation service provider, as appropriate, should not alone necessarily constitute sufficient evidence either that the payment transaction was authorised by the payer or that the payer acted fraudulently or failed with intent or gross negligence to fulfil one or more of the obligations under Article 52._

**Recital (79)** 

_Payment service users should be adequately protected in the context of so-called social engineering fraud, where a fraudster manipulates a payment service user in performing a certain action, such as initiating a payment transaction, or handing over the payment service user’s security credentials to the fraudsters. The number of such type of "social engineering" cases has significantly increased in recent years. Those new types of fraud are blurring the difference that existed in Directive (EU) 2015/2366 between authorised and unauthorised transactions. Means through which the consent may be assumed to be granted are also becoming more complex to identify, as fraudsters can take control of the whole consent and authentication process including of the strong customer authentication completion. The conditions under which the customer authorised a transaction by giving his or her consent to it should be taken into due consideration, including by courts, to qualify a transaction as being authorised or unauthorised. A transaction may indeed have been authorised in circumstances where such authorisation was granted on manipulated premises affecting the integrity of the consent. It is therefore no longer possible, as was the case in Directive (EU) 2015/2366, to limit refunds to unauthorised transactions only. It would however be disproportionate and financially very costly to payment services providers to open every fraudulent transaction, authorised or unauthorised, to a systematic refund right. It might also cause moral hazard and a reduction in the customer’s vigilance. It is therefore necessary to define the
conditions under which a payment service user has a right to a refund._

**Recital (100)** 

_Fraudsters often target the most vulnerable individuals of our society. The timely detection of fraudulent payment transactions is essential, and transaction monitoring plays an important role in that detection. It is therefore appropriate to require both the payer’s payment service provider and the payee’s payment service provider to have in place transaction monitoring mechanisms, reflecting the crucial contribution of those mechanisms to fraud prevention, going beyond the protection offered by strong customer authentication, in respect of payment transactions, including transactions involving payment initiation services. The payment service provider of the payer should carry out such transaction monitoring prior to the execution of a payment transaction, which in the case of instant credit transfers means in real-time. The payment service provider of the payee should carry out such transaction monitoring before making the funds available to the payee. Where a payment service provider fails to comply with its obligations with respect to the application of transaction monitoring to one or a series of payment transactions, and where that payment transaction or series of payment transactions were initiated through fraudulent means, or otherwise as a result of fraud, the full amount of that payment transaction or series of payment transactions should be refunded to the payer by their payment service provider. Where the payment service provider that failed to apply transaction monitoring is the payment service provider of the payee, it should refund the payment service provider of the payer for the amount refunded by the latter to the payer._

**Recital (107b)** 

_Requirements for strong customer authentication should not be changed substantially from the existing requirements under Directive (EU) 2015/2366. Strong customer authentication
will continue to be based on two or more elements categorised as knowledge, possession and inherence, that are independent from each other. The category inherence relates to physical
properties of body parts, physiological characteristics and behavioural processes created by the body, and any combination of these. At least two of the elements used need to come from
different categories. To allow for innovations in authentication technology, an exception to that principle foresees the usage of two elements from the category inherence, if this does not lower the level of security. To ensure a high level of security and the uniform application of this exception by national competent authorities, EBA should develop guidelines on how to assess the independence of the two elements in this case._

**Recital (108)** 

_SCA should not be circumvented, in particular by any unjustified reliance on SCA exemptions. Clear definitions of Merchant Initiated Transactions (MITs) and of Mail Orders or Telephone Orders (MOTOs) should be introduced since these notions, which may be relied upon to justify non-application of SCA, are diversely understood and applied and are subject to abusive reliance. Regarding MITs, strong customer authentication should be applied at the set-up of the initial mandate, without the need to apply SCA for subsequent merchant-initiated payment transactions. [...]_

**Recital (109a)** 

_In the interest of establishing a level-playing field among different payment instruments, it should be possible to initiate one or several recurring credit transfers, including of varying amounts, without the obligation to apply strong customer authentication where such credit transfers are initiated by the payment service provider of the payer following a request from the payee, provided that certain cumulative conditions are met. In particular, this should be possible where the request from the payee is based on the payee’s agreement with the payer which sets out the conditions regarding frequency of payments and amounts to be paid, where the payer sets up an agreement with its payment service provider which is subject to strong customer authentication and which instructs the provider to execute the respective credit transfers in line with the agreement of the payer with the payee, and where the initiation of the respective credit transfers by the payer’s payment service provider does not require any additional action from the payer. To ensure equivalent safeguards, the provisions concerning refunds and requests for refunds applicable to payment transactions initiated by or through a payee should apply to credit transfers falling under this framework under the same conditions as those applicable to merchant-initiated transactions. In addition, to promote unhindered innovation and accelerate broader availability of efficient payments methods to payers and payees at the point of interaction, it is necessary to allow the possibility to initiate one or several recurring credit transfers under that framework as of the date of entry into force of this Regulation._

**Recital (111)** 

_European Digital Identity Wallets implemented under Regulation (EU) No 910/2014 of the European Parliament and of the Council, as amended by Regulation [XXX], are electronic identification means that offer identification and authentication tools for accessing financial services across borders, including payment services. The introduction of the European Digital Identity Wallet would further facilitate cross-border digital identification and authentication for secure digital payments and facilitate the development of a pan-European digital payments landscape. Pursuant to Art. 5f(2) of Regulation (EU) No 910/2014, payment service providers will be under an obligation to accept the use of the EU Digital Identity Wallets for supporting the fulfilment of SCA requirements for online identification for the purposes of account login and of initiation of transactions in the field of payment services. The EBA should be tasked with the drafting of regulatory technical standards which should specifically take into account the use of EU Digital Identity Wallets to support the fulfilment of SCA requirements for the purposes above._

**Recital (114)** 

_Given that dynamic linking addresses the risks of tampering with the payee name and the specific amount of the transaction between the moment a payment order is placed and authentication of payments, but also the risk of fraud more generally, for mobile payments for which the performance of strong customer authentication requires the use of internet on the payer’s device, payment service providers should also apply elements which dynamically link the transaction to a specific amount and a specific payee or harmonised security measures of identical effect, which ensure the confidentiality, authenticity and integrity of the transaction throughout all of the phases of initiation._

**Recital (120)** 

_Where technical service providers or operators of payment schemes provide services to payees or to the payment service providers of payees or of payers, they should support the
application of SCA within the remit of their role in the initiation or execution of payment transactions. Given the role that they play in ensuring that key security requirements concerning retail payments are properly implemented, including by providing appropriate IT solutions, technical service providers and operators of payment schemes should be held liable for direct financial damage caused to payees, to the payment service providers of the payees or of the payers for, and proportionate to, their failure, within the remit of their contractual relationship, and not exceeding the amount of the transaction in question, to provide the services that are necessary to enable the application of strong customer authentication._

**Article 44(1)**
(Prohibited obstacles to data access)

_Account servicing payment service providers shall ensure that their dedicated interface does not create obstacles to the provision of payment initiation and account information services.
[...]
(h) requiring that strong customer authentication is applied more times in comparison with the strong customer authentication as required by the account servicing payment service provider when the payment service user is directly accessing their payment account or initiating a payment with the account servicing payment services provider;
(i) providing a dedicated interface that does not support all the authentication procedures made available by the account servicing payment service provider to its payment service user;
(j) imposing an account information or payment initiation journey, in a "redirection’ or "decoupled’ approach, where the authentication of the payment service user with the account
servicing payment service provider adds additional steps or required actions in the user journey compared to the equivalent authentication procedure offered to payment service users when directly accessing their payment accounts or initiating a payment with the account servicing payment service provider;
(k) imposing that the user be automatically redirected, at the stage of authentication, to the account servicing payment service provider’s web page address, when the dedicated interface does not support all the authentication procedures made available by the account servicing payment service provider to its payment service users;
(l) requiring two strong customer authentications in a payment initiation service-only journey where the payment initiation service provider transmits to the account servicing payment service provider all the information necessary to initiate the payment, namely one strong customer authentication for the yes/no confirmation and a second strong customer authentication for payment initiation._

**Article 51(4a)**

_Where the payment service provider offers the payment service user the possibility to initiate or give consent to payment transactions by means of a mobile application, the payment
service provider shall require strong customer authentication and the use of different communication channels to activate the mobile application._

**Article 55(2)**
(Evidence on authorisation and execution of payment transactions)

_Where a payment service user denies having authorised an executed payment transaction, the fact that the payment transaction was authenticated, including where applicable, via strong
customer authentication, accurately recorded, entered in the accounts and not affected by a technical breakdown or some other deficiency of the service provided shall in itself not necessarily be sufficient to prove either that the payment transaction was authorised by the payer or that the payer acted fraudulently or failed with intent or gross negligence to fulfil one or more of the obligations under Article 52. The payment service provider, including, where appropriate, the payment initiation service provider, shall provide supporting evidence to prove fraud or gross negligence on part of the payment service user._

**Article 58**
(Liability of technical service providers and of operators of payment schemes for failure to support the application of strong customer authentication)

_Technical service providers and operators of payment schemes that either provide services to the payee, or to the payment service provider of the payee or of the payer, shall be liable for direct financial damage caused to the payee, to the payment service provider of the payee or of the payer for, and proportionate to, their failure, within the remit of their contractual relationship, and not exceeding the amount of the transaction in question to provide the services that are necessary to enable the application of strong customer authentication._

**Article 59(1)**
(Payment service provider’s liability for impersonation fraud)

_Where a payment services user who is a consumer was manipulated by a third party pretending to be the consumer’s payment service provider using communication channels attributed to the consumer's payment service provider and that manipulation gave rise to subsequent fraudulent authorised payment transactions, the payment service provider shall refund the consumer the full amount of the fraudulent authorised payment transaction under the condition that the consumer has, without undue delay after becoming aware of the fraud, notified its payment service provider and reported the fraud to the police._

**Article 60(2)**
(Payer’s liability for unauthorised payment transactions)

_Where the payer’s payment service provider fails to fulfil the obligation to require strong customer authentication set out in Article 85, the payer shall not bear any financial losses unless the payer has acted fraudulently. The payer shall not bear any financial losses also where either the payment service provider of the payer or of the payee applies an exemption from the application of strong customer authentication. Where the payee or the payment service provider of the payee fails to develop or amend the systems, hardware and software that are necessary to apply strong customer authentication, the payee or the payment service provider of the payee shall refund the financial damage caused to the payer’s payment service provider._

**Article 76(1)**
(Liability in the case of payment initiation services for non-execution, defective or late execution of payment transactions)

_Where a payment order is placed by the payer or by the payee through a payment initiation service provider, the account servicing payment service provider shall, without prejudice to Article 54 and Article 74(2) and (3), refund to the payer the amount of the non-executed or defective payment transaction and, where applicable, restore the debited payment account to the state in which it would have been had the defective payment transaction not taken place.
The burden shall be on the payment initiation service provider to prove that the payment order was received by the payer’s account servicing payment service provider in accordance with Article 64 and that within its sphere of competence the payment transaction was authenticated, accurately recorded and not affected by a technical breakdown or other deficiency linked to the non-execution, defective or late execution of the transaction._

**Article 78(1)**
(Right of recourse)

_Where the liability of a payment service provider under Articles 56, 57, 59, 75, 76 and 83 is attributable to another payment service provider or to an intermediary, that payment service provider or intermediary shall compensate the first payment service provider for any losses incurred or sums paid under Articles 56, 57, 59, 75, 76 and 83. That shall include compensation where any of the payment service providers fail to apply strong customer authentication._

**Article 83(1)**
(Transaction monitoring mechanisms)

_Payment service providers shall have transaction monitoring mechanisms in place to:
(a) support the application of strong customer authentication in accordance with Article 85;
[...]
(c) prevent and detect potentially fraudulent payment transactions, including transactions involving payment initiation services._

**Article 83(1a)**
(Transaction monitoring mechanisms)

_The payment service provider of the payer shall carry out the transaction monitoring referred to in paragraph 1 prior to the execution of a payment transaction. The payment service provider of the payee shall also carry out transaction monitoring before the funds are made available to the payee in accordance with Article 69(2).
Where a payment service provider does not carry out such monitoring with respect to a transaction and the payer incurs financial damage, that payment service provider shall bear liability.
Where the payer's payment service provider does not provide evidence to the payer that such monitoring for a transaction has been carried out by both providers, it shall refund the
payer the amount of the transaction.
[...]_

**Article 83(1b)**
(Transaction monitoring mechanisms)

_Transaction monitoring mechanisms shall be based on the analysis of previous payment transactions and access to payment accounts online._

**Article 83(2)**
(Transaction monitoring mechanisms)

_Processing by the payment service provider of the payer shall be limited to the following data, insofar as necessary to achieve the purposes referred to in paragraph 1:
(a) information on the payer, including the environmental and behavioural characteristics which are typical of the payer in the circumstances of a normal use of the personalised security
credentials;
(b) information on the payment account, including the payment transaction history;
(c) transaction information, including the transaction amount, payment instrument, currency, date and time of execution, as well as unique identifier of the payee;
(d) session data, including the device internet protocol address-range from which the payment account has been accessed, from which the transaction was initiated;
(e) device data, including device identifiers from which the transaction was initiated;
(ea) information on the payee, including the unique identifier of the payee;
(eb) information received through the information sharing arrangements._

**Article 83(2b)**
(Transaction monitoring mechanisms)

_Payment service providers shall not store data referred to in paragraphs 2 and 2a longer than necessary for the purposes set out in paragraph 1, and, in any event, no longer than 5 years
after the termination of the customer relationship. Payment service providers shall ensure that the transaction monitoring mechanisms take into account, at a minimum, each of the following risk-based factors:
(a) lists of compromised or stolen authentication elements;
(b) the amount of each payment transaction;
(c) known fraud scenarios in the provision of payment services;
(d) signs of malware infection in any sessions of the authentication procedure;
(e) in case the access device or the software is provided by the payment service provider, a log of the use of the access device or the software provided to the payment service user and the abnormal use of the access device or the software._

**Article 85(1)**
(Strong customer authentication)

_A payment service provider shall apply strong customer authentication where the payer:
(a) accesses its payment account online;
(c) places a payment order for an electronic payment transaction;
(d) carries out any other action through a remote channel which might imply a risk of payment fraud or other abuses, including ordering the creation or replacement of a tokenised payment
instrument via a remote channel, increasing its spending limits according to Article 51, changing its password online or changing its contact information online._

**Article 85(2)**
(Strong customer authentication)

_Payment transactions that are initiated by the payee shall not be subject to strong customer authentication to the extent that those transactions are initiated without any interaction or
involvement of the payer. [...]._

**Article 85(5)**
(Strong customer authentication)

_Where the mandate of the payer to the payee to place payment orders for merchant initiated transactions is provided through a remote channel with the involvement of the payment service provider, the setting up of such a mandate shall be subject to strong customer authentication._

**Article 85(6)**
(Strong customer authentication)

_For direct debits, where the mandate given by the payer to the payee to initiate one or several direct debit transactions is provided through a remote channel with the direct involvement of the payer’s payment service provider in setting up of such a mandate shall be subject to strong customer authentication._

**Article 85(8)**
(Strong customer authentication)

_For the remote placement of a payment order as referred to in paragraph 1, point (c), payment service providers shall apply strong customer authentication that includes elements which dynamically link the transaction to a specific amount and a specific payee._

**Article 85(9)**
(Strong customer authentication)

_For the placement of a payment order as referred to in paragraph 1, point (c), through a payer’s device using proximity technology for the exchange of information with the payee’s infrastructure, the authentication of which requires the use of internet on the payer’s device, payment service providers shall apply strong customer authentication that includes elements which dynamically link the transaction to a specific amount and a specific payee or harmonised security measures of identical effect, which ensure the confidentiality, authenticity and integrity of the amount of the transaction and the payee throughout all of the phases of initiation._

**Article 85(10)**
(Strong customer authentication)

_For the purposes of paragraph 1, payment service providers shall have in place adequate security measures to protect the confidentiality and integrity of payment service users’ personalised security credentials._

**Article 85(12)**
(Strong customer authentication)

_The two or more elements referred to in Article 3, point (35), on which strong customer authentication shall be based, need to belong to different categories, except for the category inherence, where payment service provider can implement strong customer authentication using two elements only from this category, if it demonstrates to the national competent authority that the independence of the elements is at all times fully preserved and the authentication procedure ensures at all times a high level of security.
The EBA shall develop guidelines by [18 months after entry into force of this Regulation] in accordance with Article 16 of the Regulation 1093/2010 on how to assess that the independence of the two inherence elements is fully preserved._

**Article 86(1)**
(Strong customer authentication in respect of payment initiation and account information services)

_Article 85(8), (9) and (12) shall also apply where payments are initiated through a payment initiation service provider. Article 85(10) shall also apply where payments are initiated through a payment initiation service provider and when the information is requested through an account information service provider._

**Article 86(2)**
(Strong customer authentication in respect of payment initiation and account information services)

_Account servicing payment service providers shall allow payment initiation service providers and the account information service providers to rely on the authentication procedures provided by the account servicing payment service provider to the payment service user in accordance with Article 85(1) and (10) and, where the payment initiation service provider is involved, in accordance with Article 85(1), (8), (9), (10) and (12)._

**Article 86(4)**
(Strong customer authentication in respect of payment initiation and account information services)

_Account information service providers shall apply strong customer authentication when the payment services user accesses the payment account information using that account information service provider at least 180 days after strong customer authentication was last applied. Account information service providers may apply their own or the account servicing payment service provider's strong customer authentication._

**Article 87(1)**
(Outsourcing agreements for the application of strong customer authentication)

_The payment service provider of the payer shall enter into an outsourcing agreement with the technical service provider in case that technical service provider is providing and verifying the elements of strong customer authentication._

**Article 89(1)**
(Regulatory technical standards on authentication, communication and transaction monitoring mechanisms)

_The EBA shall develop draft regulatory technical standards which shall specify:
(a) the requirements of strong customer authentication as referred to in Article 85;
(b) the exemptions from the application of Article 85(1), (8) and (9), based on the criteria laid down in Article 85(11);
(c) the requirements with which security measures have to comply, in accordance with Article 85(10) in order to protect the confidentiality and the integrity of the payment service users’ personalised security credentials;
(d) the requirements applicable, in accordance with Article 87, to the outsourcing agreements between the payers’ payments service providers and technical service providers concerning the provision and verification of the elements of strong customer authentication by technical service providers;
(e) the requirements under Title III, Chapter 3 for common and secure open standards of communication for the purpose of identification, authentication, notification, and information, as well as for the implementation of security measures, between account servicing payment service providers, payment initiation service providers, account information service providers, payers, payees and other payment service providers;
(f) supplementary provisions on secure open standards of communication using dedicated interfaces;
(g) the technical requirements for transaction monitoring mechanisms referred to in Article 83._

_For the purposes of point (b), as regards the exemption from the application of strong customer authentication for payment transactions, based on transaction risk analysis the draft regulatory technical standards shall specify, inter alia:
(i) the conditions that have to be met for a remote electronic payment transaction to be
considered as posing a low level of risk;
(ii) the methodologies and models to implement transaction risk analysis;
(iii) the criteria for the calculation of fraud rates, including on the allocation of fraud rates
between payment service providers providing issuing and acquiring services, or within payment
service providers providing issuing and acquiring services through a single legal entity;
(iv) detailed and proportionate reporting and audit requirements._

**Article 89(2)**
(Regulatory technical standards on authentication, communication and transaction monitoring mechanisms)

_When developing the draft regulatory technical standards referred to in paragraph 1, the EBA shall take into account:
(a) the need to ensure an appropriate level of security for payment service users and payment service providers, through the adoption of effective and risk-based requirements;
(b) the need to ensure the safety of payment service users’ funds and personal data;
(c) the need to secure and maintain fair competition among all payment service providers;
(d) the need to ensure technology and business-model neutrality;
(e) the need to allow for the development of user-friendly, accessible and innovative means of payment;
(ea) the need to balance fraud risk in a service or economic activity concerned with the consumer experience, in particular with regards to low value transactions;
(eb) whether or not the payers in the transactions are consumers._

_The EBA shall submit the draft regulatory technical standards referred to in paragraph 1 to the Commission by [ OP please insert the date= 1 year after the date of entry into force of this Regulation]. Power is delegated on the Commission to adopt the regulatory technical standards referred to in the first subparagraph in accordance with Articles 10 to 14 of Regulation (EU) No 1093/2010._

**Article 89(3)**
(Regulatory technical standards on authentication, communication and transaction monitoring mechanisms)

_In accordance with Article 10 of Regulation (EU) No 1093/2010, the EBA shall review and, if appropriate, update the regulatory technical standards on a regular basis in order, inter alia, to take account of innovation and technological developments, and the provisions of Chapter II of Regulation (EU) 2022/2554, and the European Digital Identity Wallets implemented under Regulation (EU) No 910/2014._

## 4 Current Concept of Wallet-Based SCA 

This chapter contains a recap of the current ARF concept and requirements for wallet-based SCA.

### 4.1 SCA Attestations and Presentation

The general concept of SCA with the use of the Wallet is based on a dedicated attestation ("SCA Attestation") that represents a means of SCA for a given payment instrument (card payment, account to account payment, etc.).

Presentation of an attribute from an SCA Attestation is associated with the inclusion of payment-related transactional data as a part of the payload of the presentation request (the `transaction_data` parameter as defined in [OID4VP]).

Such a presentation is therefore not a "normal" presentation of an attribute - by presenting an attribute, the User gives consent to the execution of a payment. 

At the same time, a presentation of attributes from an SCA Attestation may be combined with presentation of other attributes from non-SCA Attestations (e.g. age).

### 4.2 Use Cases

The current concept of SCA in ARF and the related [TS12] specification takes into account the use cases defined by [PSD2] and [RTS SCA], where the application of SCA is required when a User:
+ initiates an electronic payment transaction, 
+ accesses their payment account online,
+ carries out any action through a remote channel which may imply a risk of payment fraud or other abuses.

In the case of initiating an electronic payment transaction or a series thereof, payers can further give their consent either directly to their ASPSP (e.g. a bank), or via a payee (e.g. a merchant) or a PISP (e.g. an acquirer).

The ARF [Topic 20] introduces a concept of SCA based on dedicated SUA attestations issued to the User’s Wallet Unit by their ASPSP and later presented by the Wallet Unit to a Relying Party, constituting SCA (more details in the later part of this chapter). 
In this context, there are two basic flow models, depending on which entity the User interacts with in the SCA process (SUA attestation presentation): 

+ **2-Party Model** (aka **Issuer-Requested Flow**), where the ASPSP acts as both the Attestation Provider and the Relying Party; in this scenario **all three SCA use cases are permitted**;

+ **3-Party Model** (aka **Payee-Requested Flow**), where the Attestation Provider differs from the Relying Party; in this scenario **only the payment initiation SCA use case is permitted**.


### 4.3 Technical Specification for SCA with the Wallet

In 2025, the European Commission published the [TS12] specification, which was developed with a strong contribution from representatives of the Large Scale Pilot consortiums - WeBuild and Aptitude.  

In general [TS12] aims to define the behaviour of Wallet Units when receiving a presentation request for attributes from an SCA Attestation (which contains payment transaction data as a payload, and where a presentation of the attributes effectively constitutes an act of SCA). Therefore, Wallet Providers shall implement their Wallet Solutions in compliance with [TS12].

[TS12] contains:
+ overview of the SCA scenarios at stake,
+ minimum requirements and specifications for transactional data sent in a presentation request,
+ minimum requirements and specifications for metadata of the SCA Attestation,
+ transactional data processing and display message rendering requirements,
+ other necessary requirements related to Wallet Solutions" functionality, interoperability or security.

### 4.4 Rulebook for SCA Attestation  

To complement [TS12], at least one an SCA Attestation Rulebook, shall be made available. Such a rulebook is yet to be delivered. As [TS12] provides some mandatory requirements for SCA Attestation content and issuance, the SCA Attestation Rulebooks shall conform to the [TS12] specification. 

At the same time, the SCA Attestation Rulebooks may provide additional requirements and specifications extending [TS12] (for instance to improve user experience or customise the scenarios) that may be implemented by Wallet Solutions on a voluntary basis.

### 4.5 Transactional Data Types  

To enable the use cases (presented in Section 4.2) and ensure interoperability between Wallet Providers, [TS12] standardises the data schemas of the `transaction_data` parameter content. 

It effectively defines four types of `transaction_data` payload, for the following scenarios:
+ payment confirmation,
+ login and confirmation of actions carrying a risk of fraud or abuse,
+ accessing payment account information, and
+ e-mandates for Payee-initiated transactions.

The transactional data is used to render a display message to the User and to provide the "dynamic linking" mechanism, as required by [PSD2].

The transactional data schemas are fixed, and modifying them or adding new types (e.g. to address new cases) requires updating of [TS12], as well as the Wallet Units in the field.

### 4.6 Transactional Validation

To avoid unexpected wallet behaviour and to prevent misuse and fraud, the type of transactional data used in an SCA presentation request shall match a specific SCA Attestation. 

Therefore the Wallet Unit, after receiving of a presentation request with the `transaction_data` parameter present, shall: 

+ Verify that the requested attestation type is an SCA Attestation
+ Verify that the `transaction_data` payload type matches the type of the SCA Attestation
+ Validate that the `transaction_data` payload conforms to the transactional data type schema

If any of these verifications fails the Wallet Unit shall cease processing.

### 4.7 User Message Rendering

To meet the requirements of [PSD2] the Wallet Unit shall ensure that the User is able to give explicit and informed consent to the transaction, that is a payment transaction. Therefore, the Wallet Unit shall display transactional data and some related information, in conjunction with the requested attributes of an SCA Attestation, to the User. The information shall be displayed in a clear, understandable and accurate manner, for review before obtaining the User's confirmation of the transaction.

[TS12] defines mandatory and optional user interface visual elements that may appear on the screen of the User's device. The rendering mechanism is partially customisable and dynamic: the number of available UI elements and their parameters are fixed, but an SCA Attestation Provider (which is normally a bank/PSP) may define its own content (e.g., labels of the confirmation and denial actions buttons, transaction title or security hint, including localisation and support for multiple languages). 

### 4.8 Response and Proof Package

The presentation response provides not only the attributes being presented, but also the "authentication code" (the `jti` parameter), which is a part of the dynamic linking mechanism, the response mode (whether direct or via DC-API) and authentication method information.
Such a response constitutes a proof of the User's consent to an SCA transaction.

### 4.9 SCA-related HLRs

#### 4.9.1 List of Applicable HLRs

The relevant High Level Requirements are defined in ARF's [Topic 20] - Strong User authentication for electronic payments:

 **Index**  | **Requirement specification** | 
|-----------|-------------------------------|
|   SUA_01  |    A Wallet Unit SHALL be able to process the transactional data included in a presentation request for the SUA attestation(s) specified in [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md), according to all requirements in that Technical Specification. *Note: Technical Specification 12 specifies a SUA attestation intended for performing SCA as specified in the PSD2 Regulation. The related Rulebook is called "SCA Attestation Rulebook".*             | 
|   SUA_02  |        Scheme Providers MAY specify Attestation Rulebooks (see [Topic 12] and associated technical specifications for SUA attestations other that the ones specified in [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md)). The Attestation Rulebook or the technical specification of such of a SUA attestation SHALL specify the syntax and semantics of the transactional data associated with that attestation.       |
|   SUA_02a  |     The Technical Specification associated with a given SUA attestation SHALL specify all necessary requirements for Wallet Units to process transactional data intended for this SUA attestation, at least regarding a) rendering and displaying the data to the User when obtaining approval for presentation, b) processing (e.g., hashing) the data for inclusion in the device binding signature, and c) the scope of information to be logged about a SUA attestation presentation transaction by a Wallet Unit.          |
|   SUA_03  |         The Attestation Provider of a SUA attestation other than the one(s) specified in [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) SHALL NOT issue such an attestation to a Wallet Unit that does not comply with all relevant requirements in the SUA Attestation Rulebook and the technical specification for that attestation.      |
|   SUA_04  |    In the response to a presentation request for a SUA attestation that includes transactional data, a Wallet Unit SHALL include (a representation of) that data, according to requirements included in the associated technical specification or Attestation Rulebook or in information provided to the Wallet Unit in the presentation request. In the latter case, the rules to interpret such information SHALL be included in the associated technical specification or Attestation Rulebook. *Note: This requirement, as well as SUA_05, only applies if the requested SUA attestation is present on the Wallet Unit and if the User consents to signing the transactional data and presenting the requested attributes.*           |
|   SUA_05  |   The Wallet Unit SHALL include (a representation of) the transactional data received in a presentation request in the signature creation process used for device binding, using the private key of the requested SUA attestation and the mechanisms specified for key binding in [SD-JWT VC] or mdoc authentication in [ISO/IEC 18013-5], as applicable. For this process, the Wallet Unit SHALL comply with the applicable requirements in the technical specification and the Attestation Rulebook for the requested SUA attestation, see SUA_01 or SUA_02. *Note: a) The resulting signature value constitutes a proof of transaction. This signature value, possibly in combination with other protocols items, fulfils the requirements for the authentication code required in [PSD2]. b) See also requirement OIA_02 in [Topic 1].*            |
|   SUA_06  |      The Wallet Unit SHALL render or adapt the dialogue message(s) displayed to the User (like font size and colour, background colour, text position, labels in the buttons to "approve" or "reject" a transaction), according to requirements in [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md).         |
|   SUA_07  |      Upon receiving a presentation request with transactional data, the Wallet Unit SHALL validate if the transactional data is intended for the given attestation and that the transactional data conforms to the related technical specification and/or Attestation Rulebook. In case the validation result is positive, the Wallet Unit SHALL process the transactional data in compliance with the related technical specification.         |


In addition, the following HLRs, from other topics, are also applicable:

 **Index**  | **Requirement specification** | 
|-----------|-------------------------------|
|   ISSU_33b​  |   A Wallet Provider SHALL ensure that its Wallet Units support all attestations conforming to attestation schemes registered in the catalogue of schemes for the attestation of attributes established by the Commission pursuant to Article 8 of Commission Implementing Regulation (EU) 2025/1569, where such attestations use a format and issuance protocol supported by Wallet Units pursuant to Commission Implementing Regulations (EU) 2024/2977, 2024/2979 and 2024/2982.​     | 
|    ARB_22    |   The Scheme Provider for an Attestation Rulebook SHALL specify all technical details necessary to ensure interoperability, security, and privacy of that attestation.   |

Note: An Attestation Rulebook may also specify requirements regarding how the Wallet Unit must display the attestation and the attributes in it to the User.


#### 4.9.2 Summary of HLRs 

The current HLRs can be summarised as below:
- Each Wallet Solution shall comply with [TS12], which ensures the processing of requests associated with SCA attestations (a specific type of SUA attestation);
- At least one SCA Attestation Rulebook needs to be made available and this rulebook shall be aligned with [TS12]; such a rulebook needs to be delivered by the "market";
- There may be other technical specifications and rulebooks for SUA attestations, but their support by Wallet Solutions/Units may not be guaranteed; before issuing such a SUA attestation, the Attestation Provider shall make sure a given Wallet Unit supports it;
- If a Scheme Provider provides a rulebook for a SUA Attestation, it shall indicate the related technical specification (necessary for Wallet Solutions to properly process the presentation request with the associated transactional data type). 
- If a SUA attestation rulebook is registered in the catalogue of schemes published by the Commission, Wallet Providers shall ensure their Wallet Solutions support it (this may entail compliance with  additional technical specifications, other than [TS12]);
- Once a Wallet Unit receives a presentation request for a SUA Attestation (containing the transactional data parameter), the Wallet Unit shall perform vetting: recognise the transactional data type, validate the compliance of the transactional data parameter with the applicable Rulebooks and/or technical specification, and check if the given transactional data type is intended for the SUA Attestation at stake; if the vetting result is negative (or the vetting process fails for any reason) - it shall stop processing such a request.     


## 5 Discussion Items

### 5.1 Rulebooks 

As of now there is no SCA Attestation Rulebook available. In general, such a rulebook (one or more) should normally be provided by the market. 

As part of the discussion, the following questions are to be answered:

**QUESTION 1**: Are there any Member States or other stakeholders working on the SCA rulebook? 

**QUESTION 2**: Who should provide the SCA rulebook(s)? Is it expected that the Commission takes initiative and provides such a rulebook? 


_(Update after the Cooperation Group Meetings:)_

In September 2026, the European Payments Council announced the launch of the SCARLET task force (see [EPC's press release](https://www.europeanpaymentscouncil.eu/news-insights/news/epc-launches-scarlet-initiative-support-consistent-use-eu-digital-identity)) which is "a new standardisation framework designed to support the consistent acceptance of EU Digital Identity Wallets by payment service providers (PSPs) in the context of SCA". The EPC Taskforce SCARLET is expected to deliver a Rulebook (version 1.0) by the end of 2027.


### 5.2 Limitations of TS12 and Market Needs

The [TS12] model has some characteristics by design that can be considered limitations:
- fixed transactional data types, which means hardcoding and therefore Wallet Solutions capable supporting of only fixed use cases,
- the need to update [TS12] and Wallet Unit software to support any new use case or any change to a transactional data type specification,   
- semi-static rendering rules - the number of available UI elements and their parameters are fixed, while banks and payment sector stakeholders are eager to have more flexibility, to optimise user experience or meet business requirements e.g. related to branding,
- as a general rule, Wallet Units are not allowed to provide any additional information about the User or its device as "fraud signals". This may not implementallow for the implementation of best practices related to payment transaction risk monitoring (a requirement of [PSD2]), equivalent to today's SCA solutions used by banks, 
- related to the point above, the response to a presentation request provides a limited "proof package" (see Section 4.8) that could be extended to improve banks' transaction risk monitoring processes.

Simultaneously the market is taking initiatives to reuse the [TS12] wallet-based SCA concept for payment initiation processes, in particular in the 3-Party Model (Payee-Requested Flow) for so-called Merchant-Initiated Transactions (as defined in [PSR Provisional Agreement]). 

Yet another aspect for consideration is the similarity with the remote signature authorisation process as another use case for SUA atestations and transactional data. Currently, another standard is being independently developed by ETSI (TS 119 432) that addresses a similar need for user consent. As of now, the two specifications (TS12 and ETSI TS 119 432) have to be implemented by Wallet Providers independently, although some requirements are common and could potentially rely on a common specification (e.g. for core functionality such as display screen rendering).  

There may be further limitations or business needs for improving TS12; identifying them is one of the goals of the Topic AA RR discussion process.

To conclude, the following questions arise as part of the discussion:

**QUESTION 3**: What are the identified limitations of TS12?

**QUESTION 4**: What improvements and business needs should be addressed by a future version, or a successor of TS12?


_(Update after the Cooperation Group Meetings:)_

Following the discussion, the key issue identified is the lack of "fraud/risk signals" from the client side (User device) in the SCA process with a Wallet Unit. These signals refer to information about the device security posture such as jailbreaking, rooting and malware detection, operating system version and vulnerabilities (refer to [Topic T Discussion Paper](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/discussion-topics/t-support-and-maintenance-by-the-wallet-provider.md#332-security-posture-of-wallet-instance) section 3.3.2 for more examples). ARF and [TS12] do not envisage the delivery of such signals to Relying Parties (PSPs in this case), as this is outside the legal frames set by eIDAS (and GDPR). At the same time, there is no way to fully compensate for it with information from other channels. As a consequence, this may entail frequent step up authentications (additional authentication, via other means or channels), for all SCA transactions with the Wallet in the worst case. This may impact the user experience (UX) and the adoption of Wallets. Although this could be solved at the technical level (e.g. [PaSO] provides a proposal), the legal aspects have to be clarified.

Other expectations for the evolution of ARF and related specifications are:
- Tiering of Wallet Unit's processing, which means different transaction processing requirements (e.g. with respect to User message rendering or the scope  of risk signals), depending on the type or risk level of a transaction.
- Standardisation of Wallet Providers’ monitoring of Wallet Solutions and Units in the field – set of information/risk signals, frequency of verification, assessment criteria, in order to harmonise Wallet Unit revocation decisions.
- Strictet “access control” to SCA attestations in Wallet Units - verification of Attestation Providers (at issuance time) and Relying Parties (at SCA presentation) by Wallet Units. This aims to make sure that only entitled Wallet-Relying Parties issue or verify SCA attestations.
- Support for new use cases (new transaction types) without the need to update [TS12] or to hardcode them in the Wallet Solutions.


### 5.3 Feedback from LSPs and TS12 Implementers 

The two Large Scale Pilot consortiums, WeBuild and Aptitude, are currently experimenting with [TS12] implementations and aim to carry out their tests of wallet-based SCA (as well as payment initiation). Their experience is crucial to the discussion in the context of limitations and needs related to [TS12] development.

The experience from the LSPs at least partially resulted in the development of the [PaSO] specification, delivered by Aptitude consortium (see the next section).

There may be further limitations or business needs for [TS12] improvements; identifying them is one of the goals of the Topic AA RR discussion process.

To conclude, the following questions arise as part of the discussion:

**QUESTION 5**: What experience with [TS12] and wallet-based SCA (and payment initiation relevant to [TS12]) has been drawn from the Large Scale Pilots?

**QUESTION 6**: What experience from [TS12] implementation do the Member States and other stakeholders have?


_(Update after the Cooperation Group Meetings:)_

See Section 5.2 for conclusions.


### 5.4 Standardisation Initiatives

There are standardisation initiatives related to payment initiation and authentication, that may be relevant to this discussion and the future of [TS12]:

- [PaSO] (Payments and SCA for OpenID) 
- [DPC] (EMV Digital Payment Credentials)
- [SPC] (W3C Secure Payment Confirmation)

[PaSO] is a specification developed by Aptitude based on implementation experience. It is based on [TS12] but it splits it into several parts, extends and improves it. 
The main changes compared to [TS12] are: 
- universal core engine, that provides fully dynamic message rendering option,
- extended proof package and more extensive logging for strengthened evidence,
- additional policy requirements for Relying Parties, to ensure proper proof package preparation , 
- introduction of a new role - the "Authorising Party", which sits between a Wallet Relying Party verifying an SCA Attestation (e.g. merchant) and a the PSP/bank liable for SCA,
- it supports payment initiation (Merchant Initiated Transaction scenario),
- it is extensible - it allows new transactional data types to be added without the to modify the Wallet's logic, thanks to the core engine, 
- [PaSO] seems to be more complex for Wallet Providers to implement, but gives more flexibility and is "future-proof".  

[DPC] is a recent initiative of EMVCo; the first draft was published in May 2026. It contains a rulebook for SCA Attestations called Digital Payment Credentials, as well as additional specifications or policy requirements for the SCA process flow to ensure proper proof package preparation and create trust. Similarly to [PaSO], it envisages an additional role, the "Verifier", analogous to PaSO's "Authorising Party". Although the DPC concept is universal, the specification focuses on card payments.

[SPC] is a specification being developed by W3C, still in "draft" status. It provides a web API specification for payment authentication. It extends the WebAuthn API to provide streamlined, secure and PSD2-compliant (dynamic linking) payment authentication with FIDO2 authenticators. [SPC] is not yet supported by all (main) browsers, and its use in the field is marginal.

To conclude, the following questions arise as part of the discussion:

**QUESTION 7**: Are there any other standardisation initiatives worth looking at at this time?

**QUESTION 8**: Is there an impact from these standardisation initiatives to wallet-based SCA concept and [TS12] implementation? 

**QUESTION 9**: Is there a need to coordinate efforts or align [TS12] development with these other initiatives? If so, in what scope? 


_(Update after the Cooperation Group Meetings:)_

The outcome of the discussion is that the [TS12] specification requires an update to address market needs, as presented in Section 5.2. [TS12] may take inspiration from, reuse some content or reference the [PaSO] specification. 


### 5.5 Impact of PSR

The upcoming PSR should not fundamentally change the wallet-based SCA concept and [TS12]. However a detailed assessment of [TS12] against PSR requirements would be desirable after the adoption of the PSR. 
According to the current PSR text ([PSR Provisional Agreement]), Wallet Providers and SCA solution implementers (PSPs/banks and their providers) may need to take into account requirements related e.g. to mobile application activation, display and accessibility, liability and outsourcing aspects (the Wallet as a means of SCA delivered by an external "technical service provider").

To conclude, the following question is to be answered during the discussion:

**QUESTION 10**: What is the impact of PSR to the ARF concept, HLRs and [TS12]? Are any changes required as a result? 


_(Update after the Cooperation Group Meetings:)_

The conclusion from the discussion is that [PSR Provisional Agreement] does not directly impact ARF or [TS12]. At the same time, eIDAS, ARF and PSR (and the related RTS) should be aligned in reference to application of SCA, in particular fraud signals, transaction risk monitoring, and outsourcing aspects. 


## 6 Proposals of Changes to HLRs


As the outcome of the discussion, the following changes to HLRs are proposed:


 **Index**  | **Requirement specification**       | **Proposal**  |
|-----------|-------------------------------------|----------------------|
|   SUA_01  |    A Wallet Unit SHALL be able to process the transactional data included in a presentation request for the SUA attestation(s) specified in [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md), according to all requirements in that Technical Specification. *Note: Technical Specification 12 ~~specifies~~ **refers to the presentation of** a SUA attestation intended for performing SCA **,** as specified in the PSD2 Regulation. The related Rulebook is called "SCA Attestation Rulebook".*             | Keep with the proposed change |
|   **SUA_01a**  |        **A Scheme Provider that delivers a SUA Attestation Rulebook as specified in SUA_01, it SHALL ensure that this Rulebook is compliant with [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md). _Note: [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) contains some requirements related to the attestation itself._**       |      New requirement    |
|   SUA_02  |        Scheme Providers MAY specify Attestation Rulebooks (see [Topic 12]) ~~and associated technical specifications~~ for SUA attestations other ~~that~~ **than** the ones ~~specified~~ mentioned in **SUA_01** ~~[Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md))~~. The Attestation Rulebook SHALL **indicate a** ~~or the~~ technical specification ~~of such of a SUA attestation SHALL specify~~ **that specifies** the syntax and semantics of the transactional data associated with that attestation.       |      Keep with the proposed change  |
|   SUA_02a  |     The technical specification associated with a given SUA attestation SHALL specify all necessary requirements for Wallet Units to process transactional data intended for this SUA attestation, at least regarding a) rendering and displaying the data to the User when obtaining approval for presentation, b) processing (e.g., hashing) the data for inclusion in the device binding signature, and c) the scope of information to be logged about a SUA attestation presentation transaction by a Wallet Unit.          |      Keep as-is     |
|   SUA_03  |         The Attestation Provider of a SUA attestation ~~other than the one(s) mentioned [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md)~~ SHALL NOT issue such an attestation to a Wallet Unit that does not comply with all relevant requirements in the SUA Attestation Rulebook and the technical specification for that attestation.      |  Keep with the proposed change |
|   SUA_04  |    In the response to a presentation request for a SUA attestation that includes transactional data, a Wallet Unit SHALL include (a representation of) that data, according to requirements included in the associated technical specification ~~or Attestation Rulebook or in information provided to the Wallet Unit in the presentation request. In the latter case, the~~ The rules **on how** to interpret such information SHALL be included in the associated technical specification or Attestation Rulebook. *Note: This requirement, as well as SUA_05, only applies if ~~the~~ **a** requested SUA attestation is present ~~on~~ **in** the Wallet Unit and if the User consents to signing the transactional data and presenting the requested attributes **from the SUA attestation**.*           |  Keep with the proposed change  |
|   SUA_05  |   The Wallet Unit SHALL include (a representation of) the transactional data received in a presentation request in the signature creation process used for device binding, using the private key of the requested SUA attestation and the mechanisms specified for key binding in [SD-JWT VC] or mdoc authentication in [ISO/IEC 18013-5], as applicable. For this process, the Wallet Unit SHALL comply with the applicable requirements in the technical specification and the Attestation Rulebook for the requested SUA attestation, see SUA_01 or SUA_02. *Note: a) The resulting signature value constitutes a proof of transaction. This signature value, possibly in combination with other protocols items, fulfils the requirements for the authentication code required in [PSD2]. b) See also requirement OIA_02 in [Topic 1].*            |    Keep as-is  |
|   SUA_06  |      The Wallet Unit SHALL render or adapt the dialogue message(s) displayed to the User (like font size and colour, background colour, text position, labels in the buttons to "approve" or "reject" a transaction), according to requirements in [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md).         |     Keep as-is     |
|   SUA_07  |      Upon receiving a presentation request with transactional data, the Wallet Unit SHALL validate if the transactional data is intended for the given attestation and that the transactional data conforms to the related technical specification and/or Attestation Rulebook. In case the validation result is positive, the Wallet Unit SHALL process the transactional data in compliance with the related technical specification.         |   Keep as-is  |
|   **SUA_08**  |      **Upon receiving a presentation request related to a SUA attestation indicated in SUA_01, the Wallet Unit SHALL validate whether the requesting Relying Party is permitted to make such a request for the given attestation, if [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) or another common technical specification accepted by the Cooperation Group enables this. _Note: Such a specification could be an extension of the generic Embedded Disclosure Policy mechanism._**         |   New requirement |
|   **SUA_09**  |      **Upon receiving a presentation request related to a SUA attestation indicated in SUA_01, the Wallet Unit SHALL make risk signals available to the requesting Relying Party if allowed by law and if [Technical Specification 12](../technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) or another common technical specification accepted by the Cooperation Group enables this. _Note: PSD2 and the PSR proposal oblige Payment Service Providers to monitor and assess risk for each payment transaction; collecting risk signals from the User's device is key and a market standard._**      |   New requirement  |
|   ISSU_33b​  |   A Wallet Provider SHALL ensure that its Wallet Units support all attestations conforming to attestation schemes registered in the catalogue of schemes for the attestation of attributes established by the Commission pursuant to Article 8 of Commission Implementing Regulation (EU) 2025/1569, where such attestations use a format and issuance protocol supported by Wallet Units pursuant to Commission Implementing Regulations (EU) 2024/2977, 2024/2979 and 2024/2982.​     |   Keep as-is  |
|    ARB_22     |   The Scheme Provider for an Attestation Rulebook SHALL specify all technical details necessary to ensure interoperability, security, ~~and~~ privacy of that attestation, **and proper processing of a presentation request**. _Note: An Attestation Rulebook may also specify requirements regarding how the Wallet Unit must display the attestation and the attributes in it to the User, **or how to process transactional data, if involved (see [Topic 20])**._ | Keep with the proposed change |
|     **WPSM_05**   |  **A Wallet Provider SHALL perform activities defined in WPSM_01, WPSM_02, WPSM_03 and WPSM_04 according to a common technical specification if such a specification is available and accepted by the Cooperation Group. _Note: See the note in SUA_09. Wallet Solution and Wallet Unit status is one of the important risk assessment factors for Relying Parties, in particular PSPs. This is therefore desirable to have harmonised policies of Wallet Providers related to Wallet Units security posture monitoring and revocations across the EU, to simplify and unify PSPs' risk assessment procedures, without differences related to the Wallet Unit's origin._**  |   New requirement  |


## 7 Additions and Changes to the ARF 

There are no proposals at this stage. Changes to ARF may be proposed as the outcome of the discussion process.

At the same time, there are the following aspects should be considered as potentially relevant: 
- Accessibility in wallet-based SCA - to define how the dialogue messages shall meet accessibility rules, which were discussed in [Topic Q] Discussion Paper;
- Following the outcome of the Topic AA RR discussion, the transaction log content may be extended, which may thus impact the [TS10] specification. 


## 8 References

| Reference                              | Description                                                  |
|----------------------------------------|--------------------------------------------------------------|
| [ARF_DevPlan]                          | Architecture and Reference Framework Development plan 2025, European Commission, v1.0 |
| [Topic 20]                             | [ARF Annex 2 Topic 20 - Strong User authentication for electronic payments](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/blob/main/docs/annexes/annex-2/annex-2.02-high-level-requirements-by-topic.md#a2320-topic-20---strong-user-authentication-for-electronic-payments) |
| [European Digital Identity Regulation] | [Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework](https://eur-lex.europa.eu/eli/reg/2024/1183/oj/eng) |
| [CIR 2024/2979]                      | [Commission Implementing Regulation (EU) 2024/2979 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the integrity and core functionalities of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2979/oj/eng)) |
| [CIR 2024/2981]                      | [Commission Implementing Regulation (EU) 2024/2981 of 28 November 2024 laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and the Council as regards the certification of European Digital Identity Wallets](https://eur-lex.europa.eu/eli/reg_impl/2024/2981/oj/eng) |
| [RiskRegister]                         | [Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft](https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=OJ:L_202402981#anx_I) |
| [OID4VP] | [OpenID for Verifiable Presentations](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/2) |
| [ISO/IEC - 18013-5]   |  [Mobile driving licence (mDL) application](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/issues/84) |
| [PSD2]   |  [Directive (EU) 2015/2366 of the European Parliament and of the Council of 25 November 2015 on payment services in the internal market, amending Directives 2002/65/EC, 2009/110/EC and 2013/36/EU and Regulation (EU) No 1093/2010, and repealing Directive 2007/64/EC](https://eur-lex.europa.eu/eli/dir/2015/2366/oj/eng) |
| [RTS SCA]   |  [Commission Delegated Regulation (EU) 2018/389 of 27 November 2017 supplementing Directive (EU) 2015/2366 of the European Parliament and of the Council with regard to regulatory technical standards for strong customer authentication and common and secure open standards of communication](https://eur-lex.europa.eu/eli/reg_del/2018/389/oj/eng) |
| [PSR Proposal]   |  [Proposal for a REGULATION OF THE EUROPEAN PARLIAMENT AND OF THE COUNCIL on payment services in the internal market and amending Regulation (EU) No 1093/2010](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex:52023PC0367) |
| [PSR Provisional Agreement] |  Provisional Agreement Resulting from  Interinstitutional Negotiations - Proposal for a regulation of the European Parliament and of the Council on payment services in the internal market and amending Regulation (EU) No 1093/2010 |
| [TS10] |  [Data Portability and Download (Export)](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts10-data-portability-and-download-(export).md)  |
| [TS12]   |  [Technical Specification 12 - Specification of Strong Customer Authentication (SCA) Implementation with the Wallet](https://github.com/eu-digital-identity-wallet/eudi-doc-standards-and-technical-specifications/blob/main/docs/technical-specifications/ts12-electronic-payments-SCA-implementation-with-wallet.md) |
| [PaSO]   |  [Payments and SCA for OpenID](https://aptitude-consortium.github.io/payments-and-sca-for-openid/latest/)  |
| [DPC]   |  [EMV Digital Payment Credential Specification – Schema Framework – v1.0 DRAFT 2](https://www.emvco.com/specifications/emv-digital-payment-credential-specification-schema-framework-v1-0-draft-associate-review-2-comment-period-ends-22-may-2026/)  |
| [SPC]   |  [Secure Payment Confirmation W3C Candidate Recommendation Draft, 2 July 2026](https://www.w3.org/TR/secure-payment-confirmation/)  |
|  EPC press release  |   https://www.europeanpaymentscouncil.eu/news-insights/news/epc-launches-scarlet-initiative-support-consistent-use-eu-digital-identity  |
