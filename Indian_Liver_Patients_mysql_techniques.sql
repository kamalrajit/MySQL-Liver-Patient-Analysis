# Finding Minimum values of Alamine_transferase 
SELECT min(Alamine_Aminotransferase) AS Minimum_Alamine
FROM diagnose;

SELECT max(Albumin) AS Max_Albumin
FROM diagnose;

SELECT avg(Albumin)
FROM diagnose;

SELECT * FROM patienthistory;

SELECT patient.fname, patienthistory.surgeries
FROM patient
LEFT JOIN patienthistory ON patient.id = patienthistory.id
ORDER BY patient.fname;

SELECT  patient.id, patient.fname, diagnose.Albumin, diagnose.Total_Protiens
FROM diagnose
LEFT JOIN  patient ON patient.id = diagnose.id
ORDER BY patient.fname;

SELECT  patient.id, patient.fname, diagnose.Albumin, diagnose.Total_Protiens
FROM diagnose
INNER JOIN  patient ON patient.id = diagnose.id
#WHERE address='Delhi'
ORDER BY Total_Protiens ASC;

SELECT patienthistory.surgeries, patient.fname, patient.age
FROM patient
LEFT JOIN patienthistory ON patient.id = patienthistory.id
WHERE surgeries = 'None'
ORDER BY age ASC;

SELECT patienthistory.surgeries, patienthistory.medications, diagnose.Albumin, diagnose.Total_Bilirubin, Total_Protiens, diagnose.Albumin_and_Globulin_Ratio
FROM patienthistory
RIGHT JOIN diagnose ON patienthistory.id = diagnose.id
WHERE Albumin_and_Globulin_Ratio < 3.0
ORDER BY Albumin_and_Globulin_Ratio ASC;

SELECT count(fname), symptoms
FROM patientfillhistory
GROUP BY symptoms;

SELECT patientfillhistory.fname, patientfillhistory.p_history, patienthistory.medications, patienthistory.surgeries, patienthistory.dor
FROM patienthistory
LEFT JOIN patientfillhistory ON patienthistory.id = patientfillhistory.id
ORDER BY dor ASC;