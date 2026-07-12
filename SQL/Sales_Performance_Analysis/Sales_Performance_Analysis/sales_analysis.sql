SELECT TOP 10 *
FROM SalesData;

SELECT COUNT(*) AS TotalOrders
FROM SalesData;

SELECT SUM(Sales) AS TotalSales
FROM SalesData;

SELECT Category,
       SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Category;

SELECT Region,
       SUM(Profit) AS TotalProfit
FROM dbo.SalesData
GROUP BY Region;

SELECT MAX(Sales) AS Highest_Sale
FROM SalesData;

SELECT AVG(Sales) AS Average_Sale
FROM SalesData;

SELECT MIN(Sales) AS Lowest_Sale
FROM SalesData;

SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM SalesData
GROUP BY Region
ORDER BY Total_Sales DESC;

SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM SalesData
GROUP BY Region
ORDER BY Total_Profit DESC;

SELECT 
    Product,
    SUM(Quantity) AS Quantity_Sold
FROM SalesData
GROUP BY Product
ORDER BY Quantity_Sold DESC;

SELECT
Category,
SUM(Sales) AS Total_Sales
FROM SalesData
GROUP BY Category;

SELECT TOP 10
CustomerName,
SUM(Sales) AS Total_Purchases
FROM SalesData
GROUP BY CustomerName
ORDER BY Total_Purchases DESC;

SELECT 
SalesPerson,
SUM(Sales) AS Total_Sales
FROM SalesData
GROUP BY Salesperson
ORDER BY Total_Sales DESC;

SELECT
PaymentMethod,
COUNT(*) AS Number_of_Oders
FROM SalesData
GROUP BY PaymentMethod;

SELECT 
Product,
SUM(Sales) AS Total_Sales,
RANK() OVER(ORDER BY SUM(Sales) DESC) AS Sales_Rank
FROM SalesData
GROUP BY Product;

SELECT
OrderDate,
Sales,
SUM(Sales) OVER(ORDER BY OrderDate) AS Running_Total
FROM SalesData;

SELECT
CustomerName,
SUM(Sales) AS Total_Spent
FROM SalesData
GROUP BY CustomerName
HAVING SUM(Sales) >5000;

SELECT
DATENAME(MONTH, OrderDate) AS Month,
SUM(Sales) AS Total_Sales
FROM SalesData
GROUP BY DATENAME(MONTH, OrderDate), MONTH(OrderDate)
ORDER BY MONTH(OrderDate);

