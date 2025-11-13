{{ config(materialized='table') }}

SELECT
    OrderID,
    OrderDate,
    CustomerID,
    EmployeeID,
    StoreID,
    Status AS StatusCD,

    -- Derive a readable status description
    CASE
        WHEN Status = '01' THEN 'In Progress'
        WHEN Status = '02' THEN 'Completed'
        WHEN Status = '03' THEN 'Cancelled'
        ELSE NULL
    END AS StatusDesc,

    -- Derive order channel
    CASE
        WHEN StoreID = 1000 THEN 'Online'
        ELSE 'In-Store'
    END AS ORDER_CHANNEL,

    Updated_at,
    CURRENT_TIMESTAMP AS dbt_updated_at

FROM {{ source('L1_LANDING', 'orders') }}
