create or replace function dispNationByRegionFEx5(regionName REGIONTEST.r_name%type) 
return varchar2
is
-- Declarion
prevRegionKey 	REGIONTEST.r_regionkey%type := -1;
numOfNation	number(5);
res		varchar2(1024) := null;
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
        res :=  chr(10) || 'Region key: ' || QRow.r_regionkey || ', ' || QRow.r_name || chr(10);
	res := res || 'Total number of nations: ' || numOfNation || chr(10) || chr(10);
	res := res || chr(9) || rpad('Nation key',12) || 'Nation name' || chr(10);
	-- End of header
	-- Reset the previous region key to the current region key
	prevRegionKey := QRow.r_regionkey;
      end if;
      --
      -- Print the nation information
      res := res || chr(9) || rpad(trim(to_char(QRow.n_nationkey)),12) || trim(QRow.n_name) || chr(10);
   end loop; -- End looping implicit cursor
   --
   return trim(res);
END;
/
show errors

