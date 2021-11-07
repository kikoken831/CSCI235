declare
-- All declaration here....
prevNationKey nationtest.n_nationkey%type := -1;
begin
   -- Create an implicit cursor
   for QRow in (select c_custkey, c_name, n_nationkey, n_name
		from customertest join nationtest
		on c_nationkey = n_nationkey
		order by n_nationkey, c_custkey )
   loop
     -- Executable
     -- Print the nation header
     if (prevNationKey != QRow.n_nationkey) then 
   	dbms_output.put_line( chr(10) ); -- new line feed
	dbms_output.put_line('Nation key: ' || trim(QRow.n_nationkey) || ' - ' || trim(QRow.n_name));
	dbms_output.put_line( chr(10) ); -- new line feed
	dbms_output.put_line( chr(9) || 'Customer key' || chr(9) || 'Customer name');
        prevNationKey := QRow.n_nationkey;
     end if;
     -- Print the customer key and name
     dbms_output.put_line(chr(9) || rpad(QRow.c_custkey,12) || chr(9) || trim(QRow.c_name) );
   end loop;
end;
/
show errors




