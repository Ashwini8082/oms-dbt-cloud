{{ config(materialized='table') }}

SELECT
    OS.CustomerID,
    C.CustomerName,
    SUM(OS.OrderCount) AS TotalOrders,
    SUM(OS.Revenue) AS TotalRevenue
FROM {{ ref('orders_fact') }} AS OS
JOIN {{ ref('customers_stg') }} AS C
  ON OS.CustomerID = C.CustomerID
GROUP BY
    OS.CustomerID,
    C.CustomerName
