Easy 1. Псевдоним ProductName как Name
Псевдоним (alias) используется для временного переименования столбца в результирующем наборе. Здесь 'ProductName' будет отображаться как 'Name'.
SELECT ProductName AS Name FROM Products;
Easy 2. Псевдоним таблицы Customers как Client
Псевдонимы для таблиц позволяют упростить чтение запросов или использовать сокращенные имена при объединении.
SELECT * FROM Customers AS Client;
Easy 3. Объединение товаров из двух таблиц (UNION)
UNION объединяет уникальные строки из двух наборов результатов. Повторяющиеся значения удаляются.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
Easy 4. Пересечение товаров из двух таблиц (INTERSECT)
INTERSECT возвращает только те строки, которые присутствуют в обоих запросах.
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;
Easy 5. Уникальные комбинации имени и страны клиентов
DISTINCT исключает дубликаты в комбинации выбранных столбцов.
SELECT DISTINCT FirstName, LastName, Country FROM Customers;
Easy 6. Классификация цены на High/Low через CASE
CASE используется для создания условных логических выражений внутри SQL-запроса.
SELECT ProductName,
       Price,
       CASE
           WHEN Price > 1000 THEN 'High'
           ELSE 'Low'
       END AS PriceCategory
FROM Products;
Easy 7. IIF — проверка количества на складе
IIF — это упрощенная форма IF-THEN-ELSE, которая возвращает 'Yes', если количество больше 100, иначе — 'No'.
SELECT ProductName,
       StockQuantity,
       IIF(StockQuantity > 100, 'Yes', 'No') AS IsStockHigh
FROM Products_Discounted;
Medium 1. Объединение товаров (повтор)
Повтор предыдущего задания на использование UNION.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
Medium 2. Различия в наименованиях товаров (EXCEPT)
EXCEPT возвращает строки из первого запроса, которых нет во втором.
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;
Medium 3. Оценка ценовой категории через IIF
Условная логика через IIF для определения ценовой категории продукта.
SELECT ProductName,
       Price,
       IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceLevel
FROM Products;
Medium 4. Фильтр сотрудников: младше 25 или с высокой зарплатой
Простой логический фильтр с использованием OR для выбора сотрудников по возрасту или зарплате.
SELECT * FROM Employees
WHERE Age < 25 OR Salary > 60000;
Medium 5. Обновление зарплаты в HR или для ID 5
UPDATE изменяет данные. Здесь мы увеличиваем зарплату на 10% по условию.
UPDATE Employees
SET Salary = Salary * 1.1
WHERE DepartmentName = 'HR' OR EmployeeID = 5;
Hard 1. Классификация продаж по уровню через CASE
CASE позволяет определить уровень продажи на основе её суммы.
SELECT SaleID,
       SaleAmount,
       CASE
           WHEN SaleAmount > 500 THEN 'Top Tier'
           WHEN SaleAmount BETWEEN 200 AND 500 THEN 'Mid Tier'
           ELSE 'Low Tier'
       END AS Tier
FROM Sales;
Hard 2. Покупатели с заказами, но без продаж
EXCEPT находит клиентов, сделавших заказы, но без записей о продажах.
SELECT DISTINCT CustomerID FROM Orders
EXCEPT
SELECT DISTINCT CustomerID FROM Sales;
Hard 3. Определение процента скидки через CASE
CASE определяет размер скидки в зависимости от количества товара в заказе.
SELECT CustomerID,
       Quantity,
       CASE
           WHEN Quantity = 1 THEN '3%'
           WHEN Quantity BETWEEN 2 AND 3 THEN '5%'
           ELSE '7%'
       END AS DiscountPercent
FROM Orders;
