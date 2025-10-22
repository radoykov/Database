alter table orders
  add constraint orders_customer_fk foreign key (customer_id) references customers(customer_id);

alter table order_details
  add constraint order_details_orders_fk foreign key (order_id) references orders(order_id);

alter table order_details
  add constraint order_details_products_fk foreign key (product_id) references products(product_id);

alter table products
  add constraint products_category_fk foreign key (category_id) references categories(category_id);

with t as (
select * from order_details od
join products p using (product_id)
join categories c using (category_id)
join orders o using (order_id)
join customers cu using (customer_id)
) select distinct address, customer_name from t
where substring(address from '\D*\y(\d{2})\y\D*')::integer between 10 and 99;

