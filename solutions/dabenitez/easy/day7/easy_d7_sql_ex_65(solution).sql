Create table DailySales(date_id date, make_name varchar(20), lead_id int, partner_id int);

insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-8','YYYY-MM-DD'), 'toyota', '0', '1');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-8','YYYY-MM-DD'), 'toyota', '1', '0');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-8','YYYY-MM-DD'), 'toyota', '1', '2');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-7','YYYY-MM-DD'), 'toyota', '0', '2');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-7','YYYY-MM-DD'), 'toyota', '0', '1');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-8','YYYY-MM-DD'), 'honda', '1', '2');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-8','YYYY-MM-DD'), 'honda', '2', '1');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-7','YYYY-MM-DD'), 'honda', '0', '1');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-7','YYYY-MM-DD'), 'honda', '1', '2');
insert into DailySales (date_id, make_name, lead_id, partner_id) values (TO_DATE('2020-12-7','YYYY-MM-DD'), 'honda', '2', '1');

SELECT date_id, make_name, 
COUNT(DISTINCT lead_id) AS unique_leads, 
COUNT(DISTINCT partner_id) AS unique_partners 
FROM DailySales
GROUP BY date_id, make_name;

DROP TABLE DailySales PURGE;