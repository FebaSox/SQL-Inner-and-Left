-- Joins Examples

use bestbuy;



SELECT 
    *
FROM
    products
        INNER JOIN
    reviews ON products.ProductID = reviews.ProductID;

SELECT products.ProductID, Name, Price, Rating, Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID;

SELECT employees.EmployeeID, LastName, Title, ProductID, Quantity
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID;

-- Aggregate Column Example
SELECT employees.EmployeeID, LastName, Title, ProductID, SUM(Quantity)
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY EmployeeID, ProductID
ORDER BY EmployeeID, ProductID;




