CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);

INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

1.Найти уникальные значения по двум колонкам. Вывести уникальные пары значений из col1 и col2, при этом (a, b) и (b, a) считаются одной и той же парой.
Способ 1 — Использовать LEAST() и GREATEST() (если поддерживается):
SELECT DISTINCT 
    LEAST(col1, col2) AS col1,
    GREATEST(col1, col2) AS col2
FROM InputTbl;
Способ 2 — Сортировка вручную через CASE:
SELECT DISTINCT
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;
2. Удалить строки, где все значения равны 0
CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);
Запрос:
SELECT * FROM TestMultipleZero
WHERE A + B + C + D <> 0;
3. Найти людей с нечетными id
CREATE TABLE section1(id INT, name VARCHAR(20));

INSERT INTO section1 VALUES
(1, 'Been'),
(2, 'Roma'),
(3, 'Steven'),
(4, 'Paulo'),
(5, 'Genryh'),
(6, 'Bruno'),
(7, 'Fred'),
(8, 'Andro');
Запрос:
SELECT * FROM section1
WHERE id % 2 = 1;
4. Найти человека с самым маленьким id
SELECT * FROM section1
WHERE id = (SELECT MIN(id) FROM section1);
5. Найти человека с самым большим id
SELECT * FROM section1
WHERE id = (SELECT MAX(id) FROM section1);
6. Найти людей, чье имя начинается с буквы 'b'
В SQL это регистрозависимо. Поэтому стоит использовать LOWER(name) или ILIKE, если доступно.
SELECT * FROM section1
WHERE LOWER(name) LIKE 'b%';
7. Найти строки, в которых код содержит символ подчеркивания _ как обычный символ
Таблица:
CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');
Запрос:
SELECT * FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';

