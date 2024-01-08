How to print out the reciept/bill at the client

1. Add network printer to the client(i.e clientA)

2. Update custom DLL file

3. Add one record in descriptiontype_mst as following

	7	TABLE

4. Add two record in description_mst for secondary printer

	RCP_2_PRINTER	clientA	2	
	BIL_2_PRINTER	clientA	2	

5. Add one record in description_mst where the number represent the first table in the area 

	TABLE_SEC_ID	20

(i.e. 20 is the first table on the second floor)		

Note:
This custom dll support only 2 client printers.

How to config enable local printer when there is a printer at the second smartTouch location ( in the back near the kitchen)
1. Update database schema

Create a new table smartclient_mst

=================================================
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
	[local_printer] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
=================================================

Create a new store procedure getSmartclient

=================================================
USE [smartRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[getSmartclient]    Script Date: 1/7/2024 11:38:23 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER ON
GO

-- Batch submitted through debugger: SQLQuery4.sql|7|0|C:\Users\Colman\AppData\Local\Temp\~vsD124.sql
-- Batch submitted through debugger: SQLQuery3.sql|7|0|C:\Users\Colman\AppData\Local\Temp\~vs47F2.sql

CREATE PROCEDURE [dbo].[getSmartclient]
	@id	int
AS

select * from smartclient_mst where id = @id


GO

=================================================

Add a new row in description_mst to provide default value for TABLE_SEC_ID

=================================================
TABLE_SEC_ID, 100, 2, Null
=================================================

Add new records to smartclient_mst

=================================================
0, print_a
1, print_b
=================================================

create a local printer on the server called "local_printer"

Turn on share printer to the network on the second location

At the server, add a new network printer to point to the second printer in the back and call it printer_b

Update App.config for both at both location. Ensure the file contains
<add key="client_id" value="<client ID>">
Client ID has to match the smartclient_mst table

