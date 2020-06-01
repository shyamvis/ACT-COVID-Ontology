
**ACT COVID Ontology v3.0**

**Major Ontology Restructuring**

The 4 derived values for Diagnostic Lab Tests (ANY Positive, ANY Negative, ANY Pending, ANY Equivocal) have been duplicated - one set of values for Nucleic Acid tests and another set of values for Antibody tests. This change requires *new* mappings. The existing derived ANY values currently represent only Diagnostic Lab Tests. Antibody tests should be mapped to a new set of ANY derived values (see below). If you are mapping directly to the 'ANY Positive', etc., you will need to determine if the tests you are mapping are Nucleic Acid tests or Antibody tests and remap. If you are mapping to specific LOINCs no change will be necessary. 

**New derived Diagnostic Lab Tests values are:**
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
- Augmented concepts with codes provided from feedback from the Data Harmonization Group members
- Added new LOINCs (that have been introduced as of 4 May, 2020)
- Fixed tooltip strings

Due to large file sizes the ontology data files are now contained in a zip file.  

---

***New Install***

1. Create ACT_COVID table using ACT_COVID.ddl or copy an existing ontology table from metadata schema

```create table ACT_COVID as select * from NCATS_DEMOGRAPHICS where 1=0;```

2. Create ACT_COVID table using ACT_COVID.ddl or copy an existing ontology table from shrine_ont schema

```create table ACT_COVID as select * from NCATS_DEMOGRAPHICS where 1=0;```

3. Load ACT_COVID table usingfiles contained in the ACT_COVID_V3.zip. Use either ACT_COVID_i2b2_<rdb>.sql or ACT_COVID_V3.dsv (pipe delimited everything quoted) file.
4. Insert ACT_COVID reference into TABLE_ACCESS using ACT_COVID_TABLE_ACCESS.csv
5. Add rows to CONCEPT_DIMENSION table (in CRC schema) using:

```
INSERT into CONCEPT_DIMENSION
SELECT 
  c_fullname concept_path, c_basecode concept_cd, 
  c_name name_char, CAST( NULL AS VARCHAR2(50) ) concept_blob, 
  CURRENT_TIMESTAMP update_date, CURRENT_TIMESTAMP download_date, 
  CURRENT_TIMESTAMP import_date, sourcesystem_cd, 20200531 upload_id
FROM ACT_COVID 
WHERE c_synonym_cd = 'N' and c_basecode is not null 
  and c_dimcode is not null and trim(lower(c_tablename)) = 'concept_dimension';
```
6. Install new AdapterMappingCovidAllMay31.csv file in /opt/shrine/tomcat/lib make sure filename matches the name referenced in shrine.conf
  
  ```adapterMappingsFileName = "AdapterMappingCovidAllMay31.csv"```
 
 7. Review indexes on ACT_COVID and CONCEPT_DIMENSION tables.
 8. Restart SHRINE
 
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

7. Review indexes on ACT_COVID and CONCEPT_DIMENSION tables.
8. Restart SHRINE


For any publications or any intellectual property derived from use of the ACT Network please cite the NCATS ACT grant: “This work was supported by the National Center for Advancing Translational Sciences of the National Institutes of Health under grant numbers UL1 TR000005."

