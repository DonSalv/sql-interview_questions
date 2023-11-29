-- Create the products table
CREATE TABLE Products (product_id int, store varchar(8), price int);

-- Populate the products table    
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, store, price) VALUES ('1', 'Shop', '110');
INSERT INTO Products (product_id, store, price) VALUES ('1', 'LC_Store', '100');
INSERT INTO Products (product_id, store, price) VALUES ('2', 'Nozama', '200');
INSERT INTO Products (product_id, store, price) VALUES ('2', 'Souq', '190');
INSERT INTO Products (product_id, store, price) VALUES ('3', 'Shop', '1000');
INSERT INTO Products (product_id, store, price) VALUES ('3', 'Souq', '1900');

-- Solve the exercise
SELECT * FROM Products
PIVOT(
    MAX(price)
    FOR store
    IN ('LC_Store','Nozama','Shop', 'Souq')
);

-- Drop unused table
DROP TABLE Products;