## Anomaly Analysis

### Insert Anomaly
In the orders_flat dataset, we cannot insert a new product or customer independently without creating an order. For example, adding a new product requires order_id, customer_id, and other fields, which may not exist at that time.

### Update Anomaly
Customer information such as customer_city and customer_email is repeated across multiple rows for each order. If a customer changes their city or email, all corresponding rows must be updated. Missing any row leads to inconsistent data.

### Delete Anomaly
If a row representing the only order of a customer is deleted, all information about that customer, including their name, email, and city, is lost. Similarly, product and sales representative data may also be lost.

These anomalies occur due to data redundancy and storing multiple entities in a single table.

## Normalization Justification

Keeping all data in a single table may seem simple, but it leads to redundancy and inconsistency. In the orders_flat dataset, customer, product, and sales representative details are repeated in multiple rows. For example, the same customer information appears in every order they place, which increases storage and creates risk of inconsistent updates.

If a customer changes their city or email, multiple rows must be updated. Missing even one update leads to incorrect data. Similarly, deleting a single row may result in loss of important information such as customer or product details.

By normalizing the data into separate tables like customers, products, orders, and sales representatives, we eliminate redundancy and improve data integrity. Each entity is stored only once, and relationships are maintained using foreign keys.

Normalization also improves scalability and makes the database easier to maintain. Therefore, normalization is not over-engineering but a necessary step for building a reliable and efficient database system.