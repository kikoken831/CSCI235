-- PL/SQL block that asks user to enter a nation key, and using the nation key to extract the 
-- nation's name and display both information on the monitor.
--
set serveroutput on
declare
   nationKey 	NATIONTEST.n_nationkey%type;
   nationName 	NATIONTEST.n_name%type;
   errNum	number(5);
   errMess	varchar2(200);
begin
   nationKey := &nationKey;
   select n_name into nationName
   from nationtest
   where n_nationkey = nationKey;
   --
   dbms_output.put_line(nationKey || chr(9) || nationName);
exception
   when no_data_found then 
	begin
       dbms_output.put_line('nationKey ' || nationKey || ' is not found!');
	end;
   when others then
       errNum := sqlcode;
       errMess := sqlerrm;
       dbms_output.put_line('error code: ' || errNum || ', error message: '
				|| errMess);
end;
/
show error
