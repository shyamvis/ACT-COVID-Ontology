/*
ACT COVID19 MART

Created 3/24/2020
*/

USE ACT_COVID19_Mart

----------------------------------------------------------------------------------------------------------------------------------------------------
--TABLE_ACCESS
----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[ACT_COVID_TABLE_ACCESS](
	[C_TABLE_CD] [nvarchar](50) NOT NULL,
	[C_TABLE_NAME] [varchar](50) NOT NULL,
	[C_PROTECTED_ACCESS] [char](1) NULL,
	[C_HLEVEL] [int] NOT NULL,
	[C_FULLNAME] [varchar](700) NOT NULL,
	[C_NAME] [varchar](2000) NOT NULL,
	[C_SYNONYM_CD] [char](1) NOT NULL,
	[C_VISUALATTRIBUTES] [char](3) NOT NULL,
	[C_TOTALNUM] [int] NULL,
	[C_BASECODE] [varchar](50) NULL,
	[C_METADATAXML] [varchar](max) NULL,
	[C_FACTTABLECOLUMN] [varchar](50) NOT NULL,
	[C_DIMTABLENAME] [varchar](50) NOT NULL,
	[C_COLUMNNAME] [varchar](50) NOT NULL,
	[C_COLUMNDATATYPE] [varchar](50) NOT NULL,
	[C_OPERATOR] [varchar](10) NOT NULL,
	[C_DIMCODE] [varchar](700) NOT NULL,
	[C_COMMENT] [varchar](max) NULL,
	[C_TOOLTIP] [varchar](900) NULL,
	[C_ENTRY_DATE] [datetime] NULL,
	[C_CHANGE_DATE] [datetime] NULL,
	[C_STATUS_CD] [char](1) NULL,
	[VALUETYPE_CD] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--Populate Table Access
INSERT INTO ACT_COVID_TABLE_ACCESS (
	C_TABLE_CD,C_TABLE_NAME,C_PROTECTED_ACCESS,C_HLEVEL,C_FULLNAME,C_NAME,C_SYNONYM_CD,C_VISUALATTRIBUTES,C_TOTALNUM,C_BASECODE,C_METADATAXML,C_FACTTABLECOLUMN,C_DIMTABLENAME,C_COLUMNNAME,C_COLUMNDATATYPE,C_OPERATOR,C_DIMCODE,C_COMMENT,C_TOOLTIP,C_ENTRY_DATE,C_CHANGE_DATE,C_STATUS_CD,VALUETYPE_CD
	)
VALUES(
	'ACT_COVID_V1','ACT_COVID','N',1,'\ACT\UMLS_C0031437\SNOMED_3947185011\','ACT COVID-19','N','CA' ,NULL,NULL,NULL,'concept_cd','concept_dimension','concept_path','T','LIKE',
	'\ACT\C0031437\',NULL,'ACT COVID-19',NULL,NULL,NULL,NULL
	)


----------------------------------------------------------------------------------------------------------------------------------------------------
--metadata table
----------------------------------------------------------------------------------------------------------------------------------------------------
--drop table ACT_COVID_032320
CREATE TABLE [dbo].[ACT_COVID_032320](
	[C_HLEVEL] [int] NULL,
	[C_FULLNAME] [varchar](900) NULL,
	[C_NAME] [varchar](2000) NULL,
	[C_SYNONYM_CD] [char](1) NULL,
	[C_VISUALATTRIBUTES] [char](3) NULL,
	[C_TOTALNUM] [int] NULL,
	[C_BASECODE] [varchar](450) NULL,
	[C_METADATAXML] [text] NULL,
	[C_FACTTABLECOLUMN] [varchar](50) NULL,
	[C_TABLENAME] [varchar](50) NULL,
	[C_COLUMNNAME] [varchar](50) NULL,
	[C_COLUMNDATATYPE] [varchar](50) NULL,
	[C_OPERATOR] [varchar](10) NULL,
	[C_DIMCODE] [varchar](900) NULL,
	[C_COMMENT] [text] NULL,
	[C_TOOLTIP] [varchar](900) NULL,
	[M_APPLIED_PATH] [varchar](700) NULL,
	[UPDATE_DATE] [datetime] NULL,
	[DOWNLOAD_DATE] [datetime] NULL,
	[IMPORT_DATE] [datetime] NULL,
	[SOURCESYSTEM_CD] [varchar](50) NULL,
	[VALUETYPE_CD] [varchar](50) NULL,
	[M_EXCLUSION_CD] [varchar](25) NULL,
	[C_PATH] [varchar](700) NULL,
	[C_SYMBOL] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--populate
--import flat file ACT_COVID_032320.csv

--Build indexes
