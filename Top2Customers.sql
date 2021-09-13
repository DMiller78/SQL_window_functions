# Top 2 customers by total sales
with row_no
AS
(
SELECT custno,
       custtype,
       total_sales,
       row_number() over (partition by custtype order by total_sales desc) as top_customers
from cust_top
group by
custno, custtype, total_sales
order by
custno, custtype, total_sales desc
)


select
    custno, custtype, total_sales, top_customers,
    rank() over (order by total_sales desc)
    from row_no
    where top_customers <= 2
    group by
        custno, custtype, total_sales, top_customers
    order by
        custtype, total_sales desc; 


