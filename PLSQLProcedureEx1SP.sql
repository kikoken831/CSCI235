set serveroutput on
--
create or replace procedure displayCustomerByMktSegment(marketSegment CUSTOMERTEST.c_mktsegment%type) is
prevNationKey   NATIONTEST.n_nationkey%type := -1;
begin -- Begin of procedure
  -- Create implicit cursor
  for QRow in (	select c_custkey, c_name, c_nationkey, n_name, c_mktsegment
  		from customertest, nationtest
  		where c_nationkey = n_nationkey
  		and c_mktsegment = marketSegment
  		order by c_nationkey, c_custkey)
  loop
      if prevNationKey != QRow.c_nationkey then
	dbms_output.put_line(chr(10)); -- New line
	dbms_output.put_line(trim(QRow.c_mktsegment) 
				|| ' segment for Nation key: ' 
				|| QRow.c_nationkey || ', ' 
				|| QRow.n_name);
      end if;
      --
      if QRow.c_nationkey is not null then    
      	dbms_output.put_line( chr(9) || rpad(QRow.c_custkey, 5) || chr(9) ||
					rpad(QRow.c_name, 20) );
      end if;
      prevNationKey := QRow.c_nationkey;
  end loop;
  dbms_output.put_line(null);
end; -- End of procedure
--
/
show errors


