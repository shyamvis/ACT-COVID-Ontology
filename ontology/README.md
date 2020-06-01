
**ACT COVID v3.0**

**Major Ontology Restructuring**

Diagnositic Lab Tests have been separated into Antibody and Nucleic Acid testing. This change requires *new* mappings. The existing derived 'ANY' lab tesst will now only represent nucleic acid testing. Antibody tests should be map to new codes (below).  If you are mapping directly to the 'ANY Lab POSITIVE', etc You will need to determine if the tests you are mapping are nucleic acid tests or antibody tests and remap. If you are mapping to specific LOINCs no change will be necessary. 

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
```

v3.0 Also includes the following general changes:
- Added severity of illness including 4CE codes (medications, labs, diagnosis and procedures)
- Augmented concepts using codes recommended by ACT COVID
- Added new LOINCs (as of May 4,2020)
- Fixed tooltips

Due to file size the ontology data files are now contained in a zip file.  

---

***New Install***

1. Create ACT_COVID table using ACT_COVID.ddl or copy an existing ontology table from metadata schema

```create table ACT_COVID as select * from NCATS_DEMOGRAPHICS where 1=0;```

2. Load ACT_COVID table using ACT_COVID_i2b2_<rdb>.sql or ACT_COVID_V3.dsv (pipe delimited everything quoted) file
3. Insert ACT_COVID reference into TABLE_ACCESS using ACT_COVID_TABLE_ACCESS.csv
4. Add rows to CONCEPT_DIMENSION table (in CRC schema) using:
```
INSERT into CONCEPT_DIMENSION
SELECT 
  c_fullname concept_path, c_basecode concept_cd, 
  c_name name_char, CAST( NULL AS VARCHAR2(50) ) concept_blob, 
  CURRENT_TIMESTAMP update_date, CURRENT_TIMESTAMP download_date, 
  CURRENT_TIMESTAMP import_date, sourcesystem_cd, 20200531 upload_id
FROM ACT_COVID 
WHERE c_synonym_cd = 'N' and c_basecode is not null 
  and c_dimcode is not null and trim(lower(c_tablename)) = 'concept_dimension'
```
5. Install new AdapterMappingCovidAllMay31.csv file in /opt/shrine/tomcat/lib make sure filename matches the name referenced in shrine.conf
  
  ```adapterMappingsFileName = "AdapterMappingCovidAllMay31.csv"```
  
---

***Update Install***

1. Truncate table ACT_COVID in i2b2 metadata schema
2. Truncate table ACT_COVID in shrine_ont schema
3. Delete COVID ontology elements from CONCEPT_DIMENSION table in the i2b2 CRC schema

```delete from concept_dimension where concept_path like '\ACT\UMLS_C0031437\%';```

4. Load ACT_COVID table using ACT_COVID_i2b2_<rdb>.sql or ACT_COVID_V3.dsv (pipe delimited everything quoted) file
5. Add rows to CONCEPT_DIMENSION table (in CRC schema):

```
INSERT into CONCEPT_DIMENSION
SELECT 
  c_fullname concept_path, c_basecode concept_cd, 
  c_name name_char, CAST( NULL AS VARCHAR2(50) ) concept_blob, 
  CURRENT_TIMESTAMP update_date, CURRENT_TIMESTAMP download_date, 
  CURRENT_TIMESTAMP import_date, sourcesystem_cd, 20200531 upload_id
FROM ACT_COVID 
WHERE c_synonym_cd = 'N' and c_basecode is not null 
  and c_dimcode is not null and trim(lower(c_tablename)) = 'concept_dimension'
```
6. Install new AdapterMappingCovidAllMay31.csv file in /opt/shrine/tomcat/lib make sure filename matches the name referenced in shrine.conf
  
  ```adapterMappingsFileName = "AdapterMappingCovidAllMay31.csv"```





Any Intellectual Property derived from use of the ACT Network please cite the NCATS ACT grant: “This project was supported by the National Institutes of Health through grant UL1TR000005.” 

