-- Healthcare Readmissions Analytics Dashboard
-- File: 02_exploratory_analysis.sql
-- Purpose: -- Explore patterns in the cleaned hospital readmissions data.

SELECT * 
FROM `workspace`.`default`.`fy_2026_hospital_readmissions_reduction_program_hospital` limit 1000;

--QUICK CHECKS!

-- checking row counts
SELECT COUNT(*) AS total_rows
FROM workspace.default.fy_2026_hospital_readmissions_reduction_program_hospital;

-- counting the number of different hospitals
SELECT COUNT(DISTINCT `Facility ID`) AS hospitals
FROM fy_2026_hospital_readmissions_reduction_program_hospital;

-- counting the number of different states
SELECT COUNT(DISTINCT State) AS states
FROM fy_2026_hospital_readmissions_reduction_program_hospital;

-- checking the different measure types 
SELECT DISTINCT `Measure Name`
FROM fy_2026_hospital_readmissions_reduction_program_hospital
ORDER BY `Measure Name`;

-- checking for missing(null) values
SELECT
    SUM(CASE WHEN `Excess Readmission Ratio` IS NULL THEN 1 ELSE 0 END) AS missing_ratio,
    SUM(CASE WHEN `Predicted Readmission Rate` IS NULL THEN 1 ELSE 0 END) AS missing_predicted,
    SUM(CASE WHEN `Expected Readmission Rate` IS NULL THEN 1 ELSE 0 END) AS missing_expected
FROM fy_2026_hospital_readmissions_reduction_program_hospital;

-- checking numeric columns to see that numbers were not imported as strings
SELECT
    MIN(`Excess Readmission Ratio`),
    MAX(`Excess Readmission Ratio`)
FROM fy_2026_hospital_readmissions_reduction_program_hospital;

--checking the column data types
DESCRIBE fy_2026_hospital_readmissions_reduction_program_hospital;

-- counting N/As in our numeric columns
SELECT COUNT(*) AS na_count
FROM fy_2026_hospital_readmissions_reduction_program_hospital
WHERE `Excess Readmission Ratio` = 'N/A';

