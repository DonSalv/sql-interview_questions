-- Create the elements table
Create table Elements (symbol varchar(2), type varchar(8) CONSTRAINT check_enum_values CHECK (type IN ('Metal','Nonmetal','Noble')), electrons int);

-- Populate the elements table    
Truncate table Elements;
insert into Elements (symbol, type, electrons) values ('He', 'Noble', 0);
insert into Elements (symbol, type, electrons) values ('Na', 'Metal', 1);
insert into Elements (symbol, type, electrons) values ('Ca', 'Metal', 2);
insert into Elements (symbol, type, electrons) values ('La', 'Metal', 3);
insert into Elements (symbol, type, electrons) values ('Cl', 'Nonmetal', 1);
insert into Elements (symbol, type, electrons) values ('O', 'Nonmetal', 2);
insert into Elements (symbol, type, electrons) values ('N', 'Nonmetal', 3);

-- Two elements can form a bond if one of them is 'Metal' and the other is 'Nonmetal'.
-- Write a solution to find all the pairs of elements that can form a bond
SELECT
    t1.symbol metal,
    t2.symbol nonmetal
FROM
    Elements t1
CROSS JOIN
    Elements t2
WHERE
    t1.type = 'Metal'
    AND t2.type = 'Nonmetal';
    
-- Drop table
DROP TABLE Elements;
