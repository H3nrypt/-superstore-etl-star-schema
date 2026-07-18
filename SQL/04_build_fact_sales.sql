-- =========================================================================
-- FILE 04: BUILD FACT SALES
-- Purpose: Construct core transactional table and cast raw data types.
-- =========================================================================

USE superstore_db;

DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales (
    row_id INT NOT NULL,               
    order_id VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,          
    ship_date DATE NOT NULL,           
    ship_mode VARCHAR(50) NOT NULL,
    customer_id VARCHAR(50) NOT NULL,  
    product_id VARCHAR(50) NOT NULL,   
    postal_code VARCHAR(20) NOT NULL,  
    sales DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(4, 2) NOT NULL,
    profit DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (row_id)
);

INSERT INTO fact_sales (
    row_id, order_id, order_date, ship_date, ship_mode, 
    customer_id, product_id, postal_code, 
    sales, quantity, discount, profit
)
SELECT 
    row_id,
    order_id,
    STR_TO_DATE(order_date, '%m/%d/%Y'), 
    STR_TO_DATE(ship_date, '%m/%d/%Y'),  
    ship_mode,
    customer_id,
    product_id,
    postal_code,
    sales,
    quantity,
    discount,
    profit
FROM raw_staging;
