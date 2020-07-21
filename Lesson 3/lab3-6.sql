USE sakila;

SELECT
		rental_id,
		rental_date,
		inventory_id,
		customer_id,
		return_date,
		staff_id,
		last_update
FROM rental
WHERE rental_id BETWEEN 10 AND 15;

	BEGIN TRAN;
		
		DELETE
		FROM rental
		WHERE rental_id BETWEEN 10 AND 15;

	COMMIT TRAN;

SELECT
		rental_id,
		rental_date,
		inventory_id,
		customer_id,
		return_date,
		staff_id,
		last_update
FROM rental



SELECT
		
		payment_id,
		customer_id,
		staff_id,
		rental_id,
		amount,
		payment_date,
		last_update
FROM payment
WHERE payment_id BETWEEN 33 AND 59;

	BEGIN TRAN;
		
		DELETE
		FROM payment
		WHERE payment_id BETWEEN 33 AND 59;

	COMMIT TRAN;

SELECT
		
		payment_id,
		customer_id,
		staff_id,
		rental_id,
		amount,
		payment_date,
		last_update
FROM payment