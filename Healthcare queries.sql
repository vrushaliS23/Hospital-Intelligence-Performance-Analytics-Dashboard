CREATE TABLE Hospital_Data (
    patient_id VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    state VARCHAR(50),
    insurance_type VARCHAR(50),
    admit_date DATE,
    discharge_date DATE,
    los_days INT,
    admit_type VARCHAR(50),
    diagnosis VARCHAR(100),
    department VARCHAR(50),
    total_cost DECIMAL(12,2),
    govt_subsidy DECIMAL(12,2),
    patient_payment DECIMAL(12,2),
    discharge_type VARCHAR(50)
);
SELECT * FROM Hospital_Data;

--How many patients were treated?
SELECT COUNT(DISTINCT patient_id) AS Total_Patients
FROM Hospital_Data;

--What is the average length of stay of patients?
SELECT ROUND(AVG(los_days),2) AS avg_los
FROM hospital_data;

--How much revenue was generated from patient payments?
SELECT Sum(patient_payment) AS Revenue
FROM Hospital_Data;

--How much financial support was provided through government subsidies?
SELECT SUM(govt_subsidy) AS financial_support
FROM Hospital_Data;

--What is the gender distribution of patients?
SELECT gender, COUNT(*) 
FROM Hospital_Data 
Group by gender;

--Which diagnoses are most commonly treated in the hospital?
SELECT  diagnosis, COUNT(*) 
FROM Hospital_Data
Group by diagnosis
Order by COUNT(*) DESC
LIMIT 5;

--Which department handles the highest number of patients?
SELECT department, COUNT(*)
FROM Hospital_Data
Group by department
Order by COUNT(*) DESC
LIMIT 3;

--Which department has the highest average treatment cost?
SELECT department, ROUND(Avg( total_cost),2) 
FROM Hospital_Data
Group by department
Order by ROUND(Avg( total_cost),2)  DESC
LIMIT 1;

--What is the distribution of patients across different insurance types?
SELECT  insurance_type , COUNT(patient_id) AS Number_of_Patients
FROM Hospital_Data
Group by insurance_type
Order by Number_of_Patients DESC;

--What are the patient discharge outcomes?
SELECT discharge_type, COUNT(patient_id) AS Number_of_Patients
FROM Hospital_Data
Group by discharge_type
Order by Number_of_Patients DESC;
