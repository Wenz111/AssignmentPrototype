CREATE TABLE [dbo].[CustomerTable]
(
	[Id] INT NOT NULL PRIMARY KEY,
    [CusUsername]      NVARCHAR (50)    NULL,
    [CustomerPswd]       NVARCHAR (50) NULL,
	[CustomerEmail]   NVARCHAR (50) NULL,
	[CustomerGender]   NVARCHAR (50) NULL,
    [CustomerPhoneNum]   NVARCHAR (50) NULL,
    [CustomerDOB] NVARCHAR (50) NULL,
    [CustomerHouseAddress] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
