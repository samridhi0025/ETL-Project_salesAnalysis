SELECT * FROM df_orders

----TOP 10 HIGHEST REVENUE GENERATING PRODUCTS?
SELECT TOP 10 product_id, SUM(sale_price) as total_sales
FROM df_orders
GROUP BY product_id
ORDER BY total_sales DESC


------------------------------------------------------------------------------


----fIND TOP 5 HIGHEST SELLING PRODUCTS INEACH REGION?
WITH CTE AS(
SELECT region, product_id, SUM(sale_price) as total_sales
FROM df_orders
GROUP BY region,product_id)
SELECT * FROM(
SELECT * 
, ROW_NUMBER() over (partition by region  order by total_sales DESC) as rn
FROM CTE) A
WHERE rn <=5

------------------------------------------------------------------------------

---FIND MONTH OVER MONTH GROWTH COMPARISON FOR 2022AND 2023 SALES EG: JAN-2022 VS JAN-2023?
WITH CTE AS (
SELECT  YEAR(order_date) AS sales_year, 
MONTH(order_date) AS sales_month, 
SUM(sale_price) AS total_sales
from df_orders
GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT sales_month
, SUM(CASE WHEN sales_year = 2022 then total_sales else 0 end) as sales_2022
, SUM(CASE WHEN sales_year = 2023 then total_sales else 0 end) as sales_2023
FROM CTE 
GROUP BY sales_month
order by sales_month

-------------------------------------------------------------------------------

----FOR EACH CATEGORY WHICH MONTH HAD HIGHEST SALE?
with cte as (
SELECT category, FORMAT(order_date, 'yyyyMM') as sale_year_month,
SUM(sale_price) as sales
from df_orders
group by category, FORMAT(order_date, 'yyyyMM')
)
select * from (
select * ,
ROW_NUMBER() over (partition by category order by sales desc ) as rn 
from cte
) a 
where rn = 1

--------------------------------------------------------------------------------

---Which subcategory had highest growth by profit in 2023 compare to 2022
WITH CTE AS (
SELECT sub_category, YEAR(order_date) AS sales_year, 
SUM(sale_price) AS total_sales
from df_orders
GROUP BY sub_category, YEAR(order_date)
),
cte2 as (
SELECT sub_category
, SUM(CASE WHEN sales_year = 2022 then total_sales else 0 end) as sales_2022
, SUM(CASE WHEN sales_year = 2023 then total_sales else 0 end) as sales_2023
FROM CTE 
GROUP BY sub_category
) 
select TOP 1 *
,(sales_2023 - sales_2022)*100 /sales_2022 as profit_percent
from cte2
order by (sales_2023 - sales_2022)*100 /sales_2022 DESC
----------

