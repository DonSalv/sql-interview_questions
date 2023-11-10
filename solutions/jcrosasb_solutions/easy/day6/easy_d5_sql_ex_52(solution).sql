-- Create the patients table
Create table Patients (patient_id int, patient_name varchar(30), conditions varchar(100));

-- Populate the patients table
Truncate table Patients;
insert into Patients (patient_id, patient_name, conditions) values (1, 'Daniel', 'YFEV COUGH');
insert into Patients (patient_id, patient_name, conditions) values (2, 'Alice', '');
insert into Patients (patient_id, patient_name, conditions) values (3, 'Bob', 'DIAB100 MYOP');
insert into Patients (patient_id, patient_name, conditions) values (4, 'George', 'ACNE DIAB100');
insert into Patients (patient_id, patient_name, conditions) values (5, 'Alain', 'DIAB201');

-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix
SELECT 
    patient_id, 
    patient_name, 
    conditions
FROM Patients
WHERE INSTR(conditions, 'DIAB1') != 0;

-- Drop tables
DROP TABLE Patients;
