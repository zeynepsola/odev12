-- film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?

SELECT length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

select count(*) from film
where rental_rate =
(
select max(rental_rate) from film
);

-- film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.

select * from film
where rental_rate = (select min(rental_rate) from film)
and
replacement_cost = (select min(replacement_cost) from film);

-- payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

select *  from customer 
where customer_id = 
(
select customer_id from payment
group by customer_id order by count(*) desc
limit 1
);
