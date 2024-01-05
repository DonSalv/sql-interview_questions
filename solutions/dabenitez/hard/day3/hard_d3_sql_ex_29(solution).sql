Create table Terms (power int, factor int, CONSTRAINT Terms_pk PRIMARY KEY (power));

insert into Terms (power, factor) values ('2', '1');
insert into Terms (power, factor) values ('1', '-4');
insert into Terms (power, factor) values ('0', '2');

SELECT LISTAGG(monomial) WITHIN GROUP (ORDER BY power DESC) 
|| '=0' AS equation FROM
(SELECT power,
(CASE WHEN factor<0 THEN '' ELSE '+' END) || factor || 
(CASE WHEN power=0 THEN '' WHEN power=1 THEN 'X' ELSE 'X^' || TO_CHAR(power) END) 
AS monomial FROM Terms ORDER BY power DESC);

DROP TABLE Terms PURGE;
