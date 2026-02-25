/* 
=============================
===   BULK LOAD LEVEL 1   ===
=============================
SCRIPT:
	- TRUNCATE AND BULK LOAD OF CSV CONTENT
*/
CREATE OR ALTER PROCEDURE Level_1.load_level1 AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT 'BATCH LOAD START...';
        PRINT '=====================================================================================================';
        
        -- ADMISSIONS --
        PRINT 'ADMISSIONS TABLE...';
        SET @start_time = GETDATE();
        TRUNCATE TABLE Level_1.Admissions;
        BULK INSERT Level_1.Admissions
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\ADMISSIONS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'ADMISSIONS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';

        -- CALLOUT -- 
        PRINT '=====================================================================================================';
        PRINT 'CALLOUT TABLE...'
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Callout;

        BULK INSERT Level_1.Callout
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\CALLOUT.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'CALLOUT TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- CAREGIVERS --

        PRINT '=====================================================================================================';
        PRINT 'CAREGIVERS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Caregivers;

        BULK INSERT Level_1.Caregivers
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\CAREGIVERS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'CAREGIVERS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- CHARTEVENTS --

        PRINT '=====================================================================================================';
        PRINT 'CHARTEVENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Chartevents;

        BULK INSERT Level_1.Chartevents
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\CHARTEVENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'CHARTEVENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- CPTEVENTS --

        PRINT '=====================================================================================================';
        PRINT 'CPTEVENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Cptevent;

        BULK INSERT Level_1.Cptevent
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\CPTEVENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'CPTEVENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- D_CPT --

        PRINT '=====================================================================================================';
        PRINT 'D_CPT TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.D_cpt;

        BULK INSERT Level_1.D_cpt
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\D_CPT.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'D_CPT TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- D_ICD_DIAGNOSIS --

        PRINT '=====================================================================================================';
        PRINT 'D_ICD_DIAGNOSIS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.D_icd_diagnosis;

        BULK INSERT Level_1.D_icd_diagnosis
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\D_ICD_DIAGNOSES.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'D_ICD_DIAGNOSIS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- D_ICD_PROCEDURES --

        PRINT '=====================================================================================================';
        PRINT 'D_ICD_PROCEDURES TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.D_icd_procedures;

        BULK INSERT Level_1.D_icd_procedures
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\D_ICD_PROCEDURES.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'D_ICD_PROCEDURES TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- D_ITEMS --

        PRINT '=====================================================================================================';
        PRINT 'D_ITEMS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.D_items;

        BULK INSERT Level_1.D_items
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\D_ITEMS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'D_ITEMS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- D_LABITEMS --

        PRINT '=====================================================================================================';
        PRINT 'D_LABITEMS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.D_labitems;

        BULK INSERT Level_1.D_labitems
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\D_LABITEMS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'D_LABITEMS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- DATETIMEEVENTS --

        PRINT '=====================================================================================================';
        PRINT 'DATETIMEEVENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Datetimeevents;

        BULK INSERT Level_1.Datetimeevents
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\DATETIMEEVENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'DATETIMEEVENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- DIAGNOSIS_ICD --

        PRINT '=====================================================================================================';
        PRINT 'DIAGNOSIS_ICD TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Diagnoses_icd;

        BULK INSERT Level_1.Diagnoses_icd
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\DIAGNOSES_ICD.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'DIAGNOSIS_ICD TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- DRGCODES --

        PRINT '=====================================================================================================';
        PRINT 'DRGCODES TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Drgcodes;

        BULK INSERT Level_1.Drgcodes
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\DRGCODES.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'DRGCODES TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- ICUSTAYS --

        PRINT '=====================================================================================================';
        PRINT 'ICUSTAYS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Icustays;

        BULK INSERT Level_1.Icustays
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\ICUSTAYS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'ICUSTAYS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '====================================================================================================='

        -- INPUTEVENTS_CV --

        PRINT '=====================================================================================================';
        PRINT 'INPUTEVENTS_CV TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Inputevents_cv;

        BULK INSERT Level_1.Inputevents_cv
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\INPUTEVENTS_CV.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'INPUTEVENTS_CV TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- INPUTEVENTS_MV --

        PRINT '=====================================================================================================';
        PRINT 'INPUTEVENTS_MV TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Inputevents_mv;

        BULK INSERT Level_1.Inputevents_mv
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\INPUTEVENTS_MV.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'INPUTEVENTS_MV TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- LABEVENTS --

        PRINT '=====================================================================================================';
        PRINT 'LABEVENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Labevents;

        BULK INSERT Level_1.Labevents
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\LABEVENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'LABEVENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- MICROBIOLOGYEVENTS --

        PRINT '=====================================================================================================';
        PRINT 'MICROBIOLOGYEVENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Microbiologyevents;

        BULK INSERT Level_1.Microbiologyevents
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\MICROBIOLOGYEVENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'MICROBIOLOGYEVENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- NOTEEVENTS --

        PRINT '=====================================================================================================';
        PRINT 'NOTEEVENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Noteevents;

        BULK INSERT Level_1.Noteevents
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\NOTEEVENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'NOTEEVENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- OUTPUTEVENTS --

        PRINT '=====================================================================================================';
        PRINT 'OUTPUTEVENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Outputevents;

        BULK INSERT Level_1.Outputevents
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\OUTPUTEVENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'OUTPUTEVENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- PATIENTS --

        PRINT '=====================================================================================================';
        PRINT 'PATIENTS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Patients;

        BULK INSERT Level_1.Patients
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\PATIENTS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'PATIENTS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- PRESCRIPTIONS --

        PRINT '=====================================================================================================';
        PRINT 'PRESCRIPTIONS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Prescriptions;

        BULK INSERT Level_1.Prescriptions
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\PRESCRIPTIONS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'PRESCRIPTIONS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- PROCEDUREEVENTS_MV --

        PRINT '=====================================================================================================';
        PRINT 'PROCEDUREEVENTS_MV TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Procedureevents_mv;

        BULK INSERT Level_1.Procedureevents_mv
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\PROCEDUREEVENTS_MV.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'PROCEDUREEVENTS_MV TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- PROCEDURES_ICD --

        PRINT '=====================================================================================================';
        PRINT 'PROCEDURES_ICD TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Procedures_icd;

        BULK INSERT Level_1.Procedures_icd
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\PROCEDURES_ICD.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'PROCEDURES_ICD TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- SERVICES --
        
        PRINT '=====================================================================================================';
        PRINT 'SERVICES TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Services_;

        BULK INSERT Level_1.Services_
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\SERVICES.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'SERVICES TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        -- TRANSFERS --

        PRINT '=====================================================================================================';
        PRINT 'TRANSFERS TABLE...';
        SET @start_time = GETDATE();

        TRUNCATE TABLE Level_1.Transfers;

        BULK INSERT Level_1.Transfers
        FROM '...\Documents\SQL\DW_Project\mimic-iii-clinical-database-demo-1.4\TRANSFERS.csv'
        WITH (
            FORMAT = 'CSV',
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0a',
            KEEPNULLS,                
            TABLOCK
        );
        
        SET @end_time = GETDATE();
        PRINT 'TRANSFERS TABLE CSV INSERT - FINALISED (' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds)';
        PRINT '=====================================================================================================';

        SET @batch_end_time = GETDATE();

        PRINT '=====================================================================================================';
        PRINT '=====================================================================================================';
        PRINT 'TOTAL LOADING CSV LOADING TIME: ' + CAST(DATEDIFF(second,@batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds'; 
        PRINT '=====================================================================================================';
        PRINT '=====================================================================================================';

    END TRY
    BEGIN CATCH
            PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
            PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
            PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS NVARCHAR);
    END CATCH
END
GO
EXEC Level_1.load_level1 
