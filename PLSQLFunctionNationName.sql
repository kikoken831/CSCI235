-- PL/SQL function that receives as a parameter a nation code, and use the code to 
-- extract the nation name from the relational table and return the nation name as 
-- a string.
--
set serveroutput on
declare 
   nationKey 	NATIONTEST.n_nationkey%type;
   --
   function displayNationNameF(nationKey in NATIONTEST.n_nationkey%type) 
	return varchar2 
   IS
   nationName 	NATIONTEST.n_name%type;
   errorCode	number(5);
   errorMess	varchar2(200);
   begin
   	select n_name into nationName
   	from nationtest
   	where n_nationkey = nationKey;
   	--
   	return nationName;
   exception
	when no_data_found then
       		dbms_output.put_line('nationKey ' || nationKey || ' is not found!');
		return 'Error! Nation is not found!';
   	when others then
		errorCode := sqlcode;
		errorMess := sqlerrm;
       		dbms_output.put_line('Function encounters error. Error code: '||errorCode
				|| ', Error message: ' || errorMess);
		return 'Error!';
   end;
--
begin
   nationKey := &nationKey;
   dbms_output.put_line(nationKey || chr(9) || displayNationNameF(nationKey));
end;
/
show errors
