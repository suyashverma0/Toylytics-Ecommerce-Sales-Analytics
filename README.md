🧸 Toylytics --- E-Commerce Sales Analytics

Toylytics is an end-to-end E-Commerce Sales Analytics project built
using Excel, SQL, Python, and Power BI. The project transforms raw
transactional data into business-ready KPIs, analysis, visualizations,
and an interactive Power BI dashboard.

📌 Project Objectives

Measure sales and profitability

Analyze monthly sales trends

Identify top-performing products

Understand customer purchasing behavior

Compare one-time and repeat customers

Analyze refunds and refund rates

Build an interactive Power BI dashboard

🛠️ Tech Stack

Tool                   Purpose

Excel / Power Query    Data cleaning and initial analysis
SQL                    Data exploration and business analysis
Python                 EDA, feature engineering and business analysis
Pandas / NumPy         Data manipulation and calculations
Matplotlib / Seaborn   Visualization
Power BI               Data modeling, DAX and dashboard
Git / GitHub           Version control

📂 Dataset

The project contains four main tables:

orders.csv --- order-level information

order_items.csv --- item-level transaction information

products.csv --- product information

order_item_refunds.csv --- refund information

🔄 Workflow

Raw CSV Data
     ↓
Excel / Power Query
     ↓
Data Cleaning & Validation
     ↓
SQL Analysis
     ↓
Python EDA & Business Analysis
     ↓
Power BI Data Model
     ↓
DAX Measures
     ↓
Interactive Dashboard
     ↓
Business Insights

📁 Project Structure

Toylytics/
├── data/
│   └── raw/
│       ├── orders.csv
│       ├── order_items.csv
│       ├── products.csv
│       └── order_item_refunds.csv
├── excel/
│   └── Toylytics_Analysis.xlsx
├── sql/
│   └── SQL_Analysis.sql
├── python/
│   ├── notebooks/
│   │   ├── 01_data_preparation.ipynb
│   │   ├── 02_exploratory_data_analysis.ipynb
│   │   ├── 03_business_analysis.ipynb
│   │   └── 04_final_insights.ipynb
│   ├── scripts/
│   │   ├── data_loader.py
│   │   ├── data_preparation.py
│   │   └── analysis_utils.py
│   └── visualizations/
├── powerbi/
│   └── Toylytics_Dashboard.pbix
├── README.md
└── .gitignore

📊 Key Business Metrics

KPI                                  Result

Total Orders                     32,313
Total Customers                  31,696
Total Items Sold                 40,025
Total Revenue            $1,938,509.75
Total COGS                 $722,370.25
Total Profit             $1,216,139.50
Average Order Value             $59.99
Profit Margin                    62.74%
Total Refund Records              1,731
Total Refund Amount         $85,338.69
Refunded Orders                   1,723
Refund Rate                       5.33%

📈 Sales Analysis

Highest revenue month: December 2014

Highest monthly revenue: $144,823.02

Lowest revenue month: March 2012

Lowest monthly revenue: $2,999.40

Highest monthly profit: December 2014

Highest monthly profit: $91,857.00

🏆 Product Analysis

Top Revenue Product

The Original Mr. Fuzzy

Revenue: $1,211,057.74

Top Profit Product

The Original Mr. Fuzzy

Profit: $738,893.00

Most Sold Product

The Original Mr. Fuzzy

Units Sold: 24,226

Highest Margin Product

The Birthday Sugar Panda

Profit Margin: 68.49%

👥 Customer Analysis

Customer Type          Customers          Revenue

One-time Customers        31,105   $1,864,153.31
Repeat Customers             591      $74,356.44

Top customer:

Customer ID: 341972

Revenue: $251.94

💰 Refund Analysis

Total refund records: 1,731

Total refund amount: $85,338.69

Refunded orders: 1,723

Refund rate: 5.33%

Highest refund product: The Original Mr. Fuzzy

Highest refund amount: $61,837.63

🧮 Power BI Data Model

product (1)
     │
     │ *
order item
   │     │
 * │     │ 1
   │     │
order   refund

Main relationships:

orders[order_id]  1 ─── *  order_items[order_id]

products[product_id]  1 ─── *  order_items[product_id]

order_items[order_item_id]  1 ─── *  order_item_refunds[order_item_id]

📐 Core DAX Measures

Total Revenue =
SUM('order item'[price_usd])

Total COGS =
SUM('order item'[cogs_usd])

Total Profit =
[Total Revenue] - [Total COGS]

Profit Margin =
DIVIDE([Total Profit], [Total Revenue], 0)

Total Orders =
DISTINCTCOUNT('order'[order_id])

Total Customers =
DISTINCTCOUNT('order'[user_id])

Average Order Value =
DIVIDE([Total Revenue], [Total Orders], 0)

📊 Power BI Dashboard

The dashboard is organized around:

Executive Sales Dashboard

Revenue

Profit

Profit Margin

Orders

Customers

Average Order Value

Monthly Revenue

Monthly Profit

Product & Customer Analysis

Top products by revenue

Top products by profit

Units sold

One-time vs repeat customers

Customer revenue contribution

Refund Analysis

Refund amount

Refund rate

Refunded orders

Refunds by product

Refund trends

🔍 Key Insights

The dataset contains 32,313 orders and 31,696 customers.

Total revenue is approximately $1.94M.

Total profit is approximately $1.22M, with a calculated margin
of 62.74%.

The Original Mr. Fuzzy generated the highest revenue, profit,
and unit sales.

The Birthday Sugar Panda had the highest calculated profit
margin at 68.49%.

Most customers were one-time customers.

December 2014 recorded the highest monthly revenue and profit.

Total refund value was $85,338.69.

The Original Mr. Fuzzy had the highest refund amount at
$61,837.63.

🚀 Skills Demonstrated

Data cleaning and validation

Exploratory Data Analysis

SQL joins and aggregations

KPI development

Customer analysis

Product analysis

Refund analysis

Python data analysis

Data visualization

Power Query

Data modeling

DAX

Power BI dashboard development

Business storytelling

Git/GitHub project organization

🎯 Project Outcome

Toylytics demonstrates a complete analytics workflow from raw e-commerce
transactions to an interactive business intelligence dashboard. It
combines Excel, SQL, Python, and Power BI to convert raw data into
structured analysis and business insights.

👨‍💻 Author

Suyash Verma

BCA --- Data Science & AI

Focus Areas: - Data Analytics - Data Science - Machine Learning -
Business Intelligence

⭐ Project Status

Completed

Excel → SQL → Python → Power BI