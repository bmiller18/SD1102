USE sakila;

SELECT 
	c.first_name,
	c.last_name,
	SUM(p.amount) 'Total Payments'
FROM customer c
JOIN payment p ON c.customer_id=p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY [Total Payments] DESC;


SELECT
	f.rating,
	count(f.film_id) 'Film Count'
FROM film f
GROUP BY f.rating
ORDER BY f.rating



USE world;

SELECT
	c.Continent,
	AVG(LifeExpectancy) 'Average Life Expectancy'
FROM country c
GROUP BY c.Continent
ORDER BY c.Continent ASC


SELECT
	c.name,
	COUNT(ct.ID) 'Count of Cities'
FROM country c
JOIN city ct ON c.Code = ct.CountryCode
GROUP BY c.Name
ORDER BY c.Name ASC



USE sakila;

SELECT
	f.title,
	f.length
FROM film f
WHERE f.length = (SELECT MAX(f2.length) FROM film f2)


SELECT
	f.title,
	f.length
FROM film f
WHERE f.length = (SELECT MIN(f2.length) FROM film f2)


SELECT 
	f.rating,
	AVG(f.length)
FROM film f
GROUP BY f.rating


SELECT
	f.title,
	LEN(f.title) 'Letters'
FROM film f
ORDER BY [Letters] DESC


SELECT
	LOWER(f.title)
FROM film f

BEGIN TRAN;
	UPDATE film
	SET
		film.title = LOWER(film.title)
	FROM film 
COMMIT TRAN


SELECT
	f.title
FROM film f
WHERE f.title LIKE '%bird%'


SELECT
	REPLACE(f.title, 'bird', 'dog')
FROM film f
WHERE f.title LIKE '%bird%'

BEGIN TRAN;
	UPDATE film
		SET
			title = REPLACE(title, 'bird', 'dog')
	FROM film
	WHERE title LIKE '%bird%'
COMMIT TRAN