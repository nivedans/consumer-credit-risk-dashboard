# Consumer Credit Risk Analytics Dashboard

![Excel](https://img.shields.io/badge/Excel-Analysis-217346?logo=microsoft-excel&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Queries-4479A1?logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Data Analytics](https://img.shields.io/badge/Data-Analytics-blue)

A complete end-to-end analytics project using **Excel, SQL and Power BI** to analyse **32,000+ consumer lending records**, identify key drivers of default risk and produce business-focused lending recommendations.

## Table of Contents

- [Business Problem](#business-problem)
- [Dashboard Preview](#dashboard-preview)
- [Key Findings](#key-findings)
- [Project Workflow](#project-workflow)
- [SQL Analysis](#sql-analysis)
- [Business Recommendations](#business-recommendations)
- [Repository Structure](#repository-structure)
- [What I Learned](#what-i-learned)

## Project Overview

Analysed a dataset containing **32,000+ consumer loans** using **Excel, SQL and Power BI** to identify factors associated with higher observed loan default risk and develop business-focused recommendations.

## Business Problem

How can lenders use borrower and loan characteristics to identify higher-risk applicants and support more informed lending decisions?

## Dashboard Preview

### Executive Dashboard

![No Filter Dashboard](05%20Images/No%20Filter%20Dashboard.png)

### Interactive Dashboard with Filters

![Filter Dashboard](05%20Images/Filter%20Dashboard.png)

## Tools Used

- Excel
- SQL
- Power BI

## Key Findings

| Analysis | Result |
|----------|---------|
| Previous Defaults | **2.05× higher** observed default rate |
| Loan-to-Income | Sharp increase above **30%** |
| Loan Grade | Grade G reached **98.4%** observed default rate* |
| Loan Purpose | Debt Consolidation had the highest observed default rate |
| Interest Rates | Higher rates associated with higher observed default risk |

*Grade G contained only 64 loans.

## Project Workflow

1. Cleaned and validated a **32,000+ record** lending dataset.
2. Documented data cleaning decisions in Excel.
3. Tested **five credit-risk hypotheses** using SQL.
4. Built an interactive Power BI dashboard.
5. Produced evidence-based business recommendations.

## SQL Analysis

Five SQL scripts were developed to investigate key drivers of credit risk.

| Script | Business Question |
|---------|------------------|
| `01_loan_to_income.sql` | Does affordability influence default risk? |
| `02_previous_defaults.sql` | Does previous default history predict future default? |
| `03_loan_grade.sql` | Do loan grades reflect borrower risk? |
| `04_loan_purpose.sql` | Do some loan purposes carry higher risk? |
| `05_interest_rates.sql` | Are higher interest rates associated with higher default risk? |

## Business Recommendations

- Strengthen affordability checks for high loan-to-income applications.
- Use previous default history as a key risk indicator.
- Prioritise loan grade during risk segmentation.
- Treat interest rate as a risk signal rather than proof of causation.

## Limitations

- Observational analysis identifies associations rather than causation.
- Some interest-rate values were missing.
- Real-world lending decisions require additional borrower information.

## Repository Structure

| Folder | Contents |
|--------|----------|
| `02 Cleaning` | Cleaning log and cleaned dataset |
| `03 SQL` | Five SQL hypothesis scripts |
| `04 Power BI` | Interactive dashboard |
| `05 Images` | Dashboard screenshots |
| `06 Documentation` | Project overview and business recommendations |

## Skills Demonstrated

- Data Cleaning & Validation
- SQL Query Development
- Exploratory Data Analysis (EDA)
- KPI Reporting
- Power BI Dashboard Design
- Business Insight Generation
- Credit Risk Analysis

## What I Learned

This project strengthened my ability to:

- Clean and validate business datasets.
- Write SQL using JOINs, CASE statements, CTEs and aggregations.
- Build stakeholder-focused Power BI dashboards.
- Translate analytical findings into business recommendations.
- Distinguish correlation from causation when interpreting business data
