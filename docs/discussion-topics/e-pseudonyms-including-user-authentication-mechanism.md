# E - Pseudonyms, including User authentication mechanism

## 1 Introduction 

### 1.1 Discussion Paper Topic Description 
This document is the Discussion Paper for eIDAS Coordination Group regarding Topic E: Pseudonyms, including User authentication mechanism.
The ARF Development Plan [ARF_DevPlan] describes this Topic as follows:

*High-level requirements for pseudonyms in the ARF need to be further detailed, including
specifying the use cases where pseudonyms should be applied.*


### 1.2 Legal Requirements for Pseudonyms

There are three sources that impose requirements on the pseudonym functionality of the EUDIWs: [CIR.2024.2979], [CIR.2024.2981], and [REG.2024.1183]. Below we recap the respective legal requirements from these sources. 

#### 1.2.1 [eIDAS 2.0] about Pseudonyms
There are two main requirements in [eIDAS 2.0] about Pseudonyms in relation to EUDIWs: 
EUDIWs must be able to generate pseudonyms and store them encrypted. 
Relying parties must accept identification via pseudonyms when there are no legal requirements for identification.  

Below are the actual excerpts from the law including the recitals that establishes these requirements. 

**Recital (19)**

*... Reliance on the legal identity should not hinder European Digital Identity Wallet users to access services under a pseudonym, where there is no legal requirement for legal identity for authentication. ...* 

**Recital (22)**

*European Digital Identity Wallets should include a functionality to generate user-chosen and managed pseudonyms, to authenticate when accessing online services.*

**Recital (57)**

*Where very large online platforms within the meaning of Article 33(1) of Regulation (EU) 2022/2065 of the European Parliament and of the Council require users to be authenticated in order to access online services, those platforms should be required to accept the use of European Digital Identity Wallets upon the voluntary request of the user. Users should be under no obligation to use a European Digital Identity Wallet to access private services and should not be restricted or hindered in their access to services on the grounds that they do not use a European Digital Identity Wallet. However, if users wish to do so, very large online platforms should accept them for that purpose, while respecting the principle of data minimisation and the right of the users to use freely chosen pseudonyms. ...*

**Recital (60)**

*Unless specific rules of Union or national law require users to identify themselves, accessing services by using a pseudonym should not be prohibited.*

**Article 5 Pseudonyms in electronic transaction**

*Without prejudice to specific rules of Union or national law requiring users to identify themselves or to the legal effect given to pseudonyms under national law, the use of pseudonyms that are chosen by the user shall not be prohibited.*

**Article 5a European Digital Identity Wallets**

*... 4.  European Digital Identity Wallets shall enable the user, in a manner that is user-friendly, transparent, and traceable by the user, to:\
...\
(b)\
generate pseudonyms and store them encrypted and locally within the European Digital Identity Wallet;\
...*

**Article 5b European Digital Identity Wallet-Relying Parties**

*9. ... Relying parties shall not refuse the use of pseudonyms, where the identification of the user is not required by Union or national law. ...*


#### 1.2.2 [CIR.2024.2979] about Pseudonyms 

**Recital (14)**

*The generation of wallet-relying party specific pseudonyms should enable wallet users to authenticate themselves without providing wallet-relying parties with unnecessary information. As set out in Regulation (EU) No 910/2014, wallet users are not to be hindered from accessing services under a pseudonym, where there is no legal requirement for legal identity for authentication. Therefore, the wallets are to include a functionality to generate user-chosen and
managed pseudonyms, to authenticate when accessing online services. The implementation of the specifications set out in Annex V should enable these functionalities accordingly. Further, wallet-relying parties are not to request users to provide any data other than those indicated for the intended use of wallets in the relying party register. Wallet users should be enabled to verify the registration data of relying parties at any point in time.*

**Article 14**

*1. Wallet units shall support the generation of pseudonyms for wallet users in compliance with the technical specifications set out in Annex V.\
2. Wallet units shall support the generation, upon the request of a wallet-relying party, of a pseudonym which is specific and unique to that wallet-relying party and provide this pseudonym to the wallet-relying party, either standalone or in combination with any person identification data or electronic attribute attestation requested by that wallet-relying party.\
*

**Annex V:**
*TECHNICAL SPECIFICATIONS FOR PSEUDONYM GENERATION REFERRED TO IN ARTICLE 14\
\
Technical specifications:\
\
— WebAuthn – W3C Recommendation, 8 April 2021, Level 2, https://www.w3.org/TR/2021/REC-webauthn-2-20210408/.
*
### 1.3 Key Words

### 1.4 Document Structure

## 2 High Level Approach to Pseudonyms

## 3 Use Cases 

## 4 Relation to Other Topics 

### 4.1 Privacy Risks and Mitigations

### 4.2 Wallet Unit Attestations 

### 4.3 Relation to Risk Register 

## 5 Additions and Changes to the ARF

## 6 References 

| Reference      | Description                                                                                                                                                                                                                                                                          |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [WebAuthN]     | Web Authentication: An API for accessing Public Key Credentials Level 2 W3C Recommendation, 8 April 2021, https://www.w3.org/TR/webauthn-2/                                                                                                                                          |
| [ARF_DevPlan]  | Architecture and Reference Framework Development plan 2025, European Commission, v1,0.                                                                                                                                                                                               |
| [RiskRegister] | Annex 1 to the Commission Implementing Regulation laying down rules for the application of Regulation (EU) No 910/2014 of the European Parliament and of the Council as regards the certification of the European Digital Identity Wallets, European Commission, October 2024, draft |
| [eIDAS 2.0]    | Regulation (EU) 2024/1183 of the European Parliament and of the Council of 11 April 2024 amending Regulation (EU) No 910/2014 as regards establishing the European Digital Identity Framework                                                                                        |
|                |                                                                                                                                                                                                                                                                                      |
