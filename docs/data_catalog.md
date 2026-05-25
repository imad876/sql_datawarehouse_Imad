# Data Catalog for Gold Layer

## Overview
The Gold Layer is the final layer of the data warehouse. It is built for analytics and reporting, and it contains dimension tables and fact tables.

---

### 1. **gold.dim_customers**
Purpose: stores customer information including demographics and location.
Columns:

- customer_key    | INT          | A unique ID generated for each customer row
- customer_id     | INT          | The original customer ID from the source system
- customer_number | NVARCHAR(50) | An alphanumeric code used to identify the customer
- first_name      | NVARCHAR(50) | The customer's first name
- last_name       | NVARCHAR(50) | The customer's last name
- country         | NVARCHAR(50) | The country the customer lives in
- marital_status  | NVARCHAR(50) | Whether the customer is Married or Single
- gender          | NVARCHAR(50) | The customer's gender (Male, Female, or n/a)
- birthdate       | DATE         | The customer's date of birth
- create_date     | DATE         | The date the customer record was created

---

### 2. **gold.dim_products**
Purpose: Stores product information and their categories.
Columns:

- product_key          | INT          | A unique ID made for each product row
- product_id           | INT          | The original product ID from the source system
- product_number       | NVARCHAR(50) | An alphanumeric code used to identify the product
- product_name         | NVARCHAR(50) | The name of the product
- category_id          | NVARCHAR(50) | The ID of the category the product belongs to
- category             | NVARCHAR(50) | The broad category of the product (e.g. Bikes, Components)
- subcategory          | NVARCHAR(50) | A more specific classification within the category
- maintenance_required | NVARCHAR(50) | Whether the product needs maintenance (Yes or No)
- cost                 | INT          | The base price of the product
- product_line         | NVARCHAR(50) | The product line the product belongs to (e.g. Road, Mountain)
- start_date           | DATE         | The date the product became available

---

### 3. **gold.fact_sales**
Purpose: Stores all sales transactions for analysis.
Columns:

- order_number     | NVARCHAR(50) | A unique ID for each sales order
- product_key      | INT          | Links to the product dimension table
- customer_key     | INT          | Links to the customer dimension table
- order_date       | DATE         | The date the order was placed
- shipping_date    | DATE         | The date the order was shipped
- due_date         | DATE         | The date the payment was due
- sales_amount     | INT          | The total value of the sale
- quantity         | INT          | The number of units ordered
- price            | INT          | The price per unit
