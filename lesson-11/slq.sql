1. Show all orders placed after 2022 along with the names of the customers who placed them.

SELECT o.OrderID, 
       c.FirstName + ' ' + c.LastName AS CustomerName, 
       o.OrderDate
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) > 2022;

2. Display the names of employees who work in either the Sales or Marketing department.

SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');

3. Show the highest salary for each department.

SELECT d.DepartmentName, MAX(e.Salary) AS MaxSalary
FROM Departments d
JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

4. List all customers from the USA who placed orders in the year 2023.

SELECT c.FirstName + ' ' + c.LastName AS CustomerName, o.OrderID, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND YEAR(o.OrderDate) = 2023;

5. Show how many orders each customer has placed.

SELECT c.FirstName + ' ' + c.LastName AS CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

6. Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.

SELECT p.ProductName, s.SupplierName
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');

7. For each customer, show their most recent order. Include customers who haven't placed any orders.

SELECT c.FirstName + ' ' + c.LastName AS CustomerName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

8. Show the customers who have placed an order where the total amount is greater than 500.

SELECT DISTINCT c.FirstName + ' ' + c.LastName AS CustomerName, o.TotalAmount AS OrderTotal
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > 500;

9. List product sales where the sale was made in 2022 or the sale amount exceeded 400.

SELECT p.ProductName, s.SaleDate, s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2022 OR s.SaleAmount > 400;

10. Display each product along with the total amount it has been sold for.

SELECT p.ProductName, SUM(s.SaleAmount) AS TotalSalesAmount
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;

11. Show the employees who work in the HR department and earn a salary greater than 60000.

SELECT e.Name AS EmployeeName, d.DepartmentName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources' AND e.Salary > 60000;

12. List the products that were sold in 2023 and had more than 100 units in stock at the time.

SELECT p.ProductName, s.SaleDate, p.StockQuantity
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2023 AND p.StockQuantity > 100;

13. Show employees who either work in the Sales department or were hired after 2020.

SELECT e.Name AS EmployeeName, d.DepartmentName, e.HireDate
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR e.HireDate > '2020-12-31';

14. List all orders made by customers in the USA whose address starts with 4 digits.

SELECT c.FirstName + ' ' + c.LastName AS CustomerName, o.OrderID, c.Address, o.OrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND c.Address LIKE '[0-9][0-9][0-9][0-9]%';

15. Display product sales for items in the Electronics category or where the sale amount exceeded 350.

SELECT p.ProductName, c.CategoryName, s.SaleAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName = 'Electronics' OR s.SaleAmount > 350;

16. Show the number of products available in each category.

SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.Category
GROUP BY c.CategoryName;

17. List orders where the customer is from Los Angeles and the order amount is greater than 300.

SELECT c.FirstName + ' ' + c.LastName AS CustomerName, c.City, o.OrderID, o.TotalAmount AS Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Los Angeles' AND o.TotalAmount > 300;

18. Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.

SELECT e.Name AS EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Human Resources', 'Finance')
   OR (LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'a', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'e', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'i', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'o', '')) 
      + LEN(e.Name) - LEN(REPLACE(LOWER(e.Name), 'u', ''))) >= 4;

19. Show employees who are in the Sales or Marketing department and have a salary above 60000.

SELECT e.Name AS EmployeeName, d.DepartmentName, e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing') AND e.Salary > 60000;

