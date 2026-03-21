## Storage Systems

For **Goal 1 (Predict patient readmission risk)**, **MySQL** was chosen as the primary storage system. It stores structured patient records including historical treatment data, diagnoses, and discharge information. MySQL is a reliable relational database well-suited for structured clinical data, and its wide adoption in healthcare systems makes it practical for integrating with existing EHR infrastructure. The ML Model reads from MySQL to train and run the readmission risk predictor.

For **Goal 2 (Allow doctors to query patient history in plain English)**, **Pinecone** was selected as a **vector database**. Patient records and clinical notes are converted into embeddings and stored in Pinecone, enabling semantic search. This allows the NL Engine (LLM + Vector Search) to match a doctor's natural language question - such as "Has this patient had a cardiac event?" - against relevant records even when the exact terminology differs. Pinecone sits in the OLTP zone as it serves low-latency, real-time query responses.

For **Goal 3 (Generate monthly management reports)**, **DuckDB** was chosen as the data warehouse on the OLAP side. Hospital operations data covering bed occupancy and department-wise costs flows into DuckDB. It's column storage format is optimised for analytical aggregations, making it well-suited for the **Report Engine (Tableau)** to generate monthly summaries efficiently for hospital management.

For **Goal 4 (Stream and store real-time ICU vitals)**, **MongoDB** was selected. As a document-oriented NoSQL database, MongoDB handles high-frequency, semi-structured data from ICU monitoring devices effectively. It stores incoming vitals streams and feeds the ICU Monitor component, which performs threshold checks and triggers alerts for nursing staff when readings fall outside safe ranges.

## OLTP vs OLAP Boundary

The OLTP boundary encompasses **MySQL, Pinecone, and MongoDB.** These three systems handle live, operational workloads — writing incoming patient records, responding to real-time doctor queries, and ingesting continuous ICU vitals streams. Transactions here are frequent, row-level, and latency-sensitive; the system must respond quickly to support active clinical use.

The OLAP boundary begins at **DuckDB**. Hospital operations data is loaded into DuckDB in batch, where it is structured for analytical queries rather than transactional updates. The Report Engine reads from DuckDB to run aggregations across departments and time periods - a workload that would be too slow and disruptive to run directly against the operational databases. This separation ensures live clinical systems remain unaffected by heavy reporting queries.

## Trade-offs

The most significant trade-off is using **MongoDB for ICU vitals storage**. While MongoDB handles semi-structured, high-volume data well, it is not purpose-built for time-series data. ICU monitoring devices generate thousands of timestamped readings per minute, and query performance for time-range operations and downsampling can degrade at scale compared to a dedicated time-series database.

To mitigate this, TTL (Time-To-Live) indexes in MongoDB can be configured to automatically expire stale vitals data, keeping the collection lean and queries fast. If performance becomes a bottleneck as the hospital network grows, the design could be evolved to introduce a dedicated time-series store such as InfluxDB, with MongoDB retained for richer patient event documents and InfluxDB handling raw sensor streams exclusively.

This design balances flexibility, performance, and scalability across different workloads.
