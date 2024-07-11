
-- joins: select all the computers from the products table:
SELECT * FROM products WHERE CategoryID = 1;

-- using the products table and the categories table, return the product name and the category name 

SELECT products.Name, categories.Name
FROM products 
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT Name, Price, Rating
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
 SELECT employees.EmployeeID, employees.FirstName, employees.LastName, SUM(sales.Quantity) AS total_quantity_sold
 FROM employees
 INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
 GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName
 ORDER BY total_quantity_sold DESC
 LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM departments
INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name IN ('Appliances', 'Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT Name, SUM(sales.Quantity), SUM(sales.Quantity)
FROM products
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name LIKE 'Eagles: HotelCalifornia'
GROUP BY products.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE 'Visio TV'
ORDER BY reviews.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity)
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON  sales.ProductID = products.ProductID
GROUP BY emmployees.EmployeeID, employees.FirstName, employees.LastName, products.Name
ORDER BY employees.EmployeeID, products.Name;