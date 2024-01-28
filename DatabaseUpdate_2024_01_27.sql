/* Create smartclient_mst table*/
USE [smartRestaurant]
GO

/****** Object:  Table [dbo].[smartclient_mst]    Script Date: 1/7/2024 11:37:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[smartclient_mst](
	[id] [int] NOT NULL,
	[localprinter] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/* create getSmartclient store procedure*/
CREATE PROCEDURE [dbo].[getSmartclient]
	@id	int
AS

select * from smartclient_mst where id = @id


GO

/* create deleteSmartclient store procedure*/
CREATE PROCEDURE [dbo].[deleteSmartclient]
@id int,
@result int output
AS
	delete smartclient_mst where id = @id
	set @result=@@ROWCOUNT


GO

/* create insertSmartclient store procedure*/
CREATE  PROCEDURE [dbo].[insertSmartclient]
	@id int,
	@smartclientdescription nvarchar(MAX),
	@localprinter nvarchar(MAX),
	@result int output
 AS
	INSERT INTO smartclient_mst (id, localprinter, smartclientdescription)
	VALUES (@id, @localprinter, @smartclientdescription)
	
	set @result=@@IDENTITY


GO

/* create updateSmartclient store procedure*/
CREATE PROCEDURE [dbo].[updateSmartclient]
@id int,
@localprinter varchar(MAX),
@smartclientdescription varchar(MAX),
@result int output
 AS
begin
	update smartclient_mst set localprinter = @localprinter where id = @id
	update smartclient_mst set smartclientdescription = @smartclientdescription where id = @id

	set @result=@@ROWCOUNT
end


GO

/* Add a new row in description_mst to provide default value for TABLE_SEC_ID */
INSERT INTO [dbo].[description_mst]
           ([descriptionid]
           ,[descriptiontext]
           ,[descriptiontypeid]
           ,[descriptionlinkid])
     VALUES
           ('TABLE_SEC_ID'
           ,100
           ,2
           ,NULL)
GO

/* Add a sample record to smartclient_mst*/
INSERT INTO [dbo].[smartclient_mst]
           ([id]
           ,[localprinter]
           ,[smartclientdescription])
     VALUES
           (1
           ,'printer_server'
           ,'Printer at the server')
GO

