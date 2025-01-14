-- Step 1: Remove duplicates and standardize date formats
CREATE OR REPLACE TABLE COLLECTIBLE_DIECAST.ORDERS AS  
SELECT *  
FROM (  
    SELECT  
        *,  
        ROW_NUMBER() OVER (PARTITION BY ordernumber ORDER BY ordernumber ASC) AS RN  
    FROM COLLECTIBLE_DIECAST.ORDERS 
)  
WHERE RN = 1; 

ALTER TABLE COLLECTIBLE_DIECAST.ORDERS DROP COLUMN RN;

CREATE OR REPLACE TABLE COLLECTIBLE_DIECAST.ORDERS AS  
SELECT *  
FROM COLLECTIBLE_DIECAST.ORDERS 
ORDER BY ordernumber ASC;

CREATE OR REPLACE TABLE COLLECTIBLE_DIECAST.ORDERS AS   
SELECT   
    orderNumber, 
    TO_DATE(NULLIF(orderDate, 'NULL'), 'DD/MM/YYYY') AS orderDate, 
    TO_DATE(NULLIF(requiredDate, 'NULL'), 'DD/MM/YYYY') AS requiredDate, 
    TO_DATE(NULLIF(shippedDate, 'NULL'), 'DD/MM/YYYY') AS shippedDate, 
    status,  
    comments,  
    customerNumber,  
    employeeNumber 
FROM COLLECTIBLE_DIECAST.ORDERS;

