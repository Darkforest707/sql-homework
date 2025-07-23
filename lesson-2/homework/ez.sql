--BASIC LEVEL
1. Create Table Employees (
  EmpID INT,
  Name Varchar(50),
  Salary Decimal(10,2)
  );
2. --Единичная вставка 
INSERT INTO Employees (EmpID, Name, Salary)
Value (1, Ali Karimov, 6000);
--Множественная вставка
INSERT INTO Employees (Name, EmpID, Salary)
VALUES
(Nodira Tursunova, 2, 5500),
(Sardor Rustamov, 3, 4800);
3. UPDATE Employees 
SET Salary = 7000
WHERE EmpID = 1;
4. DELETE FROM Employees
WHERE EmpID = 2;
5. Delete - удаляет выбранные строки можно использовать WHERE можно откатить если транзакция
TRUNCATE удаляет все строки таблицы без возможности WHERE работает быстрее нельзя откатить
DROP - полностью удаляет таблицу;
6. ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);
7. ALTER TABLE Employees
ADD DEPARTMENT VARCHAR (50);
8. ALTER TABLE EMPLOYEES
ALTER COLUMN Salary FLOAT;
9.CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  DepartmentName Varchar(50)
  );
10. TRUNCATE TABLE Employees;
-- Intermediate Level
11. INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'HR'
UNION ALL
SELECT 2, 'IT' 
UNION ALL
SELECT 3, 'FINANCE'
UNION ALL
SELECT 4, 'LOGISTICS'
UNION ALL
SELECT 5, 'MARKETING';
--Переносим из временной таблицы в основную
INSERT INTO DEPARTMENTS (DepartmentID, DepartmentName)
SELECT DepartmentID, Departmentname FROM TEMPDepartments;
12. UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
13. Truncate TABLE Employees;
14. ALTER TABLE Employees
Drop Column Department;
15. EXEC SP_RENAME 'EMPLOYEES', 'StaffMembers';
16. DROP TABLE Departments;
-- ADVANCED LEVEL
17. Create table Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Price DECIMAL(10,2)
  Description VARCHAR(255)
  );
18. ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0 );
19. ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;
20. EXEC SP_RENAME 'PRODUCTS.Category', 'ProductCategory', 'Column';
21. INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
(1, 'LAPTOP', 'Electronics', 1500, 'Gaming Laptop', 'NEW'),
(2, 'Phone', 'Electronics', 800, 'Smartphone S80', 'NEW'),
(3, 'Table', 'Furniture', 100, 'Smartphone S80', 'NEW'),
(4, 'Chair', 'Furniture', 50, 'Smartphone S80', 'NEW'),
(5, 'Headphones', 'Electronics', 120, 'JBL', 'NEW');
22. SELECT * INTO Products_Backup
FROM Products;
23. Exec Sp_rename 'Products', 'Inventory';
24. ALTER TABLE Inventory
Alter column price FLOAT;
25. ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5)
