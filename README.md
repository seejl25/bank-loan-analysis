# 🏦 Bank Loan Analysis Dashboard
## 📘 Overview

This project analyzes a bank’s loan portfolio to evaluate lending performance, borrower profiles, and risk distribution.
Using Python for data processing, PostgreSQL for validation, and Tableau for dashboard visualization, it provides a comprehensive view of loan performance KPIs and borrowing trends.

Good loans are defined as loan_status = 'Fully Paid' or 'Current', while bad loans refer to loan_status = 'Charged Off'.

## 🎯 Objectives

Compute and visualize key financial KPIs from loan application data

Compare Good vs Bad Loans to assess portfolio quality

Identify trends by month, region, loan term, employment length, purpose, and home ownership

## 📊 Key Performance Indicators (KPIs)
| Category              | KPI                                                        | Description                                |
| --------------------- | ---------------------------------------------------------- | ------------------------------------------ |
| **Overall Portfolio** | Total Loan Applications                                    | Total applications received                |
|                       | MTD Loan Applications                                      | Applications received in the latest month  |
|                       | Total Funded Amount                                        | Amount disbursed as loans                  |
|                       | MTD Funded Amount                                          | Funded amount in the latest month          |
|                       | Total Amount Received                                      | Total repayments collected                 |
|                       | MTD Amount Received                                        | Amount received in the latest month        |
|                       | Average Interest Rate                                      | Mean interest rate across loans            |
|                       | Average DTI Ratio                                          | Mean borrower debt-to-income ratio         |
| **Good Loans**        | Application %, Count, Funded Amount, Total Received Amount | Metrics for Fully Paid / Current loans     |
| **Bad Loans**         | Application %, Count, Funded Amount, Total Received Amount | Metrics for Charged Off loans              |

## 📈 Dashboard Visualizations (Tableau)

The Tableau dashboard showcases interactive charts to explore loan performance:

- Monthly Trends (Line/Area Chart) – Seasonal and long-term loan patterns

- Regional Distribution (Bar Chart) – Loan activity by state

- Loan Term Analysis (Donut Chart) – Distribution across loan durations

- Employment Length Analysis (Bar Chart) – Borrower employment profiles

- Loan Purpose Breakdown (Bar Chart) – Reasons for loan applications

- Home Ownership Impact (Tree/Heat Map) – Loan metrics by home ownership category

Each chart visualizes metrics such as:

- Total Loan Applications

- Total Funded Amount

- Total Amount Received

## 🧰 Tools & Technologies
| Tool                           | Purpose                                                                        |
| ------------------------------ | ------------------------------------------------------------------------------ |
| **Python**                     | Data cleaning, KPI computation, and export (`pandas`, `matplotlib`, `seaborn`) |
| **PostgreSQL**                 | Query validation and data accuracy checks                                      |
| **Tableau**                    | Dashboard creation and visualization                                           |
| **Jupyter Notebook / VS Code** | Development environment                                                        |

## 🧮 Dataset

File: financial_loan.csv

Description: Synthetic dataset containing borrower information, loan details, and repayment status.

Purpose: Used to simulate real-world banking data for analysis and dashboard creation.

## 🧩 Workflow

1. **Data Preparation**
   - Cleaned and standardized the raw `financial_loan.csv` data.
   - Used **Excel** to reformat date columns (e.g., `issue_date`, `last_payment_date`) into a consistent `YYYY-MM-DD` format.
   - This ensured the dataset could be imported cleanly into **PostgreSQL** without datatype parsing issues.

2. **KPI Computation**
   - Processed cleaned data in **Python** using `pandas` to calculate all KPIs.
   - Validated figures with SQL queries in **PostgreSQL**.

3. **Dashboard Development**
   - Exported finalized data for **Tableau** visualization.
   - Designed interactive KPI cards and charts with filters for loan type, region, and time period.
