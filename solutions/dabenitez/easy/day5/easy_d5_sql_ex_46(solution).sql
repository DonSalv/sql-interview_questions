Create Table NPV (id int, year int, npv int);
Create Table Queries (id int, year int);

ALTER TABLE NPV ADD PRIMARY KEY (id, year) DISABLE;
    
ALTER TABLE Queries ADD PRIMARY KEY (id, year) DISABLE;

insert into NPV (id, year, npv) values ('1', '2018', '100');
insert into NPV (id, year, npv) values ('7', '2020', '30');
insert into NPV (id, year, npv) values ('13', '2019', '40');
insert into NPV (id, year, npv) values ('1', '2019', '113');
insert into NPV (id, year, npv) values ('2', '2008', '121');
insert into NPV (id, year, npv) values ('3', '2009', '21');
insert into NPV (id, year, npv) values ('11', '2020', '99');
insert into NPV (id, year, npv) values ('7', '2019', '0');

insert into Queries (id, year) values ('1', '2019');
insert into Queries (id, year) values ('2', '2008');
insert into Queries (id, year) values ('3', '2009');
insert into Queries (id, year) values ('7', '2018');
insert into Queries (id, year) values ('7', '2019');
insert into Queries (id, year) values ('7', '2020');
insert into Queries (id, year) values ('13', '2019');

SELECT q.id, q.year, COALESCE(SUM(npv),0) AS npv FROM Queries q
LEFT JOIN NPV n
ON q.id=n.id AND q.year=n.year
GROUP BY q.id, q.year
ORDER BY q.id, q.year;

DROP TABLE Queries PURGE;
DROP TABLE NPV PURGE;