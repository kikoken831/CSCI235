-- Function to display the total number of nations in a specified region
-- and list the nation details
create or replace function dispNationByRegion(regionKey REGIONTest.r_regionkey%type) 
return varchar2
is
-- Declaration of variables used in the function
numOfNation	number(5);
--regionKey	REGIONTest.r_regionkey%type;
regionName	REGIONTest.r_name%type;
nationRow	NATIONTest%rowtype;
result		varchar2(500);
begin -- Begin of function
   -- get the total number of nation in a region
   select count(*) into numOfNation
   from nationtest
   where n_regionkey = regionKey;
   --
   -- Get the region key and name
   -- regionKey := regionKey;
   select r_name into regionName
   from regiontest
   where r_regionkey = regionKey;
   -- 
   -- form the report header
   result := chr(10) || 'Region key: ' || regionKey || ' - ' || regionName || chr(10) ||
		'Number of nations: ' || numOfNation ||
		chr(10) || chr(10) || chr(9) ||
		'Nation key' || chr(9) || 'Nation name' ||
		chr(10);
   --
   -- Create implicit cursor to retrieve the list of nations in the specified region
   for QRow in (select * from nationtest
		where n_regionkey = regionKey )
   loop
	result:= result ||
		 chr(9) || rpad(QRow.n_nationkey, 10) || chr(9) || QRow.n_name || chr(10);
   end loop;
   -- return the result
   return trim(result);
end; -- End of function
/
show errors

