# Data Warehouse/Analytics Project

I built a data warehouse in SQL Server that pulls in raw sales data, cleans it up, and transforms it into something useful for business analysis.

---
##  Data Architecture

I followed medallion architecture for the data architecture (Bronze, Silver, and Gold layers):

1. **Bronze Layer**: This is the raw data which is loaded directly from csv files(ERP and CRM sources)
2. **Silver Layer**: In this layer I cleaned and standardized the data to make it ready for analysis
3. **Gold Layer**: Holds the business-ready data modeled into a star schema required for reporting and analytics.

---
## What I Built
* ETL pipelines to extract, transform, and load data through all 3 layers
* Fact and dimension tables for analytical queries
* SQL reports that answer business questions about customer behavior, product performance, and sales trends.

---

### Tools used
- SQL Server
- CSV datasets(ERP and CRM data)

### What I learned
Working through this project gave me hands on experience with data warehouse design, writing ETL pipelines in SQL, data modeling with star schema, and turning messy raw data into clean tables to query from.
