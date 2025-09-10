Easy-Level (10)
1. Сотрудники с зарплатой > 50000 и их департамент
SELECT e.Name AS EmployeeName, e.Salary, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000;
2. Клиенты и заказы за 2023 год
SELECT c.FirstName, c.LastName, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2023;

3. Все сотрудники и их департаменты (включая без департамента)
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

4. Все поставщики и их товары (даже если нет товара)
SELECT s.SupplierName, p.ProductName
FROM Suppliers s
LEFT JOIN Products p ON s.SupplierID = p.SupplierID;

5. Заказы и оплаты (все заказы и все оплаты, даже без связи)
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
FULL OUTER JOIN Payments p ON o.OrderID = p.OrderID;

6. Сотрудник и его менеджер
SELECT e.Name AS EmployeeName, m.Name AS ManagerName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

7. Студенты, зачисленные на Math 101
SELECT s.Name AS StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';

8. Клиенты, сделавшие заказ с Quantity > 3
SELECT c.FirstName, c.LastName, o.Quantity
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.Quantity > 3;

9. Сотрудники из отдела Human Resources
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';

Medium-Level (9)
10. Департаменты с количеством сотрудников > 5
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5;

11. Продукты, которые никогда не продавались
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.SaleID IS NULL;

12. Клиенты, сделавшие хотя бы один заказ
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

13. Сотрудники и департаменты только с существующими связями
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

14. Пары сотрудников с одним менеджером
SELECT e1.Name AS Employee1, e2.Name AS Employee2, e1.ManagerID
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE e1.EmployeeID < e2.EmployeeID;

15. Заказы 2022 года + имя клиента
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;

16. Сотрудники отдела Sales с зарплатой > 60000
SELECT e.Name AS EmployeeName, e.Salary, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' AND e.Salary > 60000;

17. Только заказы, у которых есть оплата
SELECT o.OrderID, o.OrderDate, p.PaymentDate, p.Amount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID;

18. Продукты, которые не заказывали
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL;

Hard-Level (9)
19. Сотрудники с зарплатой выше средней по своему отделу
SELECT e.Name AS EmployeeName, e.Salary
FROM Employees e
INNER JOIN (
    SELECT DepartmentID, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY DepartmentID
) dept ON e.DepartmentID = dept.DepartmentID
WHERE e.Salary > dept.AvgSalary;

20. Заказы до 2020 года без оплаты
SELECT o.OrderID, o.OrderDate
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE o.OrderDate < '2020-01-01' AND p.OrderID IS NULL;
21. Продукты без категории
SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryID IS NULL;
22. Сотрудники с одним менеджером и зарплатой > 60000
SELECT e1.Name AS Employee1, e2.Name AS Employee2, e1.ManagerID, e1.Salary
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE e1.EmployeeID < e2.EmployeeID AND e1.Salary > 60000;

23. Сотрудники из департаментов на "M"
SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName LIKE 'M%';

24. Продажи > 500 с названием продукта
SELECT s.SaleID, p.ProductName, s.SaleAmount
FROM Sales s
INNER JOIN Products p ON s.ProductID = p.ProductID
WHERE s.SaleAmount > 500;

25. Студенты, НЕ записанные на Math 101
SELECT s.StudentID, s.Name AS StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT e.StudentID
    FROM Enrollments e
    INNER JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Math 101'
);
26. Заказы без платежей
SELECT o.OrderID, o.OrderDate, p.PaymentID
FROM Orders o
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
27. Продукты в категориях Electronics или Furniture
SELECT p.ProductID, p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');

