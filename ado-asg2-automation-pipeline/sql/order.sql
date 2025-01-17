-- Remove duplicates based on ordernumber and keep only the first occurrence
WITH DeduplicatedOrders AS (
    SELECT 
        *,  
        ROW_NUMBER() OVER (PARTITION BY ordernumber ORDER BY ordernumber ASC) AS RN  
    FROM COLLECTIBLE_DIECAST.ORDERS
)
DELETE FROM COLLECTIBLE_DIECAST.ORDERS
WHERE ordernumber IN (
    SELECT ordernumber
    FROM DeduplicatedOrders
    WHERE RN > 1
);

-- Standardize date formats in-place without recreating the table
UPDATE COLLECTIBLE_DIECAST.ORDERS
SET 
    orderDate = TO_DATE(NULLIF(orderDate, 'NULL'), 'DD/MM/YYYY'),
    requiredDate = TO_DATE(NULLIF(requiredDate, 'NULL'), 'DD/MM/YYYY'),
    shippedDate = TO_DATE(NULLIF(shippedDate, 'NULL'), 'DD/MM/YYYY');
