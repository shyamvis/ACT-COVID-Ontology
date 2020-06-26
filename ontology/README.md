
**ACT COVID Ontology v3.0**

The ACT COVID Ontology has been created to support cohort identification and related research. The ontology has been organized to do the following:
 
 1. Represent terms to support COVID that cannot be found in the existing ACT ontologies. This includes new diagnositic lab LOINCs for COVID-19 testing, COVID related medications that are not in our Medication hierarchies like Remdesivir, and procedures and diagnosis like ICD10CM U07.1 2019-nCOV Acute Respiratory Disease and ventilation related DRGs 475 & 576.  
2. Organize COVID related concepts regardless of domain into meaningful hierarchies. Example Mechanical Ventilation is represented by a collection of CPTs, ICD10CMs, ICD10PCS, and DRGs and  Level of Care Setting is represented with existing CPTs and Visit dimension elements. 
3. Create hierarchies that would allow user to more easily query for Course of Illness and disease severity. 
4. Add Total Patient Count to define the N of each node. This was initially required due to the varying types of datamarts on the Test Network, but should be helpful to users on the production network as well. This term may be promoted to the Demographics Ontology in the future.
5. Create ***Derived Fact*** placeholders. These terms are meant to hold non-standard terminology facts that will improve a site's ability to represent COVID patients. These facts can come from Notes, Flowsheets or elsewhere in your EHR. They may also be a combination of one or more facts within your EHR. Using the Derived terms will allow ACT to harmonize this type of data. Many of these facts use 'ACT|LOCAL' or 'UMLS' namespace/prefixes.

**Diagnostic Lab Tests**

Diagnositic Lab Tests are separated into Antibody and Nucleic Acid testing. This requires new mappings in your ETL. If you are upgrading from COVID-19 ontology version 2, the previous derived 'ANY' lab test will now only represent nucleic acid testing. Antibody tests should be map to the antibody codes (below). If you are mapping directly to the 'ANY Lab POSITIVE', etc You will need to determine if the tests you are mapping are nucleic acid tests or antibody tests. If you are mapping to specific LOINCs no additional mappings/edits will be necessary.

**Derived Diagnostic Lab Tests values are:**
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

**Ontology changes for V3**

The 4 derived values for Diagnostic Lab Tests (ANY Positive, ANY Negative, ANY Pending, ANY Equivocal) have been duplicated - one set of values for Nucleic Acid tests and another set of values for Antibody tests. This change requires *new* mappings. The existing derived ANY values currently represent only Diagnostic Lab Tests. Antibody tests should be mapped to a new set of ANY derived values (see below). If you are mapping directly to the 'ANY Positive', etc., you will need to determine if the tests you are mapping are Nucleic Acid tests or Antibody tests and remap. If you are mapping to specific LOINCs no change will be necessary. 


v3.0 Also includes the following general changes:
- Added severity of illness including 4CE codes (medications, labs, diagnosis and procedures)
- Augmented concepts with codes provided from feedback from the Data Harmonization Group members
- Added new LOINCs (that have been introduced as of 4 May, 2020)
- Fixed tooltip strings

Due to large file sizes the ontology data files are now contained in a zip file.  

---

***New Install***

1. Create ACT_COVID table using ACT_COVID.ddl or copy an existing ontology table from metadata schema.

    ```create table ACT_COVID as select * from NCATS_DEMOGRAPHICS where 1=0;```

2. Create ACT_COVID table using ACT_COVID.ddl or copy an existing ontology table from shrine_ont schema.

    ```create table ACT_COVID as select * from NCATS_DEMOGRAPHICS where 1=0;```

