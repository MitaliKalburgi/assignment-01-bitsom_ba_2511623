USE assign_db;
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY AUTO_INCREMENT,
    full_date DATE,
    month INT,
    year INT
);

CREATE TABLE dim_store (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100),
    store_city VARCHAR(50)
);

CREATE TABLE dim_product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    revenue DECIMAL(10,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
INSERT INTO dim_store (store_name, store_city) VALUES
('Banglore MG', 'Banglore'),
('Chennai Anna', 'Chennai'),
('Mumbai Central', 'Mumbai'),
('Pune FC Road', 'Pune');

INSERT INTO dim_product (product_name, category) VALUES
('Atta 10kg', 'Grocery'),
('Jeans', 'Clothing'),
('Headphones', 'Electronics');

INSERT INTO dim_date (full_date, month, year) VALUES
('2023-07-22', 07, 2023),
('2023-01-13', 1, 2023);

SELECT * FROM dim_store;
SELECT * FROM dim_product;
SELECT * FROM dim_date;

INSERT INTO fact_sales (date_id, store_id, product_id, quantity, revenue)
VALUES
(1, 1, 1, 3, 52464),
(1, 2, 2, 5, 2317.47),
(2, 3, 3, 8, 39854.96),
(1, 2, 1, 3, 52464),
(1, 2, 1, 9, 52464),
(2, 3, 2, 16, 2317.47),
(1, 1, 3, 5, 39854.96),
(2, 3, 3, 8, 39854.96),
(1, 4, 1, 19, 31604.47),
(2, 4, 2, 9, 31604.47);