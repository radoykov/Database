create table titanic (
	passenger_id int, 
	survived boolean,
	pclass int,
	name text,
	sex text,
	age numeric,
	sibSp int,
	parch smallint,
	ticket text,
	fare numeric,
	cabin text,
	embarked char(1)
);

--copy titanic from 'C:/Users/alexr/Desktop/Titanic-Dataset.csv' with
--(
--	format csv,
--	delimiter ',',
--	quote '"',
--	header true
--);

select * from titanic;

select pclass,
sum(case when survived then 1 else 0 end)::numeric / count(*) * 100 as survival_rate,
avg(case when survived then age else null end) as avg_age_survivors,
avg(age) as age_age_overall
from titanic
group by pclass
order by pclass;

create table passenger_classes 
(
	pclass integer check(pclass between 1 and 3),
	class_name text
);

insert into passenger_classes(pclass, class_name) values 
(1, 'Text 1'), 
(2, 'Text 2'), 
(3, 'Text 3');

select pclass,
(sum(1) filter (where survived) ::numeric/count(*) *100)::numeric(10, 2) AS survival_rate,
avg(age) filter (where survived) as avg_avg_survivors,
avg(age) as avg_age_overall ,
avg(age) filter(where survived and sex='female') as avg_female_survived
from titanic join passenger_classes using (pclass)
group by pclass;