3. Load ACT_COVID table in the i2b2 metadata schema using files contained in the ACT_COVID_V3.zip. Use either ACT_COVID_i2b2_&lt;rdb&gt;.sql or ACT_COVID_V3.dsv (pipe-delimited, everything quoted) file. (The second file ACT_COVID_V3D.dsv contains an extra column HPDS_PATH for sites that may be also supporting an HPDS instance.)
4. Insert ACT_COVID reference into TABLE_ACCESS using ACT_COVID_TABLE_ACCESS.csv.
5. Repeat Steps 3 and 4 for the shrine_ont schema.
6. Add rows to CONCEPT_DIMENSION table (in CRC schema) from your i2b2 metadata schema ACT_COVID table using:

    1. _For Oracle/PostgreSQL..._
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
    2. _For SQL Server..._ (SQL Server may not recognize the `VARCHAR2` datatype nor the `trim()` function)
    ```
    INSERT into crcdata.dbo.CONCEPT_DIMENSION
    SELECT 
      c_fullname concept_path, c_basecode concept_cd, 
      c_name name_char, CAST( NULL AS VARCHAR(50) ) concept_blob, 
      CURRENT_TIMESTAMP update_date, CURRENT_TIMESTAMP download_date, 
      CURRENT_TIMESTAMP import_date, sourcesystem_cd, 20200531 upload_id
    FROM metadata.dbo.ACT_COVID 
    WHERE c_synonym_cd = 'N' and c_basecode is not null 
      and c_dimcode is not null and RTRIM(LTRIM(lower(c_tablename))) = 'concept_dimension';
    ```

7. Install new `AdapterMappingCovidAllJun1.csv` file in `/opt/shrine/tomcat/lib`, making sure filename matches the name referenced in shrine.conf:
  
    ```adapterMappingsFileName = "AdapterMappingCovidAllJun1.csv"```

8. Review indexes on ACT_COVID and CONCEPT_DIMENSION tables.
9. Restart SHRINE.
 
---

***Update Install***

1. Truncate table ACT_COVID in i2b2 metadata schema.
2. Truncate table ACT_COVID in shrine_ont schema.
3. Delete COVID ontology elements from CONCEPT_DIMENSION table in the i2b2 CRC schema.

    ```delete from concept_dimension where concept_path like '\ACT\UMLS_C0031437\%';```

4. Load ACT_COVID table in the i2b2 metadata schema using files contained in the ACT_COVID_V3.zip. Use either ACT_COVID_i2b2_&lt;rdb&gt;.sql or ACT_COVID_V3.dsv (pipe-delimited, everything quoted) file. (The second file ACT_COVID_V3D.dsv contains an extra column HPDS_PATH for sites that may be also supporting an HPDS instance.)
5. Repeat Step 4 for the shrine_ont schema.
6. Add rows to CONCEPT_DIMENSION table (in CRC schema) from your i2b2 metadata schema ACT_COVID table using:

    1. _For Oracle/PostgreSQL..._
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
    2. _For SQL Server..._ (SQL Server may not recognize the `VARCHAR2` datatype nor the `trim()` function)
    ```
    INSERT into crcdata.dbo.CONCEPT_DIMENSION
    SELECT 
      c_fullname concept_path, c_basecode concept_cd, 
      c_name name_char, CAST( NULL AS VARCHAR(50) ) concept_blob, 
      CURRENT_TIMESTAMP update_date, CURRENT_TIMESTAMP download_date, 
      CURRENT_TIMESTAMP import_date, sourcesystem_cd, 20200531 upload_id
    FROM metadata.dbo.ACT_COVID 
    WHERE c_synonym_cd = 'N' and c_basecode is not null 
      and c_dimcode is not null and RTRIM(LTRIM(lower(c_tablename))) = 'concept_dimension';
    ```

7. Install new `AdapterMappingCovidAllJun1.csv` file in `/opt/shrine/tomcat/lib`, making sure filename matches the name referenced in shrine.conf:
  
    ```adapterMappingsFileName = "AdapterMappingCovidAllJun1.csv"```

8. Review indexes on ACT_COVID and CONCEPT_DIMENSION tables.
9. Restart SHRINE.


For any publications or any intellectual property derived from use of the ACT Network please cite the NCATS ACT grant: "This work was supported by the National Center for Advancing Translational Sciences of the National Institutes of Health under grant numbers UL1 TR000005."

