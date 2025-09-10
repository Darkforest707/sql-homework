1. Все комбинации товаров и поставщиков (Cartesian Product)
SELECT p.ProductName, s.SupplierName
FROM Products p
CROSS JOIN Suppliers s;
CROSS JOIN даёт все возможные пары.
2. Все комбинации департаментов и сотрудников
SELECT d.DepartmentName, e.Name
FROM Departments d
CROSS JOIN Employees e;
3. Товары и их реальные поставщики
SELECT s.SupplierName, p.ProductName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;
4. Заказы и клиенты
SELECT c.FirstName + ' ' + c.LastName AS CustomerName, o.OrderID
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;
5. Все комбинации студентов и курсов
SELECT s.Name AS StudentName, c.CourseName
FROM Students s
CROSS JOIN Courses c;
6. Товары и заказы по ProductID
SELECT p.ProductName, o.OrderID
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID;
7. Сотрудники с департаментами (по DepartmentID)
SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
8. Студенты и их зачисленные курсы
SELECT s.Name AS StudentName, e.CourseID
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID;
9. Заказы с оплатами
SELECT o.OrderID, p.Amount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID;
10. Заказы, где цена товара > 100
SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100;
Medium (10)
11. Все несовпадающие Employee–Department (ID разные)
SELECT e.Name, d.DepartmentName
FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;
12. Заказы, где Quantity > Stock
SELECT o.OrderID, o.Quantity, p.StockQuantity
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE o.Quantity > p.StockQuantity;
13. Клиенты и товары, где сумма продажи ≥ 500
SELECT c.FirstName + ' ' + c.LastName AS CustomerName, s.ProductID, s.SaleAmount
FROM Sales s
INNER JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE s.SaleAmount >= 500;
14. Студенты и названия курсов, на которые зачислены
SELECT s.Name AS StudentName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

15. Товары и поставщики, где SupplierName содержит "Tech"
SELECT p.ProductName, s.SupplierName
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

16. Заказы, где Payment < TotalAmount
SELECT o.OrderID, o.TotalAmount, p.Amount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;

17. Департамент для каждого сотрудника
SELECT e.Name, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

18. Товары из категорий Electronics или Furniture
SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');

19. Продажи клиентов из США
SELECT s.SaleID, c.FirstName, c.Country
FROM Sales s
INNER JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

20. Заказы клиентов из Германии с Total > 100
SELECT o.OrderID, c.FirstName, o.TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.TotalAmount > 100;
Hard (5)
21. Все пары сотрудников из разных департаментов
SELECT e1.Name AS Employee1, e2.Name AS Employee2
FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID < e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID;

22. Оплаты, где Amount ≠ Quantity × Price
SELECT pay.PaymentID, pay.Amount, (o.Quantity * p.Price) AS ExpectedAmount
FROM Payments pay
INNER JOIN Orders o ON pay.OrderID = o.OrderID
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE pay.Amount <> (o.Quantity * p.Price);

23. Студенты, не зачисленные ни на один курс
SELECT s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

24. Менеджеры, у которых зарплата ≤ подчинённых
SELECT m.Name AS Manager, e.Name AS Employee, m.Salary AS ManagerSalary, e.Salary AS EmployeeSalary
FROM Employees e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;

25. Клиенты с заказами без оплат
SELECT DISTINCT c.FirstName + ' ' + c.LastName AS CustomerName, o.OrderID
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.OrderID IS NULL;

