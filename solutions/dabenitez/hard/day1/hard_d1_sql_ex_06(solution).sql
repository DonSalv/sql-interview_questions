Create table Stadium (id int, visit_date date, people int);

ALTER TABLE Stadium ADD PRIMARY KEY (id, visit_date) DISABLE;

insert into Stadium (id, visit_date, people) values ('1', TO_DATE('2017-01-01','YYYY-MM-DD'), '10');
insert into Stadium (id, visit_date, people) values ('2', TO_DATE('2017-01-02','YYYY-MM-DD'), '109');
insert into Stadium (id, visit_date, people) values ('3', TO_DATE('2017-01-03','YYYY-MM-DD'), '150');
insert into Stadium (id, visit_date, people) values ('4', TO_DATE('2017-01-04','YYYY-MM-DD'), '99');
insert into Stadium (id, visit_date, people) values ('5', TO_DATE('2017-01-05','YYYY-MM-DD'), '145');
insert into Stadium (id, visit_date, people) values ('6', TO_DATE('2017-01-06','YYYY-MM-DD'), '1455');
insert into Stadium (id, visit_date, people) values ('7', TO_DATE('2017-01-07','YYYY-MM-DD'), '199');
insert into Stadium (id, visit_date, people) values ('8', TO_DATE('2017-01-09','YYYY-MM-DD'), '188');

SELECT id, visit_date, people FROM
(SELECT id, visit_date, people,
COUNT(id) OVER (PARTITION BY consecutive) AS num FROM 
(SELECT id, visit_date, people, 
id-ROW_NUMBER() OVER (ORDER BY id) AS consecutive
FROM Stadium WHERE people>=100))
WHERE num>=3 ORDER BY visit_date;

DROP TABLE Stadium PURGE;