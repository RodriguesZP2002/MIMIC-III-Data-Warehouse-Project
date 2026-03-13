/* 
=======================
===   DDL LEVEL 2   ===
=======================
SCRIPT:
	- CREATION OF TABLES OF ALL CSVs IN THE MIMIC-III DEMO DATABASE
*/

-- ADMISSIONS TABLE	--
USE Mimic_III_DW
IF OBJECT_ID('Level_2.Admissions', 'U') IS NOT NULL
	DROP TABLE Level_2.Admissions;
GO

CREATE TABLE Level_2.Admissions (
	row_id	INT,
	subject_id INT,
	hadm_id	INT,
	admittime	DATETIME2(0),
	dischtime	DATETIME2(0),
	deathtime	DATETIME2(0),
	admission_type	VARCHAR(50),
	admission_location	VARCHAR(50),
	discharge_location	VARCHAR(50),
	insurance	VARCHAR(255),
	language_	VARCHAR(10),
	religion	VARCHAR(50),
	marital_status	VARCHAR(50),
	ethnicity	VARCHAR(200),
	edregtime	DATETIME2(0),
	edouttime	DATETIME2(0),
	diagnosis	VARCHAR(300),
	hospital_expire_flag	BIT,
	has_chartevents_data	BIT
);
GO

-- CALLOUT TABLE --

IF OBJECT_ID('Level_2.Callout', 'U') IS NOT NULL
	DROP TABLE Level_2.Callout;
GO

CREATE TABLE Level_2.Callout(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	submit_wardid	INT,
	submit_careunit	VARCHAR(15),
	curr_wardid	INT,
	curr_careunit	VARCHAR(15),
	callout_wardid	INT,
	callout_service	VARCHAR(10),
	request_tele	TINYINT,
	request_resp	TINYINT,
	request_cdiff	TINYINT,
	request_mrsa	TINYINT,
	request_vre	TINYINT,
	callout_status	VARCHAR(20),
	callout_outcome	VARCHAR(20),
	discharge_wardid	INT,
	acknowledge_status	VARCHAR(20),
	createtime	DATETIME2(0),
	updatetime	DATETIME2(0),
	acknowledgetime	DATETIME2(0),
	outcometime	DATETIME2(0),
	firstreservationtime	DATETIME2(0),
	currentreservationtime	DATETIME2(0)
);
GO

-- CAREGIVERS TABLE --

IF OBJECT_ID('Level_2.Caregivers', 'U') IS NOT NULL
	DROP TABLE Level_2.Caregivers;
GO

CREATE TABLE Level_2.Caregivers(
	row_id	INT,
	cgid	INT,
	label_	VARCHAR(15),
	description_	VARCHAR(30)
);
GO

-- CHARTEVENTS --

IF OBJECT_ID('Level_2.Chartevents', 'U') IS NOT NULL
	DROP TABLE Level_2.Chartevents;
GO

CREATE TABLE Level_2.Chartevents(
	row_id	INT,
	subject_id	INT, -- NEEDS TO BE 7 NUMBERS
	hadm_id	INT, -- NEEDS TO BE 7 NUMBERS
	icustay_id	INT, -- NEEDS TO BE 7 NUMBERS
	itemid	INT, -- NEEDS TO BE 7 NUMBERS
	charttime	DATETIME2(0),
	storetime	DATETIME2(0),
	cgid	INT,
	value_	VARCHAR(MAX),
	valuenum	DECIMAL(10,1),
	valueuom	VARCHAR(20),
	warning	TINYINT,
	error	TINYINT,
	resultstatus	VARCHAR(20),
	stopped_	VARCHAR(20)
);
GO

-- CPTEVENTS --

IF OBJECT_ID('Level_2.Cptevent', 'U') IS NOT NULL
	DROP TABLE Level_2.Cptevent;
GO

CREATE TABLE Level_2.Cptevent(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	costcenter	VARCHAR(10),
	chartdate	DATETIME2(0),
	cpt_cd	VARCHAR(10),
	cpt_number	INT,
	cpt_suffix	VARCHAR(5),
	ticket_id_seq	INT,
	sectionheader	VARCHAR(50),
	subsectionheader	VARCHAR(300),
	description_	VARCHAR(200)
);

-- D_CPT --

IF OBJECT_ID('Level_2.D_cpt', 'U') IS NOT NULL
	DROP TABLE Level_2.D_cpt;
GO

