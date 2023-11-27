-- Create the tables
Create Table Variables (name varchar(3), value int);
Create Table Expressions (left_operand varchar(3), operator varchar(2) CONSTRAINT check_enum_values CHECK (operator IN ('>', '<', '=')), right_operand varchar(3));

-- Populate the variables table    
Truncate table Variables;
insert into Variables (name, value) values ('x', 66);
insert into Variables (name, value) values ('y', 77);

-- Populate the expressions table    
Truncate table Expressions;
insert into Expressions (left_operand, operator, right_operand) values ('x', '>', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('x', '<', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('y', '>', 'x');
insert into Expressions (left_operand, operator, right_operand) values ('y', '<', 'x');
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'x');

-- Evaluate the boolean expressions in EXPRESSIONS table
SELECT
  e.left_operand,
  e.operator,
  e.right_operand,
  CASE
    WHEN e.operator = '>' THEN
      CASE
        WHEN v1.value > v2.value THEN 'true'
        ELSE 'false'
      END
    WHEN e.operator = '<' THEN
      CASE
        WHEN v1.value < v2.value THEN 'true'
        ELSE 'false'
      END
    WHEN e.operator = '=' THEN
      CASE
        WHEN v1.value = v2.value THEN 'true'
        ELSE 'false'
      END
    ELSE 'unknown operator'
  END AS value
FROM 
    Expressions e
INNER JOIN 
    Variables v1 
ON 
    e.left_operand = v1.name
INNER JOIN 
    Variables v2 
ON 
    e.right_operand = v2.name;
    
-- Drop tables
DROP TABLE Variables;
DROP TABLE Expressions;
