CREATE DATABASE AmazonDeliveryDB;
USE AmazonDeliveryDB;

SELECT DATABASE();

SELECT 
    COUNT(*) AS Total_Delivery
FROM
    amazondeliverydb.amazon_delivery;

SELECT 
    AVG(Delivery_Time) AS Avg_Time
FROM
    amazondeliverydb.amazon_delivery;

SELECT 
    MIN(Delivery_Time) AS Min_time,
    MAX(Delivery_Time) AS Max_Time
FROM
    amazondeliverydb.amazon_delivery;
    
SELECT 
    AVG(Agent_Rating)
FROM
    amazondeliverydb.amazon_delivery
;

SELECT 
    Traffic, AVG(Delivery_Time)  AS Avg_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
WHERE Traffic <> 'NaN'
GROUP BY Traffic
ORDER BY Avg_Delivery_Time DESC;

SELECT 
    Weather, AVG(Delivery_Time) AS Avg_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Weather
ORDER BY Avg_Delivery_Time DESC;

SELECT 
    Vehicle, AVG(Delivery_Time) AS Avg_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Vehicle
ORDER BY Avg_Delivery_Time DESC;

SELECT 
    Area, AVG(Delivery_Time) AS Avg_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Area
ORDER BY Avg_Delivery_Time DESC;

SELECT 
    Category, AVG(Delivery_Time) AS Avg_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Category
ORDER BY Avg_Delivery_Time DESC;

SELECT 
    Traffic,
    COUNT(*) AS Total_Delivery
FROM amazondeliverydb.amazon_delivery
WHERE LOWER(TRIM(Traffic)) <> 'nan'
GROUP BY Traffic
ORDER BY Total_Delivery DESC;

# Weather distribution

SELECT 
    Weather, COUNT(*) AS Total_Delivery
FROM
    amazondeliverydb.amazon_delivery
WHERE
    Weather <> 'NaN'
GROUP BY Weather
ORDER BY Total_Delivery DESC;

# Vehicle distribution

SELECT 
    Vehicle, COUNT(*) AS Total_Delivery
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Vehicle
ORDER BY Total_Delivery DESC;

# Area Distribution

SELECT Area , COUNT(*) as Total_Delivery
FROM amazondeliverydb.amazon_delivery
GROUP BY Area
ORDER BY Total_Delivery DESC;

# Top 5 product categories

SELECT 
    Category, COUNT(*) AS Total_Delivery
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Category
ORDER BY Total_Delivery DESC
LIMIT 5;

# Fastest vehicle

SELECT 
    Vehicle, AVG(Delivery_Time) AS AVG_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Vehicle
ORDER BY AVG_Delivery_Time ASC;

# Slowest delivery area

SELECT 
    Area, AVG(Delivery_Time) AS AVG_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Area
ORDER BY AVG_Delivery_Time DESC;

# Top 5 Slowest Category

SELECT 
    Category, AVG(Delivery_Time) AS AVG_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY Category
ORDER BY AVG_Delivery_Time DESC
LIMIT 5;

# Traffic + Vehicle analysis

SELECT 
    Traffic, Vehicle, AVG(Delivery_Time) AS AVG_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
WHERE
    LOWER(TRIM(Traffic)) <> 'NaN'
GROUP BY Traffic , Vehicle
ORDER BY AVG_Delivery_Time DESC;

# Which Traffic + Weather combination has the highest average delivery time?

SELECT 
    Traffic, Weather, AVG(Delivery_Time) AS AVG_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
WHERE
    Traffic <> 'NaN' AND Weather <> 'NaN'
GROUP BY Traffic , Weather
ORDER BY AVG_Delivery_Time DESC;

# Monthly delivery volume

SELECT 
    MONTH(Order_Date), AVG(Delivery_Time) AS AVG_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
GROUP BY MONTH(Order_Date)
ORDER BY AVG_Delivery_Time DESC;

# Delivery-time range

SELECT Category , MIN(Delivery_Time) AS Min_Delivery_Time , MAX(Delivery_Time) AS Max_Delivery_Time
FROM amazondeliverydb.amazon_delivery
GROUP BY Category
ORDER BY Min_Delivery_Time DESC , Max_Delivery_Time ASC;

# Q1 Above-average deliveries

SELECT 
    Order_ID, Delivery_Time, Traffic, Weather, Vehicle
FROM
    amazondeliverydb.amazon_delivery
WHERE
    Delivery_Time > (SELECT 
            AVG(Delivery_Time) AS Avg_Delivery_Time
        FROM
            amazondeliverydb.amazon_delivery)
ORDER BY Delivery_Time DESC;

# Q2 → Traffic above overall average

SELECT 
    Traffic, AVG(Delivery_Time) AS Avg_Delivery_Time
FROM
    amazondeliverydb.amazon_delivery
WHERE
    LOWER(TRIM(Traffic)) <> 'nan'
GROUP BY Traffic
HAVING AVG(Delivery_Time) > (SELECT 
        AVG(Delivery_Time)
    FROM
        amazondeliverydb.amazon_delivery)
ORDER BY Avg_Delivery_Time DESC;

# Q3 → Vehicle ranking

SELECT Vehicle , AVG(Delivery_Time) AS Avg_Delivery_Time ,
RANK() OVER (ORDER BY AVG(Delivery_Time) ASC) AS Vehicle_Rank
FROM amazondeliverydb.amazon_delivery
GROUP BY Vehicle;

# Q4 → Category ranking

SELECT Category , AVG(Delivery_Time) AS Avg_Delivery_Time,
RANK() OVER (ORDER BY AVG(Delivery_Time) DESC) AS Category_Rank
FROM amazondeliverydb.amazon_delivery
GROUP BY Category;

# Q5 → Vehicle ranking within traffic

SELECT Vehicle , Traffic ,AVG(Delivery_Time) AS Avg_delivery_Time,
RANK() OVER(PARTITION BY Traffic
ORDER BY AVG(Delivery_Time) ASC) AS Vehicle_Rank
FROM amazondeliverydb.amazon_delivery
WHERE LOWER(TRIM(Traffic)) <> 'nan'
GROUP BY Vehicle , Traffic;

# Q6 → Top 2 slowest categories by area

WITH Category_Ranking AS (
    SELECT
        Category,
        Area,
        AVG(Delivery_Time) AS Avg_Delivery_Time,
        DENSE_RANK() OVER (
            PARTITION BY Area
            ORDER BY AVG(Delivery_Time) DESC
        ) AS Category_Rank
    FROM amazondeliverydb.amazon_delivery
    GROUP BY Category, Area
)

SELECT
    Category,
    Area,
    Avg_Delivery_Time,
    Category_Rank
FROM Category_Ranking
WHERE Category_Rank <= 2
ORDER BY Area, Category_Rank;

