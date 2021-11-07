set serveroutput on
declare
  RegionRow REGIONTEST%rowtype;
BEGIN
  for QRow in (select * from region)
  loop 
      RegionRow.r_regionkey := QRow.r_regionkey;
      RegionRow.r_name := QRow.r_name;
      regionRow.r_comment := QRow.r_comment;
      insert into Regiontest values (RegionRow.r_regionkey, RegionRow.r_name, RegionRow.r_comment);
  end loop;
  commit;
END;
/
