
1. Create ACT_COVID table using ACT_COVID.ddl or copy an existing ontology table from metadata schema

create table ACT_COVID as select * from NCATS_DEMOGRAPHICS where 1=0;

2. Load ACT_COVID table using ACT_COVID_i2b2_rdb.sql or ACT_COVID_i2b2.dsv (pipe delimited everything quoted) file
3. Insert ACT_COVID reference into TABLE_ACCESS using ACT_COVID_TABLE_ACCESS.csv
4. Add rows to CONCEPT_DIMENSION table (in CRC schema) using:

INSERT into CONCEPT_DIMENSION
SELECT c_fullname concept_path, to_char(c_basecode) concept_cd, c_name name_char, CAST( NULL AS VARCHAR2(50) ) concept_blob, sysdate update_date, sysdate download_date, sysdate import_date, 'ACT' sourcesystem_cd, 20200501 upload_id
from ACT_COVID where c_synonym_cd = 'N' and c_basecode is not null and c_dimcode is not null and trim(lower(c_tablename)) = 'concept_dimension'
