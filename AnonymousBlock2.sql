set serveroutput on
declare
nationName nation.n_name%type;
begin
  select n_name into nationName
  from nation
  where n_nationkey = '&nationKey';
  --
  dbms_output.put_line(rpad('Nation Name: ', 15) || chr(9) || nationName);
end;
/
show error;


