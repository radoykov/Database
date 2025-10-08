--inner join
--left join
--right join
--full join
--self join
--cross join (multiplication of rows of 2 tables)

select * from order_details od;
select * from products p;

select od.product_id as testing, *
from order_details od
join products p on od.product_id = p.product_id; --2,155 records (inner join)

select od.product_id as testing, *
from order_details od
left outer join products p on od.product_id = p.product_id; --2,156 records (left join)
--order by od.quantity desc; 
--where p.product_name is not null; --2,155 records

select  p.product_name,  c.category_name, od.quantity,p.price
from order_details od
join products p on od.product_id = p.product_id
join categories c on p.category_id  = c.category_id;


select * from products, order_details; ----165,935 records (cross join)
