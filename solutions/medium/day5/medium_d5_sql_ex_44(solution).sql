Create Table Variables (name varchar(3), value int, CONSTRAINT Variables_pk PRIMARY KEY (name));
Create Table Expressions (left_operand varchar(3), operator VARCHAR2(2), right_operand varchar(3),
CONSTRAINT operator_check CHECK (operator IN ('>', '<', '=')));

ALTER TABLE Expressions ADD PRIMARY KEY (left_operand, operator, right_operand) DISABLE;

insert into Variables (name, value) values ('x', '66');
insert into Variables (name, value) values ('y', '77');

insert into Expressions (left_operand, operator, right_operand) values ('x', '>', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('x', '<', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('y', '>', 'x');
insert into Expressions (left_operand, operator, right_operand) values ('y', '<', 'x');
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'x');

SELECT e.left_operand, e.operator, e.right_operand, CASE
WHEN e.operator = '>' THEN (CASE WHEN v1.value > v2.value THEN 'True' ELSE 'False' END)
WHEN e.operator = '<' THEN (CASE WHEN v1.value < v2.value THEN 'True' ELSE 'False' END)
WHEN e.operator = '=' THEN (CASE WHEN v1.value = v2.value THEN 'True' ELSE 'False' END)
END AS value
FROM Expressions e 
JOIN Variables v1 ON e.left_operand = v1.name
JOIN Variables v2 ON e.right_operand = v2.name;

DROP TABLE Expressions PURGE;
DROP TABLE Variables PURGE;