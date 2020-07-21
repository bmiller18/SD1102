USE LAB10;

CREATE TABLE salary (
				salary_id		INT				PRIMARY KEY IDENTITY,
				employee_num	INT				NOT NULL,
				Amount			NUMERIC(8,2)	NOT NULL,
				EffectiveDate	DATETIME		NOT NULL
				)
GO

ALTER TABLE salary
ADD CONSTRAINT fk_salary_employee_num 
FOREIGN KEY (employee_num) REFERENCES employees (employee_num);

INSERT INTO salary
		VALUES	(1, 60000.00, '11/11/2019'),
				(2, 50000.00, '11/11/2019'),
				(3, 45000.00, '11/11/2019'),
				(4, 55000.00, '11/11/2019'),
				(5, 45000.50, '11/11/2019')
GO

SELECT *
FROM salary;
GO