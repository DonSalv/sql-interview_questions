Create table Salary (id int, name varchar(100), sex char(1), salary int, CONSTRAINT Salary_pk PRIMARY KEY (id));

insert into Salary (id, name, sex, salary) values ('1', 'A', 'm', '2500');
insert into Salary (id, name, sex, salary) values ('2', 'B', 'f', '1500');
insert into Salary (id, name, sex, salary) values ('3', 'C', 'm', '5500');
insert into Salary (id, name, sex, salary) values ('4', 'D', 'f', '500');

UPDATE Salary
SET sex = CASE 
            WHEN sex = 'm' THEN 'f'
            WHEN sex = 'f' THEN 'm'
          END;

SELECT * FROM Salary;

DROP TABLE Salary PURGE;