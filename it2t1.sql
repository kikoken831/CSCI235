SPOOL IT2Task1.txt
SET ECHO ON 
SET FEEDBACK ON 
SET LINESIZE 100 
SET PAGESIZE 200 
SET SERVEROUTPUT ON

declare
--declare block
prevRegion REGIONTest.r_regionkey%type := -1;

begin
--execution block
for QRow in (select r_regionkey, r_name, listagg(n_name)
from region, nation
where r_regionkey = n_regionkey
order by r_regionkey,n_nationkey)

loop
if (Qrow.r_regionkey != prevRegion) then 
	dbms_output.put_line(QRow.r_regionkey || ' ' || QRow.r_name || ': ');
	for IRow in (select n_name from region, nation where r_regionkey = n_regionkey)
	loop
	dbms_output.put_line(IRow
	end loop;
	prevRegion := Qrow.r_regionkey;
end if;
end loop;

--exception block
end;
/
SPOOL OFF;

