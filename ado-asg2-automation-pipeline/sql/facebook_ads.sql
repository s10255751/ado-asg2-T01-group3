CREATE OR REPLACE TABLE facebook_ads AS 

SELECT  

    -- Format valid date values, but keep non-date values like 'Ongoing' 

    CASE  

        WHEN TRY_TO_DATE(ENDS, 'DD/MM/YYYY') IS NOT NULL  

        THEN TO_CHAR(TO_DATE(ENDS, 'DD/MM/YYYY'), 'YYYY-MM-DD') 

        ELSE ENDS 

    END AS ENDS, 

  

    -- Trim whitespace in text columns 

    TRIM(CAMPAIGN_NAME) AS CAMPAIGN_NAME, 

    TRIM(CAMPAIGN_DELIVERY) AS CAMPAIGN_DELIVERY, 

    TRIM(ATTRIBUTION_SETTING) AS ATTRIBUTION_SETTING, 

  

    -- Retain other columns as is 

    "CTR (link click-through rate)", 

    "CTR (all)", 

    "CPC (all) (USD)", 

    "CPC (cost per link click) (USD)", 

    "CPM (cost per 1,000 impressions) (USD)", 

    "3-second video plays", 

    THRUPLAYS, 

    "Cost per 3-second video plays (USD)", 

    "Cost per ThruPlay (USD)", 

    RESULTS, 

    RESULT_INDICATOR, 

    COST_PER_RESULTS, 

    LINK_CLICKS, 

    PAGE_LIKES, 

    OBJECTIVE, 

    "Amount spent (USD)", 

    AD_SET_BUDGET, 

    AD_SET_BUDGET_TYPE, 

    REPORTING_STARTS, 

    REPORTING_ENDS, 

    REACH, 

    FREQUENCY, 

    "Clicks (all)", 

    IMPRESSIONS 

FROM facebook_ads; 

  

SELECT * FROM facebook_ads LIMIT 100; 