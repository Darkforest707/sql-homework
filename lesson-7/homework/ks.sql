Easy — Лёгкий уровень
1. Минимальная цена продукта
SELECT MIN(Price) AS MinPrice
FROM Products;
Находит наименьшее значение в колонке Price.

2. Максимальная зарплата
SELECT MAX(Salary) AS MaxSalary
FROM Employees;
Возвращает максимальную зарплату среди всех сотрудников.

3. Количество строк в Customers
SELECT COUNT(*) AS TotalCustomers
FROM Customers;
Считает общее число записей.

4. Количество уникальных категорий продуктов
SELECT COUNT(DISTINCT Category) AS UniqueCategories
FROM Products;
Считает только уникальные значения в колонке Category.

5. Общая сумма продаж по продукту с id = 7
SELECT SUM(SaleAmount) AS TotalSales
FROM Sales
WHERE ProductID = 7;
6. Средний возраст сотрудников
SELECT AVG(Age) AS AvgAge
FROM Employees;
7. Количество сотрудников в каждом департаменте
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;
8. Минимальная и максимальная цена по категориям
SELECT Category,
       MIN(Price) AS MinPrice,
       MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;
9. Общая сумма продаж на каждого клиента
SELECT CustomerID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;
10. Департаменты с количеством сотрудников > 5
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;
Medium — Средний уровень
11. Общая и средняя сумма продаж по категориям
SELECT p.Category,
       SUM(s.SaleAmount) AS TotalSales,
       AVG(s.SaleAmount) AS AvgSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;
12. Количество сотрудников в HR
SELECT COUNT(*) AS HREmployees
FROM Employees
WHERE DepartmentName = 'HR';
13. Максимальная и минимальная зарплата по департаментам
SELECT DepartmentName,
       MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary
FROM Employees
GROUP BY DepartmentName;
14. Средняя зарплата по департаментам
SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName;
15. Средняя зарплата и количество сотрудников по департаментам
SELECT DepartmentName,
       AVG(Salary) AS AvgSalary,
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentName;
16. Категории с средней ценой > 400
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;
17. Общая сумма продаж по годам
SELECT YEAR(SaleDate) AS Year, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);
18. Клиенты, сделавшие >= 3 заказов
SELECT CustomerID, COUNT(*) AS OrdersCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 3;
19. Департаменты со средней зарплатой > 60000
SELECT DepartmentName, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 60000;
Hard — Сложный уровень
20. Средняя цена по категориям > 150
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 150;
21. Клиенты с суммой продаж > 1500
SELECT CustomerID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID
HAVING SUM(SaleAmount) > 1500;
22. Общая и средняя зарплата по департаментам (средняя > 65000)
SELECT DepartmentName,
       SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentName
HAVING AVG(Salary) > 65000;
23. Сумма заказов с доставкой > 50 и минимальная покупка клиента
(Требует таблицы tsql2012.sales.orders, поэтому пропущено для локальных данных)
24. Сумма продаж и количество уникальных товаров по месяцам (>= 2 товаров)
SELECT YEAR(OrderDate) AS Year,
       MONTH(OrderDate) AS Month,
       SUM(TotalAmount) AS TotalSales,
       COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(DISTINCT ProductID) >= 2;
25. MIN и MAX количество товара в заказах по годам
SELECT YEAR(OrderDate) AS Year,
       MIN(Quantity) AS MinQuantity,
       MAX(Quantity) AS MaxQuantity
FROM Orders
GROUP BY YEAR(OrderDate);
