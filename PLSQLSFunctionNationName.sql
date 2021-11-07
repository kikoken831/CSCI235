set serveroutput on
--
create or replace function displayNationNameF(nationKey in NATIONTEST.n_nationkey%type) 
	return varchar2 
IS
nationName 	NATIONTEST.n_name%type;
begin
 	select n_name into nationName
   	from nationtest
   	where n_nationkey = nationKey;
   	--
   	return trim(nationName);
   exception
	when no_data_found then
       		dbms_output.put_line('nationKey ' || nationKey || ' is not found!');
		return 'Error!';
   	when others then
       		dbms_output.put_line('System encounters other errors!');
		return 'Error!';
end;
/
show errors
--
