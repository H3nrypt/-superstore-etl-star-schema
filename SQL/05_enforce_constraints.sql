-- =========================================================================
-- FILE 05: ENFORCE CONSTRAINTS
-- Purpose: Apply physical Foreign Keys to build the Star Schema structure.
-- =========================================================================

USE superstore_db;

ALTER TABLE fact_sales
    ADD CONSTRAINT fk_sales_customer   FOREIGN KEY (customer_id) REFERENCES dim_customer (customer_id),
    ADD CONSTRAINT fk_sales_product    FOREIGN KEY (product_id)  REFERENCES dim_product (product_id),
    ADD CONSTRAINT fk_sales_order_date FOREIGN KEY (order_date)  REFERENCES dim_date (date_key),
    ADD CONSTRAINT fk_sales_ship_date  FOREIGN KEY (ship_date)   REFERENCES dim_date (date_key);
