### Mapping Hints

**Note as these codes and their result values are emerging you will need to periodically re-check your mappings to make sure everything is being captured and mapped properly.**

To map lab data to the COVID ontology labs you will need to determine the following:
- Is the lab LOINC coded or not
- Is the lab test Antibody or Antigen
- Is the lab value Positive, Negative, Pending or Equivocal

If your Lab LOINC data exists in a reference table, scan the table for all COVID related tests.

A query like the following should find the list:

select * from *reference table* where *name* like '%COVID% OR  *name* like '%COV2% OR  *name* like '%SARS CORON%

If your Lab LOINC data does not exist in a reference table scan your lab result data with a query similar to the above.

Now you should have a list of your sites covid labs.


Now determine how the lab result values are represented. Execute a query similar to the one below over your lab_results table.
select distinct <result field> from *lab result table* where *lab* is in *list of covid labs*

You should see a list similar to the list below. These results need to be mapped to **Positive**, **Negative**, **Pending** and **Equivocal**.

- 0.02
- NONE DETECTED
- INCORRECT ORDER CODE RECEIVED, TEST REORDERED.
- WRONG TEST ORDERED
- SPECIMEN RECEIVED UNLABELED.
- NOT DECTED
- TEST NOT PERFORMED
- ABNORMAL
- SEE COMMENT
- DETECTED ABNORMAL
- DUP TEST STOPPED
- ORDERED IN ERROR
- PENDING
- INCONCLUSIVE
- TEST ORDER- - ED FOR THE WRONG TIME.
- NONE DETEC- TED H*
- NO DETECT- ED
- NOT DETEC- TED ,
--  N
- DETECTED
- NEG
- UNDETERMINED
- NEGATIVE
- SPECIMEN RECEIVED LEAKING/BROKEN.
- INVALID
- TEST RE-ORDERED DIFFERENT LAB
- NORMAL
- ORDERED IN ERROR BY LAB. PATIENT WILL NOT BE CHARGED.
- PATIENT REFUSED TESTING
- POSITIVE
- DUPLICATE ORDER.
- NOT DETECTED (PBG IS <6 MG/L)
- ORDERED INCORRECTLY BY LAB.
- REQUEST CREDITED
- COVID-19 DETECTED
-...

**LOINC Coded labs**
Any lab that is LOINC coded create an observation fact as you normally would.

**Example**
For EHR Fact 94500-6 Det

Create the following

| ENCOUNTER_NUM | PATIENT_NUM | CONCEPT_CD | PROVIDER_ID | START_DATE | END_DATE | MODIFIER_CD | INSTANCE_NUM | VALTYPE_CD | LOCATION_CD | TVAL_CHAR | NVAL_NUM | VALUEFLAG_CD | UNITS_CD |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| 123 | 234 | LOINC:94500-6 |  9999 | 03-MAR-20 |  | @ | 1 | T | 999 | Neg |  |  |  | 
| 123 | 234 | LOINC:94500-6 POSITIVE |  9999 | 03-MAR-20 |  | @ | 1 | T | 999 | Neg |  |  |  | 


You will also need to create a derived fact to represent a harmonized version of the lab value. This means

**NON-LOINC CODED Labs **

For any lab result that is not LOINC coded you will need to create a single fact. 
```
ANY Antibody Lab Test Equivocal	            ACT|LOCAL|LAB:ANY EQUIVOCAL ANTIBODY TEST
ANY Antibody Lab Test Negative	            ACT|LOCAL|LAB:ANY NEGATIVE ANTIBODY TEST
ANY Antibody Lab Test Pending               ACT|LOCAL|LAB:ANY PENDING ANTIBODY TEST
ANY Antibody Lab Test Positive	            ACT|LOCAL|LAB:ANY POSITIVE ANTIBODY TEST
ANY Nucleic Acid Lab Test Negative          UMLS:C1334932
ANY Nucleic Acid Lab Test Positive          UMLS:C1335447
ANY Nucleic Acid Lab Test Pending           UMLS:C1611271
ANY Nucleic Acid Lab Test Equivocal         UMLS:C4303880
```
**Example**
For EHR Fact COVID-19 PCR Test Neg

You create the following:

| ENCOUNTER_NUM | PATIENT_NUM | CONCEPT_CD | PROVIDER_ID | START_DATE | END_DATE | MODIFIER_CD | INSTANCE_NUM | VALTYPE_CD | LOCATION_CD | TVAL_CHAR | NVAL_NUM | VALUEFLAG_CD | UNITS_CD |
| ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- | ----------- |
| 123 | 234 | UMLS:C1334932 |  9999 | 03-MAR-20 |  | @ | 1 | T | 999 | Neg |  |  |  | 
