* This COVID Ontology update is additive. Do not delete anything from ACT_COVID or CONCEPT diimension tables.
* The data is in csv, and insert statement formats (oracle,sqlserver,postgres)
* Add the data from the ACT_COVID_i2b2_ORACLE, ACT_COVID_i2b2_POSTGRES,  ACT_COVID_i2b2_SQLSERVER or ACT_COVID_041520_i2b2.csv files into your ACT_COVID table in your i2b2 metadata schema. This ontology does not hide the Derived variables 
* Add the data from the ACT_COVID_CONCEPT_DIMENSION_APR15, ACT_COVID_ORACLE_CONCEPT_DIM, ACT_COVID_POSTGRES_CONCEPT_DIM or ACT_COVID_SQLSERVER_CONCEPT_DIM files into your i2b2 CONCEPT_DIMENSION table in your i2b2 CRC / Data schema
* Insert the data from ACT_COVID_shrine_ORACLE, ACT_COVID_shrine_POSTGRES,  ACT_COVID_shrine_SQLSERVER or ACT_COVID_041520_shrine.csv files into your ACT_COVID table in your shrine_ont schema. The Derived variables branch will be hidden.
* Replace AdapterMapping file in SHRINE installation. There are full AdapterMapping file and one with just the new elements in case you have a custon AdapterMapping file currently.
*Please let me know if you run into any problems -michele mim18@pitt.edu
