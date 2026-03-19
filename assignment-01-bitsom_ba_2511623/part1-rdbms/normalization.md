## Anomaly Analysis

### 1. Insert Anomaly

Description:
A new entity cannot be inserted without another dependent entity.

Example:
We cannot add a new sales representative (e.g., SR05) unless an order is created, because the table requires order-related fields.

Dataset Reference:
Columns involved: sales_rep_id, order_id

---

### 2. Update Anomaly

Description:
Same data is repeated in multiple rows, so updating becomes risky.

Example:
Customer "Rohan Mehta (C001)" appears in multiple rows. If we update his city in one row but miss others, it leads to inconsistent data.

Dataset Reference:
customer_id C001 appears in multiple rows with repeated customer_city.

---

### 3. Delete Anomaly

Description:
Deleting one row may remove important data permanently.

Example:
If a product appears in only one order and that row is deleted, all information about that product (price, category) is lost.

Dataset Reference:
Products with single occurrence in the dataset.


## Normalization Justification

The manager’s argument that keeping all data in a single table is simpler is incorrect. I strongly refute this position because it leads to serious data integrity and maintenance issues.

In the orders_flat dataset, customer, product, and sales representative details are repeated in multiple rows. For example, the same customer information appears in every order they place, which increases storage and creates redundancy.

If a customer changes their city or email, multiple rows must be updated. Missing even one update leads to inconsistent data. Similarly, deleting a single row may result in loss of important information such as customer or product details, which demonstrates delete anomalies.

By normalizing the data into separate tables like customers, products, orders, and sales representatives, we eliminate redundancy and improve data integrity. Each entity is stored only once, and relationships are maintained using foreign keys.

Normalization also improves scalability, reduces anomalies, and makes the database easier to maintain and query efficiently. Therefore, normalization is not over-engineering but a necessary step for building a reliable and efficient database system.