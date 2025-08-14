📌 Project Overview

This project is designed to automate daily banking transaction reports for management decision-making.
Using SQL Server as the backend and Power BI for visualization, the system fetches and calculates key metrics from daily transaction data.

The KPIs update automatically to show figures for the previous business day, helping management quickly assess banking activity and make informed decisions.

🏦 Data Description

The dataset contains daily Debit and Credit transactions of customers, including:

Customer ID

Customer Name

Transaction Date

Transaction Type (Debit / Credit)

Transaction Amount

🎯 Key KPIs Created in Power BI

Total Value – Total transaction value (Debit + Credit) for the previous business day

Debit Value – Total debits for the previous business day

Credit Value – Total credits for the previous business day

Net Value – Credit Value minus Debit Value

Transaction Volume – Number of transactions processed on the previous business day

These KPIs refresh daily, ensuring up-to-date insights.

⚙️ Technology Stack

SQL Server Management Studio (SSMS) – Data storage & querying

SQL Scripts – Data extraction & transformations

Power BI – Visualization, KPI cards, and automation

DAX Measures – Dynamic calculation of KPIs for previous business day

SCREENSHOT

<img width="902" height="497" alt="image" src="https://github.com/user-attachments/assets/f9ceb09e-9884-497a-aeed-8eff778cc29b" />


