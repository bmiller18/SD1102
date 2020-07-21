USE world;

SELECT *
FROM city
WHERE CountryCode = 'BRA';

SELECT *
FROM city
WHERE name LIKE 'Spring%';

SELECT *
FROM country
WHERE IndepYear > 1900;

SELECT *
FROM countrylanguage
WHERE CountryCode = 'USA';

SELECT *
FROM city
WHERE name between 'C' and 'R';

SELECT *
FROM country
WHERE gnp < GNPold;

SELECT *
FROM country
WHERE IndepYear IS NULL;

SELECT *
FROM country
WHERE continent = 'Africa'
AND Population > 4000000;

SELECT *
FROM country
WHERE (continent = 'Africa'
OR continent = 'North America')
OR name = 'China';

SELECT *
FROM country
WHERE NOT continent = 'Asia';

SELECT *
FROM country
WHERE continent != 'Asia';