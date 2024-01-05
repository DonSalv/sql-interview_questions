Create table Product (product_id int, product_name varchar(30), CONSTRAINT Product_pk PRIMARY KEY (product_id));
Create table Sales (product_id int, period_start date, period_end date, average_daily_sales int,
CONSTRAINT fk_Sales FOREIGN KEY (product_id) REFERENCES Product(product_id));

insert into Product (product_id, product_name) values ('1', 'LC Phone ');
insert into Product (product_id, product_name) values ('2', 'LC T-Shirt');
insert into Product (product_id, product_name) values ('3', 'LC Keychain');

insert into Sales (product_id, period_start, period_end, average_daily_sales) values ('1', TO_DATE('2019-01-25','YYYY-MM-DD'), TO_DATE('2019-02-28','YYYY-MM-DD'), '100');
insert into Sales (product_id, period_start, period_end, average_daily_sales) values ('2', TO_DATE('2018-12-01','YYYY-MM-DD'), TO_DATE('2020-01-01','YYYY-MM-DD'), '10');
insert into Sales (product_id, period_start, period_end, average_daily_sales) values ('3', TO_DATE('2019-12-01','YYYY-MM-DD'), TO_DATE('2020-01-31','YYYY-MM-DD'), '1');

SELECT product_id, product_name, report_year,
CASE WHEN EXTRACT(YEAR FROM period_end)=EXTRACT(YEAR FROM period_start) 
THEN average_daily_sales*(period_end-period_start+1)
WHEN EXTRACT(YEAR FROM period_end)=EXTRACT(YEAR FROM period_start)+1 AND EXTRACT(YEAR FROM period_start)=report_year 
THEN average_daily_sales*(TO_DATE(report_year||'12-31','YYYY-MM-DD')-period_start+1)
WHEN EXTRACT(YEAR FROM period_end)=EXTRACT(YEAR FROM period_start)+1 AND EXTRACT(YEAR FROM period_end)=report_year 
THEN average_daily_sales*(period_end-TO_DATE(report_year||'01-01','YYYY-MM-DD')+1)
WHEN EXTRACT(YEAR FROM period_end)-EXTRACT(YEAR FROM period_start)>1 AND EXTRACT(YEAR FROM period_start)=report_year 
THEN average_daily_sales*(TO_DATE(report_year||'12-31','YYYY-MM-DD')-period_start+1)
WHEN EXTRACT(YEAR FROM period_end)-EXTRACT(YEAR FROM period_start)>1 AND EXTRACT(YEAR FROM period_end)=report_year 
THEN average_daily_sales*(period_end-TO_DATE(report_year||'01-01','YYYY-MM-DD')+1)
WHEN EXTRACT(YEAR FROM period_end)-EXTRACT(YEAR FROM period_start)>1 AND EXTRACT(YEAR FROM period_start)!=report_year AND EXTRACT(YEAR FROM period_end)!=report_year
THEN average_daily_sales*(TO_DATE(report_year||'12-31','YYYY-MM-DD')-TO_DATE(report_year||'01-01','YYYY-MM-DD')+1)
END AS total_amount FROM
(SELECT years.product_id, p.product_name, years.report_year, s.period_start, s.period_end, s.average_daily_sales FROM
(SELECT product_id, EXTRACT(YEAR FROM period_start) + LEVEL -1 as report_year FROM Sales
CONNECT BY LEVEL <= EXTRACT(YEAR FROM period_end) - EXTRACT(YEAR FROM period_start) + 1
AND PRIOR product_id = product_id AND PRIOR SYS_GUID() IS NOT NULL) years
JOIN Sales s ON years.product_id=s.product_id JOIN Product p ON p.product_id=s.product_id);

DROP TABLE Sales PURGE;
DROP TABLE Product PURGE;