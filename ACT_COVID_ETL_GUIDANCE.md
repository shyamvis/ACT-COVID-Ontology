# ACT COVI19 Ontology ETL Guidance (in process)
## Diagnosis
No special instructions
Codes of interest:


## Lab Orders
No special instructions
Codes of interest:


## Lab Results
Due to the emergent nature of this ontology we are asking sites to map both raw facts and several derived facts to support harmonized querying within the network.

If your site is using any of the LOINC codes below, please create three separate facts 
1) a fact using the LOINC code with raw value as you would normally 
2) a fact that translates the lab result into one of four possible values (Negative, Positive, Equivocal, Pending) 
3) a corresponding high level derived fact also mapped to one of four possible values (Negative, Positive, Equivocal, Pending)  

Example: Raw EHR Lab Fact Lab: LOINC 94309-2 DETEC
Maps to the following OBSERVATION_FACT
concept_cd, value_type_cd, tval_char, nval_num, valueflag_cd, units_cd 
LOINC:94309-2,T,DETEC,,,
LOINC:94309-2 POSITIVE,T,DETEC,,,
UMLS:C1444714,T,DETEC,,,

If your site does not use any of the below LOINC codes please map patient COVID status using the four derived lab result facts (ANY Negative, ANY Positive, ANY Equivocal, ANY Pending).This information can come from local codes, extraction from patient notes, etc. 

Example for patients with a positive diagnosis:
concept_cd, value_type_cd, tval_char, nval_num, valueflag_cd, units_cd 
UMLS:C1444714,T,Local Code,,,

Codes of Interest:



## Medications
Below are the valid mappings for COVID-19 Related medications. Several Meds already exist in the ACT Ontology. These meds can be queried from either location. Some do not have RxNorm codes that exist in the current ACT Ontology. These medications will be assigned to a ingredient level ATC code. If no ATC code exists, as is the case for Remdesivir and ACT Local code has been created.  

Codes of Interest:

