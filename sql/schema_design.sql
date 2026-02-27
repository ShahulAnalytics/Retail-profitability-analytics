CREATE TABLE customers ( customer_id INT PRIMARY KEY, customer_name VARCHAR(100), city VARCHAR(100), region VARCHAR(100) );
CREATE TABLE products ( product_id INT PRIMARY KEY, product_name VARCHAR(100), category VARCHAR(100), cost_price DECIMAL(10,2), selling_price DECIMAL(10,2) );
CREATE TABLE stores ( store_id INT PRIMARY KEY, store_name VARCHAR(100), region VARCHAR(100) );
CREATE TABLE orders ( order_id INT PRIMARY KEY, order_date DATE, customer_id INT, store_id INT );
CREATE TABLE order_items ( order_id INT, product_id INT, quantity INT );
