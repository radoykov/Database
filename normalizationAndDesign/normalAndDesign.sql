create view recipe_v as (
  select 
    ri.quantity as ingredient_quantity,
    ri.notes as ingredient_notes,
    dr.name as dish_name,
    dr.instructions as dish_instructions,
    dr.notes as dish_notes,
    i.name as ingredient_name,
    c.name as category_name,
    co.name as color_name,
    co.color_attribute as color_attribute,
    t.name as taste_name,
    inte.name as intensity_name,
    u.name as unit_name
  from recipe_ingredient ri 
  join dish_recipe dr on dr.id = ri.dish_id
  join ingredient i on i.id = ri.ingredient_id
  join category c on i.category_id = c.id 
  join color co on i.color_id = co.id 
  join taste t on i.taste_id = t.id
  join intensity inte on i.intensity_id = inte.id
  join unit u on i.unit_id = u.id
);
select * from recipe_v rv ;