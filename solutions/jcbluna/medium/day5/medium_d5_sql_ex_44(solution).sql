-- Create the tables
CREATE TABLE Variables (name varchar(3), value int);
CREATE TABLE Expressions (left_operand varchar(3), operator char(1) CHECK(operator IN ('>', '<', '=')) , right_operand varchar(3));

-- Populate the variables table    
TRUNCATE TABLE Variables;
INSERT INTO Variables (name, value) VALUES ('x', '66');
INSERT INTO Variables (name, value) VALUES ('y', '77');

-- Populate the expressions table    
TRUNCATE TABLE Expressions;
INSERT INTO Expressions (left_operand, operator, right_operand) VALUES ('x', '>', 'y');
INSERT INTO Expressions (left_operand, operator, right_operand) VALUES ('x', '<', 'y');
INSERT INTO Expressions (left_operand, operator, right_operand) VALUES ('x', '=', 'y');
INSERT INTO Expressions (left_operand, operator, right_operand) VALUES ('y', '>', 'x');
INSERT INTO Expressions (left_operand, operator, right_operand) VALUES ('y', '<', 'x');
INSERT INTO Expressions (left_operand, operator, right_operand) VALUES ('x', '=', 'x');

-- Solve the exercise
SELECT left_operand, operator, right_operand,
-- 2. Evaluate the respective expression of the operator
-- with the left and right values correctly
(CASE WHEN (operator='>' AND  x_1>x_2) THEN 'true'
WHEN (operator='<' AND  x_1<x_2) THEN 'true'
WHEN (operator='=' AND  x_1=x_2) THEN 'true'
ELSE 'false' END) AS value
FROM(
-- 1. Create a table with the respective left and right values
-- substituted from the Variables table
SELECT left_operand, operator, right_operand, 
(SELECT value FROM Variables WHERE name=left_operand) AS x_1,
(SELECT value FROM Variables WHERE name=right_operand) AS x_2
FROM Expressions);

-- Drop unused tables
DROP TABLE Variables;
DROP TABLE Expressions;