CREATE TABLE Level_2.D_cpt(
	row_id	INT,
	category TINYINT,
	sectionrange	VARCHAR(100),
	sectionheader	VARCHAR(50),
	subsectionrange	VARCHAR(100),
	subsectionheader	VARCHAR(300),
	codesuffix	VARCHAR(5),
	mincodeinsubsection	INT,
	maxcodeinsubsection	INT
);
GO

-- D_ICD_DIAGNOSIS --

IF OBJECT_ID('Level_2.D_icd_diagnosis', 'U') IS NOT NULL
	DROP TABLE Level_2.D_icd_diagnosis;
GO

CREATE TABLE Level_2.D_icd_diagnosis(
	row_id	INT,
	icd9_code	VARCHAR(10),
	short_title	VARCHAR(50),
	long_title	VARCHAR(300)
);
GO

-- D_ICD_PROCEDURES --

IF OBJECT_ID('Level_2.D_icd_procedures', 'U') IS NOT NULL
	DROP TABLE Level_2.D_icd_procedures;
GO

CREATE TABLE Level_2.D_icd_procedures(
	row_id	INT,
	icd9_code	VARCHAR(10),
	short_title	VARCHAR(50),
	long_title	VARCHAR(300)
);
GO

-- D_ITEMS --

IF OBJECT_ID('Level_2.D_items', 'U') IS NOT NULL
	DROP TABLE Level_2.D_items;
GO

CREATE TABLE Level_2.D_items(
	row_id	INT,
	item_id	INT,
	label_	VARCHAR(200),
	abbreviation	VARCHAR(100),
	dbsource	VARCHAR(20),
	linksto	VARCHAR(50),
	category	VARCHAR(100),
	unitname	VARCHAR(100),
	param_type	VARCHAR(30),
	conceptid	INT
);
GO

-- D_LABITEMS --

IF OBJECT_ID('Level_2.D_labitems', 'U') IS NOT NULL
	DROP TABLE Level_2.D_labitems;
GO

CREATE TABLE Level_2.D_labitems(
	row_id	INT,
	item_id	INT,
	label_	VARCHAR(200),
	fluid	VARCHAR(100),
	category	VARCHAR(100),
	loinc_code	VARCHAR(100)
);
GO

-- DATETIMEEVENTS --

IF OBJECT_ID('Level_2.Datetimeevents', 'U') IS NOT NULL
	DROP TABLE Level_2.Datetimeevents;
GO

CREATE TABLE Level_2.Datetimeevents(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	icustay_id	INT,
	itemid	INT,
	charttime	DATETIME2(0),
	storetime	DATETIME2(0),
	cgid	INT,
	value_	DATETIME2(0),
	valueuom	VARCHAR(50),
	warning	TINYINT,
	error	TINYINT,
	resultstatus	VARCHAR(50),
	stopped_	VARCHAR(50)
);
GO

-- DIAGNOSES_ICD --

IF OBJECT_ID('Level_2.Diagnoses_icd', 'U') IS NOT NULL
	DROP TABLE Level_2.Diagnoses_icd;
GO

CREATE TABLE Level_2.Diagnoses_icd(
	row_id	INT, -- NOT NULL
	subject_id	INT, -- NOT NULL
	hadm_id	INT, -- NOT NULL
	seq_num	INT,
	icd9_code	VARCHAR(10)
);
GO

-- DRFCODES --

IF OBJECT_ID('Level_2.Drgcodes', 'U') IS NOT NULL
	DROP TABLE Level_2.Drgcodes;
GO

CREATE TABLE Level_2.Drgcodes(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	drg_type	VARCHAR(20),
	drg_code	VARCHAR(20),
	description_	VARCHAR(300),
	drg_severity	TINYINT,
	drg_mortality	TINYINT
);
GO

-- ICUSTAYS --

IF OBJECT_ID('Level_2.Icustays', 'U') IS NOT NULL
	DROP TABLE Level_2.Icustays;
GO

CREATE TABLE Level_2.Icustays(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	icustay_id	INT,
	dbsource	VARCHAR(20),
	first_careunit	VARCHAR(20),
	last_careunit	VARCHAR(20),
	first_wardid	TINYINT,
	last_wardid	TINYINT,
	intime	DATETIME2(0),
	outtime	DATETIME2(0),
	los	DECIMAL(6,4)
);
GO

-- INPUTEVENTS_CV --

