set serveroutput on
declare
  CustomerRow 	CUSTOMER%rowtype;
  RegionRow 	REGION%rowtype;
  NationRow	NATION%rowtype;
BEGIN
--
  for QRow in (select * from region)  -- Implicit cursor
  loop 
      RegionRow.r_regionkey := QRow.r_regionkey;
      RegionRow.r_name := QRow.r_name;
      regionRow.r_comment := QRow.r_comment;
      insert into Regiontest values (	RegionRow.r_regionkey, 
					RegionRow.r_name, 
					RegionRow.r_comment);
  end loop;
  commit;
--
  for QRow in (select * from nation)
  loop 
      NationRow.n_nationkey := QRow.n_nationkey;
      NationRow.n_name := QRow.n_name;
      NationRow.n_regionkey := QRow.n_regionkey;
      NationRow.n_comment := QRow.n_comment;
      insert into Nationtest values (	NationRow.n_nationkey, 
					NationRow.n_name,
					NationRow.n_regionkey, 
					NationRow.n_comment);
  end loop;
  commit;
--
  for QRow in (select * from customer)
  loop 
      CustomerRow.c_custkey := QRow.c_custkey;
      CustomerRow.c_name := QRow.c_name;
      CustomerRow.c_address := QRow.c_address;
      CustomerRow.c_nationkey := QRow.c_nationkey;
      CustomerRow.c_phone := QRow.c_phone;
      CustomerRow.c_acctbal := QRow.c_acctbal;
      CustomerRow.c_mktsegment := QRow.c_mktsegment;
      CustomerRow.c_comment := QRow.c_comment;
      insert into Customertest values (	CustomerRow.c_custkey, 
					CustomerRow.c_name, 
					CustomerRow.c_address,
					CustomerRow.c_nationkey,
					CustomerRow.c_phone,
					CustomerRow.c_acctbal,
					CustomerRow.c_mktsegment,
					CustomerRow.c_comment);
  end loop;
  commit;
END;
/

