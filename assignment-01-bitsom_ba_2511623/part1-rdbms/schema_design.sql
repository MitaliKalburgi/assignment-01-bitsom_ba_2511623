CREATE DATABASE assign_db;
use assign_db;
-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_city VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(100),
    sales_rep_email VARCHAR(100),
    office_address VARCHAR(150)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    sales_rep_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Details Table
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Customers
INSERT INTO customers VALUES
(1, 'Amit', 'amit@gmail.com', 'Mumbai'),
(2, 'Riya', 'riya@gmail.com', 'Delhi'),
(3, 'John', 'john@gmail.com', 'Mumbai'),
(4, 'Sara', 'sara@gmail.com', 'Pune'),
(5, 'Raj', 'raj@gmail.com', 'Mumbai');

-- Insert Products
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Phone', 'Electronics', 20000),
(103, 'Shirt', 'Clothing', 1500),
(104, 'Shoes', 'Footwear', 3000),
(105, 'Watch', 'Accessories', 2500);

-- Insert Sales Reps
INSERT INTO sales_reps VALUES
(1, 'Rahul', 'rahul@gmail.com', 'Mumbai Office'),
(2, 'Sneha', 'sneha@gmail.com', 'Delhi Office'),
(3, 'Arjun', 'arjun@gmail.com', 'Pune Office'),
(4, 'Neha', 'neha@gmail.com', 'Mumbai Office'),
(5, 'Karan', 'karan@gmail.com', 'Delhi Office');

-- Insert Orders
INSERT INTO orders VALUES
(1001, 1, 1, '2024-01-01'),
(1002, 2, 2, '2024-01-02'),
(1003, 3, 3, '2024-01-03'),
(1004, 4, 4, '2024-01-04'),
(1005, 5, 5, '2024-01-05');

-- Insert Order Details
INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1001, 101, 1),
(1002, 102, 2),
(1003, 103, 3),
(1004, 104, 1),
(1005, 105, 2);