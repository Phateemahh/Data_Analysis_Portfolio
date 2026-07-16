Project: Retail Inventory Analysis Using SQL
Author: Fatima Idiaghe
Tool: Microsoft SQL Server Management Studio (SSMS)
Database: RetailInventoryDB
Date: July 2026
Description: SQL analysis of a retal inventory dataset to evaluate inventory levels, sales performance, revenue, promotions
regional performance and stock status.

1. Total Inventory
SELECT 
SUM(Inventory_Level) AS Total_Inventory
FROM RetailInventory;

2. Total Units Sold
SELECT
SUM(Units_Sold) AS Total_Units_Sold
FROM RetailInventory;

3. Total Revenue
SELECT
ROUND(SUM(Units_Sold * Price), 2) AS Total_Revenue
FROM RetailInventory;

4.Revenue by Category
SELECT
Category,
Round(Sum(Units_Sold * Price), 2) AS Revenue
FROM RetailInventory
GROUP BY Category
ORDER BY Revenue DESC;

5.Top 10 Selling Products
SELECT TOP 10
Product_ID,
SUM(Units_Sold) AS Total_Units_Sold
FROM RetailInventory
GROUP BY Product_ID
ORDER BY Total_Units_Sold DESC;

6. Revenue by Region
SELECT
Region,
ROUND(SUM(Units_Sold * Price), 2) AS Total_Revenue
FROM RetailInventory
GROUP BY Region
ORDER BY Total_Revenue DESC;

7. Store Performance
SELECT
Store_ID,
ROUND(SUM(Units_Sold * Price), 2) AS TotAl_Revenue,
SUM(Units_Sold) AS Total_Units_SOld
FROM RetailInventory
GROUP BY Store_ID
ORDER BY Total_Revenue DESC;

8. Average Discount by Category
SELECT 
Category,
ROUND(AVG(Discount), 2) AS Average_Discount
FROM RetailInventory
GROUP BY Category
ORDER BY Average_Discount Desc;

9.Seasonal Demand 
SELECT 
Seasonality,
ROUND(AVG(Demand_Forecast), 2) AS Average_Demand
FROM RetailInventory
GROUP BY Seasonality
ORDER BY Average_Demand DESC;

10. Impact of Promotions
SELECT
Holiday_Promotion,
SUM(Units_Sold) AS Total_Units_Sold,
ROUND(AVG(Units_Sold), 2) AS Average_Units_Sold
FROM RetailInventory
GROUP BY Holiday_Promotion;

11. Products with Critical Inventory Levels
SELECT
Product_ID,
Category,
Inventory_Level
FROM RetailInventory
WHERE Inventory_Level <= 50
ORDER BY Inventory_Level ASC;

12.Competitor Pricing by Category
SELECT 
Category,
ROUND(AVG(Price), 2) AS Average_Price,
ROUND(AVG(Competitor_Pricing), 2) AS Average_Competitor_Price
FROM RetailInventory
GROUP BY Category
ORDER BY Category;

13.Stock Status Summary
SELECT
CASE
WHEN Inventory_Level = 50 THEN 'Critical Stock'
WHEN Inventory_Level BETWEEN 51 AND 200 THEN 'Low Stock'
WHEN Inventory_Level BETWEEN 201 AND 350 THEN 'Medium Stock'
ELSE 'High Stock'
END AS Stock_Status,
COUNT(*) AS Product_Count
FROM RetailInventory
GROUP BY
CASE
WHEN Inventory_Level = 50 THEN 'Critical Stock'
WHEN Inventory_Level BETWEEN 51 AND 200 THEN 'Low Stock'
WHEN Inventory_Level BETWEEN 201 AND 350 THEN 'Medium Stock'
ELSE 'High Stock'
END
ORDER BY Product_Count DESC;

14. Average Price with Competitors by Category
SELECT 
Category,
ROUND(AVG(Price), 2) AS Average_Price,
ROUND(AVG(Competitor_Pricing), 2) AS Average_Competitor_Price,
ROUND(AVG(Price - Competitor_Pricing), 2) AS Price_Difference
FROM RetailInventory
GROUP BY Category
ORDER BY Price_Difference DESC;