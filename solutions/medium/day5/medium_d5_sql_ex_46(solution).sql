Create table Accounts (id int, name varchar(10), CONSTRAINT Accounts_pk PRIMARY KEY (id));
Create table Logins (id int, login_date date, CONSTRAINT fk_Logins FOREIGN KEY (id) REFERENCES Accounts(id));

insert into Accounts (id, name) values ('1', 'Winston');
insert into Accounts (id, name) values ('7', 'Jonathan');

insert into Logins (id, login_date) values ('7', TO_DATE('2020-05-30','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('1', TO_DATE('2020-05-30','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('7', TO_DATE('2020-05-31','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('7', TO_DATE('2020-06-01','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('7', TO_DATE('2020-06-02','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('7', TO_DATE('2020-06-02','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('7', TO_DATE('2020-06-03','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('1', TO_DATE('2020-06-07','YYYY-MM-DD'));
insert into Logins (id, login_date) values ('7', TO_DATE('2020-06-10','YYYY-MM-DD'));
  
SELECT DISTINCT Q1.id, name FROM
(SELECT id, login_date, login_date-ROW_NUMBER() OVER (PARTITION BY id ORDER BY login_date) AS group_days
FROM (SELECT DISTINCT id, login_date FROM Logins) ORDER BY id, login_date) Q1
JOIN Accounts a ON Q1.id=a.id
GROUP BY Q1.id, name, group_days
HAVING COUNT(group_days)>=5 ORDER BY Q1.id;
  
DROP TABLE Logins PURGE;
DROP TABLE Accounts PURGE;