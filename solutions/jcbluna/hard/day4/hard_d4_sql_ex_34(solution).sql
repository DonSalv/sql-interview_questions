-- Create Products table 
CREATE TABLE Products (product_id INT, LC_Store INT, Nozama INT, Shop INT, Souq INT);

-- Create the products table
TRUNCATE TABLE Products;
INSERT INTO Products (product_id, LC_Store, Nozama, Shop, Souq) VALUES ('1', '100', NULL, '110', NULL);
INSERT INTO Products (product_id, LC_Store, Nozama, Shop, Souq) VALUES ('2', NULL, '200', NULL, '190');
INSERT INTO Products (product_id, LC_Store, Nozama, Shop, Souq) VALUES ('3', NULL, NULL, '1000', '1900');

-- Solve the exercise
SELECT * FROM Products
UNPIVOT(
    price -- unpivot_clause
    FOR store --  unpivot_for_clause
    IN ( -- unpivot_in_clause
        LC_Store AS 'LC_Store', 
        Nozama AS 'Nozama', 
        Shop AS 'Shop',
        Souq AS 'Souq'
    )
);

-- Drop unused table
DROP TABLE Products;