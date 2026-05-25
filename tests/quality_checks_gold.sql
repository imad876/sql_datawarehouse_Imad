/*

Quality Checks

Script Purpose:
    This script runs quality checks on the gold layer to make sure the data
    is accurate and consistent. It checks for:

    - Duplicate surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
*/


-- Checking 'gold.dim_customers'..............

-- Check for duplicate customer keys

SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;


-- Checking 'gold.product_key'..............

-- Check for duplicate product keys

SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


-- Checking 'gold.fact_sales'..............

-- Check that every sale links to a valid customer and product
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  