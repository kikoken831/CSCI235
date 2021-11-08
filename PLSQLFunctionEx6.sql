-- declaration
declare
-- All my block declaration here....
regionName 	REGION.r_name%type;
--
function displayNationByRegionFEx6 () 
return varchar2
is
prevRegion	REGIONTest.r_regionkey%type := -1;
res 		varchar2(2000) := '';
begin
  -- All my executable operations here....
  -- Create an implicit cursor to bring in all required data from server
  for QRow in (	select r_regionkey, r_name, n_nationkey, n_name
		from region, nation
		where r_regionkey = n_regionkey
		order by r_regionkey,n_nationkey )
  --
  loop
    -- Check if the current region code equal previous region code. If different print header
    if (QRow.r_regionkey != prevRegion) then -- print region
      -- 
      res := QRow.r_regionkey || ' ' || QRow.r_name || ': ';
      prevRegion := QRow.r_regionkey;
    end if;
    --
    res := trim(res) || chr(1) || trim(QRow.n_name) || ',';
    --
  end loop;
  --
  return trim(res);
end;
--
begin
  dbms_output.put_line(displayNationByRegionFEx6();
end;
/
show errors;

