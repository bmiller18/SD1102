USE sakila;

SELECT
		actor_id,
		first_name,
		last_name,
		last_update
FROM actor;

	BEGIN TRAN;
		
		INSERT INTO actor
		(
			first_name,
			last_name,
			last_update
		)
		VALUES
		(
			'Jack',
			'Nicholson',
			CURRENT_TIMESTAMP
		)

	COMMIT TRAN;

	BEGIN TRAN;

		INSERT INTO actor
		(
			first_name,
			last_name,
			last_update
		)
		VALUES
		(
			'Heath',
			'Ledger',
			CURRENT_TIMESTAMP
		)

	COMMIT TRAN;

	BEGIN TRAN;

		INSERT INTO actor
		(
			first_name,
			last_name,
			last_update
		)
		VALUES
		(
			'Joaquin',
			'Phoenix',
			CURRENT_TIMESTAMP
		)

	COMMIT TRAN;

	SELECT
		actor_id,
		first_name,
		last_name,
		last_update
	FROM actor;



SELECT
		
		address_id,
		address,
		address2,
		district,
		city_id,
		postal_code,
		phone,
		last_update
FROM address;

	BEGIN TRAN;
		
		INSERT INTO address
		(
			address,
			address2,
			district,
			city_id,
			postal_code,
			phone,
			last_update
		)
		VALUES
		(
			'111 Main Street',
			'Apt 12',
			'My District',
			1,
			12345,
			111-123-1234,
			CURRENT_TIMESTAMP
		)

	COMMIT TRAN;

	BEGIN TRAN;

		INSERT INTO address
		(
			address,
			address2,
			district,
			city_id,
			postal_code,
			phone,
			last_update
		)
		VALUES
		(
			'123 Sunset Blvd',
			'Apt 150',
			'My District',
			2,
			12345,
			222-222-2222,
			CURRENT_TIMESTAMP
		)

	COMMIT TRAN;

SELECT
		
		address_id,
		address,
		address2,
		district,
		city_id,
		postal_code,
		phone,
		last_update
FROM address;



SELECT 
		customer_id,
		store_id,
		first_name,
		last_name,
		email,
		address_id,
		active,
		create_date,
		last_update
FROM customer;

	BEGIN TRAN;
		
		INSERT INTO customer
		(
			store_id,
			first_name,
			last_name,
			email,
			address_id,
			active,
			create_date,
			last_update
		)
		VALUES
		(	
			1,
			'Walter',
			'White',
			'ww@bb.com',
			1,
			1,
			CURRENT_TIMESTAMP,
			CURRENT_TIMESTAMP
		)

	COMMIT TRAN;

	BEGIN TRAN;
		
		INSERT INTO customer
		(
			store_id,
			first_name,
			last_name,
			email,
			address_id,
			active,
			create_date,
			last_update
		)
		VALUES
		(
			1,
			'Jessie',
			'Pinkman',
			'jp@bb.com',
			1,
			1,
			CURRENT_TIMESTAMP,
			CURRENT_TIMESTAMP
		)

	COMMIT TRAN;

	SELECT 
		customer_id,
		store_id,
		first_name,
		last_name,
		email,
		address_id,
		active,
		create_date,
		last_update
	FROM customer;