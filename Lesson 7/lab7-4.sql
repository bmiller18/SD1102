USE sakila;
GO

CREATE FUNCTION customer_spend (@customer_id INT ) RETURNS INT
BEGIN

	DECLARE @total_spend INT
	SELECT @total_spend = SUM(p.amount)
						FROM payment p
						WHERE customer_id = @customer_id
						
	RETURN @total_spend

END
GO

SELECT dbo.customer_spend(5);
SELECT dbo.customer_spend(8);
GO



CREATE PROCEDURE update_customer_last_name (
	@customer_id INT,
	@new_lastname VARCHAR(45)
	)
AS
BEGIN TRAN
	UPDATE customer 
	SET last_name = @new_lastname
	WHERE customer_id = @customer_id
COMMIT TRAN
GO

EXEC update_customer_lastname 8, 'Wilson';

SELECT *
FROM customer where customer_id = 8;

GO



CREATE PROCEDURE get_films_by_category 
				@category_name VARCHAR(25)
AS

SELECT 
		f.title,
		f.description,
		f.release_year,
		f.length,
		f.rental_rate,
		f.rental_duration,
		c.name
FROM film f
		JOIN film_category fc ON fc.film_id = f.film_id
		JOIN category c ON c.category_id = fc.category_id
WHERE c.name = @category_name;

GO

EXEC get_films_by_category 'Action'
GO



USE Chinook;

GO

CREATE PROCEDURE get_invoice_totals_by_customer
		@customerID INT
AS

SELECT 
		c.CustomerID
		c.FirstName,
		c.LastName,
		SUM(i.Total) 'Invoice Totals'
FROM customer c
		JOIN invoice i ON i.CustomerID = c.CustomerID
WHERE c.CustomerID = @CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName

GO

EXEC get_invoice_totals_by_customer 2;
EXEC get_invoice_totals_by_customer 26; 

GO



CREATE PROCEDURE get_tracks_by_genre
		@genre_name VARCHAR (120)
AS

SELECT
		t.name,
		t.UnitPrice,
		g.name
FROM track t
		JOIN genre g ON g.GenreID = t.GenreID
WHERE g.name = @genre_name

GO

EXEC get_tracks_by_genre 'World'
EXEC  get_tracks_by_genre 'Jazz'

GO



ALTER PROCEDURE get_tracks_by_genre
		@genre_name VARCHAR (120)
AS

SELECT
		t.name,
		t.UnitPrice,
		g.name
FROM track t
		JOIN genre g ON g.GenreID = t.GenreID
WHERE g.name = @genre_name
ORDER BY t.Name ASC

GO

EXEC get_tracks_by_genre 'World'
EXEC  get_tracks_by_genre 'Jazz'

GO



CREATE PROCEDURE get_tracks_by_artist
		@artist_name VARCHAR (120)
AS

SELECT
		t.Name,
		a.Name
FROM track t
		JOIN artist a ON a.artistID = t.trackID
WHERE a.name = @artist_name

GO

EXEC get_tracks_by_artist 'AC/DC'
EXEC get_tracks_by_artist 'Metallica'