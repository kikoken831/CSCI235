set serveroutput on
declare
  CustomerRow 	CUSTOMER%rowtype;
  RegionRow 	REGION%rowtype;
  NationRow	NATION%rowtype;
BEGIN
--
  for QRow in (select * from region)  -- implicit cursor
  loop 
      insert into Regiontest values (	QRow.r_regionkey,
					QRow.r_name,
					QRow.r_comment);
  end loop;
  commit;
--
  for QRow in (select * from nation)   	-- Implicit cursor
  loop 
      insert into Nationtest values (	QRow.n_nationkey, 
					QRow.n_name,
					QRow.n_regionkey, 
					QRow.n_comment);
  end loop;
  commit;
--
  for QRow in (select * from customer)	-- Implicit cursor
  loop 
      insert into Customertest values (	QRow.c_custkey, 
					QRow.c_name, 
					QRow.c_address,
					QRow.c_nationkey,
					QRow.c_phone,
					QRow.c_acctbal,
					QRow.c_mktsegment,
					QRow.c_comment);
  end loop;
  commit;
END;
/

