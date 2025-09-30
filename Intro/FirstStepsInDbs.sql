SELECT <expression_list> FROM <table_expression>;
expression_list ::=<EXPRESSION>[,<EXPRESSION]*;
table_expression ::=<table_name>; -- definition

SELECT sum(quantity),
--order_detail_id, order_id, product_id, 
--quantity + 1  AS  "New Quantity",
'No' AS nonsence
FROM order_details
WHERE quantity >= 100 AND product_id = 55;

--Using views
CREATE VIEW public.germany_customers 
as (
	select * 
	from customers
	where country = 'Germany'
)
-- SELECT 'Whatever' FROM public.germany_customers;

SELECT product_id,
(SELECT product_name FROM products WHERE product_id = order_details.product_id ) AS product_name,
sum(quantity) AS product_sum FROM order_details
GROUP BY product_id;


select *
from order_details

select *
from products