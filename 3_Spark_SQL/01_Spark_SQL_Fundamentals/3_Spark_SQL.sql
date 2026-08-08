-- Databricks notebook source
-- MAGIC %md
-- MAGIC ## Functions

-- COMMAND ----------

-- MAGIC %md
-- MAGIC These UDF's are killed if we close the session.
-- MAGIC But with the latest advancement in Databricks, we can now use the following to keep the UDF's alive - by regesitering it under Unit Catalog
-- MAGIC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## User Defined Scalar Functions (UDF) 
-- MAGIC

-- COMMAND ----------

CREATE OR REPLACE FUNCTION sparksql_cats.sparksql_schema.discount_price(p_price DECIMAL (10,2))
returns DECIMAL (10,2)
LANGUAGE SQL 
RETURN p_price * 0.90

-- COMMAND ----------

select price_per_unit, 
    sparksql_cats.sparksql_schema.discount_price(price_per_unit) 
from  sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## User Defined Table Functions (UDTF)

-- COMMAND ----------

create or Replace function sparksql_cats.sparksql_schema.discount_price(p_category string)
returns table
language sql
return
(select * from sparksql_cats.sparksql_schema.order_man 
where product_category = p_category)

-- COMMAND ----------

select * from sparksql_cats.sparksql_schema.discount_price('Home Decor')