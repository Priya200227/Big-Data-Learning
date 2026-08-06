# 🐘 Hadoop

## Overview

This folder documents my learning journey of **Hadoop**, the first widely adopted Big Data framework that introduced distributed storage and distributed processing. It covers why Hadoop was created, its core components, limitations of MapReduce, and how Apache Spark addressed those limitations.

---

## Topics Covered

- Evolution of Big Data
- Monolithic vs Distributed Computing
- Horizontal Scaling vs Vertical Scaling
- Introduction to Hadoop
- Why Hadoop Was Created
- Hadoop Ecosystem (High-Level)
- Hadoop Distributed File System (HDFS)
- NameNode & DataNode
- Hadoop MapReduce
- Map Phase
- Shuffle & Sort Phase
- Reduce Phase
- How MapReduce Works
- Disk-Based Processing
- Fault Tolerance in Hadoop
- Advantages of Hadoop
- Limitations of Hadoop MapReduce
- Why Apache Spark Was Introduced
- Hadoop MapReduce vs Apache Spark

---

## Key Concepts Learned

### 📌 Evolution of Big Data

- Growth of data beyond the capacity of a single machine
- Need for distributed storage and parallel processing
- Emergence of Hadoop as the first large-scale Big Data framework

---

### 📌 Monolithic vs Distributed Computing

- Vertical Scaling
- Horizontal Scaling
- High Availability
- Fault Tolerance

---

### 📌 Hadoop

- Open-source framework for distributed storage and distributed processing
- Stores data using HDFS
- Processes data using MapReduce

---

### 📌 HDFS

- Distributed file system
- Stores data across multiple machines
- Provides replication for fault tolerance

---

### 📌 Hadoop MapReduce

- Map Phase
- Shuffle & Sort Phase
- Reduce Phase

---

### 📌 Limitations of Hadoop MapReduce

- Heavy disk I/O
- Intermediate data written to disk
- High latency
- Slow for iterative workloads
- Batch processing only
- Multiple MapReduce jobs for complex workflows

---

### 📌 Why Apache Spark?

Spark was introduced to overcome MapReduce limitations by providing:

- In-memory computation
- Faster execution
- DAG-based execution engine
- Lazy Evaluation
- Better optimization
- Unified engine for Batch, SQL, Streaming, ML, and Graph processing

---

## Hadoop vs Apache Spark

| Hadoop MapReduce | Apache Spark |
|------------------|--------------|
| Disk-based processing | In-memory processing |
| Higher latency | Low latency |
| Batch processing | Batch + Streaming |
| Fixed Map → Reduce execution | DAG-based execution |
| Slower | Faster |
| Limited optimization | Catalyst Optimizer & AQE |

---

## Tools Used

- Apache Hadoop (Concepts)
- Apache Spark (Comparison)

---

## Learning Outcome

After completing this section, I understood:

- Why Big Data frameworks were needed
- Why distributed computing became essential
- How Hadoop stores and processes large datasets
- The limitations of MapReduce
- Why Apache Spark became the modern Big Data processing engine

---

## Status

- ✅ Hadoop Fundamentals Completed
- ✅ Ready to Learn Apache Spark
