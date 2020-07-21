USE master;
CREATE LOGIN user1 WITH PASSWORD = 'Password1';


USE World;
CREATE USER user1 FOR LOGIN user1;

GO



USE master;
CREATE LOGIN user2 WITH PASSWORD = 'Password2';


USE sakila;
CREATE USER user2 FOR LOGIN user2;

GO



USE master;
CREATE LOGIN user3 WITH PASSWORD = 'Password3';


USE World;
CREATE USER user3 FOR LOGIN user3;

GO