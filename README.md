# E-Commerce Sales & Customer Analytics Dashboard

## Project Overview

This project analyses sales performance, customer behaviour, delivery operations, and customer satisfaction using SQL and Power BI.

The goal was to transform raw e-commerce transaction data into actionable business insights through interactive dashboards and data storytelling.

The analysis uncovered key trends in revenue performance, customer value, delivery efficiency, and purchasing behaviour, and focused on separating what the data proves from what it only suggests — identifying the primary drivers behind business performance while being clear about the limits of each conclusion.

---

## Tools Used

- SQL
- Power BI
- DAX
- Data Modelling
- Data Visualisation
- Business Intelligence

---

## Dataset

The project uses the Brazilian E-Commerce Public Dataset by Olist, containing information on:

- Orders
- Customers
- Products
- Payments
- Reviews
- Sellers
- Delivery Performance

The dataset was analysed using SQL and visualised in Power BI to uncover trends in revenue, customer behaviour, logistics performance, and shopping patterns.

---

## Project Workflow

1. Data Extraction and Exploration using SQL
2. Data Cleaning and Transformation
3. KPI Development using DAX
4. Data Modelling in Power BI
5. Dashboard Design and Visualisation
6. Business Insight Generation
7. Business Recommendations

---

## Business Questions

This project was designed to answer the following questions:

1. What drives overall revenue performance?
2. Which customers and regions generate the most revenue?
3. How does delivery performance impact customer satisfaction?
4. What caused the significant revenue decline after August?
5. When are customers most likely to make purchases?

---

## Dashboard Pages

### Executive Overview

Provides a high-level view of revenue, orders, customer satisfaction, and overall business performance.

### Customer Insights & Value Analysis

Identifies top-performing regions, customer revenue concentration, and high-value customers.

### Logistics & Delivery Performance

Evaluates delivery efficiency, late deliveries, customer satisfaction, and the relationship between delivery time and review scores.

### Sales Trends & Shopping Behaviour

Analyses purchasing patterns, peak shopping periods, revenue trends, and order behaviour.

---

## Key KPIs

| KPI | Value |
|------|------|
| Total Revenue | £16M |
| Total Orders | 99K |
| Average Order Value | £161 |
| Customer Satisfaction | 4.09 / 5 |
| Late Deliveries | 7.87% |
| Average Delivery Time | 12.5 Days |
| Delivery Satisfaction Gap | 10.63 Days |
| Peak Orders Month | August |
| Peak Shopping Hour | 4 PM |
| Revenue Drop (Aug → Sep) | 57% |

---

## Key Findings

### Revenue Performance

- Revenue peaked at approximately £1.70M in August.
- Revenue declined to approximately £0.73M in September.
- Revenue fell by approximately 57% month-over-month.

### Root Cause Analysis

- Average Order Value remained stable between approximately £150–£170 throughout the year.
- Order volume dropped from approximately 10.8K orders in August to approximately 4.3K orders in September.
- **The decline was driven primarily by a fall in the number of orders placed, not by lower spending per order.** Because average order value held steady, the spending explanation can be ruled out — the question shifts from "why did people spend less?" to "why were fewer orders placed?"
- The cause of the volume drop itself is not provable from this dataset alone. Plausible explanations include reduced marketing or customer acquisition during the period, platform or seller activity, or a data-completeness effect at the end of the dataset's time range — these are hypotheses for further investigation rather than confirmed findings.

### Customer Analysis

- São Paulo generated approximately £6M in revenue.
- São Paulo contributed approximately 37.5% of total company revenue.
- Revenue is concentrated in a relatively small number of states and high-value orders, representing a dependency worth monitoring.

### Logistics & Delivery

- Average delivery time was 12.5 days.
- Only 7.87% of orders were delivered late.
- Customers giving 5-star reviews received orders in approximately 10.6 days on average.
- Customers giving 1-star reviews waited more than 21 days on average.
- The delivery satisfaction gap was approximately 10.63 days, indicating a strong association between delivery speed and review score.

### Shopping Behaviour

- Customer purchasing activity peaked between 10 AM and 6 PM.
- 4 PM was the busiest shopping hour.
- Overnight shopping activity remained relatively low.

---

## Dashboard Screenshots

### Executive Overview

![Executive Overview](Dashboard%20Screenshots/01_Executive_Overview.png)

### Customer Insights & Value Analysis

![Customer Insights](Dashboard%20Screenshots/02_Customer_Insights.png)

### Delivery Performance & Customer Satisfaction

![Logistics & Delivery](Dashboard%20Screenshots/03_Logistics_and_Delivery.png)

### Sales Trends & Shopping Behaviour

![Sales Trends](Dashboard%20Screenshots/04_Sales_Trends_and_Shopping_Behaviour.png)

---

## SQL Analysis

The full SQL script is available in [`e-commerce_analysis.sql`](e-commerce_analysis.sql).

SQL was used for:

- Data exploration
- Data cleaning
- Revenue analysis
- Customer analysis
- Delivery performance analysis
- KPI calculation

Key SQL techniques used:

- Multi-table JOINs across orders, customers, payments, products, and reviews
- Aggregate functions and GROUP BY analysis
- Conditional logic (CASE expressions) for late-delivery rate calculation
- Date functions (DATEDIFF, DATEPART, FORMAT) for delivery-time and time-series analysis

---

## Business Recommendations

### Revenue Growth

- Investigate the drop in order volume after August, starting with marketing spend, customer acquisition channels, and platform/seller activity during the period.
- Confirm whether the September decline reflects genuine business change or a data-completeness effect before acting on it.

### Customer Strategy

- Focus retention efforts on high-value customer segments.
- Expand initiatives in top-performing states such as São Paulo, while reducing over-dependence on a single region.

### Logistics Performance

- Reduce delivery times in the slowest-performing states (e.g. those with averages above 25 days).
- Monitor late deliveries, given the observed link between delivery speed and review scores.

### Sales Optimisation

- Schedule promotional campaigns around peak shopping hours (10 AM – 6 PM).
- Use observed purchasing patterns to inform timing of marketing activity.

---

## Skills Demonstrated

- SQL Querying
- Data Cleaning
- Data Modelling
- Power BI Dashboard Development
- DAX Measures
- KPI Design
- Root Cause Analysis
- Business Intelligence
- Data Storytelling
- Stakeholder Reporting

---

## Conclusion

This project demonstrates how SQL and Power BI can be combined to transform raw transactional data into actionable business insights.

The analysis identified key drivers of revenue performance, customer value, delivery efficiency, and customer satisfaction. A central finding is that the September revenue decline was driven by lower order volume rather than reduced spending per order — a distinction that changes which corrective actions make sense. Delivery speed also emerged as a factor strongly associated with customer satisfaction.

Equally, the project was deliberate about the limits of the data: where a conclusion is well supported (the volume-versus-spend distinction, the delivery-satisfaction relationship) it is stated as a finding, and where it is not (the underlying cause of the volume drop) it is flagged as a hypothesis for further investigation. The dashboard gives decision-makers a clear view of business performance to support data-driven decisions across sales, operations, and customer experience.
