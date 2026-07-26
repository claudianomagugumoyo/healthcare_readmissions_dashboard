-- Healthcare Readmissions Analytics Dashboard
-- File: 03_data_analysis.sql
-- Purpose: Generate the visualisations used in the dashboard.

-- KPI for total number of hospitals
SELECT COUNT(DISTINCT `Facility ID`) AS total_hospitals
FROM hospital_readmissions_clean;

-- KPI for number of states
SELECT COUNT(DISTINCT State) AS total_states
FROM hospital_readmissions_clean;

--KPI for average excess readmissions ratio
SELECT AVG(excess_readmission_ratio)
FROM hospital_readmissions_clean;

-- MAP to measure state performance.
SELECT
    state,
    AVG(excess_readmission_ratio) AS avg_ratio
FROM hospital_readmissions_clean
GROUP BY state
ORDER BY avg_ratio DESC;

-- CONDITION CHART to measure which trreatments resulted in the highest number of readmissions. 
SELECT
    `Measure Name`,
    AVG(excess_readmission_ratio) AS avg_ratio
FROM hospital_readmissions_clean
GROUP BY `Measure Name`
ORDER BY avg_ratio DESC;

-- HOSPITAL CHART to measure  hospitals with the highest readmission rates.
SELECT
    `Facility Name`,
    state,
    AVG(excess_readmission_ratio) AS avg_ratio
FROM hospital_readmissions_clean
GROUP BY `Facility Name`, State
ORDER BY avg_ratio DESC;
