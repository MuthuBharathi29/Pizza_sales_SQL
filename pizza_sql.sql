create database project;
use project;
show tables;
select * from sales limit 100;
describe sales;
select * from sales ;

select count(*) from sales;

-- Total Revenue
select sum(total_price) as total from sales;

-- Average Order value
select sum(total_price) /Count(distinct(order_id))from sales;

-- Total pizza sold
select sum(quantity) as total_sold from sales;

-- Total orders
select count(distinct(order_id)) from sales;

-- Average pizza per sold 
select cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as total from sales;

-- Daily trend for total order
SELECT 
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS orders
FROM sales
GROUP BY DAYOFWEEK(order_date), DAYNAME(order_date)
ORDER BY DAYOFWEEK(order_date);


-- % of sales by pizza size  
select pizza_size , cast(sum(total_price) AS Decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/(Select sum(total_price) from sales) AS decimal(10,2)) as PCT 
 from sales
group by pizza_size;

-- Total orders by pizza category and pizza size
select pizza_category as pizza ,pizza_size as pizza_size , count(distinct order_id) as orders from sales
group by pizza_category, pizza_size;

-- Percentage of sales by category
select pizza_category , cast(sum(total_price) AS Decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/(Select sum(total_price) from sales) AS decimal(10,2)) as PCT 
 from sales
group by pizza_category; 

-- Monthly trend for total order 
SELECT 
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    pizza_category,
    SUM(total_price) AS total_sales,
    ROUND(
        SUM(total_price) * 100 / SUM(SUM(total_price)) OVER (PARTITION BY YEAR(order_date), MONTH(order_date)),
        2
    ) AS percentage
FROM sales
GROUP BY sales_year, sales_month, pizza_category
ORDER BY sales_year, sales_month, percentage DESC;

-- Total order by pizza category  
select pizza_category , count(distinct order_id) as orders from sales
group by pizza_category;  

-- Bottom 5 pizza by revenue
select pizza_name, sum(total_price) as revenue from sales
group by pizza_name
order by revenue  limit 5;

-- Top 5 pizza by revenue
select pizza_name, sum(total_price) as revenue from sales
group by pizza_name
order by revenue desc limit 5;
-- 
select avg(quantity) from sales;

-- Top 5 pizza by quantity
select pizza_name, sum(quantity) as quantity from sales
group by pizza_name
order by quantity desc limit 5;

-- Bottom 5 pizza by quantity
select pizza_name, sum(quantity) as quantity from sales
group by pizza_name
order by quantity limit 5;

-- Top 5 pizza by orders
select pizza_name, count(distinct order_id) as orders from sales
group by pizza_name
order by orders  desc limit 5;

-- Bottom 5 pizza by orders
select pizza_name, count(distinct order_id) as orders from sales
group by pizza_name
order by orders  limit 5;
