## ETL Decisions

### Decision 1 — Handling inconsistent date formats
Problem:
The dataset contained dates in different formats such as DD-MM-YY, MM/DD/YYYY, and YYYY/MM/DD.

Solution:
All dates were standardized into the YYYY-MM-DD format before inserting into the dim_date table. This ensures consistency and allows proper grouping by month and year for analysis.

---

### Decision 2 — Handling NULL (missing) values
Problem:
Some rows had missing values in city field.

Solution:
Missing values were resolved by deriving the correct city based on the corresponding store name. This ensured consistency and eliminated NULL values, allowing proper relationships between fact and dimension tables.

---

### Decision 3 — Standardizing category values
Problem:
Category values were inconsistent (e.g., electronics, ELECTRONICS, Electronics).

Solution:
All category values were converted into a consistent format (Proper Case) such as 'Electronics', 'Clothing', and 'Grocery'. This prevents duplication in the dim_product table and ensures accurate grouping in queries.