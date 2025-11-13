{{ config(materialized='table') }}

SELECT
    OrderItemID,
    OrderID,
    ProductID,
    Quantity,
    UnitPrice,
    Quantity * UnitPrice AS TotalPrice,
    Updated_at

FROM {{ source('L1_LANDING', 'orderitems') }}
