### Queries using existing ICD-10 codes (broken down by day)
* See https://github.com/shyamvis/covid-phenotyping/edit/master/codes.md
* **Count 1 for potential COVID-19:** J12.89 OR J22 OR J98.8 OR J20.8 OR J40 OR J80 OR Z20.828
* **Count 2 for signs/symptoms indicative of COVID-19:** R05 OR R06.02 OR R50.9
* **Count 3 for confirmed COVID-19:** (J12.89 & B97.29) OR (J22 & B97.29) OR (J98.8 & B97.29) OR (J20.8 & B97.29) OR (J40 & B97.29) OR (J80 & B97.29) OR (Z20.828 & B97.29)

### Queries using new codes (broken down by day)
* See https://github.com/shyamvis/covid-phenotyping/edit/master/codes.md
* Count of patients with:
  * ICD-10 U07.1 OR 
  * OR HCPCS U0001 OR U0002 
  * OR LOINC 94306-8 (lab orders)
  * OR LOINC 94307-6 OR 94308-4 OR 94309-2 OR 94310-0 OR 94311-8 OR 94312-6 OR 94313-4 OR 94314-2 OR 94316-7 OR 94315-9

### Other queries
* Search for string %covid% OR %corona% in lab component name
* Search for string %covid% OR %corona% in chief complaints
