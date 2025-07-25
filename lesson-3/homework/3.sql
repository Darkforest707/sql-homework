EASY
1. BULK INSERT — это команда в SQL Server, которая позволяет быстро импортировать данные из файла (например, .csv, .txt) в таблицу.
-- Пример:
BULK INSERT Products
FROM 'C:\data\products.txt'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
2. 4 формата файлов для импорта csv, txt, xls / .xlsx (через SSIS или OPENROWSET), xml / .json (через специальные функции)
3. CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10,2)
);
4. INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Laptop', 1500.00),
(2, 'Mouse', 25.50),
(3, 'Keyboard', 45.00);
5. Разница между NULL и NOT NULL
NULL — означает отсутствие значения. Поле может быть пустым.

NOT NULL — значение обязательно. Нельзя оставить пустым.

6. ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
7. -- Этот запрос вставляет новую запись в таблицу Products
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (4, 'Monitor', 300.00);
8. ALTER TABLE Products
ADD CategoryID INT;
9. CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(50) UNIQUE
);
10. IDENTITY — это автоинкрементное поле. SQL Server сам увеличивает значение при добавлении строк.
CREATE TABLE Example (
  ID INT IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(50)
);
(1,1) означает: старт с 1, приращение на 1.
Medium Level
11. BULK INSERT Products
FROM 'C:\data\products.txt'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);
Файл должен быть доступен серверу SQL.

12. ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
13.В PRIMARY KEY – уникальность да NULL нельзя на таблицу только один.	 UNIQUE – Уникальность Null значения разрешены и на таблицу несколько.
14 ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);
15. ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
16. SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;
17. FOREIGN KEY — это ограничение, которое обеспечивает связь между двумя таблицами. Оно гарантирует, что значение в одной таблице существует в другой (например, CategoryID должен быть в таблице Categories).

Hard level
18. CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Age INT,
  CONSTRAINT CHK_Age CHECK (Age >= 18)
);
19. CREATE TABLE TestIdentity (
  ID INT IDENTITY(100,10) PRIMARY KEY,
  Description VARCHAR(50)
);
20. CREATE TABLE OrderDetails (
  OrderID INT,
  ProductID INT,
  Quantity INT,
  PRIMARY KEY (OrderID, ProductID)
);
21. ISNULL(expr, replacement) — только 2 аргумента.
COALESCE(expr1, expr2, expr3, ...) — возвращает первое НЕ NULL значение.

SELECT ISNULL(NULL, 'Default');         -- Возвращает 'Default'
SELECT COALESCE(NULL, NULL, 'X', 'Y');  -- Возвращает 'X'
22. CREATE TABLE Employees (
  EmpID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100) UNIQUE
);
23. CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  CONSTRAINT FK_Orders_Customers
  FOREIGN KEY (CustomerID)
  REFERENCES Customers(CustomerID)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
