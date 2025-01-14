-- Step 1: Create the table with ROW_NUMBER() to avoid duplicates
CREATE OR REPLACE TABLE COLLECTIBLE_DIECAST.ORDER_DETAILS AS  
SELECT *  
FROM (  
      SELECT  
          *,  
          ROW_NUMBER() OVER (PARTITION BY ordernumber, productcode ORDER BY ordernumber ASC) AS RN  
      FROM COLLECTIBLE_DIECAST.ORDER_DETAILS  
)  
WHERE RN = 1;  

-- Step 2: Drop the ROW_NUMBER column
ALTER TABLE COLLECTIBLE_DIECAST.ORDER_DETAILS DROP COLUMN RN;  

-- Step 3: Recreate the table and reorder the rows
CREATE OR REPLACE TABLE COLLECTIBLE_DIECAST.ORDER_DETAILS AS  
SELECT *  
FROM COLLECTIBLE_DIECAST.ORDER_DETAILS  
ORDER BY ordernumber, orderlinenumber ASC;

