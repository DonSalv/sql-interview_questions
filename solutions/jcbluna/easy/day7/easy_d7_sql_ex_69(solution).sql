-- Create the products table
CREATE TABLE Products (product_id int, low_fats char(1) CHECK(low_fats IN ('Y', 'N')), recyclable char(1) CHECK(recyclable IN ('Y', 'N')));

-- Populate the prodcuts table
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('0', 'Y', 'N');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('1', 'Y', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('2', 'N', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('3', 'Y', 'Y');
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('4', 'N', 'N');

-- Solve the exercise
SELECT product_id
FROM Products
WHERE low_fats='Y'
AND recyclable='Y'
ORDER BY product_id;

-- Drop unused table
DROP TABLE Products;