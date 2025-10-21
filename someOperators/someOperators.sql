-- function-like syntax
select cast ('12345' as integer);
select cast ('2025-10-15' as date);
select cast ('12 45' as integer);

-- PostgreSQL-specific shorthand syntax (:: operator)
select '12345'::integer;
select '2025-10-15'::date;

select <expression> between <lower_limit> and <upper_limit>;
-- is equivalent to 
select <expression> >= <lower_limit> and <expression> <= <upper_limit>;
-- i.e. inclusive of the limits' values

select 5 in (1,2,3,4,5,6,7); --> true, equivalen to: 5 = 1 OR 5 = 2 OR ... OR 5 = 7
select 5 in (1,2,3,4,null);  --> poisoned, null
select 3 in (1,2,3,4,null);  --> true, the notable poison-immune exception since 3 = 3 is TRUE

select 5 in (1,2,3,4,null),
       5 not in (1,2,3,4,null); --> null, null

       -- case when <expr1> then <res1> [when <exprI> then <resI>]...[else <resE>] end
-- case <var> when <value1> then <res1> .... [else <resE>] end
-- case when <expr1> then <res1> end --> ELSE missing, yields NULL when <expr1> is FALSE

select case when 1 = 1 then 'Red' when 2 > 1 then 'Blue' else 'Green' end; --> yields 'Red'
select 'Владимир' ~* '^вла.*$'; --> yields TRUE