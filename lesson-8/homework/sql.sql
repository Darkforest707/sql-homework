Easy‑уровень
1. Количество товаров в каждой категории (Products)
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;
Группируем по категории и считаем количество товаров.
2. Средняя цена товаров в категории 'Electronics'
SELECT AVG(Price) AS AvgPrice
FROM Products
WHERE Category = 'Electronics';
Используем AVG() для вычисления средней цены.
3. Клиенты из городов, начинающихся на 'L'
SELECT *
FROM Customers
WHERE City LIKE 'L%';
Оператор LIKE с % находит все города, начинающиеся с буквы L.
4. Товары, название которых заканчивается на 'er'
SELECT *
FROM Products
WHERE ProductName LIKE '%er';
Символ % в начале означает «любое количество символов перед 'er'».
5. Клиенты из стран, название которых оканчивается на 'A'
SELECT *
FROM Customers
WHERE Country LIKE '%A';
6. Самая высокая цена среди всех товаров
SELECT MAX(Price) AS MaxPrice
FROM Products;
7. Запасы: 'Low Stock' (<30) или 'Sufficient'
SELECT ProductName,
       CASE WHEN StockQuantity < 30 THEN 'Low Stock'
            ELSE 'Sufficient'
       END AS StockStatus
FROM Products;
CASE помогает добавить условную логику в выборку.

8. Количество клиентов в каждой стране
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;
9. Минимальное и максимальное количество заказанных товаров
SELECT MIN(Quantity) AS MinQty, MAX(Quantity) AS MaxQty
FROM Orders;
Medium‑уровень
10. Клиенты, оформившие заказы в январе 2023, но без счетов (Orders + Invoices)
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE YEAR(o.OrderDate) = 2023 AND MONTH(o.OrderDate) = 1
  AND o.CustomerID NOT IN (
      SELECT DISTINCT CustomerID
      FROM Invoices
      WHERE YEAR(InvoiceDate) = 2023 AND MONTH(InvoiceDate) = 1
  );
11. Объединить названия товаров из Products и Products_Discounted (с дубликатами)
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
UNION ALL сохраняет дубликаты.
12. Объединить названия товаров без дубликатов
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
UNION убирает дубликаты.

13. Средняя сумма заказа по годам (Orders)
SELECT YEAR(OrderDate) AS OrderYear, AVG(TotalAmount) AS AvgAmount
FROM Orders
GROUP BY YEAR(OrderDate);
14. Группировка товаров по цене ('Low', 'Mid', 'High')
SELECT ProductName,
       CASE 
            WHEN Price < 100 THEN 'Low'
            WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
            ELSE 'High'
       END AS PriceGroup
FROM Products;
15. Pivot: население по годам (City_Population → Population_Each_Year)
SELECT district_name, [2012], [2013]
INTO Population_Each_Year
FROM (
    SELECT district_name, population, year
    FROM City_Population
) AS src
PIVOT (
    SUM(population) FOR year IN ([2012], [2013])
) AS pvt;
16. Общая сумма продаж по каждому ProductID (Sales)
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;
17. Товары, в названии которых есть 'oo'
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';
18. Pivot: население по районам (City_Population → Population_Each_City)

SELECT year, Bektemir, Chilonzor, Yakkasaroy
INTO Population_Each_City
FROM (
    SELECT year, district_name, population
    FROM City_Population
) AS src
PIVOT (
    SUM(population) FOR district_name IN (Bektemir, Chilonzor, Yakkasaroy)
) AS pvt;
Hard‑уровень
19. Топ‑3 клиента по сумме счетов (Invoices)
SELECT TOP 3 CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC;
20. Преобразовать Population_Each_Year обратно в City_Population
SELECT district_name, '2012' AS Year, [2012] AS Population
FROM Population_Each_Year
UNION ALL
SELECT district_name, '2013', [2013]
FROM Population_Each_Year;
21. Название товара + сколько раз продан (Products + Sales)
SELECT p.ProductName, COUNT(s.SaleID) AS TimesSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;
22. Преобразовать Population_Each_City обратно в City_Population
SELECT 'Bektemir' AS district_name, year, Bektemir AS population
FROM Population_Each_City
UNION ALL
SELECT 'Chilonzor', year, Chilonzor
FROM Population_Each_City
UNION ALL
SELECT 'Yakkasaroy', year, Yakkasaroy
FROM Population_Each_City;
