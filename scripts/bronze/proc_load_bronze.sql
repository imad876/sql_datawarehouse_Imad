/*
Stored Procedure: Load Bronze Layer (Source -> Bronze)

Script Purpose:
    - This stored procedure loads raw data from CSV files into the bronze tables
    - It Truncates the bronze tables before loading the data.
    - It uses the `BULK INSERT` command to load data from csv Files into the bronze tables.
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    TRUNCATE TABLE bronze.crm_cust_info;
    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\EmadS\sql_datawarehouse\datasets\source_crm\cust_info.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    TRUNCATE TABLE bronze.crm_prd_info;
    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\EmadS\sql_datawarehouse\datasets\source_crm\prd_info.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    TRUNCATE TABLE bronze.crm_sales_details;
    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\EmadS\sql_datawarehouse\datasets\source_crm\sales_details.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    TRUNCATE TABLE bronze.erp_loc_a101;
    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\EmadS\sql_datawarehouse\datasets\source_erp\LOC_A101.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    TRUNCATE TABLE bronze.erp_cust_az12;
    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\EmadS\sql_datawarehouse\datasets\source_erp\CUST_AZ12.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);

    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\EmadS\sql_datawarehouse\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', TABLOCK);
END

EXEC bronze.load_bronze;