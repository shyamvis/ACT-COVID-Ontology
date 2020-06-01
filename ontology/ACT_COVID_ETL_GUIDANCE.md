# ACT COVI19 Ontology ETL Guidance (in process)
## Diagnosis
No special instructions. See COVID19Codes.xsls for codes of interest

## Lab Orders
No special instructions. See COVID19Codes.xsls codes of interest.

## Lab Results
Due to the emergent nature of this ontology we are asking sites to map both raw facts and several derived facts to support harmonized querying within the network.

If your site is using any of the LOINC codes in COVID19Codes.xsls, please create two separate facts 
1) a fact using the LOINC code with raw value as you would normally 
2) a fact that translates the lab result into one of four possible values (Negative, Positive, Equivocal, Pending) 

Example: Raw EHR Lab Fact Lab: LOINC 94309-2 DETEC
Maps to the following OBSERVATION_FACT
concept_cd, value_type_cd, tval_char, nval_num, valueflag_cd, units_cd 
LOINC:94309-2,T,DETEC,,,
LOINC:94309-2 POSITIVE,T,DETEC,,,

If your site does not use any of the LOINC codes in COVID19Codes.xsls please map patient COVID status using the eight derived lab result facts (ANY Negative, ANY Positive, ANY Equivocal, ANY Pending).This information can come from local codes, extraction from patient notes, etc. 

Diagnositic Lab Tests have been separated into Antibody and Nucleic Acid testing. This change requires *new* mappings. The existing derived 'ANY' lab test will now only represent nucleic acid testing. Antibody tests should be map to new codes (below).  If you are mapping directly to the 'ANY Lab POSITIVE', etc You will need to determine if the tests you are mapping are nucleic acid tests or antibody tests and remap. If you are mapping to specific LOINCs no change will be necessary. 

**New codes are:**
```
ANY Antibody Lab Test Equivocal	            ACT|LOCAL|LAB:ANY EQUIVOCAL ANTIBODY TEST
ANY Antibody Lab Test Negative	            ACT|LOCAL|LAB:ANY NEGATIVE ANTIBODY TEST
ANY Antibody Lab Test Pending               ACT|LOCAL|LAB:ANY PENDING ANTIBODY TEST
ANY Antibody Lab Test Positive	            ACT|LOCAL|LAB:ANY POSITIVE ANTIBODY TEST
ANY Nucleic Acid Lab Test Negative          UMLS:C1334932
ANY Nucleic Acid Lab Test Positive          UMLS:C1335447
ANY Nucleic Acid Lab Test Pending           UMLS:C1611271
ANY Nucleic Acid Lab Test Equivocal         UMLS:C4303880

Example for patients with a positive diagnosis:
concept_cd, value_type_cd, tval_char, nval_num, valueflag_cd, units_cd 
UMLS:C1335447,T,Local Code,,,

## Medications
The valid mappings for COVID-19 Related medications can be found in COVID19Codes.xsls. Several meds already exist in the ACT Ontology. These meds can be queried from either location. Some do not have RxNorm codes that exist in the current ACT Ontology. These medications will be assigned to a ingredient level ATC code. If no ATC code exists, as is the case for Remdesivir an ACT Local code has been created. 

