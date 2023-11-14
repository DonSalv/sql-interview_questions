-- Create the products table
Create table Products (product_id int, low_fats varchar(2) CONSTRAINT check_enum_values CHECK (low_fats IN ('Y', 'N')), recyclable varchar(2) CONSTRAINT check_enum_values_2 CHECK (recyclable IN ('Y', 'N')));

-- Populate the prodcuts table
Truncate table Products;
insert into Products (product_id, low_fats, recyclable) values (0, 'Y', 'N');
insert into Products (product_id, low_fats, recyclable) values (1, 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values (2, 'N', 'Y');
insert into Products (product_id, low_fats, recyclable) values (3, 'Y', 'Y');
insert into Products (product_id, low_fats, recyclable) values (4, 'N', 'N');

-- Write a solution to find the ids of products that are both low fat and recyclable
SELECT
    product_id
FROM Products
WHERE low_fats = 'Y' AND
      recyclable = 'Y';

-- Drop tables
DROP TABLE Products;
