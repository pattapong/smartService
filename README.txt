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