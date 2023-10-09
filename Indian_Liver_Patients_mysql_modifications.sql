# Finding Minimum values of Alamine_transferase 
SELECT min(Alamine_Aminotransferase), min(Albumin)
FROM diagnose;

# Avergae of Albumin
SELECT avg(Albumin)
FROM diagnose;

# Patient fullname along with their previous surgeries
SELECT patient.fname, patienthistory.surgeries
FROM patient
LEFT JOIN patienthistory ON patient.id = patienthistory.id
ORDER BY patient.fname;

# Patients along with their Albumin and Total_Protiens values
SELECT  patient.id, patient.fname, diagnose.Albumin, diagnose.Total_Protiens
FROM diagnose
LEFT JOIN  patient ON patient.id = diagnose.id
ORDER BY diagnose.Albumin DESC;

# Patients with No history for surgeries 
SELECT patienthistory.surgeries, patient.fname, patient.age
FROM patient
LEFT JOIN patienthistory ON patient.id = patienthistory.id
WHERE surgeries = 'None'
ORDER BY age ASC;

# Patients with high ALbumin and Globulin Ratio is less than 3.0 and without any surgeries
SELECT patienthistory.id, patienthistory.surgeries, patienthistory.medications, diagnose.Albumin, diagnose.Total_Bilirubin, Total_Protiens, diagnose.Albumin_and_Globulin_Ratio
FROM patienthistory
RIGHT JOIN diagnose ON patienthistory.id = diagnose.id
WHERE diagnose.Albumin_and_Globulin_Ratio < 3.0 AND patienthistory.surgeries != 'None'
ORDER BY Albumin_and_Globulin_Ratio DESC;

# Count of symptoms
SELECT count(fname), symptoms
FROM patientfillhistory
GROUP BY symptoms;

# Date-Wise Date Of Registration with patient history and current medication
SELECT patientfillhistory.fname, patientfillhistory.p_history, patienthistory.medications, patienthistory.surgeries, patienthistory.dor
FROM patienthistory
LEFT JOIN patientfillhistory ON patienthistory.id = patientfillhistory.id
ORDER BY dor ASC;

# Querying for patients where their nane starts with letter 'A'
SELECT * FROM patient
WHERE fname IN (SELECT fname FROM patient WHERE fname LIKE 'A%');

# Creating a new column and pouplating it with new values using where condition
ALTER TABLE diagnose
ADD Albumin_RiskLevel FLOAT;
UPDATE diagnose
SET Albumin_RiskLevel = 'High Risk'
WHERE Albumin > '0' AND Albumin < 3.4;

# Creating view for low risk paients based on bilirubin values
CREATE VIEW LowRisk_Patients AS
SELECT DISTINCT patient.fname, diagnose.id, diagnose.Total_Bilirubin, diagnose.Direct_Bilirubin 
FROM patient, diagnose
WHERE diagnose.Direct_Bilirubin < 5.1 AND  diagnose.Total_Bilirubin < 10.5
ORDER BY patient.fname ASC;

select * from LowRisk_Patients;
