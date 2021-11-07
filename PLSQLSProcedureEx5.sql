create or replace procedure dispNationByRegionSPEx5(regionName REGIONTEST.r_name%type) is
-- Declarion
prevRegionKey 	REGIONTEST.r_regionkey%type := -1;
numOfNation	number(5);
BEGIN
   -- Create an implicit cursor to bring in the required data from database
   for QRow in ( select r_regionkey, r_name, n_nationkey, n_name
		 from regiontest, nationtest
		 where r_regionkey = n_regionkey
		 and r_name = upper(regionName)
		 order by r_regionkey, n_nationkey )
   -- Loop through the implicit cursor to process each row of records
   loop
      -- Check if there is a change in region
      if (prevRegionKey != QRow.r_regionkey) then
	-- Count the number of nation in a region
	select count(*) into numOfNation
	from nationtest
	where n_regionkey = QRow.r_regionkey;
	--
	-- Print header
	dbms_output.put_line( chr(10) || 'Region key: ' || QRow.r_regionkey || ', '
				      || QRow.r_name );
	dbms_output.put_line( 'Total number of nations: ' || numOfNation );
	dbms_output.put_line(chr(10)); -- Printing a blank line
	dbms_output.put_line( chr(9) || rpad('Nation key',12) || 'Nation name' );
	-- End of header
	-- Reset the previous region key to the current region key
	prevRegionKey := QRow.r_regionkey;
      end if;
      --
      -- Print the nation information
      dbms_output.put_line( chr(9) || rpad(trim(to_char(QRow.n_nationkey)),12) || QRow.n_name );
   end loop; -- End looping implicit cursor
   --
END;
/
show errors

