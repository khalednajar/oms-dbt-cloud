{{config(materialized='view')}}

SELECT
    CAST(orderid AS INTEGER)                 AS orderid,
    TO_DATE(orderdate,'DD/MM/YYYY' )                  AS orderdate,
    CAST(customerid AS INTEGER)              AS customerid,
    CAST(employeeid AS INTEGER)              AS employeeid,
    CAST(storeid AS INTEGER)                 AS storeid,
    status                                   AS statuscd,
    CASE
        WHEN status = '1' THEN 'In Progress'
        WHEN status = '2' THEN 'Completed'
        WHEN status = '3' THEN 'Cancelled'
        ELSE NULL
    END                                      AS statusdesc,
    CASE
        WHEN storeid = 1000 THEN 'Online'
        ELSE 'In-store'
    END                                      AS orderchannel,
    TO_TIMESTAMP(updated_at,'DD/MM/YYYY hh24:mi' )        AS updated_at,
    CURRENT_TIMESTAMP as dbt_updated_at 
FROM {{ source('landing', 'orders') }}