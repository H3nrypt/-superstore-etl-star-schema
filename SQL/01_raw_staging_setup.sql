-- =========================================================================
-- FILE 01: RAW STAGING SETUP
-- Purpose: Create the environment and host the raw, unrefined CSV data.
-- =========================================================================

CREATE DATABASE IF NOT EXISTS superstore_db;
USE superstore_db;

DROP TABLE IF EXISTS raw_staging;

CREATE TABLE raw_staging (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(20), 
    ship_date VARCHAR(20),  
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(255),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2)
);

-- Note: Data is populated here via MySQL Workbench Import Wizard or LOAD DATA INFILE.
