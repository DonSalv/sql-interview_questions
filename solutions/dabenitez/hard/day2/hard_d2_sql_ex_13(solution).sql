Create table Failed (fail_date date, CONSTRAINT Failed_pk PRIMARY KEY (fail_date));
Create table Succeeded (success_date date, CONSTRAINT Succeeded_pk PRIMARY KEY (success_date));

insert into Failed (fail_date) values (TO_DATE('2018-12-28','YYYY-MM-DD'));
insert into Failed (fail_date) values (TO_DATE('2018-12-29','YYYY-MM-DD'));
insert into Failed (fail_date) values (TO_DATE('2019-01-04','YYYY-MM-DD'));
insert into Failed (fail_date) values (TO_DATE('2019-01-05','YYYY-MM-DD'));

insert into Succeeded (success_date) values (TO_DATE('2018-12-30','YYYY-MM-DD'));
insert into Succeeded (success_date) values (TO_DATE('2018-12-31','YYYY-MM-DD'));
insert into Succeeded (success_date) values (TO_DATE('2019-01-01','YYYY-MM-DD'));
insert into Succeeded (success_date) values (TO_DATE('2019-01-02','YYYY-MM-DD'));
insert into Succeeded (success_date) values (TO_DATE('2019-01-03','YYYY-MM-DD'));
insert into Succeeded (success_date) values (TO_DATE('2019-01-06','YYYY-MM-DD'));

SELECT period_state, TO_CHAR(MIN(day),'YYYY-MM-DD') AS start_date, 
TO_CHAR(COALESCE(change_day-1, MAX(day)),'YYYY-MM-DD') AS end_date FROM
(SELECT q1.period_state, q1.day, MIN(q2.day) AS change_day FROM
((SELECT fail_date AS day,
CASE WHEN EXTRACT(YEAR FROM fail_date)=2019 THEN 'failed' ELSE 'out' END 
AS period_state FROM Failed 
WHERE EXTRACT(YEAR FROM fail_date)=2019) UNION
(SELECT success_date AS day,
CASE WHEN EXTRACT(YEAR FROM success_date)=2019 THEN 'succeeded' ELSE 'out' END 
AS period_state FROM Succeeded 
WHERE EXTRACT(YEAR FROM success_date)=2019) ORDER BY day) Q1
LEFT JOIN
((SELECT fail_date AS day,
CASE WHEN EXTRACT(YEAR FROM fail_date)=2019 THEN 'failed' ELSE 'out' END 
AS period_state FROM Failed 
WHERE EXTRACT(YEAR FROM fail_date)=2019) UNION
(SELECT success_date AS day,
CASE WHEN EXTRACT(YEAR FROM success_date)=2019 THEN 'succeeded' ELSE 'out' END 
AS period_state FROM Succeeded 
WHERE EXTRACT(YEAR FROM success_date)=2019) ORDER BY day) Q2
ON Q1.period_state!=Q2.period_state AND Q1.day<Q2.day
GROUP BY q1.period_state, q2.period_state, q1.day
ORDER BY q1.day)
GROUP BY period_state, change_day ORDER BY start_date;


DROP TABLE Succeeded PURGE;
DROP TABLE Failed PURGE;