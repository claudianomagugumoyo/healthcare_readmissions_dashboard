-- Healthcare Readmissions Analytics Dashboard
-- File: 02_data_cleaning.sql
-- Purpose: Cleaning and validating the dataset

-- creating a clean version of the readmissions with the correct data types
CREATE OR REPLACE VIEW hospital_readmissions_clean AS
SELECT
    `Facility Name`,
    `Facility ID`,
    State,
    `Measure Name`,

    CAST(
        NULLIF(`Number of Discharges`, 'N/A')
        AS DOUBLE
    ) AS number_of_discharges,

    CAST(
        NULLIF(`Excess Readmission Ratio`, 'N/A')
        AS DOUBLE
    ) AS excess_readmission_ratio,

    CAST(
        NULLIF(`Predicted Readmission Rate`, 'N/A')
        AS DOUBLE
    ) AS predicted_readmission_rate,

    CAST(
        NULLIF(`Expected Readmission Rate`, 'N/A')
        AS DOUBLE
    ) AS expected_readmission_rate,

    TRY_CAST(
        CASE
            WHEN `Number of Readmissions` IN ('N/A', 'Too few to report') THEN NULL
            ELSE `Number of Readmissions`
        END AS INT
    ) AS number_of_readmissions,

    `Start Date`,
    `End Date`

FROM fy_2026_hospital_readmissions_reduction_program_hospital;

-- checkimg our cleaned dataset
SELECT *
FROM hospital_readmissions_clean;

-- Check min/max/average values now that we have changed data types
SELECT
    MIN(excess_readmission_ratio),
    MAX(excess_readmission_ratio),
    AVG(excess_readmission_ratio)
FROM hospital_readmissions_clean;


-- CHECKING DUPLICATES
SELECT
    `Facility ID`,
    `Measure Name`,
    COUNT(*) AS records
FROM hospital_readmissions_clean
GROUP BY `Facility ID`, `Measure Name`
HAVING COUNT(*) > 1;

