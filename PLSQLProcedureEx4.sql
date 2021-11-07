set serveroutput on
-- Declaration (optional)
declare
-- All declaration are done here....
regionName 	REGIONTEST.r_name%type;
--
-- declare a procedure
procedure displayNationByRegion(regionName REGIONTEST.r_name%type) is
previousRegionKey	REGIONTEST.r_regionkey%type := -1;
numberOfNation		number(5);
begin
   -- Create an implicit cursor to bring in the required data
dbms_output.put_line('for testing: '||regionName);
   for QRow in ( select r_regionkey, r_name, n_nationkey, n_name
		 from regiontest, nationtest
		 where r_regionkey = n_regionkey
                 and r_name like regionName
		 order by r_regionkey, n_nationkey )
   loop
      if (previousRegionKey != QRow.r_regionkey) then -- print report header
      	-- Report header
      	-- Get the total number of nation in a region
      	select count(*) into numberOfNation
      	from nationtest
      	where n_regionkey = QRow.r_regionkey;
      	--
      	dbms_output.put_line(chr(10) || 'Region key: ' || QRow.r_regionkey || ', ' ||
			    QRow.r_name || chr(10) );
	dbms_output.put_line('Total number of nation: ' || numberOfNation || chr(10) || chr(10) );
      	dbms_output.put_line(chr(9) || 'Nation key' || chr(9) || 'Nation name' || chr(10));
      	-- reset previous region key
      	previousRegionKey := QRow.r_regionkey;
      	-- End of report header
      end if;
      --
      -- Continue to print the nation information
      dbms_output.put_line(chr(9) || lpad(QRow.n_nationkey,10) || chr(9) || QRow.n_name || chr(10) );
   end loop;
-- Exception block (optional)
--
end; -- End of procedure
--
-- Executable block
BEGIN
   regionName := '%'||upper('&regionName')||'%';
   displayNationByRegion(regionName);
END;
/
show errors;
