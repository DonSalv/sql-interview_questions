Create table Elements (symbol varchar(2), type VARCHAR2(10), electrons int, CONSTRAINT Elements_pk PRIMARY KEY (symbol),
CONSTRAINT type_check CHECK (type IN ('Metal', 'Nonmetal', 'Noble')));

insert into Elements (symbol, type, electrons) values ('He', 'Noble', '0');
insert into Elements (symbol, type, electrons) values ('Na', 'Metal', '1');
insert into Elements (symbol, type, electrons) values ('Ca', 'Metal', '2');
insert into Elements (symbol, type, electrons) values ('La', 'Metal', '3');
insert into Elements (symbol, type, electrons) values ('Cl', 'Nonmetal', '1');
insert into Elements (symbol, type, electrons) values ('O', 'Nonmetal', '2');
insert into Elements (symbol, type, electrons) values ('N', 'Nonmetal', '3');

SELECT Q1.symbol, Q2.Symbol FROM
(SELECT symbol FROM Elements
WHERE type='Metal') Q1
CROSS JOIN
(SELECT symbol FROM Elements
WHERE type='Nonmetal') Q2;

DROP TABLE Elements PURGE;