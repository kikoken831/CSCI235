-- PLSQL block that calls the stored procedure PLSQLProcedureNationNameSP
set serveroutput on
declare
   nationKey NATIONTest.n_nationkey%type;
   errNum		number(5);
   errMess		varchar2(200);
begin
   nationKey := &nationKey;
   DISPLAYNATIONNAMESP(nationKey);
   DISPLAYNATIONNAMESP(10);
   DISPLAYNATIONNAMESP(20);
   DISPLAYNATIONNAMESP(18);
exception
   when others then
   	errNum := sqlcode;
   	errMess := sqlerrm;
   	dbms_output.put_line('error code: ' || errNum || ', error message: '
			|| errMess);
end;
/
