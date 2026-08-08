-- Databricks notebook source
-- MAGIC %md
-- MAGIC ##Python part - Dataframe

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df = spark.read.format("csv")\
-- MAGIC     .option("header", "true")\
-- MAGIC     .option("inferSchema", "true")\
-- MAGIC     .load("/Workspace/Users/jyothipriya.sonu27@gmail.com/ecommerce_orders_large.csv")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df.display()

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # Spark SQL Basics

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Temp Views

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df.createOrReplaceTempView("orders_temp")

-- COMMAND ----------

select * from orders_temp

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Global Temp Views

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df.createOrReplaceGlobalTempView("orders_global_temp")
-- MAGIC # Not supproted by serveless compute

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # **External vs Managed Tables**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC

-- COMMAND ----------

create catalog sparksql_cats;

-- COMMAND ----------

create schema sparksql_cats.sparksql_schema;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #### Managed Table

-- COMMAND ----------

create table sparksql_cats.sparksql_schema.order_man
as 
select * from orders_temp;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC As the Free Edition Databricks is mananegdand run on AWS infrastructure - S3 bucket is used as Managed Cloud Storage. We cannot view the physical datafiles stored in the cloud.
-- MAGIC
-- MAGIC We have to connect our own Cloud with Databricks and then only we can visualize the physical datafiles stored in the cloud storage(our own cloud storage)

-- COMMAND ----------

drop table sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

undrop table sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #### External Table

-- COMMAND ----------

create table sparksql_cats.sparksql_schema.order_ext
location ""
as
select * from orders_temp;