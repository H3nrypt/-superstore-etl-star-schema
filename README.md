# # US Superstore Data Engineering & Analytics Pipeline

## Project Overview
This project transforms a flat, denormalized transactional dataset (US Superstore) into a production-grade relational Star Schema using MySQL. By isolating business entities into dedicated dimension tables and implementing a dynamic date engine, this architecture optimizes analytical query execution speeds and provides structural referential integrity.

## System Architecture (Star Schema)
The database structure is designed to load seamlessly into business intelligence tools (like Power BI) with automated relationship mapping:

*   **Fact Table:** `fact_sales` (Tracks transaction metrics, sales, profit, and quantities).
*   **Dimension Tables:**
    *   `dim_customer`: Unique customer profiles and segmentations.
    *   `dim_product`: Dynamic catalog mapping items, categories, and sub-categories.
    *   `dim_date`: An enterprise-grade, continuous calendar infrastructure supporting time-intelligence analytics.

## Deployment Pipeline
To deploy the database infrastructure locally, execute the SQL scripts sequentially from the `SQL/` directory:

1.  `01_raw_staging_setup.sql`: Builds the environment and structural staging landing area.
2.  `02_build_dimensions.sql`: Extracts distinct business attributes to generate entity dimensions.
3.  `03_date_engine_setup.sql`: Compiles and executes the continuous data generation procedure (2014 - 2030).
4.  `04_build_fact_sales.sql`: Constructs the core metric matrix, executing type-casting algorithms for dates.
5.  `05_enforce_constraints.sql`: Applies physical Foreign Key constraints to bind the schema.

## Business Analytics Value
*   **Time-Intelligence Ready:** The custom calendar dimension handles standard date hierarchies natively, allowing for immediate execution of metrics like Year-Over-Year (YoY) profit growth and moving averages.
*   **Storage & Query Efficiency:** Normalizing descriptive customer and product strings drastically slims down the transactional tables, scaling database efficiency.
-superstore-etl-star-schema
End-to-end SQL data pipeline transforming flat transactional data into a production-grade Star Schema with a dynamic calendar engine in MySQL
