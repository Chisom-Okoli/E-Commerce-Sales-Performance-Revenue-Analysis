# E-Commerce-Sales-Performance-Revenue-Analysis
Analyze e-commerce sales data to uncover revenue trends, top-performing product categories, and actionable insights for business growth using SQL and Python.

## Project Overview

This project analyzes the **Brazilian E-Commerce Public Dataset by Olist** to provide actionable business insights into:
- Revenue Understanding: Identify which months and product categories generate the most revenue.
- Customer Behavior: Determine whether customers are repeat buyers or one-time purchasers, and assess the impact of customer loyalty on revenue.
- Funnel Analysis: Evaluate where customers drop off in the purchase process — from order creation to payment to delivery.
- Actionable Insights: Provide recommendations that management can use to increase revenue, improve retention, and optimize operations.

## Problem statement 
Management needs to understand where revenue is coming from, how customers behave, and where operational bottlenecks exist in the sales funnel, in order to optimize sales strategy and drive growth.
Specifically:
- Which product categories generate the most revenue, and which ones should be prioritized?
- How does revenue trend over time, and are there seasonal patterns to leverage?
- Are customers making repeat purchases, and how can loyalty be improved?
- Where in the purchase funnel (order creation → payment → delivery) are customers dropping off, and how can conversion be improved?

## Tools Used
- MySQL: Used for core data analysis, including joins across multiple tables, aggregations, filtering, and funnel calculations.
- Python: Used to validate SQL outputs, perform additional analysis, and create visualizations.
- pandas: Used for loading, cleaning, and validating SQL query results exported as CSV files.
- matplotlib: Used to visualize revenue trends, product category performance, and funnel drop-offs.

## Data Description
The dataset used in this project is the **Brazilian E-Commerce Public Dataset by Olist**.
It contains anonymized data about orders, customers, products, payments, and reviews from a Brazilian e-commerce platform.

## Sql Analysis
1. Which product categories generate the most revenue?

Monthly revenue showed a clear upward trend, indicating strong business growth. Peaks in May, November, and January suggest seasonal or promotional drivers, while dips in certain months indicate opportunities to improve sales consistency. Management should align marketing and inventory strategies with these high-performing months and explore ways to boost low-month performance.

![Monthly revenue trend](https://raw.githubusercontent.com/Chisom-Okoli/E-Commerce-Sales-Performance-Revenue-Analysis/main/Monthly%20revenue%20trend.png)


3. Which product categories generate the most revenue?

Revenue is concentrated in a few product categories, with ‘cool_stuff’ and ‘pet_shop’ accounting for the majority of sales. This highlights both a dependency risk and an opportunity to focus marketing and inventory on top-performing categories. Low-performing categories may need promotional support or strategic evaluation.
![Top 10 Categories by Revenue](https://raw.githubusercontent.com/Chisom-Okoli/E-Commerce-Sales-Performance-Revenue-Analysis/main/Top%2010%20Categories%20by%20revenue.png)


3. Are repeat customers driving most revenue?

Repeat customers contribute disproportionately to revenue, indicating loyalty drives business performance. Management should invest in retention strategies and incentivize one-time buyers to become repeat customers

4. Where are customers dropping off in the purchase funnel?
   
The order funnel shows the largest drop-off occurs at the payment stage, suggesting friction during checkout. Management should optimize payment processes and provide diverse payment methods to increase conversion.
![Funnel Metric](https://raw.githubusercontent.com/Chisom-Okoli/E-Commerce-Sales-Performance-Revenue-Analysis/main/funnel%20metric.png)


5. Are repeat customers driving most revenue? (or more generally, what is the customer retention status?
All revenue currently comes from one-time customers, indicating that the business has not yet developed repeat purchasing behavior. This presents a strategic opportunity: implementing retention programs could convert first-time buyers into loyal, repeat customers, increasing long-term revenue and customer lifetime value.



## Recommendations: 

1. Leverage Seasonal Trends:
- Align marketing campaigns and inventory with high-revenue months (May, November, January).
- Investigate low-performing months and implement strategies to smooth revenue dips (promotions, recurring campaigns).
2. Focus on High-Performing Product Categories:
- Prioritize marketing, promotions, and inventory for top revenue categories (cool_stuff and pet_shop).
-Evaluate low-performing categories for potential improvement or strategic de-prioritization.
- Explore cross-selling opportunities between high- and low-performing categories to increase overall revenue.
3. Implement Customer Retention Strategies
- Introduce loyalty programs, subscription options, or personalized incentives to convert one-time buyers into repeat customers.
- Track repeat purchase behavior to calculate customer lifetime value (LTV).
-Use follow-up campaigns or discounts to encourage first-time buyers to return.
4.Optimize Checkout & Payment Processes:
- Investigate payment failures and abandoned carts to identify friction points.
- Simplify the checkout process and provide multiple payment methods to increase conversion.
- Ensure every delivered order has a corresponding recorded payment for accurate revenue tracking.
- Continuously monitor funnel metrics to detect anomalies and operational issues early.
-  Data-Driven Decision Making:

    By implementing these recommendations, the business can maximize revenue, improve operational efficiency, and build long-term customer loyalty, transforming one-time buyers into repeat customers and strategically focusing resources on top-performing categories.































