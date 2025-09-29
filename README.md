# Pizza_sales_SQL
## Pizza Sales Analysis

This project is a SQL-based Data Analysis of pizza sales. It explores customer orders, revenue trends, product performance, and other key insights using queries in MySQL.

📂 Project Structure

Database: project

Table: sales

Columns in sales table

order_id – Unique identifier for each order

order_date – Date of the order

pizza_name – Name of the pizza

pizza_category – Category (Classic, Supreme, etc.)

pizza_size – Size of the pizza (S, M, L, XL, XXL)

quantity – Number of pizzas ordered

total_price – Total price for the order

## Key Analysis Performed

### Basic Data Exploration

show tables;
select * from sales limit 10;
select count(*) from sales;


Sales KPIs

Total Revenue

Average Order Value (AOV)

Total Pizzas Sold

Total Orders

Average Pizzas per Order

Order Distribution

Orders by day of week

Orders by pizza size

Orders by pizza category & size

Revenue Insights

Revenue contribution by pizza category

Monthly category-wise sales percentage

Top 5 pizzas by revenue

Top 5 pizzas by quantity sold

Top 5 pizzas by orders placed

🔑 Example Queries

Total Revenue

select sum(total_price) as total from sales;


Average Order Value (AOV)

select sum(total_price) / count(distinct(order_id)) as avg_order_value 
from sales;


Orders by Day of Week

SELECT 
    DAYOFWEEK(order_date) AS day_index,
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS orders
FROM sales
WHERE order_date IS NOT NULL
GROUP BY DAYOFWEEK(order_date), DAYNAME(order_date)
ORDER BY day_index;

## Insights

🍕 Fridays and Saturdays had the highest number of orders.

🍕 Large pizzas were the most ordered size.

🍕 Classic pizzas contributed the highest share of revenue.

🍕 The top-selling pizza by revenue brought in the majority of sales.

🍕 On average, customers ordered more than 1 pizza per order.


## Tech Stack

Database: MySQL

Language: SQL

## Future Enhancements

Add visualizations (Power BI / Tableau / Python Matplotlib).

Perform time series analysis for sales forecasting.

Explore customer segmentation for better insights.
