## Existing codes

### CDC coding guidelines for coding with existing ICD-10 codes
* **Pneumonia confirmed as due to COVID-19:** J12.89 Other viral pneumonia & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **Lower respiratory infection due to COVID-19:** J22 Unspecified acute lower respiratory infection & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **Respiratory infection due to COVID-19:** J98.8 Other specified respiratory disorders & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **Acute Bronchitis confirmed as due to COVID-19:** J20.8 Acute bronchitis due to other specified organisms & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **Bronchitis not otherwise specified (NOS) due to the COVID-19:** J40 Bronchitis, not specified as acute or chronic & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **Acute respiratory distress syndrome (ARDS) due to COVID-19:** J80, Acute respiratory distress syndrome & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **An actual exposure to someone who is confirmed to have COVID-19:** Z20.828 Contact with and (suspected) exposure to other viral communicable diseases & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **Concern about a possible exposure to COVID-19, but this is ruled out after evaluation:** Z03.818 Encounter for observation for suspected exposure to other biological agents ruled out & B97.29 Other coronavirus as the cause of diseases classified elsewhere
* **Signs/symptoms (such as fever, etc.) but definitive diagnosis has not been established:** R05 Cough, R06.02 Shortness of breath, R50.9 Fever, unspecified
* Diagnosis code B34.2, Coronavirus infection, unspecified, would generally not be appropriate for COVID-19
* See https://www.cdc.gov/nchs/data/icd/ICD-10-CM-Official-Coding-Gudance-Interim-Advice-coronavirus-feb-20-2020.pdf
* See https://www.hca.wa.gov/assets/billers-and-providers/billing-for-COVID-CPC-03-2020.pdf

### Queries using existing ICD-10 codes (broken down by day)
* **Count 1 for potential COVID-19:** J12.89 OR J22 OR J98.8 OR J20.8 OR J40 OR J80 OR Z20.828
* **Count 2 for signs/symptoms indicative of COVID-19:** R05 OR R06.02 OR R50.9
* **Count 3 for confirmed COVID-19:** (J12.89 & B97.29) OR (J22 & B97.29) OR (J98.8 & B97.29) OR (J20.8 & B97.29) OR (J40 & B97.29) OR (J80 & B97.29) OR (Z20.828 & B97.29)



## New codes

### ICD-10 for diagnosis recording
* An emergency ICD-10 code of U07.1 is assigned to the disease diagnosis of COVID-19
* See https://www.who.int/classifications/icd/covid19/en/

### HCPCS
* U0001 for CDC testing laboratories to test patients for SARS-CoV-2
* U0002 for non-CDC laboratory tests for SARS-CoV-2/2019-nCoV (COVID-19)
* Take effect by April 1, however retroactive claims will be accepted from February 4th forward.
* See https://www.cms.gov/newsroom/press-releases/cms-develops-additional-code-coronavirus-lab-tests

### LOINC for assay identification
* The following are pre-release and may change in the actual release. See https://loinc.org/prerelease/
* Orderable panel: 2019 Novel Coronavirus RNA panel – Unspecified specimen by NAA with probe detection (NAA= nucleic acid amplification (LOINC code 94306-8). This panel includes the following components
  * 2019 Novel Coronavirus N Gene:PrThr:Pt:XXX:Ord:Probe.amp.tar.primer-probe set N1 (LOINC code 94307-6)
  * 2019 Novel Coronavirus N gene:PrThr:Pt:XXX:Ord:Probe.amp.tar.primer-probe set N2 (LOINC code 94308-4)
  * 2019 Novel Coronavirus RNA:Imp:Pt:XXX:Ord:Probe.amp.tar (LOINC code 94309-2)
  * SARS-like Coronavirus N gene:PrThr:Pt:XXX:Ord:Probe.amp.tar (LOINC code 94310-0)
  * 2019 Novel Coronavirus N gene:ThreshNum:Pt:XXX:Qn:Probe.amp.tar.preimer-probe set N1 (LOINC code 94311-8)
  * 2019 Novel Coronavirus N gene:ThreshNum:Pt:XXX:Qn:Probe.amp.tar.preimer-probe set N2 (LOINC code 94312-6)
  * SARS-like Coronavirus N gene:ThreshNum:Pt:XXX:Qn:Probe.amp.tar (LOINC code 94313-4)
  * 2019 Novel Coronavirus RdRp gene:PrThr:Pt:XXX:ord:Probe.amp.tar (LOINC code 94314-2)
  * 2019 Novel Coronavirus N gene:PrThr:Pt:XXX:ord:Probe.amp.tar (LOINC code 94316-7)
  * 2019 Novel Coronavirus E gene:PrThr:Pt:XXX:ord:Probe.amp.tar (LOINC code 94315-9)

### SNOMED CT for the microorganism entities
* March 2020 release contains relevant COVID-19 concepts (24 records)
* See http://www.snomed.org/news-and-events/articles/march-2020-interim-snomedct-release-COVID-19

### Queries using new codes (broken down by day)
* Count of patients with:
* ICD-10 U07.1 OR 
* OR HCPCS U0001 OR U0002 
* OR LOINC 94306-8 (lab orders)
* OR LOINC 94307-6 OR 94308-4 OR 94309-2 OR 94310-0 OR 94311-8 OR 94312-6 OR 94313-4 OR 94314-2 OR 94316-7 OR 94315-9
