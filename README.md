# 🏥 Healthcare Readmissions Analytics Dashboard

An end-to-end healthcare analytics project built using **Databricks SQL**. This project demonstrates the complete analytics workflow, from cleaning real-world healthcare data to designing an interactive dashboard that highlights hospital readmission trends across the United States.

---

## 📊 Dashboard Preview
![Dashboard](screenshots/dashboard_overview.png)

---

# 📌 Project Overview

Hospital readmissions are an important indicator of healthcare quality. High readmission rates may suggest issues with patient care, discharge planning, follow-up treatment, or access to healthcare services.

For this project, I used **Databricks SQL** to analyse the **CMS Hospital Readmissions and Deaths** dataset and build an interactive dashboard that helps answer important healthcare questions.

The dashboard was designed to answer three key questions:

- 🌍 Which states have the highest readmission burden?
- 🩺 Which medical conditions contribute most to readmissions?
- 🏥 Which hospitals stand out as potential outliers?

---

# 📈 Dashboard Analysis

The dashboard was designed around three key analytical questions: where readmissions are occurring, which conditions contribute most to readmission rates, and which hospitals may require further investigation.

---

## 🌍 Geographic Analysis

The state-level map visualises the average **Excess Readmission Ratio** across the United States. This helps identify geographic patterns and areas where readmission performance may differ.

![State Readmission Map](screenshots/state_map.png)

---

## 🩺 Condition Analysis

This chart highlights the medical conditions associated with the highest average Excess Readmission Ratios, helping identify conditions that may require targeted improvement efforts.

![Condition Readmission Analysis](screenshots/conditions_chart.png)

---

## 🏥 Hospital Rankings

The hospital ranking visualisation highlights hospitals with higher Excess Readmission Ratios, helping identify potential outliers for further investigation.

![Hospital Rankings](screenshots/hospital_outliers.png)

---

# 🛠 Data Cleaning

Before building the dashboard, the dataset required cleaning and preparation to ensure accurate analysis.

The main data quality challenges included placeholder values such as `"N/A"` appearing in columns that should contain numeric values. These values caused SQL to interpret the columns as text rather than numbers.

The cleaning process included:

- Checking for duplicate records
- Identifying missing values
- Replacing `"N/A"` values with `NULL`
- Converting columns to appropriate numeric data types using `CAST`
- Preparing the dataset for analysis and visualisation

This step created a reliable foundation for calculating KPIs and generating dashboard insights.

---

# 💡 Key Insights

The analysis revealed several interesting patterns:

- Most Excess Readmission Ratios were clustered close to **1.00**, meaning many hospitals performed close to expected levels.
- Small differences between states highlighted that geographic variation was relatively subtle for this metric.
- Some medical conditions showed higher average readmission ratios, suggesting areas where healthcare interventions may have the greatest impact.
- Hospital-level analysis helped identify potential outliers that may require further investigation.

---

# 🧰 Technologies Used

- **Databricks SQL** – Data cleaning, analysis and dashboard development
- **SQL** – Data transformation and querying
- **Databricks Dashboards** – Interactive visualisation
- **Data Visualisation** – Communicating insights through charts and KPIs
- **Healthcare Analytics** – Exploring hospital readmission trends

---

# 💻 SQL Skills Demonstrated

This project demonstrates practical SQL skills including:

- Data cleaning and transformation
- `CASE WHEN` statements
- `CAST` and data type conversion
- Handling missing values (`NULL`)
- Aggregations
- `GROUP BY`
- `ORDER BY`
- Creating analytical queries for dashboards
- KPI calculations
