USE sakila;

SELECT
		first_name,
		last_name,
		email,
		address
FROM customer
JOIN address ON customer.address_id=address.address_id



SELECT 
		first_name,
		last_name,
		email,
		address
FROM customer
JOIN address ON customer.address_id=address.address_id
JOIN city ON address.city_id=city.city_id



SELECT 
		title, 
		description, 
		release_year, 
		rental_rate,
		rating,
		name
FROM film 
JOIN language ON film.language_id=language.language_id



SELECT 
		first_name, 
		last_name,
		title,
		description,
		rating
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
Join film ON film.film_id=film_actor.film_id



SELECT 
		first_name, 
		last_name, 
		amount,
		title
FROM customer 
JOIN payment ON payment.customer_id=customer.customer_id
JOIN rental ON rental.rental_id=payment.rental_id
JOIN inventory ON inventory.inventory_id=rental.inventory_id
JOIN film ON film.film_id=inventory.film_id



SELECT 
		*		
FROM customer 
WHERE customer.customer_id IN (
					  SELECT payment.customer_id
					  FROM payment
					  WHERE payment.amount > 7)



SELECT
		*
FROM film
JOIN film_actor on film_actor.film_id=film.film_id
WHERE film_actor.actor_id IN (
							  SELECT actor_id
							  FROM actor
							  WHERE actor_id IN (22,32,68)
							  )



SELECT
		*
FROM film
WHERE film.film_id IN (
					   SELECT film_id
					   FROM Inventory
					   WHERE inventory.store_id = 2);