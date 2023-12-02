Create table Olympic (country varchar(50), gold_medals int, silver_medals int, bronze_medals int, CONSTRAINT Olympic_pk PRIMARY KEY (country));

insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('China', '10', '10', '20');
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('South Sudan', '0', '0', '1');
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('USA', '10', '10', '20');
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('Israel', '2', '2', '3');
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('Egypt', '2', '2', '2');

SELECT * FROM Olympic
ORDER BY gold_medals DESC, silver_medals DESC, bronze_medals DESC, country;

DROP TABLE Olympic PURGE;