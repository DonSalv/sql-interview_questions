-- Create the patients table
CREATE TABLE Patients (patient_id int, patient_name varchar(30), conditions varchar(100));

-- Populate the patients table
TRUNCATE TABLE Patients;
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES ('1', 'Daniel', 'YFEV COUGH');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES ('2', 'Alice', '');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES ('3', 'Bob', 'DIAB100 MYOP');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES ('4', 'George', 'ACNE DIAB100');
INSERT INTO Patients (patient_id, patient_name, conditions) VALUES ('5', 'Alain', 'DIAB201');

-- Solve the exercise
SELECT patient_id, patient_id, conditions
FROM Patients
WHERE conditions LIKE '%DIAB1%';

-- Drop unused table
DROP TABLE Patients;