* Create tables for COVID ontology in i2b2 metadata schema and in the SHRINE_ONT schema. Use ACT_COVID.ddl
* Import covid ontology into both new ACT_COVID ontology tables using the ACT_COVID_032320.csv file. The delimiter is a semi-colon (;).
* Import new table access row in both i2b2_metadata schema and in the SHRINE_ONT schema. Use ACT_COVID_TABLE_ACCESS.csv
* Import new concepts to your concept_dimension table using ACT_COVID_CONCEPT_DIMENSION.csv. The delimiter is a semi-colon (;). 
* Modifiy this file as necessary to map local terms to the ACT COVID Ontology.
* Update SHRINE AdapterMapping file. Included (coming soon) are complete AdapterMappingCovidAll.csv 
and an AdapterMappingCovidOnly.csv - for people who have custom AdapterMapping files.

* Email me if you have any problems. Michele mim18@pitt.edu
