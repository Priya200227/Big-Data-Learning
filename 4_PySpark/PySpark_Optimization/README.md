# PySpark Optimization

This section covers the major PySpark optimization techniques I studied and implemented using Databricks Free Edition.

The focus was on understanding **why Spark jobs slow down, where performance bottlenecks occur, and how Spark can reduce unnecessary computation, data movement, and memory usage. ** ****

---

## Topics Covered

### 1. Partition Pruning

Partition pruning allows Spark to read only the relevant storage partitions instead of scanning all partitions.

**Goal:**

* Reduce the amount of data read
* Reduce I/O
* Improve query performance

**Key idea:**

```text
Query Filter
     ↓
Partition Pruning
     ↓
Read only required partitions
```

Partition pruning is mainly useful when data is physically partitioned on columns that are used in filters.

---

### 2. Join Optimization

Joins can become expensive because they may require large amounts of data movement across the cluster.

I studied different join strategies and when they should be used.

Important strategies include:

* Broadcast Hash Join
* Sort Merge Join
* Shuffle Hash Join

The main objective is to **minimize unnecessary shuffle and data movement**.

Spark also supports join hints such as:

```sql
/*+ BROADCAST(table_name) */
```

Join hints allow users to suggest a particular join strategy to Spark.

---

### 3. Cache & Persist

Caching and persistence allow Spark to reuse previously computed data instead of recomputing it.

Example:

```python
df.cache()
```

or:

```python
from pyspark import StorageLevel

df.persist(StorageLevel.MEMORY_AND_DISK)
```

After the cached DataFrame is no longer required:

```python
df.unpersist()
```

### When to use

Caching is useful when:

* The same DataFrame is reused multiple times
* Recomputing an expensive transformation is costly
* The dataset is small enough to justify storing it

Caching should not be applied blindly because it consumes storage resources.

Spark SQL supports caching DataFrames/tables in an in-memory columnar format.

---

### 4. Adaptive Query Execution (AQE)

AQE allows Spark to use runtime statistics to improve the execution plan while the query is running.

Important AQE optimizations studied:

* Coalescing shuffle partitions
* Converting Sort Merge Join to Broadcast Hash Join
* Handling skewed partitions

Conceptually:

```text
Initial Query Plan
       ↓
Query Execution
       ↓
Runtime Statistics
       ↓
AQE
       ↓
Improved Execution Plan
```

AQE is enabled by default in modern Spark versions and can adapt the query plan based on runtime information.

---

### 5. Dynamic Partition Pruning (DPP)

Dynamic Partition Pruning improves join performance when one side of a join can provide runtime filter values for the other side.

Typical scenario:

```text
Filtered Dimension Table
          ↓
    Runtime Values
          ↓
Dynamic Partition Pruning
          ↓
Large Partitioned Fact Table
```

Instead of scanning every partition of a large fact table, Spark can eliminate partitions that cannot contain matching records.

DPP is particularly useful for large fact tables joined with filtered dimension tables.

---

### 6. Salting

Salting is a technique used to reduce the impact of **data skew**.

Data skew occurs when a small number of keys contain a disproportionately large amount of data.

Example:

```text
Before Salting

Key A → 10,000,000 rows
Key B →       100 rows
Key C →        50 rows
```

One partition can become much larger than the others, creating a straggler task.

With salting:

```text
Key A
 ├── Salt 0
 ├── Salt 1
 ├── Salt 2
 ├── Salt 3
 └── ...
```

The skewed key is distributed across multiple partitions, allowing more parallel processing.

For joins, the smaller side may need to be replicated across the corresponding salt values.

---

### 7. Broadcast Variables

Broadcast variables allow a read-only object to be distributed efficiently to executors instead of repeatedly shipping the same object with individual tasks.

Conceptually:

```text
             Driver
               |
        Broadcast Object
               |
       ┌───────┼───────┐
       ↓       ↓       ↓
   Executor Executor Executor
```

Broadcast variables are useful when many tasks need access to the same read-only object.

Example:

```python
broadcast_var = spark.sparkContext.broadcast(lookup_dict)
```

The Spark documentation describes broadcast variables as read-only values cached on machines so that the value does not need to be shipped repeatedly with tasks.

> Note: Databricks Free Edition/serverless has restrictions around some traditional Spark APIs, so the concept is important even when a particular RDD-based example cannot be executed in the Free Edition environment.

---

# Optimization Mental Model

When optimizing a Spark workload, I think about the problem in this order:

```text
1. How much data am I reading?
        ↓
   Partition Pruning

2. How much data am I moving?
        ↓
   Join Optimization
   Broadcast Join
   Salting

3. Am I recomputing the same data?
        ↓
   Cache / Persist

4. Is the data distribution uneven?
        ↓
   AQE / Salting

5. Can Spark use runtime information?
        ↓
   AQE / Dynamic Partition Pruning

6. Is the same read-only object needed by many tasks?
        ↓
   Broadcast Variables
```

---

# Practical Notebooks

The concepts were implemented and practiced in Databricks Free Edition.

| Topic                     | Notebook                                                                                                        |
| ------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Partition Pruning         | [Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/2250021733442787?o=7474657941551817) |
| Join Optimization         | [Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/2758355662344703?o=7474657941551817) |
| Cache & Persist           | [Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/2758355662344704?o=7474657941551817) |
| AQE                       | [Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/2758355662344705?o=7474657941551817) |
| Dynamic Partition Pruning | [Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/2758355662344707?o=7474657941551817) |
| Salting                   | [Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/3060269169367847?o=7474657941551817) |
| Broadcast Variables       | [Notebook](https://dbc-eac9dd69-52db.cloud.databricks.com/editor/notebooks/3060269169367850?o=7474657941551817) |

---

# Key Takeaways

* **Partition Pruning** → reduce unnecessary data reads.
* **Join Optimization** → reduce expensive data movement.
* **Cache/Persist** → avoid repeated computation.
* **AQE** → optimize execution using runtime statistics.
* **Dynamic Partition Pruning** → eliminate unnecessary partitions during joins.
* **Salting** → mitigate data skew.
* **Broadcast Variables** → efficiently share read-only objects across executors.

The overall goal of PySpark optimization is:

> **Process less data, move less data, compute less data, and distribute the workload more evenly.**

---

## Resources

* [Apache Spark – Performance Tuning](https://spark.apache.org/docs/latest/sql-performance-tuning.html)
* [Apache Spark – Tuning Guide](https://spark.apache.org/docs/latest/tuning.html)
* [Apache Spark – Join & Partitioning Hints](https://spark.apache.org/docs/latest/sql-ref-syntax-qry-select-hints.html)
* [Apache Spark – RDD Programming Guide](https://spark.apache.org/docs/latest/rdd-programming-guide.html)

---

## Learning Status

**Status: Completed ✅**

Topics completed:

* [x] Partition Pruning
* [x] Join Optimization
* [x] Cache & Persist
* [x] Adaptive Query Execution (AQE)
* [x] Dynamic Partition Pruning (DPP)
* [x] Salting
* [x] Broadcast Variables

