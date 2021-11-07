-- PL/SQL procedure that ask user to enter a nation code, use the code to extract the nation name
-- from the relational table and display both on the monitor
--
set serveroutput on
declare 
   nationKey 	NATIONTEST.n_nationkey%type;
   --
   procedure displayNationName(nationKey in NATIONTEST.n_nationkey%type) IS
   nationName 	NATIONTEST.n_name%type;
   begin
   	select n_name into nationName
   	from nationtest
   	where n_nationkey = nationKey;
   	--
   	dbms_output.put_line(nationKey || chr(9) || nationName);
   exception
	when no_data_found then
       		dbms_output.put_line('nationKey ' || nationKey || ' is not found!');
   	when others then
       		dbms_output.put_line('System encounters other errors!');
   end;
--
begin
   nationKey := &nationKey;
   displayNationName(nationKey);
end;
/
show errors
