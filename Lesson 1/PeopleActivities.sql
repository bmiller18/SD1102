SELECT 
	Persons.Person_ID,
	Persons.First_Name,
	Persons.Last_Name, 
	Persons.Email, 
	Persons.Age,
	Persons.Date_Created,
	Sports.Sport_ID,
	Sports.Name,
	Sports.Date_Created
FROM Persons INNER JOIN Sports ON
	  Persons.Sport_ID = Sports.Sport_ID
WHERE Sports.Name = 'Football';
