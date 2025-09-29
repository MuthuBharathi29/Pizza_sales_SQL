create database project;
use project;
show tables;
select * from sales limit 10;

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


SELECT 
    DAYOFWEEK(order_date) AS day_index,
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS orders
FROM 
    sales
WHERE 
    order_date IS NOT NULL
GROUP BY 
    DAYOFWEEK(order_date), DAYNAME(order_date)
ORDER BY 
    day_index;
    
select pizza_size , count(distinct order_id) as orders from sales
group by pizza_size;

select pizza_category as pizza ,pizza_size as pizza_size , count(distinct order_id) as orders from sales
group by pizza_category, pizza_size;

select pizza_category , sum(total_price) as total_sales,sum(total_price)*100/(select sum(total_price) from sales) as per
 from sales
group by  pizza_category ;

 
 SELECT 
  MONTH(order_date) AS sales_month,
  pizza_category, 
  SUM(total_price) AS total_sales,
  ROUND(SUM(total_price) * 100 / 
        (SELECT SUM(total_price) 
         FROM sales AS s2 
         WHERE MONTH(s2.order_date) = MONTH(s1.order_date)), 2) AS percentage
FROM 
  sales AS s1
GROUP BY 
  sales_month, pizza_category
ORDER BY 
  sales_month, percentage DESC;
  
select pizza_category , count(distinct order_id) as orders from sales
group by pizza_category;  

select pizza_name, sum(total_price) as revenue from sales
group by pizza_name
order by revenue  limit 5;

select avg(quantity) from sales;

select pizza_name, sum(quantity) as quantity from sales
group by pizza_name
order by quantity desc limit 5;


select pizza_name, count(distinct order_id) as orders from sales
group by pizza_name
order by orders  desc limit 5;