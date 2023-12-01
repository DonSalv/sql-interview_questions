Create table Days (day date, CONSTRAINT Days_pk PRIMARY KEY (day));

insert into Days (day) values (TO_DATE('2022-04-12','YYYY-MM-DD'));
insert into Days (day) values (TO_DATE('2021-08-09','YYYY-MM-DD'));
insert into Days (day) values (TO_DATE('2020-06-26','YYYY-MM-DD'));

SELECT TO_CHAR(day, 'FMDay, Month DD, YYYY') AS day FROM Days;

DROP TABLE Days PURGE;