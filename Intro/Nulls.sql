--third tutorial -> Null traps

--select order_detail_id, quantity 
--from order_details
--order by quantity asc


select null = 3
select null = 3 and true
select null is not null -- only 'is' and 'is destinct for' comparing null will return true

select COALESCE(null, null, 'cabbage');--coalesce - get down to.. returns first meaningful argument

select case when not null < 0 then 'apple' else 'pear' end;--pear
select case when  null < 0 then 'apple' else 'pear' end;--pear
-- null -> i don't  know so it's treated as false
-- cannot compare null apart from is and destict for it returns null resolving in error !

--dates 

select current_date + 3 --nums are resolved as days

select cast('12:30 GMT' as time); -- Z or GMT-> zero hours difference

select current_time;
select current_timestamp - '2025-09-19T23:30:00';
select current_timestamp + interval 'PT3H';
--use only unicode always so to have no problems (utf8)