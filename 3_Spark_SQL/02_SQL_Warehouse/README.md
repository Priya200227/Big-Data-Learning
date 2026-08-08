# 🏢 Databricks SQL Warehouse

This section documents my learning and hands-on practice with **Databricks SQL Warehouse** using Databricks Free Edition.

---

## 📚 Concepts Covered

### 1. SQL Warehouses

- What is a Databricks SQL Warehouse?
- SQL Warehouse as compute specifically designed for SQL workloads
- SQL Warehouse types:
  - Serverless
  - Pro
  - Classic
- Photon Engine
- Predictive I/O
- Intelligent Workload Management (IWM)
- Warehouse sizing
- Autoscaling
- Cluster management

---
### 2. SQL Initialization

Hands-on practice with:

- Creating catalogs
- Creating schemas
- Creating tables
- Defining table schemas
- Inserting data
- Querying tables

**Hands-on Query:**

[`query_init`](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/queries/96730722773758?o=7474657941551817)

---

### 3. Query Parameters

- Creating dynamic SQL queries using parameters
- Parameter markers
- Using parameters for dynamic filtering
- Using parameters as identifiers
- Dynamic catalog, schema, and table references

**Hands-on Query:**

[`Query Parameters`](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/queries/96730722773759?o=7474657941551817)

---

### 4. Query Snippets

- Creating reusable SQL code snippets
- Using placeholders
- Parameterizing reusable SQL code
- Reducing repetitive SQL writing

**Hands-on Query:**

[`Query Snippet`](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/queries/96730722773760?o=7474657941551817)

---

### 5. Streaming Tables

- What are Streaming Tables?
- Incremental data processing
- `CREATE OR REFRESH STREAMING TABLE`
- Processing newly arrived data incrementally
- Delta Lake transaction log and incremental processing
- Streaming tables in medallion architecture
- Bronze → Silver → Gold flow

**Hands-on Query:**

[`Streaming Tables`](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/queries/96730722773761?o=7474657941551817)

---

### 6. Auto CDC & Slowly Changing Dimensions

- Change Data Capture (CDC)
- `AUTO CDC`
- Applying inserts, updates, and deletes
- SCD Type 2
- Maintaining historical records
- Tracking changes over time
- Sequence-based change ordering
- `APPLY AS DELETE WHEN`
- `SEQUENCE BY`
- `STORED AS SCD TYPE 2`
- `TRACK HISTORY ON`

**Hands-on Query:**

[`SCD`](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/queries/3268857870866234?o=7474657941551817)

---

### 7. Query Caching

- Query result caching
- Reusing cached results
- Reducing unnecessary computation
- Improving query performance
- Cache invalidation when underlying data changes

---

### 8. Alerts

- Creating alerts based on query results
- Scheduling queries
- Defining alert conditions
- Configuring notification destinations
- Alert conditions such as:
  - Above
  - Below
  - Equal
  - Not equal

---

## 💻 Hands-on Practice

| File / Query | Concepts Practiced |
|---|---|
| `query_init` | Catalog, schema, table creation and data insertion |
| `Query Parameters` | Parameter markers, dynamic filtering and identifiers |
| `Query Snippet` | Reusable SQL snippets and placeholders |
| `Streaming Tables` | Streaming tables and incremental processing |
| `SCD` | Auto CDC and SCD Type 2 |

---

## 🔗 Learning Resources

### SQL Warehouse

- [Databricks SQL Warehouse – Warehouse Types](https://learn.microsoft.com/en-us/azure/databricks/compute/sql-warehouse/warehouse-types)
- [Databricks SQL Warehouse – Serverless Autoscaling](https://learn.microsoft.com/en-us/azure/databricks/compute/sql-warehouse/warehouse-behavior#serverless-autoscaling)

### Query Development

- [Databricks SQL – Query Parameters](https://docs.databricks.com/aws/en/sql/user/queries/query-parameters)
- [Databricks SQL – Query Snippets](https://docs.databricks.com/aws/en/sql/user/queries/query-snippets)

### Streaming & CDC

- [Databricks – Create Streaming Table](https://learn.microsoft.com/en-us/azure/databricks/ldp/developer/ldp-sql-ref-create-streaming-table)
- [Databricks – APPLY CHANGES / Auto CDC](https://learn.microsoft.com/en-us/azure/databricks/ldp/developer/ldp-sql-ref-apply-changes-into)
- [Databricks – Create Flow](https://learn.microsoft.com/en-us/azure/databricks/ldp/developer/ldp-sql-ref-create-flow)

### Performance & Monitoring

- [Databricks SQL – Query Caching](https://docs.databricks.com/aws/en/sql/user/queries/query-caching)
- [Databricks SQL – Alerts](https://docs.databricks.com/aws/en/sql/user/alerts/)

### YouTube

- [Ansh Lamba Tutorial](https://www.youtube.com/watch?v=BHfzkuBEiwI)

---

## 🎯 Learning Goal

The goal of this section is to understand how **Databricks SQL Warehouse** provides SQL-based analytics capabilities on the Databricks platform, including:

- SQL compute
- Warehouse management
- Dynamic SQL
- Reusable SQL development
- Incremental data processing
- Change Data Capture
- Slowly Changing Dimensions
- Query caching
- SQL alerts

The focus is on understanding the concepts and gaining hands-on experience through Databricks SQL queries.