IF OBJECT_ID('Level_2.Inputevents_cv', 'U') IS NOT NULL
	DROP TABLE Level_2.Inputevents_cv;
GO

CREATE TABLE Level_2.Inputevents_cv(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	icustay_id	INT,
	charttime	DATETIME2(0),
	itemid	INT,
	amount	FLOAT(53),
	amountuom	VARCHAR(30),
	rate	FLOAT(53),
	rateuom	VARCHAR(30),
	storetime	DATETIME2(0),
	cgid	BIGINT,
	orderid	BIGINT,
	linkorderid	BIGINT,
	stopped_	VARCHAR(30),
	newbottle	INT,
	originalamount	FLOAT(53),
	originalamountuom	VARCHAR(30),
	originalroute	VARCHAR(30),
	originalrate	FLOAT(53),
	originalrateuom	VARCHAR(30),
	originalsite	VARCHAR(30)
);
GO

-- INPUTEVENTS_MV --

IF OBJECT_ID('Level_2.Inputevents_mv', 'U') IS NOT NULL
	DROP TABLE Level_2.Inputevents_mv;
GO

CREATE TABLE Level_2.Inputevents_mv(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	icustay_id	INT,
	starttime	DATETIME2(0),
	endtime	DATETIME2(0),
	itemid	INT,
	amount	FLOAT(53),
	amountuom	VARCHAR(30),
	rate	FLOAT(53),
	rateuom	VARCHAR(30),
	storetime	DATETIME2(0),
	cgid	BIGINT,
	orderid	BIGINT,
	linkorderid	BIGINT,
	ordercategoryname	VARCHAR(100),
	secondaryordercategoryname	VARCHAR(100),
	ordercomponenttypedescription	VARCHAR(200),
	ordercategorydescription	VARCHAR(50),
	patientweight	FLOAT(53),
	totalamount	FLOAT(53),
	totalamountuom	VARCHAR(50),
	isopenbag	SMALLINT,
	continueinnextdept	SMALLINT,
	cancelreason	SMALLINT,
	statusdescription	VARCHAR(30),
	comments_editedby	VARCHAR(30),
	comments_canceledby	VARCHAR(30),
	comments_date	DATETIME2(0),
	originalamount	FLOAT(53),
	originalrate	FLOAT(53)
);
GO

-- LABEVENTS --

IF OBJECT_ID('Level_2.Labevents', 'U') IS NOT NULL
	DROP TABLE Level_2.Labevents;
GO

CREATE TABLE Level_2.Labevents(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	itemid	INT,
	charttime	DATETIME2(0),
	value_	VARCHAR(200),
	valuenum	FLOAT(53),
	valueuom	VARCHAR(20),
	flag	VARCHAR(20)
);
GO

-- MICROBIOLOGYEVENTS --

IF OBJECT_ID('Level_2.Microbiologyevents', 'U') IS NOT NULL
	DROP TABLE Level_2.Microbiologyevents;
GO

CREATE TABLE Level_2.Microbiologyevents(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	chartdate	DATETIME2(0),
	charttime	DATETIME2(0),
	spec_itemid	INT,
	spec_type_desc	VARCHAR(100),
	org_itemid	INT,
	org_name	VARCHAR(100),
	isolate_num	SMALLINT,
	ab_itemid	INT,
	ab_name	VARCHAR(30),
	dilution_text	VARCHAR(10),
	dilution_comparison	VARCHAR(20),
	dilution_value	FLOAT(53),
	interpretation	VARCHAR(5)
);

-- NOTEEVENTS --

IF OBJECT_ID('Level_2.Noteevents', 'U') IS NOT NULL
	DROP TABLE Level_2.Noteevents;
GO

CREATE TABLE Level_2.Noteevents(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	chartdate	DATETIME2(0),
	charttime	DATETIME2(0),
	storetime	DATETIME2(0),
	category	VARCHAR(50),
	description_	VARCHAR(300),
	cgid	INT,
	ISERROR	CHAR(1),
	text_	TEXT
);
GO

-- OUTPUTEVENTS --

IF OBJECT_ID('Level_2.Outputevents', 'U') IS NOT NULL
	DROP TABLE Level_2.Outputevents;
GO

CREATE TABLE Level_2.Outputevents(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	icustay_id	INT,
	charttime	DATETIME2(0),
	itemid	INT,
	value_	FLOAT(53),
	valueuom	VARCHAR(50),
	storetime	DATETIME2(0),
	cgid	BIGINT,
	stopped_	VARCHAR(30),
	newbottle	INT,
	iserror	SMALLINT
);
GO

