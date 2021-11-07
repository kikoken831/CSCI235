set serveroutput on
declare
  z number(5);
  s1 number(5);
  s2 number(5);
begin
  s1 := &s1;
  s2 := &s2;
  FINDHIGHER(s1,s2,z);
  dbms_output.put_line('Higher of '|| s1 ||' and ' || s2 || ' is '|| z);
end;
/
