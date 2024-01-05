CREATE TABLE Products (product_id INT, LC_Store INT, Nozama INT, Shop INT, Souq INT, CONSTRAINT Products_pk PRIMARY KEY (product_id));

INSERT INTO Products (product_id, LC_Store, Nozama, Shop, Souq) VALUES ('1', '100', NULL, '110', NULL);
INSERT INTO Products (product_id, LC_Store, Nozama, Shop, Souq) VALUES ('2', NULL, '200', NULL, '190');
INSERT INTO Products (product_id, LC_Store, Nozama, Shop, Souq) VALUES ('3', NULL, NULL, '1000', '1900');

SELECT * FROM Products
UNPIVOT(price FOR store IN 
(LC_Store AS 'LC_Store', Nozama AS 'Nozama', Shop AS 'Shop', Souq AS 'Souq'));

DROP TABLE Products PURGE;