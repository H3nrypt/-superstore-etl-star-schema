-- =========================================================================
-- FILE 02: BUILD DIMENSIONS
-- Purpose: Extract unique descriptive entities and enforce primary keys.
-- =========================================================================

USE superstore_db;

-- 1. Customer Dimension
DROP TABLE IF EXISTS dim_customer;
CREATE TABLE dim_customer (
    customer_id VARCHAR(50) NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    segment VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

INSERT INTO dim_customer (customer_id, customer_name, segment)
SELECT DISTINCT customer_id, customer_name, segment 
FROM raw_staging;

-- 2. Product Dimension
DROP TABLE IF EXISTS dim_product;
CREATE TABLE dim_product (
    product_id VARCHAR(50) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    sub_category VARCHAR(50) NOT NULL,
    PRIMARY KEY (product_id)
);

INSERT INTO dim_product (product_id, product_name, category, sub_category)
SELECT DISTINCT product_id, product_name, category, sub_category 
FROM raw_staging;
