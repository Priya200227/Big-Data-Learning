-- Databricks notebook source
-- MAGIC %md
-- MAGIC # **Dynamic Data Masking**

-- COMMAND ----------

select * from sparksql_cats.sparksql_schema.order_man

-- COMMAND ----------

-- MAGIC %md
-- MAGIC The user_id id the PII (Personal Identifiable Information) should not be shared with all the memebers. Hence it must be masked by create a function which will check whether the user is admin or not. If not it will mask the column.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### **Creating Mask Function**

-- COMMAND ----------

create or replace function sparksql_cats.sparksql_schema.dynamic_mask(p_user_id string)
return CASE WHEN is_account_group_member('admin') then p_user_id else '*****' end;


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### **Applying Mask Function**

-- COMMAND ----------

alter table sparksql_cats.sparksql_schema.order_man
alter column user_id set mask sparksql_cats.sparksql_schema.dynamic_mask;

-- COMMAND ----------

select * from sparksql_cats.sparksql_schema.order_man

-- I'm the metastore level admin hence I can see the column.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # **Row Level Security**

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Create a Mapping Table

-- COMMAND ----------

-- Which user should have access to which rows

create table sparksql_cats.sparksql_schema.map_table
(
    payment_category string,
    email string

)

-- COMMAND ----------

insert into sparksql_cats.sparksql_schema.map_table
values
('Credit Card', 'jyothipriya.sonu27@gmail.com'),
('Visa', 'jyothipriya.sonu27@gmail.com'),
('Master Card', 'www.jyothipriya.varra@gmail.com'),
('Paypal', 'www.jyothipriya.varra@gmail.com')

-- COMMAND ----------

select * from sparksql_cats.sparksql_schema.map_table
where email = current_user()
    and payment_category = 'Credit Card'

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Converting Mapping Table into a Boolean

-- COMMAND ----------

select exists
(
select * from sparksql_cats.sparksql_schema.map_table
where email = current_user()
    and payment_category = 'Credit Card'
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Converting into a Boolean Function

-- COMMAND ----------

-- p_ is the parameter
create or replace function sparksql_cats.sparksql_schema.rowlevel_security(p_payment_method string) 
returns boolean
language sql
return
(
    exists
    (
    select * from sparksql_cats.sparksql_schema.map_table
    where email = current_user()
    and payment_category = p_payment_method
    )
)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Applying Row Level Security to the column

-- COMMAND ----------

alter table sparksql_cats.sparksql_schema.order_man
set row filter sparksql_cats.sparksql_schema.rowlevel_security on(payment_method)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ### Testing

-- COMMAND ----------

select * from sparksql_cats.sparksql_schema.order_man