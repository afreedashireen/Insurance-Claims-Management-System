IF DB_ID('InsuranceClaimsDB') IS NULL EXECUTE('CREATE DATABASE [InsuranceClaimsDB];');
GO

USE [InsuranceClaimsDB];
GO

IF SCHEMA_ID('dbo') IS NULL EXECUTE('CREATE SCHEMA [dbo];');
GO

CREATE  TABLE InsuranceClaimsDB.dbo.Customers ( 
	CustomerID           int      NOT NULL,
	Name                 varchar(100)      NOT NULL,
	Age                  int      NOT NULL,
	Location             varchar(255)      NOT NULL,
	CONSTRAINT pk_Customers PRIMARY KEY CLUSTERED ( CustomerID  asc ) 
 );
GO

CREATE  TABLE InsuranceClaimsDB.dbo.Policies ( 
	PolicyID             int      NOT NULL,
	CustomerID           int      NOT NULL,
	PolicyType           varchar(50)      NOT NULL,
	StartDate            date      NOT NULL,
	EndDate              date      NOT NULL,
	PremiumAmount        decimal(10,2)      NOT NULL,
	CONSTRAINT pk_Policies PRIMARY KEY CLUSTERED ( PolicyID  asc ) ,
	CONSTRAINT unq_Policies_CustomerID UNIQUE ( CustomerID  asc ) 
 );
GO

CREATE  TABLE InsuranceClaimsDB.dbo.Claims ( 
	ClaimID              int      NOT NULL,
	CustomerID           int      NULL,
	PolicyID             int      NULL,
	ClaimAmount          decimal(10,2)      NOT NULL,
	ClaimsDate           date      NOT NULL,
	[Status]             varchar(50)      NOT NULL,
	CONSTRAINT pk_Claims PRIMARY KEY CLUSTERED ( ClaimID  asc ) 
 );
GO

CREATE  TABLE InsuranceClaimsDB.dbo.Payments ( 
	PaymentID            int      NOT NULL,
	PolicyID             int      NOT NULL,
	AmountPaid           decimal(10,2)      NOT NULL,
	PaymentDate          date      NOT NULL,
	CONSTRAINT pk_Payments PRIMARY KEY CLUSTERED ( PaymentID  asc ) ,
	CONSTRAINT unq_Payments_PolicyID UNIQUE ( PolicyID  asc ) 
 );
GO

ALTER TABLE InsuranceClaimsDB.dbo.Claims ADD CONSTRAINT fk_CustomerID FOREIGN KEY ( CustomerID ) REFERENCES InsuranceClaimsDB.dbo.Customers( CustomerID );
GO

ALTER TABLE InsuranceClaimsDB.dbo.Claims ADD CONSTRAINT fk_PolicyID FOREIGN KEY ( PolicyID ) REFERENCES InsuranceClaimsDB.dbo.Policies( PolicyID );
GO

ALTER TABLE InsuranceClaimsDB.dbo.Payments ADD CONSTRAINT PolicyID FOREIGN KEY ( PolicyID ) REFERENCES InsuranceClaimsDB.dbo.Policies( PolicyID );
GO

ALTER TABLE InsuranceClaimsDB.dbo.Policies ADD CONSTRAINT CustomerID FOREIGN KEY ( CustomerID ) REFERENCES InsuranceClaimsDB.dbo.Customers( CustomerID );
GO
