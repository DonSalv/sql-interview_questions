-- Create the olynpic table
Create table Olympic (country varchar(50), gold_medals int, silver_medals int, bronze_medals int);

-- Populate the olympic table    
Truncate table Olympic;
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('China', 10, 10, 20);
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('South Sudan', 0, 0, 1);
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('USA', 10, 10, 20);
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('Israel', 2, 2, 3);
insert into Olympic (country, gold_medals, silver_medals, bronze_medals) values ('Egypt', 2, 2, 2);

-- The Olympic table is sorted according to the following rules:
--      * The country with more gold medals comes first.
--      * If there is a tie in the gold medals, the country with more silver medals comes first.
--      * If there is a tie in the silver medals, the country with more bronze medals comes first.
--      * If there is a tie in the bronze medals, the countries with the tie are sorted in ascending order lexicographically.
-- Write a solution to sort the Olympic table
SELECT 
    * 
FROM Olympic 
ORDER BY 
    gold_medals DESC, 
    silver_medals DESC, 
    bronze_medals DESC,
    country;

-- Drop tables
DROP TABLE Olympic;
