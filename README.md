# MedCoin Authorization Contract
## Overview
EHR(Electronic Health Records) was never intended to manage and preserve the complications of cross-institutional and lifelong medical records: Medical information for a patient comes from a variety of places, and different pieces of that information must be put together for clinicians to make efficient healthcare decisions. Because of storage constraints, EHRs frequently store health data at a single location for a few years rather than keeping all-time records for patients. EHR systems used by different hospitals are frequently incompatible. Patients who seek medical treatment at several locations must frequently retype their personal information and request data transfers across these health providers, and they encounter considerable issues accessing their reports, correcting incorrect information, and authorizing medical data. <br />
<br />
Another concern in this area is the permission of medical records. To regulate the health industry, patient data protection procedure protocols such as HIPAA and EPHI were established, and different medical information sources have distinct authorization requirements that must be met before patient data can be shared with someone else. Sensitive data, such as the patient's gender, name, residence, zip code, and age, should not be leaked to a third party without authority; similarly, generally non-sensitive medical data should be examined with caution. No information can simply be aired or made available to the general public. Often, a physician will have all of the information they require, as well as others that they may not be aware of but are necessary to care for. <br />
<br />
We propose to implement the authorization smart contracts for EHR-related medical blockchains. This auditing layer of medical blockchain has featured a security design that would prevent data breaches in the medical records and separate sensitive data from non-sensitive data: We separate sensitive and non-sensitive data when patients log their medical information and we would show legal statements (HIPAA, EPHI) to notify the patients when they are authorizing their private data to a third party. Then, the smart contracts would allow different levels of authorization of access to data. The smart contracts would also allow for the protection of private data while delivering useful medical data to health providers and doctors. 
<br /><br />
This authorization contract would therefore provide the medical record requesters(doctors, researchers, providers) with stratified access to medical information for research use, clinical use, or kept private; Patients could choose different authorization levels for people to access their medical records enabling a distributed system that provides layered and use for info users and info providers. This authorization smart contract would be the core construct in our medical data encryption, authorization stratification, and medical records transfer aggregation pipeline.
<br /><br />

## Contributors
Yifei Wang and Ruiwei Wan

## Directory Structure
<pre>
├── README.md
├── notebooks/
│   ├── MedCoin White Paper.pdf
│   └── report.pdf
├── references/
│   └── README.md
├── report.pdf
└── src/
    ├── smart contract/
    │   ├── Patient_Registry.sol
    │   └── Relationship_Management.sol
    └── test/
        ├── Patient_Registry_Test.sol
        └── Relationship_Management_Test.sol
</pre>

## Data Use Explanation
Since our project is not concerned with data ingestion and preprocessing,
we are only concerned with authorization application in the smart contract,
we therefore does not include the data in the data part.
For testing purposes, we only rely on remix website, which is https://remix.ethereum.org/, 
because implementing blockchain infrastructure would take months or even years.
So if our test solidity file and smart contract solidity files were put on the remix and use the test resources there,
it would suffice the testing purpose of our contract.

## Docker Use Explanation
We also will not use docker, because it is hard to deploy docker for bloakchain project.

## Testing website
For testing purposes, we only rely on remix website, which is https://remix.ethereum.org/

First we should download the solidity files in the src folder:

- `Patient_Registry.sol`: the contract which is in charge of register new patients for authorization
- `Relationship_Management.sol`: the contract which manages the authorization pairs of patients and third parties
- `Patient_Registry_Test.sol`: the test contract for Patient_Registry.sol
- `Relationship_Management_Test.sol`: the test contract for Relationship_Management.sol

Then we put the source files and test files onto remix website(https://remix.ethereum.org/) to test. 
We also connected to MetaMask Ropsten testnetwork, however, due to the limitations of blockchain infrastructure, our project stops here.

## Project Report
We also include the Project report in the notebook folder.
Our project website is: https://ellawan.github.io/.  
