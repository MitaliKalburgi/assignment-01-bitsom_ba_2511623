-- Q1: List all customers along with the total number of orders they have placed
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM read_csv_auto('assignment-01-bitsom_ba_2511623/datasets/customers.csv') c
LEFT JOIN read_json_auto('assignment-01-bitsom_ba_2511623/datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q2: Find the top 3 customers by total order value
SELECT c.name, SUM(o.total_amount) AS total_order_value
FROM read_csv_auto('assignment-01-bitsom_ba_2511623/datasets/customers.csv') c
JOIN read_json_auto('assignment-01-bitsom_ba_2511623/datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_order_value DESC
LIMIT 3;

--- Q3: List all products purchased by customers from Bangalore
SELECT DISTINCT p.product_name
FROM read_csv_auto('assignment-01-bitsom_ba_2511623/datasets/customers.csv') c
JOIN read_json_auto('assignment-01-bitsom_ba_2511623/datasets/orders.json') o
ON c.customer_id = o.customer_id
CROSS JOIN read_parquet('assignment-01-bitsom_ba_2511623/datasets/products.parquet') p
WHERE c.city = 'Bangalore';

-- Q4: Join all three files to show: customer name, order date, product name, and quantity
SELECT c.name, o.order_date, p.product_name, o.num_items AS quantity
FROM read_csv_auto('assignment-01-bitsom_ba_2511623/datasets/customers.csv') c
JOIN read_json('assignment-01-bitsom_ba_2511623/datasets/orders.json') o
ON c.customer_id = o.customer_id
CROSS JOIN 'assignment-01-bitsom_ba_2511623/datasets/products.parquet' p;