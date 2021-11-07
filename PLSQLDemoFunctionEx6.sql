-- declaration
declare
-- All my block declaration here....
regionName 	REGION.r_name%type;
--
function displayNationByRegionFEx6 ( regionName REGION.r_name%type ) 
return varchar2
is
prevRegion	REGIONTest.r_regionkey%type := -1;
numberOfNation	number(5);
res 		varchar2(5000) := '';
begin
  -- All my executable operations here....
  -- Create an implicit cursor to bring in all required data from server
  for QRow in (	select r_regionkey, r_name, n_nationkey, n_name
		from region, nation
		where r_regionkey = n_regionkey
		and r_name = regionName
		order by r_regionkey,n_nationkey )
  --
  loop
    -- Check if the current region code equal previous region code. If different print header
    if (QRow.r_regionkey != prevRegion) then -- print header
      -- Calculate the total number of nation in a region
      select count(*) into numberOfNation
      from nationtest
      where n_regionkey = QRow.r_regionkey
      group by n_regionkey;
      -- 
      res := chr(10) || 'Region key: ' || QRow.r_regionkey || ', ' || QRow.r_name || chr(10);
      res := trim(res) || 'Number of nation: ' || numberOfNation || chr(10) || chr(10);
      res := trim(res) || chr(9) || 'Nation key' || chr(9) || 'Nation name' || chr(10);
      -- 
      -- reset the previous region key
      prevRegion := QRow.r_regionkey;
    end if;
    --
    res := trim(res) || chr(9) || lpad(QRow.n_nationkey,10) || chr(9) || QRow.n_name ;
    --
  end loop;
  --
  return trim(res);
end;
--
begin
  regionName := upper('&regionName');
  dbms_output.put_line(displayNationByRegionFEx6(regionName));
end;
/
show errors;

