/*
Business Analytics Queries

Script Purpose:
    This script contains SQL queries to analyze the gold layer data and
    derive useful business insights. These queries can be used to answer
    real business questions about customer behavior, product performance,
    and sales trends.
*/


-- 1. Total Sales by Country
SELECT 
    c.country,
    SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY c.country
ORDER BY total_sales DESC;

-- 2. Top 10 Customers by Revenue
SELECT TOP 10
    c.first_name,
    c.last_name,
    c.country,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY c.first_name, c.last_name, c.country
ORDER BY total_revenue DESC;

-- 3. Best Selling Product Categories
SELECT 
    p.category,
    p.subcategory,
    SUM(f.quantity) AS total_units_sold,
    SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY p.category, p.subcategory
ORDER BY total_sales DESC;

-- 4. Monthly Sales Trends
SELECT 
    YEAR(f.order_date) AS order_year,
    MONTH(f.order_date) AS order_month,
    SUM(f.sales_amount) AS total_sales,
    COUNT(DISTINCT f.order_number) AS total_orders
FROM gold.fact_sales f
GROUP BY YEAR(f.order_date), MONTH(f.order_date)
ORDER BY order_year, order_month;

-- 5. Top 10 Best Selling Products
SELECT TOP 10
    p.product_name,
    p.category,
    p.product_line,
    SUM(f.quantity) AS total_units_sold,
    SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY p.product_name, p.category, p.product_line
ORDER BY total_sales DESC;
