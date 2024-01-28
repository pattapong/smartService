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


How to enable local printer

1. Run DatabaseUpdate 2024_01_27.sql

2. Create a local printer on the server called "localprinter" 
Note: The name has to be hardcoded to "local_printer" this is to trigger local printer feature in SmartService (line 158)

Turn on share printer to the network on the second location

At the server, add a new network printer to point to the second printer in the second location

Update App.config to match the id in smartclient_mst table. Ensure the file contains
<add key="client_id" value="<client ID>">
For example

Computer #1	(server)				  				Computer #2 (client)
Printer_1											
Printer_2 <-----------Network printer --------------Printer_2

smartclient_mst table
1	printer_1	server printer	at location #1
2   printer_2	network printer at location #2

App.config at location #1
<add key=client_id" value="1">

App.config at location #2
<add key=client_id" value="2">



