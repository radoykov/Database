--Subquerys
--Nesting of querys
--illustrations of the uses of querys (arent used in practice)

select product_id,
(					--scalar subquery and its executed for each line which makes it innefficient
	select product_name
	from products
	where products.product_id  = t.product_id
)as sq_product_name ,
sum(quantity) as product_qty_overall--table value
from (select * from (select * from order_details where quantity > 10) as q) as t  
group by product_id 
having sum(quantity) > 1000
order by product_id;

--width clause

/*with table_name[(column_names) as (subquery)[, ...]
select 
*/


with product_table as (select * from order_details where quantity > 10),
target_table as (select * from product_table )
select product_id,
(					
	select product_name
	from products
	where products.product_id  = t.product_id
)as  sq_product_name,
sum(quantity) as product_qty_overall
from target_table as t
group by product_id 
having sum(quantity) > 1000
order by product_id;

--regex intro
--^X[a-z_][a-z0-9_]{0,31}$