-- PATIENTS --

IF OBJECT_ID('Level_2.Patients', 'U') IS NOT NULL
	DROP TABLE Level_2.Patients;
GO

CREATE TABLE Level_2.Patients(
	row_id	INT,
	subject_id	INT,
	gender	VARCHAR(5),
	dob	DATETIME2(0),
	dod	DATETIME2(0),
	dod_hosp	DATETIME2(0),
	dod_ssn	DATETIME2(0),
	expire_flag	VARCHAR(5)
);
GO

-- PRESCRIPTIONS --

IF OBJECT_ID('Level_2.Prescriptions', 'U') IS NOT NULL
	DROP TABLE Level_2.Prescriptions;
GO

CREATE TABLE Level_2.Prescriptions(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	icustay_id	INT,
	startdate	DATETIME2(0),
	enddate	DATETIME2(0),
	drug_type	VARCHAR(100),
	drug	VARCHAR(100),
	drug_name_poe	VARCHAR(100),
	drug_name_generic	VARCHAR(100),
	formularly_drug_cd	VARCHAR(120),
	gsn	VARCHAR(200),
	ndc	VARCHAR(120),
	prod_strength	VARCHAR(120),
	dose_val_rx	VARCHAR(120),
	dose_unit_rx	VARCHAR(120),
	form_val_disp	VARCHAR(120),
	form_unit_disp	VARCHAR(120),
	route_	VARCHAR(120)
);

-- PROCEDUREEVENTS_MV --

IF OBJECT_ID('Level_2.Procedureevents_mv', 'U') IS NOT NULL
	DROP TABLE Level_2.Procedureevents_mv;
GO

CREATE TABLE Level_2.Procedureevents_mv(
	row_id	INT,
	subject_id	INT,
	hadm_id	INT,
	icustay_id	INT,
	starttime	DATETIME2(0),
	endtime	DATETIME2(0),
	itemid	INT,
	value_	INT,
	valueuom	VARCHAR(30),
	location_	VARCHAR(30),
	locationcategory	VARCHAR(30),
	storetime	DATETIME2(0),
	cgid	INT,
	orderid	INT,
	linkorderid	INT,
	ordercategoryname	VARCHAR(100),
	secondaryordercategoryname	VARCHAR(100),
	ordercategorydescription	VARCHAR(50),
	isopenbag	TINYINT,
	continueinnextdept	TINYINT,
	cancelreason	TINYINT,
	statusdescription	VARCHAR(30),
	comments_editedby	VARCHAR(30),
	comments_canceledby	VARCHAR(30),
	comments_date	DATETIME2(0)
);
GO

-- PROCEDURES_ICD --

IF OBJECT_ID('Level_2.Procedures_icd', 'U') IS NOT NULL
	DROP TABLE Level_2.Procedures_icd;
GO

CREATE TABLE Level_2.Procedures_icd(
	row_id	INT, --NOTNULL
	subject_id	INT,--NOTNULL
	hadm_id	INT,--NOTNULL
	seq_num	INT,
	icd9_code	VARCHAR(10)
);
GO


-- SERVICES_ --

IF OBJECT_ID('Level_2.Services_', 'U') IS NOT NULL
	DROP TABLE Level_2.Services_;
GO

CREATE TABLE Level_2.Services_(
	row_id	INT, --NOTNULL
	subject_id	INT,--NOTNULL
	hadm_id	INT,--NOTNULL
	transfertime	DATETIME2(0),
	prev_service	VARCHAR(20),
	curr_service	VARCHAR(20)
);
GO

-- TRANSFERS --

IF OBJECT_ID('Level_2.Transfers', 'U') IS NOT NULL
	DROP TABLE Level_2.Transfers;
GO

CREATE TABLE Level_2.Transfers(
	row_id	INT, --NOTNULL
	subject_id	INT,--NOTNULL
	hadm_id	INT,--NOTNULL
	icustay_id	INT,
	dbsource	VARCHAR(20),
	eventtype	VARCHAR(20),
	prev_careunit	VARCHAR(20),
	curr_careunit	VARCHAR(20),
	prev_wardid	SMALLINT,
	curr_wardid	SMALLINT,
	intime	DATETIME2(0),
	outtime	DATETIME2(0),
	los	DECIMAL(6,2)
);
GO
