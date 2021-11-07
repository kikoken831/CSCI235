-- procedure declaration
create or replace procedure dispCustomerByNation(marketSegment CUSTOMERTEST.c_mktsegment%type) is
-- declaration of variables within the procedure
prevNationKey nationtest.n_nationkey%type := -1;
begin
   -- Create an implicit cursor
   for QRow in (select c_custkey, c_name, n_nationkey, n_name, c_mktsegment
		from customertest join nationtest
		on c_nationkey = n_nationkey
		where c_mktsegment = marketSegment
		order by n_nationkey, c_custkey )
   loop
     -- Executable
     -- Print the nation header
     if (prevNationKey != QRow.n_nationkey) then 
   	dbms_output.put_line( chr(10) ); -- new line feed
	dbms_output.put_line(QRow.c_mktsegment || ' segment - Nation key: ' || 
				trim(QRow.n_nationkey) || ' - ' || 
				trim(QRow.n_name));
	dbms_output.put_line( chr(10) ); -- new line feed
	dbms_output.put_line( chr(9) || 'Customer key' || chr(9) || 'Customer name');
        prevNationKey := QRow.n_nationkey;
     end if;
     -- Print the customer key and name
     dbms_output.put_line(chr(9) || rpad(QRow.c_custkey,12) || chr(9) || trim(QRow.c_name) );
   end loop;
end;
-- End of procedure declaration
/
show errors




