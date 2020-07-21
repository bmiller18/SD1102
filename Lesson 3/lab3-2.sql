USE sakila;

SELECT
		actor_id,
		first_name,
		last_name
FROM actor
WHERE actor_id BETWEEN 1 AND 3;

BEGIN TRAN;

	UPDATE actor
	SET
		first_name = 'Julia',
		last_name = 'Roberts'
	FROM actor
	WHERE actor_id = 1;

COMMIT TRAN;

BEGIN TRAN;
	
	UPDATE actor
	SET
		first_name = 'Will',
		last_name = 'Smith'
	FROM actor
	WHERE actor_id = 2;

COMMIT TRAN;

BEGIN TRAN;

	UPDATE actor
	SET 
		first_name = 'Arnold',
		last_name = 'Schwarzenegger'
	FROM actor
	WHERE actor_id = 3;

COMMIT TRAN;

SELECT
		actor_id,
		first_name,
		last_name
FROM actor
WHERE actor_id BETWEEN 1 AND 3;

		


SELECT 
		film_id,
		title,
		rental_rate
FROM film
WHERE film_id BETWEEN 1 AND 3;

BEGIN TRAN;

	UPDATE film
	SET
		title = 'Beverly Hills Cop',
		rental_rate = '5.99'
	FROM film
	WHERE film_id = 1;

COMMIT TRAN;

BEGIN TRAN;

	UPDATE film
	SET
		title = 'Star Wars',
		rental_rate = '5.99'
	FROM film
	WHERE film_id = 2;

COMMIT TRAN;

BEGIN TRAN;
	
	UPDATE film
	SET
		title = 'The Godfather',
		rental_rate = '5.99'
	FROM film
	WHERE film_id = 3;

COMMIT TRAN;

SELECT 
		film_id,
		title,
		rental_rate
FROM film
WHERE film_id BETWEEN 1 AND 3;




SELECT
		address_id,
		postal_code
FROM address
WHERE address_id BETWEEN 1 AND 3;

BEGIN TRAN;

	UPDATE address
	SET	
		postal_code = 11111
	FROM address
	WHERE address_id = 1;

COMMIT TRAN;

BEGIN TRAN;
	
	UPDATE address
	SET
		postal_code = 12345
	FROM address
	WHERE address_id = 2;

COMMIT TRAN;

BEGIN TRAN;

	UPDATE address
	SET
		postal_code = 99999
	FROM address
	WHERE address_id = 3;

COMMIT TRAN;

SELECT
		address_id,
		postal_code
FROM address
WHERE address_id BETWEEN 1 AND 3;