-- Stored PL/SQL procedure that ask user to enter a nation code, use the code to extract 
-- the nation name from the relational table and display both on the monitor
--
set serveroutput on
--
create or replace procedure displayNationNameSP(nationKey in NATIONTEST.n_nationkey%type) IS
nationName 	NATIONTEST.n_name%type;
errNum		number(5);
errMess		varchar2(200);
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
       		errNum := sqlcode;
       		errMess := sqlerrm;
       		dbms_output.put_line('error code: ' || errNum || ', error message: '
				|| errMess);
end;
/
show errors
