-- Databricks notebook source
-- MAGIC %md
-- MAGIC # **Delta Lake with Spark SQL**

-- COMMAND ----------

select * from sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### DML Operations

-- COMMAND ----------

update sparksql_cats.sparksql_schema.order_man
set product_category = 'GenZ Fashion'
where product_category = 'Fashion'

-- COMMAND ----------

describe sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

describe extended sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### **Data Versioning**

-- COMMAND ----------

delete from sparksql_cats.sparksql_schema.order_man
where order_id = '1001'

-- COMMAND ----------

delete from sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

describe history sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### **Time Travel**

-- COMMAND ----------

restore sparksql_cats.sparksql_schema.order_man to version as of 0

-- COMMAND ----------

select * from sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC If we don't have any table but by using the location we can perform SQL on top of Delta Lake

-- COMMAND ----------

describe history delta.`external location`