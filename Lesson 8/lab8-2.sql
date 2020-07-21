USE Chinook;
GO

CREATE TABLE Invoice_Audit (
					Invoice_audit_id	INT PRIMARY KEY IDENTITY,
					InvoiceID			INT,
					Username			VARCHAR(50),
					Date_Added			DATETIME
)
GO




CREATE TRIGGER [invoice_add]
ON Invoice
AFTER INSERT
AS

INSERT INTO Invoice_Audit (
					InvoiceID, 
					Username, 
					Date_Added
)

		SELECT
					i.InvoiceID,
					SUSER_SNAME(),
					CURRENT_TIMESTAMP

FROM inserted i;

GO

INSERT INTO Invoice (
		InvoiceID, 
		CustomerId, 
		InvoiceDate, 
		Total
)
VALUES(
		641,
		2,
		'2019-02-14 00:00:00.000',
		5.99
)

GO

SELECT *
FROM Invoice 
WHERE InvoiceId >= 641;

GO


SELECT *
FROM Invoice_Audit;

GO




ALTER TABLE Invoice_Audit
ADD		UserAction VARCHAR(20)

GO

ALTER TRIGGER [dbo].[invoice_add]
ON [dbo].[Invoice]
AFTER INSERT
AS
INSERT INTO Invoice_Audit (
				InvoiceId, 
				Username, 
				Date_Added, 
				UserAction
)

		SELECT
				i.InvoiceID,
				SUSER_SNAME(),
				CURRENT_TIMESTAMP,
				'INSERTED'
FROM inserted i;

GO

CREATE TRIGGER [dbo].[invoice_delete]
ON [dbo].[Invoice]
AFTER DELETE
AS
INSERT INTO Invoice_Audit (
					InvoiceId, 
					Username, 
					Date_Added, 
					UserAction
)

		SELECT
				d.InvoiceID,
				SUSER_SNAME(),
				CURRENT_TIMESTAMP,
				'DELETED'
FROM deleted d;

GO

DELETE 
FROM Invoice
WHERE invoiceId = 641;

GO

SELECT *
FROM Invoice_Audit

GO