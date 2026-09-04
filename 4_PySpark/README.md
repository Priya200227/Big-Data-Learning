# PySpark

PySpark is the Python API for Apache Spark that enables distributed data processing using Python.

This section covers PySpark fundamentals, DataFrame operations, Spark execution concepts, and performance optimization.

---

## Topics Covered

### 1. PySpark Fundamentals

* SparkSession
* DataFrames
* Creating DataFrames
* Reading and writing data
* Schemas and data types
* Selecting and filtering data
* Adding and modifying columns
* Handling missing values
* Sorting and grouping
* Aggregations
* Joins
* Window functions
* SQL with PySpark
* User Defined Functions (UDFs)
* DataFrameReader and DataFrameWriter
* Parquet and other data formats

### 2. PySpark Execution & Internals

* Lazy Evaluation
* Transformations and Actions
* Jobs, Stages, and Tasks
* Partitions
* Narrow and Wide Transformations
* Shuffle
* DAG
* Spark execution model
* Catalyst Optimizer
* Adaptive Query Execution (AQE)

### 3. PySpark Optimization

Performance optimization techniques studied and implemented using PySpark:

* Partition Pruning
* Join Optimization
* Broadcast Join
* Cache and Persist
* Adaptive Query Execution (AQE)
* Dynamic Partition Pruning (DPP)
* Salting
* Broadcast Variables

For detailed notes and implementations:

**[PySpark Optimization →](./PySpark%20Optimization/README.md)**

---

## Practical Work

### PySpark

[Open PySpark Databricks Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/112537554454973?o=7474657941551817)


## Learning Environment

**Databricks Free Edition**

The practical implementations were performed using the current Databricks Free Edition environment.

Some older PySpark tutorials use Databricks Community Edition and APIs/features that are not available in the current serverless Free Edition environment.
