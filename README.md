# Customer-Lifetime-Value-Retention-Analysis-

### Business Question:
- How can we identify high-value customers and analyze their repeat purchase and retention patterns over time?


### 📊 Project Overview
This project focuses on analyzing **Customer Lifetime Value (CLV)** and **Retention Patterns** using the AdventureWorksDW dataset.  
The main goal is to identify **high-value customers**, understand their **purchase frequency**, and track **retention trends** over time.

I used **SQL** for data extraction, cleaning, and aggregation, and **Power BI** for building an interactive dashboard that segments customers into **Low**, **Medium**, and **High CLV groups**, while visualizing **retention rate trends** and **new vs returning customer behavior**.

## 🧮 SQL Techniques and Functions Used
🔹 SQL Techniques and Functions Used
## 🧮 SQL Summary

I used **SQL Server** to perform complete data analysis for **Customer Lifetime Value (CLV)** and **Retention Rate** calculations.  
The objective was to identify **loyal**, **at-risk**, **new**, and **churned customers** based on purchase frequency, spend, and recency behavior.

---

### 🔹 **SQL Techniques and Functions Used**

- **JOINS** → Combined data from `FactInternetSales` and `DimCustomer` using `INNER JOIN` to connect customer and sales details.  
- **AGGREGATE FUNCTIONS** → Used `SUM()`, `AVG()`, `COUNT()`, and `MAX()` to calculate key metrics like Total Spend, Average Order Value, Number of Purchases, and Last Purchase Date.  
- **DATE FUNCTIONS** → Applied `FORMAT()` and `DATEDIFF()` to derive `OrderMonth` and calculate **Recency** (days since last purchase).  
- **DISTINCT & GROUP BY** → Grouped data by each customer to aggregate results accurately and avoid duplicates.  
- **ORDER BY** → Sorted customers by Total Spend and Recency to highlight top spenders and active buyers.  
- **LEFT JOIN** (in the retention query) → Compared customers across consecutive months to determine **retained customers**.  
- **DATEADD()** → Shifted the month value forward by one to calculate **month-over-month retention rate**.  
- **COMMENTED CLASSIFICATION LOGIC** → Defined customer behavior patterns:  
  - *High CLV + Low Recency → Loyal, Active Customers*  
  - *High CLV + High Recency → Valuable but At Risk*  
  - *Low CLV + Low Recency → New/Frequent Buyers*  
  - *Low CLV + High Recency → Churned Customers*

---

### 📊 **Final SQL Output**

The SQL query produced a **Customer Summary Table** with the following fields:

| Column | Description |
|---------|-------------|
| CustomerKey | Unique customer identifier |
| CustomerName | Full name of the customer |
| TotalSpent | Total amount spent by each customer |
| AvgOrderValue | Average value per order |
| TotalOrders | Number of total orders placed |
| CLV_Profit | Lifetime profit per customer |
| Num_Purchases | Distinct number of purchases |
| Last_Purchase_Date | Most recent purchase date |
| Recency | Days since the last order |
| Retention_Month | Used for month-wise retention trend analysis |

---
## 📈 Power BI Dashboard Overview

The output from SQL was transformed into an interactive **Power BI Dashboard** titled  
**"Customer Lifetime Value & Retention Analysis"**, designed to visualize customer profitability, loyalty, and engagement trends.

---

### 🧩 Dashboard Structure
The report was built across **two pages** for clarity and drill-down capability:

#### **Page 1 – Customer Summary Dashboard**
This page provides a high-level overview of overall sales performance and customer segmentation.

**Visuals & KPIs Used:**
- **KPI Cards:**  
  - Total Sales = 29.36 M  
  - Total Profit = 12.08 M  
  - Total Orders = 60.40 K  
  - Average Order Value = 486.09  
- **Bar Chart:** *New vs Returning Customers* – shows customer acquisition and loyalty trend.  
- **Bar Chart:** *Customer Segments by Profit* – compares profitability across CLV tiers.  
- **Pie Chart:** *CLV Segmentation Distribution* – divides customers into **Low**, **Medium**, and **High** value categories.  
- **Line Chart:** *Retention Rate Over Year-Month* – visualizes retention trend by CLV segment over time.  
- **Slicer Panel:** Year filter (2010 – 2012) and CLV segment filters for dynamic exploration.  
- **Q&A Visual:** Natural-language queries like  
  - “Top CLV segments by total profit”  
  - “What is the total profit by customer type”

---

#### **Page 2 – Customer Drill-Down Table**
This page focuses on customer-level analytics for deeper insights.

**Table Details:**
- Columns → Customer Name, Sales Amount, Profit, Average Order Value, Latest Purchase Date  
- Includes both **Top 10 and Bottom 10 Customers** based on sales and profit.  
- KPIs summarize overall averages and customer performance.  

---

### 🎨 Dashboard Design Highlights
- Modern dark-mode theme for visual contrast and readability.  
- Consistent purple color scheme for KPIs and charts.  
- Responsive layout with clear separation between KPIs, segments, and trends.  
- Interactive slicers and Q&A enable quick data exploration.  

---

### 💡 Key Business Insights
- **High-value customers** (top 25%) generated ~70% of total profit.  
- **Medium-segment** customers offer the best balance between revenue and retention rate.  
- **Returning customers** show ~1.8× higher average order value than new customers.  
- **Retention rate** increased steadily after 2012, showing improved customer engagement.  
- Identified **“At-Risk”** customers (High CLV + High Recency) for re-activation campaigns.  
- The **Q&A visual** provided instant answers for management queries without additional filters.

---

### 🗂 Files Included
| File | Description |
|------|--------------|
| `` | Power BI dashboard file |
| `Customer_CLV_Data.csv` | Dataset generated from SQL query |
| `dashboard_screenshot.png` | Dashboard image for portfolio |
| `README.md` | Project documentation |

---

> 💼 *This dashboard demonstrates my ability to combine SQL-based data modeling with Power BI visual storytelling to deliver actionable customer insights.*
