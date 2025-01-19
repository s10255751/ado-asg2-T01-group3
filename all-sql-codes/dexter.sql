SELECT 
    orderNumber, 
    orderDate, 
    requiredDate, 
    shippedDate, 
    (shippedDate - requiredDate) AS delayDays
FROM 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.ORDERS
WHERE 
    shippedDate > requiredDate
ORDER BY 
    delayDays DESC;



SELECT 
    TO_CHAR(shippedDate, 'YYYY-MM') AS month,
    COUNT(orderNumber) AS shippedOrders
FROM 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.ORDERS
WHERE 
    shippedDate IS NOT NULL
GROUP BY 
    TO_CHAR(shippedDate, 'YYYY-MM')
ORDER BY 
    month ASC;




SELECT 
    r.RegionDescription, 
    AVG(DATEDIFF('DAY', orderDate, shippedDate)) AS avgShippingTime
FROM 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.ORDERS o
JOIN 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.CUSTOMERS c
ON 
    o.customerNumber = c.customerNumber
JOIN 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.COUNTRY co
ON 
    c.country = co.Country
JOIN 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.REGION r
ON 
    co.RegionID = r.RegionID
WHERE 
    o.shippedDate IS NOT NULL
GROUP BY 
    r.RegionDescription
ORDER BY 
    avgShippingTime ASC;


SELECT * FROM CUSTOMERS

SELECT 
    p.productCode, 
    p.productName, 
    COUNT(pr.reviewID) AS negativeReviews
FROM 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.PRODUCTS p
JOIN 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.PRODUCT_REVIEWS pr
ON 
    p.productCode = pr.productCode
WHERE 
    pr.rating <= 2 -- Assuming ratings of 1 or 2 are negative
GROUP BY 
    p.productCode, p.productName
ORDER BY 
    negativeReviews DESC;


SELECT 
    p.productCode, 
    p.productName, 
    TO_CHAR(pr.reviewDate, 'YYYY-MM') AS reviewMonth, 
    AVG(pr.rating) AS avgMonthlyRating
FROM 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.PRODUCTS p
JOIN 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.PRODUCT_REVIEWS pr
ON 
    p.productCode = pr.productCode
GROUP BY 
    p.productCode, p.productName, TO_CHAR(pr.reviewDate, 'YYYY-MM')
ORDER BY 
    p.productCode, reviewMonth ASC;


SELECT 
    o.orderNumber, 
    (o.shippedDate - o.requiredDate) AS delayDays, 
    AVG(pr.rating) AS avgRating
FROM 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.ORDERS o
JOIN 
    ADO_GROUP3_DB.COLLECTIBLE_DIECAST.PRODUCT_REVIEWS pr
ON 
    o.orderNumber = pr.orderNumber
WHERE 
    o.shippedDate > o.requiredDate
GROUP BY 
    o.orderNumber, delayDays
ORDER BY 
    delayDays DESC;


SELECT * FROM PRODUCT_REVIEWS;

SELECT * FROM SHIPMENTDAYS;

SELECT * FROM ORDERS;

DelayDays = DATEDIFF(ORDERS[REQUIREDDATE], ORDERS[SHIPPEDDATE], DAY);