-- Create the elements table
CREATE TABLE Elements (symbol varchar(2), type varchar(8) CHECK(type IN ('Metal','Nonmetal','Noble')), electrons int);

-- Populate the elements table    
TRUNCATE TABLE Elements;
INSERT INTO Elements (symbol, type, electrons) VALUES ('He', 'Noble', '0');
INSERT INTO Elements (symbol, type, electrons) VALUES ('Na', 'Metal', '1');
INSERT INTO Elements (symbol, type, electrons) VALUES ('Ca', 'Metal', '2');
INSERT INTO Elements (symbol, type, electrons) VALUES ('La', 'Metal', '3');
INSERT INTO Elements (symbol, type, electrons) VALUES ('Cl', 'Nonmetal', '1');
INSERT INTO Elements (symbol, type, electrons) VALUES ('O', 'Nonmetal', '2');
INSERT INTO Elements (symbol, type, electrons) VALUES ('N', 'Nonmetal', '3');

-- Solve the exercise
SELECT e1.symbol AS metal, e2.symbol AS nonmetal
FROM Elements e1 CROSS JOIN Elements e2
WHERE e1.type='Metal' AND e2.type='Nonmetal';

-- Drop unused table
DROP TABLE Elements;