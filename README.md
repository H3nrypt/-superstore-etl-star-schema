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

---

## 📊 Analytical Layer & DAX Data Model
To drive executive decision-making and measure operational efficiency in Power BI, the star schema is supplemented with a dedicated analytical layer featuring defensive, high-performance DAX calculations:

### Core Baseline Metrics
*   **Total Sales:** `SUM(fact_sales[sales])`
*   **Total Profit:** `SUM(fact_sales[profit])`
*   **Total Quantity:** `SUM(fact_sales[quantity])`

### Advanced Performance & Business Ratios
*   **Profit Margin %:** Evaluates business efficiency using defensive division to eliminate zero-denominator errors:
    ```dax
    Profit Margin % = DIVIDE([Total Profit], [Total Sales], 0)
    ```
*   **Average Order Value (AOV):** Quantifies transaction size density per individual order header:
    ```dax
    Average Order Value = DIVIDE([Total Sales], DISTINCTCOUNT(fact_sales[order_id]), 0)
    ```

### Time-Intelligence Analytics
*   **Year-Over-Year (YoY) Sales Growth %:** Leverages the `dim_date` continuous calendar relationship to dynamically compute historical performance variance:
    ```dax
    YoY Sales Growth % = 
    VAR SalesLY = CALCULATE([Total Sales], SAMEPERIODLASTYEAR(dim_date[date_key]))
    RETURN
    DIVIDE([Total Sales] - SalesLY, SalesLY, 0)
    ```

## 📈 Dashboard Architecture
The business layer is deployed across a 3-tier executive dashboard layout:
1.  **Executive KPIs:** High-level cards tracking total scale, efficiency ratios, and transaction averages.
2.  **Temporal Dynamics:** Line visual plotting monthly YoY performance trends across fiscal cycles.
3.  **Category Drivers:** Segmented matrix evaluating high-margin vs. dilutive product groupings.
