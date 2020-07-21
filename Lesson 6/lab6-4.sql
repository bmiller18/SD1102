USE sakila;

GO

CREATE VIEW top_selling_r_rated_films
AS

SELECT TOP 10
		f.title,
		f.rating,
		SUM(p.amount) 'Rental Sales'
FROM film f
		JOIN inventory i ON i.film_id = f.film_id
		JOIN rental r ON r.inventory_id = i.inventory_id
		JOIN payment p ON p.rental_id = r.rental_id
WHERE rating = 'R'
GROUP BY f.title, f.rating
ORDER BY [Rental Sales] DESC;

GO

SELECT *
FROM top_selling_r_rated_films;

GO



ALTER VIEW top_selling_r_rated_films
AS

SELECT TOP 10
		f.title,
		f.rating,
		SUM(p.amount) 'Rental Sales',
		f.length
FROM film f
		JOIN inventory i ON i.film_id = f.film_id
		JOIN rental r ON r.inventory_id = i.inventory_id
		JOIN payment p ON p.rental_id = r.rental_id
WHERE f.rating = 'R'
GROUP BY f.title, f.rating, f.length
ORDER BY [Rental Sales] DESC;

GO

SELECT *
FROM top_selling_r_rated_films;

GO



CREATE VIEW best_selling_actors
AS

SELECT TOP 25
		a.first_name,
		a.last_name,
		SUM(p.amount) 'Rental Sales'
FROM actor a
		JOIN film_actor fa ON fa.actor_id = a.actor_id
		JOIN inventory i ON i.film_id = fa.film_id
		JOIN rental r ON r.inventory_id = i.inventory_id
		JOIN payment p ON p.rental_id = r.rental_id
GROUP BY a.first_name, a.last_name
ORDER BY [Rental Sales] DESC;

GO

SELECT *
FROM best_selling_actors;

GO



CREATE VIEW actor_dramas
AS

SELECT
		a.first_name,
		a.last_name,
		COUNT(fa.film_id) 'Total Drama'
FROM actor a
		JOIN film_actor fa ON fa.actor_id = a.actor_id
		JOIN film f ON f.film_id = fa.film_id
		JOIN film_category fc ON fc.film_id = f.film_id
		JOIN category c ON c.category_id = fc.category_id
WHERE fc.category_id = 7
GROUP BY a.first_name, a.last_name;

GO

SELECT *
FROM actor_dramas;

GO



CREATE VIEW rentals_by_actor
AS

SELECT
		a.first_name,
		a.last_name,
		COUNT(r.rental_id) 'Total Views'
FROM actor a
		JOIN film_actor fa ON fa.actor_id = a.actor_id
		JOIN film f ON f.film_id = fa.film_id
		JOIN inventory i ON i.film_id = f.film_id
		JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY a.first_name, a.last_name;

GO

SELECT *
FROM rentals_by_actor;

GO



CREATE VIEW rentals_by_film
AS

SELECT
		f.title,
		COUNT(r.inventory_id) 'Total Views'
FROM film f
		JOIN inventory i ON i.film_id = f.film_id
		JOIN rental r ON r.inventory_id = i.inventory_id
GROUP by f.title;

GO

SELECT *
FROM rentals_by_film
ORDER BY title DESC;

GO