USE sakila;

GO



BACKUP DATABASE sakila 
TO DISK= 'C:\SQL backups\sakila.bak'
WITH FORMAT;

-- Processed 1888 pages for database 'sakila', file 'sakila' on file 1.
-- Processed 4 pages for database 'sakila', file 'sakila_log' on file 1.
-- BACKUP DATABASE successfully processed 1892 pages in 0.086 seconds (171.846 MB/sec).

-- Completion time: 2020-06-02T11:22:33.0107758-04:00

GO



USE master;
DROP DATABASE sakila;



RESTORE DATABASE sakila
	FROM DISK = 'C:\SQL backups\sakila.bak'
	WITH RECOVERY;
-- Processed 1888 pages for database 'sakila', file 'sakila' on file 1.
-- Processed 4 pages for database 'sakila', file 'sakila_log' on file 1.
-- RESTORE DATABASE successfully processed 1892 pages in 0.068 seconds (217.335 MB/sec).

-- Completion time: 2020-06-02T11:39:37.1857219-04:00



USE sakila;

GO



SELECT *
FROM actor;

SELECT *
FROM customer;

GO