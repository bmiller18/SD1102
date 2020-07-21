USE master;
CREATE DATABASE LAB10
ON
(NAME = 'Lab10_data', FILENAME = 'C:\dbs\lab10.mdf')
LOG ON
(NAME = 'Lab10_log', FILENAME = 'C:\dbs\lab10.ldf')
GO

USE LAB10
CREATE TABLE employees (
					employee_num	INT				PRIMARY KEY IDENTITY,
					first_name		VARCHAR(30)		NOT NULL,
					lastname		VARCHAR(30)		NOT NULL,
					birth_date		DATETIME		NOT NULL,
					hire_date		DATETIME		NOT NULL,
					status_id		INT				NOT NULL,
					job_id			INT				NOT NULL,
					department_ID	INT				NOT NULL
					)

CREATE TABLE employee_status (
					status_id		INT				PRIMARY KEY IDENTITY,
					description		VARCHAR(30)		NOT NULL
					)

CREATE TABLE job (
					job_id			INT				PRIMARY KEY IDENTITY,
					title			VARCHAR(30)	NOT NULL
					)

CREATE TABLE department (
					department_id	INT				PRIMARY KEY IDENTITY,
					name			VARCHAR(30)		NOT NULL
					)

ALTER TABLE employees
ADD CONSTRAINT FK_job 
FOREIGN KEY (status_id) REFERENCES employee_status (status_id)

ALTER TABLE employees
ADD CONSTRAINT FK_job 
FOREIGN KEY (job_id) REFERENCES job (job_id)

ALTER TABLE employees
ADD CONSTRAINT FK_dept 
FOREIGN KEY (department_id) REFERENCES department (department_id)

INSERT INTO employee_status
		VALUES	('Active'),
				('No Longer Employeed'),
				('Leave of Absence')
GO

INSERT INTO job
		VALUES	('CEO'),
				('Office Worker'),
				('Receptionist'),
				('Web Admin'),
				('Accountant')
GO

INSERT INTO department
		VALUES	('Accounting/Finance'),
				('Sales'),
				('Technical'),
				('Administration')
GO

INSERT INTO employees
		VALUES	('Bob', 'Jones', '06/04/1974', '3/15/1999', 1,1,4),
				('Sarah', 'Robinson', '08/03/1983', '7/5/2011', 1,2,2),
				('Matthew', 'Little', '04/16/1985', '2/12/2017', 1,3,2),
				('Erik', 'Tanner', '03/12/1967', '7/18/2018', 1,4,3),
				('Samuel', 'Davis', '05/25/1988', '3/28/2015', 1,2,4)
GO

CREATE VIEW employee_details
AS

SELECT
		e.employee_num,
		e.first_name,
		e.lastname,
		e.birth_date,
		e.hire_date,
		es.description,
		j.title,
		d.name
FROM employees e
	JOIN employee_status es ON es.status_id = e.status_id
	JOIN job j ON j.job_id = e.job_id
	JOIN department d on d.department_id = e.department_id;
GO

SELECT *
FROM employee_details