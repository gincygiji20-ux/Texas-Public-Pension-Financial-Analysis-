
-- Create database
CREATE DATABASE IF NOT EXISTS tx_ret_plans;

-- Select database
USE tx_ret_plans;

-- Create table
CREATE TABLE pension_investment3 (
    `Plan ID` VARCHAR(50),
    `Plan Name` VARCHAR(255),
    `Plan Classification` VARCHAR(100),
    `Asset Size Category` VARCHAR(100),
    `Fiscal Year` INT,
    `Net Total Assets ($)` DECIMAL(20,2),
    `Benefit Payments ($)` DECIMAL(20,2),
    `Total Contributions ($)` DECIMAL(20,2),
    `Non-Investment Cash Flow (% of Assets)` DECIMAL(10,4),
    `Expenses (% of Assets)` DECIMAL(10,4)
);

-- Enable local file loading
SET GLOBAL local_infile = 1;

-- Import CSV file
LOAD DATA LOCAL INFILE
'C:/Users/jincy/Downloads/financial data setv1.csv'

INTO TABLE pension_investment3

FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'

LINES TERMINATED BY '\r\n'

IGNORE 1 ROWS;

SELECT COUNT(*) AS total_records
FROM pension_investment3;
#checking duplicates
SELECT
    `Plan ID`,
    `Fiscal Year`,
    COUNT(*) AS record_count
FROM pension_investment3
GROUP BY `Plan ID`, `Fiscal Year`
HAVING COUNT(*) > 1
select *
from pension_investment3;


SELECT *
FROM pension_investment3
WHERE `Net Total Assets ($)` IS NULL
   OR TRIM(`Net Total Assets ($)`) = '0.00';  
   
SELECT *
FROM pension_investment3
WHERE `Benefit Payments ($)` IS NULL
   OR TRIM(`Benefit Payments ($)`) = '0.00';  
SELECT *
FROM pension_investment3
WHERE `Total Contributions ($)` IS NULL
   OR TRIM(`Total Contributions ($)`) = '0.00';    
   
SELECT *
FROM pension_investment3
WHERE `Non-Investment Cash Flow (% of Assets)` IS NULL
   OR TRIM(`Non-Investment Cash Flow (% of Assets)`) = '0.0000'; 
SELECT *
FROM pension_investment3
WHERE `Expenses (% of Assets)` IS NULL
   OR TRIM(`Expenses (% of Assets)`) = '0.0000';  
  #off safe update mode 
SET SQL_SAFE_UPDATES = 0;
#replacing missing values of Expense% of assets with median
WITH ranked_expenses AS (
    SELECT
        `Plan ID`,
        `Expenses (% of Assets)` AS expense_value,
        ROW_NUMBER() OVER (
            PARTITION BY `Plan ID`
            ORDER BY `Expenses (% of Assets)`
        ) AS rn,
        COUNT(*) OVER (
            PARTITION BY `Plan ID`
        ) AS total_count
    FROM pension_investment3
    WHERE `Plan ID` IN ('158', '351')
      AND `Expenses (% of Assets)` <>0.0000
      AND `Expenses (% of Assets)` IS NOT NULL
),
plan_medians AS (
    SELECT
        `Plan ID`,
        AVG(expense_value) AS median_expense
    FROM ranked_expenses
    WHERE rn IN (
        FLOOR((total_count + 1) / 2),
        FLOOR((total_count + 2) / 2)
    )
    GROUP BY `Plan ID`
)
UPDATE pension_investment3 p
JOIN plan_medians m
    ON p.`Plan ID` = m.`Plan ID`
SET p.`Expenses (% of Assets)` = m.median_expense
WHERE p.`Plan ID` IN ('158', '351')
  AND p.`Expenses (% of Assets)` = 0.0000;
#on safe update mode  
SET SQL_SAFE_UPDATES = 1; 
#checking the median update
SELECT
    `Plan ID`,
    `Fiscal Year`,
    `Expenses (% of Assets)`
FROM pension_investment3
WHERE `Plan ID` IN ('158', '351')
ORDER BY `Plan ID`, `Fiscal Year`; 
#Which pension plans have negative cash flow?
SELECT
    `Plan ID`,
    `Plan Name`,
    `Fiscal Year`,
    `Net Total Assets ($)`,
    `Non-Investment Cash Flow (% of Assets)`
FROM pension_investment3
WHERE `Non-Investment Cash Flow (% of Assets)` < 0
ORDER BY `Non-Investment Cash Flow (% of Assets)` ASC;
#Are benefit payments greater than contributions?
SELECT
    `Plan ID`,
    `Plan Name`,
    `Fiscal Year`,
    `Benefit Payments ($)`,
    `Total Contributions ($)`,
    `Benefit Payments ($)` - `Total Contributions ($)` AS Difference
FROM pension_investment3
WHERE `Benefit Payments ($)` > `Total Contributions ($)`
ORDER BY Difference DESC;

SELECT
    `Plan ID`,
    `Plan Name`,
    `Fiscal Year`,
    `Benefit Payments ($)`,
    `Total Contributions ($)`,
    `Benefit Payments ($)` - `Total Contributions ($)` AS Difference
FROM pension_investment3
WHERE `Benefit Payments ($)` > `Total Contributions ($)`
ORDER BY Difference asc;

#How does cash flow differ between small and large pension plans?
SELECT
    `Asset Size Category`,
    COUNT(*) AS Total_Records,

    ROUND(
        AVG(`Non-Investment Cash Flow (% of Assets)`), 4
    ) AS Average_Cash_Flow,

    SUM(
        CASE
            WHEN `Non-Investment Cash Flow (% of Assets)` < 0
            THEN 1 ELSE 0
        END
    ) AS Negative_Cash_Flow_Records,

    ROUND(
        SUM(
            CASE
                WHEN `Non-Investment Cash Flow (% of Assets)` < 0
                THEN 1 ELSE 0
            END
        ) * 100.0 / COUNT(*), 2
    ) AS Negative_Cash_Flow_Percentage

FROM pension_investment3

GROUP BY `Asset Size Category`
ORDER BY `Asset Size Category`;