{{config(materialized='view')}}
select
    CAST(customerid AS INTEGER) as customerid     ,
    firstname      ,
    lastname       ,
    email           ,
    phone           ,
    address         ,
    city            ,
    state           ,
    zipcode        ,
    TO_TIMESTAMP(updated_at,'DD/MM/YYYY hh24:mi' )        AS updated_at,
    concat(firstname,' ', lastname) as customername   
 from {{source("landing","customers")}}


