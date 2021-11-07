set serveroutput on
create or replace procedure findHigher (x in number, y in number, z out number) is
begin
  if x > y then
     z:= x;
  else
     z:= y;
  end if;
  --
--  dbms_output.put_line('Print inside the procedure: ');
--  dbms_output.put_line('Higher of ' || x || ' and ' || y
--  	|| ' is ' || z || '.');
end;
--
/
show error;
