--CREATE [schemaname].tablename
--(
--collumname collumntype[constraints]
--[,...]
--)

 create table class_v.food_categories --craete table in schemas class_v
 (
 	id integer NOT NULL PRIMARY KEY,
 	product_name text NOT NULL CHECK(length(product_name) < 50),
 	misc json DEFAULT '{}'
 );

--create scheman --//--
--(
-- LIKE SCHEMA name TABLE name [MORE...][,coldef]
-- )
 

create table class_v.delme_a
(
	like public.products, --copies column definitions
	trash integer DEFAULT 1
); 
 
 --CREATE TABLE schname.tablename AS <query>[WITH NO DATA]
create table class_v.delme_b as select  *,
1 as trash 
from public.products
with no data;

select product_name, misc -> 'shelf_life' as shelf_life -- 'shelf_life'-> key '->'the extracter operator
from class_v.food_categories; 
-- accessing the  json

select * from class_v.delme_b;