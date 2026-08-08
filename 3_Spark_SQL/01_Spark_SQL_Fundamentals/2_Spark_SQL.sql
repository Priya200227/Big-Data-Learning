-- Databricks notebook source
select * from sparksql_cats.sparksql_schema.order_man;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### **Filerting**

-- COMMAND ----------

-- for ad-hoc analysis we are filtering only the fashion category

select * from sparksql_cats.sparksql_schema.order_man
where product_category = 'Fashion';

-- COMMAND ----------

-- MAGIC %python
-- MAGIC # If we want to write a dataframe on top of the sql  query
-- MAGIC # This is advantage of using Spark SQL - can just change from SQL to python easily
-- MAGIC
-- MAGIC df_test = spark.sql('''select * from sparksql_cats.sparksql_schema.order_man
-- MAGIC where product_category = "Fashion";''')
-- MAGIC
-- MAGIC # This is how we integrate Python with SQL

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### UPSERT - MERGE

-- COMMAND ----------

-- MAGIC %python
-- MAGIC # Update + Insert
-- MAGIC # This dataframe is the source
-- MAGIC df = spark.read.table("sparksql_cats.sparksql_schema.order_man")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC df.createOrReplaceTempView("order_source")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC spark.sql('''select * from {orders_temp}''',orders_temp = df).display()
-- MAGIC
-- MAGIC # If u want to query the data without creating the temp view on top of the df

-- COMMAND ----------

merge into sparksql_cats.sparksql_schema.order_man trg
using order_source src
on trg.order_id = src.order_id
when matched then update set *
when not matched then insert *
