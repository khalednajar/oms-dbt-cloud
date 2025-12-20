{{config(materialized='view')}}
SELECT
    CAST(orderitemid AS INTEGER)             AS orderitemid,
    CAST(orderid AS INTEGER)                 AS orderid,
    CAST(productid AS INTEGER)               AS productid,
    CAST(quantity AS INTEGER)                AS quantity,
    CAST(unitprice AS NUMBER(10,2))          AS unitprice,
    CAST(quantity AS NUMBER) * CAST(unitprice AS NUMBER(10,2)) AS totalprice,
    TO_TIMESTAMP(updated_at,'DD/MM/YYYY hh24:mi' )        AS updated_at
FROM {{ source('landing', 'orderitems') }}