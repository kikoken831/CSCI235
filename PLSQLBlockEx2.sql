set serveroutput on
declare
-- Declaration of variables that are needed
prevNationkey	NATIONTEST.n_nationkey%type := -1;
begin
-- Executable statements here....
-- Create an implicit cursor to retrieve records from customertest table
   for QRow in ( select c_custkey, c_name, n_nationkey, n_name, c_mktsegment
		 from customertest, nationtest
		 where c_nationkey = n_nationkey
		 and c_mktsegment in ('HOUSEHOLD','BUILDING','FURNITURE','AUTOMOBILE')
		 order by n_nationkey, c_custkey) -- Implicit cursor
   loop
	if (QRow.n_nationkey != prevNationkey) then
	   dbms_output.put_line( chr(10)); -- print a new line
	   dbms_output.put_line('Nation key: ' || QRow.n_nationkey ||
				' - ' || trim(QRow.n_name) );
	   dbms_output.put_line( chr(10)) ; -- print a new line
	   dbms_output.put_line( chr(9) || rpad('Customer Key',12) || chr(9) || 'Customer Name');
	   prevNationKey := QRow.n_nationkey;
	end if;
	--
	if (QRow.c_custkey is not null) then
	   dbms_output.put_line( chr(9) || rpad(QRow.c_custkey,12) || chr(9) || trim(QRow.c_name) );
	end if;
   end loop;
   dbms_output.put_line(null);
-- Exception handling

end;
/
show errors
