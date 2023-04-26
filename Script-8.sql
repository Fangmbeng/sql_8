--Question 1
select *
from customer c;


select customer_id, district
from customer c
inner join address a
on c.address_id = a.address_id
where district = 'Texas';

--Question 2
select *
from payment p;

select first_name, last_name, amount
from customer c
inner join payment p 
on c.customer_id = p.customer_id
where amount > 6.99;

--Question 3
select first_name, last_name
from customer c
where customer_id in(
	select customer_id
	from payment p2 
	group by customer_id
	having sum(amount) > 175
);

--Question 4
select *
from country;

select c.first_name , c.last_name
from customer c
inner join address a
on c.address_id = a.address_id
inner join city c2 
on a.city_id = c2.city_id
inner join country c3 
on c3.country_id = c2.country_id 
where country = 'Nepal';

--Question 5
select s.first_name, s.last_name
from staff s 
where staff_id in(
	select max(staff_id)
	from rental r 
	group by rental_id
);

--Question 6
select count(film_id), rating
from film f
group by distinct rating;

--Question 7
select first_name, last_name
from customer c
where customer_id in(
	select customer_id
	from payment p
	group by p.customer_id, amount > 6.99
	having count(amount > 6.99) = 1
);

--Question 8
select count(amount = 0.00)
from payment p 
where customer_id in(
	select customer_id 
	from rental r 
	group by rental_id 
);