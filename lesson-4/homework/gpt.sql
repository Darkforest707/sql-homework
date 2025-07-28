Простой уровень
1. Выбрать 5 первых сотрудников из таблицы Employees:
SELECT TOP 5 * FROM Employees;
2. Выбрать уникальные категории из таблицы Products:
SELECT DISTINCT Category FROM Products;
3. Показать товары, у которых цена больше 100:
SELECT * FROM Products WHERE Price > 100;
4. Выбрать клиентов, у которых имя начинается на 'A':
SELECT * FROM Customers WHERE FirstName LIKE 'A%';
5. Отсортировать товары по цене по возрастанию:
SELECT * FROM Products ORDER BY Price ASC;
6. Выбрать сотрудников с зарплатой >= 60000 и департаментом HR:
SELECT * FROM Employees 
WHERE Salary >= 60000 AND DepartmentName = 'HR';
7. Заменить NULL в колонке Email на 'noemail@example.com':
SELECT 
    EmployeeID, 
    FirstName, 
    LastName, 
    ISNULL(Email, 'noemail@example.com') AS Email 
FROM Employees;
8. Показать товары с ценой от 50 до 100 включительно:
SELECT * FROM Products WHERE Price BETWEEN 50 AND 100;
9. SELECT DISTINCT по двум колонкам: Category и ProductName:
SELECT DISTINCT Category, ProductName FROM Products;
10. То же самое, но отсортировать по ProductName по убыванию:
SELECT DISTINCT Category, ProductName 
FROM Products 
ORDER BY ProductName DESC;

Средний уровень
11. Выбрать 10 самых дорогих товаров:
SELECT TOP 10 * FROM Products ORDER BY Price DESC;
12. Вернуть первое ненулевое значение FirstName или LastName:
SELECT EmployeeID, COALESCE(FirstName, LastName) AS Name FROM Employees;
13. Выбрать уникальные комбинации Category и Price:
SELECT DISTINCT Category, Price FROM Products;
14. Сотрудники с возрастом между 30 и 40 или из Marketing:
SELECT * FROM Employees 
WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing';
15. Отобрать сотрудников с 11 по 20 по убыванию зарплаты:
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
16. Товары с ценой до 1000 и запасом > 50, отсортировать по запасу:
SELECT * FROM Products 
WHERE Price <= 1000 AND StockQuantity > 50 
ORDER BY StockQuantity ASC;
17. Найти товары, в названии которых есть буква 'e':
SELECT * FROM Products 
WHERE ProductName LIKE '%e%';
18. Сотрудники из HR, IT или Finance:
SELECT * FROM Employees 
WHERE DepartmentName IN ('HR', 'IT', 'Finance');
19. Упорядочить клиентов по городу (по возрастанию) и по почтовому индексу (по убыванию):
SELECT * FROM Customers 
ORDER BY City ASC, PostalCode DESC;

Сложный уровень
20. Топ-5 товаров с наибольшими продажами по сумме SalesAmount:
SELECT TOP 5 P.ProductName, SUM(S.SaleAmount) AS TotalSales
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSales DESC;
21. Объединить FirstName и LastName в FullName:
SELECT 
    EmployeeID, 
    (ISNULL(FirstName, '') + ' ' + ISNULL(LastName, '')) AS FullName 
FROM Employees;
22. Уникальные комбинации Category, ProductName и Price для товаров с ценой > 50:
SELECT DISTINCT Category, ProductName, Price 
FROM Products 
WHERE Price > 50;
23. Найти товары, чья цена меньше 10% от средней цены всех товаров:
SELECT * FROM Products 
WHERE Price < (SELECT AVG(Price) * 0.1 FROM Products);
24. Сотрудники моложе 30 лет, работающие в HR или IT:
SELECT * FROM Employees 
WHERE Age < 30 AND DepartmentName IN ('HR', 'IT');
25. Клиенты, у которых email содержит '@gmail.com':
SELECT * FROM Customers 
WHERE Email LIKE '%@gmail.com%';
26. Сотрудники, чья зарплата больше всех в отделе Sales (такого отдела нет, но для примера):
SELECT * FROM Employees 
WHERE Salary > ALL (
    SELECT Salary FROM Employees WHERE DepartmentName = 'Sales'
);
⚠ Примечание: В таблице нет сотрудников из отдела 'Sales', поэтому подзапрос вернёт пустой набор. Но синтаксис правильный.
27. Заказы, сделанные за последние 180 дней от самой последней даты заказа:
SELECT * FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, (SELECT MAX(OrderDate) FROM Orders))
                    AND (SELECT MAX(OrderDate) FROM Orders);
