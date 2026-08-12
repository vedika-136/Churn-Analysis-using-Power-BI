# Telecom Customer Churn Analysis

## Project Overview

This project analyzes telecom customer churn data to understand **why customers leave**, identify customer segments with higher churn, and present actionable insights through **SQL analysis and a Power BI dashboard**.

The project focuses on **descriptive churn analysis** rather than machine learning. The goal is to study historical churn patterns and help the business make better customer retention decisions.

---

## Objective

The main objectives of this project were to:

- Calculate the overall customer churn rate
- Identify customer segments with higher churn
- Analyze churn by contract type, tenure, services, payment method, and customer demographics
- Understand the major reasons associated with customer churn
- Build an interactive Power BI dashboard for business users
- Provide insights that could support customer retention strategies

---

## Tools & Technologies

- **SQL** – Data cleaning, transformation, KPI calculations, and churn analysis
- **Power BI** – Data modeling, DAX calculations, dashboard development, and visualization
- **Excel / CSV** – Source data
- **Power Query** – Additional data preparation inside Power BI

---

## Project Workflow

```text
Source Data
    ↓
SQL Database
    ↓
Data Cleaning & Transformation
    ↓
SQL Views / Analysis Queries
    ↓
Power BI
    ↓
Interactive Churn Dashboard
```

### 1. Data Loading

The customer dataset was loaded into a SQL database and stored in customer-related tables.

### 2. Data Cleaning

The data was checked for:

- Missing values
- Duplicate records
- Incorrect or inconsistent categories
- Null values
- Data type issues

### 3. SQL Analysis

SQL queries were used to calculate important churn KPIs and analyze customer behavior across different dimensions.

### 4. Power BI Dashboard

The cleaned and transformed data was connected to Power BI to create interactive visualizations and KPI cards.

---

## Key KPIs

The dashboard focuses on metrics such as:

- Total Customers
- Total Churned Customers
- Churn Rate
- Customers Who Stayed
- New Customers
- Churn by Contract Type
- Churn by Tenure
- Churn by Payment Method
- Churn by Internet Service
- Churn by Customer Demographics
- Churn Reasons / Categories

---

## Example SQL Queries

### Calculate Churn Rate

```sql
SELECT
    ROUND(
        100.0 *
        SUM(CASE
            WHEN Customer_Status = 'Churned' THEN 1
            ELSE 0
        END)
        / COUNT(*),
        2
    ) AS Churn_Rate
FROM Customer_Data;
```

### Churn by Contract Type

```sql
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        100.0 * SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Churn_Rate
FROM Customer_Data
GROUP BY Contract
ORDER BY Churn_Rate DESC;
```

### Churn by Payment Method

```sql
SELECT
    Payment_Method,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers
FROM Customer_Data
GROUP BY Payment_Method
ORDER BY Churned_Customers DESC;
```

### Churn by Tenure Group

```sql
SELECT
    CASE
        WHEN Tenure_in_Months <= 12 THEN '0-12 Months'
        WHEN Tenure_in_Months <= 24 THEN '13-24 Months'
        WHEN Tenure_in_Months <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers
FROM Customer_Data
GROUP BY
    CASE
        WHEN Tenure_in_Months <= 12 THEN '0-12 Months'
        WHEN Tenure_in_Months <= 24 THEN '13-24 Months'
        WHEN Tenure_in_Months <= 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END
ORDER BY Total_Customers DESC;
```

---

## Power BI Dashboard

The Power BI dashboard was designed to provide a high-level view of customer churn and allow users to drill down into different customer segments.

### Dashboard Features

- KPI cards for total customers and churn rate
- Churn distribution by customer status
- Churn by gender and age group
- Churn by contract type
- Churn by tenure
- Churn by payment method
- Churn by internet service
- Churn reasons and churn categories
- Interactive slicers and filters

---

## Key Business Insights

The analysis can help answer questions such as:

- Which customer groups have the highest churn rate?
- Are month-to-month customers more likely to churn?
- Does customer tenure influence churn?
- Which payment methods are associated with higher churn?
- Which services have higher churn?
- What are the most common reasons customers leave?

These insights can help the business identify high-risk customer segments and design targeted retention strategies.

---

## Business Recommendations

Based on the churn patterns, a telecom company could consider:

- Providing incentives for customers to move from month-to-month contracts to long-term contracts
- Improving onboarding and support for new customers
- Targeting high-churn customer groups with personalized retention offers
- Investigating service-related complaints and competitor-related churn reasons
- Creating loyalty programs for long-term customers
- Monitoring churn KPIs regularly through Power BI

---

## Skills Demonstrated

This project demonstrates experience with:

- SQL querying
- Aggregate functions
- `CASE WHEN` statements
- `GROUP BY` and `HAVING`
- Window functions
- Data cleaning and validation
- SQL views
- KPI development
- Data modeling
- Power Query
- DAX
- Power BI dashboard development
- Business data analysis
- Data visualization
- Translating data into actionable insights

---

## Project Scope

This project currently covers:

- ✅ Data cleaning
- ✅ SQL analysis
- ✅ Churn KPI calculation
- ✅ Power BI dashboard
- ✅ Business insights

Machine learning or predictive churn modeling is **not included** in the current version of this project.

---

## Repository Structure

```text
telecom-customer-churn-analysis/
│
├── data/
│   └── customer_data.csv
│
├── sql/
│   ├── data_cleaning.sql
│   ├── churn_analysis.sql
│   └── views.sql
│
├── powerbi/
│   └── telecom_churn_dashboard.pbix
│
├── images/
│   └── dashboard_screenshot.png
│
└── README.md
```

---

## Dashboard Preview

Add a screenshot of your Power BI dashboard here:

```markdown
![Telecom Churn Dashboard](images/dashboard_screenshot.png)
```

---

## Future Improvements

Possible future enhancements include:

- Building a machine learning model to predict customer churn
- Automating the data refresh pipeline
- Adding customer-level churn risk scoring
- Performing cohort analysis
- Adding time-series churn trends
- Publishing the dashboard to Power BI Service

---

## Author

**Vedika Sontakke**

Data Analyst | SQL | Python | Power BI | Excel | AWS | GA4

