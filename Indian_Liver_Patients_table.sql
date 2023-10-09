CREATE DATABASE IndianLiverPatients;
USE IndianLiverPatients;

CREATE TABLE Patient(
id INT,
fname VARCHAR (30) NOT NULL,
address VARCHAR(50) NOT NULL,
gender VARCHAR (10) NOT NULL,
email VARCHAR (50) NOT NULL,
age INT (10) NOT NULL,
PRIMARY KEY (fname)
);

CREATE TABLE PatientHistory(
id INT PRIMARY KEY,
dor DATE NOT NULL,
surgeries VARCHAR (80) NOT NULL,
medications VARCHAR (80) NOT NULL
);

CREATE TABLE PatientFillHistory(
fname VARCHAR (30) NOT NULL,
id INT NOT NULL,
symptoms VARCHAR (50) NOT NULL,
p_history VARCHAR (100) NOT NULL,
FOREIGN KEY (fname) REFERENCES Patient(fname)
);

CREATE TABLE Diagnose(
id INT NOT NULL,
Total_Bilirubin FLOAT,
Direct_Bilirubin FLOAT,
Alkaline_Phosphate INT,
Alamine_Aminotransferase INT ,
Aspartate_Aminotransferase INT,
Total_Protiens FLOAT,
Albumin FLOAT,
Albumin_and_Globulin_Ratio FLOAT
);

SET FOREIGN_KEY_CHECKS=0;
