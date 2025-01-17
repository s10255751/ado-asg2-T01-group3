-- Use a CTE to identify duplicates based on ordernumber and productcode
WITH DeduplicatedOrderDetails AS (
    SELECT 
        ROW_NUMBER() OVER (PARTITION BY ordernumber, productcode ORDER BY ordernumber ASC) AS RN,
        ordernumber,
        productcode
    FROM COLLECTIBLE_DIECAST.ORDER_DETAILS
)
DELETE FROM COLLECTIBLE_DIECAST.ORDER_DETAILS
WHERE (ordernumber, productcode) IN (
    SELECT ordernumber, productcode
    FROM DeduplicatedOrderDetails
    WHERE RN > 1
);

